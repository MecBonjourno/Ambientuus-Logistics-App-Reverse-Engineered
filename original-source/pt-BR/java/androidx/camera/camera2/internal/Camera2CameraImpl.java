package androidx.camera.camera2.internal;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.media.CamcorderProfile;
import android.os.Handler;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Rational;
import android.util.Size;
import android.view.Surface;
import androidx.camera.camera2.internal.Camera2CameraImpl;
import androidx.camera.camera2.internal.MeteringRepeatingSession;
import androidx.camera.camera2.internal.SynchronizedCaptureSession;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.LegacyCameraSurfaceCleanupQuirk;
import androidx.camera.camera2.internal.compat.workaround.CloseCameraBeforeCreateNewSession;
import androidx.camera.camera2.interop.Camera2CaptureRequestConfigurator;
import androidx.camera.camera2.interop.Camera2CaptureRequestConfiguratorKt;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraState;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.CameraXConfig;
import androidx.camera.core.Logger;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCase;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.featuregroup.impl.FeatureCombinationQuery;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraConfigs;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CameraStateRegistry;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.LiveDataObservable;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.SessionProcessor;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.UseCaseAttachState;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import androidx.credentials.CredentialOption;
import androidx.tracing.Trace;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/* carregado de: classes.dex */
final class Camera2CameraImpl implements CameraInternal {
    private static final int ERROR_NONE = 0;
    private static final String TAG = "Camera2CameraImpl";
    final CameraAvailability mCameraAvailability;
    private final CameraCharacteristicsCompat mCameraCharacteristicsCompat;
    final CameraConfigureAvailable mCameraConfigureAvailable;
    private final Camera2CameraControlImpl mCameraControlInternal;
    final CameraCoordinator mCameraCoordinator;
    CameraDevice mCameraDevice;
    final Camera2CameraInfoImpl mCameraInfoInternal;
    private final CameraManagerCompat mCameraManager;
    private final CameraStateMachine mCameraStateMachine;
    final CameraStateRegistry mCameraStateRegistry;
    private final CameraXConfig mCameraXConfig;
    CaptureSessionInterface mCaptureSession;
    private final SynchronizedCaptureSession.OpenerBuilder mCaptureSessionOpenerBuilder;
    private final CaptureSessionRepository mCaptureSessionRepository;
    private final boolean mConfigAndCloseQuirk;
    private final DisplayInfoManager mDisplayInfoManager;
    private final DynamicRangesCompat mDynamicRangesCompat;
    private final Executor mExecutor;
    private MeteringRepeatingSession mMeteringRepeatingSession;
    private final ScheduledExecutorService mScheduledExecutorService;
    private SessionProcessor mSessionProcessor;
    private final boolean mShouldCloseCameraBeforeCreateNewSession;
    private final StateCallback mStateCallback;
    private final SupportedSurfaceCombination mSupportedSurfaceCombination;
    private final UseCaseAttachState mUseCaseAttachState;
    ListenableFuture<Void> mUserReleaseFuture;
    CallbackToFutureAdapter.Completer<Void> mUserReleaseNotifier;
    volatile InternalState mState = InternalState.INITIALIZED;
    private final LiveDataObservable<CameraInternal.State> mObservableState = new LiveDataObservable<>();
    int mCameraDeviceError = 0;
    final AtomicInteger mReleaseRequestCount = new AtomicInteger(0);
    final Map<CaptureSessionInterface, ListenableFuture<Void>> mReleasedCaptureSessions = new LinkedHashMap();
    private int mTraceStateErrorCount = 0;
    private boolean mIsConfigAndCloseRequired = false;
    private boolean mIsConfiguringForClose = false;
    private boolean mIsPrimary = true;
    private final Set<String> mSessionStartNotifiedUseCases = new HashSet();
    private CameraConfig mCameraConfig = CameraConfigs.defaultConfig();
    final Object mLock = new Object();
    boolean mIsActiveResumingMode = false;
    private final ErrorTimeoutReopenScheduler mErrorTimeoutReopenScheduler = new ErrorTimeoutReopenScheduler();

