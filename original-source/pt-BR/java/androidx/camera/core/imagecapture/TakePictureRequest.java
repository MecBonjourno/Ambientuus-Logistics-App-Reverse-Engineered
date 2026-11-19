package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Rect;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.internal.compat.workaround.CaptureFailedRetryEnabler;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public abstract class TakePictureRequest {
    private static final String TAG = "TakePictureRequest";
    private int mRemainingRetires = new CaptureFailedRetryEnabler().getRetryCount();
    private final Map<Integer, Boolean> mFormatCaptureStatus = new HashMap();

    interface RetryControl {
        void retryRequest(TakePictureRequest takePictureRequest);
    }

    abstract Executor getAppExecutor();

    abstract int getCaptureMode();

    public abstract Rect getCropRect();

    public abstract ImageCapture.OnImageCapturedCallback getInMemoryCallback();

    public abstract int getJpegQuality();

    public abstract ImageCapture.OnImageSavedCallback getOnDiskCallback();

    public abstract ImageCapture.OutputFileOptions getOutputFileOptions();

    public abstract int getRotationDegrees();

    public abstract ImageCapture.OutputFileOptions getSecondaryOutputFileOptions();

    abstract Matrix getSensorToBufferTransform();

    abstract List<CameraCaptureCallback> getSessionConfigCameraCaptureCallbacks();

    abstract boolean isSimultaneousCapture();

    boolean decrementRetryCounter() {
        Threads.checkMainThread();
        if (this.mRemainingRetires > 0) {
            this.mRemainingRetires--;
            return true;
        }
        return false;
    }

    void incrementRetryCounter() {
        Threads.checkMainThread();
        this.mRemainingRetires++;
    }

    int getRemainingRetries() {
        Threads.checkMainThread();
        return this.mRemainingRetires;
    }

    void initFormatProcessStatusInSimultaneousCapture() {
        this.mFormatCaptureStatus.put(32, false);
        this.mFormatCaptureStatus.put(256, false);
    }

    void markFormatProcessStatusInSimultaneousCapture(int format, boolean isProcessed) {
        if (!this.mFormatCaptureStatus.containsKey(Integer.valueOf(format))) {
            Logger.e(TAG, "The format is not supported in simultaneous capture");
        } else {
            this.mFormatCaptureStatus.put(Integer.valueOf(format), Boolean.valueOf(isProcessed));
        }
    }

    boolean isFormatProcessedInSimultaneousCapture() {
        for (Map.Entry<Integer, Boolean> entry : this.mFormatCaptureStatus.entrySet()) {
            if (!entry.getValue().booleanValue()) {
                return false;
            }
        }
        return true;
    }

    void onError(final ImageCaptureException imageCaptureException) {
        getAppExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.TakePictureRequest$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureRequest.this.m178x9daf4b5c(imageCaptureException);
            }
        });
    }

    /* renomeado de: lambda$onError$0$androidx-camera-core-imagecapture-TakePictureRequest, motivo: nome Java inválido */
    /* sintético */ void m178x9daf4b5c(ImageCaptureException imageCaptureException) {
        boolean hasInMemory = getInMemoryCallback() != null;
        boolean hasOnDisk = getOnDiskCallback() != null;
        if (hasInMemory && !hasOnDisk) {
            ((ImageCapture.OnImageCapturedCallback) Objects.requireNonNull(getInMemoryCallback())).onError(imageCaptureException);
        } else {
            if (hasOnDisk && !hasInMemory) {
                ((ImageCapture.OnImageSavedCallback) Objects.requireNonNull(getOnDiskCallback())).onError(imageCaptureException);
                return;
            }
            throw new IllegalStateException("One and only one callback is allowed.");
        }
    }

    /* renomeado de: lambda$onResult$1$androidx-camera-core-imagecapture-TakePictureRequest, motivo: nome Java inválido */
    /* sintético */ void m180x75636bce(ImageCapture.OutputFileResults outputFileResults) {
        ((ImageCapture.OnImageSavedCallback) Objects.requireNonNull(getOnDiskCallback())).onImageSaved((ImageCapture.OutputFileResults) Objects.requireNonNull(outputFileResults));
    }

    void onResult(final ImageCapture.OutputFileResults outputFileResults) {
        getAppExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.TakePictureRequest$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureRequest.this.m180x75636bce(outputFileResults);
            }
        });
    }

    /* renomeado de: lambda$onResult$2$androidx-camera-core-imagecapture-TakePictureRequest, motivo: nome Java inválido */
    /* sintético */ void m181x8f7eea6d(ImageProxy imageProxy) {
        ((ImageCapture.OnImageCapturedCallback) Objects.requireNonNull(getInMemoryCallback())).onCaptureSuccess((ImageProxy) Objects.requireNonNull(imageProxy));
    }

    void onResult(final ImageProxy imageProxy) {
        getAppExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.TakePictureRequest$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureRequest.this.m181x8f7eea6d(imageProxy);
            }
        });
    }

    void onCaptureProcessProgressed(final int progress) {
        getAppExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.TakePictureRequest$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureRequest.this.m177x43aa6c74(progress);
            }
        });
    }

    /* renomeado de: lambda$onCaptureProcessProgressed$3$androidx-camera-core-imagecapture-TakePictureRequest, motivo: nome Java inválido */
    /* sintético */ void m177x43aa6c74(int progress) {
        if (getOnDiskCallback() != null) {
            getOnDiskCallback().onCaptureProcessProgressed(progress);
        } else if (getInMemoryCallback() != null) {
            getInMemoryCallback().onCaptureProcessProgressed(progress);
        }
    }

    void onPostviewBitmapAvailable(final Bitmap bitmap) {
        getAppExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.TakePictureRequest$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureRequest.this.m179xa594fdeb(bitmap);
            }
        });
    }

    /* renomeado de: lambda$onPostviewBitmapAvailable$4$androidx-camera-core-imagecapture-TakePictureRequest, motivo: nome Java inválido */
    /* sintético */ void m179xa594fdeb(Bitmap bitmap) {
        if (getOnDiskCallback() != null) {
            getOnDiskCallback().onPostviewBitmapAvailable(bitmap);
        } else if (getInMemoryCallback() != null) {
            getInMemoryCallback().onPostviewBitmapAvailable(bitmap);
        }
    }

    public static TakePictureRequest of(Executor appExecutor, ImageCapture.OnImageCapturedCallback inMemoryCallback, ImageCapture.OnImageSavedCallback onDiskCallback, ImageCapture.OutputFileOptions outputFileOptions, ImageCapture.OutputFileOptions secondaryOutputFileOptions, Rect cropRect, Matrix sensorToBufferTransform, int rotationDegrees, int jpegQuality, int captureMode, boolean isSimultaneousCapture, List<CameraCaptureCallback> sessionConfigCameraCaptureCallbacks) {
        Preconditions.checkArgument((onDiskCallback == null) == (outputFileOptions == null), "onDiskCallback and outputFileOptions should be both null or both non-null.");
        Preconditions.checkArgument((inMemoryCallback == null) ^ (onDiskCallback == null), "One and only one on-disk or in-memory callback should be present.");
        TakePictureRequest request = new AutoValue_TakePictureRequest(appExecutor, inMemoryCallback, onDiskCallback, outputFileOptions, secondaryOutputFileOptions, cropRect, sensorToBufferTransform, rotationDegrees, jpegQuality, captureMode, isSimultaneousCapture, sessionConfigCameraCaptureCallbacks);
        if (isSimultaneousCapture) {
            request.initFormatProcessStatusInSimultaneousCapture();
        }
        return request;
    }
}
