package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.TagBundle;
import androidx.core.util.Preconditions;

/* loaded from: classes.dex */
final class CaptureCallbackAdapter extends CameraCaptureSession.CaptureCallback {
    private final CameraCaptureCallback mCameraCaptureCallback;

    CaptureCallbackAdapter(CameraCaptureCallback cameraCaptureCallback) {
        if (cameraCaptureCallback == null) {
            throw new NullPointerException("cameraCaptureCallback is null");
        }
        this.mCameraCaptureCallback = cameraCaptureCallback;
    }

    @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
    public void onCaptureStarted(CameraCaptureSession session, CaptureRequest request, long timestamp, long frameNumber) {
        super.onCaptureStarted(session, request, timestamp, frameNumber);
        this.mCameraCaptureCallback.onCaptureStarted(getCaptureConfigId(request));
    }

    private int getCaptureConfigId(CaptureRequest captureRequest) {
        if (!(captureRequest.getTag() instanceof TagBundle)) {
            return -1;
        }
        TagBundle tagbundle = (TagBundle) captureRequest.getTag();
        Integer captureConfigId = (Integer) tagbundle.getTag(CaptureConfig.CAPTURE_CONFIG_ID_TAG_KEY);
        if (captureConfigId == null) {
            return -1;
        }
        return captureConfigId.intValue();
    }

    @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
    public void onCaptureCompleted(CameraCaptureSession session, CaptureRequest request, TotalCaptureResult result) {
        TagBundle tagBundle;
        super.onCaptureCompleted(session, request, result);
        Object captureRequestTag = request.getTag();
        if (captureRequestTag != null) {
            Preconditions.checkArgument(captureRequestTag instanceof TagBundle, "The tagBundle object from the CaptureResult is not a TagBundle object.");
            tagBundle = (TagBundle) captureRequestTag;
        } else {
            tagBundle = TagBundle.emptyBundle();
        }
        this.mCameraCaptureCallback.onCaptureCompleted(getCaptureConfigId(request), new Camera2CameraCaptureResult(tagBundle, result));
    }

    @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
    public void onCaptureFailed(CameraCaptureSession session, CaptureRequest request, CaptureFailure failure) {
        super.onCaptureFailed(session, request, failure);
        CameraCaptureFailure cameraFailure = new CameraCaptureFailure(CameraCaptureFailure.Reason.ERROR);
        this.mCameraCaptureCallback.onCaptureFailed(getCaptureConfigId(request), cameraFailure);
    }
}
