package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.util.Log;
import androidx.arch.core.util.Function;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.Camera2CapturePipeline;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.workaround.FlashAvailabilityChecker;
import androidx.camera.camera2.internal.compat.workaround.OverrideAeModeForStillCapture;
import androidx.camera.camera2.internal.compat.workaround.UseFlashModeTorchFor3aUpdate;
import androidx.camera.camera2.internal.compat.workaround.UseTorchAsFlash;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.imagecapture.CameraCapturePipeline;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraCaptureResults;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.ConvergenceUtils;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/* carregado de: classes.dex */
class Camera2CapturePipeline {
    private static final String TAG = "Camera2CapturePipeline";
    private final Camera2CameraControlImpl mCameraControl;
    private final Quirks mCameraQuirk;
    private final Executor mExecutor;
    private final boolean mHasFlashUnit;
    private final boolean mIsLegacyDevice;
    private final ScheduledExecutorService mScheduler;
    private int mTemplate = 1;
    private final UseTorchAsFlash mUseTorchAsFlash;

    interface PipelineTask {
        boolean isCaptureResultNeeded();

        void postCapture();

        ListenableFuture<Boolean> preCapture(TotalCaptureResult totalCaptureResult);
    }

    Camera2CapturePipeline(Camera2CameraControlImpl cameraControl, CameraCharacteristicsCompat cameraCharacteristics, Quirks cameraQuirks, Executor executor, ScheduledExecutorService scheduler) {
        this.mCameraControl = cameraControl;
        Integer level = (Integer) cameraCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        this.mIsLegacyDevice = level != null && level.intValue() == 2;
        this.mExecutor = executor;
        this.mScheduler = scheduler;
        this.mCameraQuirk = cameraQuirks;
        this.mUseTorchAsFlash = new UseTorchAsFlash(cameraQuirks);
        Objects.requireNonNull(cameraCharacteristics);
        this.mHasFlashUnit = FlashAvailabilityChecker.isFlashAvailable(new Camera2CameraInfoImpl$$ExternalSyntheticLambda0(cameraCharacteristics));
    }

    public void setTemplate(int template) {
        this.mTemplate = template;
    }

    public ListenableFuture<List<Void>> submitStillCaptures(List<CaptureConfig> captureConfigs, int captureMode, int flashMode, int flashType) {
        Pipeline pipeline = createPipeline(captureMode, flashMode, flashType);
        return Futures.nonCancellationPropagating(pipeline.executeCapture(captureConfigs, flashMode));
    }

    Pipeline createPipeline(int captureMode, int flashMode, int flashType) {
        OverrideAeModeForStillCapture aeQuirk = new OverrideAeModeForStillCapture(this.mCameraQuirk);
        Pipeline pipeline = new Pipeline(this.mTemplate, this.mExecutor, this.mScheduler, this.mCameraControl, this.mIsLegacyDevice, aeQuirk);
        if (captureMode == 0) {
            pipeline.addTask(new AfTask(this.mCameraControl));
        }
        if (flashMode == 3) {
            pipeline.addTask(new ScreenFlashTask(this.mCameraControl, this.mExecutor, this.mScheduler, new UseFlashModeTorchFor3aUpdate(this.mCameraQuirk)));
        } else if (this.mHasFlashUnit) {
            if (isTorchAsFlash(flashType)) {
                boolean triggerAePrecapture = (this.mUseTorchAsFlash.shouldUseTorchAsFlash() || this.mCameraControl.isInVideoUsage()) ? false : true;
                pipeline.addTask(new TorchTask(this.mCameraControl, flashMode, this.mExecutor, this.mScheduler, triggerAePrecapture));
            } else {
                pipeline.addTask(new AePreCaptureTask(this.mCameraControl, flashMode, aeQuirk));
            }
        }
        Logger.d(TAG, "createPipeline: captureMode = " + captureMode + ", flashMode = " + flashMode + ", flashType = " + flashType + ", pipeline tasks = " + pipeline.mTasks);
        return pipeline;
    }

    CameraCapturePipeline getCameraCapturePipeline(int captureMode, int flashMode, int flashType) {
        return new CameraCapturePipelineImpl(createPipeline(captureMode, flashMode, flashType), this.mExecutor, flashMode);
    }

    static class CameraCapturePipelineImpl implements CameraCapturePipeline {
        private final Executor mExecutor;
        private int mFlashMode;
        private final Pipeline mPipelineDelegate;

        CameraCapturePipelineImpl(Pipeline pipeline, Executor executor, int flashMode) {
            this.mPipelineDelegate = pipeline;
            this.mExecutor = executor;
            this.mFlashMode = flashMode;
        }

