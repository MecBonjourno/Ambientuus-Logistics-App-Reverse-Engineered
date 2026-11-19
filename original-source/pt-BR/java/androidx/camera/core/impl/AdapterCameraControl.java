package androidx.camera.core.impl;

import android.util.Range;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.impl.utils.SessionProcessorUtil;
import androidx.camera.core.impl.utils.futures.Futures;
import com.google.common.util.concurrent.ListenableFuture;

/* carregado de: classes.dex */
public class AdapterCameraControl extends ForwardingCameraControl {
    private final CameraControlInternal mCameraControl;
    private final SessionProcessor mSessionProcessor;

    public AdapterCameraControl(CameraControlInternal cameraControl, SessionProcessor sessionProcessor) {
        super(cameraControl);
        this.mCameraControl = cameraControl;
        this.mSessionProcessor = sessionProcessor;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.impl.CameraControlInternal
    public CameraControlInternal getImplementation() {
        return this.mCameraControl;
    }

    public SessionProcessor getSessionProcessor() {
        return this.mSessionProcessor;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Void> enableTorch(boolean torch) {
        if (!SessionProcessorUtil.isOperationSupported(this.mSessionProcessor, 6)) {
            return Futures.immediateFailedFuture(new IllegalStateException("Torch is not supported"));
        }
        return this.mCameraControl.enableTorch(torch);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action) {
        FocusMeteringAction modifiedAction = SessionProcessorUtil.getModifiedFocusMeteringAction(this.mSessionProcessor, action);
        if (modifiedAction == null) {
            return Futures.immediateFailedFuture(new IllegalStateException("FocusMetering is not supported"));
        }
        return this.mCameraControl.startFocusAndMetering(modifiedAction);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Void> cancelFocusAndMetering() {
        return this.mCameraControl.cancelFocusAndMetering();
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Void> setZoomRatio(float ratio) {
        Range<Float> extensionZoomRange;
        if (!SessionProcessorUtil.isOperationSupported(this.mSessionProcessor, 0)) {
            return Futures.immediateFailedFuture(new IllegalStateException("Zoom is not supported"));
        }
        if (this.mSessionProcessor != null && (extensionZoomRange = this.mSessionProcessor.getExtensionZoomRange()) != null && (ratio < extensionZoomRange.getLower().floatValue() || ratio > extensionZoomRange.getUpper().floatValue())) {
            String outOfRangeDesc = "Requested zoomRatio " + ratio + " is not within valid range [" + extensionZoomRange.getLower() + " , " + extensionZoomRange.getUpper() + "]";
            return Futures.immediateFailedFuture(new IllegalArgumentException(outOfRangeDesc));
        }
        return this.mCameraControl.setZoomRatio(ratio);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Void> setLinearZoom(float linearZoom) {
        if (!SessionProcessorUtil.isOperationSupported(this.mSessionProcessor, 0)) {
            return Futures.immediateFailedFuture(new IllegalStateException("Zoom is not supported"));
        }
        if (this.mSessionProcessor != null) {
            Range<Float> extensionZoomRange = this.mSessionProcessor.getExtensionZoomRange();
            if (extensionZoomRange == null) {
                return this.mCameraControl.setLinearZoom(linearZoom);
            }
            if (linearZoom > 1.0f || linearZoom < 0.0f) {
                String outOfRangeDesc = "Requested linearZoom " + linearZoom + " is not within valid range [0..1]";
                return Futures.immediateFailedFuture(new IllegalArgumentException(outOfRangeDesc));
            }
            float zoomRatio = AdapterCameraInfo.getZoomRatioByPercentage(linearZoom, extensionZoomRange.getLower().floatValue(), extensionZoomRange.getUpper().floatValue());
            return this.mCameraControl.setZoomRatio(zoomRatio);
        }
        return this.mCameraControl.setLinearZoom(linearZoom);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Integer> setExposureCompensationIndex(int value) {
        if (!SessionProcessorUtil.isOperationSupported(this.mSessionProcessor, 7)) {
            return Futures.immediateFailedFuture(new IllegalStateException("ExposureCompensation is not supported"));
        }
        return this.mCameraControl.setExposureCompensationIndex(value);
    }
}