    enum InternalState {
        RELEASED,
        RELEASING,
        INITIALIZED,
        PENDING_OPEN,
        OPENING_WITH_ERROR,
        CLOSING,
        REOPENING_QUIRK,
        REOPENING,
        OPENING,
        OPENED,
        CONFIGURED
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public /* sintético */ CameraControl getCameraControl() {
        CameraControl cameraControlInternal;
        cameraControlInternal = getCameraControlInternal();
        return cameraControlInternal;
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public /* sintético */ CameraInfo getCameraInfo() {
        CameraInfo cameraInfoInternal;
        cameraInfoInternal = getCameraInfoInternal();
        return cameraInfoInternal;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public /* sintético */ boolean getHasTransform() {
        return CameraInternal.CC.$default$getHasTransform(this);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public /* sintético */ boolean isFrontFacing() {
        return CameraInternal.CC.$default$isFrontFacing(this);
    }

    @Override // androidx.camera.core.Camera
    public /* sintético */ boolean isUseCasesCombinationSupported(boolean z, UseCase... useCaseArr) {
        return Camera.CC.$default$isUseCasesCombinationSupported(this, z, useCaseArr);
    }

    @Override // androidx.camera.core.Camera
    public /* sintético */ boolean isUseCasesCombinationSupported(UseCase... useCaseArr) {
        boolean isUseCasesCombinationSupported;
        isUseCasesCombinationSupported = isUseCasesCombinationSupported(true, useCaseArr);
        return isUseCasesCombinationSupported;
    }

    @Override // androidx.camera.core.Camera
    public /* sintético */ boolean isUseCasesCombinationSupportedByFramework(UseCase... useCaseArr) {
        boolean isUseCasesCombinationSupported;
        isUseCasesCombinationSupported = isUseCasesCombinationSupported(false, useCaseArr);
        return isUseCasesCombinationSupported;
    }

    Camera2CameraImpl(Context context, CameraManagerCompat cameraManager, String cameraId, Camera2CameraInfoImpl cameraInfoImpl, CameraCoordinator cameraCoordinator, CameraStateRegistry cameraStateRegistry, Executor executor, Handler schedulerHandler, DisplayInfoManager displayInfoManager, long cameraOpenRetryMaxTimeoutInMs, CameraXConfig cameraXConfig) throws CameraUnavailableException {
        this.mCameraManager = cameraManager;
        this.mCameraCoordinator = cameraCoordinator;
        this.mCameraStateRegistry = cameraStateRegistry;
        this.mScheduledExecutorService = CameraXExecutors.newHandlerExecutor(schedulerHandler);
        this.mExecutor = CameraXExecutors.newSequentialExecutor(executor);
        this.mStateCallback = new StateCallback(this.mExecutor, this.mScheduledExecutorService, cameraOpenRetryMaxTimeoutInMs);
        this.mUseCaseAttachState = new UseCaseAttachState(cameraId);
        this.mObservableState.postValue(CameraInternal.State.CLOSED);
        this.mCameraStateMachine = new CameraStateMachine(cameraStateRegistry);
        this.mCaptureSessionRepository = new CaptureSessionRepository(this.mExecutor);
        this.mDisplayInfoManager = displayInfoManager;
        this.mCameraXConfig = cameraXConfig;
        try {
            this.mCameraCharacteristicsCompat = this.mCameraManager.getCameraCharacteristicsCompat(cameraId);
            this.mCameraControlInternal = new Camera2CameraControlImpl(this.mCameraCharacteristicsCompat, this.mScheduledExecutorService, this.mExecutor, new ControlUpdateListenerInternal(), cameraInfoImpl.getCameraQuirks());
        } catch (CameraAccessExceptionCompat e) {
            e = e;
        }
        try {
            this.mCameraInfoInternal = cameraInfoImpl;
            this.mCameraInfoInternal.linkWithCameraControl(this.mCameraControlInternal);
            this.mCameraInfoInternal.setCameraStateSource(this.mCameraStateMachine.getStateLiveData());
            this.mDynamicRangesCompat = DynamicRangesCompat.fromCameraCharacteristics(this.mCameraCharacteristicsCompat);
            this.mCaptureSession = newCaptureSession();
            this.mCaptureSessionOpenerBuilder = new SynchronizedCaptureSession.OpenerBuilder(this.mExecutor, this.mScheduledExecutorService, schedulerHandler, this.mCaptureSessionRepository, cameraInfoImpl.getCameraQuirks(), DeviceQuirks.getAll());
            this.mShouldCloseCameraBeforeCreateNewSession = CloseCameraBeforeCreateNewSession.shouldCloseCamera(cameraInfoImpl.getCameraQuirks());
            this.mConfigAndCloseQuirk = cameraInfoImpl.getCameraQuirks().contains(LegacyCameraSurfaceCleanupQuirk.class);
            this.mCameraAvailability = new CameraAvailability(cameraId);
            this.mCameraConfigureAvailable = new CameraConfigureAvailable();
            this.mCameraStateRegistry.registerCamera(this, this.mExecutor, this.mCameraConfigureAvailable, this.mCameraAvailability);
            this.mCameraManager.registerAvailabilityCallback(this.mExecutor, this.mCameraAvailability);
            this.mSupportedSurfaceCombination = new SupportedSurfaceCombination(context, cameraId, cameraManager, new CamcorderProfileHelper() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl.1
                @Override // androidx.camera.camera2.internal.CamcorderProfileHelper
                public boolean hasProfile(int cameraId2, int quality) {
                    return CamcorderProfile.hasProfile(cameraId2, quality);
                }

                @Override // androidx.camera.camera2.internal.CamcorderProfileHelper
                public CamcorderProfile get(int cameraId2, int quality) {
                    return CamcorderProfile.get(cameraId2, quality);
                }
            }, FeatureCombinationQuery.NO_OP_FEATURE_COMBINATION_QUERY);
        } catch (CameraAccessExceptionCompat e2) {
            e = e2;
            throw CameraUnavailableExceptionHelper.createFrom(e);
        }
    }

    private CaptureSessionInterface newCaptureSession() {
        synchronized (this.mLock) {
            Camera2CaptureRequestConfigurator captureRequestConfigurator = this.mCameraXConfig == null ? null : Camera2CaptureRequestConfiguratorKt.getCamera2CaptureRequestConfigurator(this.mCameraXConfig);
            if (this.mSessionProcessor == null) {
                return new CaptureSession(this.mDynamicRangesCompat, this.mCameraInfoInternal.getCameraQuirks(), captureRequestConfigurator);
            }
            return new ProcessingCaptureSession(this.mSessionProcessor, this.mCameraInfoInternal, this.mDynamicRangesCompat, this.mExecutor, this.mScheduledExecutorService, captureRequestConfigurator);
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void open() {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda11
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.openInternal();
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void openInternal() {
        switch (this.mState.ordinal()) {
            case 2:
            case 3:
            case 4:
                tryForceOpenCameraDevice(false);
                break;
            case 5:
                setState(InternalState.REOPENING);
                if (!isSessionCloseComplete() && !this.mIsConfiguringForClose && this.mCameraDeviceError == 0) {
                    Preconditions.checkState(this.mCameraDevice != null, "Camera Device should be open if session close is not complete");
                    setState(InternalState.OPENED);
                    openCaptureSession();
                    break;
                }
                break;
            default:
                debugLog("open() ignored due to being in state: " + this.mState);
                break;
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void close() {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda17
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.closeInternal();
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void closeInternal() {
        debugLog("Closing camera.");
        switch (this.mState.ordinal()) {
            case 3:
            case 4:
                canFinish = this.mCameraDevice == null;
                Preconditions.checkState(canFinish);
                setState(InternalState.INITIALIZED);
                break;
            case 5:
            default:
                debugLog("close() ignored due to being in state: " + this.mState);
                break;
            case 6:
            case 7:
            case 8:
                if (!this.mStateCallback.cancelScheduledReopen() && !this.mErrorTimeoutReopenScheduler.isErrorHandling()) {
                    canFinish = false;
                }
                this.mErrorTimeoutReopenScheduler.cancel();
                setState(InternalState.CLOSING);
                if (canFinish) {
                    Preconditions.checkState(isSessionCloseComplete());
                    configAndCloseIfNeeded();
                    break;
                }
                break;
            case 9:
            case 10:
                setState(InternalState.CLOSING);
                closeCamera(false);
                break;
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void configAndCloseIfNeeded() {
        Preconditions.checkState(this.mState == InternalState.RELEASING || this.mState == InternalState.CLOSING);
        Preconditions.checkState(this.mReleasedCaptureSessions.isEmpty());
        if (!this.mIsConfigAndCloseRequired) {
            finishClose();
            return;
        }
        if (this.mIsConfiguringForClose) {
            debugLog("Ignored since configAndClose is processing");
            return;
        }
        if (!this.mCameraAvailability.isCameraAvailable()) {
            this.mIsConfigAndCloseRequired = false;
            finishClose();
            debugLog("Ignore configAndClose and finish the close flow directly since camera is unavailable.");
        } else {
            debugLog("Open camera to configAndClose");
            ListenableFuture<Void> configAndCloseFuture = openCameraConfigAndClose();
            this.mIsConfiguringForClose = true;
            configAndCloseFuture.addListener(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda16
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CameraImpl.this.m21x65edacec();
                }
            }, this.mExecutor);
        }
    }

    /* renomeado de: lambda$configAndCloseIfNeeded$0$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m21x65edacec() {
        this.mIsConfiguringForClose = false;
        this.mIsConfigAndCloseRequired = false;
        debugLog("OpenCameraConfigAndClose is done, state: " + this.mState);
        switch (this.mState.ordinal()) {
            case 1:
            case 5:
                Preconditions.checkState(isSessionCloseComplete());
                finishClose();
                break;
            case 7:
                if (this.mCameraDeviceError != 0) {
                    debugLog("OpenCameraConfigAndClose in error: " + getErrorMessage(this.mCameraDeviceError));
                    this.mStateCallback.scheduleCameraReopen();
                    break;
                } else {
                    tryOpenCameraDevice(false);
                    break;
                }
            default:
                debugLog("OpenCameraConfigAndClose finished while in state: " + this.mState);
                break;
        }
    }

    private ListenableFuture<Void> openCameraConfigAndClose() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda15
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CameraImpl.this.m32xfb055f0e(completer);
            }
        });
    }

    /* renomeado de: lambda$openCameraConfigAndClose$1$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ Object m32xfb055f0e(final CallbackToFutureAdapter.Completer completer) throws Exception {
        try {
            SessionConfig config = this.mUseCaseAttachState.getAttachedBuilder().build();
            List<CameraDevice.StateCallback> allStateCallbacks = new ArrayList<>(config.getDeviceStateCallbacks());
            allStateCallbacks.add(this.mCaptureSessionRepository.getCameraStateCallback());
            allStateCallbacks.add(new CameraDevice.StateCallback() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl.2
                @Override // android.hardware.camera2.CameraDevice.StateCallback
                public void onOpened(final CameraDevice camera) {
                    Camera2CameraImpl.this.debugLog("openCameraConfigAndClose camera opened");
                    ListenableFuture configAndClose = Camera2CameraImpl.this.configAndClose(camera);
                    Objects.requireNonNull(camera);
                    configAndClose.addListener(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$2$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            camera.close();
                        }
                    }, Camera2CameraImpl.this.mExecutor);
                }

                @Override // android.hardware.camera2.CameraDevice.StateCallback
                public void onDisconnected(CameraDevice camera) {
                    Camera2CameraImpl.this.debugLog("openCameraConfigAndClose camera disconnected");
                    completer.set(null);
                }

                @Override // android.hardware.camera2.CameraDevice.StateCallback
                public void onError(CameraDevice camera, int error) {
                    Camera2CameraImpl.this.debugLog("openCameraConfigAndClose camera error " + error);
                    completer.set(null);
                }

                @Override // android.hardware.camera2.CameraDevice.StateCallback
                public void onClosed(CameraDevice camera) {
                    Camera2CameraImpl.this.debugLog("openCameraConfigAndClose camera closed");
                    completer.set(null);
                }
            });
            this.mCameraManager.openCamera(this.mCameraInfoInternal.getCameraId(), this.mExecutor, CameraDeviceStateCallbacks.createComboCallback(allStateCallbacks));
            return "configAndCloseTask";
        } catch (CameraAccessExceptionCompat | RuntimeException e) {
            debugLog("Unable to open camera for configAndClose: " + e.getMessage(), e);
            completer.setException(e);
            return "configAndCloseTask";
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public ListenableFuture<Void> configAndClose(CameraDevice cameraDevice) {
        final CaptureSession noOpSession = new CaptureSession(this.mDynamicRangesCompat);
        final SurfaceTexture surfaceTexture = new SurfaceTexture(0);
        surfaceTexture.setDefaultBufferSize(640, 480);
        final Surface surface = new Surface(surfaceTexture);
        final DeferrableSurface deferrableSurface = new ImmediateSurface(surface);
        deferrableSurface.getTerminationFuture().addListener(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda10
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.lambda$configAndClose$2(surface, surfaceTexture);
            }
        }, CameraXExecutors.directExecutor());
        SessionConfig.Builder builder = new SessionConfig.Builder();
        builder.addNonRepeatingSurface(deferrableSurface);
        builder.setTemplateType(1);
        debugLog("Start configAndClose.");
        ListenableFuture<Void> openSessionFuture = noOpSession.open(builder.build(), cameraDevice, this.mCaptureSessionOpenerBuilder.build());
        return FutureChain.from(Futures.transformAsyncOnCompletion(openSessionFuture)).transformAsync(new AsyncFunction() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda12
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                return Camera2CameraImpl.lambda$configAndClose$3(CaptureSession.this, deferrableSurface, (Void) obj);
            }
        }, this.mExecutor);
    }

    static /* sintético */ void lambda$configAndClose$2(Surface surface, SurfaceTexture surfaceTexture) {
        surface.release();
        surfaceTexture.release();
    }

    static /* sintético */ ListenableFuture lambda$configAndClose$3(CaptureSession noOpSession, DeferrableSurface deferrableSurface, Void v) throws Exception {
        noOpSession.close();
        deferrableSurface.close();
        return noOpSession.release(false);
    }

    boolean isSessionCloseComplete() {
        return this.mReleasedCaptureSessions.isEmpty();
    }

    void finishClose() {
        Preconditions.checkState(this.mState == InternalState.RELEASING || this.mState == InternalState.CLOSING);
        Preconditions.checkState(this.mReleasedCaptureSessions.isEmpty());
        this.mCameraDevice = null;
        if (this.mState == InternalState.CLOSING) {
            setState(InternalState.INITIALIZED);
            return;
        }
        this.mCameraManager.unregisterAvailabilityCallback(this.mCameraAvailability);
        setState(InternalState.RELEASED);
        if (this.mUserReleaseNotifier != null) {
            this.mUserReleaseNotifier.set(null);
            this.mUserReleaseNotifier = null;
        }
    }

    void closeCamera(boolean abortInFlightCaptures) {
        Preconditions.checkState(this.mState == InternalState.CLOSING || this.mState == InternalState.RELEASING || (this.mState == InternalState.REOPENING && this.mCameraDeviceError != 0), "closeCamera should only be called in a CLOSING, RELEASING or REOPENING (with error) state. Current state: " + this.mState + " (error: " + getErrorMessage(this.mCameraDeviceError) + ")");
        resetCaptureSession(abortInFlightCaptures);
        this.mCaptureSession.cancelIssuedCaptureRequests();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public ListenableFuture<Void> release() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CameraImpl.this.m34x22c7252f(completer);
            }
        });
    }

    /* renomeado de: lambda$release$5$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ Object m34x22c7252f(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m33xf4ee8ad0(completer);
            }
        });
        return "Release[request=" + this.mReleaseRequestCount.getAndIncrement() + "]";
    }

    /* renomeado de: lambda$release$4$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m33xf4ee8ad0(CallbackToFutureAdapter.Completer completer) {
        Futures.propagate(releaseInternal(), completer);
    }

    private ListenableFuture<Void> releaseInternal() {
        ListenableFuture<Void> future = getOrCreateUserReleaseFuture();
        switch (this.mState.ordinal()) {
            case 1:
            case 5:
            case 6:
            case 7:
            case 8:
                if (!this.mStateCallback.cancelScheduledReopen() && !this.mErrorTimeoutReopenScheduler.isErrorHandling()) {
                    canFinish = false;
                }
                this.mErrorTimeoutReopenScheduler.cancel();
                setState(InternalState.RELEASING);
                if (canFinish) {
                    Preconditions.checkState(isSessionCloseComplete());
                    configAndCloseIfNeeded();
                }
                return future;
            case 2:
            case 3:
            case 4:
                canFinish = this.mCameraDevice == null;
                Preconditions.checkState(canFinish);
                setState(InternalState.RELEASING);
                Preconditions.checkState(isSessionCloseComplete());
                configAndCloseIfNeeded();
                return future;
            case 9:
            case 10:
                setState(InternalState.RELEASING);
                closeCamera(false);
                return future;
            default:
                debugLog("release() ignored due to being in state: " + this.mState);
                return future;
        }
    }

    private ListenableFuture<Void> getOrCreateUserReleaseFuture() {
        if (this.mUserReleaseFuture == null) {
            if (this.mState != InternalState.RELEASED) {
                this.mUserReleaseFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda5
                    @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                    public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                        return Camera2CameraImpl.this.m23x9e399b31(completer);
                    }
                });
            } else {
                this.mUserReleaseFuture = Futures.immediateFuture(null);
            }
        }
        return this.mUserReleaseFuture;
    }

    /* renomeado de: lambda$getOrCreateUserReleaseFuture$6$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ Object m23x9e399b31(CallbackToFutureAdapter.Completer completer) throws Exception {
        Preconditions.checkState(this.mUserReleaseNotifier == null, "Camera can only be released once, so release completer should be null on creation.");
        this.mUserReleaseNotifier = completer;
        return "Release[camera=" + this + "]";
    }

    ListenableFuture<Void> releaseSession(final CaptureSessionInterface captureSession, boolean abortInFlightCaptures) {
        captureSession.close();
        ListenableFuture<Void> releaseFuture = captureSession.release(abortInFlightCaptures);
        debugLog("Releasing session in state " + this.mState.name());
        this.mReleasedCaptureSessions.put(captureSession, releaseFuture);
        Futures.addCallback(releaseFuture, new FutureCallback<Void>() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl.3
            /* JADX WARN: não é possível corrigir a ordem dos casos do switch; parte do código será duplicada */
            /* JADX WARN: região duplicada removida para o bloco: B:10:0x002b  */
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public void onSuccess(java.lang.Void r3) {
                /*
                    r2 = this;
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    java.util.Map<androidx.camera.camera2.internal.CaptureSessionInterface, com.google.common.util.concurrent.ListenableFuture<java.lang.Void>> r0 = r0.mReleasedCaptureSessions
                    androidx.camera.camera2.internal.CaptureSessionInterface r1 = r2
                    r0.remove(r1)
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    androidx.camera.camera2.internal.Camera2CameraImpl$InternalState r0 = r0.mState
                    int r0 = r0.ordinal()
                    switch(r0) {
                        case 1: goto L23;
                        case 2: goto L14;
                        case 3: goto L14;
                        case 4: goto L14;
                        case 5: goto L23;
                        case 6: goto L1c;
                        case 7: goto L15;
                        default: goto L14;
                    }
                L14:
                    goto L44
                L15:
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    int r0 = r0.mCameraDeviceError
                    if (r0 != 0) goto L1c
                    goto L44
                L1c:
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    java.lang.String r1 = "Camera reopen required. Checking if the current camera can be closed safely."
                    r0.debugLog(r1)
                L23:
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    boolean r0 = r0.isSessionCloseComplete()
                    if (r0 == 0) goto L44
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    android.hardware.camera2.CameraDevice r0 = r0.mCameraDevice
                    if (r0 == 0) goto L44
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    java.lang.String r1 = "closing camera"
                    r0.debugLog(r1)
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    android.hardware.camera2.CameraDevice r0 = r0.mCameraDevice
                    androidx.camera.camera2.internal.compat.ApiCompat.Api21Impl.close(r0)
                    androidx.camera.camera2.internal.Camera2CameraImpl r0 = androidx.camera.camera2.internal.Camera2CameraImpl.this
                    r1 = 0
                    r0.mCameraDevice = r1
                L44:
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: androidx.camera.camera2.internal.Camera2CameraImpl.AnonymousClass3.onSuccess(java.lang.Void):void");
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
            }
        }, CameraXExecutors.directExecutor());
        return releaseFuture;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public Observable<CameraInternal.State> getCameraState() {
        return this.mObservableState;
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseActive(UseCase useCase) {
        Preconditions.checkNotNull(useCase);
        final String useCaseId = getUseCaseId(useCase);
        final SessionConfig sessionConfig = this.mIsPrimary ? useCase.getSessionConfig() : useCase.getSecondarySessionConfig();
        final UseCaseConfig<?> useCaseConfig = useCase.getCurrentConfig();
        final StreamSpec streamSpec = useCase.getAttachedStreamSpec();
        final List<UseCaseConfigFactory.CaptureType> captureTypes = getCaptureTypes(useCase);
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda22
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m29x4ba3b9b6(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
            }
        });
    }

    /* renomeado de: lambda$onUseCaseActive$7$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m29x4ba3b9b6(String useCaseId, SessionConfig sessionConfig, UseCaseConfig useCaseConfig, StreamSpec streamSpec, List captureTypes) {
        debugLog("Use case " + useCaseId + " ACTIVE");
        this.mUseCaseAttachState.setUseCaseActive(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
        this.mUseCaseAttachState.updateUseCase(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
        updateCaptureSessionConfig();
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseInactive(UseCase useCase) {
        Preconditions.checkNotNull(useCase);
        final String useCaseId = getUseCaseId(useCase);
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda21
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m30xe952d690(useCaseId);
            }
        });
    }

    /* renomeado de: lambda$onUseCaseInactive$8$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m30xe952d690(String useCaseId) {
        debugLog("Use case " + useCaseId + " INACTIVE");
        this.mUseCaseAttachState.setUseCaseInactive(useCaseId);
        updateCaptureSessionConfig();
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseUpdated(UseCase useCase) {
        Preconditions.checkNotNull(useCase);
        final String useCaseId = getUseCaseId(useCase);
        final SessionConfig sessionConfig = this.mIsPrimary ? useCase.getSessionConfig() : useCase.getSecondarySessionConfig();
        final UseCaseConfig<?> useCaseConfig = useCase.getCurrentConfig();
        final StreamSpec streamSpec = useCase.getAttachedStreamSpec();
        final List<UseCaseConfigFactory.CaptureType> captureTypes = getCaptureTypes(useCase);
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda20
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m31x44486635(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
            }
        });
    }

    /* renomeado de: lambda$onUseCaseUpdated$9$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m31x44486635(String useCaseId, SessionConfig sessionConfig, UseCaseConfig useCaseConfig, StreamSpec streamSpec, List captureTypes) {
        debugLog("Use case " + useCaseId + " UPDATED");
        this.mUseCaseAttachState.updateUseCase(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
        updateCaptureSessionConfig();
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseReset(UseCase useCase) {
        Preconditions.checkNotNull(useCase);
        SessionConfig sessionConfig = this.mIsPrimary ? useCase.getSessionConfig() : useCase.getSecondarySessionConfig();
        UseCaseConfig<?> useCaseConfig = useCase.getCurrentConfig();
        StreamSpec streamSpec = useCase.getAttachedStreamSpec();
        List<UseCaseConfigFactory.CaptureType> captureTypes = getCaptureTypes(useCase);
        resetUseCase(getUseCaseId(useCase), sessionConfig, useCaseConfig, streamSpec, captureTypes);
    }

    private void resetUseCase(final String useCaseId, final SessionConfig sessionConfig, final UseCaseConfig<?> useCaseConfig, final StreamSpec streamSpec, final List<UseCaseConfigFactory.CaptureType> captureTypes) {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m35xb3c15a2c(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
            }
        });
    }

    /* renomeado de: lambda$resetUseCase$10$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m35xb3c15a2c(String useCaseId, SessionConfig sessionConfig, UseCaseConfig useCaseConfig, StreamSpec streamSpec, List captureTypes) {
        debugLog("Use case " + useCaseId + " RESET");
        this.mUseCaseAttachState.updateUseCase(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
        addOrRemoveMeteringRepeatingUseCase();
        resetCaptureSession(false);
        updateCaptureSessionConfig();
        if (this.mState == InternalState.OPENED) {
            openCaptureSession();
        }
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    boolean isUseCaseAttached(UseCase useCase) {
        try {
            final String useCaseId = getUseCaseId(useCase);
            return ((Boolean) CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda4
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Camera2CameraImpl.this.m27xf78c78d9(useCaseId, completer);
                }
            }).get()).booleanValue();
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Unable to check if use case is attached.", e);
        }
    }

    /* renomeado de: lambda$isUseCaseAttached$12$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ Object m27xf78c78d9(final String useCaseId, final CallbackToFutureAdapter.Completer completer) throws Exception {
        try {
            this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CameraImpl.this.m26xc9b3de7a(completer, useCaseId);
                }
            });
            return "isUseCaseAttached";
        } catch (RejectedExecutionException e) {
            completer.setException(new RuntimeException("Unable to check if use case is attached. Camera executor shut down."));
            return "isUseCaseAttached";
        }
    }

    /* renomeado de: lambda$isUseCaseAttached$11$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m26xc9b3de7a(CallbackToFutureAdapter.Completer completer, String useCaseId) {
        completer.set(Boolean.valueOf(this.mUseCaseAttachState.isUseCaseAttached(useCaseId)));
    }

    private boolean isMeteringRepeatingDisabled() {
        return (this.mCameraXConfig == null || this.mCameraXConfig.isRepeatingStreamForced()) ? false : true;
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    boolean isMeteringRepeatingAttached() {
        try {
            return ((Boolean) CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda19
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Camera2CameraImpl.this.m25x3a89a76e(completer);
                }
            }).get()).booleanValue();
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Unable to check if MeteringRepeating is attached.", e);
        }
    }

    /* renomeado de: lambda$isMeteringRepeatingAttached$14$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ Object m25x3a89a76e(final CallbackToFutureAdapter.Completer completer) throws Exception {
        try {
            this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda14
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CameraImpl.this.m24xcb10d0f(completer);
                }
            });
            return "isMeteringRepeatingAttached";
        } catch (RejectedExecutionException e) {
            completer.setException(new RuntimeException("Unable to check if MeteringRepeating is attached. Camera executor shut down."));
            return "isMeteringRepeatingAttached";
        }
    }

    /* renomeado de: lambda$isMeteringRepeatingAttached$13$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m24xcb10d0f(CallbackToFutureAdapter.Completer completer) {
        completer.set(Boolean.valueOf(isMeteringRepeatingAttachedInternal()));
    }

    private boolean isMeteringRepeatingAttachedInternal() {
        if (this.mMeteringRepeatingSession == null) {
            return false;
        }
        String id = getMeteringRepeatingId(this.mMeteringRepeatingSession);
        return this.mUseCaseAttachState.isUseCaseAttached(id);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void attachUseCases(Collection<UseCase> inputUseCases) {
        Collection<UseCase> useCases = new ArrayList<>(inputUseCases);
        if (useCases.isEmpty()) {
            return;
        }
        this.mCameraControlInternal.incrementUseCount();
        notifySessionStartedAndCameraControlReady(new ArrayList(useCases));
        final List<UseCaseInfo> useCaseInfos = new ArrayList<>(toUseCaseInfos(useCases));
        try {
            this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda18
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CameraImpl.this.m20x1cf87860(useCaseInfos);
                }
            });
        } catch (RejectedExecutionException e) {
            debugLog("Unable to attach use cases.", e);
            this.mCameraControlInternal.decrementUseCount();
        }
    }

    /* renomeado de: lambda$attachUseCases$15$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m20x1cf87860(List useCaseInfos) {
        try {
            tryAttachUseCases(useCaseInfos);
        } finally {
            this.mCameraControlInternal.decrementUseCount();
        }
    }

    private void tryAttachUseCases(Collection<UseCaseInfo> useCaseInfos) {
        Size resolution;
        boolean attachUseCaseFromEmpty = this.mUseCaseAttachState.getAttachedSessionConfigs().isEmpty();
        List<String> useCaseIdsToAttach = new ArrayList<>();
        Rational previewAspectRatio = null;
        for (UseCaseInfo useCaseInfo : useCaseInfos) {
            if (!this.mUseCaseAttachState.isUseCaseAttached(useCaseInfo.getUseCaseId())) {
                this.mUseCaseAttachState.setUseCaseAttached(useCaseInfo.getUseCaseId(), useCaseInfo.getSessionConfig(), useCaseInfo.getUseCaseConfig(), useCaseInfo.getStreamSpec(), useCaseInfo.getCaptureTypes());
                useCaseIdsToAttach.add(useCaseInfo.getUseCaseId());
                if (useCaseInfo.getUseCaseType() == Preview.class && (resolution = useCaseInfo.getSurfaceResolution()) != null) {
                    previewAspectRatio = new Rational(resolution.getWidth(), resolution.getHeight());
                }
            }
        }
        if (useCaseIdsToAttach.isEmpty()) {
            return;
        }
        debugLog("Use cases [" + TextUtils.join(", ", useCaseIdsToAttach) + "] now ATTACHED");
        if (attachUseCaseFromEmpty) {
            this.mCameraControlInternal.setActive(true);
            this.mCameraControlInternal.incrementUseCount();
        }
        addOrRemoveMeteringRepeatingUseCase();
        updateZslDisabledByUseCaseConfigStatus();
        updateLowLightBoostDisabledByUseCaseSessionConfigStatus();
        updateCaptureSessionConfig();
        resetCaptureSession(false);
        if (this.mState == InternalState.OPENED) {
            openCaptureSession();
        } else {
            openInternal();
        }
        if (previewAspectRatio != null) {
            this.mCameraControlInternal.setPreviewAspectRatio(previewAspectRatio);
        }
    }

    private Collection<UseCaseInfo> toUseCaseInfos(Collection<UseCase> useCases) {
        List<UseCaseInfo> useCaseInfos = new ArrayList<>();
        for (UseCase useCase : useCases) {
            useCaseInfos.add(UseCaseInfo.from(useCase, this.mIsPrimary));
        }
        return useCaseInfos;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void setExtendedConfig(CameraConfig cameraConfig) {
        CameraConfig cameraConfig2 = cameraConfig != null ? cameraConfig : CameraConfigs.defaultConfig();
        SessionProcessor sessionProcessor = cameraConfig2.getSessionProcessor(null);
        this.mCameraConfig = cameraConfig2;
        synchronized (this.mLock) {
            this.mSessionProcessor = sessionProcessor;
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void onRemoved() {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda13
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m28xc305d545();
            }
        });
    }

    /* renomeado de: lambda$onRemoved$16$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m28xc305d545() {
        debugLog("Camera is removed. Updating state and cleaning up.");
        if (this.mState == InternalState.RELEASING || this.mState == InternalState.RELEASED) {
            return;
        }
        CameraState.StateError error = CameraState.StateError.create(8);
        this.mCameraStateMachine.updateState(CameraInternal.State.CLOSED, error);
        setState(InternalState.RELEASING, error);
        this.mStateCallback.cancelScheduledReopen();
        this.mErrorTimeoutReopenScheduler.cancel();
        if (this.mCameraDevice != null) {
            closeCamera(false);
        } else {
            finishClose();
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public CameraConfig getExtendedConfig() {
        return this.mCameraConfig;
    }

    private void notifySessionStartedAndCameraControlReady(List<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            String useCaseId = getUseCaseId(useCase);
            if (!this.mSessionStartNotifiedUseCases.contains(useCaseId)) {
                this.mSessionStartNotifiedUseCases.add(useCaseId);
                useCase.onSessionStart();
                useCase.onCameraControlReady();
            }
        }
    }

    private void notifySessionStoppedToUseCases(List<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            String useCaseId = getUseCaseId(useCase);
            if (this.mSessionStartNotifiedUseCases.contains(useCaseId)) {
                useCase.onSessionStop();
                this.mSessionStartNotifiedUseCases.remove(useCaseId);
            }
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void detachUseCases(Collection<UseCase> inputUseCases) {
        Collection<UseCase> useCases = new ArrayList<>(inputUseCases);
        if (useCases.isEmpty()) {
            return;
        }
        final List<UseCaseInfo> useCaseInfos = new ArrayList<>(toUseCaseInfos(useCases));
        notifySessionStoppedToUseCases(new ArrayList(useCases));
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m22x6d9d61ec(useCaseInfos);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* renomeado de: tryDetachUseCases, motivo: mesclado com método bridge [métodos inline] */
    public void m22x6d9d61ec(Collection<UseCaseInfo> useCaseInfos) {
        List<String> useCaseIdsToDetach = new ArrayList<>();
        boolean clearPreviewAspectRatio = false;
        for (UseCaseInfo useCaseInfo : useCaseInfos) {
            if (this.mUseCaseAttachState.isUseCaseAttached(useCaseInfo.getUseCaseId())) {
                this.mUseCaseAttachState.removeUseCase(useCaseInfo.getUseCaseId());
                useCaseIdsToDetach.add(useCaseInfo.getUseCaseId());
                if (useCaseInfo.getUseCaseType() == Preview.class) {
                    clearPreviewAspectRatio = true;
                }
            }
        }
        if (useCaseIdsToDetach.isEmpty()) {
            return;
        }
        debugLog("Use cases [" + TextUtils.join(", ", useCaseIdsToDetach) + "] now DETACHED for camera");
        if (clearPreviewAspectRatio) {
            this.mCameraControlInternal.setPreviewAspectRatio(null);
        }
        addOrRemoveMeteringRepeatingUseCase();
        if (this.mUseCaseAttachState.getAttachedUseCaseConfigs().isEmpty()) {
            this.mCameraControlInternal.setZslDisabledByUserCaseConfig(false);
            this.mCameraControlInternal.setLowLightBoostDisabledByUseCaseSessionConfig(false);
        } else {
            updateZslDisabledByUseCaseConfigStatus();
            updateLowLightBoostDisabledByUseCaseSessionConfigStatus();
        }
        boolean allUseCasesDetached = this.mUseCaseAttachState.getAttachedSessionConfigs().isEmpty();
        if (allUseCasesDetached) {
            this.mCameraControlInternal.decrementUseCount();
            resetCaptureSession(false);
            this.mCameraControlInternal.setActive(false);
            this.mCaptureSession = newCaptureSession();
            closeInternal();
            return;
        }
        updateCaptureSessionConfig();
        resetCaptureSession(false);
        if (this.mState == InternalState.OPENED) {
            openCaptureSession();
        }
    }

    private void updateZslDisabledByUseCaseConfigStatus() {
        boolean isZslDisabledByUseCaseConfig = false;
        for (UseCaseConfig<?> useCaseConfig : this.mUseCaseAttachState.getAttachedUseCaseConfigs()) {
            isZslDisabledByUseCaseConfig |= useCaseConfig.isZslDisabled(false);
        }
        this.mCameraControlInternal.setZslDisabledByUserCaseConfig(isZslDisabledByUseCaseConfig);
    }

    private void updateLowLightBoostDisabledByUseCaseSessionConfigStatus() {
        if (!this.mCameraInfoInternal.isLowLightBoostSupported()) {
            return;
        }
        SessionConfig.ValidatingBuilder validatingBuilder = this.mUseCaseAttachState.getActiveAndAttachedBuilder();
        if (validatingBuilder.isValid()) {
            SessionConfig useCaseSessionConfig = validatingBuilder.build();
            if (useCaseSessionConfig.getExpectedFrameRateRange().getUpper().intValue() > 30) {
                this.mCameraControlInternal.setLowLightBoostDisabledByUseCaseSessionConfig(true);
            } else {
                this.mCameraControlInternal.setLowLightBoostDisabledByUseCaseSessionConfig(false);
            }
        }
    }

    private void addOrRemoveMeteringRepeatingUseCase() {
        SessionConfig sessionConfig = this.mUseCaseAttachState.getAttachedBuilder().build();
        int repeatingSurfaceCount = sessionConfig.getRepeatingCaptureConfig().getSurfaces().size();
        int allSurfaceCount = sessionConfig.getSurfaces().size();
        boolean isRepeatingRequestAvailable = true;
        if (isMeteringRepeatingAttachedInternal()) {
            shouldRemoveMeteringRepeating = repeatingSurfaceCount != 1 || allSurfaceCount == 1;
            if (shouldRemoveMeteringRepeating || isMeteringRepeatingRestricted(this.mMeteringRepeatingSession)) {
                removeMeteringRepeating();
                if (!shouldRemoveMeteringRepeating) {
                    isRepeatingRequestAvailable = false;
                }
            }
        } else {
            if (repeatingSurfaceCount == 0 && allSurfaceCount > 0) {
                shouldRemoveMeteringRepeating = true;
            }
            if (shouldRemoveMeteringRepeating) {
                if (this.mMeteringRepeatingSession == null) {
                    this.mMeteringRepeatingSession = new MeteringRepeatingSession(this.mCameraInfoInternal.getCameraCharacteristicsCompat(), this.mDisplayInfoManager, new MeteringRepeatingSession.SurfaceResetCallback() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda3
                        @Override // androidx.camera.camera2.internal.MeteringRepeatingSession.SurfaceResetCallback
                        public final void onSurfaceReset() {
                            Camera2CameraImpl.this.m19xbbe0ffb3();
                        }
                    });
                }
                if (isMeteringRepeatingRestricted(this.mMeteringRepeatingSession)) {
                    isRepeatingRequestAvailable = false;
                } else {
                    addMeteringRepeating();
                }
            }
        }
        this.mCameraControlInternal.setIsRepeatingRequestAvailable(isRepeatingRequestAvailable);
        if (!isRepeatingRequestAvailable) {
            Logger.e(TAG, "The repeating surface is missing, CameraControl and ImageCapture may encounter issues due to the absence of repeating surface. Please add a UseCase (Preview or ImageAnalysis) that can provide a repeating surface for CameraControl and ImageCapture to function properly.");
        }
    }

    /* renomeado de: lambda$addOrRemoveMeteringRepeatingUseCase$18$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m19xbbe0ffb3() {
        if (!isMeteringRepeatingAttached()) {
            return;
        }
        SessionConfig sessionConfigMeteringRepeating = this.mMeteringRepeatingSession.getSessionConfig();
        UseCaseConfig<?> useCaseConfig = this.mMeteringRepeatingSession.getUseCaseConfig();
        resetUseCase(getMeteringRepeatingId(this.mMeteringRepeatingSession), sessionConfigMeteringRepeating, useCaseConfig, null, Collections.singletonList(UseCaseConfigFactory.CaptureType.METERING_REPEATING));
    }

    private boolean isSurfaceCombinationWithMeteringRepeatingSupported(MeteringRepeatingSession meteringRepeatingSession) {
        List<AttachedSurfaceInfo> attachedSurfaces = new ArrayList<>();
        int cameraMode = getCameraMode();
        for (UseCaseAttachState.UseCaseAttachInfo useCaseInfo : this.mUseCaseAttachState.getAttachedUseCaseInfo()) {
            if (useCaseInfo.getCaptureTypes() == null || useCaseInfo.getCaptureTypes().get(0) != UseCaseConfigFactory.CaptureType.METERING_REPEATING) {
                if (useCaseInfo.getStreamSpec() == null || useCaseInfo.getCaptureTypes() == null) {
                    Logger.w(TAG, "Invalid stream spec or capture types in " + useCaseInfo);
                    return false;
                }
                SessionConfig sessionConfig = useCaseInfo.getSessionConfig();
                UseCaseConfig<?> useCaseConfig = useCaseInfo.getUseCaseConfig();
                for (DeferrableSurface surface : sessionConfig.getSurfaces()) {
                    SurfaceConfig surfaceConfig = this.mSupportedSurfaceCombination.transformSurfaceConfig(cameraMode, useCaseConfig.getInputFormat(), surface.getPrescribedSize(), useCaseConfig.getStreamUseCase());
                    AttachedSurfaceInfo attachedSurfaceInfo = AttachedSurfaceInfo.create(surfaceConfig, useCaseConfig.getInputFormat(), surface.getPrescribedSize(), useCaseInfo.getStreamSpec().getDynamicRange(), useCaseInfo.getCaptureTypes(), useCaseInfo.getStreamSpec().getImplementationOptions(), useCaseInfo.getStreamSpec().getSessionType(), useCaseInfo.getStreamSpec().getExpectedFrameRateRange(), useCaseConfig.isStrictFrameRateRequired());
                    attachedSurfaces.add(attachedSurfaceInfo);
                }
            }
        }
        Preconditions.checkNotNull(meteringRepeatingSession);
        Map<UseCaseConfig<?>, List<Size>> useCaseConfigToSizeMap = new HashMap<>();
        useCaseConfigToSizeMap.put(meteringRepeatingSession.getUseCaseConfig(), Collections.singletonList(meteringRepeatingSession.getMeteringRepeatingSize()));
        try {
            this.mSupportedSurfaceCombination.getSuggestedStreamSpecifications(cameraMode, attachedSurfaces, useCaseConfigToSizeMap, false, false, false, false);
            debugLog("Surface combination with metering repeating supported!");
            return true;
        } catch (IllegalArgumentException e) {
            debugLog("Surface combination with metering repeating  not supported!", e);
            return false;
        }
    }

    private boolean isMeteringRepeatingRestricted(MeteringRepeatingSession meteringRepeatingSession) {
        Preconditions.checkNotNull(meteringRepeatingSession);
        return !isSurfaceCombinationWithMeteringRepeatingSupported(meteringRepeatingSession) || isMeteringRepeatingDisabled();
    }

    private int getCameraMode() {
        synchronized (this.mLock) {
            return this.mCameraCoordinator.getCameraOperatingMode() == 2 ? 1 : 0;
        }
    }

    private void removeMeteringRepeating() {
        if (this.mMeteringRepeatingSession != null) {
            this.mUseCaseAttachState.setUseCaseDetached(this.mMeteringRepeatingSession.getName() + this.mMeteringRepeatingSession.hashCode());
            this.mUseCaseAttachState.setUseCaseInactive(this.mMeteringRepeatingSession.getName() + this.mMeteringRepeatingSession.hashCode());
            this.mMeteringRepeatingSession.clear();
            this.mMeteringRepeatingSession = null;
        }
    }

    private void addMeteringRepeating() {
        if (this.mMeteringRepeatingSession != null) {
            String id = getMeteringRepeatingId(this.mMeteringRepeatingSession);
            this.mUseCaseAttachState.setUseCaseAttached(id, this.mMeteringRepeatingSession.getSessionConfig(), this.mMeteringRepeatingSession.getUseCaseConfig(), null, Collections.singletonList(UseCaseConfigFactory.CaptureType.METERING_REPEATING));
            this.mUseCaseAttachState.setUseCaseActive(id, this.mMeteringRepeatingSession.getSessionConfig(), this.mMeteringRepeatingSession.getUseCaseConfig(), null, Collections.singletonList(UseCaseConfigFactory.CaptureType.METERING_REPEATING));
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraInfoInternal getCameraInfoInternal() {
        return this.mCameraInfoInternal;
    }

    public CameraAvailability getCameraAvailability() {
        return this.mCameraAvailability;
    }

    void tryForceOpenCameraDevice(boolean fromScheduledCameraReopen) {
        debugLog("Attempting to force open the camera.");
        boolean shouldTryOpenCamera = this.mCameraStateRegistry.tryOpenCamera(this);
        if (!shouldTryOpenCamera) {
            debugLog("No cameras available. Waiting for available camera before opening camera.");
            setState(InternalState.PENDING_OPEN);
        } else {
            openCameraDevice(fromScheduledCameraReopen);
        }
    }

    void tryOpenCameraDevice(boolean fromScheduledCameraReopen) {
        debugLog("Attempting to open the camera.");
        boolean shouldTryOpenCamera = this.mCameraAvailability.isCameraAvailable() && this.mCameraStateRegistry.tryOpenCamera(this);
        if (!shouldTryOpenCamera) {
            debugLog("No cameras available. Waiting for available camera before opening camera.");
            setState(InternalState.PENDING_OPEN);
        } else {
            openCameraDevice(fromScheduledCameraReopen);
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void setPrimary(boolean isPrimary) {
        this.mIsPrimary = isPrimary;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void setActiveResumingMode(final boolean enabled) {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m36xb12e0bf6(enabled);
            }
        });
    }

    /* renomeado de: lambda$setActiveResumingMode$19$androidx-camera-camera2-internal-Camera2CameraImpl, motivo: nome Java inválido */
    /* sintético */ void m36xb12e0bf6(boolean enabled) {
        this.mIsActiveResumingMode = enabled;
        if (enabled) {
            if (this.mState == InternalState.PENDING_OPEN || this.mState == InternalState.OPENING_WITH_ERROR) {
                tryForceOpenCameraDevice(false);
            }
        }
    }

    private void openCameraDevice(boolean fromScheduledCameraReopen) {
        if (!fromScheduledCameraReopen) {
            this.mStateCallback.resetReopenMonitor();
        }
        this.mStateCallback.cancelScheduledReopen();
        this.mErrorTimeoutReopenScheduler.cancel();
        debugLog("Opening camera.");
        setState(InternalState.OPENING);
        try {
            this.mCameraManager.openCamera(this.mCameraInfoInternal.getCameraId(), this.mExecutor, createDeviceStateCallback());
        } catch (CameraAccessExceptionCompat e) {
            debugLog("Unable to open camera due to " + e.getMessage());
            switch (e.getReason()) {
                case CameraAccessExceptionCompat.CAMERA_UNAVAILABLE_DO_NOT_DISTURB /* 10001 */:
                    setState(InternalState.INITIALIZED, CameraState.StateError.create(7, e));
                    break;
                default:
                    this.mErrorTimeoutReopenScheduler.start();
                    break;
            }
        } catch (SecurityException e2) {
            debugLog("Unable to open camera due to " + e2.getMessage());
            setState(InternalState.REOPENING);
            this.mStateCallback.scheduleCameraReopen();
        } catch (RuntimeException e3) {
            debugLog("Unexpected error occurred when opening camera.", e3);
            setState(InternalState.OPENING_WITH_ERROR, CameraState.StateError.create(6));
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    class ErrorTimeoutReopenScheduler {
        private static final long ERROR_TIMEOUT_MILLIS = 2000;
        private ScheduleNode mScheduleNode;

        private ErrorTimeoutReopenScheduler() {
            this.mScheduleNode = null;
        }

        public void start() {
            if (Camera2CameraImpl.this.mState != InternalState.OPENING) {
                Camera2CameraImpl.this.debugLog("Don't need the onError timeout handler.");
                return;
            }
            Camera2CameraImpl.this.debugLog("Camera waiting for onError.");
            cancel();
            this.mScheduleNode = new ScheduleNode();
        }

        public boolean isErrorHandling() {
            return (this.mScheduleNode == null || this.mScheduleNode.isDone()) ? false : true;
        }

        public void deviceOnError() {
            Camera2CameraImpl.this.debugLog("Camera receive onErrorCallback");
            cancel();
        }

        public void cancel() {
            if (this.mScheduleNode != null) {
                this.mScheduleNode.cancel();
            }
            this.mScheduleNode = null;
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        class ScheduleNode {
            private final AtomicBoolean mIsDone = new AtomicBoolean(false);
            private final ScheduledFuture<?> mScheduledFuture;

            ScheduleNode() {
                this.mScheduledFuture = Camera2CameraImpl.this.mScheduledExecutorService.schedule(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$ErrorTimeoutReopenScheduler$ScheduleNode$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        Camera2CameraImpl.ErrorTimeoutReopenScheduler.ScheduleNode.this.execute();
                    }
                }, ErrorTimeoutReopenScheduler.ERROR_TIMEOUT_MILLIS, TimeUnit.MILLISECONDS);
            }

            /* JADX INFO: modificadores de acesso alterados de: private */
            public void execute() {
                if (!this.mIsDone.getAndSet(true)) {
                    Camera2CameraImpl.this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$ErrorTimeoutReopenScheduler$ScheduleNode$$ExternalSyntheticLambda1
                        @Override // java.lang.Runnable
                        public final void run() {
                            Camera2CameraImpl.ErrorTimeoutReopenScheduler.ScheduleNode.this.executeInternal();
                        }
                    });
                }
            }

            /* JADX INFO: modificadores de acesso alterados de: private */
            public void executeInternal() {
                if (Camera2CameraImpl.this.mState != InternalState.OPENING) {
                    Camera2CameraImpl.this.debugLog("Camera skip reopen at state: " + Camera2CameraImpl.this.mState);
                    return;
                }
                Camera2CameraImpl.this.debugLog("Camera onError timeout, reopen it.");
                Camera2CameraImpl.this.setState(InternalState.REOPENING);
                Camera2CameraImpl.this.mStateCallback.scheduleCameraReopen();
            }

            public void cancel() {
                this.mIsDone.set(true);
                this.mScheduledFuture.cancel(true);
            }

            public boolean isDone() {
                return this.mIsDone.get();
            }
        }
    }

    void updateCaptureSessionConfig() {
        SessionConfig.ValidatingBuilder validatingBuilder = this.mUseCaseAttachState.getActiveAndAttachedBuilder();
        if (validatingBuilder.isValid()) {
            SessionConfig useCaseSessionConfig = validatingBuilder.build();
            this.mCameraControlInternal.setTemplate(useCaseSessionConfig.getTemplateType());
            validatingBuilder.add(this.mCameraControlInternal.getSessionConfig());
            SessionConfig sessionConfig = validatingBuilder.build();
            this.mCaptureSession.setSessionConfig(sessionConfig);
            return;
        }
        this.mCameraControlInternal.resetTemplate();
        this.mCaptureSession.setSessionConfig(this.mCameraControlInternal.getSessionConfig());
    }

    void openCaptureSession() {
        Preconditions.checkState(this.mState == InternalState.OPENED);
        SessionConfig.ValidatingBuilder validatingBuilder = this.mUseCaseAttachState.getAttachedBuilder();
        if (!validatingBuilder.isValid()) {
            debugLog("Unable to create capture session due to conflicting configurations");
            return;
        }
        if (!this.mCameraStateRegistry.tryOpenCaptureSession(this.mCameraDevice.getId(), this.mCameraCoordinator.getPairedConcurrentCameraId(this.mCameraDevice.getId()))) {
            debugLog("Unable to create capture session in camera operating mode = " + this.mCameraCoordinator.getCameraOperatingMode());
            return;
        }
        Map<DeferrableSurface, Long> streamUseCaseMap = new HashMap<>();
        StreamUseCaseUtil.populateSurfaceToStreamUseCaseMapping(this.mUseCaseAttachState.getAttachedSessionConfigs(), this.mUseCaseAttachState.getAttachedUseCaseConfigs(), streamUseCaseMap);
        this.mCaptureSession.setStreamUseCaseMap(streamUseCaseMap);
        final CaptureSessionInterface captureSession = this.mCaptureSession;
        ListenableFuture<Void> openCaptureSession = captureSession.open(validatingBuilder.build(), (CameraDevice) Preconditions.checkNotNull(this.mCameraDevice), this.mCaptureSessionOpenerBuilder.build());
        Futures.addCallback(openCaptureSession, new FutureCallback<Void>() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl.4
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                if (Camera2CameraImpl.this.mCameraCoordinator.getCameraOperatingMode() == 2 && Camera2CameraImpl.this.mState == InternalState.OPENED) {
                    Camera2CameraImpl.this.setState(InternalState.CONFIGURED);
                }
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                if (t instanceof DeferrableSurface.SurfaceClosedException) {
                    SessionConfig sessionConfig = Camera2CameraImpl.this.findSessionConfigForSurface(((DeferrableSurface.SurfaceClosedException) t).getDeferrableSurface());
                    if (sessionConfig != null) {
                        Camera2CameraImpl.this.postSurfaceClosedError(sessionConfig);
                        return;
                    }
                    return;
                }
                if (t instanceof CancellationException) {
                    Camera2CameraImpl.this.debugLog("Unable to configure camera cancelled");
                    return;
                }
                if (Camera2CameraImpl.this.mState == InternalState.OPENED) {
                    Camera2CameraImpl.this.setState(InternalState.OPENED, CameraState.StateError.create(4, t));
                }
                Logger.e(Camera2CameraImpl.TAG, "Unable to configure camera " + Camera2CameraImpl.this, t);
                if (Camera2CameraImpl.this.mCaptureSession == captureSession) {
                    Camera2CameraImpl.this.resetCaptureSession(false);
                }
            }
        }, this.mExecutor);
    }

    SessionConfig findSessionConfigForSurface(DeferrableSurface surface) {
        for (SessionConfig sessionConfig : this.mUseCaseAttachState.getAttachedSessionConfigs()) {
            if (sessionConfig.getSurfaces().contains(surface)) {
                return sessionConfig;
            }
        }
        return null;
    }

    void postSurfaceClosedError(final SessionConfig sessionConfig) {
        Executor executor = CameraXExecutors.mainThreadExecutor();
        final SessionConfig.ErrorListener errorListener = sessionConfig.getErrorListener();
        if (errorListener != null) {
            debugLog("Posting surface closed", new Throwable());
            executor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    SessionConfig.ErrorListener.this.onError(sessionConfig, SessionConfig.SessionError.SESSION_ERROR_SURFACE_NEEDS_RESET);
                }
            });
        }
    }

