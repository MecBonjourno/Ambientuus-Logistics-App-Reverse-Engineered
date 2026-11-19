package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.util.Range;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.interop.Camera2CameraInfo;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraState;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ExposureState;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.SessionConfig;
import androidx.camera.core.ZoomState;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LiveData;
import java.util.Collections;
import java.util.Set;

/* carregado de: classes.dex */
public class Camera2PhysicalCameraInfoImpl implements CameraInfo {
    private final Camera2CameraInfo mCamera2CameraInfo = new Camera2CameraInfo(this);
    private final CameraCharacteristicsCompat mCameraCharacteristicsCompat;
    private final String mCameraId;

    @Override // androidx.camera.core.CameraInfo
    public /* sintético */ LiveData getLowLightBoostState() {
        return CameraInfo.CC.$default$getLowLightBoostState(this);
    }

    @Override // androidx.camera.core.CameraInfo
    public /* sintético */ int getMaxTorchStrengthLevel() {
        return CameraInfo.CC.$default$getMaxTorchStrengthLevel(this);
    }

    @Override // androidx.camera.core.CameraInfo
    public /* sintético */ Set getSupportedFrameRateRanges(SessionConfig sessionConfig) {
        Set emptySet;
        emptySet = Collections.emptySet();
        return emptySet;
    }

    @Override // androidx.camera.core.CameraInfo
    public /* sintético */ LiveData getTorchStrengthLevel() {
        return CameraInfo.CC.$default$getTorchStrengthLevel(this);
    }

    @Override // androidx.camera.core.CameraInfo
    public /* sintético */ boolean isFeatureGroupSupported(SessionConfig sessionConfig) {
        return CameraInfo.CC.$default$isFeatureGroupSupported(this, sessionConfig);
    }

    @Override // androidx.camera.core.CameraInfo
    public /* sintético */ boolean isLowLightBoostSupported() {
        return CameraInfo.CC.$default$isLowLightBoostSupported(this);
    }

    @Override // androidx.camera.core.CameraInfo
    public /* sintético */ boolean isTorchStrengthSupported() {
        return CameraInfo.CC.$default$isTorchStrengthSupported(this);
    }

    public Camera2PhysicalCameraInfoImpl(String cameraId, CameraManagerCompat cameraManager) throws CameraAccessExceptionCompat {
        this.mCameraId = cameraId;
        this.mCameraCharacteristicsCompat = cameraManager.getCameraCharacteristicsCompat(this.mCameraId);
    }

    public Camera2CameraInfo getCamera2CameraInfo() {
        return this.mCamera2CameraInfo;
    }

    public String getCameraId() {
        return this.mCameraId;
    }

    public CameraCharacteristicsCompat getCameraCharacteristicsCompat() {
        return this.mCameraCharacteristicsCompat;
    }

    @Override // androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees() {
        return getSensorRotationDegrees(0);
    }

    @Override // androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees(int relativeRotation) {
        int sensorOrientation = getSensorOrientation();
        int relativeRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(relativeRotation);
        int lensFacing = getLensFacing();
        boolean isOppositeFacingScreen = 1 == lensFacing;
        return CameraOrientationUtil.getRelativeImageRotation(relativeRotationDegrees, sensorOrientation, isOppositeFacingScreen);
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean hasFlashUnit() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<Integer> getTorchState() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<ZoomState> getZoomState() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public ExposureState getExposureState() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<CameraState> getCameraState() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public String getImplementationType() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public CameraSelector getCameraSelector() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public int getLensFacing() {
        Integer lensFacing = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.LENS_FACING);
        Preconditions.checkArgument(lensFacing != null, "Unable to get the lens facing of the camera.");
        return LensFacingUtil.getCameraSelectorLensFacing(lensFacing.intValue());
    }

    @Override // androidx.camera.core.CameraInfo
    public float getIntrinsicZoomRatio() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isFocusMeteringSupported(FocusMeteringAction action) {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isZslSupported() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<Range<Integer>> getSupportedFrameRateRanges() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isLogicalMultiCameraSupported() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isPrivateReprocessingSupported() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<DynamicRange> querySupportedDynamicRanges(Set<DynamicRange> candidateDynamicRanges) {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<CameraInfo> getPhysicalCameraInfos() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    @Override // androidx.camera.core.CameraInfo
    public CameraIdentifier getCameraIdentifier() {
        throw new UnsupportedOperationException("Physical camera doesn't support this function");
    }

    int getSensorOrientation() {
        Integer sensorOrientation = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_ORIENTATION);
        Preconditions.checkNotNull(sensorOrientation);
        return sensorOrientation.intValue();
    }
}
