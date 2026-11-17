package androidx.camera.core.impl;

import android.graphics.Rect;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraState;
import androidx.camera.core.CameraUseCaseAdapterProvider;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ExposureState;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.UseCase;
import androidx.camera.core.ZoomState;
import androidx.camera.core.featuregroup.impl.ResolvedFeatureGroup;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.lifecycle.LiveData;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public class ForwardingCameraInfo implements CameraInfoInternal {
    private final CameraInfoInternal mCameraInfoInternal;

    @Override // androidx.camera.core.impl.CameraInfoInternal, androidx.camera.core.CameraInfo
    public /* synthetic */ CameraIdentifier getCameraIdentifier() {
        CameraIdentifier create;
        create = CameraIdentifier.create(getCameraId());
        return create;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isCaptureProcessProgressSupported() {
        return CameraInfoInternal.CC.$default$isCaptureProcessProgressSupported(this);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal, androidx.camera.core.CameraInfo
    public /* synthetic */ boolean isFeatureGroupSupported(androidx.camera.core.SessionConfig sessionConfig) {
        return CameraInfoInternal.CC.$default$isFeatureGroupSupported(this, sessionConfig);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isPostviewSupported() {
        return CameraInfoInternal.CC.$default$isPostviewSupported(this);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isResolvedFeatureGroupSupported(ResolvedFeatureGroup resolvedFeatureGroup, androidx.camera.core.SessionConfig sessionConfig) {
        return CameraInfoInternal.CC.$default$isResolvedFeatureGroupSupported(this, resolvedFeatureGroup, sessionConfig);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isUseCaseCombinationSupported(List list) {
        boolean isUseCaseCombinationSupported;
        isUseCaseCombinationSupported = isUseCaseCombinationSupported(list, 0);
        return isUseCaseCombinationSupported;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isUseCaseCombinationSupported(List list, int i) {
        boolean isUseCaseCombinationSupported;
        isUseCaseCombinationSupported = isUseCaseCombinationSupported(list, i, false);
        return isUseCaseCombinationSupported;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isUseCaseCombinationSupported(List list, int i, boolean z) {
        boolean isUseCaseCombinationSupported;
        isUseCaseCombinationSupported = isUseCaseCombinationSupported(list, i, z, CameraConfigs.defaultConfig());
        return isUseCaseCombinationSupported;
    }

    public ForwardingCameraInfo(CameraInfoInternal cameraInfoInternal) {
        this.mCameraInfoInternal = cameraInfoInternal;
    }

    @Override // androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees() {
        return this.mCameraInfoInternal.getSensorRotationDegrees();
    }

    @Override // androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees(int relativeRotation) {
        return this.mCameraInfoInternal.getSensorRotationDegrees(relativeRotation);
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean hasFlashUnit() {
        return this.mCameraInfoInternal.hasFlashUnit();
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<Integer> getTorchState() {
        return this.mCameraInfoInternal.getTorchState();
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<Integer> getTorchStrengthLevel() {
        return this.mCameraInfoInternal.getTorchStrengthLevel();
    }

    @Override // androidx.camera.core.CameraInfo
    public int getMaxTorchStrengthLevel() {
        return this.mCameraInfoInternal.getMaxTorchStrengthLevel();
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isTorchStrengthSupported() {
        return this.mCameraInfoInternal.isTorchStrengthSupported();
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isLowLightBoostSupported() {
        return this.mCameraInfoInternal.isLowLightBoostSupported();
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<Integer> getLowLightBoostState() {
        return this.mCameraInfoInternal.getLowLightBoostState();
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<ZoomState> getZoomState() {
        return this.mCameraInfoInternal.getZoomState();
    }

    @Override // androidx.camera.core.CameraInfo
    public ExposureState getExposureState() {
        return this.mCameraInfoInternal.getExposureState();
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<CameraState> getCameraState() {
        return this.mCameraInfoInternal.getCameraState();
    }

    @Override // androidx.camera.core.CameraInfo
    public String getImplementationType() {
        return this.mCameraInfoInternal.getImplementationType();
    }

    @Override // androidx.camera.core.CameraInfo
    public int getLensFacing() {
        return this.mCameraInfoInternal.getLensFacing();
    }

    @Override // androidx.camera.core.CameraInfo
    public float getIntrinsicZoomRatio() {
        return this.mCameraInfoInternal.getIntrinsicZoomRatio();
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isFocusMeteringSupported(FocusMeteringAction action) {
        return this.mCameraInfoInternal.isFocusMeteringSupported(action);
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isZslSupported() {
        return this.mCameraInfoInternal.isZslSupported();
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<Range<Integer>> getSupportedFrameRateRanges() {
        return this.mCameraInfoInternal.getSupportedFrameRateRanges();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal, androidx.camera.core.CameraInfo
    public Set<Range<Integer>> getSupportedFrameRateRanges(androidx.camera.core.SessionConfig sessionConfig) {
        return this.mCameraInfoInternal.getSupportedFrameRateRanges(sessionConfig);
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isPrivateReprocessingSupported() {
        return this.mCameraInfoInternal.isPrivateReprocessingSupported();
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isLogicalMultiCameraSupported() {
        return this.mCameraInfoInternal.isLogicalMultiCameraSupported();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public String getCameraId() {
        return this.mCameraInfoInternal.getCameraId();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public void addSessionCaptureCallback(Executor executor, CameraCaptureCallback callback) {
        this.mCameraInfoInternal.addSessionCaptureCallback(executor, callback);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public void removeSessionCaptureCallback(CameraCaptureCallback callback) {
        this.mCameraInfoInternal.removeSessionCaptureCallback(callback);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Quirks getCameraQuirks() {
        return this.mCameraInfoInternal.getCameraQuirks();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public EncoderProfilesProvider getEncoderProfilesProvider() {
        return this.mCameraInfoInternal.getEncoderProfilesProvider();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Timebase getTimebase() {
        return this.mCameraInfoInternal.getTimebase();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<Integer> getSupportedOutputFormats() {
        return this.mCameraInfoInternal.getSupportedOutputFormats();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedResolutions(int format) {
        return this.mCameraInfoInternal.getSupportedResolutions(format);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedHighResolutions(int format) {
        return this.mCameraInfoInternal.getSupportedHighResolutions(format);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<DynamicRange> getSupportedDynamicRanges() {
        return this.mCameraInfoInternal.getSupportedDynamicRanges();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public boolean isHighSpeedSupported() {
        return this.mCameraInfoInternal.isHighSpeedSupported();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<Range<Integer>> getSupportedHighSpeedFrameRateRanges() {
        return this.mCameraInfoInternal.getSupportedHighSpeedFrameRateRanges();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<Range<Integer>> getSupportedHighSpeedFrameRateRangesFor(Size size) {
        return this.mCameraInfoInternal.getSupportedHighSpeedFrameRateRangesFor(size);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedHighSpeedResolutions() {
        return this.mCameraInfoInternal.getSupportedHighSpeedResolutions();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedHighSpeedResolutionsFor(Range<Integer> fpsRange) {
        return this.mCameraInfoInternal.getSupportedHighSpeedResolutionsFor(fpsRange);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Rect getSensorRect() {
        return this.mCameraInfoInternal.getSensorRect();
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<DynamicRange> querySupportedDynamicRanges(Set<DynamicRange> candidateDynamicRanges) {
        return this.mCameraInfoInternal.querySupportedDynamicRanges(candidateDynamicRanges);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public CameraInfoInternal getImplementation() {
        return this.mCameraInfoInternal.getImplementation();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal, androidx.camera.core.CameraInfo
    public CameraSelector getCameraSelector() {
        return this.mCameraInfoInternal.getCameraSelector();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public boolean isPreviewStabilizationSupported() {
        return this.mCameraInfoInternal.isPreviewStabilizationSupported();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public boolean isVideoStabilizationSupported() {
        return this.mCameraInfoInternal.isVideoStabilizationSupported();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Object getCameraCharacteristics() {
        return this.mCameraInfoInternal.getCameraCharacteristics();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Object getPhysicalCameraCharacteristics(String physicalCameraId) {
        return this.mCameraInfoInternal.getPhysicalCameraCharacteristics(physicalCameraId);
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<CameraInfo> getPhysicalCameraInfos() {
        return this.mCameraInfoInternal.getPhysicalCameraInfos();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public boolean isUseCaseCombinationSupported(List<UseCase> useCases, int cameraMode, boolean isFeatureComboInvocation, CameraConfig cameraConfig) {
        return this.mCameraInfoInternal.isUseCaseCombinationSupported(useCases, cameraMode, isFeatureComboInvocation, cameraConfig);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public void setCameraUseCaseAdapterProvider(CameraUseCaseAdapterProvider cameraUseCaseAdapterProvider) {
        this.mCameraInfoInternal.setCameraUseCaseAdapterProvider(cameraUseCaseAdapterProvider);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<Integer> getAvailableCapabilities() {
        return this.mCameraInfoInternal.getAvailableCapabilities();
    }
}
