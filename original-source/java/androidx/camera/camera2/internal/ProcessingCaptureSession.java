package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import androidx.arch.core.util.Function;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.SynchronizedCaptureSession;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.camera2.internal.compat.quirk.CaptureSessionShouldUseMrirQuirk;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.interop.Camera2CaptureRequestConfigurator;
import androidx.camera.camera2.interop.CaptureRequestOptions;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.Preview;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.DeferrableSurfaces;
import androidx.camera.core.impl.OutputSurface;
import androidx.camera.core.impl.OutputSurfaceConfiguration;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.SessionProcessor;
import androidx.camera.core.impl.SessionProcessorSurface;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: classes.dex */
final class ProcessingCaptureSession implements CaptureSessionInterface {
    private static final String TAG = "ProcessingCaptureSession";
    private static final long TIMEOUT_GET_SURFACE_IN_MS = 5000;
    private static List<DeferrableSurface> sHeldProcessorSurfaces = new ArrayList();
    private static int sNextInstanceId = 0;
    private final Camera2CameraInfoImpl mCamera2CameraInfoImpl;
    private final CaptureSession mCaptureSession;
    final Executor mExecutor;
    private int mInstanceId;
    private SessionConfig mProcessorSessionConfig;
    private ProcessorState mProcessorState;
    private Camera2RequestProcessor mRequestProcessor;
    private final ScheduledExecutorService mScheduledExecutorService;
    private SessionConfig mSessionConfig;
    private final SessionProcessor mSessionProcessor;
    private final SessionProcessorCaptureCallback mSessionProcessorCaptureCallback;
    private List<DeferrableSurface> mOutputSurfaces = new ArrayList();
    private volatile List<CaptureConfig> mPendingCaptureConfigs = null;
    private CaptureRequestOptions mSessionOptions = new CaptureRequestOptions.Builder().build();
    private CaptureRequestOptions mStillCaptureOptions = new CaptureRequestOptions.Builder().build();

    private enum ProcessorState {
        UNINITIALIZED,
        SESSION_INITIALIZED,
        ON_CAPTURE_SESSION_STARTED,
        ON_CAPTURE_SESSION_ENDED,
        DE_INITIALIZED
    }

