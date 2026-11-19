package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.imagecapture.TakePictureManager;

/* carregado de: classes.dex */
final class AutoValue_TakePictureManager_CaptureError extends TakePictureManager.CaptureError {
    private final ImageCaptureException imageCaptureException;
    private final int requestId;

    AutoValue_TakePictureManager_CaptureError(int requestId, ImageCaptureException imageCaptureException) {
        this.requestId = requestId;
        if (imageCaptureException == null) {
            throw new NullPointerException("Null imageCaptureException");
        }
        this.imageCaptureException = imageCaptureException;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureManager.CaptureError
    int getRequestId() {
        return this.requestId;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureManager.CaptureError
    ImageCaptureException getImageCaptureException() {
        return this.imageCaptureException;
    }

    public String toString() {
        return "CaptureError{requestId=" + this.requestId + ", imageCaptureException=" + this.imageCaptureException + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof TakePictureManager.CaptureError)) {
            return false;
        }
        TakePictureManager.CaptureError that = (TakePictureManager.CaptureError) o;
        return this.requestId == that.getRequestId() && this.imageCaptureException.equals(that.getImageCaptureException());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.requestId) * 1000003) ^ this.imageCaptureException.hashCode();
    }
}
