package androidx.camera.core;

import android.content.ComponentCallbacks2;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.util.SparseArray;
import androidx.arch.core.util.Function;
import androidx.camera.core.CameraXConfig;
import androidx.camera.core.RetryPolicy;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.impl.CameraDeviceSurfaceManager;
import androidx.camera.core.impl.CameraFactory;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CameraPresenceProvider;
import androidx.camera.core.impl.CameraProviderExecutionState;
import androidx.camera.core.impl.CameraRepository;
import androidx.camera.core.impl.CameraThreadConfig;
import androidx.camera.core.impl.CameraValidator;
import androidx.camera.core.impl.MetadataHolderService;
import androidx.camera.core.impl.QuirkSettings;
import androidx.camera.core.impl.QuirkSettingsHolder;
import androidx.camera.core.impl.QuirkSettingsLoader;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.ContextUtil;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.StreamSpecsCalculator;
import androidx.camera.core.internal.StreamSpecsCalculatorImpl;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.os.HandlerCompat;
import androidx.core.util.Preconditions;
import androidx.tracing.Trace;
import com.google.common.util.concurrent.ListenableFuture;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class CameraX {
    private static final String RETRY_TOKEN = "retry_token";
    private static final String TAG = "CameraX";
    private final Executor mCameraExecutor;
    private CameraFactory mCameraFactory;
    private final CameraPresenceProvider mCameraPresenceProvider;
    final CameraRepository mCameraRepository;
    private CameraUseCaseAdapterProvider mCameraUseCaseAdapterProvider;
    private final CameraXConfig mCameraXConfig;
    private final int mConfigImplType;
    private UseCaseConfigFactory mDefaultConfigFactory;
    private final ListenableFuture<Void> mInitInternalFuture;
    private InternalInitState mInitState;
    private final Object mInitializeLock;
    private final Integer mMinLogLevel;
    private final RetryPolicy mRetryPolicy;
    private final Handler mSchedulerHandler;
    private final HandlerThread mSchedulerThread;
    private ListenableFuture<Void> mShutdownInternalFuture;
    private StreamSpecsCalculator mStreamSpecsCalculator;
    private CameraDeviceSurfaceManager mSurfaceManager;
    private static final Object MIN_LOG_LEVEL_LOCK = new Object();
    private static final SparseArray<Integer> sMinLogLevelReferenceCountMap = new SparseArray<>();

    private enum InternalInitState {
        UNINITIALIZED,
        INITIALIZING,
        INITIALIZING_ERROR,
        INITIALIZED,
        SHUTDOWN
    }

    public CameraX(Context context, CameraXConfig.Provider configProvider) {
        this(context, configProvider, new QuirkSettingsLoader());
    }

    CameraX(Context context, CameraXConfig.Provider configProvider, Function<Context, QuirkSettings> quirkSettingsLoader) {
        this.mCameraRepository = new CameraRepository();
        this.mInitializeLock = new Object();
        this.mInitState = InternalInitState.UNINITIALIZED;
        this.mShutdownInternalFuture = Futures.immediateFuture(null);
        if (configProvider != null) {
            this.mCameraXConfig = configProvider.getCameraXConfig();
        } else {
            CameraXConfig.Provider provider = getConfigProvider(context);
            if (provider == null) {
                throw new IllegalStateException("CameraX is not configured properly. The most likely cause is you did not include a default implementation in your build such as 'camera-camera2'.");
            }
            this.mCameraXConfig = provider.getCameraXConfig();
        }
        updateQuirkSettings(context, this.mCameraXConfig.getQuirkSettings(), quirkSettingsLoader);
        this.mConfigImplType = this.mCameraXConfig.getConfigImplType();
        Executor executor = this.mCameraXConfig.getCameraExecutor(null);
        Handler schedulerHandler = this.mCameraXConfig.getSchedulerHandler(null);
        this.mCameraExecutor = executor == null ? new CameraExecutor() : executor;
        if (schedulerHandler == null) {
            this.mSchedulerThread = new HandlerThread("CameraX-scheduler", 10);
            this.mSchedulerThread.start();
            this.mSchedulerHandler = HandlerCompat.createAsync(this.mSchedulerThread.getLooper());
        } else {
            this.mSchedulerThread = null;
            this.mSchedulerHandler = schedulerHandler;
        }
        this.mMinLogLevel = (Integer) this.mCameraXConfig.retrieveOption(CameraXConfig.OPTION_MIN_LOGGING_LEVEL, null);
        increaseMinLogLevelReference(this.mMinLogLevel);
        this.mRetryPolicy = new RetryPolicy.Builder(this.mCameraXConfig.getCameraProviderInitRetryPolicy()).build();
        this.mCameraPresenceProvider = new CameraPresenceProvider(this.mCameraExecutor);
        this.mInitInternalFuture = initInternal(context);
    }

    public CameraFactory getCameraFactory() {
        if (this.mCameraFactory == null) {
            throw new IllegalStateException("CameraX not initialized yet.");
        }
        return this.mCameraFactory;
    }

    private static CameraXConfig.Provider getConfigProvider(Context context) {
        ComponentCallbacks2 applicationFromContext = ContextUtil.getApplicationFromContext(context);
        if (applicationFromContext instanceof CameraXConfig.Provider) {
            CameraXConfig.Provider configProvider = (CameraXConfig.Provider) applicationFromContext;
            return configProvider;
        }
        try {
            Context appContext = ContextUtil.getApplicationContext(context);
            ServiceInfo serviceInfo = appContext.getPackageManager().getServiceInfo(new ComponentName(appContext, (Class<?>) MetadataHolderService.class), 640);
            String defaultProviderClassName = null;
            if (serviceInfo.metaData != null) {
                defaultProviderClassName = serviceInfo.metaData.getString("androidx.camera.core.impl.MetadataHolderService.DEFAULT_CONFIG_PROVIDER");
            }
            if (defaultProviderClassName == null) {
                Logger.e(TAG, "No default CameraXConfig.Provider specified in meta-data. The most likely cause is you did not include a default implementation in your build such as 'camera-camera2'.");
                return null;
            }
            Class<?> providerClass = Class.forName(defaultProviderClassName);
            CameraXConfig.Provider configProvider2 = (CameraXConfig.Provider) providerClass.getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
            return configProvider2;
        } catch (PackageManager.NameNotFoundException | ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | NullPointerException | InvocationTargetException e) {
            Logger.e(TAG, "Failed to retrieve default CameraXConfig.Provider from meta-data", e);
            return null;
        }
    }

    private static void updateQuirkSettings(Context context, QuirkSettings cameraXConfigQuirkSettings, Function<Context, QuirkSettings> quirkSettingsLoader) {
        QuirkSettings quirkSettings;
        if (cameraXConfigQuirkSettings != null) {
            quirkSettings = cameraXConfigQuirkSettings;
            Logger.d(TAG, "QuirkSettings from CameraXConfig: " + quirkSettings);
        } else {
            quirkSettings = quirkSettingsLoader.apply(context);
            Logger.d(TAG, "QuirkSettings from app metadata: " + quirkSettings);
        }
        if (quirkSettings == null) {
            quirkSettings = QuirkSettingsHolder.DEFAULT;
            Logger.d(TAG, "QuirkSettings by default: " + quirkSettings);
        }
        QuirkSettingsHolder.instance().set(quirkSettings);
    }

    public int getConfigImplType() {
        return this.mConfigImplType;
    }

    public CameraDeviceSurfaceManager getCameraDeviceSurfaceManager() {
        if (this.mSurfaceManager == null) {
            throw new IllegalStateException("CameraX not initialized yet.");
        }
        return this.mSurfaceManager;
    }

    public CameraUseCaseAdapterProvider getCameraUseCaseAdapterProvider() {
        if (this.mCameraUseCaseAdapterProvider == null) {
            throw new IllegalStateException("CameraX not initialized yet.");
        }
        return this.mCameraUseCaseAdapterProvider;
    }

    public CameraRepository getCameraRepository() {
        return this.mCameraRepository;
    }

    public UseCaseConfigFactory getDefaultConfigFactory() {
        if (this.mDefaultConfigFactory == null) {
            throw new IllegalStateException("CameraX not initialized yet.");
        }
        return this.mDefaultConfigFactory;
    }

    public StreamSpecsCalculator getStreamSpecsCalculator() {
        if (this.mStreamSpecsCalculator == null) {
            throw new IllegalStateException("CameraX not initialized yet.");
        }
        return this.mStreamSpecsCalculator;
    }

    public ListenableFuture<Void> getInitializeFuture() {
        return this.mInitInternalFuture;
    }

    public ListenableFuture<Void> shutdown() {
        return shutdownInternal();
    }

    private ListenableFuture<Void> initInternal(final Context context) {
        ListenableFuture<Void> future;
        synchronized (this.mInitializeLock) {
            Preconditions.checkState(this.mInitState == InternalInitState.UNINITIALIZED, "CameraX.initInternal() should only be called once per instance");
            this.mInitState = InternalInitState.INITIALIZING;
            future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda3
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return CameraX.this.m144lambda$initInternal$0$androidxcameracoreCameraX(context, completer);
                }
            });
        }
        return future;
    }

    /* renamed from: lambda$initInternal$0$androidx-camera-core-CameraX, reason: not valid java name */
    /* synthetic */ Object m144lambda$initInternal$0$androidxcameracoreCameraX(Context context, CallbackToFutureAdapter.Completer completer) throws Exception {
        initAndRetryRecursively(this.mCameraExecutor, SystemClock.elapsedRealtime(), 1, context, completer);
        return "CameraX initInternal";
    }

    public CameraPresenceProvider getCameraAvailabilityProvider() {
        return this.mCameraPresenceProvider;
    }

    private void initAndRetryRecursively(final Executor cameraExecutor, final long startMs, final int attemptCount, final Context context, final CallbackToFutureAdapter.Completer<Void> completer) {
        cameraExecutor.execute(new Runnable() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                CameraX.this.m143lambda$initAndRetryRecursively$2$androidxcameracoreCameraX(context, cameraExecutor, attemptCount, completer, startMs);
            }
        });
    }

    /* renamed from: lambda$initAndRetryRecursively$2$androidx-camera-core-CameraX, reason: not valid java name */
    /* synthetic */ void m143lambda$initAndRetryRecursively$2$androidxcameracoreCameraX(Context context, final Executor cameraExecutor, final int attemptCount, final CallbackToFutureAdapter.Completer completer, final long startMs) {
        CameraFactory.Provider cameraFactoryProvider;
        Trace.beginSection("CX:initAndRetryRecursively");
        final Context appContext = ContextUtil.getApplicationContext(context);
        try {
            try {
                cameraFactoryProvider = this.mCameraXConfig.getCameraFactoryProvider(null);
            } catch (Throwable th) {
                th = th;
                Trace.endSection();
                throw th;
            }
        } catch (InitializationException | CameraValidator.CameraIdListIncorrectException | RuntimeException e) {
            RetryPolicy.ExecutionState executionState = new CameraProviderExecutionState(startMs, attemptCount, e);
            RetryPolicy.RetryConfig retryConfig = this.mRetryPolicy.onRetryDecisionRequested(executionState);
            traceExecutionState(executionState);
            this.mCameraPresenceProvider.shutdown();
            if (!retryConfig.shouldRetry() || attemptCount >= Integer.MAX_VALUE) {
                synchronized (this.mInitializeLock) {
                    this.mInitState = InternalInitState.INITIALIZING_ERROR;
                }
                if (retryConfig.shouldCompleteWithoutFailure()) {
                    setStateToInitialized();
                    completer.set(null);
                } else if (e instanceof CameraValidator.CameraIdListIncorrectException) {
                    String message = "Device reporting less cameras than anticipated. On real devices: Retrying initialization might resolve temporary camera errors. On emulators: Ensure virtual camera configuration matches supported camera features as reported by PackageManager#hasSystemFeature. Available cameras: " + ((CameraValidator.CameraIdListIncorrectException) e).getAvailableCameraCount();
                    Logger.e(TAG, message, e);
                    completer.setException(new InitializationException(new CameraUnavailableException(3, message)));
                } else if (e instanceof InitializationException) {
                    completer.setException(e);
                } else {
                    completer.setException(new InitializationException(e));
                }
            } else {
                Logger.w(TAG, "Retry init. Start time " + startMs + " current time " + SystemClock.elapsedRealtime(), e);
                try {
                    HandlerCompat.postDelayed(this.mSchedulerHandler, new Runnable() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda1
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraX.this.m142lambda$initAndRetryRecursively$1$androidxcameracoreCameraX(cameraExecutor, startMs, attemptCount, appContext, completer);
                        }
                    }, RETRY_TOKEN, retryConfig.getRetryDelayInMillis());
                } catch (Throwable th2) {
                    th = th2;
                    Trace.endSection();
                    throw th;
                }
            }
        }
        if (cameraFactoryProvider == null) {
            throw new InitializationException(new IllegalArgumentException("Invalid app configuration provided. Missing CameraFactory."));
        }
        CameraThreadConfig cameraThreadConfig = CameraThreadConfig.create(this.mCameraExecutor, this.mSchedulerHandler);
        CameraSelector availableCamerasLimiter = this.mCameraXConfig.getAvailableCamerasLimiter(null);
        long cameraOpenRetryMaxTimeoutInMillis = this.mCameraXConfig.getCameraOpenRetryMaxTimeoutInMillisWhileResuming();
        UseCaseConfigFactory.Provider configFactoryProvider = this.mCameraXConfig.getUseCaseConfigFactoryProvider(null);
        if (configFactoryProvider == null) {
            throw new InitializationException(new IllegalArgumentException("Invalid app configuration provided. Missing UseCaseConfigFactory."));
        }
        this.mDefaultConfigFactory = configFactoryProvider.newInstance(appContext);
        this.mStreamSpecsCalculator = new StreamSpecsCalculatorImpl(this.mDefaultConfigFactory, null);
        this.mCameraFactory = cameraFactoryProvider.newInstance(appContext, cameraThreadConfig, availableCamerasLimiter, cameraOpenRetryMaxTimeoutInMillis, this.mCameraXConfig, this.mStreamSpecsCalculator);
        CameraDeviceSurfaceManager.Provider surfaceManagerProvider = this.mCameraXConfig.getDeviceSurfaceManagerProvider(null);
        if (surfaceManagerProvider == null) {
            throw new InitializationException(new IllegalArgumentException("Invalid app configuration provided. Missing CameraDeviceSurfaceManager."));
        }
        this.mSurfaceManager = surfaceManagerProvider.newInstance(appContext, this.mCameraFactory.getCameraManager(), this.mCameraFactory.getAvailableCameraIds());
        this.mStreamSpecsCalculator.setCameraDeviceSurfaceManager(this.mSurfaceManager);
        if (cameraExecutor instanceof CameraExecutor) {
            CameraExecutor executor = (CameraExecutor) cameraExecutor;
            executor.init(this.mCameraFactory);
        }
        this.mCameraRepository.init(this.mCameraFactory);
        CameraCoordinator cameraCoordinator = this.mCameraFactory.getCameraCoordinator();
        cameraCoordinator.init(this.mCameraRepository);
        this.mCameraUseCaseAdapterProvider = new CameraUseCaseAdapterProviderImpl(this.mCameraRepository, cameraCoordinator, this.mDefaultConfigFactory, this.mStreamSpecsCalculator);
        Iterator<CameraInternal> it = this.mCameraRepository.getCameras().iterator();
        while (it.hasNext()) {
            CameraInternal camera = it.next();
            camera.getCameraInfoInternal().setCameraUseCaseAdapterProvider(this.mCameraUseCaseAdapterProvider);
        }
        this.mCameraPresenceProvider.startup(this.mCameraFactory, this.mCameraRepository);
        this.mCameraPresenceProvider.addDependentInternalListener(this.mSurfaceManager);
        this.mCameraPresenceProvider.addDependentInternalListener(this.mCameraFactory.getCameraCoordinator());
        CameraValidator.validateCameras(appContext, this.mCameraRepository, availableCamerasLimiter);
        if (attemptCount > 1) {
            traceExecutionState(null);
        }
        setStateToInitialized();
        completer.set(null);
        Trace.endSection();
    }

    /* renamed from: lambda$initAndRetryRecursively$1$androidx-camera-core-CameraX, reason: not valid java name */
    /* synthetic */ void m142lambda$initAndRetryRecursively$1$androidxcameracoreCameraX(Executor cameraExecutor, long startMs, int attemptCount, Context appContext, CallbackToFutureAdapter.Completer completer) {
        initAndRetryRecursively(cameraExecutor, startMs, attemptCount + 1, appContext, completer);
    }

    private void setStateToInitialized() {
        synchronized (this.mInitializeLock) {
            this.mInitState = InternalInitState.INITIALIZED;
        }
    }

    private ListenableFuture<Void> shutdownInternal() {
        synchronized (this.mInitializeLock) {
            this.mSchedulerHandler.removeCallbacksAndMessages(RETRY_TOKEN);
            switch (this.mInitState) {
                case UNINITIALIZED:
                    this.mInitState = InternalInitState.SHUTDOWN;
                    return Futures.immediateFuture(null);
                case INITIALIZING:
                    throw new IllegalStateException("CameraX could not be shutdown when it is initializing.");
                case INITIALIZING_ERROR:
                case INITIALIZED:
                    this.mInitState = InternalInitState.SHUTDOWN;
                    decreaseMinLogLevelReference(this.mMinLogLevel);
                    this.mShutdownInternalFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda4
                        @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                        public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                            return CameraX.this.m146lambda$shutdownInternal$4$androidxcameracoreCameraX(completer);
                        }
                    });
                    break;
            }
            return this.mShutdownInternalFuture;
        }
    }

    /* renamed from: lambda$shutdownInternal$4$androidx-camera-core-CameraX, reason: not valid java name */
    /* synthetic */ Object m146lambda$shutdownInternal$4$androidxcameracoreCameraX(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mCameraPresenceProvider.shutdown();
        ListenableFuture<Void> future = this.mCameraRepository.deinit();
        future.addListener(new Runnable() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CameraX.this.m145lambda$shutdownInternal$3$androidxcameracoreCameraX(completer);
            }
        }, this.mCameraExecutor);
        return "CameraX shutdownInternal";
    }

    /* renamed from: lambda$shutdownInternal$3$androidx-camera-core-CameraX, reason: not valid java name */
    /* synthetic */ void m145lambda$shutdownInternal$3$androidxcameracoreCameraX(CallbackToFutureAdapter.Completer completer) {
        this.mCameraFactory.shutdown();
        if (this.mSchedulerThread != null) {
            if (this.mCameraExecutor instanceof CameraExecutor) {
                CameraExecutor executor = (CameraExecutor) this.mCameraExecutor;
                executor.deinit();
            }
            this.mSchedulerThread.quit();
        }
        completer.set(null);
    }

    boolean isInitialized() {
        boolean z;
        synchronized (this.mInitializeLock) {
            z = this.mInitState == InternalInitState.INITIALIZED;
        }
        return z;
    }

    private static void increaseMinLogLevelReference(Integer minLogLevel) {
        synchronized (MIN_LOG_LEVEL_LOCK) {
            if (minLogLevel == null) {
                return;
            }
            Preconditions.checkArgumentInRange(minLogLevel.intValue(), 3, 6, "minLogLevel");
            int refCount = 1;
            if (sMinLogLevelReferenceCountMap.get(minLogLevel.intValue()) != null) {
                refCount = sMinLogLevelReferenceCountMap.get(minLogLevel.intValue()).intValue() + 1;
            }
            sMinLogLevelReferenceCountMap.put(minLogLevel.intValue(), Integer.valueOf(refCount));
            updateOrResetMinLogLevel();
        }
    }

    private static void decreaseMinLogLevelReference(Integer minLogLevel) {
        synchronized (MIN_LOG_LEVEL_LOCK) {
            if (minLogLevel == null) {
                return;
            }
            int refCount = sMinLogLevelReferenceCountMap.get(minLogLevel.intValue()).intValue() - 1;
            if (refCount == 0) {
                sMinLogLevelReferenceCountMap.remove(minLogLevel.intValue());
            } else {
                sMinLogLevelReferenceCountMap.put(minLogLevel.intValue(), Integer.valueOf(refCount));
            }
            updateOrResetMinLogLevel();
        }
    }

    private static void updateOrResetMinLogLevel() {
        if (sMinLogLevelReferenceCountMap.size() == 0) {
            Logger.resetMinLogLevel();
            return;
        }
        if (sMinLogLevelReferenceCountMap.get(3) != null) {
            Logger.setMinLogLevel(3);
            return;
        }
        if (sMinLogLevelReferenceCountMap.get(4) != null) {
            Logger.setMinLogLevel(4);
        } else if (sMinLogLevelReferenceCountMap.get(5) != null) {
            Logger.setMinLogLevel(5);
        } else if (sMinLogLevelReferenceCountMap.get(6) != null) {
            Logger.setMinLogLevel(6);
        }
    }

    private void traceExecutionState(RetryPolicy.ExecutionState state) {
        if (Trace.isEnabled()) {
            int status = state != null ? state.getStatus() : -1;
            Trace.setCounter("CX:CameraProvider-RetryStatus", status);
        }
    }
}
