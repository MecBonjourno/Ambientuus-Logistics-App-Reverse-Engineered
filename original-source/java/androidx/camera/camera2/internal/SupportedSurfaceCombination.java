package androidx.camera.camera2.internal;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.media.CamcorderProfile;
import android.media.MediaRecorder;
import android.os.Build;
import android.util.Pair;
import android.util.Range;
import android.util.Rational;
import android.util.Size;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.camera2.internal.compat.workaround.ExtraSupportedSurfaceCombinationsContainer;
import androidx.camera.camera2.internal.compat.workaround.ResolutionCorrector;
import androidx.camera.camera2.internal.compat.workaround.TargetAspectRatio;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.featuregroup.impl.FeatureCombinationQuery;
import androidx.camera.core.featuregroup.impl.feature.FpsRangeFeature;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.CameraMode;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.SurfaceCombination;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.SurfaceSizeDefinition;
import androidx.camera.core.impl.SurfaceStreamSpecQueryResult;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.utils.AspectRatioUtil;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.UnsafeLazyImpl;
import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final class SupportedSurfaceCombination {
    private static final int FRAME_RATE_UNLIMITED = Integer.MAX_VALUE;
    private static final String TAG = "SupportedSurfaceCombination";
    private final CamcorderProfileHelper mCamcorderProfileHelper;
    private final String mCameraId;
    private final CameraCharacteristicsCompat mCharacteristics;
    private final DisplayInfoManager mDisplayInfoManager;
    private final DynamicRangeResolver mDynamicRangeResolver;
    private final FeatureCombinationQuery mFeatureCombinationQuery;
    private final int mHardwareLevel;
    private final HighSpeedResolver mHighSpeedResolver;
    private boolean mIsBurstCaptureSupported;
    private final boolean mIsConcurrentCameraModeSupported;
    private boolean mIsManualSensorSupported;
    private final boolean mIsPreviewStabilizationSupported;
    private boolean mIsRawSupported;
    private final boolean mIsStreamUseCaseSupported;
    private boolean mIsUltraHighResolutionSensorSupported;
    SurfaceSizeDefinition mSurfaceSizeDefinition;
    private final List<SurfaceCombination> mSurfaceCombinations = new ArrayList();
    private final List<SurfaceCombination> mUltraHighSurfaceCombinations = new ArrayList();
    private final List<SurfaceCombination> mConcurrentSurfaceCombinations = new ArrayList();
    private final List<SurfaceCombination> mPreviewStabilizationSurfaceCombinations = new ArrayList();
    private final List<SurfaceCombination> mHighSpeedSurfaceCombinations = new ArrayList();
    private final List<SurfaceCombination> mFcqSurfaceCombinations = new ArrayList();
    private final Map<FeatureSettings, List<SurfaceCombination>> mFeatureSettingsToSupportedCombinationsMap = new HashMap();
    private final List<SurfaceCombination> mSurfaceCombinations10Bit = new ArrayList();
    private final List<SurfaceCombination> mSurfaceCombinationsUltraHdr = new ArrayList();
    private final List<SurfaceCombination> mSurfaceCombinationsStreamUseCase = new ArrayList();
    List<Integer> mSurfaceSizeDefinitionFormats = new ArrayList();
    private final TargetAspectRatio mTargetAspectRatio = new TargetAspectRatio();
    private final ResolutionCorrector mResolutionCorrector = new ResolutionCorrector();
    private final ExtraSupportedSurfaceCombinationsContainer mExtraSupportedSurfaceCombinationsContainer = new ExtraSupportedSurfaceCombinationsContainer();

    enum CheckingMethod {
        WITHOUT_FEATURE_COMBO,
        WITH_FEATURE_COMBO,
        WITHOUT_FEATURE_COMBO_FIRST_AND_THEN_WITH_IT
    }

    SupportedSurfaceCombination(Context context, String cameraId, CameraManagerCompat cameraManagerCompat, CamcorderProfileHelper camcorderProfileHelper, FeatureCombinationQuery featureCombinationQuery) throws CameraUnavailableException {
        this.mIsRawSupported = false;
        this.mIsBurstCaptureSupported = false;
        this.mIsUltraHighResolutionSensorSupported = false;
        this.mIsManualSensorSupported = false;
        this.mCameraId = (String) Preconditions.checkNotNull(cameraId);
        this.mCamcorderProfileHelper = (CamcorderProfileHelper) Preconditions.checkNotNull(camcorderProfileHelper);
        this.mDisplayInfoManager = DisplayInfoManager.getInstance(context);
        try {
            this.mCharacteristics = cameraManagerCompat.getCameraCharacteristicsCompat(this.mCameraId);
            Integer keyValue = (Integer) this.mCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
            this.mHardwareLevel = keyValue != null ? keyValue.intValue() : 2;
            int[] availableCapabilities = (int[]) this.mCharacteristics.get(CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES);
            if (availableCapabilities != null) {
                for (int capability : availableCapabilities) {
                    if (capability == 3) {
                        this.mIsRawSupported = true;
                    } else if (capability == 6) {
                        this.mIsBurstCaptureSupported = true;
                    } else if (Build.VERSION.SDK_INT >= 31 && capability == 16) {
                        this.mIsUltraHighResolutionSensorSupported = true;
                    } else if (capability == 1) {
                        this.mIsManualSensorSupported = true;
                    }
                }
            }
            this.mDynamicRangeResolver = new DynamicRangeResolver(this.mCharacteristics);
            this.mHighSpeedResolver = new HighSpeedResolver(this.mCharacteristics);
            generateSupportedCombinationList();
            if (this.mIsUltraHighResolutionSensorSupported) {
                generateUltraHighSupportedCombinationList();
            }
            this.mIsConcurrentCameraModeSupported = context.getPackageManager().hasSystemFeature("android.hardware.camera.concurrent");
            if (this.mIsConcurrentCameraModeSupported) {
                generateConcurrentSupportedCombinationList();
            }
            if (this.mDynamicRangeResolver.is10BitDynamicRangeSupported()) {
                generate10BitSupportedCombinationList();
            }
            this.mIsStreamUseCaseSupported = StreamUseCaseUtil.isStreamUseCaseSupported(this.mCharacteristics);
            if (this.mIsStreamUseCaseSupported) {
                generateStreamUseCaseSupportedCombinationList();
            }
            this.mIsPreviewStabilizationSupported = VideoStabilizationUtil.isPreviewStabilizationSupported(this.mCharacteristics);
            if (this.mIsPreviewStabilizationSupported) {
                generatePreviewStabilizationSupportedCombinationList();
            }
            generateSurfaceSizeDefinition();
            checkCustomization();
            this.mFeatureCombinationQuery = featureCombinationQuery;
        } catch (CameraAccessExceptionCompat e) {
            throw CameraUnavailableExceptionHelper.createFrom(e);
        }
    }

    boolean checkSupported(FeatureSettings featureSettings, List<SurfaceConfig> surfaceConfigList, Map<SurfaceConfig, DynamicRange> dynamicRangesBySurfaceConfig, List<UseCaseConfig<?>> newUseCaseConfigs, List<Integer> useCasePriorityOrder) {
        boolean isSupported = false;
        for (SurfaceCombination surfaceCombination : getSurfaceCombinationsByFeatureSettings(featureSettings)) {
            isSupported = surfaceCombination.getOrderedSupportedSurfaceConfigList(surfaceConfigList) != null;
            if (isSupported) {
                break;
            }
        }
        if (isSupported && featureSettings.requiresFeatureComboQuery()) {
            SessionConfig sessionConfig = createFeatureComboSessionConfig(featureSettings, surfaceConfigList, dynamicRangesBySurfaceConfig, newUseCaseConfigs, useCasePriorityOrder);
            isSupported = this.mFeatureCombinationQuery.isSupported(sessionConfig);
            for (DeferrableSurface surface : sessionConfig.getSurfaces()) {
                surface.close();
            }
        }
        return isSupported;
    }

    private SessionConfig createFeatureComboSessionConfig(FeatureSettings featureSettings, List<SurfaceConfig> surfaceConfigList, Map<SurfaceConfig, DynamicRange> dynamicRangesBySurfaceConfig, List<UseCaseConfig<?>> newUseCaseConfigs, List<Integer> useCasePriorityOrder) {
        Range<Integer> fpsRange = featureSettings.getTargetFpsRange();
        SessionConfig.ValidatingBuilder validatingBuilder = new SessionConfig.ValidatingBuilder();
        for (int i = 0; i < surfaceConfigList.size(); i++) {
            SurfaceConfig surfaceConfig = surfaceConfigList.get(i);
            Size resolution = surfaceConfig.getResolution(getUpdatedSurfaceSizeDefinitionByFormat(surfaceConfig.getImageFormat()));
            UseCaseConfig<?> useCaseConfig = newUseCaseConfigs.get(useCasePriorityOrder.get(i).intValue());
            SessionConfig.Builder sessionConfigBuilder = FeatureCombinationQuery.CC.createSessionConfigBuilder(useCaseConfig, resolution, (DynamicRange) Objects.requireNonNull(dynamicRangesBySurfaceConfig.get(surfaceConfig)));
            sessionConfigBuilder.setExpectedFrameRateRange(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(fpsRange) ? FpsRangeFeature.DEFAULT_FPS_RANGE : fpsRange);
            if (featureSettings.isPreviewStabilizationOn()) {
                sessionConfigBuilder.setPreviewStabilization(2);
            }
            validatingBuilder.add(sessionConfigBuilder.build());
            Preconditions.checkState(validatingBuilder.isValid(), "Cannot create a combined SessionConfig for feature combo after adding " + useCaseConfig + " with " + surfaceConfig + " due to [" + validatingBuilder.getInvalidReason() + "]; surfaceConfigList = " + surfaceConfigList + ", featureSettings = " + featureSettings + ", newUseCaseConfigs = " + newUseCaseConfigs);
        }
        return validatingBuilder.build();
    }

    List<SurfaceConfig> getOrderedSupportedStreamUseCaseSurfaceConfigList(FeatureSettings featureSettings, List<SurfaceConfig> surfaceConfigList, Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap, Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap) {
        if (!StreamUseCaseUtil.shouldUseStreamUseCase(featureSettings)) {
            return null;
        }
        for (SurfaceCombination surfaceCombination : this.mSurfaceCombinationsStreamUseCase) {
            final List<SurfaceConfig> orderedSurfaceConfigList = surfaceCombination.getOrderedSupportedSurfaceConfigList(surfaceConfigList);
            if (orderedSurfaceConfigList != null) {
                boolean captureTypesEligible = StreamUseCaseUtil.areCaptureTypesEligible(surfaceConfigIndexAttachedSurfaceInfoMap, surfaceConfigIndexUseCaseConfigMap, orderedSurfaceConfigList);
                Lazy<Boolean> streamUseCasesAvailableForSurfaceConfigs = new UnsafeLazyImpl<>(new Function0() { // from class: androidx.camera.camera2.internal.SupportedSurfaceCombination$$ExternalSyntheticLambda0
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return SupportedSurfaceCombination.this.m88x2e20dfec(orderedSurfaceConfigList);
                    }
                });
                if (captureTypesEligible && streamUseCasesAvailableForSurfaceConfigs.getValue().booleanValue()) {
                    return orderedSurfaceConfigList;
                }
            }
        }
        return null;
    }

    /* renamed from: lambda$getOrderedSupportedStreamUseCaseSurfaceConfigList$0$androidx-camera-camera2-internal-SupportedSurfaceCombination, reason: not valid java name */
    /* synthetic */ Boolean m88x2e20dfec(List orderedSurfaceConfigList) {
        return Boolean.valueOf(StreamUseCaseUtil.areStreamUseCasesAvailableForSurfaceConfigs(this.mCharacteristics, orderedSurfaceConfigList));
    }

    private List<SurfaceCombination> getSurfaceCombinationsByFeatureSettings(FeatureSettings featureSettings) {
        if (this.mFeatureSettingsToSupportedCombinationsMap.containsKey(featureSettings)) {
            return this.mFeatureSettingsToSupportedCombinationsMap.get(featureSettings);
        }
        List<SurfaceCombination> supportedSurfaceCombinations = new ArrayList<>();
        if (featureSettings.requiresFeatureComboQuery()) {
            if (this.mFcqSurfaceCombinations.isEmpty()) {
                generateFcqSurfaceCombinations();
            }
            supportedSurfaceCombinations.addAll(this.mFcqSurfaceCombinations);
        } else if (featureSettings.isUltraHdrOn()) {
            if (this.mSurfaceCombinationsUltraHdr.isEmpty()) {
                generateUltraHdrSupportedCombinationList();
            }
            if (featureSettings.getCameraMode() == 0) {
                supportedSurfaceCombinations.addAll(this.mSurfaceCombinationsUltraHdr);
            }
        } else if (featureSettings.isHighSpeedOn()) {
            if (this.mHighSpeedSurfaceCombinations.isEmpty()) {
                generateHighSpeedSupportedCombinationList();
            }
            supportedSurfaceCombinations.addAll(this.mHighSpeedSurfaceCombinations);
        } else if (featureSettings.getRequiredMaxBitDepth() == 8) {
            switch (featureSettings.getCameraMode()) {
                case 1:
                    supportedSurfaceCombinations = this.mConcurrentSurfaceCombinations;
                    break;
                case 2:
                    supportedSurfaceCombinations.addAll(this.mUltraHighSurfaceCombinations);
                    supportedSurfaceCombinations.addAll(this.mSurfaceCombinations);
                    break;
                default:
                    supportedSurfaceCombinations.addAll(featureSettings.isPreviewStabilizationOn() ? this.mPreviewStabilizationSurfaceCombinations : this.mSurfaceCombinations);
                    break;
            }
        } else if (featureSettings.getRequiredMaxBitDepth() == 10 && featureSettings.getCameraMode() == 0) {
            supportedSurfaceCombinations.addAll(this.mSurfaceCombinations10Bit);
        }
        this.mFeatureSettingsToSupportedCombinationsMap.put(featureSettings, supportedSurfaceCombinations);
        return supportedSurfaceCombinations;
    }

    SurfaceConfig transformSurfaceConfig(int cameraMode, int imageFormat, Size size, StreamUseCase streamUseCase) {
        return SurfaceConfig.transformSurfaceConfig(imageFormat, size, getUpdatedSurfaceSizeDefinitionByFormat(imageFormat), cameraMode, SurfaceConfig.ConfigSource.CAPTURE_SESSION_TABLES, streamUseCase);
    }

    private int getMaxFrameRate(int imageFormat, Size size, boolean isHighSpeedOn) {
        Preconditions.checkState(!isHighSpeedOn || imageFormat == 34);
        return isHighSpeedOn ? this.mHighSpeedResolver.getMaxFrameRate(size) : getMaxFrameRate(this.mCharacteristics, imageFormat, size);
    }

    private int getMaxFrameRate(CameraCharacteristicsCompat characteristics, int imageFormat, Size size) {
        long minFrameDuration = ((StreamConfigurationMapCompat) Objects.requireNonNull(characteristics.getStreamConfigurationMapCompat())).getOutputMinFrameDuration(imageFormat, size);
        if (minFrameDuration <= 0) {
            if (this.mIsManualSensorSupported) {
                Logger.w(TAG, "minFrameDuration: " + minFrameDuration + " is invalid for imageFormat = " + imageFormat + ", size = " + size);
                return 0;
            }
            return Integer.MAX_VALUE;
        }
        return (int) (1.0E9d / minFrameDuration);
    }

    private static int getRangeLength(Range<Integer> range) {
        return (range.getUpper().intValue() - range.getLower().intValue()) + 1;
    }

    private static int getRangeDistance(Range<Integer> firstRange, Range<Integer> secondRange) {
        Preconditions.checkState((firstRange.contains((Range<Integer>) secondRange.getUpper()) || firstRange.contains((Range<Integer>) secondRange.getLower())) ? false : true, "Ranges must not intersect");
        if (firstRange.getLower().intValue() > secondRange.getUpper().intValue()) {
            return firstRange.getLower().intValue() - secondRange.getUpper().intValue();
        }
        return secondRange.getLower().intValue() - firstRange.getUpper().intValue();
    }

    private static Range<Integer> compareIntersectingRanges(Range<Integer> targetFps, Range<Integer> storedRange, Range<Integer> newRange) {
        double storedIntersectionSize = getRangeLength(storedRange.intersect(targetFps));
        double newIntersectionSize = getRangeLength(newRange.intersect(targetFps));
        double newRangeRatio = newIntersectionSize / getRangeLength(newRange);
        double storedRangeRatio = storedIntersectionSize / getRangeLength(storedRange);
        if (newIntersectionSize > storedIntersectionSize) {
            if (newRangeRatio >= 0.5d || newRangeRatio >= storedRangeRatio) {
                return newRange;
            }
        } else if (newIntersectionSize == storedIntersectionSize) {
            if (newRangeRatio > storedRangeRatio) {
                return newRange;
            }
            if (newRangeRatio == storedRangeRatio && newRange.getLower().intValue() > storedRange.getLower().intValue()) {
                return newRange;
            }
        } else if (storedRangeRatio < 0.5d && newRangeRatio > storedRangeRatio) {
            return newRange;
        }
        return storedRange;
    }

    private Range<Integer> getClosestSupportedDeviceFrameRate(Range<Integer> targetFrameRate, int maxFps, Range<Integer>[] availableFpsRanges) {
        if (StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(targetFrameRate)) {
            return StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        }
        if (availableFpsRanges == null) {
            return StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        }
        Range<Integer> targetFrameRate2 = new Range<>(Integer.valueOf(Math.min(targetFrameRate.getLower().intValue(), maxFps)), Integer.valueOf(Math.min(targetFrameRate.getUpper().intValue(), maxFps)));
        Range<Integer> bestRange = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        int currentIntersectSize = 0;
        for (Range<Integer> potentialRange : availableFpsRanges) {
            if (maxFps >= ((Integer) ((Range) Objects.requireNonNull(potentialRange)).getLower()).intValue()) {
                if (bestRange.equals(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
                    bestRange = potentialRange;
                }
                if (potentialRange.equals(targetFrameRate2)) {
                    return potentialRange;
                }
                try {
                    Range<Integer> newIntersection = potentialRange.intersect(targetFrameRate2);
                    int newIntersectSize = getRangeLength(newIntersection);
                    if (currentIntersectSize == 0) {
                        bestRange = potentialRange;
                        currentIntersectSize = newIntersectSize;
                    } else if (newIntersectSize >= currentIntersectSize) {
                        bestRange = compareIntersectingRanges(targetFrameRate2, bestRange, potentialRange);
                        currentIntersectSize = getRangeLength(targetFrameRate2.intersect(bestRange));
                    }
                } catch (IllegalArgumentException e) {
                    if (currentIntersectSize == 0) {
                        if (getRangeDistance(potentialRange, targetFrameRate2) < getRangeDistance(bestRange, targetFrameRate2)) {
                            bestRange = potentialRange;
                        } else if (getRangeDistance(potentialRange, targetFrameRate2) == getRangeDistance(bestRange, targetFrameRate2)) {
                            if (potentialRange.getLower().intValue() > bestRange.getUpper().intValue()) {
                                bestRange = potentialRange;
                            } else if (getRangeLength(potentialRange) < getRangeLength(bestRange)) {
                                bestRange = potentialRange;
                            }
                        }
                    }
                }
            }
        }
        return bestRange;
    }

    private Range<Integer> getUpdatedTargetFrameRate(Range<Integer> newTargetFrameRate, Range<Integer> storedTargetFrameRate, boolean isStrictFpsRequired) {
        if (StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(storedTargetFrameRate) && StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(newTargetFrameRate)) {
            return StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        }
        if (StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(storedTargetFrameRate)) {
            return newTargetFrameRate;
        }
        if (StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(newTargetFrameRate)) {
            return storedTargetFrameRate;
        }
        if (isStrictFpsRequired) {
            Preconditions.checkState(newTargetFrameRate == storedTargetFrameRate, "All targetFrameRate should be the same if strict fps is required");
            return newTargetFrameRate;
        }
        try {
            return storedTargetFrameRate.intersect(newTargetFrameRate);
        } catch (IllegalArgumentException e) {
            return storedTargetFrameRate;
        }
    }

    private boolean getAndValidateIsStrictFpsRequired(boolean newIsStrictFpsRequired, Boolean storedIsStrictFpsRequired) {
        if (storedIsStrictFpsRequired != null && storedIsStrictFpsRequired.booleanValue() != newIsStrictFpsRequired) {
            throw new IllegalStateException("All isStrictFpsRequired should be the same");
        }
        return newIsStrictFpsRequired;
    }

    private int getUpdatedMaximumFps(int currentMaxFps, int imageFormat, Size size, boolean isHighSpeedOn) {
        return Math.min(currentMaxFps, getMaxFrameRate(imageFormat, size, isHighSpeedOn));
    }

    SurfaceStreamSpecQueryResult getSuggestedStreamSpecifications(int cameraMode, List<AttachedSurfaceInfo> attachedSurfaces, Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap, boolean isPreviewStabilizationOn, boolean hasVideoCapture, boolean isFeatureComboInvocation, boolean findMaxSupportedFrameRate) {
        Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap2;
        boolean isStrictFpsRequired;
        Range<Integer> targetFpsRange;
        refreshPreviewSize();
        boolean isHighSpeedOn = HighSpeedResolver.isHighSpeedOn(attachedSurfaces, newUseCaseConfigsSupportedSizeMap.keySet());
        if (!isHighSpeedOn) {
            newUseCaseConfigsSupportedSizeMap2 = newUseCaseConfigsSupportedSizeMap;
        } else {
            newUseCaseConfigsSupportedSizeMap2 = this.mHighSpeedResolver.filterCommonSupportedSizes(newUseCaseConfigsSupportedSizeMap);
        }
        List<UseCaseConfig<?>> newUseCaseConfigs = new ArrayList<>(newUseCaseConfigsSupportedSizeMap2.keySet());
        List<Integer> useCasesPriorityOrder = getUseCasesPriorityOrder(newUseCaseConfigs);
        Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges = this.mDynamicRangeResolver.resolveAndValidateDynamicRanges(attachedSurfaces, newUseCaseConfigs, useCasesPriorityOrder);
        Logger.d(TAG, "resolvedDynamicRanges = " + resolvedDynamicRanges);
        boolean isUltraHdrOn = isUltraHdrOn(attachedSurfaces, newUseCaseConfigsSupportedSizeMap2);
        if (findMaxSupportedFrameRate) {
            isStrictFpsRequired = false;
            targetFpsRange = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        } else {
            boolean isStrictFpsRequired2 = isStrictFpsRequired(attachedSurfaces, newUseCaseConfigs);
            isStrictFpsRequired = isStrictFpsRequired2;
            targetFpsRange = getTargetFpsRange(attachedSurfaces, newUseCaseConfigs, useCasesPriorityOrder, isStrictFpsRequired2);
        }
        if (!isPreviewStabilizationOn || this.mIsPreviewStabilizationSupported || !isFeatureComboInvocation) {
            FeatureSettings featureSettings = createFeatureSettings(cameraMode, hasVideoCapture, resolvedDynamicRanges, isPreviewStabilizationOn, isUltraHdrOn, isHighSpeedOn, isFeatureComboInvocation, false, targetFpsRange, isStrictFpsRequired);
            CheckingMethod checkingMethod = getCheckingMethod(resolvedDynamicRanges.values(), targetFpsRange, isPreviewStabilizationOn, isUltraHdrOn, isFeatureComboInvocation);
            return resolveSpecsByCheckingMethod(checkingMethod, featureSettings, attachedSurfaces, newUseCaseConfigsSupportedSizeMap2, newUseCaseConfigs, useCasesPriorityOrder, resolvedDynamicRanges, findMaxSupportedFrameRate);
        }
        throw new IllegalArgumentException("Preview stabilization is not supported by the camera.");
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0046, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0047, code lost:
    
        androidx.camera.core.Logger.d(androidx.camera.camera2.internal.SupportedSurfaceCombination.TAG, "Failed to find a supported combination without feature combo, trying again with feature combo", r0);
        r3 = createFeatureSettings(r15.getCameraMode(), r15.hasVideoCapture(), r20, r15.isPreviewStabilizationOn(), r15.isUltraHdrOn(), r15.isHighSpeedOn(), r15.isFeatureComboInvocation(), true, r15.getTargetFpsRange(), r15.isStrictFpsRequired());
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private androidx.camera.core.impl.SurfaceStreamSpecQueryResult resolveSpecsByCheckingMethod(androidx.camera.camera2.internal.SupportedSurfaceCombination.CheckingMethod r14, androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings r15, java.util.List<androidx.camera.core.impl.AttachedSurfaceInfo> r16, java.util.Map<androidx.camera.core.impl.UseCaseConfig<?>, java.util.List<android.util.Size>> r17, java.util.List<androidx.camera.core.impl.UseCaseConfig<?>> r18, java.util.List<java.lang.Integer> r19, java.util.Map<androidx.camera.core.impl.UseCaseConfig<?>, androidx.camera.core.DynamicRange> r20, boolean r21) {
        /*
            r13 = this;
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "resolveSpecsByCheckingMethod: checkingMethod = "
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.StringBuilder r0 = r0.append(r14)
            java.lang.String r0 = r0.toString()
            java.lang.String r1 = "SupportedSurfaceCombination"
            androidx.camera.core.Logger.d(r1, r0)
            int r0 = r14.ordinal()
            switch(r0) {
                case 1: goto L86;
                case 2: goto L33;
                default: goto L20;
            }
        L20:
            r2 = r13
            r3 = r15
            r4 = r16
            r5 = r17
            r6 = r18
            r7 = r19
            r8 = r20
            r9 = r21
            androidx.camera.core.impl.SurfaceStreamSpecQueryResult r0 = r2.resolveSpecsBySettings(r3, r4, r5, r6, r7, r8, r9)
            return r0
        L33:
            r2 = r13
            r3 = r15
            r4 = r16
            r5 = r17
            r6 = r18
            r7 = r19
            r8 = r20
            r9 = r21
            androidx.camera.core.impl.SurfaceStreamSpecQueryResult r0 = r2.resolveSpecsBySettings(r3, r4, r5, r6, r7, r8, r9)     // Catch: java.lang.IllegalArgumentException -> L46
            return r0
        L46:
            r0 = move-exception
            java.lang.String r2 = "Failed to find a supported combination without feature combo, trying again with feature combo"
            androidx.camera.core.Logger.d(r1, r2, r0)
            int r3 = r15.getCameraMode()
            boolean r4 = r15.hasVideoCapture()
            boolean r6 = r15.isPreviewStabilizationOn()
            boolean r7 = r15.isUltraHdrOn()
            boolean r8 = r15.isHighSpeedOn()
            boolean r9 = r15.isFeatureComboInvocation()
            android.util.Range r11 = r15.getTargetFpsRange()
            boolean r12 = r15.isStrictFpsRequired()
            r10 = 1
            r2 = r13
            r5 = r20
            androidx.camera.camera2.internal.SupportedSurfaceCombination$FeatureSettings r3 = r2.createFeatureSettings(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12)
            r4 = r16
            r5 = r17
            r6 = r18
            r7 = r19
            r8 = r20
            r9 = r21
            androidx.camera.core.impl.SurfaceStreamSpecQueryResult r1 = r2.resolveSpecsBySettings(r3, r4, r5, r6, r7, r8, r9)
            return r1
        L86:
            int r3 = r15.getCameraMode()
            boolean r4 = r15.hasVideoCapture()
            boolean r6 = r15.isPreviewStabilizationOn()
            boolean r7 = r15.isUltraHdrOn()
            boolean r8 = r15.isHighSpeedOn()
            boolean r9 = r15.isFeatureComboInvocation()
            android.util.Range r11 = r15.getTargetFpsRange()
            boolean r12 = r15.isStrictFpsRequired()
            r10 = 1
            r2 = r13
            r5 = r20
            androidx.camera.camera2.internal.SupportedSurfaceCombination$FeatureSettings r3 = r2.createFeatureSettings(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12)
            r4 = r16
            r5 = r17
            r6 = r18
            r7 = r19
            r8 = r20
            r9 = r21
            androidx.camera.core.impl.SurfaceStreamSpecQueryResult r0 = r2.resolveSpecsBySettings(r3, r4, r5, r6, r7, r8, r9)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.camera2.internal.SupportedSurfaceCombination.resolveSpecsByCheckingMethod(androidx.camera.camera2.internal.SupportedSurfaceCombination$CheckingMethod, androidx.camera.camera2.internal.SupportedSurfaceCombination$FeatureSettings, java.util.List, java.util.Map, java.util.List, java.util.List, java.util.Map, boolean):androidx.camera.core.impl.SurfaceStreamSpecQueryResult");
    }

    private SurfaceStreamSpecQueryResult resolveSpecsBySettings(FeatureSettings featureSettings, List<AttachedSurfaceInfo> attachedSurfaces, Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap, List<UseCaseConfig<?>> newUseCaseConfigs, List<Integer> useCasesPriorityOrder, Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges, boolean findMaxSupportedFrameRate) {
        List<List<Size>> allPossibleSizeArrangements;
        FeatureSettings featureSettings2;
        Map<AttachedSurfaceInfo, StreamSpec> attachedSurfaceStreamSpecMap;
        Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap;
        Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap;
        int maxSupportedFps;
        Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap;
        int savedMaxFpsForAllSizes;
        Range<Integer> targetFrameRateForDevice;
        Range<Integer>[] availableFpsRanges;
        List<AttachedSurfaceInfo> list = attachedSurfaces;
        List<UseCaseConfig<?>> list2 = newUseCaseConfigs;
        Logger.d(TAG, "resolveSpecsBySettings: featureSettings = " + featureSettings);
        if (featureSettings.requiresFeatureComboQuery() || isUseCasesCombinationSupported(featureSettings, attachedSurfaces, newUseCaseConfigsSupportedSizeMap)) {
            Map<UseCaseConfig<?>, List<Size>> useCaseConfigToFilteredSupportedSizesMap = filterSupportedSizes(newUseCaseConfigsSupportedSizeMap, featureSettings, findMaxSupportedFrameRate);
            List<List<Size>> supportedOutputSizesList = new ArrayList<>();
            for (Integer index : useCasesPriorityOrder) {
                UseCaseConfig<?> useCaseConfig = list2.get(index.intValue());
                List<Size> supportedOutputSizes = useCaseConfigToFilteredSupportedSizesMap.get(useCaseConfig);
                if (supportedOutputSizes == null) {
                    supportedOutputSizes = Collections.emptyList();
                }
                supportedOutputSizesList.add(applyResolutionSelectionOrderRelatedWorkarounds(supportedOutputSizes, useCaseConfig.getInputFormat()));
            }
            if (featureSettings.isHighSpeedOn()) {
                allPossibleSizeArrangements = this.mHighSpeedResolver.getSizeArrangements(supportedOutputSizesList);
            } else {
                allPossibleSizeArrangements = getAllPossibleSizeArrangements(supportedOutputSizesList);
            }
            List<List<Size>> allPossibleSizeArrangements2 = allPossibleSizeArrangements;
            Map<AttachedSurfaceInfo, StreamSpec> attachedSurfaceStreamSpecMap2 = new HashMap<>();
            Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap2 = new HashMap<>();
            Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap2 = new HashMap<>();
            Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap2 = new HashMap<>();
            boolean containsZsl = StreamUseCaseUtil.containsZslUseCase(list, list2);
            List<SurfaceConfig> orderedSurfaceConfigListForStreamUseCase = null;
            int maxSupportedFps2 = getMaxSupportedFpsFromAttachedSurfaces(list, featureSettings.isHighSpeedOn());
            if (!this.mIsStreamUseCaseSupported || containsZsl) {
                featureSettings2 = featureSettings;
                attachedSurfaceStreamSpecMap = attachedSurfaceStreamSpecMap2;
                surfaceConfigIndexAttachedSurfaceInfoMap = surfaceConfigIndexAttachedSurfaceInfoMap2;
                surfaceConfigIndexUseCaseConfigMap = surfaceConfigIndexUseCaseConfigMap2;
                maxSupportedFps = maxSupportedFps2;
                suggestedStreamSpecMap = suggestedStreamSpecMap2;
            } else {
                Iterator<List<Size>> it = allPossibleSizeArrangements2.iterator();
                List<SurfaceConfig> orderedSurfaceConfigListForStreamUseCase2 = null;
                while (true) {
                    if (!it.hasNext()) {
                        featureSettings2 = featureSettings;
                        attachedSurfaceStreamSpecMap = attachedSurfaceStreamSpecMap2;
                        surfaceConfigIndexAttachedSurfaceInfoMap = surfaceConfigIndexAttachedSurfaceInfoMap2;
                        surfaceConfigIndexUseCaseConfigMap = surfaceConfigIndexUseCaseConfigMap2;
                        maxSupportedFps = maxSupportedFps2;
                        suggestedStreamSpecMap = suggestedStreamSpecMap2;
                        orderedSurfaceConfigListForStreamUseCase = orderedSurfaceConfigListForStreamUseCase2;
                        break;
                    }
                    List<Size> possibleSizeList = it.next();
                    attachedSurfaceStreamSpecMap = attachedSurfaceStreamSpecMap2;
                    int maxSupportedFps3 = maxSupportedFps2;
                    Map<UseCaseConfig<?>, List<Size>> useCaseConfigToFilteredSupportedSizesMap2 = useCaseConfigToFilteredSupportedSizesMap;
                    suggestedStreamSpecMap = suggestedStreamSpecMap2;
                    featureSettings2 = featureSettings;
                    Pair<List<SurfaceConfig>, Integer> surfaceConfigListAndFpsCeiling = getSurfaceConfigListAndFpsCeiling(featureSettings2, list, possibleSizeList, list2, useCasesPriorityOrder, maxSupportedFps3, surfaceConfigIndexAttachedSurfaceInfoMap2, surfaceConfigIndexUseCaseConfigMap2);
                    surfaceConfigIndexAttachedSurfaceInfoMap = surfaceConfigIndexAttachedSurfaceInfoMap2;
                    surfaceConfigIndexUseCaseConfigMap = surfaceConfigIndexUseCaseConfigMap2;
                    maxSupportedFps = maxSupportedFps3;
                    List<SurfaceConfig> surfaceConfigs = (List) surfaceConfigListAndFpsCeiling.first;
                    orderedSurfaceConfigListForStreamUseCase2 = getOrderedSupportedStreamUseCaseSurfaceConfigList(featureSettings2, surfaceConfigs, surfaceConfigIndexAttachedSurfaceInfoMap, surfaceConfigIndexUseCaseConfigMap);
                    if (orderedSurfaceConfigListForStreamUseCase2 != null) {
                        orderedSurfaceConfigListForStreamUseCase = orderedSurfaceConfigListForStreamUseCase2;
                        break;
                    }
                    surfaceConfigIndexAttachedSurfaceInfoMap.clear();
                    surfaceConfigIndexUseCaseConfigMap.clear();
                    surfaceConfigIndexAttachedSurfaceInfoMap2 = surfaceConfigIndexAttachedSurfaceInfoMap;
                    attachedSurfaceStreamSpecMap2 = attachedSurfaceStreamSpecMap;
                    suggestedStreamSpecMap2 = suggestedStreamSpecMap;
                    useCaseConfigToFilteredSupportedSizesMap = useCaseConfigToFilteredSupportedSizesMap2;
                    list = attachedSurfaces;
                    maxSupportedFps2 = maxSupportedFps;
                    surfaceConfigIndexUseCaseConfigMap2 = surfaceConfigIndexUseCaseConfigMap;
                    list2 = newUseCaseConfigs;
                }
                Logger.d(TAG, "orderedSurfaceConfigListForStreamUseCase = " + orderedSurfaceConfigListForStreamUseCase);
            }
            Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap3 = surfaceConfigIndexAttachedSurfaceInfoMap;
            Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap3 = surfaceConfigIndexUseCaseConfigMap;
            BestSizesAndMaxFpsForConfigs bestSizesAndFps = findBestSizesAndFps(featureSettings2, attachedSurfaces, newUseCaseConfigs, useCasesPriorityOrder, allPossibleSizeArrangements2, orderedSurfaceConfigListForStreamUseCase, resolvedDynamicRanges, maxSupportedFps, findMaxSupportedFrameRate);
            Logger.d(TAG, "resolveSpecsBySettings: bestSizesAndFps = " + bestSizesAndFps);
            List<Size> savedSizes = bestSizesAndFps.getBestSizes();
            int savedConfigMaxFps = bestSizesAndFps.getMaxFpsForBestSizes();
            List<Size> savedSizesForStreamUseCase = bestSizesAndFps.getBestSizesForStreamUseCase();
            int savedConfigMaxFpsForStreamUseCase = bestSizesAndFps.getMaxFpsForStreamUseCase();
            int savedMaxFpsForAllSizes2 = bestSizesAndFps.getMaxFpsForAllSizes();
            if (savedSizes == null) {
                throw new IllegalArgumentException("No supported surface combination is found for camera device - Id : " + this.mCameraId + " and Hardware level: " + this.mHardwareLevel + ". May be the specified resolution is too large and not supported. Existing surfaces: " + attachedSurfaces + " New configs: " + newUseCaseConfigs);
            }
            Range<Integer> targetFrameRateForDevice2 = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
            if (!StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(featureSettings.getTargetFpsRange())) {
                if (featureSettings.isHighSpeedOn()) {
                    availableFpsRanges = this.mHighSpeedResolver.getFrameRateRangesFor(savedSizes);
                } else {
                    availableFpsRanges = (Range[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
                }
                targetFrameRateForDevice = getClosestSupportedDeviceFrameRate(featureSettings.getTargetFpsRange(), savedConfigMaxFps, availableFpsRanges);
                if (featureSettings.isFeatureComboInvocation() || featureSettings.isStrictFpsRequired()) {
                    savedMaxFpsForAllSizes = savedMaxFpsForAllSizes2;
                    Preconditions.checkArgument(targetFrameRateForDevice.equals(featureSettings.getTargetFpsRange()), "Target FPS range " + featureSettings.getTargetFpsRange() + " is not supported. Max FPS supported by the calculated best combination: " + savedConfigMaxFps + ". Calculated best FPS range for device: " + targetFrameRateForDevice + ". Device supported FPS ranges: " + Arrays.toString(availableFpsRanges));
                } else {
                    savedMaxFpsForAllSizes = savedMaxFpsForAllSizes2;
                }
            } else {
                savedMaxFpsForAllSizes = savedMaxFpsForAllSizes2;
                if (!featureSettings.isHighSpeedOn()) {
                    targetFrameRateForDevice = targetFrameRateForDevice2;
                } else {
                    Range<Integer>[] availableFpsRanges2 = this.mHighSpeedResolver.getFrameRateRangesFor(savedSizes);
                    Range<Integer> targetFrameRateForDevice3 = getClosestSupportedDeviceFrameRate(HighSpeedResolver.DEFAULT_FPS, savedConfigMaxFps, availableFpsRanges2);
                    targetFrameRateForDevice = targetFrameRateForDevice3;
                }
            }
            Iterator<UseCaseConfig<?>> it2 = newUseCaseConfigs.iterator();
            while (it2.hasNext()) {
                UseCaseConfig<?> useCaseConfig2 = it2.next();
                Iterator<UseCaseConfig<?>> it3 = it2;
                Size resolutionForUseCase = savedSizes.get(useCasesPriorityOrder.indexOf(Integer.valueOf(newUseCaseConfigs.indexOf(useCaseConfig2))));
                StreamSpec.Builder streamSpecBuilder = StreamSpec.builder(resolutionForUseCase).setSessionType(featureSettings.isHighSpeedOn() ? 1 : 0).setDynamicRange((DynamicRange) Preconditions.checkNotNull(resolvedDynamicRanges.get(useCaseConfig2))).setImplementationOptions(StreamUseCaseUtil.getStreamSpecImplementationOptions(useCaseConfig2)).setZslDisabled(featureSettings.hasVideoCapture());
                if (!StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(targetFrameRateForDevice)) {
                    streamSpecBuilder.setExpectedFrameRateRange(targetFrameRateForDevice);
                }
                suggestedStreamSpecMap.put(useCaseConfig2, streamSpecBuilder.build());
                it2 = it3;
            }
            if (orderedSurfaceConfigListForStreamUseCase != null && savedConfigMaxFps == savedConfigMaxFpsForStreamUseCase && savedSizes.size() == savedSizesForStreamUseCase.size()) {
                boolean hasDifferenceSavedSizes = false;
                int i = 0;
                while (true) {
                    if (i >= savedSizes.size()) {
                        break;
                    }
                    if (savedSizes.get(i).equals(savedSizesForStreamUseCase.get(i))) {
                        i++;
                    } else {
                        hasDifferenceSavedSizes = true;
                        break;
                    }
                }
                if (!hasDifferenceSavedSizes) {
                    boolean hasStreamUseCaseOverride = StreamUseCaseUtil.populateStreamUseCaseStreamSpecOptionWithInteropOverride(this.mCharacteristics, attachedSurfaces, suggestedStreamSpecMap, attachedSurfaceStreamSpecMap);
                    if (!hasStreamUseCaseOverride) {
                        StreamUseCaseUtil.populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs(suggestedStreamSpecMap, attachedSurfaceStreamSpecMap, surfaceConfigIndexAttachedSurfaceInfoMap3, surfaceConfigIndexUseCaseConfigMap3, orderedSurfaceConfigListForStreamUseCase);
                    }
                }
            }
            return new SurfaceStreamSpecQueryResult(suggestedStreamSpecMap, attachedSurfaceStreamSpecMap, savedMaxFpsForAllSizes);
        }
        throw new IllegalArgumentException("No supported surface combination is found for camera device - Id : " + this.mCameraId + ".  May be attempting to bind too many use cases. Existing surfaces: " + list + ". New configs: " + list2 + ". GroupableFeature settings: " + featureSettings);
    }

    private CheckingMethod getCheckingMethod(Collection<DynamicRange> dynamicRanges, Range<Integer> fps, boolean isPreviewStabilizationOn, boolean isUltraHdrOn, boolean isFeatureComboInvocation) {
        if (!isFeatureComboInvocation) {
            return CheckingMethod.WITHOUT_FEATURE_COMBO;
        }
        int count = 0;
        if (dynamicRanges.contains(DynamicRange.HLG_10_BIT)) {
            count = 0 + 1;
        }
        if (fps != null && fps.getUpper().intValue() == 60) {
            count++;
        }
        if (isPreviewStabilizationOn) {
            count++;
        }
        if (isUltraHdrOn) {
            count++;
        }
        if (count > 1) {
            return CheckingMethod.WITH_FEATURE_COMBO;
        }
        if (count == 1) {
            return CheckingMethod.WITHOUT_FEATURE_COMBO_FIRST_AND_THEN_WITH_IT;
        }
        return CheckingMethod.WITHOUT_FEATURE_COMBO;
    }

    private BestSizesAndMaxFpsForConfigs findBestSizesAndFps(final FeatureSettings featureSettings, List<AttachedSurfaceInfo> attachedSurfaces, final List<UseCaseConfig<?>> newUseCaseConfigs, final List<Integer> useCasesPriorityOrder, List<List<Size>> allPossibleSizeArrangements, List<SurfaceConfig> orderedSurfaceConfigListForStreamUseCase, Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges, int maxSupportedFps, boolean findMaxFpsForAllSizes) {
        FeatureSettings featureSettings2;
        int maxFpsForAllSizes;
        int savedConfigMaxFps;
        int maxFpsForAllSizes2;
        List<Size> savedSizesForStreamUseCase;
        List<Size> savedSizesForStreamUseCase2;
        List<Size> savedSizes;
        int savedConfigMaxFps2;
        List<Size> savedSizesForStreamUseCase3;
        boolean supportedSizesFound;
        DynamicRange dynamicRange;
        Range<Integer> targetFpsRange = featureSettings.getTargetFpsRange();
        List<Size> savedSizesForStreamUseCase4 = null;
        int savedConfigMaxFps3 = Integer.MAX_VALUE;
        List<Size> savedSizesForStreamUseCase5 = null;
        int savedConfigMaxFpsForStreamUseCase = Integer.MAX_VALUE;
        int maxFpsForAllSizes3 = Integer.MAX_VALUE;
        boolean supportedSizesFound2 = false;
        boolean supportedSizesForStreamUseCaseFound = false;
        Iterator<List<Size>> it = allPossibleSizeArrangements.iterator();
        while (true) {
            if (!it.hasNext()) {
                int savedConfigMaxFps4 = savedConfigMaxFps3;
                List<Size> savedSizesForStreamUseCase6 = savedSizesForStreamUseCase5;
                featureSettings2 = featureSettings;
                maxFpsForAllSizes = maxFpsForAllSizes3;
                savedConfigMaxFps = savedConfigMaxFps4;
                maxFpsForAllSizes2 = savedConfigMaxFpsForStreamUseCase;
                savedSizesForStreamUseCase = savedSizesForStreamUseCase6;
                break;
            }
            List<Size> possibleSizeList = it.next();
            Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexToAttachedSurfaceInfoMap = new HashMap<>();
            Map<Integer, UseCaseConfig<?>> surfaceConfigIndexToUseCaseConfigMap = new HashMap<>();
            Pair<List<SurfaceConfig>, Integer> resultPair = getSurfaceConfigListAndFpsCeiling(featureSettings, attachedSurfaces, possibleSizeList, newUseCaseConfigs, useCasesPriorityOrder, maxSupportedFps, surfaceConfigIndexToAttachedSurfaceInfoMap, surfaceConfigIndexToUseCaseConfigMap);
            final List<SurfaceConfig> surfaceConfigList = (List) resultPair.first;
            int currentConfigFrameRateCeiling = ((Integer) resultPair.second).intValue();
            boolean isConfigFrameRateAcceptable = isConfigFrameRateAcceptable(maxSupportedFps, targetFpsRange, currentConfigFrameRateCeiling);
            final Map<SurfaceConfig, DynamicRange> dynamicRangesBySurfaceConfig = new HashMap<>();
            List<Size> savedSizes2 = savedSizesForStreamUseCase4;
            int index = 0;
            while (true) {
                savedSizesForStreamUseCase2 = savedSizesForStreamUseCase5;
                if (index >= surfaceConfigList.size()) {
                    break;
                }
                SurfaceConfig surfaceConfig = surfaceConfigList.get(index);
                DynamicRange dynamicRange2 = DynamicRange.UNSPECIFIED;
                int index2 = index;
                if (surfaceConfigIndexToAttachedSurfaceInfoMap.containsKey(Integer.valueOf(index2))) {
                    DynamicRange dynamicRange3 = ((AttachedSurfaceInfo) Objects.requireNonNull(surfaceConfigIndexToAttachedSurfaceInfoMap.get(Integer.valueOf(index2)))).getDynamicRange();
                    supportedSizesFound = supportedSizesFound2;
                    dynamicRange = dynamicRange3;
                } else if (!surfaceConfigIndexToUseCaseConfigMap.containsKey(Integer.valueOf(index2))) {
                    supportedSizesFound = supportedSizesFound2;
                    dynamicRange = dynamicRange2;
                } else {
                    supportedSizesFound = supportedSizesFound2;
                    DynamicRange dynamicRange4 = resolvedDynamicRanges.get(Objects.requireNonNull(surfaceConfigIndexToUseCaseConfigMap.get(Integer.valueOf(index2))));
                    dynamicRange = dynamicRange4;
                }
                dynamicRangesBySurfaceConfig.put(surfaceConfig, dynamicRange);
                index = index2 + 1;
                savedSizesForStreamUseCase5 = savedSizesForStreamUseCase2;
                supportedSizesFound2 = supportedSizesFound;
            }
            boolean supportedSizesFound3 = supportedSizesFound2;
            Lazy<Boolean> isSupported = new UnsafeLazyImpl<>(new Function0() { // from class: androidx.camera.camera2.internal.SupportedSurfaceCombination$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    return SupportedSurfaceCombination.this.m87x855fb871(featureSettings, surfaceConfigList, dynamicRangesBySurfaceConfig, newUseCaseConfigs, useCasesPriorityOrder);
                }
            });
            if (findMaxFpsForAllSizes && isSupported.getValue().booleanValue()) {
                if (maxFpsForAllSizes3 == Integer.MAX_VALUE) {
                    maxFpsForAllSizes3 = currentConfigFrameRateCeiling;
                } else if (maxFpsForAllSizes3 < currentConfigFrameRateCeiling) {
                    maxFpsForAllSizes3 = currentConfigFrameRateCeiling;
                }
            }
            if (!supportedSizesFound3 && isSupported.getValue().booleanValue()) {
                if (savedConfigMaxFps3 == Integer.MAX_VALUE) {
                    savedConfigMaxFps3 = currentConfigFrameRateCeiling;
                    savedSizes = possibleSizeList;
                } else if (savedConfigMaxFps3 >= currentConfigFrameRateCeiling) {
                    savedSizes = savedSizes2;
                } else {
                    savedConfigMaxFps3 = currentConfigFrameRateCeiling;
                    savedSizes = possibleSizeList;
                }
                if (isConfigFrameRateAcceptable) {
                    savedConfigMaxFps3 = currentConfigFrameRateCeiling;
                    savedSizes = possibleSizeList;
                    if (supportedSizesForStreamUseCaseFound && !findMaxFpsForAllSizes) {
                        savedConfigMaxFps = savedConfigMaxFps3;
                        maxFpsForAllSizes = maxFpsForAllSizes3;
                        savedSizesForStreamUseCase4 = savedSizes;
                        featureSettings2 = featureSettings;
                        maxFpsForAllSizes2 = savedConfigMaxFpsForStreamUseCase;
                        savedSizesForStreamUseCase = savedSizesForStreamUseCase2;
                        break;
                    }
                    supportedSizesFound3 = true;
                }
            } else {
                savedSizes = savedSizes2;
            }
            if (orderedSurfaceConfigListForStreamUseCase == null || supportedSizesForStreamUseCaseFound) {
                savedConfigMaxFps2 = savedConfigMaxFps3;
            } else {
                savedConfigMaxFps2 = savedConfigMaxFps3;
                featureSettings2 = featureSettings;
                if (getOrderedSupportedStreamUseCaseSurfaceConfigList(featureSettings2, surfaceConfigList, surfaceConfigIndexToAttachedSurfaceInfoMap, surfaceConfigIndexToUseCaseConfigMap) != null) {
                    if (savedConfigMaxFpsForStreamUseCase == Integer.MAX_VALUE) {
                        savedConfigMaxFpsForStreamUseCase = currentConfigFrameRateCeiling;
                        savedSizesForStreamUseCase3 = possibleSizeList;
                    } else if (savedConfigMaxFpsForStreamUseCase >= currentConfigFrameRateCeiling) {
                        savedSizesForStreamUseCase3 = savedSizesForStreamUseCase2;
                    } else {
                        savedConfigMaxFpsForStreamUseCase = currentConfigFrameRateCeiling;
                        savedSizesForStreamUseCase3 = possibleSizeList;
                    }
                    if (!isConfigFrameRateAcceptable) {
                        savedSizesForStreamUseCase5 = savedSizesForStreamUseCase3;
                    } else {
                        savedConfigMaxFpsForStreamUseCase = currentConfigFrameRateCeiling;
                        supportedSizesForStreamUseCaseFound = true;
                        if (supportedSizesFound3 && !findMaxFpsForAllSizes) {
                            maxFpsForAllSizes = maxFpsForAllSizes3;
                            savedConfigMaxFps = savedConfigMaxFps2;
                            maxFpsForAllSizes2 = savedConfigMaxFpsForStreamUseCase;
                            savedSizesForStreamUseCase = possibleSizeList;
                            savedSizesForStreamUseCase4 = savedSizes;
                            break;
                        }
                        savedSizesForStreamUseCase5 = possibleSizeList;
                    }
                    savedSizesForStreamUseCase4 = savedSizes;
                    savedConfigMaxFps3 = savedConfigMaxFps2;
                    supportedSizesFound2 = supportedSizesFound3;
                }
            }
            savedSizesForStreamUseCase5 = savedSizesForStreamUseCase2;
            savedSizesForStreamUseCase4 = savedSizes;
            savedConfigMaxFps3 = savedConfigMaxFps2;
            supportedSizesFound2 = supportedSizesFound3;
        }
        if (featureSettings2.isFeatureComboInvocation() && !StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(targetFpsRange) && (savedConfigMaxFps == Integer.MAX_VALUE || savedConfigMaxFps < targetFpsRange.getUpper().intValue())) {
            return BestSizesAndMaxFpsForConfigs.of(null, null, Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE);
        }
        return BestSizesAndMaxFpsForConfigs.of(savedSizesForStreamUseCase4, savedSizesForStreamUseCase, savedConfigMaxFps, maxFpsForAllSizes2, maxFpsForAllSizes);
    }

    /* renamed from: lambda$findBestSizesAndFps$1$androidx-camera-camera2-internal-SupportedSurfaceCombination, reason: not valid java name */
    /* synthetic */ Boolean m87x855fb871(FeatureSettings featureSettings, List surfaceConfigList, Map dynamicRangesBySurfaceConfig, List newUseCaseConfigs, List useCasesPriorityOrder) {
        return Boolean.valueOf(checkSupported(featureSettings, surfaceConfigList, dynamicRangesBySurfaceConfig, newUseCaseConfigs, useCasesPriorityOrder));
    }

    private static boolean isConfigFrameRateAcceptable(int maxSupportedFps, Range<Integer> targetFpsRange, int currentConfigFrameRateCeiling) {
        if (StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(targetFpsRange) || currentConfigFrameRateCeiling >= maxSupportedFps || currentConfigFrameRateCeiling >= targetFpsRange.getUpper().intValue()) {
            return true;
        }
        return false;
    }

    private static boolean isUltraHdrOn(List<AttachedSurfaceInfo> attachedSurfaces, Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap) {
        for (AttachedSurfaceInfo surfaceInfo : attachedSurfaces) {
            if (surfaceInfo.getImageFormat() == 4101) {
                return true;
            }
        }
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigsSupportedSizeMap.keySet()) {
            if (useCaseConfig.getInputFormat() == 4101) {
                return true;
            }
        }
        return false;
    }

    private FeatureSettings createFeatureSettings(int cameraMode, boolean hasVideoCapture, Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges, boolean isPreviewStabilizationOn, boolean isUltraHdrOn, boolean isHighSpeedOn, boolean isFeatureComboInvocation, boolean requiresFeatureComboQuery, Range<Integer> targetFpsRange, boolean isStrictFrameRateRequired) {
        Range<Integer> range;
        Range<Integer> targetFpsRange2;
        int requiredMaxBitDepth = getRequiredMaxBitDepth(resolvedDynamicRanges);
        if (cameraMode != 0 && isUltraHdrOn) {
            throw new IllegalArgumentException(String.format("Camera device id is %s. Ultra HDR is not currently supported in %s camera mode.", this.mCameraId, CameraMode.toLabelString(cameraMode)));
        }
        if (cameraMode != 0 && requiredMaxBitDepth == 10) {
            throw new IllegalArgumentException(String.format("Camera device id is %s. 10 bit dynamic range is not currently supported in %s camera mode.", this.mCameraId, CameraMode.toLabelString(cameraMode)));
        }
        if (cameraMode != 0 && isFeatureComboInvocation) {
            throw new IllegalArgumentException(String.format("Camera device id is %s. Feature combination query is not currently supported in %s camera mode.", this.mCameraId, CameraMode.toLabelString(cameraMode)));
        }
        if (isHighSpeedOn && isFeatureComboInvocation) {
            throw new IllegalArgumentException("High-speed session is not supported with feature combination");
        }
        if (isHighSpeedOn && !this.mHighSpeedResolver.isHighSpeedSupported()) {
            throw new IllegalArgumentException("High-speed session is not supported on this device.");
        }
        if (!isFeatureComboInvocation) {
            range = targetFpsRange;
        } else {
            range = targetFpsRange;
            if (range == StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED && requiresFeatureComboQuery) {
                targetFpsRange2 = FpsRangeFeature.DEFAULT_FPS_RANGE;
                return FeatureSettings.of(cameraMode, hasVideoCapture, requiredMaxBitDepth, isPreviewStabilizationOn, isUltraHdrOn, isHighSpeedOn, isFeatureComboInvocation, requiresFeatureComboQuery, targetFpsRange2, isStrictFrameRateRequired);
            }
        }
        targetFpsRange2 = range;
        return FeatureSettings.of(cameraMode, hasVideoCapture, requiredMaxBitDepth, isPreviewStabilizationOn, isUltraHdrOn, isHighSpeedOn, isFeatureComboInvocation, requiresFeatureComboQuery, targetFpsRange2, isStrictFrameRateRequired);
    }

    private boolean isUseCasesCombinationSupported(FeatureSettings featureSettings, List<AttachedSurfaceInfo> attachedSurfaces, Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap) {
        List<SurfaceConfig> surfaceConfigs = new ArrayList<>();
        for (AttachedSurfaceInfo attachedSurface : attachedSurfaces) {
            surfaceConfigs.add(attachedSurface.getSurfaceConfig());
        }
        CompareSizesByArea compareSizesByArea = new CompareSizesByArea();
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigsSupportedSizeMap.keySet()) {
            List<Size> supportedSizes = newUseCaseConfigsSupportedSizeMap.get(useCaseConfig);
            Preconditions.checkArgument((supportedSizes == null || supportedSizes.isEmpty()) ? false : true, "No available output size is found for " + useCaseConfig + ".");
            Size minSize = (Size) Collections.min(supportedSizes, compareSizesByArea);
            int imageFormat = useCaseConfig.getInputFormat();
            surfaceConfigs.add(SurfaceConfig.transformSurfaceConfig(imageFormat, minSize, getUpdatedSurfaceSizeDefinitionByFormat(imageFormat), featureSettings.getCameraMode(), SurfaceConfig.ConfigSource.CAPTURE_SESSION_TABLES, useCaseConfig.getStreamUseCase()));
        }
        return checkSupported(featureSettings, surfaceConfigs, Collections.emptyMap(), Collections.emptyList(), Collections.emptyList());
    }

    private Range<Integer> getTargetFpsRange(List<AttachedSurfaceInfo> attachedSurfaces, List<UseCaseConfig<?>> newUseCaseConfigs, List<Integer> useCasesPriorityOrder, boolean isStrictFpsRequired) {
        Range<Integer> targetFrameRateForConfig = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            targetFrameRateForConfig = getUpdatedTargetFrameRate(attachedSurfaceInfo.getTargetFrameRate(), targetFrameRateForConfig, isStrictFpsRequired);
        }
        for (Integer index : useCasesPriorityOrder) {
            Range<Integer> newTargetFrameRate = (Range) Objects.requireNonNull(newUseCaseConfigs.get(index.intValue()).getTargetFrameRate(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED));
            targetFrameRateForConfig = getUpdatedTargetFrameRate(newTargetFrameRate, targetFrameRateForConfig, isStrictFpsRequired);
        }
        return targetFrameRateForConfig;
    }

    private boolean isStrictFpsRequired(List<AttachedSurfaceInfo> attachedSurfaces, List<UseCaseConfig<?>> newUseCaseConfigs) {
        Boolean isStrictFpsRequired = null;
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            isStrictFpsRequired = Boolean.valueOf(getAndValidateIsStrictFpsRequired(attachedSurfaceInfo.isStrictFrameRateRequired(), isStrictFpsRequired));
        }
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigs) {
            isStrictFpsRequired = Boolean.valueOf(getAndValidateIsStrictFpsRequired(useCaseConfig.isStrictFrameRateRequired(), isStrictFpsRequired));
        }
        if (isStrictFpsRequired != null) {
            return isStrictFpsRequired.booleanValue();
        }
        return false;
    }

    private int getMaxSupportedFpsFromAttachedSurfaces(List<AttachedSurfaceInfo> attachedSurfaces, boolean isHighSpeedOn) {
        int existingSurfaceFrameRateCeiling = Integer.MAX_VALUE;
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            existingSurfaceFrameRateCeiling = getUpdatedMaximumFps(existingSurfaceFrameRateCeiling, attachedSurfaceInfo.getImageFormat(), attachedSurfaceInfo.getSize(), isHighSpeedOn);
        }
        return existingSurfaceFrameRateCeiling;
    }

    Map<UseCaseConfig<?>, List<Size>> filterSupportedSizes(Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap, FeatureSettings featureSettings, boolean forceUniqueMaxFpsFiltering) {
        Map<UseCaseConfig<?>, List<Size>> filteredUseCaseConfigToSupportedSizesMap = new HashMap<>();
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigsSupportedSizeMap.keySet()) {
            List<Size> reducedSizeList = new ArrayList<>();
            Map<SurfaceConfig.ConfigSize, Set<Integer>> configSizeUniqueMaxFpsMap = new HashMap<>();
            for (Size size : (List) Objects.requireNonNull(newUseCaseConfigsSupportedSizeMap.get(useCaseConfig))) {
                int imageFormat = useCaseConfig.getInputFormat();
                StreamUseCase streamUseCase = useCaseConfig.getStreamUseCase();
                populateReducedSizeListAndUniqueMaxFpsMap(featureSettings, featureSettings.getTargetFpsRange(), size, imageFormat, streamUseCase, forceUniqueMaxFpsFiltering, configSizeUniqueMaxFpsMap, reducedSizeList);
            }
            filteredUseCaseConfigToSupportedSizesMap.put(useCaseConfig, reducedSizeList);
        }
        return filteredUseCaseConfigToSupportedSizesMap;
    }

    private void populateReducedSizeListAndUniqueMaxFpsMap(FeatureSettings featureSettings, Range<Integer> targetFpsRange, Size size, int imageFormat, StreamUseCase streamUseCase, boolean forceUniqueMaxFpsFiltering, Map<SurfaceConfig.ConfigSize, Set<Integer>> configSizeToUniqueMaxFpsMap, List<Size> reducedSizeList) {
        SurfaceConfig.ConfigSize configSize = SurfaceConfig.transformSurfaceConfig(imageFormat, size, getUpdatedSurfaceSizeDefinitionByFormat(imageFormat), featureSettings.getCameraMode(), featureSettings.requiresFeatureComboQuery() ? SurfaceConfig.ConfigSource.FEATURE_COMBINATION_TABLE : SurfaceConfig.ConfigSource.CAPTURE_SESSION_TABLES, streamUseCase).getConfigSize();
        int maxFrameRate = Integer.MAX_VALUE;
        if (!StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(targetFpsRange) || forceUniqueMaxFpsFiltering) {
            maxFrameRate = getMaxFrameRate(imageFormat, size, featureSettings.isHighSpeedOn());
        }
        if (featureSettings.isFeatureComboInvocation()) {
            if (configSize != SurfaceConfig.ConfigSize.NOT_SUPPORT) {
                if (!StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(targetFpsRange) && maxFrameRate < targetFpsRange.getUpper().intValue()) {
                    return;
                }
            } else {
                return;
            }
        }
        Set<Integer> uniqueMaxFrameRates = configSizeToUniqueMaxFpsMap.get(configSize);
        if (uniqueMaxFrameRates == null) {
            uniqueMaxFrameRates = new HashSet();
            configSizeToUniqueMaxFpsMap.put(configSize, uniqueMaxFrameRates);
        }
        if (!uniqueMaxFrameRates.contains(Integer.valueOf(maxFrameRate))) {
            reducedSizeList.add(size);
            uniqueMaxFrameRates.add(Integer.valueOf(maxFrameRate));
        }
    }

    private Pair<List<SurfaceConfig>, Integer> getSurfaceConfigListAndFpsCeiling(FeatureSettings featureSettings, List<AttachedSurfaceInfo> attachedSurfaces, List<Size> possibleSizeList, List<UseCaseConfig<?>> newUseCaseConfigs, List<Integer> useCasesPriorityOrder, int currentConfigFrameRateCeiling, Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap, Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap) {
        List<SurfaceConfig> surfaceConfigList = new ArrayList<>();
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            surfaceConfigList.add(attachedSurfaceInfo.getSurfaceConfig());
            if (surfaceConfigIndexAttachedSurfaceInfoMap != null) {
                surfaceConfigIndexAttachedSurfaceInfoMap.put(Integer.valueOf(surfaceConfigList.size() - 1), attachedSurfaceInfo);
            }
        }
        int currentConfigFrameRateCeiling2 = currentConfigFrameRateCeiling;
        for (int i = 0; i < possibleSizeList.size(); i++) {
            Size size = possibleSizeList.get(i);
            UseCaseConfig<?> newUseCase = newUseCaseConfigs.get(useCasesPriorityOrder.get(i).intValue());
            int imageFormat = newUseCase.getInputFormat();
            StreamUseCase streamUseCase = newUseCase.getStreamUseCase();
            SurfaceConfig.ConfigSource configSource = featureSettings.requiresFeatureComboQuery() ? SurfaceConfig.ConfigSource.FEATURE_COMBINATION_TABLE : SurfaceConfig.ConfigSource.CAPTURE_SESSION_TABLES;
            SurfaceConfig surfaceConfig = SurfaceConfig.transformSurfaceConfig(imageFormat, size, getUpdatedSurfaceSizeDefinitionByFormat(imageFormat), featureSettings.getCameraMode(), configSource, streamUseCase);
            surfaceConfigList.add(surfaceConfig);
            if (surfaceConfigIndexUseCaseConfigMap != null) {
                surfaceConfigIndexUseCaseConfigMap.put(Integer.valueOf(surfaceConfigList.size() - 1), newUseCase);
            }
            currentConfigFrameRateCeiling2 = getUpdatedMaximumFps(currentConfigFrameRateCeiling2, newUseCase.getInputFormat(), size, featureSettings.isHighSpeedOn());
        }
        return new Pair<>(surfaceConfigList, Integer.valueOf(currentConfigFrameRateCeiling2));
    }

    List<Size> applyResolutionSelectionOrderRelatedWorkarounds(List<Size> sizeList, int imageFormat) {
        Rational ratio;
        List<Size> aspectRatioMatchedSizeList;
        int targetAspectRatio = this.mTargetAspectRatio.get(this.mCameraId, this.mCharacteristics);
        switch (targetAspectRatio) {
            case 0:
                ratio = AspectRatioUtil.ASPECT_RATIO_4_3;
                break;
            case 1:
                ratio = AspectRatioUtil.ASPECT_RATIO_16_9;
                break;
            case 2:
                Size maxJpegSize = getUpdatedSurfaceSizeDefinitionByFormat(256).getMaximumSize(256);
                Rational ratio2 = maxJpegSize == null ? null : new Rational(maxJpegSize.getWidth(), maxJpegSize.getHeight());
                ratio = ratio2;
                break;
            case 3:
                ratio = null;
                break;
            default:
                throw new AssertionError("Undefined targetAspectRatio: " + targetAspectRatio);
        }
        if (ratio == null) {
            aspectRatioMatchedSizeList = sizeList;
        } else {
            ArrayList arrayList = new ArrayList();
            List<Size> resultList = new ArrayList<>();
            for (Size size : sizeList) {
                if (AspectRatioUtil.hasMatchingAspectRatio(size, ratio)) {
                    arrayList.add(size);
                } else {
                    resultList.add(size);
                }
            }
            resultList.addAll(0, arrayList);
            aspectRatioMatchedSizeList = resultList;
        }
        return this.mResolutionCorrector.insertOrPrioritize(SurfaceConfig.getConfigType(imageFormat), aspectRatioMatchedSizeList);
    }

    private static int getRequiredMaxBitDepth(Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges) {
        for (DynamicRange dynamicRange : resolvedDynamicRanges.values()) {
            if (dynamicRange.getBitDepth() == 10) {
                return 10;
            }
        }
        return 8;
    }

    private static List<Integer> getUseCasesPriorityOrder(List<UseCaseConfig<?>> newUseCaseConfigs) {
        List<Integer> priorityOrder = new ArrayList<>();
        List<Integer> priorityValueList = new ArrayList<>();
        Iterator<UseCaseConfig<?>> it = newUseCaseConfigs.iterator();
        while (it.hasNext()) {
            int priority = it.next().getSurfaceOccupancyPriority(0);
            if (!priorityValueList.contains(Integer.valueOf(priority))) {
                priorityValueList.add(Integer.valueOf(priority));
            }
        }
        Collections.sort(priorityValueList);
        Collections.reverse(priorityValueList);
        Iterator<Integer> it2 = priorityValueList.iterator();
        while (it2.hasNext()) {
            int priorityValue = it2.next().intValue();
            for (UseCaseConfig<?> config : newUseCaseConfigs) {
                if (priorityValue == config.getSurfaceOccupancyPriority(0)) {
                    priorityOrder.add(Integer.valueOf(newUseCaseConfigs.indexOf(config)));
                }
            }
        }
        return priorityOrder;
    }

    private List<List<Size>> getAllPossibleSizeArrangements(List<List<Size>> supportedOutputSizesList) {
        int totalArrangementsCount = 1;
        for (List<Size> supportedOutputSizes : supportedOutputSizesList) {
            totalArrangementsCount *= supportedOutputSizes.size();
        }
        if (totalArrangementsCount == 0) {
            throw new IllegalArgumentException("Failed to find supported resolutions.");
        }
        List<List<Size>> allPossibleSizeArrangements = new ArrayList<>();
        for (int i = 0; i < totalArrangementsCount; i++) {
            List<Size> sizeList = new ArrayList<>();
            allPossibleSizeArrangements.add(sizeList);
        }
        int currentRunCount = totalArrangementsCount;
        int nextRunCount = currentRunCount / supportedOutputSizesList.get(0).size();
        for (int currentIndex = 0; currentIndex < supportedOutputSizesList.size(); currentIndex++) {
            List<Size> supportedOutputSizes2 = supportedOutputSizesList.get(currentIndex);
            for (int i2 = 0; i2 < totalArrangementsCount; i2++) {
                List<Size> surfaceConfigList = allPossibleSizeArrangements.get(i2);
                surfaceConfigList.add(supportedOutputSizes2.get((i2 % currentRunCount) / nextRunCount));
            }
            int i3 = supportedOutputSizesList.size();
            if (currentIndex < i3 - 1) {
                currentRunCount = nextRunCount;
                nextRunCount = currentRunCount / supportedOutputSizesList.get(currentIndex + 1).size();
            }
        }
        return allPossibleSizeArrangements;
    }

    private Size getMaxOutputSizeByFormat(StreamConfigurationMap map, int imageFormat, boolean highResolutionIncluded, Rational aspectRatio) {
        Size[] highResolutionOutputSizes;
        Size[] outputSizes = getOutputSizes(map, imageFormat, aspectRatio);
        if (outputSizes == null || outputSizes.length == 0) {
            return null;
        }
        CompareSizesByArea compareSizesByArea = new CompareSizesByArea();
        Size maxSize = (Size) Collections.max(Arrays.asList(outputSizes), compareSizesByArea);
        Size maxHighResolutionSize = SizeUtil.RESOLUTION_ZERO;
        if (highResolutionIncluded && (highResolutionOutputSizes = Api23Impl.getHighResolutionOutputSizes(map, imageFormat)) != null && highResolutionOutputSizes.length > 0) {
            maxHighResolutionSize = (Size) Collections.max(Arrays.asList(highResolutionOutputSizes), compareSizesByArea);
        }
        return (Size) Collections.max(Arrays.asList(maxSize, maxHighResolutionSize), compareSizesByArea);
    }

    private static Size[] getOutputSizes(StreamConfigurationMap map, int imageFormat, Rational aspectRatio) {
        Size[] outputSizes = null;
        try {
            if (imageFormat == 34) {
                outputSizes = map.getOutputSizes(SurfaceTexture.class);
            } else {
                Size[] outputSizes2 = map.getOutputSizes(imageFormat);
                outputSizes = outputSizes2;
            }
        } catch (Throwable th) {
        }
        if (outputSizes == null || outputSizes.length == 0) {
            return null;
        }
        if (aspectRatio != null) {
            List<Size> filteredSizes = new ArrayList<>();
            for (Size size : outputSizes) {
                if (AspectRatioUtil.hasMatchingAspectRatio(size, aspectRatio)) {
                    filteredSizes.add(size);
                }
            }
            if (filteredSizes.isEmpty()) {
                return null;
            }
            Size[] outputSizes3 = (Size[]) filteredSizes.toArray(new Size[0]);
            return outputSizes3;
        }
        return outputSizes;
    }

    private void generateSupportedCombinationList() {
        this.mSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.generateSupportedCombinationList(this.mHardwareLevel, this.mIsRawSupported, this.mIsBurstCaptureSupported));
        this.mSurfaceCombinations.addAll(this.mExtraSupportedSurfaceCombinationsContainer.get(this.mCameraId));
    }

    private void generateUltraHighSupportedCombinationList() {
        this.mUltraHighSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.getUltraHighResolutionSupportedCombinationList());
    }

    private void generateConcurrentSupportedCombinationList() {
        this.mConcurrentSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.getConcurrentSupportedCombinationList());
    }

    private void generate10BitSupportedCombinationList() {
        this.mSurfaceCombinations10Bit.addAll(GuaranteedConfigurationsUtil.get10BitSupportedCombinationList());
    }

    private void generateUltraHdrSupportedCombinationList() {
        this.mSurfaceCombinationsUltraHdr.addAll(GuaranteedConfigurationsUtil.getUltraHdrSupportedCombinationList());
    }

    private void generateStreamUseCaseSupportedCombinationList() {
        if (Build.VERSION.SDK_INT >= 33) {
            this.mSurfaceCombinationsStreamUseCase.addAll(GuaranteedConfigurationsUtil.getStreamUseCaseSupportedCombinationList());
        }
    }

    private void generatePreviewStabilizationSupportedCombinationList() {
        if (Build.VERSION.SDK_INT >= 33) {
            this.mPreviewStabilizationSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.getPreviewStabilizationSupportedCombinationList());
        }
    }

    private void generateHighSpeedSupportedCombinationList() {
        if (!this.mHighSpeedResolver.isHighSpeedSupported()) {
            return;
        }
        this.mHighSpeedSurfaceCombinations.clear();
        Size maxSize = this.mHighSpeedResolver.getMaxSize();
        if (maxSize != null) {
            this.mHighSpeedSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.generateHighSpeedSupportedCombinationList(maxSize, getUpdatedSurfaceSizeDefinitionByFormat(34)));
        }
    }

    private void generateFcqSurfaceCombinations() {
        this.mFcqSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.generateQueryableFcqCombinations());
    }

    private void checkCustomization() {
    }

    private void generateSurfaceSizeDefinition() {
        Size previewSize = this.mDisplayInfoManager.getPreviewSize();
        Size recordSize = getRecordSize();
        this.mSurfaceSizeDefinition = SurfaceSizeDefinition.create(SizeUtil.RESOLUTION_VGA, new HashMap(), previewSize, new HashMap(), recordSize, new HashMap(), new HashMap(), new HashMap(), new HashMap());
    }

    SurfaceSizeDefinition getUpdatedSurfaceSizeDefinitionByFormat(int format) {
        if (!this.mSurfaceSizeDefinitionFormats.contains(Integer.valueOf(format))) {
            updateS720pOrS1440pSizeByFormat(this.mSurfaceSizeDefinition.getS720pSizeMap(), SizeUtil.RESOLUTION_720P, format);
            updateS720pOrS1440pSizeByFormat(this.mSurfaceSizeDefinition.getS1440pSizeMap(), SizeUtil.RESOLUTION_1440P, format);
            updateMaximumSizeByFormat(this.mSurfaceSizeDefinition.getMaximumSizeMap(), format, null);
            updateMaximumSizeByFormat(this.mSurfaceSizeDefinition.getMaximum4x3SizeMap(), format, AspectRatioUtil.ASPECT_RATIO_4_3);
            updateMaximumSizeByFormat(this.mSurfaceSizeDefinition.getMaximum16x9SizeMap(), format, AspectRatioUtil.ASPECT_RATIO_16_9);
            updateUltraMaximumSizeByFormat(this.mSurfaceSizeDefinition.getUltraMaximumSizeMap(), format);
            this.mSurfaceSizeDefinitionFormats.add(Integer.valueOf(format));
        }
        return this.mSurfaceSizeDefinition;
    }

    private void updateS720pOrS1440pSizeByFormat(Map<Integer, Size> sizeMap, Size targetSize, int format) {
        if (!this.mIsConcurrentCameraModeSupported) {
            return;
        }
        StreamConfigurationMap originalMap = this.mCharacteristics.getStreamConfigurationMapCompat().toStreamConfigurationMap();
        Size maxOutputSize = getMaxOutputSizeByFormat(originalMap, format, false, null);
        sizeMap.put(Integer.valueOf(format), maxOutputSize == null ? targetSize : (Size) Collections.min(Arrays.asList(targetSize, maxOutputSize), new CompareSizesByArea()));
    }

    private void updateMaximumSizeByFormat(Map<Integer, Size> sizeMap, int format, Rational aspectRatio) {
        StreamConfigurationMap originalMap = this.mCharacteristics.getStreamConfigurationMapCompat().toStreamConfigurationMap();
        Size maxOutputSize = getMaxOutputSizeByFormat(originalMap, format, true, aspectRatio);
        if (maxOutputSize != null) {
            sizeMap.put(Integer.valueOf(format), maxOutputSize);
        }
    }

    private void updateUltraMaximumSizeByFormat(Map<Integer, Size> sizeMap, int format) {
        StreamConfigurationMap maximumResolutionMap;
        if (Build.VERSION.SDK_INT < 31 || !this.mIsUltraHighResolutionSensorSupported || (maximumResolutionMap = (StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP_MAXIMUM_RESOLUTION)) == null) {
            return;
        }
        sizeMap.put(Integer.valueOf(format), getMaxOutputSizeByFormat(maximumResolutionMap, format, true, null));
    }

    private void refreshPreviewSize() {
        this.mDisplayInfoManager.refresh();
        if (this.mSurfaceSizeDefinition == null) {
            generateSurfaceSizeDefinition();
        } else {
            Size previewSize = this.mDisplayInfoManager.getPreviewSize();
            this.mSurfaceSizeDefinition = SurfaceSizeDefinition.create(this.mSurfaceSizeDefinition.getAnalysisSize(), this.mSurfaceSizeDefinition.getS720pSizeMap(), previewSize, this.mSurfaceSizeDefinition.getS1440pSizeMap(), this.mSurfaceSizeDefinition.getRecordSize(), this.mSurfaceSizeDefinition.getMaximumSizeMap(), this.mSurfaceSizeDefinition.getMaximum4x3SizeMap(), this.mSurfaceSizeDefinition.getMaximum16x9SizeMap(), this.mSurfaceSizeDefinition.getUltraMaximumSizeMap());
        }
    }

    private Size getRecordSize() {
        try {
            int cameraId = Integer.parseInt(this.mCameraId);
            Size recordSize = getRecordSizeFromCamcorderProfile(cameraId);
            if (recordSize != null) {
                return recordSize;
            }
        } catch (NumberFormatException e) {
        }
        Size recordSize2 = getRecordSizeFromStreamConfigurationMap();
        if (recordSize2 != null) {
            return recordSize2;
        }
        return SizeUtil.RESOLUTION_480P;
    }

    private Size getRecordSizeFromStreamConfigurationMap() {
        StreamConfigurationMapCompat mapCompat = this.mCharacteristics.getStreamConfigurationMapCompat();
        Size[] videoSizeArr = null;
        try {
            videoSizeArr = mapCompat.toStreamConfigurationMap().getOutputSizes(MediaRecorder.class);
        } catch (Throwable th) {
        }
        if (videoSizeArr == null) {
            return null;
        }
        Arrays.sort(videoSizeArr, new CompareSizesByArea(true));
        for (Size size : videoSizeArr) {
            if (size.getWidth() <= SizeUtil.RESOLUTION_1080P.getWidth() && size.getHeight() <= SizeUtil.RESOLUTION_1080P.getHeight()) {
                return size;
            }
        }
        return null;
    }

    private Size getRecordSizeFromCamcorderProfile(int cameraId) {
        CamcorderProfile profile;
        int[] qualities = {1, 13, 10, 8, 12, 6, 5, 4};
        for (int quality : qualities) {
            if (this.mCamcorderProfileHelper.hasProfile(cameraId, quality) && (profile = this.mCamcorderProfileHelper.get(cameraId, quality)) != null) {
                return new Size(profile.videoFrameWidth, profile.videoFrameHeight);
            }
        }
        return null;
    }

    static class Api23Impl {
        private Api23Impl() {
        }

        static Size[] getHighResolutionOutputSizes(StreamConfigurationMap streamConfigurationMap, int format) {
            return streamConfigurationMap.getHighResolutionOutputSizes(format);
        }
    }

    static abstract class BestSizesAndMaxFpsForConfigs {
        abstract List<Size> getBestSizes();

        abstract List<Size> getBestSizesForStreamUseCase();

        abstract int getMaxFpsForAllSizes();

        abstract int getMaxFpsForBestSizes();

        abstract int getMaxFpsForStreamUseCase();

        BestSizesAndMaxFpsForConfigs() {
        }

        static BestSizesAndMaxFpsForConfigs of(List<Size> bestSizes, List<Size> bestSizesForStreamUseCase, int maxFpsForBestSizes, int maxFpsForStreamUseCase, int maxFpsForAllSizes) {
            return new AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs(bestSizes, bestSizesForStreamUseCase, maxFpsForBestSizes, maxFpsForStreamUseCase, maxFpsForAllSizes);
        }
    }

    public static abstract class FeatureSettings {
        abstract int getCameraMode();

        abstract int getRequiredMaxBitDepth();

        abstract Range<Integer> getTargetFpsRange();

        abstract boolean hasVideoCapture();

        abstract boolean isFeatureComboInvocation();

        abstract boolean isHighSpeedOn();

        abstract boolean isPreviewStabilizationOn();

        abstract boolean isStrictFpsRequired();

        abstract boolean isUltraHdrOn();

        abstract boolean requiresFeatureComboQuery();

        static FeatureSettings of(int cameraMode, boolean hasVideoCapture, int requiredMaxBitDepth, boolean isPreviewStabilizationOn, boolean isUltraHdrOn, boolean isHighSpeedOn, boolean isFeatureComboInvocation, boolean requiresFeatureComboQuery, Range<Integer> targetFpsRange, boolean isStrictFpsRequired) {
            return new AutoValue_SupportedSurfaceCombination_FeatureSettings(cameraMode, hasVideoCapture, requiredMaxBitDepth, isPreviewStabilizationOn, isUltraHdrOn, isHighSpeedOn, isFeatureComboInvocation, requiresFeatureComboQuery, targetFpsRange, isStrictFpsRequired);
        }
    }
}