    ProcessingCaptureSession(SessionProcessor sessionProcessor, Camera2CameraInfoImpl camera2CameraInfoImpl, DynamicRangesCompat dynamicRangesCompat, Executor executor, ScheduledExecutorService scheduledExecutorService, Camera2CaptureRequestConfigurator captureRequestConfigurator) {
        this.mInstanceId = 0;
        this.mCaptureSession = new CaptureSession(dynamicRangesCompat, DeviceQuirks.get(CaptureSessionShouldUseMrirQuirk.class) != null, captureRequestConfigurator);
        this.mSessionProcessor = sessionProcessor;
        this.mCamera2CameraInfoImpl = camera2CameraInfoImpl;
        this.mExecutor = executor;
        this.mScheduledExecutorService = scheduledExecutorService;
        this.mProcessorState = ProcessorState.UNINITIALIZED;
        this.mSessionProcessorCaptureCallback = new SessionProcessorCaptureCallback();
        int i = sNextInstanceId;
        sNextInstanceId = i + 1;
        this.mInstanceId = i;
        Logger.d(TAG, "New ProcessingCaptureSession (id=" + this.mInstanceId + ")");
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public ListenableFuture<Void> open(final SessionConfig sessionConfig, final CameraDevice cameraDevice, final SynchronizedCaptureSession.Opener opener) {
        Preconditions.checkArgument(this.mProcessorState == ProcessorState.UNINITIALIZED, "Invalid state state:" + this.mProcessorState);
        Preconditions.checkArgument(!sessionConfig.getSurfaces().isEmpty(), "SessionConfig contains no surfaces");
        Logger.d(TAG, "open (id=" + this.mInstanceId + ")");
        this.mOutputSurfaces = sessionConfig.getSurfaces();
        ListenableFuture<Void> future = FutureChain.from(DeferrableSurfaces.surfaceListWithTimeout(this.mOutputSurfaces, false, 5000L, this.mExecutor, this.mScheduledExecutorService)).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                return ProcessingCaptureSession.this.m84x6ab9d420(sessionConfig, cameraDevice, opener, (List) obj);
            }
        }, this.mExecutor).transform(new Function() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda2
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return ProcessingCaptureSession.this.m85x7b6fa0e1((Void) obj);
            }
        }, this.mExecutor);
        return future;
    }

    /* renamed from: lambda$open$2$androidx-camera-camera2-internal-ProcessingCaptureSession, reason: not valid java name */
    /* synthetic */ ListenableFuture m84x6ab9d420(SessionConfig sessionConfig, CameraDevice cameraDevice, SynchronizedCaptureSession.Opener opener, List surfaceList) throws Exception {
        final DeferrableSurface postviewDeferrableSurface;
        Logger.d(TAG, "-- getSurfaces done, start init (id=" + this.mInstanceId + ")");
        if (this.mProcessorState == ProcessorState.DE_INITIALIZED) {
            return Futures.immediateFailedFuture(new IllegalStateException("SessionProcessorCaptureSession is closed."));
        }
        if (surfaceList.contains(null)) {
            DeferrableSurface deferrableSurface = sessionConfig.getSurfaces().get(surfaceList.indexOf(null));
            return Futures.immediateFailedFuture(new DeferrableSurface.SurfaceClosedException("Surface closed", deferrableSurface));
        }
        OutputSurface previewOutputSurface = null;
        OutputSurface captureOutputSurface = null;
        OutputSurface analysisOutputSurface = null;
        OutputSurface postviewOutputSurface = null;
        for (int i = 0; i < sessionConfig.getSurfaces().size(); i++) {
            DeferrableSurface dSurface = sessionConfig.getSurfaces().get(i);
            if (isPreview(dSurface) || isStreamSharing(dSurface)) {
                previewOutputSurface = OutputSurface.create(dSurface.getSurface().get(), dSurface.getPrescribedSize(), dSurface.getPrescribedStreamFormat());
            } else if (isImageCapture(dSurface)) {
                captureOutputSurface = OutputSurface.create(dSurface.getSurface().get(), dSurface.getPrescribedSize(), dSurface.getPrescribedStreamFormat());
            } else if (isImageAnalysis(dSurface)) {
                analysisOutputSurface = OutputSurface.create(dSurface.getSurface().get(), dSurface.getPrescribedSize(), dSurface.getPrescribedStreamFormat());
            }
        }
        if (sessionConfig.getPostviewOutputConfig() != null) {
            postviewDeferrableSurface = sessionConfig.getPostviewOutputConfig().getSurface();
            postviewOutputSurface = OutputSurface.create(postviewDeferrableSurface.getSurface().get(), postviewDeferrableSurface.getPrescribedSize(), postviewDeferrableSurface.getPrescribedStreamFormat());
        } else {
            postviewDeferrableSurface = null;
        }
        this.mProcessorState = ProcessorState.SESSION_INITIALIZED;
        try {
            List<DeferrableSurface> surfacesToIncrement = new ArrayList<>(this.mOutputSurfaces);
            if (postviewDeferrableSurface != null) {
                surfacesToIncrement.add(postviewDeferrableSurface);
            }
            DeferrableSurfaces.incrementAll(surfacesToIncrement);
            Logger.w(TAG, "== initSession (id=" + this.mInstanceId + ")");
            try {
                this.mProcessorSessionConfig = this.mSessionProcessor.initSession(this.mCamera2CameraInfoImpl, OutputSurfaceConfiguration.create(previewOutputSurface, captureOutputSurface, analysisOutputSurface, postviewOutputSurface));
                this.mProcessorSessionConfig.getSurfaces().get(0).getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProcessingCaptureSession.this.m83x494e3a9e(postviewDeferrableSurface);
                    }
                }, CameraXExecutors.directExecutor());
                for (final DeferrableSurface surface : this.mProcessorSessionConfig.getSurfaces()) {
                    sHeldProcessorSurfaces.add(surface);
                    surface.getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda4
                        @Override // java.lang.Runnable
                        public final void run() {
                            ProcessingCaptureSession.sHeldProcessorSurfaces.remove(DeferrableSurface.this);
                        }
                    }, this.mExecutor);
                }
                SessionConfig.ValidatingBuilder validatingBuilder = new SessionConfig.ValidatingBuilder();
                validatingBuilder.add(sessionConfig);
                validatingBuilder.clearSurfaces();
                validatingBuilder.add(this.mProcessorSessionConfig);
                Preconditions.checkArgument(validatingBuilder.isValid(), "Cannot transform the SessionConfig");
                SessionConfig transformedConfig = validatingBuilder.build();
                ListenableFuture<Void> openSessionFuture = this.mCaptureSession.open(transformedConfig, (CameraDevice) Preconditions.checkNotNull(cameraDevice), opener);
                Futures.addCallback(openSessionFuture, new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession.1
                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onSuccess(Void result) {
                    }

                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onFailure(Throwable t) {
                        Logger.e(ProcessingCaptureSession.TAG, "open session failed ", t);
                        ProcessingCaptureSession.this.close();
                        ProcessingCaptureSession.this.release(false);
                    }
                }, this.mExecutor);
                return openSessionFuture;
            } catch (Throwable e) {
                Logger.e(TAG, "initSession failed", e);
                DeferrableSurfaces.decrementAll(this.mOutputSurfaces);
                if (postviewDeferrableSurface != null) {
                    postviewDeferrableSurface.decrementUseCount();
                }
                throw e;
            }
        } catch (DeferrableSurface.SurfaceClosedException e2) {
            return Futures.immediateFailedFuture(e2);
        }
    }

    /* renamed from: lambda$open$0$androidx-camera-camera2-internal-ProcessingCaptureSession, reason: not valid java name */
    /* synthetic */ void m83x494e3a9e(DeferrableSurface postviewDeferrableSurface) {
        DeferrableSurfaces.decrementAll(this.mOutputSurfaces);
        if (postviewDeferrableSurface != null) {
            postviewDeferrableSurface.decrementUseCount();
        }
    }

    /* renamed from: lambda$open$3$androidx-camera-camera2-internal-ProcessingCaptureSession, reason: not valid java name */
    /* synthetic */ Void m85x7b6fa0e1(Void v) {
        onConfigured(this.mCaptureSession);
        return null;
    }

    private static void cancelRequests(List<CaptureConfig> captureConfigs) {
        for (CaptureConfig captureConfig : captureConfigs) {
            for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                cameraCaptureCallback.onCaptureCancelled(captureConfig.getId());
            }
        }
    }

    void issueTriggerRequest(CaptureConfig captureConfig) {
        Logger.d(TAG, "issueTriggerRequest");
        CaptureRequestOptions options = CaptureRequestOptions.Builder.from(captureConfig.getImplementationOptions()).build();
        boolean hasTriggerParameters = false;
        for (Config.Option<?> option : options.listOptions()) {
            CaptureRequest.Key<Object> key = (CaptureRequest.Key) option.getToken();
            if (key.equals(CaptureRequest.CONTROL_AF_TRIGGER) || key.equals(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER)) {
                hasTriggerParameters = true;
                break;
            }
        }
        if (hasTriggerParameters) {
            this.mSessionProcessor.startTrigger(options, captureConfig.getTagBundle(), new CaptureCallbackAdapter(captureConfig.getId(), captureConfig.getCameraCaptureCallbacks()));
        } else {
            cancelRequests(Arrays.asList(captureConfig));
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void issueCaptureRequests(List<CaptureConfig> captureConfigs) {
        if (captureConfigs.isEmpty()) {
        }
        Logger.d(TAG, "issueCaptureRequests (id=" + this.mInstanceId + ") + state =" + this.mProcessorState);
        switch (this.mProcessorState) {
            case UNINITIALIZED:
            case SESSION_INITIALIZED:
                if (this.mPendingCaptureConfigs != null) {
                    cancelRequests(captureConfigs);
                    Logger.d(TAG, "cancel the request because are pending un-submitted request");
                    break;
                } else {
                    this.mPendingCaptureConfigs = captureConfigs;
                    break;
                }
            case ON_CAPTURE_SESSION_STARTED:
                for (CaptureConfig captureConfig : captureConfigs) {
                    if (isTemplateTypeForStillCapture(captureConfig.getTemplateType())) {
                        issueStillCaptureRequest(captureConfig);
                    } else {
                        issueTriggerRequest(captureConfig);
                    }
                }
                break;
            case ON_CAPTURE_SESSION_ENDED:
            case DE_INITIALIZED:
                Logger.d(TAG, "Run issueCaptureRequests in wrong state, state = " + this.mProcessorState);
                cancelRequests(captureConfigs);
                break;
        }
    }

    private boolean isTemplateTypeForStillCapture(int templateType) {
        return templateType == 2 || templateType == 4;
    }

    void issueStillCaptureRequest(CaptureConfig captureConfig) {
        CaptureRequestOptions.Builder builder = CaptureRequestOptions.Builder.from(captureConfig.getImplementationOptions());
        if (captureConfig.getImplementationOptions().containsOption(CaptureConfig.OPTION_ROTATION)) {
            builder.setCaptureRequestOption(CaptureRequest.JPEG_ORIENTATION, (Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_ROTATION));
        }
        if (captureConfig.getImplementationOptions().containsOption(CaptureConfig.OPTION_JPEG_QUALITY)) {
            builder.setCaptureRequestOption(CaptureRequest.JPEG_QUALITY, Byte.valueOf(((Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_JPEG_QUALITY)).byteValue()));
        }
        this.mStillCaptureOptions = builder.build();
        updateParameters(this.mSessionOptions, this.mStillCaptureOptions);
        this.mSessionProcessor.startCapture(captureConfig.isPostviewEnabled(), captureConfig.getTagBundle(), new CaptureCallbackAdapter(captureConfig.getId(), captureConfig.getCameraCaptureCallbacks()));
    }

    private static class CaptureCallbackAdapter implements SessionProcessor.CaptureCallback {
        private List<CameraCaptureCallback> mCameraCaptureCallbacks;
        private final int mCaptureConfigId;
        private CameraCaptureResult mCaptureResult;

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureProcessStarted(int i) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureProcessStarted(this, i);
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureSequenceAborted(int i) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureSequenceAborted(this, i);
        }

        private CaptureCallbackAdapter(int captureConfigId, List<CameraCaptureCallback> cameraCaptureCallbacks) {
            this.mCaptureResult = null;
            this.mCaptureConfigId = captureConfigId;
            this.mCameraCaptureCallbacks = cameraCaptureCallbacks;
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureStarted(int captureSequenceId, long timestamp) {
            for (CameraCaptureCallback cameraCaptureCallback : this.mCameraCaptureCallbacks) {
                cameraCaptureCallback.onCaptureStarted(this.mCaptureConfigId);
            }
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureFailed(int captureSequenceId) {
            for (CameraCaptureCallback cameraCaptureCallback : this.mCameraCaptureCallbacks) {
                cameraCaptureCallback.onCaptureFailed(this.mCaptureConfigId, new CameraCaptureFailure(CameraCaptureFailure.Reason.ERROR));
            }
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureCompleted(long timestamp, int captureSequenceId, CameraCaptureResult captureResult) {
            this.mCaptureResult = captureResult;
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceCompleted(int captureSequenceId) {
            CameraCaptureResult cameraCaptureResult = this.mCaptureResult != null ? this.mCaptureResult : new CameraCaptureResult.EmptyCameraCaptureResult();
            for (CameraCaptureCallback cameraCaptureCallback : this.mCameraCaptureCallbacks) {
                cameraCaptureCallback.onCaptureCompleted(this.mCaptureConfigId, cameraCaptureResult);
            }
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureProcessProgressed(int progress) {
            for (CameraCaptureCallback cameraCaptureCallback : this.mCameraCaptureCallbacks) {
                cameraCaptureCallback.onCaptureProcessProgressed(this.mCaptureConfigId, progress);
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public ListenableFuture<Void> release(boolean abortInFlightCaptures) {
        Logger.d(TAG, "release (id=" + this.mInstanceId + ") mProcessorState=" + this.mProcessorState);
        ListenableFuture<Void> future = this.mCaptureSession.release(abortInFlightCaptures);
        switch (this.mProcessorState.ordinal()) {
            case 1:
            case 3:
                future.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProcessingCaptureSession.this.m86x14d78e45();
                    }
                }, CameraXExecutors.directExecutor());
                break;
        }
        this.mProcessorState = ProcessorState.DE_INITIALIZED;
        return future;
    }

    /* renamed from: lambda$release$4$androidx-camera-camera2-internal-ProcessingCaptureSession, reason: not valid java name */
    /* synthetic */ void m86x14d78e45() {
        Logger.d(TAG, "== deInitSession (id=" + this.mInstanceId + ")");
        this.mSessionProcessor.deInitSession();
    }

    private static List<SessionProcessorSurface> getSessionProcessorSurfaceList(List<DeferrableSurface> deferrableSurfaceList) {
        ArrayList<SessionProcessorSurface> outputSurfaceList = new ArrayList<>();
        for (DeferrableSurface deferrableSurface : deferrableSurfaceList) {
            Preconditions.checkArgument(deferrableSurface instanceof SessionProcessorSurface, "Surface must be SessionProcessorSurface");
            outputSurfaceList.add((SessionProcessorSurface) deferrableSurface);
        }
        return outputSurfaceList;
    }

    void onConfigured(CaptureSession captureSession) {
        if (this.mProcessorState != ProcessorState.SESSION_INITIALIZED) {
            return;
        }
        this.mRequestProcessor = new Camera2RequestProcessor(captureSession, getSessionProcessorSurfaceList(this.mProcessorSessionConfig.getSurfaces()));
        Logger.d(TAG, "== onCaptureSessinStarted (id = " + this.mInstanceId + ")");
        this.mSessionProcessor.onCaptureSessionStart(this.mRequestProcessor);
        this.mProcessorState = ProcessorState.ON_CAPTURE_SESSION_STARTED;
        if (this.mSessionConfig != null) {
            setSessionConfig(this.mSessionConfig);
        }
        if (this.mPendingCaptureConfigs != null) {
            issueCaptureRequests(this.mPendingCaptureConfigs);
            this.mPendingCaptureConfigs = null;
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public SessionConfig getSessionConfig() {
        return this.mSessionConfig;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public List<CaptureConfig> getCaptureConfigs() {
        return this.mPendingCaptureConfigs != null ? this.mPendingCaptureConfigs : Collections.emptyList();
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void cancelIssuedCaptureRequests() {
        Logger.d(TAG, "cancelIssuedCaptureRequests (id=" + this.mInstanceId + ")");
        if (this.mPendingCaptureConfigs != null) {
            for (CaptureConfig captureConfig : this.mPendingCaptureConfigs) {
                for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                    cameraCaptureCallback.onCaptureCancelled(captureConfig.getId());
                }
            }
            this.mPendingCaptureConfigs = null;
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void close() {
        Logger.d(TAG, "close (id=" + this.mInstanceId + ") state=" + this.mProcessorState);
        if (this.mProcessorState == ProcessorState.ON_CAPTURE_SESSION_STARTED) {
            Logger.d(TAG, "== onCaptureSessionEnd (id = " + this.mInstanceId + ")");
            this.mSessionProcessor.onCaptureSessionEnd();
            if (this.mRequestProcessor != null) {
                this.mRequestProcessor.close();
            }
            this.mProcessorState = ProcessorState.ON_CAPTURE_SESSION_ENDED;
        }
        this.mCaptureSession.close();
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setSessionConfig(SessionConfig sessionConfig) {
        Logger.d(TAG, "setSessionConfig (id=" + this.mInstanceId + ")");
        this.mSessionConfig = sessionConfig;
        if (sessionConfig == null) {
            return;
        }
        if (this.mRequestProcessor != null) {
            this.mRequestProcessor.updateSessionConfig(sessionConfig);
        }
        if (this.mProcessorState == ProcessorState.ON_CAPTURE_SESSION_STARTED) {
            CaptureRequestOptions.Builder requestOptionsbuilder = CaptureRequestOptions.Builder.from(sessionConfig.getImplementationOptions());
            Integer stabilizationMode = Camera2CaptureRequestBuilder.getVideoStabilizationModeFromCaptureConfig(sessionConfig.getRepeatingCaptureConfig());
            if (stabilizationMode != null) {
                requestOptionsbuilder.setCaptureRequestOption(CaptureRequest.CONTROL_VIDEO_STABILIZATION_MODE, stabilizationMode);
            }
            this.mSessionOptions = requestOptionsbuilder.build();
            updateParameters(this.mSessionOptions, this.mStillCaptureOptions);
            if (!hasPreviewSurface(sessionConfig.getRepeatingCaptureConfig())) {
                this.mSessionProcessor.stopRepeating();
            } else {
                this.mSessionProcessor.startRepeating(sessionConfig.getRepeatingCaptureConfig().getTagBundle(), this.mSessionProcessorCaptureCallback);
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public boolean isInOpenState() {
        return this.mCaptureSession.isInOpenState();
    }

    private static boolean hasPreviewSurface(CaptureConfig captureConfig) {
        for (DeferrableSurface surface : captureConfig.getSurfaces()) {
            if (isPreview(surface) || isStreamSharing(surface)) {
                return true;
            }
        }
        return false;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setStreamUseCaseMap(Map<DeferrableSurface, Long> streamUseCaseMap) {
    }

    private void updateParameters(CaptureRequestOptions sessionOptions, CaptureRequestOptions stillCaptureOptions) {
        Camera2ImplConfig.Builder builder = new Camera2ImplConfig.Builder();
        builder.insertAllOptions(sessionOptions);
        builder.insertAllOptions(stillCaptureOptions);
        this.mSessionProcessor.setParameters(builder.build());
    }

    private static boolean isPreview(DeferrableSurface dSurface) {
        return Objects.equals(dSurface.getContainerClass(), Preview.class);
    }

    private static boolean isImageCapture(DeferrableSurface dSurface) {
        return Objects.equals(dSurface.getContainerClass(), ImageCapture.class);
    }

    private static boolean isImageAnalysis(DeferrableSurface dSurface) {
        return Objects.equals(dSurface.getContainerClass(), ImageAnalysis.class);
    }

    private static boolean isStreamSharing(DeferrableSurface dSurface) {
        return Objects.equals(dSurface.getContainerClass(), StreamSharing.class);
    }

    private static class SessionProcessorCaptureCallback implements SessionProcessor.CaptureCallback {
        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureProcessProgressed(int i) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureProcessProgressed(this, i);
        }

        SessionProcessorCaptureCallback() {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureStarted(int captureSequenceId, long timestamp) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureProcessStarted(int captureSequenceId) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureFailed(int captureSequenceId) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceCompleted(int captureSequenceId) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceAborted(int captureSequenceId) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureCompleted(long timestamp, int captureSequenceId, CameraCaptureResult result) {
        }
    }
}