    void resetCaptureSession(boolean abortInFlightCaptures) {
        Preconditions.checkState(this.mCaptureSession != null);
        debugLog("Resetting Capture Session");
        CaptureSessionInterface oldCaptureSession = this.mCaptureSession;
        SessionConfig previousSessionConfig = oldCaptureSession.getSessionConfig();
        List<CaptureConfig> unissuedCaptureConfigs = oldCaptureSession.getCaptureConfigs();
        this.mCaptureSession = newCaptureSession();
        this.mCaptureSession.setSessionConfig(previousSessionConfig);
        this.mCaptureSession.issueCaptureRequests(unissuedCaptureConfigs);
        switch (this.mState.ordinal()) {
            case 9:
                if (this.mShouldCloseCameraBeforeCreateNewSession && oldCaptureSession.isInOpenState()) {
                    debugLog("Close camera before creating new session");
                    setState(InternalState.REOPENING_QUIRK);
                    break;
                }
                break;
            default:
                debugLog("Skipping Capture Session state check due to current camera state: " + this.mState + " and previous session status: " + oldCaptureSession.isInOpenState());
                break;
        }
        if (this.mConfigAndCloseQuirk && oldCaptureSession.isInOpenState()) {
            debugLog("ConfigAndClose is required when close the camera.");
            this.mIsConfigAndCloseRequired = true;
        }
        releaseSession(oldCaptureSession, abortInFlightCaptures);
    }

