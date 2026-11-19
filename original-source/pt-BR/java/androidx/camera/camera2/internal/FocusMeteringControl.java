package androidx.camera.camera2.internal;

import android.graphics.PointF;
import android.graphics.Rect;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.MeteringRectangle;
import android.os.Build;
import android.util.Log;
import android.util.Rational;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.workaround.MeteringRegionCorrection;
import androidx.camera.core.CameraControl;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.Logger;
import androidx.camera.core.MeteringPoint;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* carregado de: classes.dex */
class FocusMeteringControl {
    static final long AUTO_FOCUS_TIMEOUT_DURATION = 5000;
    private static final MeteringRectangle[] EMPTY_RECTANGLES = new MeteringRectangle[0];
    private static final String TAG = "FocusMeteringControl";
    private ScheduledFuture<?> mAutoCancelHandle;
    private ScheduledFuture<?> mAutoFocusTimeoutHandle;
    private final Camera2CameraControlImpl mCameraControl;
    final Executor mExecutor;
    private final MeteringRegionCorrection mMeteringRegionCorrection;
    private final ScheduledExecutorService mScheduler;
    private volatile boolean mIsActive = false;
    private volatile Rational mPreviewAspectRatio = null;
    private boolean mIsInAfAutoMode = false;
    Integer mCurrentAfState = 0;
    long mFocusTimeoutCounter = 0;
    boolean mIsAutoFocusCompleted = false;
    boolean mIsFocusSuccessful = false;
    private int mTemplate = 1;
    private Camera2CameraControlImpl.CaptureResultListener mSessionListenerForFocus = null;
    private Camera2CameraControlImpl.CaptureResultListener mSessionListenerForCancel = null;
    private MeteringRectangle[] mAfRects = EMPTY_RECTANGLES;
    private MeteringRectangle[] mAeRects = EMPTY_RECTANGLES;
    private MeteringRectangle[] mAwbRects = EMPTY_RECTANGLES;
    CallbackToFutureAdapter.Completer<FocusMeteringResult> mRunningActionCompleter = null;
    CallbackToFutureAdapter.Completer<Void> mRunningCancelCompleter = null;
    private boolean mIsExternalFlashAeModeEnabled = false;
    private Camera2CameraControlImpl.CaptureResultListener mSessionListenerForAeMode = null;

    FocusMeteringControl(Camera2CameraControlImpl cameraControl, ScheduledExecutorService scheduler, Executor executor, Quirks cameraQuirks) {
        this.mCameraControl = cameraControl;
        this.mExecutor = executor;
        this.mScheduler = scheduler;
        this.mMeteringRegionCorrection = new MeteringRegionCorrection(cameraQuirks);
    }

    void setActive(boolean isActive) {
        if (isActive == this.mIsActive) {
            return;
        }
        this.mIsActive = isActive;
        if (!this.mIsActive) {
            cancelFocusAndMeteringWithoutAsyncResult();
        }
    }

    public void setPreviewAspectRatio(Rational previewAspectRatio) {
        this.mPreviewAspectRatio = previewAspectRatio;
    }

    private Rational getDefaultAspectRatio() {
        if (this.mPreviewAspectRatio != null) {
            return this.mPreviewAspectRatio;
        }
        Rect cropSensorRegion = this.mCameraControl.getCropSensorRegion();
        return new Rational(cropSensorRegion.width(), cropSensorRegion.height());
    }

    void setTemplate(int template) {
        this.mTemplate = template;
    }

    void addFocusMeteringOptions(Camera2ImplConfig.Builder configBuilder) {
        int afMode;
        if (this.mIsInAfAutoMode) {
            afMode = 1;
        } else {
            afMode = getDefaultAfMode();
        }
        configBuilder.setCaptureRequestOptionWithPriority(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(this.mCameraControl.getSupportedAfMode(afMode)), Config.OptionPriority.REQUIRED);
        if (this.mAfRects.length != 0) {
            configBuilder.setCaptureRequestOptionWithPriority(CaptureRequest.CONTROL_AF_REGIONS, this.mAfRects, Config.OptionPriority.REQUIRED);
        }
        if (this.mAeRects.length != 0) {
            configBuilder.setCaptureRequestOptionWithPriority(CaptureRequest.CONTROL_AE_REGIONS, this.mAeRects, Config.OptionPriority.REQUIRED);
        }
        if (this.mAwbRects.length != 0) {
            configBuilder.setCaptureRequestOptionWithPriority(CaptureRequest.CONTROL_AWB_REGIONS, this.mAwbRects, Config.OptionPriority.REQUIRED);
        }
    }

