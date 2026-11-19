package j$.sun.nio.cs;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.channels.WritableByteChannel;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.IllegalCharsetNameException;

/* carregado de: classes15.dex */
public class StreamEncoder extends Writer {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static final int DEFAULT_BYTE_BUFFER_SIZE = 8192;
    private ByteBuffer bb;
    private WritableByteChannel ch;
    private volatile boolean closed;
    private Charset cs;
    private CharsetEncoder encoder;
    private boolean haveLeftoverChar;
    private CharBuffer lcb;
    private char leftoverChar;
    private final OutputStream out;

    private void ensureOpen() {
        if (this.closed) {
            throw new IOException("Stream closed");
        }
    }

    public static StreamEncoder forOutputStreamWriter(OutputStream out, Object lock, String charsetName) {
        String csn = charsetName;
        if (csn == null) {
            csn = Charset.defaultCharset().name();
        }
        try {
            if (Charset.isSupported(csn)) {
                return new StreamEncoder(out, lock, Charset.forName(csn));
            }
        } catch (IllegalCharsetNameException e) {
        }
        throw new UnsupportedEncodingException(csn);
    }

    public static StreamEncoder forOutputStreamWriter(OutputStream out, Object lock, Charset cs) {
        return new StreamEncoder(out, lock, cs);
    }

    public static StreamEncoder forOutputStreamWriter(OutputStream out, Object lock, CharsetEncoder enc) {
        return new StreamEncoder(out, lock, enc);
    }

    public static StreamEncoder forEncoder(WritableByteChannel ch, CharsetEncoder enc, int minBufferCap) {
        return new StreamEncoder(ch, enc, minBufferCap);
    }

    public String getEncoding() {
        if (isOpen()) {
            return encodingName();
        }
        return null;
    }

    public void flushBuffer() {
        synchronized (this.lock) {
            if (isOpen()) {
                implFlushBuffer();
            } else {
                throw new IOException("Stream closed");
            }
        }
    }

    @Override // java.io.Writer
    public void write(int c) {
        char[] cbuf = {(char) c};
        write(cbuf, 0, 1);
    }

    @Override // java.io.Writer
    public void write(char[] cbuf, int off, int len) {
        synchronized (this.lock) {
            ensureOpen();
            if (off < 0 || off > cbuf.length || len < 0 || off + len > cbuf.length || off + len < 0) {
                throw new IndexOutOfBoundsException();
            }
            if (len == 0) {
                return;
            }
            implWrite(cbuf, off, len);
        }
    }

    @Override // java.io.Writer
    public void write(String str, int off, int len) {
        if (len < 0) {
            throw new IndexOutOfBoundsException();
        }
        char[] cbuf = new char[len];
        str.getChars(off, off + len, cbuf, 0);
        write(cbuf, 0, len);
    }

    public void write(CharBuffer cb) {
        int position = cb.position();
        try {
            synchronized (this.lock) {
                ensureOpen();
                implWrite(cb);
            }
        } finally {
        }
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() {
        synchronized (this.lock) {
            ensureOpen();
            implFlush();
        }
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        synchronized (this.lock) {
            if (this.closed) {
                return;
            }
            implClose();
            this.closed = true;
        }
    }

    private boolean isOpen() {
        return !this.closed;
    }

    private StreamEncoder(OutputStream out, Object lock, Charset cs) {
        this(out, lock, cs.newEncoder().onMalformedInput(CodingErrorAction.REPLACE).onUnmappableCharacter(CodingErrorAction.REPLACE));
    }

    private StreamEncoder(OutputStream out, Object lock, CharsetEncoder enc) {
        super(lock);
        this.haveLeftoverChar = false;
        this.lcb = null;
        this.out = out;
        this.ch = null;
        this.cs = enc.charset();
        this.encoder = enc;
        if (this.ch == null) {
            this.bb = ByteBuffer.allocate(8192);
        }
    }

    private StreamEncoder(WritableByteChannel ch, CharsetEncoder enc, int mbc) {
        int i;
        this.haveLeftoverChar = false;
        this.lcb = null;
        this.out = null;
        this.ch = ch;
        this.cs = enc.charset();
        this.encoder = enc;
        if (mbc < 0) {
            i = 8192;
        } else {
            i = mbc;
        }
        this.bb = ByteBuffer.allocate(i);
    }

    private void writeBytes() {
        int lim = this.bb.limit();
        int pos = this.bb.position();
        int rem = pos <= lim ? lim - pos : 0;
        if (rem > 0) {
            if (this.ch != null) {
                if (this.ch.write(this.bb) != rem) {
                }
            } else {
                this.out.write(this.bb.array(), this.bb.arrayOffset() + pos, rem);
            }
        }
    }

    private void flushLeftoverChar(CharBuffer cb, boolean endOfInput) {
        if (!this.haveLeftoverChar && !endOfInput) {
            return;
        }
        if (this.lcb == null) {
            this.lcb = CharBuffer.allocate(2);
        }
        if (this.haveLeftoverChar) {
            this.lcb.put(this.leftoverChar);
        }
        if (cb != null && cb.hasRemaining()) {
            this.lcb.put(cb.get());
        }
        while (true) {
            if (!this.lcb.hasRemaining() && !endOfInput) {
                break;
            }
            CoderResult cr = this.encoder.encode(this.lcb, this.bb, endOfInput);
            if (cr.isUnderflow()) {
                if (!this.lcb.hasRemaining()) {
                    break;
                }
                this.leftoverChar = this.lcb.get();
                if (cb != null && cb.hasRemaining()) {
                } else {
                    return;
                }
            } else if (cr.isOverflow()) {
                writeBytes();
            } else {
                cr.throwException();
            }
        }
        this.haveLeftoverChar = false;
    }

    void implWrite(char[] cbuf, int off, int len) {
        CharBuffer cb = CharBuffer.wrap(cbuf, off, len);
        implWrite(cb);
    }

    void implWrite(CharBuffer cb) {
        if (this.haveLeftoverChar) {
            flushLeftoverChar(cb, false);
        }
        while (cb.hasRemaining()) {
            CoderResult cr = this.encoder.encode(cb, this.bb, false);
            if (cr.isUnderflow()) {
                if (cb.remaining() == 1) {
                    this.haveLeftoverChar = true;
                    this.leftoverChar = cb.get();
                    return;
                }
                return;
            }
            if (cr.isOverflow()) {
                writeBytes();
            } else {
                cr.throwException();
            }
        }
    }

    void implFlushBuffer() {
        if (this.bb.position() > 0) {
            writeBytes();
        }
    }

    void implFlush() {
        implFlushBuffer();
        if (this.out != null) {
            this.out.flush();
        }
    }

    void implClose() {
        flushLeftoverChar(null, true);
        while (true) {
            try {
                CoderResult cr = this.encoder.flush(this.bb);
                if (cr.isUnderflow()) {
                    break;
                } else if (cr.isOverflow()) {
                    writeBytes();
                } else {
                    cr.throwException();
                }
            } catch (IOException x) {
                this.encoder.reset();
                throw x;
            }
        }
        if (this.bb.position() > 0) {
            writeBytes();
        }
        if (this.ch != null) {
            this.ch.close();
        } else {
            this.out.close();
        }
    }

    String encodingName() {
        if (this.cs instanceof HistoricallyNamedCharset) {
            return ((HistoricallyNamedCharset) this.cs).historicalName();
        }
        return this.cs.name();
    }
}
