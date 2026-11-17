package androidx.camera.core.impl;

import android.util.Range;
import android.util.Rational;
import androidx.arch.core.util.Function;
import androidx.camera.core.ExposureState;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.UseCase;
import androidx.camera.core.ZoomState;
import androidx.camera.core.impl.utils.LiveDataUtil;
import androidx.camera.core.impl.utils.SessionProcessorUtil;
import androidx.camera.core.internal.ImmutableZoomState;
import androidx.core.math.MathUtils;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;

/* loaded from: classes.dex */
public class AdapterCameraInfo extends ForwardingCameraInfo {
    public static final int CAMERA_OPERATION_AE_REGION = 3;
    public static final int CAMERA_OPERATION_AF_REGION = 2;
    public static final int CAMERA_OPERATION_AUTO_FOCUS = 1;
    public static final int CAMERA_OPERATION_AWB_REGION = 4;
    public static final int CAMERA_OPERATION_EXPOSURE_COMPENSATION = 7;
    public static final int CAMERA_OPERATION_EXTENSION_STRENGTH = 8;
    public static final int CAMERA_OPERATION_FLASH = 5;
    public static final int CAMERA_OPERATION_TORCH = 6;
    public static final int CAMERA_OPERATION_ZOOM = 0;
    private final CameraConfig mCameraConfig;
    private final CameraInfoInternal mCameraInfo;
    private LiveData<ZoomState> mExtensionZoomStateLiveData;
    private boolean mIsCaptureProcessProgressSupported;
    private boolean mIsPostviewSupported;
    private final SessionProcessor mSessionProcessor;

    @Retention(RetentionPolicy.SOURCE)
    public @interface CameraOperation {
    }

    public AdapterCameraInfo(CameraInfoInternal cameraInfo, CameraConfig cameraConfig) {
        super(cameraInfo);
        this.mIsPostviewSupported = false;
        this.mIsCaptureProcessProgressSupported = false;
        this.mExtensionZoomStateLiveData = null;
        this.mCameraInfo = cameraInfo;
        this.mCameraConfig = cameraConfig;
        this.mSessionProcessor = cameraConfig.getSessionProcessor(null);
        setPostviewSupported(cameraConfig.isPostviewSupported());
        setCaptureProcessProgressSupported(cameraConfig.isCaptureProcessProgressSupported());
    }

