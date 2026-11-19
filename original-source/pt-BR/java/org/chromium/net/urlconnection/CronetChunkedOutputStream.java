package org.chromium.net.urlconnection;

import java.io.IOException;
import java.net.HttpRetryException;
import java.nio.ByteBuffer;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UploadDataSink;

/* carregado de: classes17.dex */
final class CronetChunkedOutputStream extends CronetOutputStream {
    private final ByteBuffer mBuffer;
    private final CronetHttpURLConnection mConnection;
    private boolean mLastChunk;
    private final MessageLoop mMessageLoop;
    private final UploadDataProvider mUploadDataProvider = new UploadDataProviderImpl();

    CronetChunkedOutputStream(CronetHttpURLConnection connection, int chunkLength, MessageLoop messageLoop) {
        if (connection == null) {
            throw new NullPointerException();
        }
        if (chunkLength <= 0) {
            throw new IllegalArgumentException("chunkLength should be greater than 0");
        }
        this.mBuffer = ByteBuffer.allocate(chunkLength);
        this.mConnection = connection;
        this.mMessageLoop = messageLoop;
    }

    @Override // java.io.OutputStream
    public void write(int oneByte) throws IOException {
        ensureBufferHasRemaining();
        this.mBuffer.put((byte) oneByte);
    }

    @Override // java.io.OutputStream
    public void write(byte[] buffer, int offset, int count) throws IOException {
        checkNotClosed();
        if (buffer.length - offset < count || offset < 0 || count < 0) {
            throw new IndexOutOfBoundsException();
        }
        int toSend = count;
        while (toSend > 0) {
            int sent = Math.min(toSend, this.mBuffer.remaining());
            this.mBuffer.put(buffer, (offset + count) - toSend, sent);
            toSend -= sent;
            ensureBufferHasRemaining();
        }
    }

    @Override // org.chromium.net.urlconnection.CronetOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        super.close();
        if (!this.mLastChunk) {
            this.mLastChunk = true;
        }
    }

    @Override // org.chromium.net.urlconnection.CronetOutputStream
    void setConnected() throws IOException {
    }

    @Override // org.chromium.net.urlconnection.CronetOutputStream
    void checkReceivedEnoughContent() throws IOException {
    }

    @Override // org.chromium.net.urlconnection.CronetOutputStream
    UploadDataProvider getUploadDataProvider() {
        return this.mUploadDataProvider;
    }

    private class UploadDataProviderImpl extends UploadDataProvider {
        private UploadDataProviderImpl() {
        }

        @Override // org.chromium.net.UploadDataProvider
        public long getLength() {
            return -1L;
        }

        @Override // org.chromium.net.UploadDataProvider
        public void read(UploadDataSink uploadDataSink, ByteBuffer byteBuffer) {
            if (byteBuffer.remaining() >= CronetChunkedOutputStream.this.mBuffer.remaining()) {
                byteBuffer.put(CronetChunkedOutputStream.this.mBuffer);
                uploadDataSink.onReadSucceeded(CronetChunkedOutputStream.this.mLastChunk);
                if (!CronetChunkedOutputStream.this.mLastChunk) {
                    CronetChunkedOutputStream.this.mMessageLoop.quit();
                    return;
                }
                return;
            }
            int oldLimit = CronetChunkedOutputStream.this.mBuffer.limit();
            byteBuffer.put(CronetChunkedOutputStream.this.mBuffer);
            uploadDataSink.onReadSucceeded(false);
        }

        @Override // org.chromium.net.UploadDataProvider
        public void rewind(UploadDataSink uploadDataSink) {
            uploadDataSink.onRewindError(new HttpRetryException("Cannot retry streamed Http body", -1));
        }
    }

    private void ensureBufferHasRemaining() throws IOException {
        if (!this.mBuffer.hasRemaining()) {
            uploadBufferInternal();
        }
    }

    private void uploadBufferInternal() throws IOException {
        checkNotClosed();
        this.mMessageLoop.loop();
        checkNoException();
    }
}
