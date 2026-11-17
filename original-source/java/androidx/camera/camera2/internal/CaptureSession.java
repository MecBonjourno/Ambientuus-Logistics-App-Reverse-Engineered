package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.DynamicRangeProfiles;
import android.hardware.camera2.params.MultiResolutionStreamInfo;
import android.hardware.camera2.params.OutputConfiguration;
import android.os.Build;
import android.view.Surface;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.CameraBurstCaptureCallback;
import androidx.camera.camera2.internal.SynchronizedCaptureSession;
import androidx.camera.camera2.internal.SynchronizedCaptureSessionStateCallbacks;
import androidx.camera.camera2.internal.compat.params.DynamicRangeConversions;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.camera2.internal.compat.params.InputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.camera.camera2.internal.compat.quirk.CaptureNoResponseQuirk;
import androidx.camera.camera2.internal.compat.workaround.RequestMonitor;
import androidx.camera.camera2.internal.compat.workaround.StillCaptureFlow;
import androidx.camera.camera2.internal.compat.workaround.TemplateParamsOverride;
import androidx.camera.camera2.internal.compat.workaround.TorchStateReset;
import androidx.camera.camera2.interop.Camera2CaptureRequestConfigurator;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.utils.SurfaceUtil;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import androidx.tracing.Trace;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;

/* loaded from: classes.dex */
final class CaptureSession implements CaptureSessionInterface {
    private static final String TAG = "CaptureSession";
    private static final long TIMEOUT_GET_SURFACE_IN_MS = 5000;
    private final boolean mCanUseMultiResolutionImageReader;
    private final List<CaptureConfig> mCaptureConfigs;
    private final Camera2CaptureRequestConfigurator mCaptureRequestConfigurator;
    private final StateCallback mCaptureSessionStateCallback;
    List<DeferrableSurface> mConfiguredDeferrableSurfaces;
    private final Map<DeferrableSurface, Surface> mConfiguredSurfaceMap;
    private final DynamicRangesCompat mDynamicRangesCompat;
    State mHighestState;
    CallbackToFutureAdapter.Completer<Void> mReleaseCompleter;
    ListenableFuture<Void> mReleaseFuture;
    private final RequestMonitor mRequestMonitor;
    SessionConfig mSessionConfig;
    final Object mSessionLock;
    SynchronizedCaptureSession.Opener mSessionOpener;
    State mState;
    private final StillCaptureFlow mStillCaptureFlow;
    private Map<DeferrableSurface, Long> mStreamUseCaseMap;
    SynchronizedCaptureSession mSynchronizedCaptureSession;
    private final TemplateParamsOverride mTemplateParamsOverride;
    private final TorchStateReset mTorchStateReset;

    enum State {
        UNINITIALIZED,
        RELEASED,
        INITIALIZED,
        GET_SURFACE,
        RELEASING,
        CLOSED,
        OPENING,
        OPENED
    }

    CaptureSession(DynamicRangesCompat dynamicRangesCompat) {
        this(dynamicRangesCompat, false);
    }

    CaptureSession(DynamicRangesCompat dynamicRangesCompat, boolean canUseMultiResolutionImageReader) {
        this(dynamicRangesCompat, new Quirks(Collections.emptyList()), canUseMultiResolutionImageReader, null);
    }

    CaptureSession(DynamicRangesCompat dynamicRangesCompat, Quirks cameraQuirks) {
        this(dynamicRangesCompat, cameraQuirks, false, null);
    }

    CaptureSession(DynamicRangesCompat dynamicRangesCompat, boolean canUseMultiResolutionImageReader, Camera2CaptureRequestConfigurator captureRequestConfigurator) {
        this(dynamicRangesCompat, new Quirks(Collections.emptyList()), canUseMultiResolutionImageReader, captureRequestConfigurator);
    }

    CaptureSession(DynamicRangesCompat dynamicRangesCompat, Quirks cameraQuirks, Camera2CaptureRequestConfigurator captureRequestConfigurator) {
        this(dynamicRangesCompat, cameraQuirks, false, captureRequestConfigurator);
    }

