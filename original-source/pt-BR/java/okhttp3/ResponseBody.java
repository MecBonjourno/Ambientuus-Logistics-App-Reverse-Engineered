package okhttp3;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import javax.annotation.Nullable;
import okhttp3.internal.Util;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;

/* carregado de: classes17.dex */
public abstract class ResponseBody implements Closeable {

    @Nullable
    private Reader reader;

    public abstract long contentLength();

    @Nullable
    public abstract MediaType contentType();

    public abstract BufferedSource source();

    public final InputStream byteStream() {
        return source().inputStream();
    }

    public final byte[] bytes() throws IOException {
        long contentLength = contentLength();
        if (contentLength > 2147483647L) {
            throw new IOException("Cannot buffer entire body for content length: " + contentLength);
        }
        BufferedSource source = source();
        try {
            byte[] bytes = source.readByteArray();
            if (source != null) {
                $closeResource(null, source);
            }
            if (contentLength != -1 && contentLength != bytes.length) {
                throw new IOException("Content-Length (" + contentLength + ") and stream length (" + bytes.length + ") disagree");
            }
            return bytes;
        } finally {
        }
    }

    private static /* sintético */ void $closeResource(Throwable x0, AutoCloseable x1) {
        if (x0 == null) {
            x1.close();
            return;
        }
        try {
            x1.close();
        } catch (Throwable th) {
            x0.addSuppressed(th);
        }
    }

    public final Reader charStream() {
        Reader r = this.reader;
        if (r != null) {
            return r;
        }
        BomAwareReader bomAwareReader = new BomAwareReader(source(), charset());
        this.reader = bomAwareReader;
        return bomAwareReader;
    }

    public final String string() throws IOException {
        BufferedSource source = source();
        try {
            Charset charset = Util.bomAwareCharset(source, charset());
            String readString = source.readString(charset);
            if (source != null) {
                $closeResource(null, source);
            }
            return readString;
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                if (source != null) {
                    $closeResource(th, source);
                }
                throw th2;
            }
        }
    }

    private Charset charset() {
        MediaType contentType = contentType();
        Charset charset = StandardCharsets.UTF_8;
        return contentType != null ? contentType.charset(charset) : charset;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        Util.closeQuietly(source());
    }

    public static ResponseBody create(@Nullable MediaType contentType, String content) {
        Charset charset = StandardCharsets.UTF_8;
        if (contentType != null && (charset = contentType.charset()) == null) {
            charset = StandardCharsets.UTF_8;
            contentType = MediaType.parse(contentType + "; charset=utf-8");
        }
        Buffer buffer = new Buffer().writeString(content, charset);
        return create(contentType, buffer.size(), buffer);
    }

    public static ResponseBody create(@Nullable MediaType contentType, byte[] content) {
        Buffer buffer = new Buffer().write(content);
        return create(contentType, content.length, buffer);
    }

    public static ResponseBody create(@Nullable MediaType contentType, ByteString content) {
        Buffer buffer = new Buffer().write(content);
        return create(contentType, content.size(), buffer);
    }

    public static ResponseBody create(@Nullable final MediaType contentType, final long contentLength, final BufferedSource content) {
        if (content == null) {
            throw new NullPointerException("source == null");
        }
        return new ResponseBody() { // da classe: okhttp3.ResponseBody.1
            @Override // okhttp3.ResponseBody
            @Nullable
            public MediaType contentType() {
                return MediaType.this;
            }

            @Override // okhttp3.ResponseBody
            public long contentLength() {
                return contentLength;
            }

            @Override // okhttp3.ResponseBody
            public BufferedSource source() {
                return content;
            }
        };
    }

    static final class BomAwareReader extends Reader {
        private final Charset charset;
        private boolean closed;

        @Nullable
        private Reader delegate;
        private final BufferedSource source;

        BomAwareReader(BufferedSource source, Charset charset) {
            this.source = source;
            this.charset = charset;
        }

        @Override // java.io.Reader
        public int read(char[] cbuf, int off, int len) throws IOException {
            if (this.closed) {
                throw new IOException("Stream closed");
            }
            Reader delegate = this.delegate;
            if (delegate == null) {
                Charset charset = Util.bomAwareCharset(this.source, this.charset);
                InputStreamReader inputStreamReader = new InputStreamReader(this.source.inputStream(), charset);
                this.delegate = inputStreamReader;
                delegate = inputStreamReader;
            }
            return delegate.read(cbuf, off, len);
        }

        @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.closed = true;
            if (this.delegate != null) {
                this.delegate.close();
            } else {
                this.source.close();
            }
        }
    }
}