    private static boolean isValid(MeteringPoint pt) {
        return pt.getX() >= 0.0f && pt.getX() <= 1.0f && pt.getY() >= 0.0f && pt.getY() <= 1.0f;
    }

    private static PointF getFovAdjustedPoint(MeteringPoint meteringPoint, Rational cropRegionAspectRatio, Rational defaultAspectRatio, int meteringMode, MeteringRegionCorrection correction) {
        Rational fovAspectRatio = defaultAspectRatio;
        if (meteringPoint.getSurfaceAspectRatio() != null) {
            fovAspectRatio = meteringPoint.getSurfaceAspectRatio();
        }
        PointF adjustedPoint = correction.getCorrectedPoint(meteringPoint, meteringMode);
        if (!fovAspectRatio.equals(cropRegionAspectRatio)) {
            if (fovAspectRatio.compareTo(cropRegionAspectRatio) > 0) {
                float heightOfCropRegion = (float) (fovAspectRatio.doubleValue() / cropRegionAspectRatio.doubleValue());
                float top_padding = (float) ((heightOfCropRegion - 1.0d) / 2.0d);
                adjustedPoint.y = (adjustedPoint.y + top_padding) * (1.0f / heightOfCropRegion);
            } else {
                float widthOfCropRegion = (float) (cropRegionAspectRatio.doubleValue() / fovAspectRatio.doubleValue());
                float left_padding = (float) ((widthOfCropRegion - 1.0d) / 2.0d);
                adjustedPoint.x = (adjustedPoint.x + left_padding) * (1.0f / widthOfCropRegion);
            }
        }
        return adjustedPoint;
    }

    private static MeteringRectangle getMeteringRect(MeteringPoint meteringPoint, PointF adjustedPoint, Rect cropRegion) {
        int centerX = (int) (cropRegion.left + (adjustedPoint.x * cropRegion.width()));
        int centerY = (int) (cropRegion.top + (adjustedPoint.y * cropRegion.height()));
        int width = (int) (meteringPoint.getSize() * cropRegion.width());
        int height = (int) (meteringPoint.getSize() * cropRegion.height());
        Rect focusRect = new Rect(centerX - (width / 2), centerY - (height / 2), (width / 2) + centerX, (height / 2) + centerY);
        focusRect.left = rangeLimit(focusRect.left, cropRegion.right, cropRegion.left);
        focusRect.right = rangeLimit(focusRect.right, cropRegion.right, cropRegion.left);
        focusRect.top = rangeLimit(focusRect.top, cropRegion.bottom, cropRegion.top);
        focusRect.bottom = rangeLimit(focusRect.bottom, cropRegion.bottom, cropRegion.top);
        return new MeteringRectangle(focusRect, 1000);
    }

    private static int rangeLimit(int val, int max, int min) {
        return Math.min(Math.max(val, min), max);
    }

