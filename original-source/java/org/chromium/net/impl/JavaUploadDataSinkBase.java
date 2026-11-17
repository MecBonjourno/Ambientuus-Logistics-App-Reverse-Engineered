package org.chromium.net.impl;

import android.support.v4.media.session.PlaybackStateCompat;
import java.io.IOException;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UploadDataSink;
import org.chromium.net.impl.JavaUrlRequestUtils;

/* loaded from: classes17.dex */
public abstract class JavaUploadDataSinkBase extends UploadDataSink {
    public static final int DEFAULT_UPLOAD_BUFFER_SIZE = 8192;
    private ByteBuffer mBuffer;
    private final Executor mExecutor;
    private final AtomicInteger mSinkState = new AtomicInteger(3);
    private long mTotalBytes;
    private final UploadDataProvider mUploadProvider;
    private final Executor mUserUploadExecutor;
    private long mWrittenBytes;

    @Retention(RetentionPolicy.SOURCE)
    @interface SinkState {
        public static final int AWAITING_READ_RESULT = 0;
        public static final int AWAITING_REWIND_RESULT = 1;
        public static final int NOT_STARTED = 3;
        public static final int UPLOADING = 2;
    }

    protected abstract void finish() throws IOException;

    protected abstract Runnable getErrorSettingRunnable(JavaUrlRequestUtils.CheckedRunnable checkedRunnable);

    protected abstract Runnable getUploadErrorSettingRunnable(JavaUrlRequestUtils.CheckedRunnable checkedRunnable);

    protected abstract void initializeRead() throws IOException;

    protected abstract void initializeStart(long j);

    protected abstract int processSuccessfulRead(ByteBuffer byteBuffer) throws IOException;

    protected abstract void processUploadError(Throwable th);

    public JavaUploadDataSinkBase(final Executor userExecutor, Executor executor, UploadDataProvider provider) {
        this.mUserUploadExecutor = new Executor() { // from class: org.chromium.net.impl.JavaUploadDataSinkBase.1
            @Override // java.util.concurrent.Executor
            public void execute(Runnable runnable) {
                try {
                    userExecutor.execute(runnable);
                } catch (RejectedExecutionException e) {
                    JavaUploadDataSinkBase.this.processUploadError(e);
                }
            }
        };
        this.mExecutor = executor;
        this.mUploadProvider = provider;
    }

    @Override // org.chromium.net.UploadDataSink
    public void onReadSucceeded(final boolean finalChunk) {
        if (!this.mSinkState.compareAndSet(0, 2)) {
            throw new IllegalStateException("onReadSucceeded() called when not awaiting a read result; in state: " + this.mSinkState.get());
        }
        this.mExecutor.execute(getErrorSettingRunnable(new JavaUrlRequestUtils.CheckedRunnable() { // from class: org.chromium.net.impl.JavaUploadDataSinkBase.2
            @Override // org.chromium.net.impl.JavaUrlRequestUtils.CheckedRunnable
            public void run() throws Exception {
                if (JavaUploadDataSinkBase.this.mTotalBytes != -1 && JavaUploadDataSinkBase.this.mTotalBytes - JavaUploadDataSinkBase.this.mWrittenBytes < JavaUploadDataSinkBase.this.mBuffer.remaining()) {
                    JavaUploadDataSinkBase.this.processUploadError(new IllegalArgumentException(String.format(Locale.getDefault(), "Read upload data length %d exceeds expected length %d", Long.valueOf(JavaUploadDataSinkBase.this.mWrittenBytes + JavaUploadDataSinkBase.this.mBuffer.remaining()), Long.valueOf(JavaUploadDataSinkBase.this.mTotalBytes))));
                    return;
                }
                JavaUploadDataSinkBase.this.mWrittenBytes += JavaUploadDataSinkBase.this.processSuccessfulRead(JavaUploadDataSinkBase.this.mBuffer);
                if (JavaUploadDataSinkBase.this.mWrittenBytes < JavaUploadDataSinkBase.this.mTotalBytes || (JavaUploadDataSinkBase.this.mTotalBytes == -1 && !finalChunk)) {
                    JavaUploadDataSinkBase.this.mSinkState.set(0);
                    JavaUploadDataSinkBase.this.executeOnUploadExecutor(new JavaUrlRequestUtils.CheckedRunnable() { // from class: org.chromium.net.impl.JavaUploadDataSinkBase.2.1
                        @Override // org.chromium.net.impl.JavaUrlRequestUtils.CheckedRunnable
                        public void run() throws Exception {
                            JavaUploadDataSinkBase.this.mUploadProvider.read(JavaUploadDataSinkBase.this, JavaUploadDataSinkBase.this.mBuffer);
                        }
                    });
                } else if (JavaUploadDataSinkBase.this.mTotalBytes == -1) {
                    JavaUploadDataSinkBase.this.finish();
                } else if (JavaUploadDataSinkBase.this.mTotalBytes == JavaUploadDataSinkBase.this.mWrittenBytes) {
                    JavaUploadDataSinkBase.this.finish();
                } else {
                    JavaUploadDataSinkBase.this.processUploadError(new IllegalArgumentException(String.format(Locale.getDefault(), "Read upload data length %d exceeds expected length %d", Long.valueOf(JavaUploadDataSinkBase.this.mWrittenBytes), Long.valueOf(JavaUploadDataSinkBase.this.mTotalBytes))));
                }
            }
        }));
    }