    public CameraConfig getCameraConfig() {
        return this.mCameraConfig;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.impl.CameraInfoInternal
    public CameraInfoInternal getImplementation() {
        return this.mCameraInfo;
    }

    public SessionProcessor getSessionProcessor() {
        return this.mSessionProcessor;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.CameraInfo
    public boolean hasFlashUnit() {
        if (!SessionProcessorUtil.isOperationSupported(this.mSessionProcessor, 5)) {
            return false;
        }
        return this.mCameraInfo.hasFlashUnit();
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.CameraInfo
    public LiveData<Integer> getTorchState() {
        if (!SessionProcessorUtil.isOperationSupported(this.mSessionProcessor, 6)) {
            return new MutableLiveData(0);
        }
        return this.mCameraInfo.getTorchState();
    }

    public static float getZoomRatioByPercentage(float percentage, float minZoomRatio, float maxZoomRatio) {
        if (percentage == 1.0f) {
            return maxZoomRatio;
        }
        if (percentage == 0.0f) {
            return minZoomRatio;
        }
        double cropWidthInMaxZoom = 1.0f / maxZoomRatio;
        double cropWidthInMinZoom = 1.0f / minZoomRatio;
        double cropWidth = ((cropWidthInMaxZoom - cropWidthInMinZoom) * percentage) + cropWidthInMinZoom;
        double ratio = 1.0d / cropWidth;
        return (float) MathUtils.clamp(ratio, minZoomRatio, maxZoomRatio);
    }

    public static float getPercentageByRatio(float ratio, float minZoomRatio, float maxZoomRatio) {
        if (maxZoomRatio == minZoomRatio) {
            return 0.0f;
        }
        if (ratio == maxZoomRatio) {
            return 1.0f;
        }
        if (ratio == minZoomRatio) {
            return 0.0f;
        }
        float cropWidth = 1.0f / ratio;
        float cropWidthInMaxZoom = 1.0f / maxZoomRatio;
        float cropWidthInMinZoom = 1.0f / minZoomRatio;
        return (cropWidth - cropWidthInMinZoom) / (cropWidthInMaxZoom - cropWidthInMinZoom);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.CameraInfo
    public LiveData<ZoomState> getZoomState() {
        if (!SessionProcessorUtil.isOperationSupported(this.mSessionProcessor, 0)) {
            return new MutableLiveData(ImmutableZoomState.create(1.0f, 1.0f, 1.0f, 0.0f));
        }
        if (this.mSessionProcessor != null) {
            ZoomState zoomState = this.mCameraInfo.getZoomState().getValue();
            final Range<Float> extensionsZoomRange = this.mSessionProcessor.getExtensionZoomRange();
            if (extensionsZoomRange != null && (extensionsZoomRange.getLower().floatValue() != zoomState.getMinZoomRatio() || extensionsZoomRange.getUpper().floatValue() != zoomState.getMaxZoomRatio())) {
                if (this.mExtensionZoomStateLiveData == null) {
                    this.mExtensionZoomStateLiveData = LiveDataUtil.map(this.mCameraInfo.getZoomState(), new Function() { // from class: androidx.camera.core.impl.AdapterCameraInfo$$ExternalSyntheticLambda0
                        @Override // androidx.arch.core.util.Function
                        public final Object apply(Object obj) {
                            ZoomState create;
                            create = ImmutableZoomState.create(r2.getZoomRatio(), ((Float) r0.getUpper()).floatValue(), ((Float) r0.getLower()).floatValue(), AdapterCameraInfo.getPercentageByRatio(((ZoomState) obj).getZoomRatio(), ((Float) r0.getLower()).floatValue(), ((Float) extensionsZoomRange.getUpper()).floatValue()));
                            return create;
                        }
                    });
                }
                return this.mExtensionZoomStateLiveData;
            }
        }
        return this.mCameraInfo.getZoomState();
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.CameraInfo
    public ExposureState getExposureState() {
        if (!SessionProcessorUtil.isOperationSupported(this.mSessionProcessor, 7)) {
            return new ExposureState() { // from class: androidx.camera.core.impl.AdapterCameraInfo.1
                @Override // androidx.camera.core.ExposureState
                public int getExposureCompensationIndex() {
                    return 0;
                }

                @Override // androidx.camera.core.ExposureState
                public Range<Integer> getExposureCompensationRange() {
                    return new Range<>(0, 0);
                }

                @Override // androidx.camera.core.ExposureState
                public Rational getExposureCompensationStep() {
                    return Rational.ZERO;
                }

                @Override // androidx.camera.core.ExposureState
                public boolean isExposureCompensationSupported() {
                    return false;
                }
            };
        }
        return this.mCameraInfo.getExposureState();
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.CameraInfo
    public boolean isFocusMeteringSupported(FocusMeteringAction action) {
        FocusMeteringAction modifiedAction = SessionProcessorUtil.getModifiedFocusMeteringAction(this.mSessionProcessor, action);
        if (modifiedAction == null) {
            return false;
        }
        return this.mCameraInfo.isFocusMeteringSupported(modifiedAction);
    }

    public void setPostviewSupported(boolean isPostviewSupported) {
        this.mIsPostviewSupported = isPostviewSupported;
    }

    public void setCaptureProcessProgressSupported(boolean isCaptureProcessProgressSupported) {
        this.mIsCaptureProcessProgressSupported = isCaptureProcessProgressSupported;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.impl.CameraInfoInternal
    public boolean isPostviewSupported() {
        return this.mIsPostviewSupported;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.impl.CameraInfoInternal
    public boolean isCaptureProcessProgressSupported() {
        return this.mIsCaptureProcessProgressSupported;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.impl.CameraInfoInternal
    public boolean isVideoStabilizationSupported() {
        int[] stabilizationModes;
        if (this.mSessionProcessor != null && (stabilizationModes = this.mSessionProcessor.getExtensionAvailableStabilizationModes()) != null) {
            for (int mode : stabilizationModes) {
                if (mode == 1) {
                    return true;
                }
            }
            return false;
        }
        return super.isVideoStabilizationSupported();
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.impl.CameraInfoInternal
    public boolean isPreviewStabilizationSupported() {
        int[] stabilizationModes;
        if (this.mSessionProcessor != null && (stabilizationModes = this.mSessionProcessor.getExtensionAvailableStabilizationModes()) != null) {
            for (int mode : stabilizationModes) {
                if (mode == 2) {
                    return true;
                }
            }
            return false;
        }
        return super.isPreviewStabilizationSupported();
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.impl.CameraInfoInternal
    public boolean isUseCaseCombinationSupported(List<UseCase> useCases, int cameraMode, boolean isFeatureComboInvocation) {
        return this.mCameraInfo.isUseCaseCombinationSupported(useCases, cameraMode, isFeatureComboInvocation, this.mCameraConfig);
    }
}