    private CameraDevice.StateCallback createDeviceStateCallback() {
        SessionConfig config = this.mUseCaseAttachState.getAttachedBuilder().build();
        List<CameraDevice.StateCallback> configuredStateCallbacks = config.getDeviceStateCallbacks();
        List<CameraDevice.StateCallback> allStateCallbacks = new ArrayList<>(configuredStateCallbacks);
        allStateCallbacks.add(this.mCaptureSessionRepository.getCameraStateCallback());
        allStateCallbacks.add(this.mStateCallback);
        return CameraDeviceStateCallbacks.createComboCallback(allStateCallbacks);
    }

    private boolean checkAndAttachRepeatingSurface(CaptureConfig.Builder captureConfigBuilder) {
        if (!captureConfigBuilder.getSurfaces().isEmpty()) {
            Logger.w(TAG, "The capture config builder already has surface inside.");
            return false;
        }
        for (SessionConfig sessionConfig : this.mUseCaseAttachState.getActiveAndAttachedSessionConfigs()) {
            CaptureConfig repeatingCaptureConfig = sessionConfig.getRepeatingCaptureConfig();
            List<DeferrableSurface> surfaces = repeatingCaptureConfig.getSurfaces();
            if (!surfaces.isEmpty()) {
                if (repeatingCaptureConfig.getPreviewStabilizationMode() != 0) {
                    captureConfigBuilder.setPreviewStabilization(repeatingCaptureConfig.getPreviewStabilizationMode());
                }
                if (repeatingCaptureConfig.getVideoStabilizationMode() != 0) {
                    captureConfigBuilder.setVideoStabilization(repeatingCaptureConfig.getVideoStabilizationMode());
                }
                for (DeferrableSurface surface : surfaces) {
                    captureConfigBuilder.addSurface(surface);
                }
            }
        }
        if (captureConfigBuilder.getSurfaces().isEmpty()) {
            Logger.w(TAG, "Unable to find a repeating surface to attach to CaptureConfig");
            return false;
        }
        return true;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraControlInternal getCameraControlInternal() {
        return this.mCameraControlInternal;
    }

    void submitCaptureRequests(List<CaptureConfig> captureConfigs) {
        List<CaptureConfig> captureConfigsWithSurface = new ArrayList<>();
        for (CaptureConfig captureConfig : captureConfigs) {
            CaptureConfig.Builder builder = CaptureConfig.Builder.from(captureConfig);
            if (captureConfig.getTemplateType() == 5 && captureConfig.getCameraCaptureResult() != null) {
                builder.setCameraCaptureResult(captureConfig.getCameraCaptureResult());
            }
            if (!captureConfig.getSurfaces().isEmpty() || !captureConfig.isUseRepeatingSurface() || checkAndAttachRepeatingSurface(builder)) {
                captureConfigsWithSurface.add(builder.build());
            }
        }
        debugLog("Issue capture request");
        this.mCaptureSession.issueCaptureRequests(captureConfigsWithSurface);
    }

    public String toString() {
        return String.format(Locale.US, "Camera@%x[id=%s]", Integer.valueOf(hashCode()), this.mCameraInfoInternal.getCameraId());
    }

    static String getUseCaseId(UseCase useCase) {
        return useCase.getName() + useCase.hashCode();
    }

    static List<UseCaseConfigFactory.CaptureType> getCaptureTypes(UseCase useCase) {
        if (useCase.getCamera() == null) {
            return null;
        }
        return StreamSharing.getCaptureTypes(useCase);
    }

    static String getMeteringRepeatingId(MeteringRepeatingSession meteringRepeating) {
        return meteringRepeating.getName() + meteringRepeating.hashCode();
    }

    void debugLog(String msg) {
        debugLog(msg, null);
    }

    private void debugLog(String msg, Throwable throwable) {
        String msgString = String.format("{%s} %s", toString(), msg);
        Logger.d(TAG, msgString, throwable);
    }

    void setState(InternalState state) {
        setState(state, null);
    }

    void setState(InternalState state, CameraState.StateError stateError) {
        setState(state, stateError, true);
    }

    void setState(InternalState state, CameraState.StateError stateError, boolean notifyImmediately) {
        CameraInternal.State publicState;
        debugLog("Transitioning camera internal state: " + this.mState + " --> " + state);
        traceInternalState(state, stateError);
        this.mState = state;
        switch (state) {
            case RELEASED:
                publicState = CameraInternal.State.RELEASED;
                break;
            case RELEASING:
                publicState = CameraInternal.State.RELEASING;
                break;
            case INITIALIZED:
                publicState = CameraInternal.State.CLOSED;
                break;
            case PENDING_OPEN:
                publicState = CameraInternal.State.PENDING_OPEN;
                break;
            case OPENING_WITH_ERROR:
            case CLOSING:
            case REOPENING_QUIRK:
                publicState = CameraInternal.State.CLOSING;
                break;
            case REOPENING:
            case OPENING:
                publicState = CameraInternal.State.OPENING;
                break;
            case OPENED:
                publicState = CameraInternal.State.OPEN;
                break;
            case CONFIGURED:
                publicState = CameraInternal.State.CONFIGURED;
                break;
            default:
                throw new IllegalStateException("Unknown state: " + state);
        }
        this.mCameraStateRegistry.markCameraState(this, publicState, notifyImmediately);
        this.mObservableState.postValue(publicState);
        this.mCameraStateMachine.updateState(publicState, stateError);
    }

    void traceInternalState(InternalState state, CameraState.StateError stateError) {
        if (Trace.isEnabled()) {
            String counterName = "CX:C2State[" + this + "]";
            Trace.setCounter(counterName, state.ordinal());
            if (stateError != null) {
                this.mTraceStateErrorCount++;
            }
            if (this.mTraceStateErrorCount > 0) {
                String errorCounterName = "CX:C2StateErrorCode[" + this + "]";
                int errorCode = stateError != null ? stateError.getCode() : 0;
                Trace.setCounter(errorCounterName, errorCode);
            }
        }
    }

    static String getErrorMessage(int errorCode) {
        switch (errorCode) {
            case 0:
                return "ERROR_NONE";
            case 1:
                return "ERROR_CAMERA_IN_USE";
            case 2:
                return "ERROR_MAX_CAMERAS_IN_USE";
            case 3:
                return "ERROR_CAMERA_DISABLED";
            case 4:
                return "ERROR_CAMERA_DEVICE";
            case 5:
                return "ERROR_CAMERA_SERVICE";
            default:
                return "UNKNOWN ERROR";
        }
    }

    static abstract class UseCaseInfo {
        abstract List<UseCaseConfigFactory.CaptureType> getCaptureTypes();

        abstract SessionConfig getSessionConfig();

        abstract StreamSpec getStreamSpec();

        abstract Size getSurfaceResolution();

        abstract UseCaseConfig<?> getUseCaseConfig();

        abstract String getUseCaseId();

        abstract Class<?> getUseCaseType();

        UseCaseInfo() {
        }

        static UseCaseInfo create(String useCaseId, Class<?> useCaseType, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, Size surfaceResolution, StreamSpec streamSpec, List<UseCaseConfigFactory.CaptureType> captureTypes) {
            return new AutoValue_Camera2CameraImpl_UseCaseInfo(useCaseId, useCaseType, sessionConfig, useCaseConfig, surfaceResolution, streamSpec, captureTypes);
        }

        static UseCaseInfo from(UseCase useCase, boolean isPrimary) {
            return create(Camera2CameraImpl.getUseCaseId(useCase), useCase.getClass(), isPrimary ? useCase.getSessionConfig() : useCase.getSecondarySessionConfig(), useCase.getCurrentConfig(), useCase.getAttachedSurfaceResolution(), useCase.getAttachedStreamSpec(), Camera2CameraImpl.getCaptureTypes(useCase));
        }
    }

    final class StateCallback extends CameraDevice.StateCallback {
        private final CameraReopenMonitor mCameraReopenMonitor;
        private final Executor mExecutor;
        ScheduledFuture<?> mScheduledReopenHandle;
        private ScheduledReopen mScheduledReopenRunnable;
        private final ScheduledExecutorService mScheduler;

        StateCallback(Executor executor, ScheduledExecutorService scheduler, long cameraOpenRetryMaxTimeoutInMs) {
            this.mExecutor = executor;
            this.mScheduler = scheduler;
            this.mCameraReopenMonitor = new CameraReopenMonitor(cameraOpenRetryMaxTimeoutInMs);
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onOpened(CameraDevice cameraDevice) {
            Camera2CameraImpl.this.debugLog("CameraDevice.onOpened()");
            Camera2CameraImpl.this.mCameraDevice = cameraDevice;
            Camera2CameraImpl.this.mCameraDeviceError = 0;
            resetReopenMonitor();
            switch (Camera2CameraImpl.this.mState.ordinal()) {
                case 1:
                case 5:
                    Preconditions.checkState(Camera2CameraImpl.this.isSessionCloseComplete());
                    Camera2CameraImpl.this.mCameraDevice.close();
                    Camera2CameraImpl.this.mCameraDevice = null;
                    return;
                case 2:
                case 3:
                case 4:
                default:
                    throw new IllegalStateException("onOpened() should not be possible from state: " + Camera2CameraImpl.this.mState);
                case 6:
                case 7:
                case 8:
                    Camera2CameraImpl.this.setState(InternalState.OPENED);
                    if (Camera2CameraImpl.this.mCameraStateRegistry.tryOpenCaptureSession(cameraDevice.getId(), Camera2CameraImpl.this.mCameraCoordinator.getPairedConcurrentCameraId(Camera2CameraImpl.this.mCameraDevice.getId()))) {
                        Camera2CameraImpl.this.openCaptureSession();
                        return;
                    }
                    return;
            }
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onClosed(CameraDevice cameraDevice) {
            Camera2CameraImpl.this.debugLog("CameraDevice.onClosed()");
            Preconditions.checkState(Camera2CameraImpl.this.mCameraDevice == null, "Unexpected onClose callback on camera device: " + cameraDevice);
            switch (Camera2CameraImpl.this.mState.ordinal()) {
                case 1:
                case 5:
                    Preconditions.checkState(Camera2CameraImpl.this.isSessionCloseComplete());
                    Camera2CameraImpl.this.configAndCloseIfNeeded();
                    return;
                case 2:
                case 3:
                case 4:
                default:
                    throw new IllegalStateException("Camera closed while in state: " + Camera2CameraImpl.this.mState);
                case 6:
                case 7:
                    if (Camera2CameraImpl.this.mCameraDeviceError != 0) {
                        Camera2CameraImpl.this.debugLog("Camera closed due to error: " + Camera2CameraImpl.getErrorMessage(Camera2CameraImpl.this.mCameraDeviceError));
                        scheduleCameraReopen();
                        return;
                    } else {
                        Camera2CameraImpl.this.tryOpenCameraDevice(false);
                        return;
                    }
            }
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onDisconnected(CameraDevice cameraDevice) {
            Camera2CameraImpl.this.debugLog("CameraDevice.onDisconnected()");
            onError(cameraDevice, 1);
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onError(CameraDevice cameraDevice, int error) {
            Camera2CameraImpl.this.mCameraDevice = cameraDevice;
            Camera2CameraImpl.this.mCameraDeviceError = error;
            Camera2CameraImpl.this.mErrorTimeoutReopenScheduler.deviceOnError();
            switch (Camera2CameraImpl.this.mState.ordinal()) {
                case 1:
                case 5:
                    Logger.e(Camera2CameraImpl.TAG, String.format("CameraDevice.onError(): %s failed with %s while in %s state. Will finish closing camera.", cameraDevice.getId(), Camera2CameraImpl.getErrorMessage(error), Camera2CameraImpl.this.mState.name()));
                    Camera2CameraImpl.this.closeCamera(false);
                    return;
                case 2:
                case 3:
                case 4:
                default:
                    throw new IllegalStateException("onError() should not be possible from state: " + Camera2CameraImpl.this.mState);
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                    Logger.d(Camera2CameraImpl.TAG, String.format("CameraDevice.onError(): %s failed with %s while in %s state. Will attempt recovering from error.", cameraDevice.getId(), Camera2CameraImpl.getErrorMessage(error), Camera2CameraImpl.this.mState.name()));
                    handleErrorOnOpen(cameraDevice, error);
                    return;
            }
        }

        private void handleErrorOnOpen(CameraDevice cameraDevice, int error) {
            int publicErrorCode;
            Preconditions.checkState(Camera2CameraImpl.this.mState == InternalState.OPENING || Camera2CameraImpl.this.mState == InternalState.OPENED || Camera2CameraImpl.this.mState == InternalState.CONFIGURED || Camera2CameraImpl.this.mState == InternalState.REOPENING || Camera2CameraImpl.this.mState == InternalState.REOPENING_QUIRK, "Attempt to handle open error from non open state: " + Camera2CameraImpl.this.mState);
            switch (error) {
                case 1:
                case 2:
                case 4:
                    Logger.d(Camera2CameraImpl.TAG, String.format("Attempt to reopen camera[%s] after error[%s]", cameraDevice.getId(), Camera2CameraImpl.getErrorMessage(error)));
                    reopenCameraAfterError(error);
                    break;
                case 3:
                default:
                    Logger.e(Camera2CameraImpl.TAG, "Error observed on open (or opening) camera device " + cameraDevice.getId() + ": " + Camera2CameraImpl.getErrorMessage(error) + " closing camera.");
                    if (error == 3) {
                        publicErrorCode = 5;
                    } else {
                        publicErrorCode = 6;
                    }
                    Camera2CameraImpl.this.setState(InternalState.CLOSING, CameraState.StateError.create(publicErrorCode));
                    Camera2CameraImpl.this.closeCamera(false);
                    break;
            }
        }

        private void reopenCameraAfterError(int error) {
            int publicErrorCode;
            Preconditions.checkState(Camera2CameraImpl.this.mCameraDeviceError != 0, "Can only reopen camera device after error if the camera device is actually in an error state.");
            switch (error) {
                case 1:
                    publicErrorCode = 2;
                    break;
                case 2:
                    publicErrorCode = 1;
                    break;
                default:
                    publicErrorCode = 3;
                    break;
            }
            Camera2CameraImpl.this.setState(InternalState.REOPENING, CameraState.StateError.create(publicErrorCode));
            Camera2CameraImpl.this.closeCamera(false);
        }

        void scheduleCameraReopen() {
            Preconditions.checkState(this.mScheduledReopenRunnable == null);
            Preconditions.checkState(this.mScheduledReopenHandle == null);
            if (this.mCameraReopenMonitor.canScheduleCameraReopen()) {
                this.mScheduledReopenRunnable = new ScheduledReopen(this.mExecutor);
                Camera2CameraImpl.this.debugLog("Attempting camera re-open in " + this.mCameraReopenMonitor.getReopenDelayMs() + "ms: " + this.mScheduledReopenRunnable + " activeResuming = " + Camera2CameraImpl.this.mIsActiveResumingMode);
                this.mScheduledReopenHandle = this.mScheduler.schedule(this.mScheduledReopenRunnable, this.mCameraReopenMonitor.getReopenDelayMs(), TimeUnit.MILLISECONDS);
            } else {
                Logger.e(Camera2CameraImpl.TAG, "Camera reopening attempted for " + this.mCameraReopenMonitor.getReopenLimitMs() + "ms without success.");
                Camera2CameraImpl.this.setState(InternalState.PENDING_OPEN, null, false);
            }
        }

        boolean cancelScheduledReopen() {
            if (this.mScheduledReopenHandle == null) {
                return false;
            }
            Camera2CameraImpl.this.debugLog("Cancelling scheduled re-open: " + this.mScheduledReopenRunnable);
            this.mScheduledReopenRunnable.cancel();
            this.mScheduledReopenRunnable = null;
            this.mScheduledReopenHandle.cancel(false);
            this.mScheduledReopenHandle = null;
            return true;
        }

        void resetReopenMonitor() {
            this.mCameraReopenMonitor.reset();
        }

        class ScheduledReopen implements Runnable {
            private boolean mCancelled = false;
            private Executor mExecutor;

            ScheduledReopen(Executor executor) {
                this.mExecutor = executor;
            }

            void cancel() {
                this.mCancelled = true;
            }

            @Override // java.lang.Runnable
            public void run() {
                this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2CameraImpl$StateCallback$ScheduledReopen$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        Camera2CameraImpl.StateCallback.ScheduledReopen.this.m38x10b58748();
                    }
                });
            }

            /* renomeado de: lambda$run$0$androidx-camera-camera2-internal-Camera2CameraImpl$StateCallback$ScheduledReopen, motivo: nome Java inválido */
            /* sintético */ void m38x10b58748() {
                if (!this.mCancelled) {
                    Preconditions.checkState(Camera2CameraImpl.this.mState == InternalState.REOPENING || Camera2CameraImpl.this.mState == InternalState.REOPENING_QUIRK);
                    if (StateCallback.this.shouldActiveResume()) {
                        Camera2CameraImpl.this.tryForceOpenCameraDevice(true);
                    } else {
                        Camera2CameraImpl.this.tryOpenCameraDevice(true);
                    }
                }
            }
        }

        boolean shouldActiveResume() {
            return Camera2CameraImpl.this.mIsActiveResumingMode && (Camera2CameraImpl.this.mCameraDeviceError == 1 || Camera2CameraImpl.this.mCameraDeviceError == 2);
        }

        class CameraReopenMonitor {
            static final int ACTIVE_REOPEN_DELAY_BASE_MS = 1000;
            static final int ACTIVE_REOPEN_LIMIT_MS = 1800000;
            static final int INVALID_TIME = -1;
            static final int REOPEN_DELAY_MS = 700;
            static final int REOPEN_LIMIT_MS = 10000;
            private final long mCameraOpenRetryMaxTimeoutInMs;
            private long mFirstReopenTime = -1;

            CameraReopenMonitor(long cameraOpenRetryMaxTimeoutInMs) {
                this.mCameraOpenRetryMaxTimeoutInMs = cameraOpenRetryMaxTimeoutInMs;
            }

            int getReopenDelayMs() {
                if (!StateCallback.this.shouldActiveResume()) {
                    return 700;
                }
                long elapsedTime = getElapsedTime();
                if (elapsedTime <= 120000) {
                    return 1000;
                }
                if (elapsedTime <= 300000) {
                    return CredentialOption.PRIORITY_DEFAULT;
                }
                return 4000;
            }

            int getReopenLimitMs() {
                if (StateCallback.this.shouldActiveResume()) {
                    return this.mCameraOpenRetryMaxTimeoutInMs > 0 ? Math.min((int) this.mCameraOpenRetryMaxTimeoutInMs, ACTIVE_REOPEN_LIMIT_MS) : ACTIVE_REOPEN_LIMIT_MS;
                }
                if (this.mCameraOpenRetryMaxTimeoutInMs > 0) {
                    return Math.min((int) this.mCameraOpenRetryMaxTimeoutInMs, 10000);
                }
                return 10000;
            }

            long getElapsedTime() {
                long now = SystemClock.uptimeMillis();
                if (this.mFirstReopenTime == -1) {
                    this.mFirstReopenTime = now;
                }
                return now - this.mFirstReopenTime;
            }

            boolean canScheduleCameraReopen() {
                boolean hasReachedLimit = getElapsedTime() >= ((long) getReopenLimitMs());
                if (!hasReachedLimit) {
                    return true;
                }
                reset();
                return false;
            }

            void reset() {
                this.mFirstReopenTime = -1L;
            }
        }
    }

    final class CameraAvailability extends CameraManager.AvailabilityCallback implements CameraStateRegistry.OnOpenAvailableListener {
        private boolean mCameraAvailable = true;
        private final String mCameraId;

        CameraAvailability(String cameraId) {
            this.mCameraId = cameraId;
        }

        @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
        public void onCameraAvailable(String cameraId) {
            if (!this.mCameraId.equals(cameraId)) {
                return;
            }
            this.mCameraAvailable = true;
            if (Camera2CameraImpl.this.mState == InternalState.PENDING_OPEN || Camera2CameraImpl.this.mState == InternalState.OPENING_WITH_ERROR) {
                Camera2CameraImpl.this.tryOpenCameraDevice(false);
            }
        }

        @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
        public void onCameraUnavailable(String cameraId) {
            if (!this.mCameraId.equals(cameraId)) {
                return;
            }
            this.mCameraAvailable = false;
        }

        @Override // androidx.camera.core.impl.CameraStateRegistry.OnOpenAvailableListener
        public void onOpenAvailable() {
            if (Camera2CameraImpl.this.mState == InternalState.PENDING_OPEN || Camera2CameraImpl.this.mState == InternalState.OPENING_WITH_ERROR) {
                Camera2CameraImpl.this.tryOpenCameraDevice(false);
            }
        }

        boolean isCameraAvailable() {
            return this.mCameraAvailable;
        }
    }

    final class CameraConfigureAvailable implements CameraStateRegistry.OnConfigureAvailableListener {
        CameraConfigureAvailable() {
        }

        @Override // androidx.camera.core.impl.CameraStateRegistry.OnConfigureAvailableListener
        public void onConfigureAvailable() {
            if (Camera2CameraImpl.this.mState == InternalState.OPENED) {
                Camera2CameraImpl.this.openCaptureSession();
            }
        }
    }

    final class ControlUpdateListenerInternal implements CameraControlInternal.ControlUpdateCallback {
        ControlUpdateListenerInternal() {
        }

        @Override // androidx.camera.core.impl.CameraControlInternal.ControlUpdateCallback
        public void onCameraControlUpdateSessionConfig() {
            Camera2CameraImpl.this.updateCaptureSessionConfig();
        }

        @Override // androidx.camera.core.impl.CameraControlInternal.ControlUpdateCallback
        public void onCameraControlCaptureRequests(List<CaptureConfig> captureConfigs) {
            Camera2CameraImpl.this.submitCaptureRequests((List) Preconditions.checkNotNull(captureConfigs));
        }
    }
}
