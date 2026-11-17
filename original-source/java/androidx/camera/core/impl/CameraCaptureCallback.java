package androidx.camera.core.impl;

/* loaded from: classes.dex */
public abstract class CameraCaptureCallback {
    public void onCaptureStarted(int captureConfigId) {
    }

    public void onCaptureCompleted(int captureConfigId, CameraCaptureResult cameraCaptureResult) {
    }

    public void onCaptureFailed(int captureConfigId, CameraCaptureFailure failure) {
    }

    public void onCaptureCancelled(int captureConfigId) {
    }

    public void onCaptureProcessProgressed(int captureConfigId, int progress) {
    }
}