        @Override // androidx.camera.core.imagecapture.CameraCapturePipeline
        public ListenableFuture<Void> invokePreCapture() {
            Logger.d(Camera2CapturePipeline.TAG, "invokePreCapture");
            return FutureChain.from(this.mPipelineDelegate.executePreCapture(this.mFlashMode)).transform(new Function() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$CameraCapturePipelineImpl$$ExternalSyntheticLambda1
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return Camera2CapturePipeline.CameraCapturePipelineImpl.lambda$invokePreCapture$0((TotalCaptureResult) obj);
                }
            }, this.mExecutor);
        }

        static /* sintético */ Void lambda$invokePreCapture$0(TotalCaptureResult result) {
            return null;
        }

        @Override // androidx.camera.core.imagecapture.CameraCapturePipeline
        public ListenableFuture<Void> invokePostCapture() {
            return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$CameraCapturePipelineImpl$$ExternalSyntheticLambda0
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Camera2CapturePipeline.CameraCapturePipelineImpl.this.m40x44fc0440(completer);
                }
            });
        }

        /* renomeado de: lambda$invokePostCapture$1$androidx-camera-camera2-internal-Camera2CapturePipeline$CameraCapturePipelineImpl, motivo: nome Java inválido */
        /* sintético */ Object m40x44fc0440(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mPipelineDelegate.executePostCapture();
            completer.set(null);
            return "invokePostCaptureFuture";
        }
    }

    static class Pipeline {
        private static final long CHECK_3A_TIMEOUT_IN_NS = TimeUnit.SECONDS.toNanos(1);
        private static final long CHECK_3A_WITH_FLASH_TIMEOUT_IN_NS = TimeUnit.SECONDS.toNanos(5);
        private final Camera2CameraControlImpl mCameraControl;
        private final Executor mExecutor;
        private final boolean mIsLegacyDevice;
        private final OverrideAeModeForStillCapture mOverrideAeModeForStillCapture;
        private final ScheduledExecutorService mScheduler;
        private final int mTemplate;
        private long mTimeout3A = CHECK_3A_TIMEOUT_IN_NS;
        final List<PipelineTask> mTasks = new ArrayList();
        private final PipelineTask mPipelineSubTask = new AnonymousClass1();

        /* renomeado de: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$1, motivo: nome de classe inválido */
        class AnonymousClass1 implements PipelineTask {
            AnonymousClass1() {
            }

            @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
            public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
                ArrayList<ListenableFuture<Boolean>> futures = new ArrayList<>();
                for (PipelineTask task : Pipeline.this.mTasks) {
                    futures.add(task.preCapture(captureResult));
                }
                return Futures.transform(Futures.allAsList(futures), new Function() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$1$$ExternalSyntheticLambda0
                    @Override // androidx.arch.core.util.Function
                    public final Object apply(Object obj) {
                        Boolean valueOf;
                        valueOf = Boolean.valueOf(((List) obj).contains(true));
                        return valueOf;
                    }
                }, CameraXExecutors.directExecutor());
            }

            @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
            public boolean isCaptureResultNeeded() {
                for (PipelineTask task : Pipeline.this.mTasks) {
                    if (task.isCaptureResultNeeded()) {
                        return true;
                    }
                }
                return false;
            }

            @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
            public void postCapture() {
                for (PipelineTask task : Pipeline.this.mTasks) {
                    task.postCapture();
                }
            }
        }

        Pipeline(int template, Executor executor, ScheduledExecutorService scheduler, Camera2CameraControlImpl cameraControl, boolean isLegacyDevice, OverrideAeModeForStillCapture overrideAeModeForStillCapture) {
            this.mTemplate = template;
            this.mExecutor = executor;
            this.mScheduler = scheduler;
            this.mCameraControl = cameraControl;
            this.mIsLegacyDevice = isLegacyDevice;
            this.mOverrideAeModeForStillCapture = overrideAeModeForStillCapture;
        }

        void addTask(PipelineTask task) {
            this.mTasks.add(task);
        }

        private void setTimeout3A(long timeout3A) {
            this.mTimeout3A = timeout3A;
        }

        ListenableFuture<List<Void>> executeCapture(final List<CaptureConfig> captureConfigs, final int flashMode) {
            ListenableFuture<List<Void>> future = FutureChain.from(executePreCapture(flashMode)).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda1
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    return Camera2CapturePipeline.Pipeline.this.m41xe4aaa129(captureConfigs, flashMode, (TotalCaptureResult) obj);
                }
            }, this.mExecutor);
            future.addListener(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CapturePipeline.Pipeline.this.executePostCapture();
                }
            }, this.mExecutor);
            return future;
        }

        /* renomeado de: lambda$executeCapture$0$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m41xe4aaa129(List captureConfigs, int flashMode, TotalCaptureResult v) throws Exception {
            return submitConfigsInternal(captureConfigs, flashMode);
        }

        public ListenableFuture<TotalCaptureResult> executePreCapture(final int flashMode) {
            ListenableFuture<TotalCaptureResult> getResult;
            ListenableFuture<TotalCaptureResult> preCapture = Futures.immediateFuture(null);
            if (!this.mTasks.isEmpty()) {
                if (this.mPipelineSubTask.isCaptureResultNeeded()) {
                    getResult = Camera2CapturePipeline.waitForResult(this.mCameraControl, null);
                } else {
                    getResult = Futures.immediateFuture(null);
                }
                ListenableFuture<TotalCaptureResult> preCapture2 = FutureChain.from(getResult).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda3
                    @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                    public final ListenableFuture apply(Object obj) {
                        return Camera2CapturePipeline.Pipeline.this.m42xc852b1db(flashMode, (TotalCaptureResult) obj);
                    }
                }, this.mExecutor).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda4
                    @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                    public final ListenableFuture apply(Object obj) {
                        return Camera2CapturePipeline.Pipeline.this.m43x9cb1c219((Boolean) obj);
                    }
                }, this.mExecutor);
                return preCapture2;
            }
            return preCapture;
        }

        /* renomeado de: lambda$executePreCapture$1$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m42xc852b1db(int flashMode, TotalCaptureResult captureResult) throws Exception {
            if (!this.mCameraControl.isLowLightBoostOn() && Camera2CapturePipeline.isFlashRequired(flashMode, captureResult)) {
                setTimeout3A(CHECK_3A_WITH_FLASH_TIMEOUT_IN_NS);
            }
            return this.mPipelineSubTask.preCapture(captureResult);
        }

        /* renomeado de: lambda$executePreCapture$3$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m43x9cb1c219(Boolean is3aConvergeRequired) throws Exception {
            if (Boolean.TRUE.equals(is3aConvergeRequired)) {
                return Camera2CapturePipeline.waitForResult(this.mTimeout3A, this.mScheduler, this.mCameraControl, new ResultListener.Checker() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda5
                    @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.ResultListener.Checker
                    public final boolean check(TotalCaptureResult totalCaptureResult) {
                        boolean is3AConverged;
                        is3AConverged = Camera2CapturePipeline.is3AConverged(totalCaptureResult, false);
                        return is3AConverged;
                    }
                });
            }
            return Futures.immediateFuture(null);
        }

        public void executePostCapture() {
            this.mPipelineSubTask.postCapture();
        }

        ListenableFuture<List<Void>> submitConfigsInternal(List<CaptureConfig> captureConfigs, int flashMode) {
            List<ListenableFuture<Void>> futureList = new ArrayList<>();
            List<CaptureConfig> configsToSubmit = new ArrayList<>();
            for (CaptureConfig captureConfig : captureConfigs) {
                final CaptureConfig.Builder configBuilder = CaptureConfig.Builder.from(captureConfig);
                CameraCaptureResult cameraCaptureResult = null;
                if (captureConfig.getTemplateType() == 5 && !this.mCameraControl.getZslControl().isZslDisabledByFlashMode() && !this.mCameraControl.getZslControl().isZslDisabledByUserCaseConfig()) {
                    ImageProxy imageProxy = this.mCameraControl.getZslControl().dequeueImageFromBuffer();
                    if (imageProxy == null) {
                        Logger.d(Camera2CapturePipeline.TAG, "ZSL capture skipped due to no valid buffer image");
                    } else {
                        if (!this.mCameraControl.getZslControl().enqueueImageToImageWriter(imageProxy)) {
                            Logger.e(Camera2CapturePipeline.TAG, "Failed to enqueue image to image writer");
                        } else {
                            cameraCaptureResult = CameraCaptureResults.retrieveCameraCaptureResult(imageProxy.getImageInfo());
                        }
                        if (cameraCaptureResult == null) {
                            imageProxy.close();
                        }
                    }
                }
                if (cameraCaptureResult != null) {
                    configBuilder.setCameraCaptureResult(cameraCaptureResult);
                } else {
                    applyStillCaptureTemplate(configBuilder, captureConfig);
                }
                if (this.mOverrideAeModeForStillCapture.shouldSetAeModeAlwaysFlash(flashMode)) {
                    applyAeModeQuirk(configBuilder);
                }
                futureList.add(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda0
                    @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                    public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                        return Camera2CapturePipeline.Pipeline.this.m44x1f41775a(configBuilder, completer);
                    }
                }));
                configsToSubmit.add(configBuilder.build());
            }
            this.mCameraControl.submitCaptureRequestsInternal(configsToSubmit);
            return Futures.allAsList(futureList);
        }

        /* renomeado de: lambda$submitConfigsInternal$4$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline, motivo: nome Java inválido */
        /* sintético */ Object m44x1f41775a(CaptureConfig.Builder configBuilder, final CallbackToFutureAdapter.Completer completer) throws Exception {
            configBuilder.addCameraCaptureCallback(new CameraCaptureCallback() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline.Pipeline.2
                @Override // androidx.camera.core.impl.CameraCaptureCallback
                public void onCaptureCompleted(int captureConfigId, CameraCaptureResult result) {
                    completer.set(null);
                }

                @Override // androidx.camera.core.impl.CameraCaptureCallback
                public void onCaptureFailed(int captureConfigId, CameraCaptureFailure failure) {
                    String msg = "Capture request failed with reason " + failure.getReason();
                    completer.setException(new ImageCaptureException(2, msg, null));
                }

                @Override // androidx.camera.core.impl.CameraCaptureCallback
                public void onCaptureCancelled(int captureConfigId) {
                    completer.setException(new ImageCaptureException(3, "Capture request is cancelled because camera is closed", null));
                }
            });
            return "submitStillCapture";
        }

        private void applyStillCaptureTemplate(CaptureConfig.Builder configBuilder, CaptureConfig captureConfig) {
            int templateToModify = -1;
            if (this.mTemplate == 3 && !this.mIsLegacyDevice) {
                templateToModify = 4;
            } else if (captureConfig.getTemplateType() == -1 || captureConfig.getTemplateType() == 5) {
                templateToModify = 2;
            }
            if (templateToModify != -1) {
                configBuilder.setTemplateType(templateToModify);
            }
            Logger.d(Camera2CapturePipeline.TAG, "applyStillCaptureTemplate: templateToModify = " + templateToModify);
        }

        private void applyAeModeQuirk(CaptureConfig.Builder configBuilder) {
            Camera2ImplConfig.Builder impBuilder = new Camera2ImplConfig.Builder();
            impBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_MODE, 3);
            configBuilder.addImplementationOptions(impBuilder.build());
        }
    }

    static ListenableFuture<TotalCaptureResult> waitForResult(long timeoutNanos, ScheduledExecutorService scheduledExecutorService, Camera2CameraControlImpl cameraControl, ResultListener.Checker checker) {
        return Futures.makeTimeoutFuture(TimeUnit.NANOSECONDS.toMillis(timeoutNanos), scheduledExecutorService, null, true, waitForResult(cameraControl, checker));
    }

    static ListenableFuture<TotalCaptureResult> waitForResult(final Camera2CameraControlImpl cameraControl, ResultListener.Checker checker) {
        final ResultListener resultListener = new ResultListener(checker);
        cameraControl.addCaptureResultListener(resultListener);
        ListenableFuture<TotalCaptureResult> future = resultListener.getFuture();
        future.addListener(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControlImpl.this.removeCaptureResultListener(resultListener);
            }
        }, cameraControl.mExecutor);
        return future;
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    public static boolean is3AConverged(TotalCaptureResult totalCaptureResult, boolean isTorchAsFlash) {
        if (totalCaptureResult == null) {
            return false;
        }
        Camera2CameraCaptureResult captureResult = new Camera2CameraCaptureResult(totalCaptureResult);
        return ConvergenceUtils.is3AConverged(captureResult, isTorchAsFlash);
    }

    static class AfTask implements PipelineTask {
        private final Camera2CameraControlImpl mCameraControl;
        private boolean mIsExecuted = false;

        AfTask(Camera2CameraControlImpl cameraControl) {
            this.mCameraControl = cameraControl;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
            ListenableFuture<Boolean> ret = Futures.immediateFuture(true);
            if (captureResult == null) {
                return ret;
            }
            Integer afMode = (Integer) captureResult.get(CaptureResult.CONTROL_AF_MODE);
            if (afMode == null) {
                return ret;
            }
            switch (afMode.intValue()) {
                case 1:
                case 2:
                    Logger.d(Camera2CapturePipeline.TAG, "TriggerAf? AF mode auto");
                    Integer afState = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                    if (afState != null && afState.intValue() == 0) {
                        Logger.d(Camera2CapturePipeline.TAG, "Trigger AF");
                        this.mIsExecuted = true;
                        this.mCameraControl.getFocusMeteringControl().triggerAf(null, false);
                        return ret;
                    }
                    break;
                default:
                    return ret;
            }
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public boolean isCaptureResultNeeded() {
            return true;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public void postCapture() {
            if (this.mIsExecuted) {
                Logger.d(Camera2CapturePipeline.TAG, "cancel TriggerAF");
                this.mCameraControl.getFocusMeteringControl().cancelAfAeTrigger(true, false);
            }
        }
    }

    static class TorchTask implements PipelineTask {
        private static final long CHECK_3A_WITH_TORCH_TIMEOUT_IN_NS = TimeUnit.SECONDS.toNanos(2);
        private final Camera2CameraControlImpl mCameraControl;
        private final Executor mExecutor;
        private final int mFlashMode;
        private boolean mIsExecuted = false;
        private final ScheduledExecutorService mScheduler;
        private final boolean mTriggerAePrecapture;

        TorchTask(Camera2CameraControlImpl cameraControl, int flashMode, Executor executor, ScheduledExecutorService scheduler, boolean triggerAePrecapture) {
            this.mCameraControl = cameraControl;
            this.mFlashMode = flashMode;
            this.mExecutor = executor;
            this.mScheduler = scheduler;
            this.mTriggerAePrecapture = triggerAePrecapture;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
            boolean isFlashRequired = Camera2CapturePipeline.isFlashRequired(this.mFlashMode, captureResult);
            Logger.d(Camera2CapturePipeline.TAG, "TorchTask#preCapture: isFlashRequired = " + isFlashRequired);
            if (Camera2CapturePipeline.isFlashRequired(this.mFlashMode, captureResult)) {
                if (this.mCameraControl.isLowLightBoostOn()) {
                    Logger.d(Camera2CapturePipeline.TAG, "Low-light boost already on, not turn on");
                } else if (this.mCameraControl.isTorchOn()) {
                    Logger.d(Camera2CapturePipeline.TAG, "Torch already on, not turn on");
                } else {
                    Logger.d(Camera2CapturePipeline.TAG, "Turn on torch");
                    this.mIsExecuted = true;
                    ListenableFuture<Void> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda1
                        @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                        public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                            return Camera2CapturePipeline.TorchTask.this.m54x3ebf0c8c(completer);
                        }
                    });
                    return FutureChain.from(future).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda2
                        @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                        public final ListenableFuture apply(Object obj) {
                            return Camera2CapturePipeline.TorchTask.this.m55x1a80884d((Void) obj);
                        }
                    }, this.mExecutor).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda3
                        @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                        public final ListenableFuture apply(Object obj) {
                            return Camera2CapturePipeline.TorchTask.this.m56xd2037fcf((Void) obj);
                        }
                    }, this.mExecutor).transform(new Function() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda4
                        @Override // androidx.arch.core.util.Function
                        public final Object apply(Object obj) {
                            return Camera2CapturePipeline.TorchTask.lambda$preCapture$4((TotalCaptureResult) obj);
                        }
                    }, CameraXExecutors.directExecutor());
                }
            }
            return Futures.immediateFuture(false);
        }

        /* renomeado de: lambda$preCapture$0$androidx-camera-camera2-internal-Camera2CapturePipeline$TorchTask, motivo: nome Java inválido */
        /* sintético */ Object m54x3ebf0c8c(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mCameraControl.getTorchControl().m97xbd10d892(completer, 2);
            return "TorchOn";
        }

        /* renomeado de: lambda$preCapture$1$androidx-camera-camera2-internal-Camera2CapturePipeline$TorchTask, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m55x1a80884d(Void input) throws Exception {
            if (this.mTriggerAePrecapture) {
                return this.mCameraControl.getFocusMeteringControl().triggerAePrecapture();
            }
            return Futures.immediateFuture(null);
        }

        /* renomeado de: lambda$preCapture$3$androidx-camera-camera2-internal-Camera2CapturePipeline$TorchTask, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m56xd2037fcf(Void input) throws Exception {
            return Camera2CapturePipeline.waitForResult(CHECK_3A_WITH_TORCH_TIMEOUT_IN_NS, this.mScheduler, this.mCameraControl, new ResultListener.Checker() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda0
                @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.ResultListener.Checker
                public final boolean check(TotalCaptureResult totalCaptureResult) {
                    boolean is3AConverged;
                    is3AConverged = Camera2CapturePipeline.is3AConverged(totalCaptureResult, true);
                    return is3AConverged;
                }
            });
        }

        static /* sintético */ Boolean lambda$preCapture$4(TotalCaptureResult input) {
            return false;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public boolean isCaptureResultNeeded() {
            return this.mFlashMode == 0;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public void postCapture() {
            if (this.mIsExecuted) {
                this.mCameraControl.getTorchControl().m97xbd10d892(null, 0);
                Logger.d(Camera2CapturePipeline.TAG, "Turning off torch");
                if (this.mTriggerAePrecapture) {
                    this.mCameraControl.getFocusMeteringControl().cancelAfAeTrigger(false, true);
                }
            }
        }
    }

    static class AePreCaptureTask implements PipelineTask {
        private final Camera2CameraControlImpl mCameraControl;
        private final int mFlashMode;
        private boolean mIsExecuted = false;
        private final OverrideAeModeForStillCapture mOverrideAeModeForStillCapture;

        AePreCaptureTask(Camera2CameraControlImpl cameraControl, int flashMode, OverrideAeModeForStillCapture overrideAeModeForStillCapture) {
            this.mCameraControl = cameraControl;
            this.mFlashMode = flashMode;
            this.mOverrideAeModeForStillCapture = overrideAeModeForStillCapture;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
            if (!this.mCameraControl.isLowLightBoostOn() && Camera2CapturePipeline.isFlashRequired(this.mFlashMode, captureResult)) {
                Logger.d(Camera2CapturePipeline.TAG, "Trigger AE");
                this.mIsExecuted = true;
                ListenableFuture<Void> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$AePreCaptureTask$$ExternalSyntheticLambda0
                    @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                    public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                        return Camera2CapturePipeline.AePreCaptureTask.this.m39x78c3ed41(completer);
                    }
                });
                return FutureChain.from(future).transform(new Function() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$AePreCaptureTask$$ExternalSyntheticLambda1
                    @Override // androidx.arch.core.util.Function
                    public final Object apply(Object obj) {
                        return Camera2CapturePipeline.AePreCaptureTask.lambda$preCapture$1((Void) obj);
                    }
                }, CameraXExecutors.directExecutor());
            }
            return Futures.immediateFuture(false);
        }

        /* renomeado de: lambda$preCapture$0$androidx-camera-camera2-internal-Camera2CapturePipeline$AePreCaptureTask, motivo: nome Java inválido */
        /* sintético */ Object m39x78c3ed41(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mCameraControl.getFocusMeteringControl().m76xcc3739a4(completer);
            this.mOverrideAeModeForStillCapture.onAePrecaptureStarted();
            return "AePreCapture";
        }

        static /* sintético */ Boolean lambda$preCapture$1(Void input) {
            return true;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public boolean isCaptureResultNeeded() {
            return this.mFlashMode == 0;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public void postCapture() {
            if (this.mIsExecuted) {
                Logger.d(Camera2CapturePipeline.TAG, "cancel TriggerAePreCapture");
                this.mCameraControl.getFocusMeteringControl().cancelAfAeTrigger(false, true);
                this.mOverrideAeModeForStillCapture.onAePrecaptureFinished();
            }
        }
    }

    static class ScreenFlashTask implements PipelineTask {
        private static final long CHECK_3A_WITH_SCREEN_FLASH_TIMEOUT_IN_NS = TimeUnit.SECONDS.toNanos(2);
        private final Camera2CameraControlImpl mCameraControl;
        private final Executor mExecutor;
        private final ScheduledExecutorService mScheduler;
        private final ImageCapture.ScreenFlash mScreenFlash;
        private final UseFlashModeTorchFor3aUpdate mUseFlashModeTorchFor3aUpdate;

        ScreenFlashTask(Camera2CameraControlImpl cameraControl, Executor executor, ScheduledExecutorService scheduler, UseFlashModeTorchFor3aUpdate useFlashModeTorchFor3aUpdate) {
            this.mCameraControl = cameraControl;
            this.mExecutor = executor;
            this.mScheduler = scheduler;
            this.mUseFlashModeTorchFor3aUpdate = useFlashModeTorchFor3aUpdate;
            this.mScreenFlash = (ImageCapture.ScreenFlash) Objects.requireNonNull(this.mCameraControl.getScreenFlash());
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
            Logger.d(Camera2CapturePipeline.TAG, "ScreenFlashTask#preCapture");
            final AtomicReference<ImageCapture.ScreenFlashListener> screenFlashListener = new AtomicReference<>();
            final ListenableFuture<Void> uiAppliedFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda8
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Camera2CapturePipeline.ScreenFlashTask.lambda$preCapture$1(screenFlashListener, completer);
                }
            });
            ListenableFuture<Void> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda9
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Camera2CapturePipeline.ScreenFlashTask.this.m48x6ffc4037(screenFlashListener, completer);
                }
            });
            return FutureChain.from(future).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda10
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    return Camera2CapturePipeline.ScreenFlashTask.this.m49x37082738((Void) obj);
                }
            }, this.mExecutor).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda11
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    return Camera2CapturePipeline.ScreenFlashTask.this.m51xc51ff53a((Void) obj);
                }
            }, this.mExecutor).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda12
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    return Camera2CapturePipeline.ScreenFlashTask.this.m52x8c2bdc3b(uiAppliedFuture, obj);
                }
            }, this.mExecutor).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda13
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    return Camera2CapturePipeline.ScreenFlashTask.this.m53x5337c33c((Void) obj);
                }
            }, this.mExecutor).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda1
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    return Camera2CapturePipeline.ScreenFlashTask.this.m46x8e5210ab((Void) obj);
                }
            }, this.mExecutor).transform(new Function() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda2
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return Camera2CapturePipeline.ScreenFlashTask.lambda$preCapture$11((TotalCaptureResult) obj);
                }
            }, CameraXExecutors.directExecutor());
        }

        static /* sintético */ Object lambda$preCapture$1(AtomicReference screenFlashListener, final CallbackToFutureAdapter.Completer completer) throws Exception {
            screenFlashListener.set(new ImageCapture.ScreenFlashListener() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda7
                @Override // androidx.camera.core.ImageCapture.ScreenFlashListener
                public final void onCompleted() {
                    Camera2CapturePipeline.ScreenFlashTask.lambda$preCapture$0(CallbackToFutureAdapter.Completer.this);
                }
            });
            return "OnScreenFlashUiApplied";
        }

        static /* sintético */ void lambda$preCapture$0(CallbackToFutureAdapter.Completer completer) {
            Logger.d(Camera2CapturePipeline.TAG, "ScreenFlashTask#preCapture: UI change applied");
            completer.set(null);
        }

        /* renomeado de: lambda$preCapture$3$androidx-camera-camera2-internal-Camera2CapturePipeline$ScreenFlashTask, motivo: nome Java inválido */
        /* sintético */ Object m48x6ffc4037(final AtomicReference screenFlashListener, final CallbackToFutureAdapter.Completer completer) throws Exception {
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CapturePipeline.ScreenFlashTask.this.m47xa8f05936(screenFlashListener, completer);
                }
            });
            return "OnScreenFlashStart";
        }

        /* renomeado de: lambda$preCapture$2$androidx-camera-camera2-internal-Camera2CapturePipeline$ScreenFlashTask, motivo: nome Java inválido */
        /* sintético */ void m47xa8f05936(AtomicReference screenFlashListener, CallbackToFutureAdapter.Completer completer) {
            Logger.d(Camera2CapturePipeline.TAG, "ScreenFlashTask#preCapture: invoking applyScreenFlashUi");
            this.mScreenFlash.apply(System.currentTimeMillis() + TimeUnit.SECONDS.toMillis(3L), (ImageCapture.ScreenFlashListener) screenFlashListener.get());
            completer.set(null);
        }

        /* renomeado de: lambda$preCapture$4$androidx-camera-camera2-internal-Camera2CapturePipeline$ScreenFlashTask, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m49x37082738(Void input) throws Exception {
            return this.mCameraControl.getFocusMeteringControl().enableExternalFlashAeMode(true);
        }

        /* renomeado de: lambda$preCapture$6$androidx-camera-camera2-internal-Camera2CapturePipeline$ScreenFlashTask, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m51xc51ff53a(Void input) throws Exception {
            return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda0
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Camera2CapturePipeline.ScreenFlashTask.this.m50xfe140e39(completer);
                }
            });
        }

        /* renomeado de: lambda$preCapture$5$androidx-camera-camera2-internal-Camera2CapturePipeline$ScreenFlashTask, motivo: nome Java inválido */
        /* sintético */ Object m50xfe140e39(CallbackToFutureAdapter.Completer completer) throws Exception {
            if (!this.mUseFlashModeTorchFor3aUpdate.shouldUseFlashModeTorch()) {
                completer.set(null);
                return "EnableTorchInternal";
            }
            Logger.d(Camera2CapturePipeline.TAG, "ScreenFlashTask#preCapture: enable torch");
            this.mCameraControl.enableTorchInternal(2);
            completer.set(null);
            return "EnableTorchInternal";
        }

        /* renomeado de: lambda$preCapture$7$androidx-camera-camera2-internal-Camera2CapturePipeline$ScreenFlashTask, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m52x8c2bdc3b(ListenableFuture uiAppliedFuture, Object input) throws Exception {
            return Futures.makeTimeoutFuture(TimeUnit.SECONDS.toMillis(3L), this.mScheduler, null, true, uiAppliedFuture);
        }

        /* renomeado de: lambda$preCapture$8$androidx-camera-camera2-internal-Camera2CapturePipeline$ScreenFlashTask, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m53x5337c33c(Void input) throws Exception {
            return this.mCameraControl.getFocusMeteringControl().triggerAePrecapture();
        }

        /* renomeado de: lambda$preCapture$10$androidx-camera-camera2-internal-Camera2CapturePipeline$ScreenFlashTask, motivo: nome Java inválido */
        /* sintético */ ListenableFuture m46x8e5210ab(Void input) throws Exception {
            return Camera2CapturePipeline.waitForResult(CHECK_3A_WITH_SCREEN_FLASH_TIMEOUT_IN_NS, this.mScheduler, this.mCameraControl, new ResultListener.Checker() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda6
                @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.ResultListener.Checker
                public final boolean check(TotalCaptureResult totalCaptureResult) {
                    boolean is3AConverged;
                    is3AConverged = Camera2CapturePipeline.is3AConverged(totalCaptureResult, false);
                    return is3AConverged;
                }
            });
        }

        static /* sintético */ Boolean lambda$preCapture$11(TotalCaptureResult input) {
            return false;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public boolean isCaptureResultNeeded() {
            return false;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public void postCapture() {
            Logger.d(Camera2CapturePipeline.TAG, "ScreenFlashTask#postCapture");
            if (this.mUseFlashModeTorchFor3aUpdate.shouldUseFlashModeTorch()) {
                this.mCameraControl.enableTorchInternal(0);
            }
            this.mCameraControl.getFocusMeteringControl().enableExternalFlashAeMode(false).addListener(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    Log.d(Camera2CapturePipeline.TAG, "enableExternalFlashAeMode disabled");
                }
            }, this.mExecutor);
            this.mCameraControl.getFocusMeteringControl().cancelAfAeTrigger(false, true);
            ScheduledExecutorService mainThreadExecutor = CameraXExecutors.mainThreadExecutor();
            final ImageCapture.ScreenFlash screenFlash = this.mScreenFlash;
            Objects.requireNonNull(screenFlash);
            mainThreadExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ScreenFlashTask$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    ImageCapture.ScreenFlash.this.clear();
                }
            });
        }
    }

    static boolean isFlashRequired(int flashMode, TotalCaptureResult result) {
        Logger.d(TAG, "isFlashRequired: flashMode = " + flashMode);
        switch (flashMode) {
            case 0:
                Integer aeState = result != null ? (Integer) result.get(CaptureResult.CONTROL_AE_STATE) : null;
                Logger.d(TAG, "isFlashRequired: aeState = " + aeState);
                return aeState != null && aeState.intValue() == 4;
            case 1:
            case 3:
                return true;
            case 2:
                return false;
            default:
                throw new AssertionError(flashMode);
        }
    }

    static class ResultListener implements Camera2CameraControlImpl.CaptureResultListener {
        private final Checker mChecker;
        private CallbackToFutureAdapter.Completer<TotalCaptureResult> mCompleter;
        private final ListenableFuture<TotalCaptureResult> mFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CapturePipeline$ResultListener$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CapturePipeline.ResultListener.this.m45xaa6bbe23(completer);
            }
        });

        interface Checker {
            boolean check(TotalCaptureResult totalCaptureResult);
        }

        /* renomeado de: lambda$new$0$androidx-camera-camera2-internal-Camera2CapturePipeline$ResultListener, motivo: nome Java inválido */
        /* sintético */ Object m45xaa6bbe23(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mCompleter = completer;
            return "waitFor3AResult";
        }

        ResultListener(Checker checker) {
            this.mChecker = checker;
        }

        public ListenableFuture<TotalCaptureResult> getFuture() {
            return this.mFuture;
        }

        @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
        public boolean onCaptureResult(TotalCaptureResult captureResult) {
            if (this.mChecker != null && !this.mChecker.check(captureResult)) {
                return false;
            }
            this.mCompleter.set(captureResult);
            return true;
        }
    }

    private boolean isTorchAsFlash(int flashType) {
        return this.mUseTorchAsFlash.shouldUseTorchAsFlash() || this.mTemplate == 3 || flashType == 1;
    }
}
