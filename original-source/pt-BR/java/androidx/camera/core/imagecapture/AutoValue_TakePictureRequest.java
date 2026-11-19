package androidx.camera.core.imagecapture;

import android.graphics.Matrix;
import android.graphics.Rect;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.impl.CameraCaptureCallback;
import java.util.List;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
final class AutoValue_TakePictureRequest extends TakePictureRequest {
    private final Executor appExecutor;
    private final int captureMode;
    private final Rect cropRect;
    private final ImageCapture.OnImageCapturedCallback inMemoryCallback;
    private final int jpegQuality;
    private final ImageCapture.OnImageSavedCallback onDiskCallback;
    private final ImageCapture.OutputFileOptions outputFileOptions;
    private final int rotationDegrees;
    private final ImageCapture.OutputFileOptions secondaryOutputFileOptions;
    private final Matrix sensorToBufferTransform;
    private final List<CameraCaptureCallback> sessionConfigCameraCaptureCallbacks;
    private final boolean simultaneousCapture;

    AutoValue_TakePictureRequest(Executor appExecutor, ImageCapture.OnImageCapturedCallback inMemoryCallback, ImageCapture.OnImageSavedCallback onDiskCallback, ImageCapture.OutputFileOptions outputFileOptions, ImageCapture.OutputFileOptions secondaryOutputFileOptions, Rect cropRect, Matrix sensorToBufferTransform, int rotationDegrees, int jpegQuality, int captureMode, boolean simultaneousCapture, List<CameraCaptureCallback> sessionConfigCameraCaptureCallbacks) {
        if (appExecutor == null) {
            throw new NullPointerException("Null appExecutor");
        }
        this.appExecutor = appExecutor;
        this.inMemoryCallback = inMemoryCallback;
        this.onDiskCallback = onDiskCallback;
        this.outputFileOptions = outputFileOptions;
        this.secondaryOutputFileOptions = secondaryOutputFileOptions;
        if (cropRect == null) {
            throw new NullPointerException("Null cropRect");
        }
        this.cropRect = cropRect;
        if (sensorToBufferTransform == null) {
            throw new NullPointerException("Null sensorToBufferTransform");
        }
        this.sensorToBufferTransform = sensorToBufferTransform;
        this.rotationDegrees = rotationDegrees;
        this.jpegQuality = jpegQuality;
        this.captureMode = captureMode;
        this.simultaneousCapture = simultaneousCapture;
        if (sessionConfigCameraCaptureCallbacks == null) {
            throw new NullPointerException("Null sessionConfigCameraCaptureCallbacks");
        }
        this.sessionConfigCameraCaptureCallbacks = sessionConfigCameraCaptureCallbacks;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    Executor getAppExecutor() {
        return this.appExecutor;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    public ImageCapture.OnImageCapturedCallback getInMemoryCallback() {
        return this.inMemoryCallback;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    public ImageCapture.OnImageSavedCallback getOnDiskCallback() {
        return this.onDiskCallback;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    public ImageCapture.OutputFileOptions getOutputFileOptions() {
        return this.outputFileOptions;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    public ImageCapture.OutputFileOptions getSecondaryOutputFileOptions() {
        return this.secondaryOutputFileOptions;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    public Rect getCropRect() {
        return this.cropRect;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    Matrix getSensorToBufferTransform() {
        return this.sensorToBufferTransform;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    public int getRotationDegrees() {
        return this.rotationDegrees;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    public int getJpegQuality() {
        return this.jpegQuality;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    int getCaptureMode() {
        return this.captureMode;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    boolean isSimultaneousCapture() {
        return this.simultaneousCapture;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    List<CameraCaptureCallback> getSessionConfigCameraCaptureCallbacks() {
        return this.sessionConfigCameraCaptureCallbacks;
    }

    public String toString() {
        return "TakePictureRequest{appExecutor=" + this.appExecutor + ", inMemoryCallback=" + this.inMemoryCallback + ", onDiskCallback=" + this.onDiskCallback + ", outputFileOptions=" + this.outputFileOptions + ", secondaryOutputFileOptions=" + this.secondaryOutputFileOptions + ", cropRect=" + this.cropRect + ", sensorToBufferTransform=" + this.sensorToBufferTransform + ", rotationDegrees=" + this.rotationDegrees + ", jpegQuality=" + this.jpegQuality + ", captureMode=" + this.captureMode + ", simultaneousCapture=" + this.simultaneousCapture + ", sessionConfigCameraCaptureCallbacks=" + this.sessionConfigCameraCaptureCallbacks + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof TakePictureRequest)) {
            return false;
        }
        TakePictureRequest that = (TakePictureRequest) o;
        return this.appExecutor.equals(that.getAppExecutor()) && (this.inMemoryCallback != null ? this.inMemoryCallback.equals(that.getInMemoryCallback()) : that.getInMemoryCallback() == null) && (this.onDiskCallback != null ? this.onDiskCallback.equals(that.getOnDiskCallback()) : that.getOnDiskCallback() == null) && (this.outputFileOptions != null ? this.outputFileOptions.equals(that.getOutputFileOptions()) : that.getOutputFileOptions() == null) && (this.secondaryOutputFileOptions != null ? this.secondaryOutputFileOptions.equals(that.getSecondaryOutputFileOptions()) : that.getSecondaryOutputFileOptions() == null) && this.cropRect.equals(that.getCropRect()) && this.sensorToBufferTransform.equals(that.getSensorToBufferTransform()) && this.rotationDegrees == that.getRotationDegrees() && this.jpegQuality == that.getJpegQuality() && this.captureMode == that.getCaptureMode() && this.simultaneousCapture == that.isSimultaneousCapture() && this.sessionConfigCameraCaptureCallbacks.equals(that.getSessionConfigCameraCaptureCallbacks());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((((((((((h$ ^ this.appExecutor.hashCode()) * 1000003) ^ (this.inMemoryCallback == null ? 0 : this.inMemoryCallback.hashCode())) * 1000003) ^ (this.onDiskCallback == null ? 0 : this.onDiskCallback.hashCode())) * 1000003) ^ (this.outputFileOptions == null ? 0 : this.outputFileOptions.hashCode())) * 1000003) ^ (this.secondaryOutputFileOptions != null ? this.secondaryOutputFileOptions.hashCode() : 0)) * 1000003) ^ this.cropRect.hashCode()) * 1000003) ^ this.sensorToBufferTransform.hashCode()) * 1000003) ^ this.rotationDegrees) * 1000003) ^ this.jpegQuality) * 1000003) ^ this.captureMode) * 1000003) ^ (this.simultaneousCapture ? 1231 : 1237)) * 1000003) ^ this.sessionConfigCameraCaptureCallbacks.hashCode();
    }
}
