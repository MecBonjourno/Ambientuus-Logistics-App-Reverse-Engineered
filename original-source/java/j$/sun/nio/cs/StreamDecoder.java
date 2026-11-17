package j$.sun.nio.cs;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.ReadableByteChannel;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.IllegalCharsetNameException;

/* loaded from: classes15.dex */
public class StreamDecoder extends Reader {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int DEFAULT_BYTE_BUFFER_SIZE = 8192;
    private static final int MIN_BYTE_BUFFER_SIZE = 32;
    private static volatile boolean channelsAvailable = true;
    private ByteBuffer bb;
    private ReadableByteChannel ch;
    private volatile boolean closed;
    private Charset cs;
    private CharsetDecoder decoder;
    private boolean haveLeftoverChar;
    private InputStream in;
    private char leftoverChar;

    private void ensureOpen() {
        if (this.closed) {
            throw new IOException("Stream closed");
        }
    }

    public static StreamDecoder forInputStreamReader(InputStream in, Object lock, String charsetName) {
        String csn = charsetName;
        if (csn == null) {
            csn = Charset.defaultCharset().name();
        }
        try {
            if (Charset.isSupported(csn)) {
                return new StreamDecoder(in, lock, Charset.forName(csn));
            }
        } catch (IllegalCharsetNameException e) {
        }
        throw new UnsupportedEncodingException(csn);
    }

    public static StreamDecoder forInputStreamReader(InputStream in, Object lock, Charset cs) {
        return new StreamDecoder(in, lock, cs);
    }

    public static StreamDecoder forInputStreamReader(InputStream in, Object lock, CharsetDecoder dec) {
        return new StreamDecoder(in, lock, dec);
    }

    public static StreamDecoder forDecoder(ReadableByteChannel ch, CharsetDecoder dec, int minBufferCap) {
        return new StreamDecoder(ch, dec, minBufferCap);
    }

    public String getEncoding() {
        if (isOpen()) {
            return encodingName();
        }
        return null;
    }

    @Override // java.io.Reader
    public int read() {
        return read0();
    }

    private int read0() {
        synchronized (this.lock) {
            if (this.haveLeftoverChar) {
                this.haveLeftoverChar = false;
                return this.leftoverChar;
            }
            char[] cb = new char[2];
            int n = read(cb, 0, 2);
            switch (n) {
                case -1:
                    return -1;
                case 0:
                default:
                    return -1;
                case 1:
                    break;
                case 2:
                    this.leftoverChar = cb[1];
                    this.haveLeftoverChar = true;
                    break;
            }
            return cb[0];
        }
    }

    @Override // java.io.Reader
    public int read(char[] cbuf, int offset, int length) {
        int off = offset;
        int len = length;
        synchronized (this.lock) {
            ensureOpen();
            if (off < 0 || off > cbuf.length || len < 0 || off + len > cbuf.length || off + len < 0) {
                throw new IndexOutOfBoundsException();
            }
            if (len == 0) {
                return 0;
            }
            int n = 0;
            if (this.haveLeftoverChar) {
                cbuf[off] = this.leftoverChar;
                off++;
                len--;
                this.haveLeftoverChar = false;
                n = 1;
                if (len == 0 || !implReady()) {
                    return 1;
                }
            }
            if (len == 1) {
                int c = read0();
                int i = -1;
                if (c == -1) {
                    if (n != 0) {
                        i = n;
                    }
                    return i;
                }
                cbuf[off] = (char) c;
                return n + 1;
            }
            return implRead(cbuf, off, off + len) + n;
        }
    }

