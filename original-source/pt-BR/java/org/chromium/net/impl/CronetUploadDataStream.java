package org.chromium.net.impl;

import java.io.IOException;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;
import java.util.concurrent.Executor;
import org.chromium.base.Log;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.annotations.NativeClassQualifiedName;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UploadDataSink;
import org.chromium.net.impl.VersionSafeCallbacks;

@JNINamespace("cronet")
/* carregado de: classes17.dex */
public final class CronetUploadDataStream extends UploadDataSink {
    private static final String TAG = CronetUploadDataStream.class.getSimpleName();
    private ByteBuffer mByteBuffer;
    private long mByteBufferLimit;
    private final VersionSafeCallbacks.UploadDataProviderWrapper mDataProvider;
    private boolean mDestroyAdapterPostponed;
    private final Executor mExecutor;
    private long mLength;
    private Runnable mOnDestroyedCallbackForTesting;
    private long mRemainingLength;
    private final CronetUrlRequest mRequest;
    private long mUploadDataStreamAdapter;
    private final Runnable mReadTask = new Runnable() { // da classe: org.chromium.net.impl.CronetUploadDataStream.1
        static final /* sintético */ boolean $assertionsDisabled = false;

        @Override // java.lang.Runnable
        public void run() {
            synchronized (CronetUploadDataStream.this.mLock) {
                if (CronetUploadDataStream.this.mUploadDataStreamAdapter == 0) {
                    return;
                }
                CronetUploadDataStream.this.checkState(3);
                if (CronetUploadDataStream.this.mByteBuffer == null) {
                    throw new IllegalStateException("Unexpected readData call. Buffer is null");
                }
                CronetUploadDataStream.this.mInWhichUserCallback = 0;
                try {
                    CronetUploadDataStream.this.checkCallingThread();
                    if (CronetUploadDataStream.this.mByteBuffer.position() != 0) {
                        throw new AssertionError();
                    }
                    CronetUploadDataStream.this.mDataProvider.read(CronetUploadDataStream.this, CronetUploadDataStream.this.mByteBuffer);
                } catch (Exception exception) {
                    CronetUploadDataStream.this.onError(exception);
                }
            }
        }
    };
    private final Object mLock = new Object();
    private int mInWhichUserCallback = 3;

    interface Natives {
        long attachUploadDataToRequest(CronetUploadDataStream cronetUploadDataStream, long j, long j2);

        long createAdapterForTesting(CronetUploadDataStream cronetUploadDataStream);

        long createUploadDataStreamForTesting(CronetUploadDataStream cronetUploadDataStream, long j, long j2);

        @NativeClassQualifiedName("CronetUploadDataStreamAdapter")
        void destroy(long j);

        @NativeClassQualifiedName("CronetUploadDataStreamAdapter")
        void onReadSucceeded(long j, CronetUploadDataStream cronetUploadDataStream, int i, boolean z);

        @NativeClassQualifiedName("CronetUploadDataStreamAdapter")
        void onRewindSucceeded(long j, CronetUploadDataStream cronetUploadDataStream);
    }

    @Retention(RetentionPolicy.SOURCE)
    private @interface UserCallback {
        public static final int GET_LENGTH = 2;
        public static final int NOT_IN_CALLBACK = 3;
        public static final int READ = 0;
        public static final int REWIND = 1;
    }

    public CronetUploadDataStream(UploadDataProvider dataProvider, Executor executor, CronetUrlRequest request) {
        this.mExecutor = executor;
        this.mDataProvider = new VersionSafeCallbacks.UploadDataProviderWrapper(dataProvider);
        this.mRequest = request;
    }

    void readData(ByteBuffer byteBuffer) {
        this.mByteBuffer = byteBuffer;
        this.mByteBufferLimit = byteBuffer.limit();
        postTaskToExecutor(this.mReadTask);
    }

