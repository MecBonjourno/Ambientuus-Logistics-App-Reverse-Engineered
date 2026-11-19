package androidx.camera.core.impl;

import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.imagecapture.CameraCapturePipeline;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.SessionConfig;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.List;

/* carregado de: classes.dex */
public class ForwardingCameraControl implements CameraControlInternal {
    private final CameraControlInternal mCameraControlInternal;

    @Override // androidx.camera.core.impl.CameraControlInternal
    public /* sintético */ void setLowLightBoostDisabledByUseCaseSessionConfig(boolean z) {
        CameraControlInternal.CC.$default$setLowLightBoostDisabledByUseCaseSessionConfig(this, z);
    }

    public ForwardingCameraControl(CameraControlInternal cameraControlInternal) {
        this.mCameraControlInternal = cameraControlInternal;
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> enableTorch(boolean torch) {
        return this.mCameraControlInternal.enableTorch(torch);
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> enableLowLightBoostAsync(boolean lowLightBoost) {
        return this.mCameraControlInternal.enableLowLightBoostAsync(lowLightBoost);
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action) {
        return this.mCameraControlInternal.startFocusAndMetering(action);
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> cancelFocusAndMetering() {
        return this.mCameraControlInternal.cancelFocusAndMetering();
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> setZoomRatio(float ratio) {
        return this.mCameraControlInternal.setZoomRatio(ratio);
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> setLinearZoom(float linearZoom) {
        return this.mCameraControlInternal.setLinearZoom(linearZoom);
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Integer> setExposureCompensationIndex(int value) {
        return this.mCameraControlInternal.setExposureCompensationIndex(value);
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> setTorchStrengthLevel(int torchStrengthLevel) {
        return this.mCameraControlInternal.setTorchStrengthLevel(torchStrengthLevel);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public int getFlashMode() {
        return this.mCameraControlInternal.getFlashMode();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void setFlashMode(int flashMode) {
        this.mCameraControlInternal.setFlashMode(flashMode);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void setScreenFlash(ImageCapture.ScreenFlash screenFlash) {
        this.mCameraControlInternal.setScreenFlash(screenFlash);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void addZslConfig(SessionConfig.Builder sessionConfigBuilder) {
        this.mCameraControlInternal.addZslConfig(sessionConfigBuilder);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void clearZslConfig() {
        this.mCameraControlInternal.clearZslConfig();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void setZslDisabledByUserCaseConfig(boolean disabled) {
        this.mCameraControlInternal.setZslDisabledByUserCaseConfig(disabled);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public boolean isZslDisabledByByUserCaseConfig() {
        return this.mCameraControlInternal.isZslDisabledByByUserCaseConfig();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public ListenableFuture<List<Void>> submitStillCaptureRequests(List<CaptureConfig> captureConfigs, int captureMode, int flashType) {
        return this.mCameraControlInternal.submitStillCaptureRequests(captureConfigs, captureMode, flashType);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public ListenableFuture<CameraCapturePipeline> getCameraCapturePipelineAsync(int captureMode, int flashType) {
        return this.mCameraControlInternal.getCameraCapturePipelineAsync(captureMode, flashType);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public SessionConfig getSessionConfig() {
        return this.mCameraControlInternal.getSessionConfig();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void addInteropConfig(Config config) {
        this.mCameraControlInternal.addInteropConfig(config);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void clearInteropConfig() {
        this.mCameraControlInternal.clearInteropConfig();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public Config getInteropConfig() {
        return this.mCameraControlInternal.getInteropConfig();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public CameraControlInternal getImplementation() {
        return this.mCameraControlInternal.getImplementation();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void incrementVideoUsage() {
        this.mCameraControlInternal.incrementVideoUsage();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void decrementVideoUsage() {
        this.mCameraControlInternal.decrementVideoUsage();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public boolean isInVideoUsage() {
        return this.mCameraControlInternal.isInVideoUsage();
    }
}
