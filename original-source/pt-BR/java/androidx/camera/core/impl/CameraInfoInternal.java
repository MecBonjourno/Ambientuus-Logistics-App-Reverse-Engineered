package androidx.camera.core.impl;

import android.graphics.Rect;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraUseCaseAdapterProvider;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.UseCase;
import androidx.camera.core.featuregroup.GroupableFeature;
import androidx.camera.core.featuregroup.impl.ResolvedFeatureGroup;
import androidx.camera.core.impl.utils.RangeUtil;
import androidx.camera.core.internal.CalculatedUseCaseInfo;
import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.core.util.Preconditions;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public interface CameraInfoInternal extends CameraInfo {
    void addSessionCaptureCallback(Executor executor, CameraCaptureCallback cameraCaptureCallback);

    Set<Integer> getAvailableCapabilities();

    Object getCameraCharacteristics();

    String getCameraId();

    @Override // androidx.camera.core.CameraInfo
    CameraIdentifier getCameraIdentifier();

    Quirks getCameraQuirks();

    @Override // androidx.camera.core.CameraInfo
    CameraSelector getCameraSelector();

    EncoderProfilesProvider getEncoderProfilesProvider();

    CameraInfoInternal getImplementation();

    Object getPhysicalCameraCharacteristics(String str);

    Rect getSensorRect();

    Set<DynamicRange> getSupportedDynamicRanges();

    @Override // androidx.camera.core.CameraInfo
    Set<Range<Integer>> getSupportedFrameRateRanges(androidx.camera.core.SessionConfig sessionConfig);

    List<Size> getSupportedHighResolutions(int i);

    Set<Range<Integer>> getSupportedHighSpeedFrameRateRanges();

    Set<Range<Integer>> getSupportedHighSpeedFrameRateRangesFor(Size size);

    List<Size> getSupportedHighSpeedResolutions();

    List<Size> getSupportedHighSpeedResolutionsFor(Range<Integer> range);

    Set<Integer> getSupportedOutputFormats();

    List<Size> getSupportedResolutions(int i);

    Timebase getTimebase();

    boolean isCaptureProcessProgressSupported();

    @Override // androidx.camera.core.CameraInfo
    boolean isFeatureGroupSupported(androidx.camera.core.SessionConfig sessionConfig);

    boolean isHighSpeedSupported();

    boolean isPostviewSupported();

    boolean isPreviewStabilizationSupported();

    boolean isResolvedFeatureGroupSupported(ResolvedFeatureGroup resolvedFeatureGroup, androidx.camera.core.SessionConfig sessionConfig);

    boolean isUseCaseCombinationSupported(List<UseCase> list);

    boolean isUseCaseCombinationSupported(List<UseCase> list, int i);

    boolean isUseCaseCombinationSupported(List<UseCase> list, int i, boolean z);

    boolean isUseCaseCombinationSupported(List<UseCase> list, int i, boolean z, CameraConfig cameraConfig);

    boolean isVideoStabilizationSupported();

    void removeSessionCaptureCallback(CameraCaptureCallback cameraCaptureCallback);

    void setCameraUseCaseAdapterProvider(CameraUseCaseAdapterProvider cameraUseCaseAdapterProvider);

    /* renomeado de: androidx.camera.core.impl.CameraInfoInternal$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static Set $default$getSupportedFrameRateRanges(CameraInfoInternal _this, androidx.camera.core.SessionConfig sessionConfig) {
            Set<Range<Integer>> allSupportedFrameRates;
            try {
                CalculatedUseCaseInfo info = UseCaseAdditionSimulator.simulateAddUseCases(_this, sessionConfig, true);
                int maxSupportedFrameRate = info.getPrimaryStreamSpecResult().getMaxSupportedFrameRate();
                if (sessionConfig.getSessionType() == 1) {
                    allSupportedFrameRates = RangeUtil.filterFixedRanges(_this.getSupportedHighSpeedFrameRateRanges());
                } else {
                    allSupportedFrameRates = _this.getSupportedFrameRateRanges();
                }
                if (allSupportedFrameRates.isEmpty()) {
                    return Collections.emptySet();
                }
                LinkedHashSet<Range<Integer>> filteredFrameRates = new LinkedHashSet<>();
                for (Range<Integer> frameRate : allSupportedFrameRates) {
                    if (frameRate.getUpper().intValue() <= maxSupportedFrameRate) {
                        filteredFrameRates.add(frameRate);
                    }
                }
                return filteredFrameRates;
            } catch (Throwable t) {
                Logger.w("CameraInfoInternal", "Failed to get max supported frameRate by SessionConfig: " + sessionConfig, t);
                return Collections.emptySet();
            }
        }

        public static CameraInfoInternal $default$getImplementation(CameraInfoInternal _this) {
            return _this;
        }

        public static boolean $default$isPostviewSupported(CameraInfoInternal _this) {
            return false;
        }

        public static boolean $default$isCaptureProcessProgressSupported(CameraInfoInternal _this) {
            return false;
        }

        public static /* sintético */ List $private$lambda$getCameraSelector$0(CameraInfoInternal _this, List cameraInfos) {
            String cameraId = _this.getCameraId();
            Iterator it = cameraInfos.iterator();
            while (it.hasNext()) {
                CameraInfo cameraInfo = (CameraInfo) it.next();
                Preconditions.checkArgument(cameraInfo instanceof CameraInfoInternal);
                CameraInfoInternal cameraInfoInternal = (CameraInfoInternal) cameraInfo;
                if (cameraInfoInternal.getCameraId().equals(cameraId)) {
                    return Collections.singletonList(cameraInfo);
                }
            }
            throw new IllegalStateException("Unable to find camera with id " + cameraId + " from list of available cameras.");
        }

        public static boolean $default$isUseCaseCombinationSupported(CameraInfoInternal _this, List list, int cameraMode, boolean isFeatureComboInvocation, CameraConfig cameraConfig) {
            return false;
        }

        public static boolean $default$isFeatureGroupSupported(CameraInfoInternal _this, androidx.camera.core.SessionConfig sessionConfig) {
            try {
                UseCaseAdditionSimulator.simulateAddUseCases(_this, sessionConfig, false);
                return true;
            } catch (CameraUseCaseAdapter.CameraException | IllegalArgumentException e) {
                Logger.d("CameraInfoInternal", "CameraInfoInternal.isResolvedFeatureGroupSupported failed", e);
                return false;
            }
        }

        public static boolean $default$isResolvedFeatureGroupSupported(CameraInfoInternal _this, ResolvedFeatureGroup resolvedFeatureGroup, androidx.camera.core.SessionConfig sessionConfig) {
            for (GroupableFeature feature : resolvedFeatureGroup.getFeatures()) {
                if (!feature.isSupportedIndividually(_this, sessionConfig)) {
                    Logger.d("CameraInfoInternal", feature + " is not supported.");
                    return false;
                }
            }
            try {
                UseCaseAdditionSimulator.simulateAddUseCases(_this, sessionConfig, false, resolvedFeatureGroup);
                return true;
            } catch (CameraUseCaseAdapter.CameraException | IllegalArgumentException e) {
                Logger.d("CameraInfoInternal", "CameraInfoInternal.isResolvedFeatureGroupSupported failed", e);
                return false;
            }
        }
    }
}
