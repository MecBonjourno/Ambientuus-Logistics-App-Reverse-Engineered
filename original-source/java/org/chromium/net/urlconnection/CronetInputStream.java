package org.chromium.net.urlconnection;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: classes17.dex */
class CronetInputStream extends InputStream {
    private static final int READ_BUFFER_SIZE = 32768;
    private ByteBuffer mBuffer;
    private IOException mException;
    private final CronetHttpURLConnection mHttpURLConnection;
    private boolean mResponseDataCompleted;

    public CronetInputStream(CronetHttpURLConnection httpURLConnection) {
        this.mHttpURLConnection = httpURLConnection;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        getMoreDataIfNeeded();
        if (hasUnreadData()) {
            return this.mBuffer.get() & 255;
        }
        return -1;
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer, int byteOffset, int byteCount) throws IOException {
        if (byteOffset < 0 || byteCount < 0 || byteOffset + byteCount > buffer.length) {
            throw new IndexOutOfBoundsException();
        }
        if (byteCount == 0) {
            return 0;
        }
        getMoreDataIfNeeded();
        if (hasUnreadData()) {
            int bytesRead = Math.min(this.mBuffer.limit() - this.mBuffer.position(), byteCount);
            this.mBuffer.get(buffer, byteOffset, bytesRead);
            return bytesRead;
        }
        return -1;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this.mResponseDataCompleted) {
            if (this.mException == null) {
                return 0;
            }
            throw this.mException;
        }
        if (hasUnreadData()) {
            return this.mBuffer.remaining();
        }
        return 0;
    }

    void setResponseDataCompleted(IOException exception) {
        this.mException = exception;
        this.mResponseDataCompleted = true;
        this.mBuffer = null;
    }

    private void getMoreDataIfNeeded() throws IOException {
        if (this.mResponseDataCompleted) {
            if (this.mException != null) {
                throw this.mException;
            }
            return;
        }
        if (!hasUnreadData()) {
            if (this.mBuffer == null) {
                this.mBuffer = ByteBuffer.allocateDirect(32768);
            }
            this.mHttpURLConnection.getMoreData(this.mBuffer);
            if (this.mException != null) {
                throw this.mException;
            }
            if (this.mBuffer != null) {
            }
        }
    }

    private boolean hasUnreadData() {
        return this.mBuffer != null && this.mBuffer.hasRemaining();
    }
}