    ListenableFuture<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action) {
        return startFocusAndMetering(action, 5000L);
    }

    ListenableFuture<FocusMeteringResult> startFocusAndMetering(final FocusMeteringAction action, final long timeoutDurationMs) {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda8
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return FocusMeteringControl.this.m75xb5d4fd7e(action, timeoutDurationMs, completer);
            }
        });
    }

    /* renomeado de: lambda$startFocusAndMetering$1$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ Object m75xb5d4fd7e(final FocusMeteringAction action, final long timeoutDurationMs, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m74x8c80a83d(completer, action, timeoutDurationMs);
            }
        });
        return "startFocusAndMetering";
    }

    private List<MeteringRectangle> getMeteringRectangles(List<MeteringPoint> meteringPoints, int maxRegionCount, Rational defaultAspectRatio, Rect cropSensorRegion, int meteringMode) {
        if (meteringPoints.isEmpty() || maxRegionCount == 0) {
            return Collections.emptyList();
        }
        List<MeteringRectangle> meteringRectanglesList = new ArrayList<>();
        Rational cropRegionAspectRatio = new Rational(cropSensorRegion.width(), cropSensorRegion.height());
        for (MeteringPoint meteringPoint : meteringPoints) {
            if (meteringRectanglesList.size() == maxRegionCount) {
                break;
            }
            if (isValid(meteringPoint)) {
                PointF adjustedPoint = getFovAdjustedPoint(meteringPoint, cropRegionAspectRatio, defaultAspectRatio, meteringMode, this.mMeteringRegionCorrection);
                MeteringRectangle meteringRectangle = getMeteringRect(meteringPoint, adjustedPoint, cropSensorRegion);
                if (meteringRectangle.getWidth() != 0 && meteringRectangle.getHeight() != 0) {
                    meteringRectanglesList.add(meteringRectangle);
                }
            }
        }
        return DesugarCollections.unmodifiableList(meteringRectanglesList);
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* renomeado de: startFocusAndMeteringInternal, motivo: mesclado com método bridge [métodos inline] */
    public void m74x8c80a83d(CallbackToFutureAdapter.Completer<FocusMeteringResult> completer, FocusMeteringAction action, long timeoutDurationMs) {
        if (!this.mIsActive) {
            completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
            return;
        }
        Rect cropSensorRegion = this.mCameraControl.getCropSensorRegion();
        Rational defaultAspectRatio = getDefaultAspectRatio();
        List<MeteringRectangle> rectanglesAf = getMeteringRectangles(action.getMeteringPointsAf(), this.mCameraControl.getMaxAfRegionCount(), defaultAspectRatio, cropSensorRegion, 1);
        List<MeteringRectangle> rectanglesAe = getMeteringRectangles(action.getMeteringPointsAe(), this.mCameraControl.getMaxAeRegionCount(), defaultAspectRatio, cropSensorRegion, 2);
        List<MeteringRectangle> rectanglesAwb = getMeteringRectangles(action.getMeteringPointsAwb(), this.mCameraControl.getMaxAwbRegionCount(), defaultAspectRatio, cropSensorRegion, 4);
        if (rectanglesAf.isEmpty() && rectanglesAe.isEmpty() && rectanglesAwb.isEmpty()) {
            completer.setException(new IllegalArgumentException("None of the specified AF/AE/AWB MeteringPoints is supported on this camera."));
            return;
        }
        failActionFuture("Cancelled by another startFocusAndMetering()");
        failCancelFuture("Cancelled by another startFocusAndMetering()");
        disableAutoCancel();
        this.mRunningActionCompleter = completer;
        executeMeteringAction((MeteringRectangle[]) rectanglesAf.toArray(EMPTY_RECTANGLES), (MeteringRectangle[]) rectanglesAe.toArray(EMPTY_RECTANGLES), (MeteringRectangle[]) rectanglesAwb.toArray(EMPTY_RECTANGLES), action, timeoutDurationMs);
    }

    void triggerAf(final CallbackToFutureAdapter.Completer<CameraCaptureResult> completer, boolean overrideAeMode) {
        if (!this.mIsActive) {
            if (completer != null) {
                completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                return;
            }
            return;
        }
        CaptureConfig.Builder builder = new CaptureConfig.Builder();
        builder.setTemplateType(this.mTemplate);
        builder.setUseRepeatingSurface(true);
        Camera2ImplConfig.Builder configBuilder = new Camera2ImplConfig.Builder();
        configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AF_TRIGGER, 1);
        if (overrideAeMode) {
            configBuilder.setCaptureRequestOptionWithPriority(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(this.mCameraControl.getSupportedAeMode(1)), Config.OptionPriority.HIGH_PRIORITY_REQUIRED);
        }
        builder.addImplementationOptions(configBuilder.build());
        builder.addCameraCaptureCallback(new CameraCaptureCallback() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl.1
            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCompleted(int captureConfigId, CameraCaptureResult cameraCaptureResult) {
                if (completer != null) {
                    completer.set(cameraCaptureResult);
                }
            }

            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureFailed(int captureConfigId, CameraCaptureFailure failure) {
                if (completer != null) {
                    completer.setException(new CameraControlInternal.CameraControlException(failure));
                }
            }

            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCancelled(int captureConfigId) {
                if (completer != null) {
                    completer.setException(new CameraControl.OperationCanceledException("Camera is closed"));
                }
            }
        });
        this.mCameraControl.submitCaptureRequestsInternal(Collections.singletonList(builder.build()));
    }

    ListenableFuture<Void> triggerAePrecapture() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda10
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return FocusMeteringControl.this.m77xf58b8ee5(completer);
            }
        });
    }

    /* renomeado de: lambda$triggerAePrecapture$3$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ Object m77xf58b8ee5(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m76xcc3739a4(completer);
            }
        });
        return "triggerAePrecapture";
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* renomeado de: triggerAePrecapture, motivo: mesclado com método bridge [métodos inline] */
    public void m76xcc3739a4(final CallbackToFutureAdapter.Completer<Void> completer) {
        Logger.d(TAG, "triggerAePrecapture");
        if (!this.mIsActive) {
            if (completer != null) {
                completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                return;
            }
            return;
        }
        CaptureConfig.Builder builder = new CaptureConfig.Builder();
        builder.setTemplateType(this.mTemplate);
        builder.setUseRepeatingSurface(true);
        Camera2ImplConfig.Builder configBuilder = new Camera2ImplConfig.Builder();
        configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, 1);
        builder.addImplementationOptions(configBuilder.build());
        builder.addCameraCaptureCallback(new CameraCaptureCallback() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl.2
            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCompleted(int captureConfigId, CameraCaptureResult cameraCaptureResult) {
                if (completer != null) {
                    Logger.d(FocusMeteringControl.TAG, "triggerAePrecapture: triggering capture request completed");
                    completer.set(null);
                }
            }

            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureFailed(int captureConfigId, CameraCaptureFailure failure) {
                if (completer != null) {
                    completer.setException(new CameraControlInternal.CameraControlException(failure));
                }
            }

            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCancelled(int captureConfigId) {
                if (completer != null) {
                    completer.setException(new CameraControl.OperationCanceledException("Camera is closed"));
                }
            }
        });
        this.mCameraControl.submitCaptureRequestsInternal(Collections.singletonList(builder.build()));
    }

    void cancelAfAeTrigger(boolean cancelAfTrigger, boolean cancelAePrecaptureTrigger) {
        if (!this.mIsActive) {
            return;
        }
        CaptureConfig.Builder builder = new CaptureConfig.Builder();
        builder.setUseRepeatingSurface(true);
        builder.setTemplateType(this.mTemplate);
        Camera2ImplConfig.Builder configBuilder = new Camera2ImplConfig.Builder();
        if (cancelAfTrigger) {
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AF_TRIGGER, 2);
        }
        if (cancelAePrecaptureTrigger) {
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, 2);
        }
        builder.addImplementationOptions(configBuilder.build());
        this.mCameraControl.submitCaptureRequestsInternal(Collections.singletonList(builder.build()));
    }

    boolean isExternalFlashAeModeEnabled() {
        return this.mIsExternalFlashAeModeEnabled;
    }

    ListenableFuture<Void> enableExternalFlashAeMode(final boolean enable) {
        if (Build.VERSION.SDK_INT < 28) {
            Log.d(TAG, "CONTROL_AE_MODE_ON_EXTERNAL_FLASH is not supported in API " + Build.VERSION.SDK_INT);
            return Futures.immediateFuture(null);
        }
        if (this.mCameraControl.getSupportedAeMode(5) != 5) {
            Log.d(TAG, "CONTROL_AE_MODE_ON_EXTERNAL_FLASH is not supported in this device");
            return Futures.immediateFuture(null);
        }
        Log.d(TAG, "enableExternalFlashAeMode: CONTROL_AE_MODE_ON_EXTERNAL_FLASH supported");
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return FocusMeteringControl.this.m67xc21eb171(enable, completer);
            }
        });
    }

    /* renomeado de: lambda$enableExternalFlashAeMode$5$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ Object m67xc21eb171(final boolean enable, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m66x98ca5c30(enable, completer);
            }
        });
        return "enableExternalFlashAeMode";
    }

    /* renomeado de: lambda$enableExternalFlashAeMode$4$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ void m66x98ca5c30(boolean enable, CallbackToFutureAdapter.Completer completer) {
        this.mCameraControl.removeCaptureResultListener(this.mSessionListenerForAeMode);
        this.mIsExternalFlashAeModeEnabled = enable;
        enableExternalFlashAeMode((CallbackToFutureAdapter.Completer<Void>) completer);
    }

    private void enableExternalFlashAeMode(final CallbackToFutureAdapter.Completer<Void> completer) {
        if (!this.mIsActive) {
            if (completer != null) {
                completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
            }
        } else {
            final long sessionUpdateId = this.mCameraControl.updateSessionConfigSynchronous();
            this.mSessionListenerForAeMode = new Camera2CameraControlImpl.CaptureResultListener() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda4
                @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
                public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                    return FocusMeteringControl.this.m68xeb7306b2(sessionUpdateId, completer, totalCaptureResult);
                }
            };
            this.mCameraControl.addCaptureResultListener(this.mSessionListenerForAeMode);
        }
    }

    /* renomeado de: lambda$enableExternalFlashAeMode$6$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ boolean m68xeb7306b2(long sessionUpdateId, CallbackToFutureAdapter.Completer completer, TotalCaptureResult result) {
        boolean isAeModeExternalFlash = ((Integer) result.get(CaptureResult.CONTROL_AE_MODE)).intValue() == 5;
        Logger.d(TAG, "enableExternalFlashAeMode: isAeModeExternalFlash = " + isAeModeExternalFlash);
        if (isAeModeExternalFlash != this.mIsExternalFlashAeModeEnabled || !Camera2CameraControlImpl.isSessionUpdated(result, sessionUpdateId)) {
            return false;
        }
        Logger.d(TAG, "enableExternalFlashAeMode: session updated with isAeModeExternalFlash = " + isAeModeExternalFlash);
        if (completer != null) {
            completer.set(null);
        }
        return true;
    }

    private void disableAutoCancel() {
        if (this.mAutoCancelHandle != null) {
            this.mAutoCancelHandle.cancel(true);
            this.mAutoCancelHandle = null;
        }
    }

    private void clearAutoFocusTimeoutHandle() {
        if (this.mAutoFocusTimeoutHandle != null) {
            this.mAutoFocusTimeoutHandle.cancel(true);
            this.mAutoFocusTimeoutHandle = null;
        }
    }

    int getDefaultAfMode() {
        switch (this.mTemplate) {
            case 3:
                return 3;
            default:
                return 4;
        }
    }

    private boolean isAfModeSupported() {
        return this.mCameraControl.getSupportedAfMode(1) == 1;
    }

    void completeActionFuture(boolean isFocusSuccessful) {
        clearAutoFocusTimeoutHandle();
        if (this.mRunningActionCompleter != null) {
            this.mRunningActionCompleter.set(FocusMeteringResult.create(isFocusSuccessful));
            this.mRunningActionCompleter = null;
        }
    }

    private void failActionFuture(String message) {
        this.mCameraControl.removeCaptureResultListener(this.mSessionListenerForFocus);
        if (this.mRunningActionCompleter != null) {
            this.mRunningActionCompleter.setException(new CameraControl.OperationCanceledException(message));
            this.mRunningActionCompleter = null;
        }
    }

    private void failCancelFuture(String message) {
        this.mCameraControl.removeCaptureResultListener(this.mSessionListenerForCancel);
        if (this.mRunningCancelCompleter != null) {
            this.mRunningCancelCompleter.setException(new CameraControl.OperationCanceledException(message));
            this.mRunningCancelCompleter = null;
        }
    }

    private void completeCancelFuture() {
        if (this.mRunningCancelCompleter != null) {
            this.mRunningCancelCompleter.set(null);
            this.mRunningCancelCompleter = null;
        }
    }

    private void executeMeteringAction(MeteringRectangle[] afRects, MeteringRectangle[] aeRects, MeteringRectangle[] awbRects, FocusMeteringAction focusMeteringAction, long timeoutDurationMs) {
        final long sessionUpdateId;
        this.mCameraControl.removeCaptureResultListener(this.mSessionListenerForFocus);
        disableAutoCancel();
        clearAutoFocusTimeoutHandle();
        this.mAfRects = afRects;
        this.mAeRects = aeRects;
        this.mAwbRects = awbRects;
        if (shouldTriggerAF()) {
            this.mIsInAfAutoMode = true;
            this.mIsAutoFocusCompleted = false;
            this.mIsFocusSuccessful = false;
            sessionUpdateId = this.mCameraControl.updateSessionConfigSynchronous();
            triggerAf(null, true);
        } else {
            this.mIsInAfAutoMode = false;
            this.mIsAutoFocusCompleted = true;
            this.mIsFocusSuccessful = false;
            sessionUpdateId = this.mCameraControl.updateSessionConfigSynchronous();
        }
        this.mCurrentAfState = 0;
        final boolean isAfModeSupported = isAfModeSupported();
        this.mSessionListenerForFocus = new Camera2CameraControlImpl.CaptureResultListener() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda12
            @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
            public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                return FocusMeteringControl.this.m71xcac1cdee(isAfModeSupported, sessionUpdateId, totalCaptureResult);
            }
        };
        this.mCameraControl.addCaptureResultListener(this.mSessionListenerForFocus);
        final long timeoutId = this.mFocusTimeoutCounter + 1;
        this.mFocusTimeoutCounter = timeoutId;
        Runnable autoFocusTimeoutRunnable = new Runnable() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda13
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m73x1d6a7870(timeoutId);
            }
        };
        this.mAutoFocusTimeoutHandle = this.mScheduler.schedule(autoFocusTimeoutRunnable, timeoutDurationMs, TimeUnit.MILLISECONDS);
        if (focusMeteringAction.isAutoCancelEnabled()) {
            Runnable autoCancelRunnable = new Runnable() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda14
                @Override // java.lang.Runnable
                public final void run() {
                    FocusMeteringControl.this.m70x5ba3a0b1(timeoutId);
                }
            };
            this.mAutoCancelHandle = this.mScheduler.schedule(autoCancelRunnable, focusMeteringAction.getAutoCancelDurationInMillis(), TimeUnit.MILLISECONDS);
        }
    }

    /* renomeado de: lambda$executeMeteringAction$7$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ boolean m71xcac1cdee(boolean isAfModeSupported, long sessionUpdateId, TotalCaptureResult result) {
        Integer afState = (Integer) result.get(CaptureResult.CONTROL_AF_STATE);
        if (shouldTriggerAF()) {
            if (!isAfModeSupported || afState == null) {
                this.mIsFocusSuccessful = true;
                this.mIsAutoFocusCompleted = true;
            } else if (this.mCurrentAfState.intValue() == 3) {
                if (afState.intValue() == 4) {
                    this.mIsFocusSuccessful = true;
                    this.mIsAutoFocusCompleted = true;
                } else if (afState.intValue() == 5) {
                    this.mIsFocusSuccessful = false;
                    this.mIsAutoFocusCompleted = true;
                }
            }
        }
        if (this.mIsAutoFocusCompleted && Camera2CameraControlImpl.isSessionUpdated(result, sessionUpdateId)) {
            completeActionFuture(this.mIsFocusSuccessful);
            return true;
        }
        if (!this.mCurrentAfState.equals(afState) && afState != null) {
            this.mCurrentAfState = afState;
        }
        return false;
    }

    /* renomeado de: lambda$executeMeteringAction$9$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ void m73x1d6a7870(final long timeoutId) {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m72xf416232f(timeoutId);
            }
        });
    }

    /* renomeado de: lambda$executeMeteringAction$8$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ void m72xf416232f(long timeoutId) {
        if (timeoutId == this.mFocusTimeoutCounter) {
            this.mIsFocusSuccessful = false;
            completeActionFuture(this.mIsFocusSuccessful);
        }
    }

    /* renomeado de: lambda$executeMeteringAction$11$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ void m70x5ba3a0b1(final long timeoutId) {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m69x324f4b70(timeoutId);
            }
        });
    }

    /* renomeado de: lambda$executeMeteringAction$10$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ void m69x324f4b70(long timeoutId) {
        if (timeoutId == this.mFocusTimeoutCounter) {
            cancelFocusAndMeteringWithoutAsyncResult();
        }
    }

    private boolean shouldTriggerAF() {
        return this.mAfRects.length > 0;
    }

    ListenableFuture<Void> cancelFocusAndMetering() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda2
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return FocusMeteringControl.this.m64xb951626b(completer);
            }
        });
    }

    /* renomeado de: lambda$cancelFocusAndMetering$13$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ Object m64xb951626b(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m63x8ffd0d2a(completer);
            }
        });
        return "cancelFocusAndMetering";
    }

    void cancelFocusAndMeteringWithoutAsyncResult() {
        m63x8ffd0d2a(null);
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* renomeado de: cancelFocusAndMeteringInternal, motivo: mesclado com método bridge [métodos inline] */
    public void m63x8ffd0d2a(CallbackToFutureAdapter.Completer<Void> completer) {
        failCancelFuture("Cancelled by another cancelFocusAndMetering()");
        failActionFuture("Cancelled by cancelFocusAndMetering()");
        this.mRunningCancelCompleter = completer;
        disableAutoCancel();
        clearAutoFocusTimeoutHandle();
        if (shouldTriggerAF()) {
            cancelAfAeTrigger(true, false);
        }
        this.mAfRects = EMPTY_RECTANGLES;
        this.mAeRects = EMPTY_RECTANGLES;
        this.mAwbRects = EMPTY_RECTANGLES;
        this.mIsInAfAutoMode = false;
        final long sessionUpdateId = this.mCameraControl.updateSessionConfigSynchronous();
        if (this.mRunningCancelCompleter != null) {
            final int targetAfMode = this.mCameraControl.getSupportedAfMode(getDefaultAfMode());
            this.mSessionListenerForCancel = new Camera2CameraControlImpl.CaptureResultListener() { // da classe: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda11
                @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
                public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                    return FocusMeteringControl.this.m65x244b226f(targetAfMode, sessionUpdateId, totalCaptureResult);
                }
            };
            this.mCameraControl.addCaptureResultListener(this.mSessionListenerForCancel);
        }
    }

    /* renomeado de: lambda$cancelFocusAndMeteringInternal$14$androidx-camera-camera2-internal-FocusMeteringControl, motivo: nome Java inválido */
    /* sintético */ boolean m65x244b226f(int targetAfMode, long sessionUpdateId, TotalCaptureResult captureResult) {
        Integer afMode = (Integer) captureResult.get(CaptureResult.CONTROL_AF_MODE);
        if (afMode.intValue() == targetAfMode && Camera2CameraControlImpl.isSessionUpdated(captureResult, sessionUpdateId)) {
            completeCancelFuture();
            return true;
        }
        return false;
    }

    boolean isFocusMeteringSupported(FocusMeteringAction action) {
        Rect cropSensorRegion = this.mCameraControl.getCropSensorRegion();
        Rational defaultAspectRatio = getDefaultAspectRatio();
        List<MeteringRectangle> rectanglesAf = getMeteringRectangles(action.getMeteringPointsAf(), this.mCameraControl.getMaxAfRegionCount(), defaultAspectRatio, cropSensorRegion, 1);
        List<MeteringRectangle> rectanglesAe = getMeteringRectangles(action.getMeteringPointsAe(), this.mCameraControl.getMaxAeRegionCount(), defaultAspectRatio, cropSensorRegion, 2);
        List<MeteringRectangle> rectanglesAwb = getMeteringRectangles(action.getMeteringPointsAwb(), this.mCameraControl.getMaxAwbRegionCount(), defaultAspectRatio, cropSensorRegion, 4);
        return (rectanglesAf.isEmpty() && rectanglesAe.isEmpty() && rectanglesAwb.isEmpty()) ? false : true;
    }
}
