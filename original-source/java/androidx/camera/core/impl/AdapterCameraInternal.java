package androidx.camera.core.impl;

import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraInternal;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Collection;

/* loaded from: classes.dex */
public class AdapterCameraInternal implements CameraInternal {
    private final AdapterCameraControl mAdapterCameraControl;
    private final AdapterCameraInfo mAdapterCameraInfo;
    private final CameraInternal mCameraInternal;

    @Override // androidx.camera.core.impl.CameraInternal
    public /* synthetic */ void onRemoved() {
        CameraInternal.CC.$default$onRemoved(this);
    }

    public AdapterCameraInternal(CameraInternal cameraInternal, AdapterCameraInfo adapterCameraInfo) {
        this.mCameraInternal = cameraInternal;
        this.mAdapterCameraInfo = adapterCameraInfo;
        CameraConfig cameraConfig = this.mAdapterCameraInfo.getCameraConfig();
        this.mAdapterCameraControl = new AdapterCameraControl(this.mCameraInternal.getCameraControlInternal(), cameraConfig.getSessionProcessor(null));
    }

    public CameraInternal getImplementation() {
        return this.mCameraInternal;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void open() {
        this.mCameraInternal.open();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void close() {
        this.mCameraInternal.close();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void setActiveResumingMode(boolean enabled) {
        this.mCameraInternal.setActiveResumingMode(enabled);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public boolean isFrontFacing() {
        return this.mCameraInternal.isFrontFacing();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public ListenableFuture<Void> release() {
        return this.mCameraInternal.release();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public Observable<CameraInternal.State> getCameraState() {
        return this.mCameraInternal.getCameraState();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void attachUseCases(Collection<UseCase> useCases) {
        this.mCameraInternal.attachUseCases(useCases);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void detachUseCases(Collection<UseCase> useCases) {
        this.mCameraInternal.detachUseCases(useCases);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraControlInternal getCameraControlInternal() {
        return this.mAdapterCameraControl;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraInfoInternal getCameraInfoInternal() {
        return this.mAdapterCameraInfo;
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public CameraControl getCameraControl() {
        return this.mAdapterCameraControl;
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public CameraInfo getCameraInfo() {
        return this.mAdapterCameraInfo;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public boolean getHasTransform() {
        return this.mCameraInternal.getHasTransform();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void setPrimary(boolean isPrimary) {
        this.mCameraInternal.setPrimary(isPrimary);
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public CameraConfig getExtendedConfig() {
        return this.mCameraInternal.getExtendedConfig();
    }

    @Override // androidx.camera.core.Camera
    public boolean isUseCasesCombinationSupported(UseCase... useCases) {
        return this.mCameraInternal.isUseCasesCombinationSupported(useCases);
    }

    @Override // androidx.camera.core.Camera
    public boolean isUseCasesCombinationSupportedByFramework(UseCase... useCases) {
        return this.mCameraInternal.isUseCasesCombinationSupportedByFramework(useCases);
    }

    @Override // androidx.camera.core.Camera
    public boolean isUseCasesCombinationSupported(boolean withStreamSharing, UseCase... useCases) {
        return this.mCameraInternal.isUseCasesCombinationSupported(withStreamSharing, useCases);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void setExtendedConfig(CameraConfig cameraConfig) {
        this.mCameraInternal.setExtendedConfig(cameraConfig);
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseActive(UseCase useCase) {
        this.mCameraInternal.onUseCaseActive(useCase);
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseInactive(UseCase useCase) {
        this.mCameraInternal.onUseCaseInactive(useCase);
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseUpdated(UseCase useCase) {
        this.mCameraInternal.onUseCaseUpdated(useCase);
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseReset(UseCase useCase) {
        this.mCameraInternal.onUseCaseReset(useCase);
    }
}
