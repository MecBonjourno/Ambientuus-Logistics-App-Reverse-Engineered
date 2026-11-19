package androidx.camera.core.streamsharing;

import androidx.camera.core.Camera;
import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraConfigs;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.streamsharing.StreamSharing;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Collection;

/* carregado de: classes.dex */
class VirtualCamera implements CameraInternal {
    private static final String UNSUPPORTED_MESSAGE = "Operation not supported by VirtualCamera.";
    private final CameraInternal mParentCamera;
    private final UseCase.StateChangeCallback mStateChangeCallback;
    private final VirtualCameraControl mVirtualCameraControl;
    private final VirtualCameraInfo mVirtualCameraInfo;

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public /* sintético */ CameraControl getCameraControl() {
        CameraControl cameraControlInternal;
        cameraControlInternal = getCameraControlInternal();
        return cameraControlInternal;
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public /* sintético */ CameraInfo getCameraInfo() {
        CameraInfo cameraInfoInternal;
        cameraInfoInternal = getCameraInfoInternal();
        return cameraInfoInternal;
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public /* sintético */ CameraConfig getExtendedConfig() {
        CameraConfig defaultConfig;
        defaultConfig = CameraConfigs.defaultConfig();
        return defaultConfig;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public /* sintético */ boolean isFrontFacing() {
        return CameraInternal.CC.$default$isFrontFacing(this);
    }

    @Override // androidx.camera.core.Camera
    public /* sintético */ boolean isUseCasesCombinationSupported(boolean z, UseCase... useCaseArr) {
        return Camera.CC.$default$isUseCasesCombinationSupported(this, z, useCaseArr);
    }

    @Override // androidx.camera.core.Camera
    public /* sintético */ boolean isUseCasesCombinationSupported(UseCase... useCaseArr) {
        boolean isUseCasesCombinationSupported;
        isUseCasesCombinationSupported = isUseCasesCombinationSupported(true, useCaseArr);
        return isUseCasesCombinationSupported;
    }

    @Override // androidx.camera.core.Camera
    public /* sintético */ boolean isUseCasesCombinationSupportedByFramework(UseCase... useCaseArr) {
        boolean isUseCasesCombinationSupported;
        isUseCasesCombinationSupported = isUseCasesCombinationSupported(false, useCaseArr);
        return isUseCasesCombinationSupported;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public /* sintético */ void onRemoved() {
        CameraInternal.CC.$default$onRemoved(this);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public /* sintético */ void setActiveResumingMode(boolean z) {
        CameraInternal.CC.$default$setActiveResumingMode(this, z);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public /* sintético */ void setExtendedConfig(CameraConfig cameraConfig) {
        CameraInternal.CC.$default$setExtendedConfig(this, cameraConfig);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public /* sintético */ void setPrimary(boolean z) {
        CameraInternal.CC.$default$setPrimary(this, z);
    }

    VirtualCamera(CameraInternal parentCamera, UseCase.StateChangeCallback useCaseStateCallback, StreamSharing.Control streamSharingControl) {
        this.mParentCamera = parentCamera;
        this.mStateChangeCallback = useCaseStateCallback;
        this.mVirtualCameraControl = new VirtualCameraControl(parentCamera.getCameraControlInternal(), streamSharingControl);
        this.mVirtualCameraInfo = new VirtualCameraInfo(parentCamera.getCameraInfoInternal());
    }

    void setRotationDegrees(int sensorRotationDegrees) {
        this.mVirtualCameraInfo.setVirtualCameraRotationDegrees(sensorRotationDegrees);
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseActive(UseCase useCase) {
        Threads.checkMainThread();
        this.mStateChangeCallback.onUseCaseActive(useCase);
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseInactive(UseCase useCase) {
        Threads.checkMainThread();
        this.mStateChangeCallback.onUseCaseInactive(useCase);
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseUpdated(UseCase useCase) {
        Threads.checkMainThread();
        this.mStateChangeCallback.onUseCaseUpdated(useCase);
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseReset(UseCase useCase) {
        Threads.checkMainThread();
        this.mStateChangeCallback.onUseCaseReset(useCase);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public boolean getHasTransform() {
        return false;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraControlInternal getCameraControlInternal() {
        return this.mVirtualCameraControl;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraInfoInternal getCameraInfoInternal() {
        return this.mVirtualCameraInfo;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public Observable<CameraInternal.State> getCameraState() {
        return this.mParentCamera.getCameraState();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void open() {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void close() {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public ListenableFuture<Void> release() {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void attachUseCases(Collection<UseCase> useCases) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void detachUseCases(Collection<UseCase> useCases) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }
}