    @Override // org.chromium.net.UploadDataSink
    public void onRewindSucceeded() {
        if (!this.mSinkState.compareAndSet(1, 2)) {
            throw new IllegalStateException("onRewindSucceeded() called when not awaiting a rewind; in state: " + this.mSinkState.get());
        }
        startRead();
    }

    @Override // org.chromium.net.UploadDataSink
    public void onReadError(Exception exception) {
        processUploadError(exception);
    }

    @Override // org.chromium.net.UploadDataSink
    public void onRewindError(Exception exception) {
        processUploadError(exception);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startRead() {
        this.mExecutor.execute(getErrorSettingRunnable(new JavaUrlRequestUtils.CheckedRunnable() { // from class: org.chromium.net.impl.JavaUploadDataSinkBase.3
            @Override // org.chromium.net.impl.JavaUrlRequestUtils.CheckedRunnable
            public void run() throws Exception {
                JavaUploadDataSinkBase.this.initializeRead();
                JavaUploadDataSinkBase.this.mSinkState.set(0);
                JavaUploadDataSinkBase.this.executeOnUploadExecutor(new JavaUrlRequestUtils.CheckedRunnable() { // from class: org.chromium.net.impl.JavaUploadDataSinkBase.3.1
                    @Override // org.chromium.net.impl.JavaUrlRequestUtils.CheckedRunnable
                    public void run() throws Exception {
                        JavaUploadDataSinkBase.this.mUploadProvider.read(JavaUploadDataSinkBase.this, JavaUploadDataSinkBase.this.mBuffer);
                    }
                });
            }
        }));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void executeOnUploadExecutor(JavaUrlRequestUtils.CheckedRunnable runnable) {
        try {
            this.mUserUploadExecutor.execute(getUploadErrorSettingRunnable(runnable));
        } catch (RejectedExecutionException e) {
            processUploadError(e);
        }
    }

    public void start(final boolean firstTime) {
        executeOnUploadExecutor(new JavaUrlRequestUtils.CheckedRunnable() { // from class: org.chromium.net.impl.JavaUploadDataSinkBase.4
            @Override // org.chromium.net.impl.JavaUrlRequestUtils.CheckedRunnable
            public void run() throws Exception {
                JavaUploadDataSinkBase.this.mTotalBytes = JavaUploadDataSinkBase.this.mUploadProvider.getLength();
                if (JavaUploadDataSinkBase.this.mTotalBytes == 0) {
                    JavaUploadDataSinkBase.this.finish();
                    return;
                }
                if (JavaUploadDataSinkBase.this.mTotalBytes > 0 && JavaUploadDataSinkBase.this.mTotalBytes < PlaybackStateCompat.ACTION_PLAY_FROM_URI) {
                    JavaUploadDataSinkBase.this.mBuffer = ByteBuffer.allocateDirect(((int) JavaUploadDataSinkBase.this.mTotalBytes) + 1);
                } else {
                    JavaUploadDataSinkBase.this.mBuffer = ByteBuffer.allocateDirect(8192);
                }
                JavaUploadDataSinkBase.this.initializeStart(JavaUploadDataSinkBase.this.mTotalBytes);
                if (firstTime) {
                    JavaUploadDataSinkBase.this.startRead();
                } else {
                    JavaUploadDataSinkBase.this.mSinkState.set(1);
                    JavaUploadDataSinkBase.this.mUploadProvider.rewind(JavaUploadDataSinkBase.this);
                }
            }
        });
    }
}