    void rewind() {
        Runnable task = new Runnable() { // da classe: org.chromium.net.impl.CronetUploadDataStream.2
            @Override // java.lang.Runnable
            public void run() {
                synchronized (CronetUploadDataStream.this.mLock) {
                    if (CronetUploadDataStream.this.mUploadDataStreamAdapter == 0) {
                        return;
                    }
                    CronetUploadDataStream.this.checkState(3);
                    CronetUploadDataStream.this.mInWhichUserCallback = 1;
                    try {
                        CronetUploadDataStream.this.checkCallingThread();
                        CronetUploadDataStream.this.mDataProvider.rewind(CronetUploadDataStream.this);
                    } catch (Exception exception) {
                        CronetUploadDataStream.this.onError(exception);
                    }
                }
            }
        };
        postTaskToExecutor(task);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void checkCallingThread() {
        this.mRequest.checkCallingThread();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void checkState(int mode) {
        if (this.mInWhichUserCallback != mode) {
            throw new IllegalStateException("Expected " + mode + ", but was " + this.mInWhichUserCallback);
        }
    }

    void onUploadDataStreamDestroyed() {
        destroyAdapter();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void onError(Throwable exception) {
        boolean sendClose;
        synchronized (this.mLock) {
            if (this.mInWhichUserCallback == 3) {
                throw new IllegalStateException("There is no read or rewind or length check in progress.", exception);
            }
            sendClose = this.mInWhichUserCallback == 2;
            this.mInWhichUserCallback = 3;
            this.mByteBuffer = null;
            destroyAdapterIfPostponed();
        }
        if (sendClose) {
            try {
                this.mDataProvider.close();
            } catch (Exception e) {
                Log.e(TAG, "Failure closing data provider", (Throwable) e);
            }
        }
        this.mRequest.onUploadException(exception);
    }

    @Override // org.chromium.net.UploadDataSink
    public void onReadSucceeded(boolean lastChunk) {
        synchronized (this.mLock) {
            try {
                try {
                    checkState(0);
                    if (this.mByteBufferLimit != this.mByteBuffer.limit()) {
                        throw new IllegalStateException("ByteBuffer limit changed");
                    }
                    if (lastChunk) {
                        try {
                            if (this.mLength >= 0) {
                                throw new IllegalArgumentException("Non-chunked upload can't have last chunk");
                            }
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                    int bytesRead = this.mByteBuffer.position();
                    this.mRemainingLength -= bytesRead;
                    if (this.mRemainingLength < 0 && this.mLength >= 0) {
                        throw new IllegalArgumentException(String.format("Read upload data length %d exceeds expected length %d", Long.valueOf(this.mLength - this.mRemainingLength), Long.valueOf(this.mLength)));
                    }
                    this.mByteBuffer = null;
                    this.mInWhichUserCallback = 3;
                    destroyAdapterIfPostponed();
                    if (this.mUploadDataStreamAdapter == 0) {
                        return;
                    }
                    CronetUploadDataStreamJni.get().onReadSucceeded(this.mUploadDataStreamAdapter, this, bytesRead, lastChunk);
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // org.chromium.net.UploadDataSink
    public void onReadError(Exception exception) {
        synchronized (this.mLock) {
            checkState(0);
            onError(exception);
        }
    }

    @Override // org.chromium.net.UploadDataSink
    public void onRewindSucceeded() {
        synchronized (this.mLock) {
            checkState(1);
            this.mInWhichUserCallback = 3;
            this.mRemainingLength = this.mLength;
            if (this.mUploadDataStreamAdapter == 0) {
                return;
            }
            CronetUploadDataStreamJni.get().onRewindSucceeded(this.mUploadDataStreamAdapter, this);
        }
    }

    @Override // org.chromium.net.UploadDataSink
    public void onRewindError(Exception exception) {
        synchronized (this.mLock) {
            checkState(1);
            onError(exception);
        }
    }

    void postTaskToExecutor(Runnable task) {
        try {
            this.mExecutor.execute(task);
        } catch (Throwable e) {
            this.mRequest.onUploadException(e);
        }
    }

    private void destroyAdapter() {
        synchronized (this.mLock) {
            if (this.mInWhichUserCallback == 0) {
                this.mDestroyAdapterPostponed = true;
                return;
            }
            if (this.mUploadDataStreamAdapter == 0) {
                return;
            }
            CronetUploadDataStreamJni.get().destroy(this.mUploadDataStreamAdapter);
            this.mUploadDataStreamAdapter = 0L;
            if (this.mOnDestroyedCallbackForTesting != null) {
                this.mOnDestroyedCallbackForTesting.run();
            }
            postTaskToExecutor(new Runnable() { // da classe: org.chromium.net.impl.CronetUploadDataStream.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        CronetUploadDataStream.this.checkCallingThread();
                        CronetUploadDataStream.this.mDataProvider.close();
                    } catch (Exception e) {
                        Log.e(CronetUploadDataStream.TAG, "Exception thrown when closing", (Throwable) e);
                    }
                }
            });
        }
    }

    private void destroyAdapterIfPostponed() {
        synchronized (this.mLock) {
            if (this.mInWhichUserCallback == 0) {
                throw new IllegalStateException("Method should not be called when read has not completed.");
            }
            if (this.mDestroyAdapterPostponed) {
                destroyAdapter();
            }
        }
    }

    void initializeWithRequest() {
        synchronized (this.mLock) {
            this.mInWhichUserCallback = 2;
        }
        try {
            this.mRequest.checkCallingThread();
            this.mLength = this.mDataProvider.getLength();
            this.mRemainingLength = this.mLength;
        } catch (Throwable t) {
            onError(t);
        }
        synchronized (this.mLock) {
            this.mInWhichUserCallback = 3;
        }
    }

    void attachNativeAdapterToRequest(long requestAdapter) {
        Throwable th;
        synchronized (this.mLock) {
            try {
                try {
                    this.mUploadDataStreamAdapter = CronetUploadDataStreamJni.get().attachUploadDataToRequest(this, requestAdapter, this.mLength);
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    public long createUploadDataStreamForTesting() throws IOException {
        long createUploadDataStreamForTesting;
        synchronized (this.mLock) {
            this.mUploadDataStreamAdapter = CronetUploadDataStreamJni.get().createAdapterForTesting(this);
            this.mLength = this.mDataProvider.getLength();
            this.mRemainingLength = this.mLength;
            createUploadDataStreamForTesting = CronetUploadDataStreamJni.get().createUploadDataStreamForTesting(this, this.mLength, this.mUploadDataStreamAdapter);
        }
        return createUploadDataStreamForTesting;
    }

    void setOnDestroyedCallbackForTesting(Runnable onDestroyedCallbackForTesting) {
        this.mOnDestroyedCallbackForTesting = onDestroyedCallbackForTesting;
    }
}
