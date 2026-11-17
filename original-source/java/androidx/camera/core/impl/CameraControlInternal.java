package androidx.camera.core.impl;

import androidx.camera.core.CameraControl;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.imagecapture.CameraCapturePipeline;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.utils.futures.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public interface CameraControlInternal extends CameraControl {
    public static final CameraControlInternal DEFAULT_EMPTY_INSTANCE = new CameraControlInternal() { // from class: androidx.camera.core.impl.CameraControlInternal.2
        @Override // androidx.camera.core.impl.CameraControlInternal
        public /* synthetic */ void decrementVideoUsage() {
            CC.$default$decrementVideoUsage(this);
        }

        @Override // androidx.camera.core.CameraControl
        public /* synthetic */ ListenableFuture enableLowLightBoostAsync(boolean z) {
            ListenableFuture immediateFailedFuture;
            immediateFailedFuture = Futures.immediateFailedFuture(new CameraControl.OperationCanceledException("Not supported!"));
            return immediateFailedFuture;
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public /* synthetic */ ListenableFuture getCameraCapturePipelineAsync(int i, int i2) {
            return CC.$default$getCameraCapturePipelineAsync(this, i, i2);
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public /* synthetic */ CameraControlInternal getImplementation() {
            return CC.$default$getImplementation(this);
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public /* synthetic */ void incrementVideoUsage() {
            CC.$default$incrementVideoUsage(this);
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public /* synthetic */ boolean isInVideoUsage() {
            return CC.$default$isInVideoUsage(this);
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public /* synthetic */ void setLowLightBoostDisabledByUseCaseSessionConfig(boolean z) {
            CC.$default$setLowLightBoostDisabledByUseCaseSessionConfig(this, z);
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public /* synthetic */ void setScreenFlash(ImageCapture.ScreenFlash screenFlash) {
            CC.$default$setScreenFlash(this, screenFlash);
        }

        @Override // androidx.camera.core.CameraControl
        public /* synthetic */ ListenableFuture setTorchStrengthLevel(int i) {
            ListenableFuture immediateFailedFuture;
            immediateFailedFuture = Futures.immediateFailedFuture(new UnsupportedOperationException("Setting torch strength is not supported on the device."));
            return immediateFailedFuture;
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public int getFlashMode() {
            return 2;
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public void setFlashMode(int flashMode) {
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public void setZslDisabledByUserCaseConfig(boolean disabled) {
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public boolean isZslDisabledByByUserCaseConfig() {
            return false;
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public void addZslConfig(SessionConfig.Builder sessionConfigBuilder) {
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public void clearZslConfig() {
        }

        @Override // androidx.camera.core.CameraControl
        public ListenableFuture<Void> enableTorch(boolean torch) {
            return Futures.immediateFuture(null);
        }

        @Override // androidx.camera.core.CameraControl
        public ListenableFuture<Integer> setExposureCompensationIndex(int exposure) {
            return Futures.immediateFuture(0);
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public ListenableFuture<List<Void>> submitStillCaptureRequests(List<CaptureConfig> captureConfigs, int captureMode, int flashType) {
            return Futures.immediateFuture(Collections.emptyList());
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public SessionConfig getSessionConfig() {
            return SessionConfig.defaultEmptySessionConfig();
        }

        @Override // androidx.camera.core.CameraControl
        public ListenableFuture<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action) {
            return Futures.immediateFuture(FocusMeteringResult.emptyInstance());
        }

        @Override // androidx.camera.core.CameraControl
        public ListenableFuture<Void> cancelFocusAndMetering() {
            return Futures.immediateFuture(null);
        }

        @Override // androidx.camera.core.CameraControl
        public ListenableFuture<Void> setZoomRatio(float ratio) {
            return Futures.immediateFuture(null);
        }

        @Override // androidx.camera.core.CameraControl
        public ListenableFuture<Void> setLinearZoom(float linearZoom) {
            return Futures.immediateFuture(null);
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public void addInteropConfig(Config config) {
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public void clearInteropConfig() {
        }

        @Override // androidx.camera.core.impl.CameraControlInternal
        public Config getInteropConfig() {
            return null;
        }
    };

    public interface ControlUpdateCallback {
        void onCameraControlCaptureRequests(List<CaptureConfig> list);

        void onCameraControlUpdateSessionConfig();
    }

    void addInteropConfig(Config config);

    void addZslConfig(SessionConfig.Builder builder);

    void clearInteropConfig();

    void clearZslConfig();

    void decrementVideoUsage();

    ListenableFuture<CameraCapturePipeline> getCameraCapturePipelineAsync(int i, int i2);

    int getFlashMode();

    CameraControlInternal getImplementation();

    Config getInteropConfig();

    SessionConfig getSessionConfig();

    void incrementVideoUsage();

    boolean isInVideoUsage();

    boolean isZslDisabledByByUserCaseConfig();

    void setFlashMode(int i);

    void setLowLightBoostDisabledByUseCaseSessionConfig(boolean z);

    void setScreenFlash(ImageCapture.ScreenFlash screenFlash);

    void setZslDisabledByUserCaseConfig(boolean z);

    ListenableFuture<List<Void>> submitStillCaptureRequests(List<CaptureConfig> list, int i, int i2);

    /* renamed from: androidx.camera.core.impl.CameraControlInternal$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$setScreenFlash(CameraControlInternal _this, ImageCapture.ScreenFlash screenFlash) {
        }

        public static void $default$setLowLightBoostDisabledByUseCaseSessionConfig(CameraControlInternal _this, boolean disabled) {
        }

        public static ListenableFuture $default$getCameraCapturePipelineAsync(final CameraControlInternal _this, int captureMode, int flashType) {
            return Futures.immediateFuture(new CameraCapturePipeline() { // from class: androidx.camera.core.impl.CameraControlInternal.1
                @Override // androidx.camera.core.imagecapture.CameraCapturePipeline
                public ListenableFuture<Void> invokePreCapture() {
                    return Futures.immediateFuture(null);
                }

                @Override // androidx.camera.core.imagecapture.CameraCapturePipeline
                public ListenableFuture<Void> invokePostCapture() {
                    return Futures.immediateFuture(null);
                }
            });
        }

        public static CameraControlInternal $default$getImplementation(CameraControlInternal _this) {
            return _this;
        }

        public static void $default$incrementVideoUsage(CameraControlInternal _this) {
        }

        public static void $default$decrementVideoUsage(CameraControlInternal _this) {
        }

        public static boolean $default$isInVideoUsage(CameraControlInternal _this) {
            return false;
        }
    }

    public static final class CameraControlException extends Exception {
        private CameraCaptureFailure mCameraCaptureFailure;

        public CameraControlException(CameraCaptureFailure failure) {
            this.mCameraCaptureFailure = failure;
        }

        public CameraControlException(CameraCaptureFailure failure, Throwable cause) {
            super(cause);
            this.mCameraCaptureFailure = failure;
        }

        public CameraCaptureFailure getCameraCaptureFailure() {
            return this.mCameraCaptureFailure;
        }
    }
}