    @Override // java.io.Reader
    public boolean ready() {
        boolean z;
        synchronized (this.lock) {
            ensureOpen();
            z = this.haveLeftoverChar || implReady();
        }
        return z;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
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

    private static FileChannel getChannel(FileInputStream in) {
        if (!channelsAvailable) {
            return null;
        }
        try {
            return in.getChannel();
        } catch (UnsatisfiedLinkError e) {
            channelsAvailable = false;
            return null;
        }
    }

    StreamDecoder(InputStream in, Object lock, Charset cs) {
        this(in, lock, cs.newDecoder().onMalformedInput(CodingErrorAction.REPLACE).onUnmappableCharacter(CodingErrorAction.REPLACE));
    }

    StreamDecoder(InputStream in, Object lock, CharsetDecoder dec) {
        super(lock);
        this.haveLeftoverChar = false;
        this.cs = dec.charset();
        this.decoder = dec;
        if (this.ch == null) {
            this.in = in;
            this.ch = null;
            this.bb = ByteBuffer.allocate(8192);
        }
    }

    StreamDecoder(ReadableByteChannel ch, CharsetDecoder dec, int mbc) {
        int i;
        this.haveLeftoverChar = false;
        this.in = null;
        this.ch = ch;
        this.decoder = dec;
        this.cs = dec.charset();
        if (mbc < 0) {
            i = 8192;
        } else {
            i = 32;
            if (mbc >= 32) {
                i = mbc;
            }
        }
        this.bb = ByteBuffer.allocate(i);
    }

    private int readBytes() {
        this.bb.compact();
        try {
            if (this.ch != null) {
                int n = this.ch.read(this.bb);
                if (n < 0) {
                    return n;
                }
            } else {
                int lim = this.bb.limit();
                int pos = this.bb.position();
                int rem = pos <= lim ? lim - pos : 0;
                int n2 = this.in.read(this.bb.array(), this.bb.arrayOffset() + pos, rem);
                if (n2 < 0) {
                    return n2;
                }
                if (n2 == 0) {
                    throw new IOException("Underlying input stream returned zero bytes");
                }
            }
            int rem2 = this.bb.remaining();
            return rem2;
        } finally {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x005c, code lost:
    
        r5.decoder.reset();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    int implRead(char[] r6, int r7, int r8) {
        /*
            r5 = this;
            int r0 = r8 - r7
            java.nio.CharBuffer r0 = java.nio.CharBuffer.wrap(r6, r7, r0)
            int r1 = r0.position()
            if (r1 == 0) goto L11
            java.nio.CharBuffer r0 = r0.slice()
        L11:
            r1 = 0
        L12:
            java.nio.charset.CharsetDecoder r2 = r5.decoder
            java.nio.ByteBuffer r3 = r5.bb
            java.nio.charset.CoderResult r2 = r2.decode(r3, r0, r1)
            boolean r3 = r2.isUnderflow()
            if (r3 == 0) goto L53
            if (r1 == 0) goto L23
            goto L5a
        L23:
            boolean r3 = r0.hasRemaining()
            if (r3 != 0) goto L2a
            goto L5a
        L2a:
            int r3 = r0.position()
            if (r3 <= 0) goto L37
            boolean r3 = r5.inReady()
            if (r3 != 0) goto L37
            goto L5a
        L37:
            int r3 = r5.readBytes()
            if (r3 >= 0) goto L12
            r1 = 1
            int r4 = r0.position()
            if (r4 != 0) goto L4d
            java.nio.ByteBuffer r4 = r5.bb
            boolean r4 = r4.hasRemaining()
            if (r4 != 0) goto L4d
            goto L5a
        L4d:
            java.nio.charset.CharsetDecoder r4 = r5.decoder
            r4.reset()
            goto L12
        L53:
            boolean r3 = r2.isOverflow()
            if (r3 == 0) goto L71
        L5a:
            if (r1 == 0) goto L61
            java.nio.charset.CharsetDecoder r2 = r5.decoder
            r2.reset()
        L61:
            int r2 = r0.position()
            if (r2 != 0) goto L6c
            if (r1 == 0) goto L6b
            r2 = -1
            return r2
        L6b:
        L6c:
            int r2 = r0.position()
            return r2
        L71:
            r2.throwException()
            goto L12
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.sun.nio.cs.StreamDecoder.implRead(char[], int, int):int");
    }

    String encodingName() {
        if (this.cs instanceof HistoricallyNamedCharset) {
            return ((HistoricallyNamedCharset) this.cs).historicalName();
        }
        return this.cs.name();
    }

    private boolean inReady() {
        try {
            if (this.in == null || this.in.available() <= 0) {
                if (!(this.ch instanceof FileChannel)) {
                    return false;
                }
            }
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    boolean implReady() {
        return this.bb.hasRemaining() || inReady();
    }

    void implClose() {
        if (this.ch != null) {
            this.ch.close();
        } else {
            this.in.close();
        }
    }
}