    CaptureSession(DynamicRangesCompat dynamicRangesCompat, Quirks cameraQuirks, boolean canUseMultiResolutionImageReader, Camera2CaptureRequestConfigurator captureRequestConfigurator) {
        this.mSessionLock = new Object();
        this.mCaptureConfigs = new ArrayList();
        this.mConfiguredSurfaceMap = new HashMap();
        this.mConfiguredDeferrableSurfaces = Collections.emptyList();
        this.mHighestState = State.UNINITIALIZED;
        this.mState = State.UNINITIALIZED;
        this.mStreamUseCaseMap = new HashMap();
        this.mStillCaptureFlow = new StillCaptureFlow();
        this.mTorchStateReset = new TorchStateReset();
        setState(State.INITIALIZED);
        this.mDynamicRangesCompat = dynamicRangesCompat;
        this.mCaptureSessionStateCallback = new StateCallback();
        this.mRequestMonitor = new RequestMonitor(cameraQuirks.contains(CaptureNoResponseQuirk.class));
        this.mTemplateParamsOverride = new TemplateParamsOverride(cameraQuirks);
        this.mCanUseMultiResolutionImageReader = canUseMultiResolutionImageReader;
        this.mCaptureRequestConfigurator = captureRequestConfigurator;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setStreamUseCaseMap(Map<DeferrableSurface, Long> streamUseCaseMap) {
        synchronized (this.mSessionLock) {
            this.mStreamUseCaseMap = streamUseCaseMap;
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public SessionConfig getSessionConfig() {
        SessionConfig sessionConfig;
        synchronized (this.mSessionLock) {
            sessionConfig = this.mSessionConfig;
        }
        return sessionConfig;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setSessionConfig(SessionConfig sessionConfig) {
        synchronized (this.mSessionLock) {
            switch (this.mState) {
                case UNINITIALIZED:
                    throw new IllegalStateException("setSessionConfig() should not be possible in state: " + this.mState);
                case RELEASED:
                case RELEASING:
                case CLOSED:
                    throw new IllegalStateException("Session configuration cannot be set on a closed/released session.");
                case INITIALIZED:
                case GET_SURFACE:
                case OPENING:
                    this.mSessionConfig = sessionConfig;
                    break;
                case OPENED:
                    this.mSessionConfig = sessionConfig;
                    if (sessionConfig != null) {
                        if (!this.mConfiguredSurfaceMap.keySet().containsAll(sessionConfig.getSurfaces())) {
                            Logger.e(TAG, "Does not have the proper configured lists");
                            return;
                        } else {
                            Logger.d(TAG, "Attempting to submit CaptureRequest after setting");
                            issueRepeatingCaptureRequests(this.mSessionConfig);
                            break;
                        }
                    } else {
                        return;
                    }
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public ListenableFuture<Void> open(final SessionConfig sessionConfig, final CameraDevice cameraDevice, SynchronizedCaptureSession.Opener opener) {
        synchronized (this.mSessionLock) {
            switch (this.mState.ordinal()) {
                case 2:
                    setState(State.GET_SURFACE);
                    this.mConfiguredDeferrableSurfaces = new ArrayList(sessionConfig.getSurfaces());
                    this.mSessionOpener = opener;
                    ListenableFuture<Void> openFuture = FutureChain.from(this.mSessionOpener.startWithDeferrableSurface(this.mConfiguredDeferrableSurfaces, 5000L)).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda2
                        @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                        public final ListenableFuture apply(Object obj) {
                            return CaptureSession.this.m59lambda$open$0$androidxcameracamera2internalCaptureSession(sessionConfig, cameraDevice, (List) obj);
                        }
                    }, this.mSessionOpener.getExecutor());
                    Futures.addCallback(openFuture, new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.CaptureSession.1
                        @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                        public void onSuccess(Void result) {
                        }

                        @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                        public void onFailure(Throwable t) {
                            synchronized (CaptureSession.this.mSessionLock) {
                                CaptureSession.this.mSessionOpener.stop();
                                switch (CaptureSession.this.mState.ordinal()) {
                                    case 4:
                                    case 5:
                                    case 6:
                                        if (!(t instanceof CancellationException)) {
                                            Logger.w(CaptureSession.TAG, "Opening session with fail " + CaptureSession.this.mState, t);
                                            CaptureSession.this.finishClose();
                                            break;
                                        }
                                        break;
                                }
                            }
                        }
                    }, this.mSessionOpener.getExecutor());
                    return Futures.nonCancellationPropagating(openFuture);
                default:
                    Logger.e(TAG, "Open not allowed in state: " + this.mState);
                    return Futures.immediateFailedFuture(new IllegalStateException("open() should not allow the state: " + this.mState));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: openCaptureSession, reason: merged with bridge method [inline-methods] */
    public ListenableFuture<Void> m59lambda$open$0$androidxcameracamera2internalCaptureSession(List<Surface> configuredSurfaces, SessionConfig sessionConfig, CameraDevice cameraDevice) {
        Map<SessionConfig.OutputConfig, OutputConfigurationCompat> mrirOutputConfigurationCompatMap;
        synchronized (this.mSessionLock) {
            try {
                try {
                    switch (this.mState.ordinal()) {
                        case 0:
                        case 2:
                        case 7:
                            return Futures.immediateFailedFuture(new IllegalStateException("openCaptureSession() should not be possible in state: " + this.mState));
                        case 3:
                            this.mConfiguredSurfaceMap.clear();
                            for (int i = 0; i < configuredSurfaces.size(); i++) {
                                this.mConfiguredSurfaceMap.put(this.mConfiguredDeferrableSurfaces.get(i), configuredSurfaces.get(i));
                            }
                            setState(State.OPENING);
                            Logger.d(TAG, "Opening capture session.");
                            SynchronizedCaptureSession.StateCallback callbacks = SynchronizedCaptureSessionStateCallbacks.createComboCallback(this.mCaptureSessionStateCallback, new SynchronizedCaptureSessionStateCallbacks.Adapter(sessionConfig.getSessionStateCallbacks()));
                            Camera2ImplConfig camera2Config = new Camera2ImplConfig(sessionConfig.getImplementationOptions());
                            CaptureConfig.Builder sessionParameterConfigBuilder = CaptureConfig.Builder.from(sessionConfig.getRepeatingCaptureConfig());
                            Map<SessionConfig.OutputConfig, OutputConfigurationCompat> mrirOutputConfigurationCompatMap2 = new HashMap<>();
                            if (this.mCanUseMultiResolutionImageReader && Build.VERSION.SDK_INT >= 35) {
                                Map<Integer, List<SessionConfig.OutputConfig>> groupIdToOutputConfigsMap = groupMrirOutputConfigs(sessionConfig.getOutputConfigs());
                                Map<SessionConfig.OutputConfig, OutputConfigurationCompat> mrirOutputConfigurationCompatMap3 = createMultiResolutionOutputConfigurationCompats(groupIdToOutputConfigsMap, this.mConfiguredSurfaceMap);
                                mrirOutputConfigurationCompatMap = mrirOutputConfigurationCompatMap3;
                            } else {
                                mrirOutputConfigurationCompatMap = mrirOutputConfigurationCompatMap2;
                            }
                            List<OutputConfigurationCompat> outputConfigList = new ArrayList<>();
                            String physicalCameraIdForAllStreams = camera2Config.getPhysicalCameraId(null);
                            for (SessionConfig.OutputConfig outputConfig : sessionConfig.getOutputConfigs()) {
                                OutputConfigurationCompat outputConfiguration = null;
                                if (this.mCanUseMultiResolutionImageReader && Build.VERSION.SDK_INT >= 35) {
                                    outputConfiguration = mrirOutputConfigurationCompatMap.get(outputConfig);
                                }
                                if (outputConfiguration == null) {
                                    outputConfiguration = getOutputConfigurationCompat(outputConfig, this.mConfiguredSurfaceMap, physicalCameraIdForAllStreams);
                                    if (this.mStreamUseCaseMap.containsKey(outputConfig.getSurface())) {
                                        outputConfiguration.setStreamUseCase(this.mStreamUseCaseMap.get(outputConfig.getSurface()).longValue());
                                    }
                                }
                                outputConfigList.add(outputConfiguration);
                            }
                            SessionConfigurationCompat sessionConfigCompat = this.mSessionOpener.createSessionConfigurationCompat(sessionConfig.getSessionType(), getUniqueOutputConfigurations(outputConfigList), callbacks);
                            if (sessionConfig.getTemplateType() == 5 && sessionConfig.getInputConfiguration() != null) {
                                sessionConfigCompat.setInputConfiguration(InputConfigurationCompat.wrap(sessionConfig.getInputConfiguration()));
                            }
                            try {
                                CaptureRequest captureRequest = Camera2CaptureRequestBuilder.buildWithoutTarget(sessionParameterConfigBuilder.build(), cameraDevice, this.mTemplateParamsOverride);
                                if (captureRequest != null) {
                                    if (this.mCaptureRequestConfigurator != null) {
                                        this.mCaptureRequestConfigurator.configureWith(captureRequest);
                                    }
                                    sessionConfigCompat.setSessionParameters(captureRequest);
                                }
                                return this.mSessionOpener.openCaptureSession(cameraDevice, sessionConfigCompat, this.mConfiguredDeferrableSurfaces);
                            } catch (CameraAccessException e) {
                                return Futures.immediateFailedFuture(e);
                            }
                        default:
                            return Futures.immediateFailedFuture(new CancellationException("openCaptureSession() not execute in state: " + this.mState));
                    }
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        }
    }

    private List<OutputConfigurationCompat> getUniqueOutputConfigurations(List<OutputConfigurationCompat> outputConfigurations) {
        List<Surface> addedSurfaces = new ArrayList<>();
        List<OutputConfigurationCompat> results = new ArrayList<>();
        for (OutputConfigurationCompat outputConfiguration : outputConfigurations) {
            if (!addedSurfaces.contains(outputConfiguration.getSurface())) {
                addedSurfaces.add(outputConfiguration.getSurface());
                results.add(outputConfiguration);
            }
        }
        return results;
    }

    private OutputConfigurationCompat getOutputConfigurationCompat(SessionConfig.OutputConfig outputConfig, Map<DeferrableSurface, Surface> configuredSurfaceMap, String physicalCameraIdForAllStreams) {
        DynamicRangeProfiles dynamicRangeProfiles;
        Surface surface = configuredSurfaceMap.get(outputConfig.getSurface());
        Preconditions.checkNotNull(surface, "Surface in OutputConfig not found in configuredSurfaceMap.");
        OutputConfigurationCompat outputConfiguration = new OutputConfigurationCompat(outputConfig.getSurfaceGroupId(), surface);
        if (physicalCameraIdForAllStreams != null) {
            outputConfiguration.setPhysicalCameraId(physicalCameraIdForAllStreams);
        } else {
            outputConfiguration.setPhysicalCameraId(outputConfig.getPhysicalCameraId());
        }
        if (outputConfig.getMirrorMode() == 0) {
            outputConfiguration.setMirrorMode(1);
        } else if (outputConfig.getMirrorMode() == 1) {
            outputConfiguration.setMirrorMode(2);
        }
        if (!outputConfig.getSharedSurfaces().isEmpty()) {
            outputConfiguration.enableSurfaceSharing();
            for (DeferrableSurface sharedDeferSurface : outputConfig.getSharedSurfaces()) {
                Surface sharedSurface = configuredSurfaceMap.get(sharedDeferSurface);
                Preconditions.checkNotNull(sharedSurface, "Surface in OutputConfig not found in configuredSurfaceMap.");
                outputConfiguration.addSurface(sharedSurface);
            }
        }
        long dynamicRangeProfile = 1;
        if (Build.VERSION.SDK_INT >= 33 && (dynamicRangeProfiles = this.mDynamicRangesCompat.toDynamicRangeProfiles()) != null) {
            DynamicRange requestedDynamicRange = outputConfig.getDynamicRange();
            Long dynamicRangeProfileOrNull = DynamicRangeConversions.dynamicRangeToFirstSupportedProfile(requestedDynamicRange, dynamicRangeProfiles);
            if (dynamicRangeProfileOrNull == null) {
                Logger.e(TAG, "Requested dynamic range is not supported. Defaulting to STANDARD dynamic range profile.\nRequested dynamic range:\n  " + requestedDynamicRange);
            } else {
                dynamicRangeProfile = dynamicRangeProfileOrNull.longValue();
            }
        }
        outputConfiguration.setDynamicRangeProfile(dynamicRangeProfile);
        return outputConfiguration;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void close() {
        synchronized (this.mSessionLock) {
            switch (this.mState) {
                case UNINITIALIZED:
                    throw new IllegalStateException("close() should not be possible in state: " + this.mState);
                case GET_SURFACE:
                    Preconditions.checkNotNull(this.mSessionOpener, "The Opener shouldn't null in state:" + this.mState);
                    this.mSessionOpener.stop();
                case INITIALIZED:
                    setState(State.RELEASED);
                    break;
                case OPENING:
                case OPENED:
                    Preconditions.checkNotNull(this.mSessionOpener, "The Opener shouldn't null in state:" + this.mState);
                    this.mSessionOpener.stop();
                    setState(State.CLOSED);
                    this.mRequestMonitor.stop();
                    this.mSessionConfig = null;
                    break;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0053 A[Catch: all -> 0x00b2, TryCatch #0 {, blocks: (B:4:0x0003, B:5:0x0009, B:7:0x00ab, B:11:0x000e, B:16:0x0014, B:14:0x0022, B:19:0x001b, B:20:0x0027, B:22:0x0053, B:23:0x0057, B:25:0x005b, B:26:0x0066, B:27:0x0068, B:29:0x006a, B:30:0x0089, B:31:0x008f, B:32:0x00aa), top: B:3:0x0003, inners: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x005b A[Catch: all -> 0x00b2, TryCatch #0 {, blocks: (B:4:0x0003, B:5:0x0009, B:7:0x00ab, B:11:0x000e, B:16:0x0014, B:14:0x0022, B:19:0x001b, B:20:0x0027, B:22:0x0053, B:23:0x0057, B:25:0x005b, B:26:0x0066, B:27:0x0068, B:29:0x006a, B:30:0x0089, B:31:0x008f, B:32:0x00aa), top: B:3:0x0003, inners: #1 }] */
    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.common.util.concurrent.ListenableFuture<java.lang.Void> release(boolean r5) {
        /*
            r4 = this;
            java.lang.Object r0 = r4.mSessionLock
            monitor-enter(r0)
            androidx.camera.camera2.internal.CaptureSession$State r1 = r4.mState     // Catch: java.lang.Throwable -> Lb2
            int r1 = r1.ordinal()     // Catch: java.lang.Throwable -> Lb2
            switch(r1) {
                case 0: goto L8f;
                case 1: goto Lc;
                case 2: goto L89;
                case 3: goto L6a;
                case 4: goto L57;
                case 5: goto Le;
                case 6: goto L27;
                case 7: goto Le;
                default: goto Lc;
            }     // Catch: java.lang.Throwable -> Lb2
        Lc:
            goto Lab
        Le:
            androidx.camera.camera2.internal.SynchronizedCaptureSession r1 = r4.mSynchronizedCaptureSession     // Catch: java.lang.Throwable -> Lb2
            if (r1 == 0) goto L27
            if (r5 == 0) goto L22
            androidx.camera.camera2.internal.SynchronizedCaptureSession r1 = r4.mSynchronizedCaptureSession     // Catch: android.hardware.camera2.CameraAccessException -> L1a java.lang.Throwable -> Lb2
            r1.abortCaptures()     // Catch: android.hardware.camera2.CameraAccessException -> L1a java.lang.Throwable -> Lb2
            goto L22
        L1a:
            r1 = move-exception
            java.lang.String r2 = "CaptureSession"
            java.lang.String r3 = "Unable to abort captures."
            androidx.camera.core.Logger.e(r2, r3, r1)     // Catch: java.lang.Throwable -> Lb2
        L22:
            androidx.camera.camera2.internal.SynchronizedCaptureSession r1 = r4.mSynchronizedCaptureSession     // Catch: java.lang.Throwable -> Lb2
            r1.close()     // Catch: java.lang.Throwable -> Lb2
        L27:
            androidx.camera.camera2.internal.CaptureSession$State r1 = androidx.camera.camera2.internal.CaptureSession.State.RELEASING     // Catch: java.lang.Throwable -> Lb2
            r4.setState(r1)     // Catch: java.lang.Throwable -> Lb2
            androidx.camera.camera2.internal.compat.workaround.RequestMonitor r1 = r4.mRequestMonitor     // Catch: java.lang.Throwable -> Lb2
            r1.stop()     // Catch: java.lang.Throwable -> Lb2
            androidx.camera.camera2.internal.SynchronizedCaptureSession$Opener r1 = r4.mSessionOpener     // Catch: java.lang.Throwable -> Lb2
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lb2
            r2.<init>()     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r3 = "The Opener shouldn't null in state:"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lb2
            androidx.camera.camera2.internal.CaptureSession$State r3 = r4.mState     // Catch: java.lang.Throwable -> Lb2
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lb2
            androidx.core.util.Preconditions.checkNotNull(r1, r2)     // Catch: java.lang.Throwable -> Lb2
            androidx.camera.camera2.internal.SynchronizedCaptureSession$Opener r1 = r4.mSessionOpener     // Catch: java.lang.Throwable -> Lb2
            boolean r1 = r1.stop()     // Catch: java.lang.Throwable -> Lb2
            if (r1 == 0) goto L57
            r4.finishClose()     // Catch: java.lang.Throwable -> Lb2
            goto Lab
        L57:
            com.google.common.util.concurrent.ListenableFuture<java.lang.Void> r1 = r4.mReleaseFuture     // Catch: java.lang.Throwable -> Lb2
            if (r1 != 0) goto L66
            androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda1 r1 = new androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda1     // Catch: java.lang.Throwable -> Lb2
            r1.<init>()     // Catch: java.lang.Throwable -> Lb2
            com.google.common.util.concurrent.ListenableFuture r1 = androidx.concurrent.futures.CallbackToFutureAdapter.getFuture(r1)     // Catch: java.lang.Throwable -> Lb2
            r4.mReleaseFuture = r1     // Catch: java.lang.Throwable -> Lb2
        L66:
            com.google.common.util.concurrent.ListenableFuture<java.lang.Void> r1 = r4.mReleaseFuture     // Catch: java.lang.Throwable -> Lb2
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lb2
            return r1
        L6a:
            androidx.camera.camera2.internal.SynchronizedCaptureSession$Opener r1 = r4.mSessionOpener     // Catch: java.lang.Throwable -> Lb2
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lb2
            r2.<init>()     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r3 = "The Opener shouldn't null in state:"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lb2
            androidx.camera.camera2.internal.CaptureSession$State r3 = r4.mState     // Catch: java.lang.Throwable -> Lb2
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lb2
            androidx.core.util.Preconditions.checkNotNull(r1, r2)     // Catch: java.lang.Throwable -> Lb2
            androidx.camera.camera2.internal.SynchronizedCaptureSession$Opener r1 = r4.mSessionOpener     // Catch: java.lang.Throwable -> Lb2
            r1.stop()     // Catch: java.lang.Throwable -> Lb2
        L89:
            androidx.camera.camera2.internal.CaptureSession$State r1 = androidx.camera.camera2.internal.CaptureSession.State.RELEASED     // Catch: java.lang.Throwable -> Lb2
            r4.setState(r1)     // Catch: java.lang.Throwable -> Lb2
            goto Lab
        L8f:
            java.lang.IllegalStateException r1 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> Lb2
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lb2
            r2.<init>()     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r3 = "release() should not be possible in state: "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lb2
            androidx.camera.camera2.internal.CaptureSession$State r3 = r4.mState     // Catch: java.lang.Throwable -> Lb2
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lb2
            r1.<init>(r2)     // Catch: java.lang.Throwable -> Lb2
            throw r1     // Catch: java.lang.Throwable -> Lb2
        Lab:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lb2
            r0 = 0
            com.google.common.util.concurrent.ListenableFuture r0 = androidx.camera.core.impl.utils.futures.Futures.immediateFuture(r0)
            return r0
        Lb2:
            r1 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lb2
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.camera2.internal.CaptureSession.release(boolean):com.google.common.util.concurrent.ListenableFuture");
    }

    /* renamed from: lambda$release$1$androidx-camera-camera2-internal-CaptureSession, reason: not valid java name */
    /* synthetic */ Object m60lambda$release$1$androidxcameracamera2internalCaptureSession(CallbackToFutureAdapter.Completer completer) throws Exception {
        String str;
        synchronized (this.mSessionLock) {
            Preconditions.checkState(this.mReleaseCompleter == null, "Release completer expected to be null");
            this.mReleaseCompleter = completer;
            str = "Release[session=" + this + "]";
        }
        return str;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void issueCaptureRequests(List<CaptureConfig> captureConfigs) {
        synchronized (this.mSessionLock) {
            switch (this.mState) {
                case UNINITIALIZED:
                    throw new IllegalStateException("issueCaptureRequests() should not be possible in state: " + this.mState);
                case RELEASED:
                case RELEASING:
                case CLOSED:
                    throw new IllegalStateException("Cannot issue capture request on a closed/released session.");
                case INITIALIZED:
                case GET_SURFACE:
                case OPENING:
                    this.mCaptureConfigs.addAll(captureConfigs);
                    break;
                case OPENED:
                    this.mCaptureConfigs.addAll(captureConfigs);
                    issuePendingCaptureRequest();
                    break;
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public List<CaptureConfig> getCaptureConfigs() {
        List<CaptureConfig> unmodifiableList;
        synchronized (this.mSessionLock) {
            unmodifiableList = DesugarCollections.unmodifiableList(this.mCaptureConfigs);
        }
        return unmodifiableList;
    }

    State getState() {
        State state;
        synchronized (this.mSessionLock) {
            state = this.mState;
        }
        return state;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public boolean isInOpenState() {
        boolean z;
        synchronized (this.mSessionLock) {
            z = this.mState == State.OPENED || this.mState == State.OPENING;
        }
        return z;
    }

    void finishClose() {
        if (this.mState == State.RELEASED) {
            Logger.d(TAG, "Skipping finishClose due to being state RELEASED.");
            return;
        }
        setState(State.RELEASED);
        this.mSynchronizedCaptureSession = null;
        if (this.mReleaseCompleter != null) {
            this.mReleaseCompleter.set(null);
            this.mReleaseCompleter = null;
        }
    }

    int issueRepeatingCaptureRequests(SessionConfig sessionConfig) {
        synchronized (this.mSessionLock) {
            if (sessionConfig == null) {
                Logger.d(TAG, "Skipping issueRepeatingCaptureRequests for no configuration case.");
                return -1;
            }
            if (this.mState != State.OPENED) {
                Logger.d(TAG, "Skipping issueRepeatingCaptureRequests due to session closed");
                return -1;
            }
            CaptureConfig captureConfig = sessionConfig.getRepeatingCaptureConfig();
            if (captureConfig.getSurfaces().isEmpty()) {
                Logger.d(TAG, "Skipping issueRepeatingCaptureRequests for no surface.");
                try {
                    this.mSynchronizedCaptureSession.stopRepeating();
                } catch (CameraAccessException e) {
                    Logger.e(TAG, "Unable to access camera: " + e.getMessage());
                    Thread.dumpStack();
                }
                return -1;
            }
            try {
                Logger.d(TAG, "Issuing request for session.");
                CaptureRequest captureRequest = Camera2CaptureRequestBuilder.build(captureConfig, this.mSynchronizedCaptureSession.getDevice(), this.mConfiguredSurfaceMap, true, this.mTemplateParamsOverride);
                if (captureRequest == null) {
                    Logger.d(TAG, "Skipping issuing empty request for session.");
                    return -1;
                }
                CameraCaptureSession.CaptureCallback comboCaptureCallback = this.mRequestMonitor.createMonitorListener(createCamera2CaptureCallback(captureConfig.getCameraCaptureCallbacks(), new CameraCaptureSession.CaptureCallback[0]));
                if (this.mCaptureRequestConfigurator != null) {
                    this.mCaptureRequestConfigurator.configureWith(captureRequest);
                }
                if (sessionConfig.getSessionType() == 1) {
                    List<CaptureRequest> requests = this.mSynchronizedCaptureSession.createHighSpeedRequestList(captureRequest);
                    return this.mSynchronizedCaptureSession.setRepeatingBurstRequests(requests, comboCaptureCallback);
                }
                return this.mSynchronizedCaptureSession.setSingleRepeatingRequest(captureRequest, comboCaptureCallback);
            } catch (CameraAccessException e2) {
                Logger.e(TAG, "Unable to access camera: " + e2.getMessage());
                Thread.dumpStack();
                return -1;
            }
        }
    }

    void issuePendingCaptureRequest() {
        this.mRequestMonitor.getRequestsProcessedFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                CaptureSession.this.m58x337815aa();
            }
        }, CameraXExecutors.directExecutor());
    }

    /* renamed from: lambda$issuePendingCaptureRequest$2$androidx-camera-camera2-internal-CaptureSession, reason: not valid java name */
    /* synthetic */ void m58x337815aa() {
        synchronized (this.mSessionLock) {
            if (this.mCaptureConfigs.isEmpty()) {
                return;
            }
            try {
                issueBurstCaptureRequest(this.mCaptureConfigs);
            } finally {
                this.mCaptureConfigs.clear();
            }
        }
    }

    int issueBurstCaptureRequest(List<CaptureConfig> captureConfigs) {
        CameraBurstCaptureCallback callbackAggregator;
        List<CaptureRequest> captureRequests;
        boolean isStillCapture;
        synchronized (this.mSessionLock) {
            if (this.mState != State.OPENED) {
                Logger.d(TAG, "Skipping issueBurstCaptureRequest due to session closed");
                return -1;
            }
            if (captureConfigs.isEmpty()) {
                return -1;
            }
            try {
                callbackAggregator = new CameraBurstCaptureCallback();
                captureRequests = new ArrayList<>();
                isStillCapture = false;
                Logger.d(TAG, "Issuing capture request.");
                for (CaptureConfig captureConfig : captureConfigs) {
                    if (captureConfig.getSurfaces().isEmpty()) {
                        Logger.d(TAG, "Skipping issuing empty capture request.");
                    } else {
                        boolean surfacesValid = true;
                        Iterator<DeferrableSurface> it = captureConfig.getSurfaces().iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            }
                            DeferrableSurface surface = it.next();
                            if (!this.mConfiguredSurfaceMap.containsKey(surface)) {
                                Logger.d(TAG, "Skipping capture request with invalid surface: " + surface);
                                surfacesValid = false;
                                break;
                            }
                        }
                        if (surfacesValid) {
                            if (captureConfig.getTemplateType() == 2) {
                                isStillCapture = true;
                            }
                            CaptureConfig.Builder captureConfigBuilder = CaptureConfig.Builder.from(captureConfig);
                            if (captureConfig.getTemplateType() == 5 && captureConfig.getCameraCaptureResult() != null) {
                                captureConfigBuilder.setCameraCaptureResult(captureConfig.getCameraCaptureResult());
                            }
                            if (this.mSessionConfig != null) {
                                captureConfigBuilder.addImplementationOptions(this.mSessionConfig.getRepeatingCaptureConfig().getImplementationOptions());
                            }
                            captureConfigBuilder.addImplementationOptions(captureConfig.getImplementationOptions());
                            CaptureRequest captureRequest = Camera2CaptureRequestBuilder.build(captureConfigBuilder.build(), this.mSynchronizedCaptureSession.getDevice(), this.mConfiguredSurfaceMap, false, this.mTemplateParamsOverride);
                            if (captureRequest == null) {
                                Logger.d(TAG, "Skipping issuing request without surface.");
                                return -1;
                            }
                            List<CameraCaptureSession.CaptureCallback> cameraCallbacks = new ArrayList<>();
                            for (CameraCaptureCallback callback : captureConfig.getCameraCaptureCallbacks()) {
                                CaptureCallbackConverter.toCaptureCallback(callback, cameraCallbacks);
                            }
                            callbackAggregator.addCamera2Callbacks(captureRequest, cameraCallbacks);
                            captureRequests.add(captureRequest);
                        }
                    }
                }
            } catch (CameraAccessException e) {
                Logger.e(TAG, "Unable to access camera: " + e.getMessage());
                Thread.dumpStack();
            }
            if (!captureRequests.isEmpty()) {
                if (this.mStillCaptureFlow.shouldStopRepeatingBeforeCapture(captureRequests, isStillCapture)) {
                    this.mSynchronizedCaptureSession.stopRepeating();
                    callbackAggregator.setCaptureSequenceCallback(new CameraBurstCaptureCallback.CaptureSequenceCallback() { // from class: androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda0
                        @Override // androidx.camera.camera2.internal.CameraBurstCaptureCallback.CaptureSequenceCallback
                        public final void onCaptureSequenceCompletedOrAborted(CameraCaptureSession cameraCaptureSession, int i, boolean z) {
                            CaptureSession.this.m57xac56a034(cameraCaptureSession, i, z);
                        }
                    });
                }
                if (this.mTorchStateReset.isTorchResetRequired(captureRequests, isStillCapture)) {
                    callbackAggregator.addCamera2Callbacks(captureRequests.get(captureRequests.size() - 1), Collections.singletonList(new CameraCaptureSession.CaptureCallback() { // from class: androidx.camera.camera2.internal.CaptureSession.2
                        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
                        public void onCaptureCompleted(CameraCaptureSession session, CaptureRequest request, TotalCaptureResult result) {
                            synchronized (CaptureSession.this.mSessionLock) {
                                if (CaptureSession.this.mSessionConfig == null) {
                                    return;
                                }
                                CaptureConfig repeatingConfig = CaptureSession.this.mSessionConfig.getRepeatingCaptureConfig();
                                Logger.d(CaptureSession.TAG, "Submit FLASH_MODE_OFF request");
                                CaptureSession.this.issueCaptureRequests(Collections.singletonList(CaptureSession.this.mTorchStateReset.createTorchResetRequest(repeatingConfig)));
                            }
                        }
                    }));
                }
                if (this.mCaptureRequestConfigurator != null) {
                    Iterator<CaptureRequest> it2 = captureRequests.iterator();
                    while (it2.hasNext()) {
                        this.mCaptureRequestConfigurator.configureWith(it2.next());
                    }
                }
                if (this.mSessionConfig != null && this.mSessionConfig.getSessionType() == 1) {
                    return captureHighSpeedBurst(captureRequests, callbackAggregator);
                }
                return this.mSynchronizedCaptureSession.captureBurstRequests(captureRequests, callbackAggregator);
            }
            Logger.d(TAG, "Skipping issuing burst request due to no valid request elements");
            return -1;
        }
    }

    /* renamed from: lambda$issueBurstCaptureRequest$3$androidx-camera-camera2-internal-CaptureSession, reason: not valid java name */
    /* synthetic */ void m57xac56a034(CameraCaptureSession session, int sequenceId, boolean isAborted) {
        synchronized (this.mSessionLock) {
            if (this.mState == State.OPENED) {
                issueRepeatingCaptureRequests(this.mSessionConfig);
            }
        }
    }

    private int captureHighSpeedBurst(List<CaptureRequest> captureRequests, CameraBurstCaptureCallback callbackAggregator) throws CameraAccessException {
        CameraBurstCaptureCallback highSpeedCallbackAggregator = new CameraBurstCaptureCallback();
        int sequenceId = -1;
        for (CaptureRequest captureRequest : captureRequests) {
            List<CaptureRequest> highSpeedRequests = ((SynchronizedCaptureSession) Objects.requireNonNull(this.mSynchronizedCaptureSession)).createHighSpeedRequestList(captureRequest);
            for (CaptureRequest highSpeedRequest : highSpeedRequests) {
                CameraCaptureSession.CaptureCallback forwardingCallback = new RequestForwardingCaptureCallback(captureRequest, callbackAggregator);
                highSpeedCallbackAggregator.addCamera2Callbacks(highSpeedRequest, Collections.singletonList(forwardingCallback));
            }
            sequenceId = this.mSynchronizedCaptureSession.captureBurstRequests(highSpeedRequests, highSpeedCallbackAggregator);
        }
        return sequenceId;
    }

    void abortCaptures() {
        synchronized (this.mSessionLock) {
            if (this.mState != State.OPENED) {
                Logger.e(TAG, "Unable to abort captures. Incorrect state:" + this.mState);
                return;
            }
            try {
                this.mSynchronizedCaptureSession.abortCaptures();
            } catch (CameraAccessException e) {
                Logger.e(TAG, "Unable to abort captures.", e);
            }
        }
    }

    void stopRepeating() {
        synchronized (this.mSessionLock) {
            if (this.mState != State.OPENED) {
                Logger.e(TAG, "Unable to stop repeating. Incorrect state:" + this.mState);
                return;
            }
            try {
                this.mSynchronizedCaptureSession.stopRepeating();
            } catch (CameraAccessException e) {
                Logger.e(TAG, "Unable to stop repeating.", e);
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void cancelIssuedCaptureRequests() {
        List<CaptureConfig> captureConfigs = null;
        synchronized (this.mSessionLock) {
            if (!this.mCaptureConfigs.isEmpty()) {
                captureConfigs = new ArrayList<>(this.mCaptureConfigs);
                this.mCaptureConfigs.clear();
            }
        }
        if (captureConfigs != null) {
            for (CaptureConfig captureConfig : captureConfigs) {
                for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                    cameraCaptureCallback.onCaptureCancelled(captureConfig.getId());
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setState(State state) {
        if (state.ordinal() > this.mHighestState.ordinal()) {
            this.mHighestState = state;
        }
        this.mState = state;
        if (Trace.isEnabled() && this.mHighestState.ordinal() >= State.GET_SURFACE.ordinal()) {
            String counterName = "CX:C2State[" + String.format("CaptureSession@%x", Integer.valueOf(hashCode())) + "]";
            Trace.setCounter(counterName, state.ordinal());
        }
    }

    private CameraCaptureSession.CaptureCallback createCamera2CaptureCallback(List<CameraCaptureCallback> cameraCaptureCallbacks, CameraCaptureSession.CaptureCallback... additionalCallbacks) {
        List<CameraCaptureSession.CaptureCallback> camera2Callbacks = new ArrayList<>(cameraCaptureCallbacks.size() + additionalCallbacks.length);
        for (CameraCaptureCallback callback : cameraCaptureCallbacks) {
            camera2Callbacks.add(CaptureCallbackConverter.toCaptureCallback(callback));
        }
        Collections.addAll(camera2Callbacks, additionalCallbacks);
        return Camera2CaptureCallbacks.createComboCallback(camera2Callbacks);
    }

    private static Map<Integer, List<SessionConfig.OutputConfig>> groupMrirOutputConfigs(Collection<SessionConfig.OutputConfig> outputConfigs) {
        Map<Integer, List<SessionConfig.OutputConfig>> groupResult = new HashMap<>();
        for (SessionConfig.OutputConfig outputConfig : outputConfigs) {
            if (outputConfig.getSurfaceGroupId() > 0 && outputConfig.getSharedSurfaces().isEmpty()) {
                List<SessionConfig.OutputConfig> groupedOutputConfigs = groupResult.get(Integer.valueOf(outputConfig.getSurfaceGroupId()));
                if (groupedOutputConfigs == null) {
                    groupedOutputConfigs = new ArrayList<>();
                    groupResult.put(Integer.valueOf(outputConfig.getSurfaceGroupId()), groupedOutputConfigs);
                }
                groupedOutputConfigs.add(outputConfig);
            }
        }
        Map<Integer, List<SessionConfig.OutputConfig>> mrirGroupResult = new HashMap<>();
        Iterator<Integer> it = groupResult.keySet().iterator();
        while (it.hasNext()) {
            int groupId = it.next().intValue();
            if (groupResult.get(Integer.valueOf(groupId)).size() >= 2) {
                mrirGroupResult.put(Integer.valueOf(groupId), groupResult.get(Integer.valueOf(groupId)));
            }
        }
        return mrirGroupResult;
    }

    private static Map<SessionConfig.OutputConfig, OutputConfigurationCompat> createMultiResolutionOutputConfigurationCompats(Map<Integer, List<SessionConfig.OutputConfig>> groupIdToOutputConfigsMap, Map<DeferrableSurface, Surface> configuredSurfaceMap) {
        Map<SessionConfig.OutputConfig, OutputConfigurationCompat> outputConfigToOutputConfigurationCompatMap = new HashMap<>();
        Iterator<Integer> it = groupIdToOutputConfigsMap.keySet().iterator();
        while (it.hasNext()) {
            int groupId = it.next().intValue();
            List<MultiResolutionStreamInfo> streamInfos = new ArrayList<>();
            int imageFormat = 0;
            for (SessionConfig.OutputConfig outputConfig : groupIdToOutputConfigsMap.get(Integer.valueOf(groupId))) {
                Surface surface = configuredSurfaceMap.get(outputConfig.getSurface());
                SurfaceUtil.SurfaceInfo surfaceInfo = SurfaceUtil.getSurfaceInfo(surface);
                if (imageFormat == 0) {
                    imageFormat = surfaceInfo.format;
                }
                streamInfos.add(new MultiResolutionStreamInfo(surfaceInfo.width, surfaceInfo.height, (String) Objects.requireNonNull(outputConfig.getPhysicalCameraId())));
            }
            if (imageFormat == 0 || streamInfos.isEmpty()) {
                Logger.e(TAG, "Skips to create instances for multi-resolution output. imageFormat: " + imageFormat + ", streamInfos size: " + streamInfos.size());
            } else {
                List<OutputConfiguration> outputConfigurations = OutputConfiguration.createInstancesForMultiResolutionOutput(streamInfos, imageFormat);
                if (outputConfigurations != null) {
                    for (SessionConfig.OutputConfig outputConfig2 : groupIdToOutputConfigsMap.get(Integer.valueOf(groupId))) {
                        OutputConfiguration outputConfiguration = outputConfigurations.remove(0);
                        Surface surface2 = configuredSurfaceMap.get(outputConfig2.getSurface());
                        outputConfiguration.addSurface(surface2);
                        outputConfigToOutputConfigurationCompatMap.put(outputConfig2, new OutputConfigurationCompat(outputConfiguration));
                    }
                }
            }
        }
        return outputConfigToOutputConfigurationCompatMap;
    }

    final class StateCallback extends SynchronizedCaptureSession.StateCallback {
        StateCallback() {
        }

        @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
        public void onConfigured(SynchronizedCaptureSession session) {
            synchronized (CaptureSession.this.mSessionLock) {
                switch (CaptureSession.this.mState) {
                    case UNINITIALIZED:
                    case RELEASED:
                    case INITIALIZED:
                    case GET_SURFACE:
                    case OPENED:
                        throw new IllegalStateException("onConfigured() should not be possible in state: " + CaptureSession.this.mState);
                    case RELEASING:
                        session.close();
                        break;
                    case CLOSED:
                        CaptureSession.this.mSynchronizedCaptureSession = session;
                        break;
                    case OPENING:
                        CaptureSession.this.setState(State.OPENED);
                        CaptureSession.this.mSynchronizedCaptureSession = session;
                        Logger.d(CaptureSession.TAG, "Attempting to send capture request onConfigured");
                        CaptureSession.this.issueRepeatingCaptureRequests(CaptureSession.this.mSessionConfig);
                        CaptureSession.this.issuePendingCaptureRequest();
                        break;
                }
                Logger.d(CaptureSession.TAG, "CameraCaptureSession.onConfigured() mState=" + CaptureSession.this.mState);
            }
        }

        @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
        public void onReady(SynchronizedCaptureSession session) {
            synchronized (CaptureSession.this.mSessionLock) {
                switch (CaptureSession.this.mState) {
                    case UNINITIALIZED:
                        throw new IllegalStateException("onReady() should not be possible in state: " + CaptureSession.this.mState);
                    default:
                        Logger.d(CaptureSession.TAG, "CameraCaptureSession.onReady() " + CaptureSession.this.mState);
                        break;
                }
            }
        }

        @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
        public void onSessionFinished(SynchronizedCaptureSession session) {
            synchronized (CaptureSession.this.mSessionLock) {
                if (CaptureSession.this.mState == State.UNINITIALIZED) {
                    throw new IllegalStateException("onSessionFinished() should not be possible in state: " + CaptureSession.this.mState);
                }
                Logger.d(CaptureSession.TAG, "onSessionFinished()");
                CaptureSession.this.finishClose();
            }
        }

        @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
        public void onConfigureFailed(SynchronizedCaptureSession session) {
            synchronized (CaptureSession.this.mSessionLock) {
                switch (CaptureSession.this.mState) {
                    case UNINITIALIZED:
                    case INITIALIZED:
                    case GET_SURFACE:
                    case OPENED:
                        throw new IllegalStateException("onConfigureFailed() should not be possible in state: " + CaptureSession.this.mState);
                    case RELEASED:
                        Logger.d(CaptureSession.TAG, "ConfigureFailed callback after change to RELEASED state");
                        break;
                    case RELEASING:
                    case CLOSED:
                    case OPENING:
                        CaptureSession.this.finishClose();
                        break;
                }
                Logger.e(CaptureSession.TAG, "CameraCaptureSession.onConfigureFailed() " + CaptureSession.this.mState);
            }
        }
    }
}
