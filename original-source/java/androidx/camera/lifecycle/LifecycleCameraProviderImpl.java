package androidx.camera.lifecycle;

import android.content.Context;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraFilter;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraInfoUnavailableException;
import androidx.camera.core.CameraPresenceListener;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraX;
import androidx.camera.core.CameraXConfig;
import androidx.camera.core.CompositionSettings;
import androidx.camera.core.LegacySessionConfig;
import androidx.camera.core.Preview;
import androidx.camera.core.SessionConfig;
import androidx.camera.core.UseCase;
import androidx.camera.core.UseCaseGroup;
import androidx.camera.core.impl.AdapterCameraInfo;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraConfigProvider;
import androidx.camera.core.impl.CameraConfigs;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.ExtendedCameraConfigProviderStore;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.ContextUtil;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.lifecycle.LifecycleCameraRepository;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LifecycleOwner;
import androidx.tracing.Trace;
import com.google.android.gms.common.internal.ServiceSpecificExtraArgs;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: LifecycleCameraProviderImpl.kt */
@Metadata(d1 = {"\u0000à\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\n\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J'\u0010,\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000e2\u0006\u0010\u0017\u001a\u00020\u00182\n\b\u0002\u0010-\u001a\u0004\u0018\u00010.H\u0000¢\u0006\u0002\b/J\u0015\u00100\u001a\u0002012\u0006\u0010-\u001a\u00020.H\u0000¢\u0006\u0002\b2J\u001d\u00103\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000e2\b\b\u0002\u00104\u001a\u000205H\u0000¢\u0006\u0002\b6J\u0010\u00107\u001a\u0002052\u0006\u00108\u001a\u000209H\u0016J\u0010\u00107\u001a\u0002052\u0006\u0010:\u001a\u00020;H\u0016J%\u0010<\u001a\u0002012\u0016\u0010=\u001a\f\u0012\b\b\u0001\u0012\u0004\u0018\u0001090>\"\u0004\u0018\u000109H\u0017¢\u0006\u0002\u0010?J\u0010\u0010<\u001a\u0002012\u0006\u0010:\u001a\u00020;H\u0017J\b\u0010@\u001a\u000201H\u0017J\u0010\u0010A\u001a\u0002052\u0006\u0010B\u001a\u00020CH\u0016J5\u0010D\u001a\u00020E2\u0006\u0010F\u001a\u00020G2\u0006\u0010B\u001a\u00020C2\u0016\u0010=\u001a\f\u0012\b\b\u0001\u0012\u0004\u0018\u0001090>\"\u0004\u0018\u000109H\u0017¢\u0006\u0002\u0010HJ \u0010D\u001a\u00020E2\u0006\u0010F\u001a\u00020G2\u0006\u0010B\u001a\u00020C2\u0006\u0010I\u001a\u00020JH\u0017J \u0010D\u001a\u00020E2\u0006\u0010F\u001a\u00020G2\u0006\u0010B\u001a\u00020C2\u0006\u0010:\u001a\u00020;H\u0017J\u0018\u0010D\u001a\u00020K2\u000e\u0010L\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010N0MH\u0017J@\u0010W\u001a\u00020E2\u0006\u0010F\u001a\u00020G2\u0006\u0010X\u001a\u00020C2\n\b\u0002\u0010Y\u001a\u0004\u0018\u00010C2\b\b\u0002\u0010Z\u001a\u00020[2\b\b\u0002\u0010\\\u001a\u00020[2\u0006\u0010:\u001a\u00020;H\u0002J\u0010\u0010]\u001a\u00020P2\u0006\u0010B\u001a\u00020CH\u0016J\u0018\u0010^\u001a\u0002012\u0006\u0010_\u001a\u00020`2\u0006\u0010a\u001a\u00020bH\u0017J\u0010\u0010c\u001a\u0002012\u0006\u0010a\u001a\u00020bH\u0017J\u0010\u0010d\u001a\u0002052\u0006\u00108\u001a\u000209H\u0002J\u0010\u0010e\u001a\u0002052\u0006\u00108\u001a\u000209H\u0002J\u0018\u0010f\u001a\u00020g2\u0006\u0010B\u001a\u00020C2\u0006\u0010h\u001a\u00020PH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R&\u0010\u0006\u001a\u0004\u0018\u00010\u00078\u0000@\u0000X\u0081\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b\b\u0010\u0003\u001a\u0004\b\t\u0010\n\"\u0004\b\u000b\u0010\fR\u001a\u0010\r\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u000e8\u0002@\u0002X\u0083\u000e¢\u0006\u0002\n\u0000R%\u0010\u0010\u001a\u0015\u0012\f\u0012\n \u0011*\u0004\u0018\u00010\u000f0\u000f0\u000e¢\u0006\u0002\b\u00128\u0002@\u0002X\u0083\u000e¢\u0006\u0002\n\u0000R\u0013\u0010\u0013\u001a\u00070\u0014¢\u0006\u0002\b\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0016X\u0082\u000e¢\u0006\u0002\n\u0000R&\u0010\u0017\u001a\u0004\u0018\u00010\u00188\u0000@\u0000X\u0081\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b\u0019\u0010\u0003\u001a\u0004\b\u001a\u0010\u001b\"\u0004\b\u001c\u0010\u001dR\u001c\u0010\u001e\u001a\u000e\u0012\u0004\u0012\u00020 \u0012\u0004\u0012\u00020!0\u001f8\u0002X\u0083\u0004¢\u0006\u0002\n\u0000R\u001e\u0010\"\u001a\u0012\u0012\u0004\u0012\u00020$0#j\b\u0012\u0004\u0012\u00020$`%X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010&\u001a\u00020'X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b(\u0010)\"\u0004\b*\u0010+R\u001a\u0010O\u001a\b\u0012\u0004\u0012\u00020P0M8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bQ\u0010RR \u0010S\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020P0M0M8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bT\u0010RR\u0014\u0010U\u001a\u0002058WX\u0096\u0004¢\u0006\u0006\u001a\u0004\bU\u0010VR$\u0010i\u001a\u00020'2\u0006\u0010i\u001a\u00020'8B@BX\u0082\u000e¢\u0006\f\u001a\u0004\bj\u0010)\"\u0004\bk\u0010+R0\u0010m\u001a\b\u0012\u0004\u0012\u00020P0M2\f\u0010l\u001a\b\u0012\u0004\u0012\u00020P0M8B@BX\u0082\u000e¢\u0006\f\u001a\u0004\bn\u0010R\"\u0004\bo\u0010p¨\u0006q"}, d2 = {"Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;", "Landroidx/camera/lifecycle/LifecycleCameraProvider;", "<init>", "()V", "lock", "", "cameraXConfigProvider", "Landroidx/camera/core/CameraXConfig$Provider;", "getCameraXConfigProvider$camera_lifecycle_release$annotations", "getCameraXConfigProvider$camera_lifecycle_release", "()Landroidx/camera/core/CameraXConfig$Provider;", "setCameraXConfigProvider$camera_lifecycle_release", "(Landroidx/camera/core/CameraXConfig$Provider;)V", "cameraXInitializeFuture", "Lcom/google/common/util/concurrent/ListenableFuture;", "Ljava/lang/Void;", "cameraXShutdownFuture", "kotlin.jvm.PlatformType", "Lorg/jspecify/annotations/NonNull;", "lifecycleCameraRepository", "Landroidx/camera/lifecycle/LifecycleCameraRepository;", "cameraX", "Landroidx/camera/core/CameraX;", "context", "Landroid/content/Context;", "getContext$camera_lifecycle_release$annotations", "getContext$camera_lifecycle_release", "()Landroid/content/Context;", "setContext$camera_lifecycle_release", "(Landroid/content/Context;)V", "cameraInfoMap", "", "Landroidx/camera/core/CameraIdentifier;", "Landroidx/camera/core/impl/AdapterCameraInfo;", "lifecycleCameraKeys", "Ljava/util/HashSet;", "Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;", "Lkotlin/collections/HashSet;", "configImplType", "", "getConfigImplType", "()I", "setConfigImplType", "(I)V", "initAsync", "cameraXConfig", "Landroidx/camera/core/CameraXConfig;", "initAsync$camera_lifecycle_release", "configure", "", "configure$camera_lifecycle_release", "shutdownAsync", "clearConfigProvider", "", "shutdownAsync$camera_lifecycle_release", "isBound", "useCase", "Landroidx/camera/core/UseCase;", "sessionConfig", "Landroidx/camera/core/SessionConfig;", "unbind", "useCases", "", "([Landroidx/camera/core/UseCase;)V", "unbindAll", "hasCamera", "cameraSelector", "Landroidx/camera/core/CameraSelector;", "bindToLifecycle", "Landroidx/camera/core/Camera;", "lifecycleOwner", "Landroidx/lifecycle/LifecycleOwner;", "(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;", "useCaseGroup", "Landroidx/camera/core/UseCaseGroup;", "Landroidx/camera/core/ConcurrentCamera;", "singleCameraConfigs", "", "Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;", "availableCameraInfos", "Landroidx/camera/core/CameraInfo;", "getAvailableCameraInfos", "()Ljava/util/List;", "availableConcurrentCameraInfos", "getAvailableConcurrentCameraInfos", "isConcurrentCameraModeOn", "()Z", "bindToLifecycleInternal", "primaryCameraSelector", "secondaryCameraSelector", "primaryCompositionSettings", "Landroidx/camera/core/CompositionSettings;", "secondaryCompositionSettings", "getCameraInfo", "addCameraPresenceListener", "executor", "Ljava/util/concurrent/Executor;", ServiceSpecificExtraArgs.CastExtraArgs.LISTENER, "Landroidx/camera/core/CameraPresenceListener;", "removeCameraPresenceListener", "isVideoCapture", "isPreview", "getCameraConfig", "Landroidx/camera/core/impl/CameraConfig;", "cameraInfo", "cameraOperatingMode", "getCameraOperatingMode", "setCameraOperatingMode", "cameraInfos", "activeConcurrentCameraInfos", "getActiveConcurrentCameraInfos", "setActiveConcurrentCameraInfos", "(Ljava/util/List;)V", "camera-lifecycle_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public final class LifecycleCameraProviderImpl implements LifecycleCameraProvider {
    private final Map<CameraIdentifier, AdapterCameraInfo> cameraInfoMap;
    private CameraX cameraX;
    private CameraXConfig.Provider cameraXConfigProvider;
    private ListenableFuture<Void> cameraXInitializeFuture;
    private ListenableFuture<Void> cameraXShutdownFuture;
    private int configImplType;
    private Context context;
    private final HashSet<LifecycleCameraRepository.Key> lifecycleCameraKeys;
    private final LifecycleCameraRepository lifecycleCameraRepository;
    private final Object lock = new Object();

    public static /* synthetic */ void getCameraXConfigProvider$camera_lifecycle_release$annotations() {
    }

    public static /* synthetic */ void getContext$camera_lifecycle_release$annotations() {
    }

    public LifecycleCameraProviderImpl() {
        ListenableFuture<Void> immediateFuture = Futures.immediateFuture(null);
        Intrinsics.checkNotNullExpressionValue(immediateFuture, "immediateFuture(...)");
        this.cameraXShutdownFuture = immediateFuture;
        LifecycleCameraRepository lifecycleCameraRepository = LifecycleCameraRepository.getInstance();
        Intrinsics.checkNotNullExpressionValue(lifecycleCameraRepository, "getInstance(...)");
        this.lifecycleCameraRepository = lifecycleCameraRepository;
        this.cameraInfoMap = new HashMap();
        this.lifecycleCameraKeys = new HashSet<>();
        this.configImplType = -1;
    }

    /* renamed from: getCameraXConfigProvider$camera_lifecycle_release, reason: from getter */
    public final CameraXConfig.Provider getCameraXConfigProvider() {
        return this.cameraXConfigProvider;
    }

    public final void setCameraXConfigProvider$camera_lifecycle_release(CameraXConfig.Provider provider) {
        this.cameraXConfigProvider = provider;
    }

    /* renamed from: getContext$camera_lifecycle_release, reason: from getter */
    public final Context getContext() {
        return this.context;
    }

    public final void setContext$camera_lifecycle_release(Context context) {
        this.context = context;
    }

    @Override // androidx.camera.core.CameraProvider
    public int getConfigImplType() {
        return this.configImplType;
    }

    public void setConfigImplType(int i) {
        this.configImplType = i;
    }

    public static /* synthetic */ ListenableFuture initAsync$camera_lifecycle_release$default(LifecycleCameraProviderImpl lifecycleCameraProviderImpl, Context context, CameraXConfig cameraXConfig, int i, Object obj) {
        if ((i & 2) != 0) {
            cameraXConfig = null;
        }
        return lifecycleCameraProviderImpl.initAsync$camera_lifecycle_release(context, cameraXConfig);
    }

    public final ListenableFuture<Void> initAsync$camera_lifecycle_release(final Context context, CameraXConfig cameraXConfig) {
        Intrinsics.checkNotNullParameter(context, "context");
        synchronized (this.lock) {
            if (this.cameraXInitializeFuture != null) {
                ListenableFuture<Void> listenableFuture = this.cameraXInitializeFuture;
                Intrinsics.checkNotNull(listenableFuture, "null cannot be cast to non-null type com.google.common.util.concurrent.ListenableFuture<java.lang.Void>");
                return listenableFuture;
            }
            if (cameraXConfig != null) {
                configure$camera_lifecycle_release(cameraXConfig);
            }
            final CameraX cameraX = new CameraX(context, this.cameraXConfigProvider);
            setConfigImplType(cameraX.getConfigImplType());
            FutureChain from = FutureChain.from(this.cameraXShutdownFuture);
            final Function1 function1 = new Function1() { // from class: androidx.camera.lifecycle.LifecycleCameraProviderImpl$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    ListenableFuture initAsync$lambda$3$lambda$1;
                    initAsync$lambda$3$lambda$1 = LifecycleCameraProviderImpl.initAsync$lambda$3$lambda$1(CameraX.this, (Void) obj);
                    return initAsync$lambda$3$lambda$1;
                }
            };
            FutureChain initFuture = from.transformAsync(new AsyncFunction() { // from class: androidx.camera.lifecycle.LifecycleCameraProviderImpl$$ExternalSyntheticLambda2
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    ListenableFuture initAsync$lambda$3$lambda$2;
                    initAsync$lambda$3$lambda$2 = LifecycleCameraProviderImpl.initAsync$lambda$3$lambda$2(Function1.this, obj);
                    return initAsync$lambda$3$lambda$2;
                }
            }, CameraXExecutors.directExecutor());
            Intrinsics.checkNotNullExpressionValue(initFuture, "transformAsync(...)");
            this.cameraXInitializeFuture = initFuture;
            Futures.addCallback(initFuture, new FutureCallback<Void>() { // from class: androidx.camera.lifecycle.LifecycleCameraProviderImpl$initAsync$1$2
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(Void r3) {
                    LifecycleCameraProviderImpl.this.cameraX = cameraX;
                    LifecycleCameraProviderImpl.this.setContext$camera_lifecycle_release(ContextUtil.getApplicationContext(context));
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable t) {
                    Intrinsics.checkNotNullParameter(t, "t");
                    LifecycleCameraProviderImpl.this.shutdownAsync$camera_lifecycle_release(false);
                }
            }, CameraXExecutors.directExecutor());
            ListenableFuture<Void> nonCancellationPropagating = Futures.nonCancellationPropagating(initFuture);
            Intrinsics.checkNotNullExpressionValue(nonCancellationPropagating, "nonCancellationPropagating(...)");
            return nonCancellationPropagating;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final ListenableFuture initAsync$lambda$3$lambda$1(CameraX $cameraX, Void it) {
        return $cameraX.getInitializeFuture();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final ListenableFuture initAsync$lambda$3$lambda$2(Function1 $tmp0, Object p0) {
        return (ListenableFuture) $tmp0.invoke(p0);
    }

    public final void configure$camera_lifecycle_release(final CameraXConfig cameraXConfig) {
        Intrinsics.checkNotNullParameter(cameraXConfig, "cameraXConfig");
        Trace.beginSection("CX:configureInstanceInternal");
        try {
            synchronized (this.lock) {
                Preconditions.checkNotNull(cameraXConfig);
                Preconditions.checkState(getCameraXConfigProvider() == null, "CameraX has already been configured. To use a different configuration, shutdown() must be called.");
                setCameraXConfigProvider$camera_lifecycle_release(new CameraXConfig.Provider() { // from class: androidx.camera.lifecycle.LifecycleCameraProviderImpl$configure$1$1$1
                    @Override // androidx.camera.core.CameraXConfig.Provider
                    public final CameraXConfig getCameraXConfig() {
                        return CameraXConfig.this;
                    }
                });
                Unit unit = Unit.INSTANCE;
            }
            Unit unit2 = Unit.INSTANCE;
        } finally {
            Trace.endSection();
        }
    }

    public static /* synthetic */ ListenableFuture shutdownAsync$camera_lifecycle_release$default(LifecycleCameraProviderImpl lifecycleCameraProviderImpl, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            z = true;
        }
        return lifecycleCameraProviderImpl.shutdownAsync$camera_lifecycle_release(z);
    }

    public final ListenableFuture<Void> shutdownAsync$camera_lifecycle_release(boolean clearConfigProvider) {
        ListenableFuture shutdownFuture;
        Threads.runOnMainSync(new Runnable() { // from class: androidx.camera.lifecycle.LifecycleCameraProviderImpl$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                LifecycleCameraProviderImpl.shutdownAsync$lambda$6(LifecycleCameraProviderImpl.this);
            }
        });
        if (this.cameraX != null) {
            CameraX cameraX = this.cameraX;
            Intrinsics.checkNotNull(cameraX);
            shutdownFuture = cameraX.shutdown();
        } else {
            shutdownFuture = Futures.immediateFuture(null);
        }
        Intrinsics.checkNotNull(shutdownFuture);
        synchronized (this.lock) {
            if (clearConfigProvider) {
                this.cameraXConfigProvider = null;
            }
            this.cameraXInitializeFuture = null;
            this.cameraXShutdownFuture = shutdownFuture;
            this.cameraInfoMap.clear();
            this.lifecycleCameraKeys.clear();
            Unit unit = Unit.INSTANCE;
        }
        this.cameraX = null;
        this.context = null;
        return shutdownFuture;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void shutdownAsync$lambda$6(LifecycleCameraProviderImpl this$0) {
        this$0.unbindAll();
        this$0.lifecycleCameraRepository.removeLifecycleCameras(this$0.lifecycleCameraKeys);
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public boolean isBound(UseCase useCase) {
        Intrinsics.checkNotNullParameter(useCase, "useCase");
        for (LifecycleCamera lifecycleCamera : this.lifecycleCameraRepository.getLifecycleCameras()) {
            Intrinsics.checkNotNullExpressionValue(lifecycleCamera, "next(...)");
            LifecycleCamera lifecycleCamera2 = lifecycleCamera;
            if (lifecycleCamera2.isBound(useCase)) {
                return true;
            }
        }
        return false;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public boolean isBound(SessionConfig sessionConfig) {
        Intrinsics.checkNotNullParameter(sessionConfig, "sessionConfig");
        for (LifecycleCamera lifecycleCamera : this.lifecycleCameraRepository.getLifecycleCameras()) {
            Intrinsics.checkNotNullExpressionValue(lifecycleCamera, "next(...)");
            LifecycleCamera lifecycleCamera2 = lifecycleCamera;
            if (lifecycleCamera2.isBound(sessionConfig)) {
                return true;
            }
        }
        return false;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public void unbind(UseCase... useCases) {
        Intrinsics.checkNotNullParameter(useCases, "useCases");
        Trace.beginSection("CX:unbind");
        try {
            Threads.checkMainThread();
            if (getCameraOperatingMode() == 2) {
                throw new UnsupportedOperationException("Unbind UseCase is not supported in concurrent camera mode, call unbindAll() first.");
            }
            this.lifecycleCameraRepository.unbind(new LegacySessionConfig(ArraysKt.filterNotNull(useCases), null, null, 6, null), this.lifecycleCameraKeys);
            Unit unit = Unit.INSTANCE;
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public void unbind(SessionConfig sessionConfig) {
        Intrinsics.checkNotNullParameter(sessionConfig, "sessionConfig");
        Trace.beginSection("CX:unbind-sessionConfig");
        try {
            Threads.checkMainThread();
            if (getCameraOperatingMode() != 2) {
                this.lifecycleCameraRepository.unbind(sessionConfig, this.lifecycleCameraKeys);
                Unit unit = Unit.INSTANCE;
                return;
            }
            throw new UnsupportedOperationException("Unbind SessionConfig is not supported in concurrent camera mode call unbindAll() first.");
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public void unbindAll() {
        Trace.beginSection("CX:unbindAll");
        try {
            Threads.checkMainThread();
            setCameraOperatingMode(0);
            this.lifecycleCameraRepository.unbindAll(this.lifecycleCameraKeys);
            Unit unit = Unit.INSTANCE;
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.camera.core.CameraProvider
    public boolean hasCamera(CameraSelector cameraSelector) throws CameraInfoUnavailableException {
        boolean z;
        Intrinsics.checkNotNullParameter(cameraSelector, "cameraSelector");
        Trace.beginSection("CX:hasCamera");
        try {
            CameraX cameraX = this.cameraX;
            Intrinsics.checkNotNull(cameraX);
            cameraSelector.select(cameraX.getCameraRepository().getCameras());
            z = true;
        } catch (IllegalArgumentException e) {
            z = false;
        } catch (Throwable th) {
            Trace.endSection();
            throw th;
        }
        Trace.endSection();
        return z;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public Camera bindToLifecycle(LifecycleOwner lifecycleOwner, CameraSelector cameraSelector, UseCase... useCases) {
        Intrinsics.checkNotNullParameter(lifecycleOwner, "lifecycleOwner");
        Intrinsics.checkNotNullParameter(cameraSelector, "cameraSelector");
        Intrinsics.checkNotNullParameter(useCases, "useCases");
        Trace.beginSection("CX:bindToLifecycle");
        try {
            if (getCameraOperatingMode() != 2) {
                setCameraOperatingMode(1);
                return bindToLifecycleInternal$default(this, lifecycleOwner, cameraSelector, null, null, null, new LegacySessionConfig(ArraysKt.filterNotNull(useCases), null, null, 6, null), 28, null);
            }
            throw new UnsupportedOperationException("bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first");
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public Camera bindToLifecycle(LifecycleOwner lifecycleOwner, CameraSelector cameraSelector, UseCaseGroup useCaseGroup) {
        Intrinsics.checkNotNullParameter(lifecycleOwner, "lifecycleOwner");
        Intrinsics.checkNotNullParameter(cameraSelector, "cameraSelector");
        Intrinsics.checkNotNullParameter(useCaseGroup, "useCaseGroup");
        Trace.beginSection("CX:bindToLifecycle-UseCaseGroup");
        try {
            if (getCameraOperatingMode() != 2) {
                setCameraOperatingMode(1);
                return bindToLifecycleInternal$default(this, lifecycleOwner, cameraSelector, null, null, null, new LegacySessionConfig(useCaseGroup), 28, null);
            }
            throw new UnsupportedOperationException("bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first.");
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public Camera bindToLifecycle(LifecycleOwner lifecycleOwner, CameraSelector cameraSelector, SessionConfig sessionConfig) {
        Intrinsics.checkNotNullParameter(lifecycleOwner, "lifecycleOwner");
        Intrinsics.checkNotNullParameter(cameraSelector, "cameraSelector");
        Intrinsics.checkNotNullParameter(sessionConfig, "sessionConfig");
        Trace.beginSection("CX:bindToLifecycle-SessionConfig");
        try {
            if (getCameraOperatingMode() != 2) {
                setCameraOperatingMode(1);
                return bindToLifecycleInternal$default(this, lifecycleOwner, cameraSelector, null, null, null, sessionConfig, 28, null);
            }
            throw new UnsupportedOperationException("bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first.");
        } finally {
            Trace.endSection();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:109:0x0240, code lost:
    
        if (isVideoCapture(r3) != false) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x0231, code lost:
    
        if (isPreview(r3) == false) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0242, code lost:
    
        r18 = true;
     */
    /* JADX WARN: Removed duplicated region for block: B:82:0x02a6  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0259 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.camera.core.ConcurrentCamera bindToLifecycle(java.util.List<androidx.camera.core.ConcurrentCamera.SingleCameraConfig> r25) {
        /*
            Method dump skipped, instructions count: 865
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.lifecycle.LifecycleCameraProviderImpl.bindToLifecycle(java.util.List):androidx.camera.core.ConcurrentCamera");
    }

    @Override // androidx.camera.core.CameraProvider
    public List<CameraInfo> getAvailableCameraInfos() {
        Trace.beginSection("CX:getAvailableCameraInfos");
        try {
            List availableCameraInfos = new ArrayList();
            CameraX cameraX = this.cameraX;
            Intrinsics.checkNotNull(cameraX);
            Set cameras = cameraX.getCameraRepository().getCameras();
            Intrinsics.checkNotNullExpressionValue(cameras, "getCameras(...)");
            Set cameras2 = cameras;
            for (CameraInternal camera : cameras2) {
                CameraInfo cameraInfo = camera.getCameraInfo();
                Intrinsics.checkNotNullExpressionValue(cameraInfo, "getCameraInfo(...)");
                availableCameraInfos.add(cameraInfo);
            }
            return availableCameraInfos;
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.camera.core.CameraProvider
    public List<List<CameraInfo>> getAvailableConcurrentCameraInfos() {
        Trace.beginSection("CX:getAvailableConcurrentCameraInfos");
        try {
            Objects.requireNonNull(this.cameraX);
            CameraX cameraX = this.cameraX;
            Intrinsics.checkNotNull(cameraX);
            Objects.requireNonNull(cameraX.getCameraFactory().getCameraCoordinator());
            CameraX cameraX2 = this.cameraX;
            Intrinsics.checkNotNull(cameraX2);
            List concurrentCameraSelectorLists = cameraX2.getCameraFactory().getCameraCoordinator().getConcurrentCameraSelectors();
            Intrinsics.checkNotNullExpressionValue(concurrentCameraSelectorLists, "getConcurrentCameraSelectors(...)");
            List availableConcurrentCameraInfos = new ArrayList();
            for (List cameraSelectors : concurrentCameraSelectorLists) {
                ArrayList arrayList = new ArrayList();
                for (CameraSelector cameraSelector : cameraSelectors) {
                    try {
                        Intrinsics.checkNotNull(cameraSelector);
                        CameraInfo cameraInfo = getCameraInfo(cameraSelector);
                        arrayList.add(cameraInfo);
                    } catch (IllegalArgumentException e) {
                    }
                }
                availableConcurrentCameraInfos.add(arrayList);
            }
            return availableConcurrentCameraInfos;
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.camera.core.CameraProvider
    public boolean isConcurrentCameraModeOn() {
        return getCameraOperatingMode() == 2;
    }

    static /* synthetic */ Camera bindToLifecycleInternal$default(LifecycleCameraProviderImpl lifecycleCameraProviderImpl, LifecycleOwner lifecycleOwner, CameraSelector cameraSelector, CameraSelector cameraSelector2, CompositionSettings compositionSettings, CompositionSettings compositionSettings2, SessionConfig sessionConfig, int i, Object obj) {
        return lifecycleCameraProviderImpl.bindToLifecycleInternal(lifecycleOwner, cameraSelector, (i & 4) != 0 ? null : cameraSelector2, (i & 8) != 0 ? CompositionSettings.DEFAULT : compositionSettings, (i & 16) != 0 ? CompositionSettings.DEFAULT : compositionSettings2, sessionConfig);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x011c, code lost:
    
        if (r10 != null) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x011e, code lost:
    
        r1 = r24.lifecycleCameraRepository;
        r3 = r24.cameraX;
        kotlin.jvm.internal.Intrinsics.checkNotNull(r3);
        r1 = r1.createLifecycleCamera(r25, r3.getCameraUseCaseAdapterProvider().provide(r8, r9, r13, r14, r28, r29));
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x014f, code lost:
    
        if (r30.getUseCases().isEmpty() == false) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0151, code lost:
    
        kotlin.jvm.internal.Intrinsics.checkNotNull(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x017f, code lost:
    
        androidx.tracing.Trace.endSection();
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0187, code lost:
    
        return r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0157, code lost:
    
        r3 = r24.lifecycleCameraRepository;
        kotlin.jvm.internal.Intrinsics.checkNotNull(r1);
        r4 = r24.cameraX;
        kotlin.jvm.internal.Intrinsics.checkNotNull(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0170, code lost:
    
        r3.bindToLifecycleCamera(r1, r30, r4.getCameraFactory().getCameraCoordinator());
        r24.lifecycleCameraKeys.add(androidx.camera.lifecycle.LifecycleCameraRepository.Key.create(r25, r0));
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0188, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0144, code lost:
    
        r1 = r10;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final androidx.camera.core.Camera bindToLifecycleInternal(androidx.lifecycle.LifecycleOwner r25, androidx.camera.core.CameraSelector r26, androidx.camera.core.CameraSelector r27, androidx.camera.core.CompositionSettings r28, androidx.camera.core.CompositionSettings r29, androidx.camera.core.SessionConfig r30) {
        /*
            Method dump skipped, instructions count: 407
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.lifecycle.LifecycleCameraProviderImpl.bindToLifecycleInternal(androidx.lifecycle.LifecycleOwner, androidx.camera.core.CameraSelector, androidx.camera.core.CameraSelector, androidx.camera.core.CompositionSettings, androidx.camera.core.CompositionSettings, androidx.camera.core.SessionConfig):androidx.camera.core.Camera");
    }

    @Override // androidx.camera.core.CameraProvider
    public CameraInfo getCameraInfo(CameraSelector cameraSelector) {
        Object adapterCameraInfo;
        Intrinsics.checkNotNullParameter(cameraSelector, "cameraSelector");
        Trace.beginSection("CX:getCameraInfo");
        try {
            CameraX cameraX = this.cameraX;
            Intrinsics.checkNotNull(cameraX);
            CameraInfoInternal cameraInfoInternal = cameraSelector.select(cameraX.getCameraRepository().getCameras()).getCameraInfoInternal();
            Intrinsics.checkNotNullExpressionValue(cameraInfoInternal, "getCameraInfoInternal(...)");
            CameraConfig cameraConfig = getCameraConfig(cameraSelector, cameraInfoInternal);
            CameraIdentifier.Companion companion = CameraIdentifier.INSTANCE;
            String cameraId = cameraInfoInternal.getCameraId();
            Intrinsics.checkNotNullExpressionValue(cameraId, "getCameraId(...)");
            CameraIdentifier key = companion.create(cameraId, null, cameraConfig.getCompatibilityId());
            synchronized (this.lock) {
                adapterCameraInfo = this.cameraInfoMap.get(key);
                if (adapterCameraInfo == null) {
                    adapterCameraInfo = new AdapterCameraInfo(cameraInfoInternal, cameraConfig);
                    this.cameraInfoMap.put(key, adapterCameraInfo);
                }
                Unit unit = Unit.INSTANCE;
            }
            AdapterCameraInfo adapterCameraInfo2 = (AdapterCameraInfo) adapterCameraInfo;
            Trace.endSection();
            return adapterCameraInfo2;
        } catch (Throwable th) {
            Trace.endSection();
            throw th;
        }
    }

    @Override // androidx.camera.core.CameraProvider
    public void addCameraPresenceListener(Executor executor, CameraPresenceListener listener) {
        Intrinsics.checkNotNullParameter(executor, "executor");
        Intrinsics.checkNotNullParameter(listener, "listener");
        CameraX cameraX = this.cameraX;
        Intrinsics.checkNotNull(cameraX);
        cameraX.getCameraAvailabilityProvider().addCameraPresenceListener(listener, executor);
    }

    @Override // androidx.camera.core.CameraProvider
    public void removeCameraPresenceListener(CameraPresenceListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        CameraX cameraX = this.cameraX;
        Intrinsics.checkNotNull(cameraX);
        cameraX.getCameraAvailabilityProvider().removeCameraPresenceListener(listener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean isVideoCapture(UseCase useCase) {
        return useCase.getCurrentConfig().containsOption(UseCaseConfig.OPTION_CAPTURE_TYPE) && useCase.getCurrentConfig().getCaptureType() == UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean isPreview(UseCase useCase) {
        return useCase instanceof Preview;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final CameraConfig getCameraConfig(CameraSelector cameraSelector, CameraInfo cameraInfo) {
        CameraConfig cameraConfig = null;
        Iterator<CameraFilter> it = cameraSelector.getCameraFilterSet().iterator();
        Intrinsics.checkNotNullExpressionValue(it, "iterator(...)");
        while (it.hasNext()) {
            CameraFilter next = it.next();
            Intrinsics.checkNotNullExpressionValue(next, "next(...)");
            CameraFilter cameraFilter = next;
            if (!Intrinsics.areEqual(cameraFilter.getIdentifier(), CameraFilter.DEFAULT_ID)) {
                CameraConfigProvider configProvider = ExtendedCameraConfigProviderStore.getConfigProvider(cameraFilter.getIdentifier());
                Context context = this.context;
                Intrinsics.checkNotNull(context);
                CameraConfig extendedCameraConfig = configProvider.getConfig(cameraInfo, context);
                if (extendedCameraConfig == null) {
                    continue;
                } else {
                    if (cameraConfig != null) {
                        throw new IllegalArgumentException("Cannot apply multiple extended camera configs at the same time.");
                    }
                    cameraConfig = extendedCameraConfig;
                }
            }
        }
        if (cameraConfig == null) {
            CameraConfig cameraConfig2 = CameraConfigs.defaultConfig();
            return cameraConfig2;
        }
        return cameraConfig;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final int getCameraOperatingMode() {
        if (this.cameraX == null) {
            return 0;
        }
        CameraX cameraX = this.cameraX;
        Intrinsics.checkNotNull(cameraX);
        return cameraX.getCameraFactory().getCameraCoordinator().getCameraOperatingMode();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setCameraOperatingMode(int cameraOperatingMode) {
        if (this.cameraX == null) {
            return;
        }
        CameraX cameraX = this.cameraX;
        Intrinsics.checkNotNull(cameraX);
        cameraX.getCameraFactory().getCameraCoordinator().setCameraOperatingMode(cameraOperatingMode);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final List<CameraInfo> getActiveConcurrentCameraInfos() {
        if (this.cameraX == null) {
            return new ArrayList();
        }
        CameraX cameraX = this.cameraX;
        Intrinsics.checkNotNull(cameraX);
        List<CameraInfo> activeConcurrentCameraInfos = cameraX.getCameraFactory().getCameraCoordinator().getActiveConcurrentCameraInfos();
        Intrinsics.checkNotNullExpressionValue(activeConcurrentCameraInfos, "getActiveConcurrentCameraInfos(...)");
        return activeConcurrentCameraInfos;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setActiveConcurrentCameraInfos(List<? extends CameraInfo> list) {
        if (this.cameraX == null) {
            return;
        }
        CameraX cameraX = this.cameraX;
        Intrinsics.checkNotNull(cameraX);
        cameraX.getCameraFactory().getCameraCoordinator().setActiveConcurrentCameraInfos(list);
    }
}
