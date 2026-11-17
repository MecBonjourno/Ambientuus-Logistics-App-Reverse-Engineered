package androidx.camera.core.processing;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.utils.MatrixExt;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
final class SurfaceOutputImpl implements SurfaceOutput {
    private static final String TAG = "SurfaceOutputImpl";
    private final SurfaceOutput.CameraInputInfo mCameraInputInfo;
    private final ListenableFuture<Void> mCloseFuture;
    private CallbackToFutureAdapter.Completer<Void> mCloseFutureCompleter;
    private Consumer<SurfaceOutput.Event> mEventListener;
    private Executor mExecutor;
    private final int mFormat;
    private final SurfaceOutput.CameraInputInfo mSecondaryCameraInputInfo;
    private Matrix mSensorToBufferTransform;
    private final Size mSize;
    private final Surface mSurface;
    private final int mTargets;
    private final Object mLock = new Object();
    private final float[] mAdditionalTransform = new float[16];
    private final float[] mSecondaryAdditionalTransform = new float[16];
    private final float[] mInvertedTextureTransform = new float[16];
    private final float[] mSecondaryInvertedTextureTransform = new float[16];
    private boolean mHasPendingCloseRequest = false;
    private boolean mIsClosed = false;

    SurfaceOutputImpl(Surface surface, int targets, int format, Size size, SurfaceOutput.CameraInputInfo primaryCameraInputInfo, SurfaceOutput.CameraInputInfo secondaryCameraInputInfo, Matrix sensorToBufferTransform) {
        this.mSurface = surface;
        this.mTargets = targets;
        this.mFormat = format;
        this.mSize = size;
        this.mCameraInputInfo = primaryCameraInputInfo;
        this.mSecondaryCameraInputInfo = secondaryCameraInputInfo;
        this.mSensorToBufferTransform = sensorToBufferTransform;
        calculateAdditionalTransform(this.mAdditionalTransform, this.mInvertedTextureTransform, this.mCameraInputInfo);
        calculateAdditionalTransform(this.mSecondaryAdditionalTransform, this.mSecondaryInvertedTextureTransform, this.mSecondaryCameraInputInfo);
        this.mCloseFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.processing.SurfaceOutputImpl$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return SurfaceOutputImpl.this.m220lambda$new$0$androidxcameracoreprocessingSurfaceOutputImpl(completer);
            }
        });
    }

    /* renamed from: lambda$new$0$androidx-camera-core-processing-SurfaceOutputImpl, reason: not valid java name */
    /* synthetic */ Object m220lambda$new$0$androidxcameracoreprocessingSurfaceOutputImpl(CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mCloseFutureCompleter = completer;
        return "SurfaceOutputImpl close future complete";
    }

    @Override // androidx.camera.core.SurfaceOutput
    public Surface getSurface(Executor executor, Consumer<SurfaceOutput.Event> listener) {
        boolean hasPendingCloseRequest;
        synchronized (this.mLock) {
            this.mExecutor = executor;
            this.mEventListener = listener;
            hasPendingCloseRequest = this.mHasPendingCloseRequest;
        }
        if (hasPendingCloseRequest) {
            requestClose();
        }
        return this.mSurface;
    }

    public void requestClose() {
        final AtomicReference<Consumer<SurfaceOutput.Event>> eventListenerRef = new AtomicReference<>();
        Executor executor = null;
        synchronized (this.mLock) {
            if (this.mExecutor != null && this.mEventListener != null) {
                if (!this.mIsClosed) {
                    eventListenerRef.set(this.mEventListener);
                    executor = this.mExecutor;
                    this.mHasPendingCloseRequest = false;
                }
            }
            this.mHasPendingCloseRequest = true;
        }
        if (executor != null) {
            try {
                executor.execute(new Runnable() { // from class: androidx.camera.core.processing.SurfaceOutputImpl$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        SurfaceOutputImpl.this.m221x4fbd8e2d(eventListenerRef);
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.d(TAG, "Processor executor closed. Close request not posted.", e);
            }
        }
    }

    /* renamed from: lambda$requestClose$1$androidx-camera-core-processing-SurfaceOutputImpl, reason: not valid java name */
    /* synthetic */ void m221x4fbd8e2d(AtomicReference eventListenerRef) {
        ((Consumer) eventListenerRef.get()).accept(SurfaceOutput.Event.of(0, this));
    }

    @Override // androidx.camera.core.SurfaceOutput
    public int getTargets() {
        return this.mTargets;
    }

    @Override // androidx.camera.core.SurfaceOutput
    public int getFormat() {
        return this.mFormat;
    }

    @Override // androidx.camera.core.SurfaceOutput
    public Size getSize() {
        return this.mSize;
    }

    public Rect getInputCropRect() {
        return this.mCameraInputInfo.getInputCropRect();
    }

    public Size getInputSize() {
        return this.mCameraInputInfo.getInputSize();
    }

    public int getRotationDegrees() {
        return this.mCameraInputInfo.getRotationDegrees();
    }

    public boolean isMirroring() {
        return this.mCameraInputInfo.getMirroring();
    }

    public CameraInternal getCamera() {
        return this.mCameraInputInfo.getCameraInternal();
    }

    @Override // androidx.camera.core.SurfaceOutput, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        synchronized (this.mLock) {
            if (!this.mIsClosed) {
                this.mIsClosed = true;
            }
        }
        this.mCloseFutureCompleter.set(null);
    }

    public boolean isClosed() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mIsClosed;
        }
        return z;
    }

    public ListenableFuture<Void> getCloseFuture() {
        return this.mCloseFuture;
    }

    @Override // androidx.camera.core.SurfaceOutput
    public void updateTransformMatrix(float[] output, float[] input) {
        updateTransformMatrix(output, input, true);
    }

    @Override // androidx.camera.core.SurfaceOutput
    public void updateTransformMatrix(float[] output, float[] input, boolean isPrimary) {
        android.opengl.Matrix.multiplyMM(output, 0, input, 0, isPrimary ? this.mAdditionalTransform : this.mSecondaryAdditionalTransform, 0);
    }

    @Override // androidx.camera.core.SurfaceOutput
    public Matrix getSensorToBufferTransform() {
        return new Matrix(this.mSensorToBufferTransform);
    }

    private static void calculateAdditionalTransform(float[] additionalTransform, float[] invertedTransform, SurfaceOutput.CameraInputInfo cameraInputInfo) {
        android.opengl.Matrix.setIdentityM(additionalTransform, 0);
        if (cameraInputInfo == null) {
            return;
        }
        MatrixExt.preVerticalFlip(additionalTransform, 0.5f);
        MatrixExt.preRotate(additionalTransform, cameraInputInfo.getRotationDegrees(), 0.5f, 0.5f);
        if (cameraInputInfo.getMirroring()) {
            android.opengl.Matrix.translateM(additionalTransform, 0, 1.0f, 0.0f, 0.0f);
            android.opengl.Matrix.scaleM(additionalTransform, 0, -1.0f, 1.0f, 1.0f);
        }
        Size rotatedSize = TransformUtils.rotateSize(cameraInputInfo.getInputSize(), cameraInputInfo.getRotationDegrees());
        Matrix imageTransform = TransformUtils.getRectToRect(TransformUtils.sizeToRectF(cameraInputInfo.getInputSize()), TransformUtils.sizeToRectF(rotatedSize), cameraInputInfo.getRotationDegrees(), cameraInputInfo.getMirroring());
        RectF rotatedCroppedRect = new RectF(cameraInputInfo.getInputCropRect());
        imageTransform.mapRect(rotatedCroppedRect);
        float offsetX = rotatedCroppedRect.left / rotatedSize.getWidth();
        float offsetY = ((rotatedSize.getHeight() - rotatedCroppedRect.height()) - rotatedCroppedRect.top) / rotatedSize.getHeight();
        float scaleX = rotatedCroppedRect.width() / rotatedSize.getWidth();
        float scaleY = rotatedCroppedRect.height() / rotatedSize.getHeight();
        android.opengl.Matrix.translateM(additionalTransform, 0, offsetX, offsetY, 0.0f);
        android.opengl.Matrix.scaleM(additionalTransform, 0, scaleX, scaleY, 1.0f);
        calculateInvertedTextureTransform(invertedTransform, cameraInputInfo.getCameraInternal());
        android.opengl.Matrix.multiplyMM(additionalTransform, 0, invertedTransform, 0, additionalTransform, 0);
    }

    private static void calculateInvertedTextureTransform(float[] invertedTextureTransform, CameraInternal cameraInternal) {
        android.opengl.Matrix.setIdentityM(invertedTextureTransform, 0);
        MatrixExt.preVerticalFlip(invertedTextureTransform, 0.5f);
        if (cameraInternal != null) {
            Preconditions.checkState(cameraInternal.getHasTransform(), "Camera has no transform.");
            MatrixExt.preRotate(invertedTextureTransform, cameraInternal.getCameraInfo().getSensorRotationDegrees(), 0.5f, 0.5f);
            if (cameraInternal.isFrontFacing()) {
                android.opengl.Matrix.translateM(invertedTextureTransform, 0, 1.0f, 0.0f, 0.0f);
                android.opengl.Matrix.scaleM(invertedTextureTransform, 0, -1.0f, 1.0f, 1.0f);
            }
        }
        android.opengl.Matrix.invertM(invertedTextureTransform, 0, invertedTextureTransform, 0);
    }
}
