package androidx.camera.camera2.internal;

import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import android.util.Pair;
import android.util.Range;
import android.util.Size;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.camera2.internal.compat.quirk.CameraQuirks;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.ZslDisablerQuirk;
import androidx.camera.camera2.internal.compat.workaround.FlashAvailabilityChecker;
import androidx.camera.camera2.interop.Camera2CameraInfo;
import androidx.camera.core.CameraFilter;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraState;
import androidx.camera.core.CameraUseCaseAdapterProvider;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ExposureState;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.Logger;
import androidx.camera.core.SessionConfig;
import androidx.camera.core.UseCase;
import androidx.camera.core.ZoomState;
import androidx.camera.core.featuregroup.impl.ResolvedFeatureGroup;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraConfigs;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.DynamicRanges;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.LensFacingCameraFilter;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.UseCaseAdditionSimulator;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.camera.core.impl.utils.RedirectableLiveData;
import androidx.camera.core.internal.StreamSpecsCalculator;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LiveData;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class Camera2CameraInfoImpl implements CameraInfoInternal {
    private static final String TAG = "Camera2CameraInfo";
    private Camera2CameraControlImpl mCamera2CameraControlImpl;
    private final Camera2CameraInfo mCamera2CameraInfo;
    private final EncoderProfilesProvider mCamera2EncoderProfilesProvider;
    private List<Pair<CameraCaptureCallback, Executor>> mCameraCaptureCallbacks;
    private final CameraCharacteristicsCompat mCameraCharacteristicsCompat;
    private final String mCameraId;
    private final CameraManagerCompat mCameraManager;
    private final Quirks mCameraQuirks;
    private final RedirectableLiveData<CameraState> mCameraStateLiveData;
    private final Object mLock;
    private Set<CameraInfo> mPhysicalCameraInfos;
    private RedirectableLiveData<Integer> mRedirectLowLightBoostStateLiveData;
    private RedirectableLiveData<Integer> mRedirectTorchStateLiveData;
    private RedirectableLiveData<Integer> mRedirectTorchStrengthLiveData;
    private RedirectableLiveData<ZoomState> mRedirectZoomStateLiveData;
    private final StreamSpecsCalculator mStreamSpecsCalculator;

    @Override // androidx.camera.core.impl.CameraInfoInternal, androidx.camera.core.CameraInfo
    public /* synthetic */ CameraIdentifier getCameraIdentifier() {
        CameraIdentifier create;
        create = CameraIdentifier.create(getCameraId());
        return create;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal, androidx.camera.core.CameraInfo
    public /* synthetic */ CameraSelector getCameraSelector() {
        CameraSelector build;
        build = new CameraSelector.Builder().addCameraFilter(new CameraFilter() { // from class: androidx.camera.core.impl.CameraInfoInternal$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.CameraFilter
            public final List filter(List list) {
                return CameraInfoInternal.CC.$private$lambda$getCameraSelector$0(CameraInfoInternal.this, list);
            }

            @Override // androidx.camera.core.CameraFilter
            public /* synthetic */ Identifier getIdentifier() {
                Identifier identifier;
                identifier = CameraFilter.DEFAULT_ID;
                return identifier;
            }
        }).addCameraFilter(new LensFacingCameraFilter(getLensFacing())).build();
        return build;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ CameraInfoInternal getImplementation() {
        return CameraInfoInternal.CC.$default$getImplementation(this);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal, androidx.camera.core.CameraInfo
    public /* synthetic */ Set getSupportedFrameRateRanges(SessionConfig sessionConfig) {
        return CameraInfoInternal.CC.$default$getSupportedFrameRateRanges(this, sessionConfig);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isCaptureProcessProgressSupported() {
        return CameraInfoInternal.CC.$default$isCaptureProcessProgressSupported(this);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal, androidx.camera.core.CameraInfo
    public /* synthetic */ boolean isFeatureGroupSupported(SessionConfig sessionConfig) {
        return CameraInfoInternal.CC.$default$isFeatureGroupSupported(this, sessionConfig);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isPostviewSupported() {
        return CameraInfoInternal.CC.$default$isPostviewSupported(this);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ boolean isResolvedFeatureGroupSupported(ResolvedFeatureGroup resolvedFeatureGroup, SessionConfig sessionConfig) {
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

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public /* synthetic */ void setCameraUseCaseAdapterProvider(CameraUseCaseAdapterProvider cameraUseCaseAdapterProvider) {
        UseCaseAdditionSimulator.setCameraUseCaseAdapterProvider(cameraUseCaseAdapterProvider);
    }

    public Camera2CameraInfoImpl(String cameraId, CameraManagerCompat cameraManager) throws CameraAccessExceptionCompat {
        this(cameraId, cameraManager, StreamSpecsCalculator.NO_OP_STREAM_SPECS_CALCULATOR);
    }

    public Camera2CameraInfoImpl(String cameraId, CameraManagerCompat cameraManager, StreamSpecsCalculator streamSpecsCalculator) throws CameraAccessExceptionCompat {
        this.mLock = new Object();
        this.mRedirectTorchStateLiveData = null;
        this.mRedirectTorchStrengthLiveData = null;
        this.mRedirectLowLightBoostStateLiveData = null;
        this.mRedirectZoomStateLiveData = null;
        this.mCameraCaptureCallbacks = null;
        this.mCameraId = (String) Preconditions.checkNotNull(cameraId);
        this.mCameraManager = cameraManager;
        this.mCameraCharacteristicsCompat = cameraManager.getCameraCharacteristicsCompat(this.mCameraId);
        this.mCamera2CameraInfo = new Camera2CameraInfo(this);
        this.mCameraQuirks = CameraQuirks.get(cameraId, this.mCameraCharacteristicsCompat);
        this.mCamera2EncoderProfilesProvider = new Camera2EncoderProfilesProvider(cameraId, this.mCameraQuirks);
        this.mCameraStateLiveData = new RedirectableLiveData<>(CameraState.create(CameraState.Type.CLOSED));
        this.mStreamSpecsCalculator = streamSpecsCalculator;
    }

    void linkWithCameraControl(Camera2CameraControlImpl camera2CameraControlImpl) {
        synchronized (this.mLock) {
            this.mCamera2CameraControlImpl = camera2CameraControlImpl;
            if (this.mRedirectZoomStateLiveData != null) {
                this.mRedirectZoomStateLiveData.redirectTo(this.mCamera2CameraControlImpl.getZoomControl().getZoomState());
            }
            if (this.mRedirectTorchStateLiveData != null) {
                this.mRedirectTorchStateLiveData.redirectTo(this.mCamera2CameraControlImpl.getTorchControl().getTorchState());
            }
            if (this.mRedirectTorchStrengthLiveData != null) {
                this.mRedirectTorchStrengthLiveData.redirectTo(this.mCamera2CameraControlImpl.getTorchControl().getTorchStrengthLevel());
            }
            if (this.mRedirectLowLightBoostStateLiveData != null) {
                this.mRedirectLowLightBoostStateLiveData.redirectTo(this.mCamera2CameraControlImpl.getLowLightBoostControl().getLowLightBoostState());
            }
            if (this.mCameraCaptureCallbacks != null) {
                for (Pair<CameraCaptureCallback, Executor> pair : this.mCameraCaptureCallbacks) {
                    this.mCamera2CameraControlImpl.addSessionCameraCaptureCallback((Executor) pair.second, (CameraCaptureCallback) pair.first);
                }
                this.mCameraCaptureCallbacks = null;
            }
        }
        logDeviceInfo();
    }

    void setCameraStateSource(LiveData<CameraState> cameraStateSource) {
        this.mCameraStateLiveData.redirectTo(cameraStateSource);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public String getCameraId() {
        return this.mCameraId;
    }

    public CameraCharacteristicsCompat getCameraCharacteristicsCompat() {
        return this.mCameraCharacteristicsCompat;
    }

    @Override // androidx.camera.core.CameraInfo
    public int getLensFacing() {
        Integer lensFacing = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.LENS_FACING);
        Preconditions.checkArgument(lensFacing != null, "Unable to get the lens facing of the camera.");
        return LensFacingUtil.getCameraSelectorLensFacing(lensFacing.intValue());
    }

    @Override // androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees(int relativeRotation) {
        int sensorOrientation = getSensorOrientation();
        int relativeRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(relativeRotation);
        int lensFacing = getLensFacing();
        boolean isOppositeFacingScreen = 1 == lensFacing;
        return CameraOrientationUtil.getRelativeImageRotation(relativeRotationDegrees, sensorOrientation, isOppositeFacingScreen);
    }

    int getSensorOrientation() {
        Integer sensorOrientation = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_ORIENTATION);
        Preconditions.checkNotNull(sensorOrientation);
        return sensorOrientation.intValue();
    }

    int getSupportedHardwareLevel() {
        Integer deviceLevel = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        Preconditions.checkNotNull(deviceLevel);
        return deviceLevel.intValue();
    }

    @Override // androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees() {
        return getSensorRotationDegrees(0);
    }

    private void logDeviceInfo() {
        logDeviceLevel();
    }

    private void logDeviceLevel() {
        String levelString;
        int deviceLevel = getSupportedHardwareLevel();
        switch (deviceLevel) {
            case 0:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_LIMITED";
                break;
            case 1:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_FULL";
                break;
            case 2:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_LEGACY";
                break;
            case 3:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_3";
                break;
            case 4:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_EXTERNAL";
                break;
            default:
                levelString = "Unknown value: " + deviceLevel;
                break;
        }
        Logger.i(TAG, "Device Level: " + levelString);
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean hasFlashUnit() {
        CameraCharacteristicsCompat cameraCharacteristicsCompat = this.mCameraCharacteristicsCompat;
        Objects.requireNonNull(cameraCharacteristicsCompat);
        return FlashAvailabilityChecker.isFlashAvailable(new Camera2CameraInfoImpl$$ExternalSyntheticLambda0(cameraCharacteristicsCompat));
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<Integer> getTorchState() {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                if (this.mRedirectTorchStateLiveData == null) {
                    this.mRedirectTorchStateLiveData = new RedirectableLiveData<>(0);
                }
                return this.mRedirectTorchStateLiveData;
            }
            if (this.mRedirectTorchStateLiveData != null) {
                return this.mRedirectTorchStateLiveData;
            }
            return this.mCamera2CameraControlImpl.getTorchControl().getTorchState();
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isLowLightBoostSupported() {
        return LowLightBoostControl.checkLowLightBoostAvailability(this.mCameraCharacteristicsCompat);
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<Integer> getLowLightBoostState() {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                if (this.mRedirectLowLightBoostStateLiveData == null) {
                    this.mRedirectLowLightBoostStateLiveData = new RedirectableLiveData<>(-1);
                }
                return this.mRedirectLowLightBoostStateLiveData;
            }
            if (this.mRedirectLowLightBoostStateLiveData != null) {
                return this.mRedirectLowLightBoostStateLiveData;
            }
            return this.mCamera2CameraControlImpl.getLowLightBoostControl().getLowLightBoostState();
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<ZoomState> getZoomState() {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                if (this.mRedirectZoomStateLiveData == null) {
                    this.mRedirectZoomStateLiveData = new RedirectableLiveData<>(ZoomControl.getDefaultZoomState(this.mCameraCharacteristicsCompat));
                }
                return this.mRedirectZoomStateLiveData;
            }
            if (this.mRedirectZoomStateLiveData != null) {
                return this.mRedirectZoomStateLiveData;
            }
            return this.mCamera2CameraControlImpl.getZoomControl().getZoomState();
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public ExposureState getExposureState() {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                return ExposureControl.getDefaultExposureState(this.mCameraCharacteristicsCompat);
            }
            return this.mCamera2CameraControlImpl.getExposureControl().getExposureState();
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<CameraState> getCameraState() {
        return this.mCameraStateLiveData;
    }

    @Override // androidx.camera.core.CameraInfo
    public String getImplementationType() {
        int hardwareLevel = getSupportedHardwareLevel();
        return hardwareLevel == 2 ? CameraInfo.IMPLEMENTATION_TYPE_CAMERA2_LEGACY : CameraInfo.IMPLEMENTATION_TYPE_CAMERA2;
    }

    @Override // androidx.camera.core.CameraInfo
    public float getIntrinsicZoomRatio() {
        Integer lensFacing = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.LENS_FACING);
        if (lensFacing == null) {
            return 1.0f;
        }
        try {
            int fovDegrees = FovUtil.focalLengthToViewAngleDegrees(FovUtil.getDefaultFocalLength(this.mCameraCharacteristicsCompat), FovUtil.getSensorHorizontalLength(this.mCameraCharacteristicsCompat));
            int defaultFovDegrees = FovUtil.getDeviceDefaultViewAngleDegrees(this.mCameraManager, lensFacing.intValue());
            return defaultFovDegrees / fovDegrees;
        } catch (Exception e) {
            Logger.e(TAG, "The camera is unable to provide necessary information to resolve its intrinsic zoom ratio with error: " + e);
            return 1.0f;
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isFocusMeteringSupported(FocusMeteringAction action) {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                return false;
            }
            return this.mCamera2CameraControlImpl.getFocusMeteringControl().isFocusMeteringSupported(action);
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isZslSupported() {
        return isPrivateReprocessingSupported() && DeviceQuirks.get(ZslDisablerQuirk.class) == null;
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isPrivateReprocessingSupported() {
        return ZslUtil.isCapabilitySupported(this.mCameraCharacteristicsCompat, 4);
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isLogicalMultiCameraSupported() {
        return ZslUtil.isCapabilitySupported(this.mCameraCharacteristicsCompat, 11);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public EncoderProfilesProvider getEncoderProfilesProvider() {
        return this.mCamera2EncoderProfilesProvider;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Timebase getTimebase() {
        Integer timeSource = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_INFO_TIMESTAMP_SOURCE);
        Preconditions.checkNotNull(timeSource);
        switch (timeSource.intValue()) {
            case 1:
                return Timebase.REALTIME;
            default:
                return Timebase.UPTIME;
        }
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<Integer> getSupportedOutputFormats() {
        StreamConfigurationMapCompat mapCompat = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat();
        int[] formats = mapCompat.getOutputFormats();
        if (formats == null) {
            return new HashSet();
        }
        Set<Integer> result = new HashSet<>();
        for (int format : formats) {
            result.add(Integer.valueOf(format));
        }
        return result;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedResolutions(int format) {
        StreamConfigurationMapCompat mapCompat = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat();
        Size[] size = mapCompat.getOutputSizes(format);
        return size != null ? Arrays.asList(size) : Collections.emptyList();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedHighResolutions(int format) {
        StreamConfigurationMapCompat mapCompat = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat();
        Size[] size = mapCompat.getHighResolutionOutputSizes(format);
        return size != null ? Arrays.asList(size) : Collections.emptyList();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<DynamicRange> getSupportedDynamicRanges() {
        DynamicRangesCompat dynamicRangesCompat = DynamicRangesCompat.fromCameraCharacteristics(this.mCameraCharacteristicsCompat);
        return dynamicRangesCompat.getSupportedDynamicRanges();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public boolean isHighSpeedSupported() {
        return ZslUtil.isCapabilitySupported(this.mCameraCharacteristicsCompat, 9);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<Range<Integer>> getSupportedHighSpeedFrameRateRanges() {
        Range<Integer>[] ranges = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat().getHighSpeedVideoFpsRanges();
        return ranges != null ? new HashSet(Arrays.asList(ranges)) : Collections.emptySet();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<Range<Integer>> getSupportedHighSpeedFrameRateRangesFor(Size size) {
        Range<Integer>[] ranges = null;
        try {
            ranges = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat().getHighSpeedVideoFpsRangesFor(size);
        } catch (IllegalArgumentException e) {
            Logger.w(TAG, "Can't get high speed frame rate ranges for " + size, e);
        }
        return ranges != null ? new HashSet(Arrays.asList(ranges)) : Collections.emptySet();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedHighSpeedResolutions() {
        Size[] sizes = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat().getHighSpeedVideoSizes();
        return sizes != null ? Arrays.asList(sizes) : Collections.emptyList();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedHighSpeedResolutionsFor(Range<Integer> fpsRange) {
        Size[] sizes = null;
        try {
            sizes = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat().getHighSpeedVideoSizesFor(fpsRange);
        } catch (IllegalArgumentException e) {
            Logger.w(TAG, "Can't get high speed resolutions for " + fpsRange, e);
        }
        return sizes != null ? Arrays.asList(sizes) : Collections.emptyList();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Rect getSensorRect() {
        Rect sensorRect = (Rect) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE);
        if ("robolectric".equals(Build.FINGERPRINT) && sensorRect == null) {
            return new Rect(0, 0, 4000, 3000);
        }
        return (Rect) Preconditions.checkNotNull(sensorRect);
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<DynamicRange> querySupportedDynamicRanges(Set<DynamicRange> candidateDynamicRanges) {
        return DynamicRanges.findAllPossibleMatches(candidateDynamicRanges, getSupportedDynamicRanges());
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public void addSessionCaptureCallback(Executor executor, CameraCaptureCallback callback) {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                if (this.mCameraCaptureCallbacks == null) {
                    this.mCameraCaptureCallbacks = new ArrayList();
                }
                this.mCameraCaptureCallbacks.add(new Pair<>(callback, executor));
                return;
            }
            this.mCamera2CameraControlImpl.addSessionCameraCaptureCallback(executor, callback);
        }
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public void removeSessionCaptureCallback(CameraCaptureCallback callback) {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                if (this.mCameraCaptureCallbacks == null) {
                    return;
                }
                Iterator<Pair<CameraCaptureCallback, Executor>> it = this.mCameraCaptureCallbacks.iterator();
                while (it.hasNext()) {
                    Pair<CameraCaptureCallback, Executor> pair = it.next();
                    if (pair.first == callback) {
                        it.remove();
                    }
                }
                return;
            }
            this.mCamera2CameraControlImpl.removeSessionCameraCaptureCallback(callback);
        }
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Quirks getCameraQuirks() {
        return this.mCameraQuirks;
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<Range<Integer>> getSupportedFrameRateRanges() {
        Range<Integer>[] availableTargetFpsRanges = (Range[]) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
        if (availableTargetFpsRanges != null) {
            return new HashSet(Arrays.asList(availableTargetFpsRanges));
        }
        return Collections.emptySet();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public boolean isVideoStabilizationSupported() {
        int[] availableVideoStabilizationModes = (int[]) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES);
        if (availableVideoStabilizationModes != null) {
            for (int mode : availableVideoStabilizationModes) {
                if (mode == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public boolean isPreviewStabilizationSupported() {
        return VideoStabilizationUtil.isPreviewStabilizationSupported(this.mCameraCharacteristicsCompat);
    }

    public Camera2CameraInfo getCamera2CameraInfo() {
        return this.mCamera2CameraInfo;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Object getCameraCharacteristics() {
        return this.mCameraCharacteristicsCompat.toCameraCharacteristics();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Object getPhysicalCameraCharacteristics(String physicalCameraId) {
        try {
            if (!this.mCameraCharacteristicsCompat.getPhysicalCameraIds().contains(physicalCameraId)) {
                return null;
            }
            return this.mCameraManager.getCameraCharacteristicsCompat(physicalCameraId).toCameraCharacteristics();
        } catch (CameraAccessExceptionCompat e) {
            Logger.e(TAG, "Failed to get CameraCharacteristics for cameraId " + physicalCameraId, e);
            return null;
        }
    }

    public Map<String, CameraCharacteristics> getCameraCharacteristicsMap() {
        LinkedHashMap<String, CameraCharacteristics> map = new LinkedHashMap<>();
        map.put(this.mCameraId, this.mCameraCharacteristicsCompat.toCameraCharacteristics());
        for (String physicalCameraId : this.mCameraCharacteristicsCompat.getPhysicalCameraIds()) {
            if (!Objects.equals(physicalCameraId, this.mCameraId)) {
                try {
                    map.put(physicalCameraId, this.mCameraManager.getCameraCharacteristicsCompat(physicalCameraId).toCameraCharacteristics());
                } catch (CameraAccessExceptionCompat e) {
                    Logger.e(TAG, "Failed to get CameraCharacteristics for cameraId " + physicalCameraId, e);
                }
            }
        }
        return map;
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<CameraInfo> getPhysicalCameraInfos() {
        if (this.mPhysicalCameraInfos == null) {
            this.mPhysicalCameraInfos = new HashSet();
            for (String physicalCameraId : this.mCameraCharacteristicsCompat.getPhysicalCameraIds()) {
                try {
                    CameraInfo physicalCameraInfo = new Camera2PhysicalCameraInfoImpl(physicalCameraId, this.mCameraManager);
                    this.mPhysicalCameraInfos.add(physicalCameraInfo);
                } catch (CameraAccessExceptionCompat e) {
                    Logger.e(TAG, "Failed to get CameraCharacteristics for cameraId " + physicalCameraId, e);
                    return Collections.emptySet();
                }
            }
        }
        return this.mPhysicalCameraInfos;
    }

    @Override // androidx.camera.core.CameraInfo
    public int getMaxTorchStrengthLevel() {
        if (isTorchStrengthSupported()) {
            return this.mCameraCharacteristicsCompat.getMaxTorchStrengthLevel();
        }
        return 0;
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<Integer> getTorchStrengthLevel() {
        int i;
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                if (this.mRedirectTorchStrengthLiveData == null) {
                    if (isTorchStrengthSupported()) {
                        i = this.mCameraCharacteristicsCompat.getDefaultTorchStrengthLevel();
                    } else {
                        i = 0;
                    }
                    this.mRedirectTorchStrengthLiveData = new RedirectableLiveData<>(Integer.valueOf(i));
                }
                return this.mRedirectTorchStrengthLiveData;
            }
            if (this.mRedirectTorchStrengthLiveData != null) {
                return this.mRedirectTorchStrengthLiveData;
            }
            return this.mCamera2CameraControlImpl.getTorchControl().getTorchStrengthLevel();
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isTorchStrengthSupported() {
        return this.mCameraCharacteristicsCompat.isTorchStrengthLevelSupported();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public boolean isUseCaseCombinationSupported(List<UseCase> useCases, int cameraMode, boolean isFeatureComboInvocation, CameraConfig cameraConfig) {
        IllegalArgumentException e;
        try {
        } catch (IllegalArgumentException e2) {
            e = e2;
        }
        try {
            StreamSpecsCalculator.INSTANCE.calculateSuggestedStreamSpecsCompat(this.mStreamSpecsCalculator, cameraMode, this, useCases, cameraConfig, isFeatureComboInvocation);
            return true;
        } catch (IllegalArgumentException e3) {
            e = e3;
            Logger.d(TAG, "isUseCaseCombinationSupported: calculateSuggestedStreamSpecs failed", e);
            return false;
        }
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<Integer> getAvailableCapabilities() {
        Set<Integer> capabilitySet = new HashSet<>();
        int[] capabilities = (int[]) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES);
        if (capabilities != null) {
            for (int capability : capabilities) {
                capabilitySet.add(Integer.valueOf(capability));
            }
        }
        return capabilitySet;
    }
}
