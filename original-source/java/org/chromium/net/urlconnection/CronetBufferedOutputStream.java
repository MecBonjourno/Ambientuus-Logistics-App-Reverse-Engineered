package org.chromium.net.urlconnection;

import java.io.IOException;
import java.net.ProtocolException;
import java.nio.ByteBuffer;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UploadDataSink;

/* loaded from: classes17.dex */
final class CronetBufferedOutputStream extends CronetOutputStream {
    private static final int INITIAL_BUFFER_SIZE = 16384;
    private ByteBuffer mBuffer;
    private boolean mConnected;
    private final CronetHttpURLConnection mConnection;
    private final int mInitialContentLength;
    private final UploadDataProvider mUploadDataProvider = new UploadDataProviderImpl();

    CronetBufferedOutputStream(CronetHttpURLConnection connection, long contentLength) {
        if (connection == null) {
            throw new NullPointerException("Argument connection cannot be null.");
        }
        if (contentLength > 2147483647L) {
            throw new IllegalArgumentException("Use setFixedLengthStreamingMode() or setChunkedStreamingMode() for requests larger than 2GB.");
        }
        if (contentLength < 0) {
            throw new IllegalArgumentException("Content length < 0.");
        }
        this.mConnection = connection;
        this.mInitialContentLength = (int) contentLength;
        this.mBuffer = ByteBuffer.allocate(this.mInitialContentLength);
    }

    CronetBufferedOutputStream(CronetHttpURLConnection connection) {
        if (connection == null) {
            throw new NullPointerException();
        }
        this.mConnection = connection;
        this.mInitialContentLength = -1;
        this.mBuffer = ByteBuffer.allocate(16384);
    }

    @Override // java.io.OutputStream
    public void write(int oneByte) throws IOException {
        checkNotClosed();
        ensureCanWrite(1);
        this.mBuffer.put((byte) oneByte);
    }

    @Override // java.io.OutputStream
    public void write(byte[] buffer, int offset, int count) throws IOException {
        checkNotClosed();
        ensureCanWrite(count);
        this.mBuffer.put(buffer, offset, count);
    }

    private void ensureCanWrite(int count) throws IOException {
        if (this.mInitialContentLength != -1 && this.mBuffer.position() + count > this.mInitialContentLength) {
            throw new ProtocolException("exceeded content-length limit of " + this.mInitialContentLength + " bytes");
        }
        if (this.mConnected) {
            throw new IllegalStateException("Use setFixedLengthStreamingMode() or setChunkedStreamingMode() for writing after connect");
        }
        if (this.mInitialContentLength != -1 || this.mBuffer.limit() - this.mBuffer.position() > count) {
            return;
        }
        int afterSize = Math.max(this.mBuffer.capacity() * 2, this.mBuffer.capacity() + count);
        ByteBuffer newByteBuffer = ByteBuffer.allocate(afterSize);
        newByteBuffer.put(this.mBuffer);
        this.mBuffer = newByteBuffer;
    }

    @Override // org.chromium.net.urlconnection.CronetOutputStream
    void setConnected() throws IOException {
        this.mConnected = true;
        if (this.mBuffer.position() < this.mInitialContentLength) {
            throw new ProtocolException("Content received is less than Content-Length");
        }
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
            if (CronetBufferedOutputStream.this.mInitialContentLength == -1) {
                return CronetBufferedOutputStream.this.mConnected ? CronetBufferedOutputStream.this.mBuffer.limit() : CronetBufferedOutputStream.this.mBuffer.position();
            }
            return CronetBufferedOutputStream.this.mInitialContentLength;
        }

        @Override // org.chromium.net.UploadDataProvider
        public void read(UploadDataSink uploadDataSink, ByteBuffer byteBuffer) {
            int availableSpace = byteBuffer.remaining();
            if (availableSpace < CronetBufferedOutputStream.this.mBuffer.remaining()) {
                byteBuffer.put(CronetBufferedOutputStream.this.mBuffer.array(), CronetBufferedOutputStream.this.mBuffer.position(), availableSpace);
            } else {
                byteBuffer.put(CronetBufferedOutputStream.this.mBuffer);
            }
            uploadDataSink.onReadSucceeded(false);
        }

        @Override // org.chromium.net.UploadDataProvider
        public void rewind(UploadDataSink uploadDataSink) {
            uploadDataSink.onRewindSucceeded();
        }
    }
}
