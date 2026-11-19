package androidx.camera.core.imagecapture;

import androidx.camera.core.impl.CaptureConfig;
import java.util.List;

/* carregado de: classes.dex */
public final class CameraRequest {
    private final TakePictureCallback mCallback;
    private final List<CaptureConfig> mCaptureConfigs;

    public CameraRequest(List<CaptureConfig> captureConfigs, TakePictureCallback callback) {
        this.mCaptureConfigs = captureConfigs;
        this.mCallback = callback;
    }

    List<CaptureConfig> getCaptureConfigs() {
        return this.mCaptureConfigs;
    }

    boolean isAborted() {
        return this.mCallback.isAborted();
    }
}
