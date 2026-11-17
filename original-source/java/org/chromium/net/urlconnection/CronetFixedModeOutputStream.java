package org.chromium.net.urlconnection;

import java.io.IOException;
import java.net.HttpRetryException;
import java.net.ProtocolException;
import java.nio.ByteBuffer;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UploadDataSink;

/* loaded from: classes17.dex */
final class CronetFixedModeOutputStream extends CronetOutputStream {
    private static int sDefaultBufferLength = 16384;
    private final ByteBuffer mBuffer;
    private long mBytesWritten;
    private final CronetHttpURLConnection mConnection;
    private final long mContentLength;
    private final MessageLoop mMessageLoop;
    private final UploadDataProvider mUploadDataProvider = new UploadDataProviderImpl();

    CronetFixedModeOutputStream(CronetHttpURLConnection connection, long contentLength, MessageLoop messageLoop) {
        if (connection == null) {
            throw new NullPointerException();
        }
        if (contentLength < 0) {
            throw new IllegalArgumentException("Content length must be larger than 0 for non-chunked upload.");
        }
        this.mContentLength = contentLength;
        int bufferSize = (int) Math.min(this.mContentLength, sDefaultBufferLength);
        this.mBuffer = ByteBuffer.allocate(bufferSize);
        this.mConnection = connection;
        this.mMessageLoop = messageLoop;
        this.mBytesWritten = 0L;
    }

    @Override // java.io.OutputStream
    public void write(int oneByte) throws IOException {
        checkNotClosed();
        checkNotExceedContentLength(1);
        ensureBufferHasRemaining();
        this.mBuffer.put((byte) oneByte);
        this.mBytesWritten++;
        uploadIfComplete();
    }

    @Override // java.io.OutputStream
    public void write(byte[] buffer, int offset, int count) throws IOException {
        checkNotClosed();
        if (buffer.length - offset < count || offset < 0 || count < 0) {
            throw new IndexOutOfBoundsException();
        }
        checkNotExceedContentLength(count);
        int toSend = count;
        while (toSend > 0) {
            ensureBufferHasRemaining();
            int sent = Math.min(toSend, this.mBuffer.remaining());
            this.mBuffer.put(buffer, (offset + count) - toSend, sent);
            toSend -= sent;
        }
        this.mBytesWritten += count;
        uploadIfComplete();
    }

    private void ensureBufferHasRemaining() throws IOException {
        if (!this.mBuffer.hasRemaining()) {
            uploadBufferInternal();
        }
    }

    private void uploadIfComplete() throws IOException {
        if (this.mBytesWritten == this.mContentLength) {
            uploadBufferInternal();
        }
    }

    private void uploadBufferInternal() throws IOException {
        checkNotClosed();
        this.mMessageLoop.loop();
        checkNoException();
    }

    private void checkNotExceedContentLength(int numBytes) throws ProtocolException {
        if (this.mBytesWritten + numBytes > this.mContentLength) {
            throw new ProtocolException("expected " + (this.mContentLength - this.mBytesWritten) + " bytes but received " + numBytes);
        }
    }

    @Override // org.chromium.net.urlconnection.CronetOutputStream
    void setConnected() throws IOException {
    }

    @Override // org.chromium.net.urlconnection.CronetOutputStream
    void checkReceivedEnoughContent() throws IOException {
        if (this.mBytesWritten < this.mContentLength) {
            throw new ProtocolException("Content received is less than Content-Length.");
        }
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
            return CronetFixedModeOutputStream.this.mContentLength;
        }

        @Override // org.chromium.net.UploadDataProvider
        public void read(UploadDataSink uploadDataSink, ByteBuffer byteBuffer) {
            if (byteBuffer.remaining() >= CronetFixedModeOutputStream.this.mBuffer.remaining()) {
                byteBuffer.put(CronetFixedModeOutputStream.this.mBuffer);
                uploadDataSink.onReadSucceeded(false);
                CronetFixedModeOutputStream.this.mMessageLoop.quit();
                return;
            }
            int oldLimit = CronetFixedModeOutputStream.this.mBuffer.limit();
            byteBuffer.put(CronetFixedModeOutputStream.this.mBuffer);
            uploadDataSink.onReadSucceeded(false);
        }

        @Override // org.chromium.net.UploadDataProvider
        public void rewind(UploadDataSink uploadDataSink) {
            uploadDataSink.onRewindError(new HttpRetryException("Cannot retry streamed Http body", -1));
        }
    }

    static void setDefaultBufferLengthForTesting(int length) {
        sDefaultBufferLength = length;
    }
}
