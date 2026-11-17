.class public final Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;
.super Ljava/lang/Object;
.source "LifecycleCameraProviderImpl.kt"

# interfaces
.implements Landroidx/camera/lifecycle/LifecycleCameraProvider;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLifecycleCameraProviderImpl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LifecycleCameraProviderImpl.kt\nandroidx/camera/lifecycle/LifecycleCameraProviderImpl\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 Trace.kt\nandroidx/tracing/TraceKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,765:1\n1#2:766\n27#3,5:767\n27#3,5:772\n27#3,5:777\n27#3,5:782\n27#3,5:787\n27#3,5:792\n27#3,5:797\n27#3,5:802\n27#3,5:807\n27#3,5:812\n27#3,5:817\n27#3,3:822\n31#3:827\n27#3,5:828\n1863#4,2:825\n*S KotlinDebug\n*F\n+ 1 LifecycleCameraProviderImpl.kt\nandroidx/camera/lifecycle/LifecycleCameraProviderImpl\n*L\n139#1:767,5\n196#1:772,5\n213#1:777,5\n227#1:782,5\n235#1:787,5\n251#1:792,5\n274#1:797,5\n297#1:802,5\n317#1:807,5\n463#1:812,5\n474#1:817,5\n573#1:822,3\n573#1:827\n664#1:828,5\n606#1:825,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00e0\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\n\u0008\u0001\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\'\u0010,\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e2\u0006\u0010\u0017\u001a\u00020\u00182\n\u0008\u0002\u0010-\u001a\u0004\u0018\u00010.H\u0000\u00a2\u0006\u0002\u0008/J\u0015\u00100\u001a\u0002012\u0006\u0010-\u001a\u00020.H\u0000\u00a2\u0006\u0002\u00082J\u001d\u00103\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e2\u0008\u0008\u0002\u00104\u001a\u000205H\u0000\u00a2\u0006\u0002\u00086J\u0010\u00107\u001a\u0002052\u0006\u00108\u001a\u000209H\u0016J\u0010\u00107\u001a\u0002052\u0006\u0010:\u001a\u00020;H\u0016J%\u0010<\u001a\u0002012\u0016\u0010=\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u0001090>\"\u0004\u0018\u000109H\u0017\u00a2\u0006\u0002\u0010?J\u0010\u0010<\u001a\u0002012\u0006\u0010:\u001a\u00020;H\u0017J\u0008\u0010@\u001a\u000201H\u0017J\u0010\u0010A\u001a\u0002052\u0006\u0010B\u001a\u00020CH\u0016J5\u0010D\u001a\u00020E2\u0006\u0010F\u001a\u00020G2\u0006\u0010B\u001a\u00020C2\u0016\u0010=\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u0001090>\"\u0004\u0018\u000109H\u0017\u00a2\u0006\u0002\u0010HJ \u0010D\u001a\u00020E2\u0006\u0010F\u001a\u00020G2\u0006\u0010B\u001a\u00020C2\u0006\u0010I\u001a\u00020JH\u0017J \u0010D\u001a\u00020E2\u0006\u0010F\u001a\u00020G2\u0006\u0010B\u001a\u00020C2\u0006\u0010:\u001a\u00020;H\u0017J\u0018\u0010D\u001a\u00020K2\u000e\u0010L\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010N0MH\u0017J@\u0010W\u001a\u00020E2\u0006\u0010F\u001a\u00020G2\u0006\u0010X\u001a\u00020C2\n\u0008\u0002\u0010Y\u001a\u0004\u0018\u00010C2\u0008\u0008\u0002\u0010Z\u001a\u00020[2\u0008\u0008\u0002\u0010\\\u001a\u00020[2\u0006\u0010:\u001a\u00020;H\u0002J\u0010\u0010]\u001a\u00020P2\u0006\u0010B\u001a\u00020CH\u0016J\u0018\u0010^\u001a\u0002012\u0006\u0010_\u001a\u00020`2\u0006\u0010a\u001a\u00020bH\u0017J\u0010\u0010c\u001a\u0002012\u0006\u0010a\u001a\u00020bH\u0017J\u0010\u0010d\u001a\u0002052\u0006\u00108\u001a\u000209H\u0002J\u0010\u0010e\u001a\u0002052\u0006\u00108\u001a\u000209H\u0002J\u0018\u0010f\u001a\u00020g2\u0006\u0010B\u001a\u00020C2\u0006\u0010h\u001a\u00020PH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R&\u0010\u0006\u001a\u0004\u0018\u00010\u00078\u0000@\u0000X\u0081\u000e\u00a2\u0006\u0014\n\u0000\u0012\u0004\u0008\u0008\u0010\u0003\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u001a\u0010\r\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u000e8\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R%\u0010\u0010\u001a\u0015\u0012\u000c\u0012\n \u0011*\u0004\u0018\u00010\u000f0\u000f0\u000e\u00a2\u0006\u0002\u0008\u00128\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u0013\u0010\u0013\u001a\u00070\u0014\u00a2\u0006\u0002\u0008\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0016X\u0082\u000e\u00a2\u0006\u0002\n\u0000R&\u0010\u0017\u001a\u0004\u0018\u00010\u00188\u0000@\u0000X\u0081\u000e\u00a2\u0006\u0014\n\u0000\u0012\u0004\u0008\u0019\u0010\u0003\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\u001c\u0010\u001e\u001a\u000e\u0012\u0004\u0012\u00020 \u0012\u0004\u0012\u00020!0\u001f8\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\"\u001a\u0012\u0012\u0004\u0012\u00020$0#j\u0008\u0012\u0004\u0012\u00020$`%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010&\u001a\u00020\'X\u0096\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008(\u0010)\"\u0004\u0008*\u0010+R\u001a\u0010O\u001a\u0008\u0012\u0004\u0012\u00020P0M8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008Q\u0010RR \u0010S\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020P0M0M8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008T\u0010RR\u0014\u0010U\u001a\u0002058WX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008U\u0010VR$\u0010i\u001a\u00020\'2\u0006\u0010i\u001a\u00020\'8B@BX\u0082\u000e\u00a2\u0006\u000c\u001a\u0004\u0008j\u0010)\"\u0004\u0008k\u0010+R0\u0010m\u001a\u0008\u0012\u0004\u0012\u00020P0M2\u000c\u0010l\u001a\u0008\u0012\u0004\u0012\u00020P0M8B@BX\u0082\u000e\u00a2\u0006\u000c\u001a\u0004\u0008n\u0010R\"\u0004\u0008o\u0010p\u00a8\u0006q"
    }
    d2 = {
        "Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;",
        "Landroidx/camera/lifecycle/LifecycleCameraProvider;",
        "<init>",
        "()V",
        "lock",
        "",
        "cameraXConfigProvider",
        "Landroidx/camera/core/CameraXConfig$Provider;",
        "getCameraXConfigProvider$camera_lifecycle_release$annotations",
        "getCameraXConfigProvider$camera_lifecycle_release",
        "()Landroidx/camera/core/CameraXConfig$Provider;",
        "setCameraXConfigProvider$camera_lifecycle_release",
        "(Landroidx/camera/core/CameraXConfig$Provider;)V",
        "cameraXInitializeFuture",
        "Lcom/google/common/util/concurrent/ListenableFuture;",
        "Ljava/lang/Void;",
        "cameraXShutdownFuture",
        "kotlin.jvm.PlatformType",
        "Lorg/jspecify/annotations/NonNull;",
        "lifecycleCameraRepository",
        "Landroidx/camera/lifecycle/LifecycleCameraRepository;",
        "cameraX",
        "Landroidx/camera/core/CameraX;",
        "context",
        "Landroid/content/Context;",
        "getContext$camera_lifecycle_release$annotations",
        "getContext$camera_lifecycle_release",
        "()Landroid/content/Context;",
        "setContext$camera_lifecycle_release",
        "(Landroid/content/Context;)V",
        "cameraInfoMap",
        "",
        "Landroidx/camera/core/CameraIdentifier;",
        "Landroidx/camera/core/impl/AdapterCameraInfo;",
        "lifecycleCameraKeys",
        "Ljava/util/HashSet;",
        "Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;",
        "Lkotlin/collections/HashSet;",
        "configImplType",
        "",
        "getConfigImplType",
        "()I",
        "setConfigImplType",
        "(I)V",
        "initAsync",
        "cameraXConfig",
        "Landroidx/camera/core/CameraXConfig;",
        "initAsync$camera_lifecycle_release",
        "configure",
        "",
        "configure$camera_lifecycle_release",
        "shutdownAsync",
        "clearConfigProvider",
        "",
        "shutdownAsync$camera_lifecycle_release",
        "isBound",
        "useCase",
        "Landroidx/camera/core/UseCase;",
        "sessionConfig",
        "Landroidx/camera/core/SessionConfig;",
        "unbind",
        "useCases",
        "",
        "([Landroidx/camera/core/UseCase;)V",
        "unbindAll",
        "hasCamera",
        "cameraSelector",
        "Landroidx/camera/core/CameraSelector;",
        "bindToLifecycle",
        "Landroidx/camera/core/Camera;",
        "lifecycleOwner",
        "Landroidx/lifecycle/LifecycleOwner;",
        "(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;",
        "useCaseGroup",
        "Landroidx/camera/core/UseCaseGroup;",
        "Landroidx/camera/core/ConcurrentCamera;",
        "singleCameraConfigs",
        "",
        "Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;",
        "availableCameraInfos",
        "Landroidx/camera/core/CameraInfo;",
        "getAvailableCameraInfos",
        "()Ljava/util/List;",
        "availableConcurrentCameraInfos",
        "getAvailableConcurrentCameraInfos",
        "isConcurrentCameraModeOn",
        "()Z",
        "bindToLifecycleInternal",
        "primaryCameraSelector",
        "secondaryCameraSelector",
        "primaryCompositionSettings",
        "Landroidx/camera/core/CompositionSettings;",
        "secondaryCompositionSettings",
        "getCameraInfo",
        "addCameraPresenceListener",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "listener",
        "Landroidx/camera/core/CameraPresenceListener;",
        "removeCameraPresenceListener",
        "isVideoCapture",
        "isPreview",
        "getCameraConfig",
        "Landroidx/camera/core/impl/CameraConfig;",
        "cameraInfo",
        "cameraOperatingMode",
        "getCameraOperatingMode",
        "setCameraOperatingMode",
        "cameraInfos",
        "activeConcurrentCameraInfos",
        "getActiveConcurrentCameraInfos",
        "setActiveConcurrentCameraInfos",
        "(Ljava/util/List;)V",
        "camera-lifecycle_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final cameraInfoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/CameraIdentifier;",
            "Landroidx/camera/core/impl/AdapterCameraInfo;",
            ">;"
        }
    .end annotation
.end field

.field private cameraX:Landroidx/camera/core/CameraX;

.field private cameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

.field private cameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private cameraXShutdownFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private configImplType:I

.field private context:Landroid/content/Context;

.field private final lifecycleCameraKeys:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;",
            ">;"
        }
    .end annotation
.end field

.field private final lifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

.field private final lock:Ljava/lang/Object;


# direct methods
.method public static synthetic $r8$lambda$WNcKd_VMbzmHoamuHaNMH6YKNho(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)V
    .locals 0

    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->shutdownAsync$lambda$6(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)V

    return-void
.end method

.method public static synthetic $r8$lambda$WrPl7KFSAKm63NNRzsZwq0I0h8Y(Landroidx/camera/core/CameraX;Ljava/lang/Void;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->initAsync$lambda$3$lambda$1(Landroidx/camera/core/CameraX;Ljava/lang/Void;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$_nz2FCKI4VDXvDgK3xB82hbxStg(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->initAsync$lambda$3$lambda$2(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .locals 2

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lock:Ljava/lang/Object;

    .line 83
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    const-string v1, "immediateFuture(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXShutdownFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 84
    invoke-static {}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getInstance()Landroidx/camera/lifecycle/LifecycleCameraRepository;

    move-result-object v0

    const-string v1, "getInstance(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraInfoMap:Ljava/util/Map;

    .line 89
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraKeys:Ljava/util/HashSet;

    .line 90
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->configImplType:I

    .line 75
    return-void
.end method

.method public static final synthetic access$bindToLifecycleInternal(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;)Landroidx/camera/core/Camera;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "primaryCameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "secondaryCameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p4, "primaryCompositionSettings"    # Landroidx/camera/core/CompositionSettings;
    .param p5, "secondaryCompositionSettings"    # Landroidx/camera/core/CompositionSettings;
    .param p6, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    .line 75
    invoke-direct/range {p0 .. p6}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->bindToLifecycleInternal(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;)Landroidx/camera/core/Camera;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getActiveConcurrentCameraInfos(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/List;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;

    .line 75
    invoke-direct {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getActiveConcurrentCameraInfos()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getCameraConfig(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraInfo;)Landroidx/camera/core/impl/CameraConfig;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p2, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 75
    invoke-direct {p0, p1, p2}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraConfig(Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraInfo;)Landroidx/camera/core/impl/CameraConfig;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getCameraInfoMap$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/Map;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;

    .line 75
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraInfoMap:Ljava/util/Map;

    return-object v0
.end method

.method public static final synthetic access$getCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)I
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;

    .line 75
    invoke-direct {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraOperatingMode()I

    move-result v0

    return v0
.end method

.method public static final synthetic access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;

    .line 75
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    return-object v0
.end method

.method public static final synthetic access$getLifecycleCameraKeys$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/HashSet;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;

    .line 75
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraKeys:Ljava/util/HashSet;

    return-object v0
.end method

.method public static final synthetic access$getLifecycleCameraRepository$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/lifecycle/LifecycleCameraRepository;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;

    .line 75
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    return-object v0
.end method

.method public static final synthetic access$getLock$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;

    .line 75
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lock:Ljava/lang/Object;

    return-object v0
.end method

.method public static final synthetic access$isPreview(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 75
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->isPreview(Landroidx/camera/core/UseCase;)Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$isVideoCapture(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 75
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->isVideoCapture(Landroidx/camera/core/UseCase;)Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$setActiveConcurrentCameraInfos(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Ljava/util/List;)V
    .locals 0
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;
    .param p1, "cameraInfos"    # Ljava/util/List;

    .line 75
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->setActiveConcurrentCameraInfos(Ljava/util/List;)V

    return-void
.end method

.method public static final synthetic access$setCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;I)V
    .locals 0
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;
    .param p1, "cameraOperatingMode"    # I

    .line 75
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->setCameraOperatingMode(I)V

    return-void
.end method

.method public static final synthetic access$setCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/CameraX;)V
    .locals 0
    .param p0, "$this"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;
    .param p1, "<set-?>"    # Landroidx/camera/core/CameraX;

    .line 75
    iput-object p1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    return-void
.end method

.method private final bindToLifecycleInternal(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;)Landroidx/camera/core/Camera;
    .locals 24
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "primaryCameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "secondaryCameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p4, "primaryCompositionSettings"    # Landroidx/camera/core/CompositionSettings;
    .param p5, "secondaryCompositionSettings"    # Landroidx/camera/core/CompositionSettings;
    .param p6, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    .line 573
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    const-string v0, "null cannot be cast to non-null type androidx.camera.core.impl.AdapterCameraInfo"

    const-string v5, "CX:bindToLifecycle-internal"

    .local v5, "label$iv":Ljava/lang/String;
    const/4 v6, 0x0

    .line 822
    .local v6, "$i$f$trace":I
    invoke-static {v5}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 823
    nop

    .line 824
    const/4 v7, 0x0

    .line 574
    .local v7, "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycleInternal$1":I
    :try_start_0
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 579
    invoke-static {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v8

    invoke-static {v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v8}, Landroidx/camera/core/CameraX;->getCameraRepository()Landroidx/camera/core/impl/CameraRepository;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroidx/camera/core/CameraSelector;->select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;

    move-result-object v8

    const-string/jumbo v9, "select(...)"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 578
    move-object v11, v8

    .line 580
    .local v11, "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    const/4 v8, 0x1

    invoke-interface {v11, v8}, Landroidx/camera/core/impl/CameraInternal;->setPrimary(Z)V

    .line 581
    invoke-virtual {v1, v3}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;

    move-result-object v9

    invoke-static {v9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v13, v9

    check-cast v13, Landroidx/camera/core/impl/AdapterCameraInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 583
    .local v13, "primaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    const/4 v9, 0x0

    .line 584
    .local v9, "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    const/4 v10, 0x0

    .line 585
    .local v10, "secondaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    const/4 v12, 0x0

    if-eqz v4, :cond_0

    .line 587
    :try_start_1
    invoke-static {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v14

    invoke-static {v14}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v14}, Landroidx/camera/core/CameraX;->getCameraRepository()Landroidx/camera/core/impl/CameraRepository;

    move-result-object v14

    invoke-virtual {v14}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v14

    invoke-virtual {v4, v14}, Landroidx/camera/core/CameraSelector;->select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;

    move-result-object v14

    .line 586
    move-object v9, v14

    .line 588
    invoke-interface {v9, v12}, Landroidx/camera/core/impl/CameraInternal;->setPrimary(Z)V

    .line 590
    invoke-virtual {v1, v4}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;

    move-result-object v14

    invoke-static {v14, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v14, Landroidx/camera/core/impl/AdapterCameraInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 589
    move-object v10, v14

    goto :goto_0

    .line 827
    .end local v7    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycleInternal$1":I
    .end local v9    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v10    # "secondaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .end local v11    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v13    # "primaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    :catchall_0
    move-exception v0

    move-object/from16 v21, v5

    move-object/from16 v5, p6

    goto/16 :goto_5

    .line 585
    .restart local v7    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycleInternal$1":I
    .restart local v9    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local v10    # "secondaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .restart local v11    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local v13    # "primaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    :cond_0
    move-object v14, v10

    .line 597
    .end local v10    # "secondaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .local v14, "secondaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    :goto_0
    :try_start_2
    sget-object v0, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    .line 598
    nop

    .line 599
    nop

    .line 597
    invoke-virtual {v0, v13, v14}, Landroidx/camera/core/CameraIdentifier$Companion;->fromAdapterInfos(Landroidx/camera/core/impl/AdapterCameraInfo;Landroidx/camera/core/impl/AdapterCameraInfo;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    .line 596
    nop

    .line 602
    .local v0, "cameraUseCaseAdapterId":Landroidx/camera/core/CameraIdentifier;
    invoke-static {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraRepository$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/lifecycle/LifecycleCameraRepository;

    move-result-object v10

    invoke-virtual {v10, v2, v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCamera(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraIdentifier;)Landroidx/camera/lifecycle/LifecycleCamera;

    move-result-object v10

    .line 601
    move-object/from16 v17, v10

    .line 605
    .local v17, "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-static {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraRepository$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/lifecycle/LifecycleCameraRepository;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameras()Ljava/util/Collection;

    move-result-object v10

    move-object/from16 v18, v10

    .line 606
    .local v18, "lifecycleCameras":Ljava/util/Collection;
    invoke-virtual/range {p6 .. p6}, Landroidx/camera/core/SessionConfig;->getUseCases()Ljava/util/List;

    move-result-object v10

    check-cast v10, Ljava/lang/Iterable;

    .local v10, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v15, 0x0

    .line 825
    .local v15, "$i$f$forEach":I
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_4

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    .local v19, "element$iv":Ljava/lang/Object;
    move-object/from16 v20, v19

    check-cast v20, Landroidx/camera/core/UseCase;

    move-object/from16 v21, v20

    .local v21, "useCase":Landroidx/camera/core/UseCase;
    const/16 v20, 0x0

    .line 607
    .local v20, "$i$a$-forEach-LifecycleCameraProviderImpl$bindToLifecycleInternal$1$1":I
    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_2
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_3

    move/from16 v23, v12

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    const-string v8, "next(...)"

    invoke-static {v12, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v12, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 614
    .local v12, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    nop

    .line 615
    move-object/from16 v8, v21

    .end local v21    # "useCase":Landroidx/camera/core/UseCase;
    .local v8, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v12, v8}, Landroidx/camera/lifecycle/LifecycleCamera;->isBound(Landroidx/camera/core/UseCase;)Z

    move-result v21

    if-eqz v21, :cond_2

    .line 616
    invoke-virtual {v12}, Landroidx/camera/lifecycle/LifecycleCamera;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v1

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object/from16 v1, p0

    move-object/from16 v21, v8

    move/from16 v12, v23

    const/4 v8, 0x1

    goto :goto_2

    .line 618
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 619
    sget-object v16, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 620
    const-string v3, "Use case %s already bound to a different lifecycle."
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 621
    move-object/from16 v21, v5

    const/4 v4, 0x1

    .end local v5    # "label$iv":Ljava/lang/String;
    .local v21, "label$iv":Ljava/lang/String;
    :try_start_3
    new-array v5, v4, [Ljava/lang/Object;

    aput-object v8, v5, v23
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 619
    :try_start_4
    invoke-static {v5, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "format(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 618
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v6    # "$i$f$trace":I
    .end local v21    # "label$iv":Ljava/lang/String;
    .end local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p2    # "primaryCameraSelector":Landroidx/camera/core/CameraSelector;
    .end local p3    # "secondaryCameraSelector":Landroidx/camera/core/CameraSelector;
    .end local p4    # "primaryCompositionSettings":Landroidx/camera/core/CompositionSettings;
    .end local p5    # "secondaryCompositionSettings":Landroidx/camera/core/CompositionSettings;
    .end local p6    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    throw v1

    .line 827
    .end local v0    # "cameraUseCaseAdapterId":Landroidx/camera/core/CameraIdentifier;
    .end local v7    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycleInternal$1":I
    .end local v8    # "useCase":Landroidx/camera/core/UseCase;
    .end local v9    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v10    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v11    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v12    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    .end local v13    # "primaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .end local v14    # "secondaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .end local v15    # "$i$f$forEach":I
    .end local v17    # "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    .end local v18    # "lifecycleCameras":Ljava/util/Collection;
    .end local v19    # "element$iv":Ljava/lang/Object;
    .end local v20    # "$i$a$-forEach-LifecycleCameraProviderImpl$bindToLifecycleInternal$1$1":I
    .restart local v6    # "$i$f$trace":I
    .restart local v21    # "label$iv":Ljava/lang/String;
    .restart local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local p2    # "primaryCameraSelector":Landroidx/camera/core/CameraSelector;
    .restart local p3    # "secondaryCameraSelector":Landroidx/camera/core/CameraSelector;
    .restart local p4    # "primaryCompositionSettings":Landroidx/camera/core/CompositionSettings;
    .restart local p5    # "secondaryCompositionSettings":Landroidx/camera/core/CompositionSettings;
    .restart local p6    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    :catchall_1
    move-exception v0

    move-object/from16 v5, p6

    goto/16 :goto_5

    .line 615
    .end local v21    # "label$iv":Ljava/lang/String;
    .restart local v0    # "cameraUseCaseAdapterId":Landroidx/camera/core/CameraIdentifier;
    .restart local v5    # "label$iv":Ljava/lang/String;
    .restart local v7    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycleInternal$1":I
    .restart local v8    # "useCase":Landroidx/camera/core/UseCase;
    .restart local v9    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local v10    # "$this$forEach$iv":Ljava/lang/Iterable;
    .restart local v11    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local v12    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    .restart local v13    # "primaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .restart local v14    # "secondaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .restart local v15    # "$i$f$forEach":I
    .restart local v17    # "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    .restart local v18    # "lifecycleCameras":Ljava/util/Collection;
    .restart local v19    # "element$iv":Ljava/lang/Object;
    .restart local v20    # "$i$a$-forEach-LifecycleCameraProviderImpl$bindToLifecycleInternal$1$1":I
    :cond_2
    move-object/from16 v21, v5

    const/4 v4, 0x1

    .end local v5    # "label$iv":Ljava/lang/String;
    .restart local v21    # "label$iv":Ljava/lang/String;
    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move/from16 v12, v23

    move-object/from16 v21, v8

    move v8, v4

    move-object/from16 v4, p3

    goto :goto_2

    .line 626
    .end local v8    # "useCase":Landroidx/camera/core/UseCase;
    .end local v12    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    .restart local v5    # "label$iv":Ljava/lang/String;
    .local v21, "useCase":Landroidx/camera/core/UseCase;
    :cond_3
    move v4, v8

    move/from16 v23, v12

    move-object/from16 v8, v21

    move-object/from16 v21, v5

    .line 825
    .end local v5    # "label$iv":Ljava/lang/String;
    .end local v20    # "$i$a$-forEach-LifecycleCameraProviderImpl$bindToLifecycleInternal$1$1":I
    .local v21, "label$iv":Ljava/lang/String;
    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move v8, v4

    move-object/from16 v4, p3

    .end local v19    # "element$iv":Ljava/lang/Object;
    goto/16 :goto_1

    .line 826
    .end local v21    # "label$iv":Ljava/lang/String;
    .restart local v5    # "label$iv":Ljava/lang/String;
    :cond_4
    move-object/from16 v21, v5

    .line 629
    .end local v5    # "label$iv":Ljava/lang/String;
    .end local v10    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v15    # "$i$f$forEach":I
    .restart local v21    # "label$iv":Ljava/lang/String;
    if-nez v17, :cond_5

    .line 631
    invoke-static/range {p0 .. p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraRepository$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/lifecycle/LifecycleCameraRepository;

    move-result-object v1

    .line 632
    nop

    .line 633
    invoke-static/range {p0 .. p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 634
    invoke-virtual {v3}, Landroidx/camera/core/CameraX;->getCameraUseCaseAdapterProvider()Landroidx/camera/core/CameraUseCaseAdapterProvider;

    move-result-object v10

    .line 636
    nop

    .line 637
    nop

    .line 638
    nop

    .line 639
    nop

    .line 640
    nop

    .line 641
    nop

    .line 635
    move-object/from16 v15, p4

    move-object/from16 v16, p5

    move-object v12, v9

    .end local v9    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v12, "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    invoke-interface/range {v10 .. v16}, Landroidx/camera/core/CameraUseCaseAdapterProvider;->provide(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/AdapterCameraInfo;Landroidx/camera/core/impl/AdapterCameraInfo;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;)Landroidx/camera/core/internal/CameraUseCaseAdapter;

    move-result-object v3

    .line 631
    invoke-virtual {v1, v2, v3}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->createLifecycleCamera(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/internal/CameraUseCaseAdapter;)Landroidx/camera/lifecycle/LifecycleCamera;

    move-result-object v1

    .line 630
    move-object/from16 v17, v1

    goto :goto_3

    .line 629
    .end local v12    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local v9    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    :cond_5
    move-object v12, v9

    .end local v9    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local v12    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    move-object/from16 v1, v17

    .line 646
    .end local v17    # "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    .local v1, "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    :goto_3
    invoke-virtual/range {p6 .. p6}, Landroidx/camera/core/SessionConfig;->getUseCases()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 647
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object/from16 v5, p6

    goto :goto_4

    .line 650
    :cond_6
    invoke-static/range {p0 .. p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraRepository$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/lifecycle/LifecycleCameraRepository;

    move-result-object v3

    .line 651
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 652
    nop

    .line 653
    invoke-static/range {p0 .. p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v4}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v4

    invoke-interface {v4}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 650
    move-object/from16 v5, p6

    :try_start_5
    invoke-virtual {v3, v1, v5, v4}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->bindToLifecycleCamera(Landroidx/camera/lifecycle/LifecycleCamera;Landroidx/camera/core/SessionConfig;Landroidx/camera/core/concurrent/CameraCoordinator;)V

    .line 656
    invoke-static/range {p0 .. p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraKeys$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/HashSet;

    move-result-object v3

    .line 657
    invoke-static {v2, v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;->create(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraIdentifier;)Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    move-result-object v4

    .line 656
    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 660
    nop

    .line 824
    .end local v0    # "cameraUseCaseAdapterId":Landroidx/camera/core/CameraIdentifier;
    .end local v1    # "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    .end local v7    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycleInternal$1":I
    .end local v11    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v12    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v13    # "primaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .end local v14    # "secondaryAdapterCameraInfo":Landroidx/camera/core/impl/AdapterCameraInfo;
    .end local v18    # "lifecycleCameras":Ljava/util/Collection;
    :goto_4
    nop

    .line 827
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 824
    nop

    .line 827
    .end local v6    # "$i$f$trace":I
    .end local v21    # "label$iv":Ljava/lang/String;
    move-object v0, v1

    check-cast v0, Landroidx/camera/core/Camera;

    .line 661
    return-object v0

    .line 827
    .restart local v6    # "$i$f$trace":I
    .restart local v21    # "label$iv":Ljava/lang/String;
    :catchall_2
    move-exception v0

    goto :goto_5

    :catchall_3
    move-exception v0

    move-object/from16 v5, p6

    goto :goto_5

    .end local v21    # "label$iv":Ljava/lang/String;
    .restart local v5    # "label$iv":Ljava/lang/String;
    :catchall_4
    move-exception v0

    move-object/from16 v21, v5

    move-object/from16 v5, p6

    .end local v5    # "label$iv":Ljava/lang/String;
    .restart local v21    # "label$iv":Ljava/lang/String;
    :goto_5
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method static synthetic bindToLifecycleInternal$default(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;ILjava/lang/Object;)Landroidx/camera/core/Camera;
    .locals 7

    .line 564
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_0

    .line 568
    const/4 p3, 0x0

    move-object v3, p3

    goto :goto_0

    .line 564
    :cond_0
    move-object v3, p3

    :goto_0
    and-int/lit8 p3, p7, 0x8

    if-eqz p3, :cond_1

    .line 569
    sget-object p4, Landroidx/camera/core/CompositionSettings;->DEFAULT:Landroidx/camera/core/CompositionSettings;

    move-object v4, p4

    goto :goto_1

    .line 564
    :cond_1
    move-object v4, p4

    :goto_1
    and-int/lit8 p3, p7, 0x10

    if-eqz p3, :cond_2

    .line 570
    sget-object p5, Landroidx/camera/core/CompositionSettings;->DEFAULT:Landroidx/camera/core/CompositionSettings;

    move-object v5, p5

    goto :goto_2

    .line 564
    :cond_2
    move-object v5, p5

    :goto_2
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->bindToLifecycleInternal(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;)Landroidx/camera/core/Camera;

    move-result-object p0

    return-object p0
.end method

.method private final getActiveConcurrentCameraInfos()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation

    .line 753
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    if-nez v0, :cond_0

    .line 754
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    return-object v0

    .line 756
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/concurrent/CameraCoordinator;->getActiveConcurrentCameraInfos()Ljava/util/List;

    move-result-object v0

    const-string v1, "getActiveConcurrentCameraInfos(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method private final getCameraConfig(Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraInfo;)Landroidx/camera/core/impl/CameraConfig;
    .locals 5
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p2, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 710
    const/4 v0, 0x0

    .line 711
    .local v0, "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    invoke-virtual {p1}, Landroidx/camera/core/CameraSelector;->getCameraFilterSet()Ljava/util/LinkedHashSet;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-string v2, "iterator(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    const-string v3, "next(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Landroidx/camera/core/CameraFilter;

    .line 712
    .local v2, "cameraFilter":Landroidx/camera/core/CameraFilter;
    invoke-interface {v2}, Landroidx/camera/core/CameraFilter;->getIdentifier()Landroidx/camera/core/impl/Identifier;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/CameraFilter;->DEFAULT_ID:Landroidx/camera/core/impl/Identifier;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 714
    invoke-interface {v2}, Landroidx/camera/core/CameraFilter;->getIdentifier()Landroidx/camera/core/impl/Identifier;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->getConfigProvider(Ljava/lang/Object;)Landroidx/camera/core/impl/CameraConfigProvider;

    move-result-object v3

    .line 715
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->context:Landroid/content/Context;

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v3, p2, v4}, Landroidx/camera/core/impl/CameraConfigProvider;->getConfig(Landroidx/camera/core/CameraInfo;Landroid/content/Context;)Landroidx/camera/core/impl/CameraConfig;

    move-result-object v3

    .line 713
    nop

    .line 716
    .local v3, "extendedCameraConfig":Landroidx/camera/core/impl/CameraConfig;
    if-nez v3, :cond_1

    .line 717
    goto :goto_0

    .line 721
    :cond_1
    if-nez v0, :cond_2

    .line 726
    move-object v0, v3

    .end local v2    # "cameraFilter":Landroidx/camera/core/CameraFilter;
    .end local v3    # "extendedCameraConfig":Landroidx/camera/core/impl/CameraConfig;
    goto :goto_0

    .line 722
    .restart local v2    # "cameraFilter":Landroidx/camera/core/CameraFilter;
    .restart local v3    # "extendedCameraConfig":Landroidx/camera/core/impl/CameraConfig;
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 723
    nop

    .line 722
    const-string v4, "Cannot apply multiple extended camera configs at the same time."

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 730
    .end local v2    # "cameraFilter":Landroidx/camera/core/CameraFilter;
    .end local v3    # "extendedCameraConfig":Landroidx/camera/core/impl/CameraConfig;
    :cond_3
    if-nez v0, :cond_4

    .line 731
    invoke-static {}, Landroidx/camera/core/impl/CameraConfigs;->defaultConfig()Landroidx/camera/core/impl/CameraConfig;

    move-result-object v0

    .line 733
    :cond_4
    return-object v0
.end method

.method private final getCameraOperatingMode()I
    .locals 1

    .line 739
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    if-nez v0, :cond_0

    .line 740
    const/4 v0, 0x0

    return v0

    .line 742
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v0

    return v0
.end method

.method public static synthetic getCameraXConfigProvider$camera_lifecycle_release$annotations()V
    .locals 0

    return-void
.end method

.method public static synthetic getContext$camera_lifecycle_release$annotations()V
    .locals 0

    return-void
.end method

.method public static synthetic initAsync$camera_lifecycle_release$default(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroid/content/Context;Landroidx/camera/core/CameraXConfig;ILjava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 0

    .line 92
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 94
    const/4 p2, 0x0

    .line 92
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->initAsync$camera_lifecycle_release(Landroid/content/Context;Landroidx/camera/core/CameraXConfig;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0
.end method

.method private static final initAsync$lambda$3$lambda$1(Landroidx/camera/core/CameraX;Ljava/lang/Void;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "$cameraX"    # Landroidx/camera/core/CameraX;
    .param p1, "it"    # Ljava/lang/Void;

    .line 106
    invoke-virtual {p0}, Landroidx/camera/core/CameraX;->getInitializeFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method private static final initAsync$lambda$3$lambda$2(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "$tmp0"    # Lkotlin/jvm/functions/Function1;
    .param p1, "p0"    # Ljava/lang/Object;

    .line 106
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method private final isPreview(Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 703
    instance-of v0, p1, Landroidx/camera/core/Preview;

    return v0
.end method

.method private final isVideoCapture(Landroidx/camera/core/UseCase;)Z
    .locals 2
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 698
    invoke-virtual {p1}, Landroidx/camera/core/UseCase;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_TYPE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 699
    invoke-virtual {p1}, Landroidx/camera/core/UseCase;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->VIDEO_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 698
    :goto_0
    return v0
.end method

.method private final setActiveConcurrentCameraInfos(Ljava/util/List;)V
    .locals 1
    .param p1, "cameraInfos"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/CameraInfo;",
            ">;)V"
        }
    .end annotation

    .line 759
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    if-nez v0, :cond_0

    .line 760
    return-void

    .line 762
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/concurrent/CameraCoordinator;->setActiveConcurrentCameraInfos(Ljava/util/List;)V

    .line 763
    return-void
.end method

.method private final setCameraOperatingMode(I)V
    .locals 1
    .param p1, "cameraOperatingMode"    # I

    .line 745
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    if-nez v0, :cond_0

    .line 746
    return-void

    .line 748
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/concurrent/CameraCoordinator;->setCameraOperatingMode(I)V

    .line 749
    return-void
.end method

.method public static synthetic shutdownAsync$camera_lifecycle_release$default(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;ZILjava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 0

    .line 151
    const/4 p3, 0x1

    and-int/2addr p2, p3

    if-eqz p2, :cond_0

    move p1, p3

    :cond_0
    invoke-virtual {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->shutdownAsync$camera_lifecycle_release(Z)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0
.end method

.method private static final shutdownAsync$lambda$6(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)V
    .locals 2
    .param p0, "this$0"    # Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;

    .line 153
    invoke-virtual {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->unbindAll()V

    .line 154
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraKeys:Ljava/util/HashSet;

    check-cast v1, Ljava/util/Set;

    invoke-virtual {v0, v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->removeLifecycleCameras(Ljava/util/Set;)V

    .line 155
    return-void
.end method


# virtual methods
.method public addCameraPresenceListener(Ljava/util/concurrent/Executor;Landroidx/camera/core/CameraPresenceListener;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/camera/core/CameraPresenceListener;

    const-string v0, "executor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 689
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraAvailabilityProvider()Landroidx/camera/core/impl/CameraPresenceProvider;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->addCameraPresenceListener(Landroidx/camera/core/CameraPresenceListener;Ljava/util/concurrent/Executor;)V

    .line 690
    return-void
.end method

.method public bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/SessionConfig;)Landroidx/camera/core/Camera;
    .locals 12
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    const-string v0, "lifecycleOwner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cameraSelector"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "sessionConfig"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 297
    const-string v10, "CX:bindToLifecycle-SessionConfig"

    .local v10, "label$iv":Ljava/lang/String;
    const/4 v11, 0x0

    .line 802
    .local v11, "$i$f$trace":I
    invoke-static {v10}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 803
    nop

    .line 804
    const/4 v0, 0x0

    .line 298
    .local v0, "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$3":I
    :try_start_0
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)I

    move-result v1

    const/4 v4, 0x2

    if-eq v1, v4, :cond_0

    .line 304
    const/4 v1, 0x1

    invoke-static {p0, v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$setCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;I)V

    .line 307
    nop

    .line 308
    nop

    .line 309
    nop

    .line 307
    nop

    .line 310
    nop

    .line 307
    const/16 v8, 0x1c

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v7, p3

    invoke-static/range {v1 .. v9}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->bindToLifecycleInternal$default(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;ILjava/lang/Object;)Landroidx/camera/core/Camera;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 306
    nop

    .line 312
    .local v4, "camera":Landroidx/camera/core/Camera;
    nop

    .line 804
    .end local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$3":I
    .end local v4    # "camera":Landroidx/camera/core/Camera;
    nop

    .line 806
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 804
    nop

    .line 313
    .end local v10    # "label$iv":Ljava/lang/String;
    .end local v11    # "$i$f$trace":I
    return-object v4

    .line 299
    .restart local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$3":I
    .restart local v10    # "label$iv":Ljava/lang/String;
    .restart local v11    # "$i$f$trace":I
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    .line 300
    const-string v2, "bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first."

    .line 299
    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v10    # "label$iv":Ljava/lang/String;
    .end local v11    # "$i$f$trace":I
    .end local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .end local p3    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 806
    .end local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$3":I
    .restart local v10    # "label$iv":Ljava/lang/String;
    .restart local v11    # "$i$f$trace":I
    .restart local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .restart local p3    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/UseCaseGroup;)Landroidx/camera/core/Camera;
    .locals 13
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "useCaseGroup"    # Landroidx/camera/core/UseCaseGroup;

    move-object/from16 v1, p3

    const-string v0, "lifecycleOwner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cameraSelector"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "useCaseGroup"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 274
    const-string v11, "CX:bindToLifecycle-UseCaseGroup"

    .local v11, "label$iv":Ljava/lang/String;
    const/4 v12, 0x0

    .line 797
    .local v12, "$i$f$trace":I
    invoke-static {v11}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 798
    nop

    .line 799
    const/4 v0, 0x0

    .line 275
    .local v0, "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$2":I
    :try_start_0
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)I

    move-result v2

    const/4 v5, 0x2

    if-eq v2, v5, :cond_0

    .line 281
    const/4 v2, 0x1

    invoke-static {p0, v2}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$setCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;I)V

    .line 283
    nop

    .line 284
    nop

    .line 285
    nop

    .line 283
    nop

    .line 286
    new-instance v2, Landroidx/camera/core/LegacySessionConfig;

    invoke-direct {v2, v1}, Landroidx/camera/core/LegacySessionConfig;-><init>(Landroidx/camera/core/UseCaseGroup;)V

    move-object v8, v2

    check-cast v8, Landroidx/camera/core/SessionConfig;

    .line 283
    const/16 v9, 0x1c

    const/4 v10, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    invoke-static/range {v2 .. v10}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->bindToLifecycleInternal$default(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;ILjava/lang/Object;)Landroidx/camera/core/Camera;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    nop

    .line 288
    .local v5, "camera":Landroidx/camera/core/Camera;
    nop

    .line 799
    .end local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$2":I
    .end local v5    # "camera":Landroidx/camera/core/Camera;
    nop

    .line 801
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 799
    nop

    .line 289
    .end local v11    # "label$iv":Ljava/lang/String;
    .end local v12    # "$i$f$trace":I
    return-object v5

    .line 276
    .restart local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$2":I
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    :cond_0
    :try_start_1
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    .line 277
    const-string v3, "bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first."

    .line 276
    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v11    # "label$iv":Ljava/lang/String;
    .end local v12    # "$i$f$trace":I
    .end local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .end local p3    # "useCaseGroup":Landroidx/camera/core/UseCaseGroup;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 801
    .end local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$2":I
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .restart local p3    # "useCaseGroup":Landroidx/camera/core/UseCaseGroup;
    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public varargs bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;
    .locals 19
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "useCases"    # [Landroidx/camera/core/UseCase;

    const-string v0, "lifecycleOwner"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cameraSelector"

    move-object/from16 v3, p2

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "useCases"

    move-object/from16 v10, p3

    invoke-static {v10, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 251
    const-string v11, "CX:bindToLifecycle"

    .local v11, "label$iv":Ljava/lang/String;
    const/4 v12, 0x0

    .line 792
    .local v12, "$i$f$trace":I
    invoke-static {v11}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 793
    nop

    .line 794
    const/4 v0, 0x0

    .line 252
    .local v0, "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$1":I
    :try_start_0
    invoke-static/range {p0 .. p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)I

    move-result v1

    const/4 v4, 0x2

    if-eq v1, v4, :cond_0

    .line 258
    const/4 v1, 0x1

    move-object/from16 v4, p0

    invoke-static {v4, v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$setCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;I)V

    .line 260
    nop

    .line 261
    nop

    .line 262
    nop

    .line 260
    nop

    .line 263
    new-instance v13, Landroidx/camera/core/LegacySessionConfig;

    invoke-static {v10}, Lkotlin/collections/ArraysKt;->filterNotNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    const/16 v17, 0x6

    const/16 v18, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v13 .. v18}, Landroidx/camera/core/LegacySessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v7, v13

    check-cast v7, Landroidx/camera/core/SessionConfig;

    .line 260
    const/16 v8, 0x1c

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v9}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->bindToLifecycleInternal$default(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;ILjava/lang/Object;)Landroidx/camera/core/Camera;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    nop

    .line 265
    .local v4, "camera":Landroidx/camera/core/Camera;
    nop

    .line 794
    .end local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$1":I
    .end local v4    # "camera":Landroidx/camera/core/Camera;
    nop

    .line 796
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 794
    nop

    .line 266
    .end local v11    # "label$iv":Ljava/lang/String;
    .end local v12    # "$i$f$trace":I
    return-object v4

    .line 253
    .restart local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$1":I
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    .line 254
    const-string v2, "bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first"

    .line 253
    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v11    # "label$iv":Ljava/lang/String;
    .end local v12    # "$i$f$trace":I
    .end local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .end local p3    # "useCases":[Landroidx/camera/core/UseCase;
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 796
    .end local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$1":I
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .restart local p3    # "useCases":[Landroidx/camera/core/UseCase;
    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public bindToLifecycle(Ljava/util/List;)Landroidx/camera/core/ConcurrentCamera;
    .locals 24
    .param p1, "singleCameraConfigs"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;",
            ">;)",
            "Landroidx/camera/core/ConcurrentCamera;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v10, p1

    const-string v0, "getCompositionSettings(...)"

    const-string/jumbo v2, "singleCameraConfigs"

    invoke-static {v10, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 317
    const-string v11, "CX:bindToLifecycle-Concurrent"

    .local v11, "label$iv":Ljava/lang/String;
    const/4 v12, 0x0

    .line 807
    .local v12, "$i$f$trace":I
    invoke-static {v11}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 808
    nop

    .line 809
    const/4 v13, 0x0

    .line 318
    .local v13, "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$4":I
    :try_start_0
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-lt v2, v3, :cond_14

    .line 322
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v2

    if-gt v2, v3, :cond_13

    .line 328
    const/4 v2, 0x0

    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v4, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;

    move-object v14, v4

    .line 329
    .local v14, "firstCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    const/4 v4, 0x1

    invoke-interface {v10, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v5, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;

    move-object v15, v5

    .line 331
    .local v15, "secondCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    check-cast v5, Ljava/util/List;

    .line 332
    .local v5, "cameras":Ljava/util/List;
    nop

    .line 333
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v6

    .line 334
    invoke-virtual {v15}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v7

    .line 333
    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    const-string v7, "Camera is already running, call unbindAll() before binding more cameras."

    const-string v8, "getLifecycleOwner(...)"

    const-string v9, "getCameraSelector(...)"

    if-eqz v6, :cond_7

    .line 336
    :try_start_1
    invoke-static {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)I

    move-result v0

    if-eq v0, v3, :cond_6

    .line 341
    nop

    .line 342
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v0

    invoke-virtual {v15}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v2

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 343
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/UseCaseGroup;->getViewPort()Landroidx/camera/core/ViewPort;

    move-result-object v0

    .line 344
    invoke-virtual {v15}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/UseCaseGroup;->getViewPort()Landroidx/camera/core/ViewPort;

    move-result-object v2

    .line 343
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 345
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/UseCaseGroup;->getEffects()Ljava/util/List;

    move-result-object v0

    .line 346
    invoke-virtual {v15}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/UseCaseGroup;->getEffects()Ljava/util/List;

    move-result-object v2

    .line 345
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 353
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v2

    invoke-static {v2, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 354
    .local v2, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v3

    invoke-static {v3, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 355
    .local v3, "cameraSelector":Landroidx/camera/core/CameraSelector;
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/UseCaseGroup;->getViewPort()Landroidx/camera/core/ViewPort;

    move-result-object v0

    .line 356
    .local v0, "viewPort":Landroidx/camera/core/ViewPort;
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/camera/core/UseCaseGroup;->getEffects()Ljava/util/List;

    move-result-object v6

    const-string v7, "getEffects(...)"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 357
    .local v6, "effects":Ljava/util/List;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    check-cast v7, Ljava/util/List;

    .line 358
    .local v7, "useCases":Ljava/util/List;
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;

    .line 360
    .local v9, "config":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v9}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_1

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v18, v2

    .end local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v18, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    const-string v2, "next(...)"

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v4, Landroidx/camera/core/UseCase;

    .line 361
    .local v4, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v9}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/CameraSelector;->getPhysicalCameraId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .local v2, "it":Ljava/lang/String;
    const/16 v19, 0x0

    .line 362
    .local v19, "$i$a$-let-LifecycleCameraProviderImpl$bindToLifecycle$4$1":I
    invoke-virtual {v4, v2}, Landroidx/camera/core/UseCase;->setPhysicalCameraId(Ljava/lang/String;)V

    .line 363
    nop

    .line 361
    .end local v2    # "it":Ljava/lang/String;
    .end local v19    # "$i$a$-let-LifecycleCameraProviderImpl$bindToLifecycle$4$1":I
    move-object/from16 v2, v18

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    move-object/from16 v2, v18

    const/4 v4, 0x1

    .end local v4    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_1

    .line 365
    .end local v18    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v2, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    :cond_1
    move-object/from16 v18, v2

    .end local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local v18    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    invoke-virtual {v9}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v2

    const-string v4, "getUseCases(...)"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v7, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-object/from16 v2, v18

    const/4 v4, 0x1

    goto :goto_0

    .line 368
    .end local v9    # "config":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .end local v18    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    :cond_2
    move-object/from16 v18, v2

    .end local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local v18    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$setCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;I)V

    .line 370
    nop

    .line 371
    nop

    .line 372
    nop

    .line 370
    nop

    .line 374
    new-instance v2, Landroidx/camera/core/LegacySessionConfig;

    .line 375
    nop

    .line 376
    nop

    .line 377
    nop

    .line 374
    invoke-direct {v2, v7, v0, v6}, Landroidx/camera/core/LegacySessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;)V

    check-cast v2, Landroidx/camera/core/SessionConfig;

    .line 370
    const/16 v8, 0x1c

    const/4 v9, 0x0

    const/4 v4, 0x0

    move-object/from16 v16, v5

    .end local v5    # "cameras":Ljava/util/List;
    .local v16, "cameras":Ljava/util/List;
    const/4 v5, 0x0

    move-object/from16 v17, v6

    .end local v6    # "effects":Ljava/util/List;
    .local v17, "effects":Ljava/util/List;
    const/4 v6, 0x0

    move-object/from16 v10, v16

    move-object/from16 v16, v7

    move-object v7, v2

    move-object/from16 v2, v18

    .end local v7    # "useCases":Ljava/util/List;
    .end local v18    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v10, "cameras":Ljava/util/List;
    .local v16, "useCases":Ljava/util/List;
    invoke-static/range {v1 .. v9}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->bindToLifecycleInternal$default(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;ILjava/lang/Object;)Landroidx/camera/core/Camera;

    move-result-object v4

    .line 369
    nop

    .line 380
    .local v4, "camera":Landroidx/camera/core/Camera;
    invoke-interface {v10, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v23, v11

    .end local v0    # "viewPort":Landroidx/camera/core/ViewPort;
    .end local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local v3    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .end local v4    # "camera":Landroidx/camera/core/Camera;
    .end local v16    # "useCases":Ljava/util/List;
    .end local v17    # "effects":Ljava/util/List;
    goto/16 :goto_a

    .line 345
    .end local v10    # "cameras":Ljava/util/List;
    .restart local v5    # "cameras":Ljava/util/List;
    :cond_3
    move-object v10, v5

    .end local v5    # "cameras":Ljava/util/List;
    .restart local v10    # "cameras":Ljava/util/List;
    goto :goto_2

    .line 343
    .end local v10    # "cameras":Ljava/util/List;
    .restart local v5    # "cameras":Ljava/util/List;
    :cond_4
    move-object v10, v5

    .end local v5    # "cameras":Ljava/util/List;
    .restart local v10    # "cameras":Ljava/util/List;
    goto :goto_2

    .line 342
    .end local v10    # "cameras":Ljava/util/List;
    .restart local v5    # "cameras":Ljava/util/List;
    :cond_5
    move-object v10, v5

    .line 348
    .end local v5    # "cameras":Ljava/util/List;
    .restart local v10    # "cameras":Ljava/util/List;
    :goto_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 349
    const-string v2, "Two camera configs need to have the same lifecycle owner, view port and effects."

    .line 348
    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v11    # "label$iv":Ljava/lang/String;
    .end local v12    # "$i$f$trace":I
    .end local p1    # "singleCameraConfigs":Ljava/util/List;
    throw v0

    .line 337
    .end local v10    # "cameras":Ljava/util/List;
    .restart local v5    # "cameras":Ljava/util/List;
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "singleCameraConfigs":Ljava/util/List;
    :cond_6
    move-object v10, v5

    .end local v5    # "cameras":Ljava/util/List;
    .restart local v10    # "cameras":Ljava/util/List;
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 338
    nop

    .line 337
    invoke-direct {v0, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v11    # "label$iv":Ljava/lang/String;
    .end local v12    # "$i$f$trace":I
    .end local p1    # "singleCameraConfigs":Ljava/util/List;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 811
    .end local v10    # "cameras":Ljava/util/List;
    .end local v13    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$4":I
    .end local v14    # "firstCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .end local v15    # "secondCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "singleCameraConfigs":Ljava/util/List;
    :catchall_0
    move-exception v0

    :goto_3
    move-object/from16 v23, v11

    goto/16 :goto_d

    .line 382
    .restart local v5    # "cameras":Ljava/util/List;
    .restart local v13    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$4":I
    .restart local v14    # "firstCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .restart local v15    # "secondCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    :cond_7
    move-object v10, v5

    .end local v5    # "cameras":Ljava/util/List;
    .restart local v10    # "cameras":Ljava/util/List;
    :try_start_2
    invoke-virtual {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getContext$camera_lifecycle_release()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v5, "android.hardware.camera.concurrent"

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 388
    invoke-static {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_11

    .line 394
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 395
    .local v4, "cameraInfosToBind":Ljava/util/List;
    const/4 v5, 0x0

    .line 396
    .local v5, "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    const/4 v6, 0x0

    .line 397
    .local v6, "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    nop

    .line 398
    :try_start_3
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v7

    invoke-static {v7, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;

    move-result-object v7
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    move-object v5, v7

    .line 399
    :try_start_4
    invoke-virtual {v15}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v7

    invoke-static {v7, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;

    move-result-object v7
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    move-object v6, v7

    .line 403
    :try_start_5
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 404
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 405
    nop

    .line 406
    invoke-static {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getActiveConcurrentCameraInfos(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/util/Collection;

    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    move-result v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    if-nez v7, :cond_9

    .line 407
    :try_start_6
    invoke-static {v1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getActiveConcurrentCameraInfos(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/List;

    move-result-object v7

    invoke-static {v4, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    goto :goto_4

    .line 409
    :cond_8
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 410
    const-string v2, "Cameras are already running, call unbindAll() before binding more cameras."

    .line 409
    invoke-direct {v0, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v11    # "label$iv":Ljava/lang/String;
    .end local v12    # "$i$f$trace":I
    .end local p1    # "singleCameraConfigs":Ljava/util/List;
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 414
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "singleCameraConfigs":Ljava/util/List;
    :cond_9
    :goto_4
    :try_start_7
    invoke-static {v1, v3}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$setCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;I)V

    .line 419
    const/4 v7, 0x0

    .line 420
    .local v7, "isDualCameraVideoCapture":Z
    nop

    .line 421
    nop

    .line 422
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v2

    .line 423
    invoke-virtual {v15}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v3

    .line 421
    invoke-static {v2, v3}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    if-eqz v2, :cond_e

    .line 424
    :try_start_8
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_d

    .line 426
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/UseCase;

    .line 427
    .local v2, "useCase0":Landroidx/camera/core/UseCase;
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v3

    move-object/from16 v16, v4

    const/4 v4, 0x1

    .end local v4    # "cameraInfosToBind":Ljava/util/List;
    .local v16, "cameraInfosToBind":Ljava/util/List;
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 429
    .local v3, "useCase1":Landroidx/camera/core/UseCase;
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v1, v2}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$isVideoCapture(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/UseCase;)Z

    move-result v17

    if-eqz v17, :cond_a

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v1, v3}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$isPreview(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/UseCase;)Z

    move-result v17

    if-nez v17, :cond_b

    .line 430
    :cond_a
    invoke-static {v1, v2}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$isPreview(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/UseCase;)Z

    move-result v17

    if-eqz v17, :cond_c

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v1, v3}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$isVideoCapture(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/UseCase;)Z

    move-result v17
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    if-eqz v17, :cond_c

    :cond_b
    move/from16 v18, v4

    goto :goto_5

    :cond_c
    const/16 v18, 0x0

    .line 428
    :goto_5
    move/from16 v7, v18

    move/from16 v17, v7

    goto :goto_7

    .line 424
    .end local v2    # "useCase0":Landroidx/camera/core/UseCase;
    .end local v3    # "useCase1":Landroidx/camera/core/UseCase;
    .end local v16    # "cameraInfosToBind":Ljava/util/List;
    .restart local v4    # "cameraInfosToBind":Ljava/util/List;
    :cond_d
    move-object/from16 v16, v4

    .end local v4    # "cameraInfosToBind":Ljava/util/List;
    .restart local v16    # "cameraInfosToBind":Ljava/util/List;
    goto :goto_6

    .line 421
    .end local v16    # "cameraInfosToBind":Ljava/util/List;
    .restart local v4    # "cameraInfosToBind":Ljava/util/List;
    :cond_e
    move-object/from16 v16, v4

    .line 433
    .end local v4    # "cameraInfosToBind":Ljava/util/List;
    .restart local v16    # "cameraInfosToBind":Ljava/util/List;
    :goto_6
    move/from16 v17, v7

    .end local v7    # "isDualCameraVideoCapture":Z
    .local v17, "isDualCameraVideoCapture":Z
    :goto_7
    const-string v2, "getUseCaseGroup(...)"

    if-eqz v17, :cond_f

    .line 434
    nop

    .line 435
    nop

    .line 436
    :try_start_9
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v3

    invoke-static {v3, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 437
    move-object v4, v3

    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v3

    invoke-static {v3, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 438
    move-object v7, v4

    invoke-virtual {v15}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v4

    .line 439
    move-object v8, v5

    .end local v5    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .local v8, "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCompositionSettings()Landroidx/camera/core/CompositionSettings;

    move-result-object v5

    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 440
    move-object v9, v6

    .end local v6    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .local v9, "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    invoke-virtual {v15}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCompositionSettings()Landroidx/camera/core/CompositionSettings;

    move-result-object v6

    invoke-static {v6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 441
    new-instance v0, Landroidx/camera/core/LegacySessionConfig;

    invoke-virtual {v14}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v1

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Landroidx/camera/core/LegacySessionConfig;-><init>(Landroidx/camera/core/UseCaseGroup;)V

    check-cast v0, Landroidx/camera/core/SessionConfig;

    .line 435
    move-object/from16 v1, p0

    move-object v2, v7

    move-object/from16 v18, v8

    move-object v7, v0

    move-object v0, v9

    .end local v8    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v9    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .local v0, "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .local v18, "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    invoke-static/range {v1 .. v7}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$bindToLifecycleInternal(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;)Landroidx/camera/core/Camera;

    move-result-object v2

    .line 434
    invoke-interface {v10, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    move-object/from16 v1, p0

    move-object/from16 v23, v11

    move-object/from16 v11, v16

    goto/16 :goto_9

    .line 811
    .end local v0    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v10    # "cameras":Ljava/util/List;
    .end local v13    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$4":I
    .end local v14    # "firstCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .end local v15    # "secondCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .end local v16    # "cameraInfosToBind":Ljava/util/List;
    .end local v17    # "isDualCameraVideoCapture":Z
    .end local v18    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    :catchall_1
    move-exception v0

    move-object/from16 v1, p0

    goto/16 :goto_3

    .line 445
    .restart local v5    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .restart local v6    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .restart local v10    # "cameras":Ljava/util/List;
    .restart local v13    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$4":I
    .restart local v14    # "firstCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .restart local v15    # "secondCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .restart local v16    # "cameraInfosToBind":Ljava/util/List;
    .restart local v17    # "isDualCameraVideoCapture":Z
    :cond_f
    move-object/from16 v18, v5

    move-object v0, v6

    .end local v5    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v6    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .restart local v0    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .restart local v18    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    :try_start_a
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_8
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;

    move-object/from16 v20, v1

    .line 447
    .local v20, "config":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    nop

    .line 448
    invoke-static/range {v20 .. v20}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual/range {v20 .. v20}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v1

    invoke-static {v1, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 449
    invoke-virtual/range {v20 .. v20}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v3

    invoke-static {v3, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 447
    nop

    .line 451
    new-instance v4, Landroidx/camera/core/LegacySessionConfig;

    invoke-virtual/range {v20 .. v20}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v5

    invoke-static {v5, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Landroidx/camera/core/LegacySessionConfig;-><init>(Landroidx/camera/core/UseCaseGroup;)V

    move-object v7, v4

    check-cast v7, Landroidx/camera/core/SessionConfig;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 447
    move-object v4, v8

    const/16 v8, 0x1c

    move-object v5, v9

    const/4 v9, 0x0

    move-object v6, v4

    const/4 v4, 0x0

    move-object/from16 v21, v5

    const/4 v5, 0x0

    move-object/from16 v22, v6

    const/4 v6, 0x0

    move-object/from16 v23, v11

    move-object/from16 v11, v16

    move-object/from16 v16, v2

    move-object v2, v1

    move-object/from16 v1, p0

    .end local v16    # "cameraInfosToBind":Ljava/util/List;
    .local v11, "cameraInfosToBind":Ljava/util/List;
    .local v23, "label$iv":Ljava/lang/String;
    :try_start_b
    invoke-static/range {v1 .. v9}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->bindToLifecycleInternal$default(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/CompositionSettings;Landroidx/camera/core/SessionConfig;ILjava/lang/Object;)Landroidx/camera/core/Camera;

    move-result-object v2

    .line 446
    nop

    .line 453
    .local v2, "camera":Landroidx/camera/core/Camera;
    invoke-interface {v10, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v2, v16

    move-object/from16 v9, v21

    move-object/from16 v8, v22

    move-object/from16 v16, v11

    move-object/from16 v11, v23

    .end local v2    # "camera":Landroidx/camera/core/Camera;
    goto :goto_8

    .line 445
    .end local v20    # "config":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .end local v23    # "label$iv":Ljava/lang/String;
    .local v11, "label$iv":Ljava/lang/String;
    .restart local v16    # "cameraInfosToBind":Ljava/util/List;
    :cond_10
    move-object/from16 v1, p0

    move-object/from16 v23, v11

    move-object/from16 v11, v16

    .line 456
    .end local v16    # "cameraInfosToBind":Ljava/util/List;
    .local v11, "cameraInfosToBind":Ljava/util/List;
    .restart local v23    # "label$iv":Ljava/lang/String;
    :goto_9
    invoke-static {v1, v11}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$setActiveConcurrentCameraInfos(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Ljava/util/List;)V

    .line 458
    .end local v0    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v11    # "cameraInfosToBind":Ljava/util/List;
    .end local v17    # "isDualCameraVideoCapture":Z
    .end local v18    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    :goto_a
    new-instance v0, Landroidx/camera/core/ConcurrentCamera;

    invoke-direct {v0, v10}, Landroidx/camera/core/ConcurrentCamera;-><init>(Ljava/util/List;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 809
    .end local v10    # "cameras":Ljava/util/List;
    .end local v13    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$4":I
    .end local v14    # "firstCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .end local v15    # "secondCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    nop

    .line 811
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 809
    nop

    .line 459
    .end local v12    # "$i$f$trace":I
    .end local v23    # "label$iv":Ljava/lang/String;
    return-object v0

    .line 811
    .local v11, "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    :catchall_2
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_c

    .line 400
    .restart local v4    # "cameraInfosToBind":Ljava/util/List;
    .restart local v5    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .restart local v6    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .restart local v10    # "cameras":Ljava/util/List;
    .restart local v13    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$4":I
    .restart local v14    # "firstCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .restart local v15    # "secondCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    :catch_0
    move-exception v0

    move-object/from16 v18, v5

    move-object/from16 v23, v11

    move-object v11, v4

    .end local v4    # "cameraInfosToBind":Ljava/util/List;
    .end local v5    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .local v11, "cameraInfosToBind":Ljava/util/List;
    .restart local v18    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .restart local v23    # "label$iv":Ljava/lang/String;
    goto :goto_b

    .end local v18    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v23    # "label$iv":Ljava/lang/String;
    .restart local v4    # "cameraInfosToBind":Ljava/util/List;
    .restart local v5    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .local v11, "label$iv":Ljava/lang/String;
    :catch_1
    move-exception v0

    move-object/from16 v23, v11

    move-object v11, v4

    .line 401
    .end local v4    # "cameraInfosToBind":Ljava/util/List;
    .local v0, "<unused var>":Ljava/lang/IllegalArgumentException;
    .local v11, "cameraInfosToBind":Ljava/util/List;
    .restart local v23    # "label$iv":Ljava/lang/String;
    :goto_b
    :try_start_c
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid camera selectors in camera configs."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v12    # "$i$f$trace":I
    .end local v23    # "label$iv":Ljava/lang/String;
    .end local p1    # "singleCameraConfigs":Ljava/util/List;
    throw v2

    .line 389
    .end local v0    # "<unused var>":Ljava/lang/IllegalArgumentException;
    .end local v5    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v6    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .local v11, "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "singleCameraConfigs":Ljava/util/List;
    :cond_11
    move-object/from16 v23, v11

    .end local v11    # "label$iv":Ljava/lang/String;
    .restart local v23    # "label$iv":Ljava/lang/String;
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 390
    nop

    .line 389
    invoke-direct {v0, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v12    # "$i$f$trace":I
    .end local v23    # "label$iv":Ljava/lang/String;
    .end local p1    # "singleCameraConfigs":Ljava/util/List;
    throw v0

    .line 383
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "singleCameraConfigs":Ljava/util/List;
    :cond_12
    move-object/from16 v23, v11

    .end local v11    # "label$iv":Ljava/lang/String;
    .restart local v23    # "label$iv":Ljava/lang/String;
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 384
    const-string v2, "Concurrent camera is not supported on the device."

    .line 383
    invoke-direct {v0, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v12    # "$i$f$trace":I
    .end local v23    # "label$iv":Ljava/lang/String;
    .end local p1    # "singleCameraConfigs":Ljava/util/List;
    throw v0

    .line 323
    .end local v10    # "cameras":Ljava/util/List;
    .end local v14    # "firstCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .end local v15    # "secondCameraConfig":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "singleCameraConfigs":Ljava/util/List;
    :cond_13
    move-object/from16 v23, v11

    .end local v11    # "label$iv":Ljava/lang/String;
    .restart local v23    # "label$iv":Ljava/lang/String;
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 324
    const-string v2, "Concurrent camera is only supporting two cameras at maximum."

    .line 323
    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v12    # "$i$f$trace":I
    .end local v23    # "label$iv":Ljava/lang/String;
    .end local p1    # "singleCameraConfigs":Ljava/util/List;
    throw v0

    .line 319
    .restart local v11    # "label$iv":Ljava/lang/String;
    .restart local v12    # "$i$f$trace":I
    .restart local p1    # "singleCameraConfigs":Ljava/util/List;
    :cond_14
    move-object/from16 v23, v11

    .end local v11    # "label$iv":Ljava/lang/String;
    .restart local v23    # "label$iv":Ljava/lang/String;
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "Concurrent camera needs two camera configs."

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v12    # "$i$f$trace":I
    .end local v23    # "label$iv":Ljava/lang/String;
    .end local p1    # "singleCameraConfigs":Ljava/util/List;
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 811
    .end local v13    # "$i$a$-trace-LifecycleCameraProviderImpl$bindToLifecycle$4":I
    .restart local v12    # "$i$f$trace":I
    .restart local v23    # "label$iv":Ljava/lang/String;
    .restart local p1    # "singleCameraConfigs":Ljava/util/List;
    :catchall_3
    move-exception v0

    goto :goto_d

    .end local v23    # "label$iv":Ljava/lang/String;
    .restart local v11    # "label$iv":Ljava/lang/String;
    :catchall_4
    move-exception v0

    :goto_c
    move-object/from16 v23, v11

    .end local v11    # "label$iv":Ljava/lang/String;
    .restart local v23    # "label$iv":Ljava/lang/String;
    :goto_d
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public final configure$camera_lifecycle_release(Landroidx/camera/core/CameraXConfig;)V
    .locals 7
    .param p1, "cameraXConfig"    # Landroidx/camera/core/CameraXConfig;

    const-string v0, "cameraXConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 139
    const-string v0, "CX:configureInstanceInternal"

    .local v0, "label$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 767
    .local v1, "$i$f$trace":I
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 768
    nop

    .line 769
    const/4 v2, 0x0

    .line 140
    .local v2, "$i$a$-trace-LifecycleCameraProviderImpl$configure$1":I
    :try_start_0
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLock$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v4, 0x0

    .line 141
    .local v4, "$i$a$-synchronized-LifecycleCameraProviderImpl$configure$1$1":I
    :try_start_1
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    invoke-virtual {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraXConfigProvider$camera_lifecycle_release()Landroidx/camera/core/CameraXConfig$Provider;

    move-result-object v5

    if-nez v5, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 144
    :goto_0
    const-string v6, "CameraX has already been configured. To use a different configuration, shutdown() must be called."

    .line 142
    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 147
    new-instance v5, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$configure$1$1$1;

    invoke-direct {v5, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$configure$1$1$1;-><init>(Landroidx/camera/core/CameraXConfig;)V

    check-cast v5, Landroidx/camera/core/CameraXConfig$Provider;

    invoke-virtual {p0, v5}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->setCameraXConfigProvider$camera_lifecycle_release(Landroidx/camera/core/CameraXConfig$Provider;)V

    .line 148
    nop

    .end local v4    # "$i$a$-synchronized-LifecycleCameraProviderImpl$configure$1$1":I
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 140
    :try_start_2
    monitor-exit v3

    .line 149
    nop

    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$configure$1":I
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 769
    nop

    .line 771
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 769
    nop

    .line 149
    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    return-void

    .line 140
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    .restart local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$configure$1":I
    :catchall_0
    move-exception v4

    :try_start_3
    monitor-exit v3

    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    .end local p1    # "cameraXConfig":Landroidx/camera/core/CameraXConfig;
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 771
    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$configure$1":I
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    .restart local p1    # "cameraXConfig":Landroidx/camera/core/CameraXConfig;
    :catchall_1
    move-exception v2

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v2
.end method

.method public getAvailableCameraInfos()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation

    .line 463
    const-string v0, "CX:getAvailableCameraInfos"

    .local v0, "label$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 812
    .local v1, "$i$f$trace":I
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 813
    nop

    .line 814
    const/4 v2, 0x0

    .line 464
    .local v2, "$i$a$-trace-LifecycleCameraProviderImpl$availableCameraInfos$1":I
    :try_start_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    check-cast v3, Ljava/util/List;

    .line 465
    .local v3, "availableCameraInfos":Ljava/util/List;
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v4}, Landroidx/camera/core/CameraX;->getCameraRepository()Landroidx/camera/core/impl/CameraRepository;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v4

    const-string v5, "getCameras(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v4, Ljava/util/Set;

    .line 466
    .local v4, "cameras":Ljava/util/Set;
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/CameraInternal;

    .line 467
    .local v6, "camera":Landroidx/camera/core/impl/CameraInternal;
    invoke-interface {v6}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v7

    const-string v8, "getCameraInfo(...)"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 469
    .end local v6    # "camera":Landroidx/camera/core/impl/CameraInternal;
    :cond_0
    nop

    .line 814
    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$availableCameraInfos$1":I
    .end local v3    # "availableCameraInfos":Ljava/util/List;
    .end local v4    # "cameras":Ljava/util/Set;
    nop

    .line 816
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 814
    nop

    .line 470
    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    return-object v3

    .line 816
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    :catchall_0
    move-exception v2

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v2
.end method

.method public getAvailableConcurrentCameraInfos()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;>;"
        }
    .end annotation

    .line 474
    const-string v0, "CX:getAvailableConcurrentCameraInfos"

    .local v0, "label$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 817
    .local v1, "$i$f$trace":I
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 818
    nop

    .line 819
    const/4 v2, 0x0

    .line 475
    .local v2, "$i$a$-trace-LifecycleCameraProviderImpl$availableConcurrentCameraInfos$1":I
    :try_start_0
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v3

    invoke-static {v3}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v3}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v3

    invoke-static {v3}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v3}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/concurrent/CameraCoordinator;->getConcurrentCameraSelectors()Ljava/util/List;

    move-result-object v3

    const-string v4, "getConcurrentCameraSelectors(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 477
    nop

    .line 480
    .local v3, "concurrentCameraSelectorLists":Ljava/util/List;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/List;

    .line 481
    .local v4, "availableConcurrentCameraInfos":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 482
    .local v6, "cameraSelectors":Ljava/util/List;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    check-cast v7, Ljava/util/List;

    .line 483
    .local v7, "cameraInfos":Ljava/util/List;
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/camera/core/CameraSelector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 484
    .local v9, "cameraSelector":Landroidx/camera/core/CameraSelector;
    const/4 v10, 0x0

    .line 485
    .local v10, "cameraInfo":Landroidx/camera/core/CameraInfo;
    nop

    .line 486
    :try_start_1
    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0, v9}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;

    move-result-object v11
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 490
    .end local v10    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    .local v11, "cameraInfo":Landroidx/camera/core/CameraInfo;
    :try_start_2
    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v11    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    goto :goto_1

    .line 487
    .restart local v10    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    :catch_0
    move-exception v11

    .line 488
    .local v11, "<unused var>":Ljava/lang/IllegalArgumentException;
    goto :goto_1

    .line 492
    .end local v9    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .end local v10    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v11    # "<unused var>":Ljava/lang/IllegalArgumentException;
    :cond_0
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v7    # "cameraInfos":Ljava/util/List;
    goto :goto_0

    .line 494
    .end local v6    # "cameraSelectors":Ljava/util/List;
    :cond_1
    nop

    .line 819
    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$availableConcurrentCameraInfos$1":I
    .end local v3    # "concurrentCameraSelectorLists":Ljava/util/List;
    .end local v4    # "availableConcurrentCameraInfos":Ljava/util/List;
    nop

    .line 821
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 819
    nop

    .line 495
    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    return-object v4

    .line 821
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    :catchall_0
    move-exception v2

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v2
.end method

.method public getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;
    .locals 10
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    const-string v0, "cameraSelector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 664
    const-string v0, "CX:getCameraInfo"

    .local v0, "label$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 828
    .local v1, "$i$f$trace":I
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 829
    nop

    .line 830
    const/4 v2, 0x0

    .line 666
    .local v2, "$i$a$-trace-LifecycleCameraProviderImpl$getCameraInfo$1":I
    :try_start_0
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v3}, Landroidx/camera/core/CameraX;->getCameraRepository()Landroidx/camera/core/impl/CameraRepository;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroidx/camera/core/CameraSelector;->select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v3

    const-string v4, "getCameraInfoInternal(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 665
    nop

    .line 667
    .local v3, "cameraInfoInternal":Landroidx/camera/core/impl/CameraInfoInternal;
    move-object v4, v3

    check-cast v4, Landroidx/camera/core/CameraInfo;

    invoke-static {p0, p1, v4}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraConfig(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/CameraInfo;)Landroidx/camera/core/impl/CameraConfig;

    move-result-object v4

    .line 670
    .local v4, "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    sget-object v5, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    .line 671
    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v6

    const-string v7, "getCameraId(...)"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 672
    nop

    .line 673
    invoke-interface {v4}, Landroidx/camera/core/impl/CameraConfig;->getCompatibilityId()Landroidx/camera/core/impl/Identifier;

    move-result-object v7

    .line 670
    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8, v7}, Landroidx/camera/core/CameraIdentifier$Companion;->create(Ljava/lang/String;Ljava/lang/String;Landroidx/camera/core/impl/Identifier;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v5

    .line 669
    nop

    .line 675
    .local v5, "key":Landroidx/camera/core/CameraIdentifier;
    const/4 v6, 0x0

    .line 676
    .local v6, "adapterCameraInfo":Ljava/lang/Object;
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLock$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v8, 0x0

    .line 677
    .local v8, "$i$a$-synchronized-LifecycleCameraProviderImpl$getCameraInfo$1$1":I
    :try_start_1
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraInfoMap$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/Map;

    move-result-object v9

    invoke-interface {v9, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    move-object v6, v9

    .line 678
    if-nez v6, :cond_0

    .line 679
    new-instance v9, Landroidx/camera/core/impl/AdapterCameraInfo;

    invoke-direct {v9, v3, v4}, Landroidx/camera/core/impl/AdapterCameraInfo;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/CameraConfig;)V

    move-object v6, v9

    .line 680
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraInfoMap$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/Map;

    move-result-object v9

    invoke-interface {v9, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 682
    :cond_0
    nop

    .end local v8    # "$i$a$-synchronized-LifecycleCameraProviderImpl$getCameraInfo$1$1":I
    sget-object v8, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 676
    :try_start_2
    monitor-exit v7

    .line 684
    move-object v7, v6

    check-cast v7, Landroidx/camera/core/impl/AdapterCameraInfo;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 830
    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$getCameraInfo$1":I
    .end local v3    # "cameraInfoInternal":Landroidx/camera/core/impl/CameraInfoInternal;
    .end local v4    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .end local v5    # "key":Landroidx/camera/core/CameraIdentifier;
    .end local v6    # "adapterCameraInfo":Ljava/lang/Object;
    nop

    .line 832
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 830
    nop

    .line 832
    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    check-cast v7, Landroidx/camera/core/CameraInfo;

    .line 685
    return-object v7

    .line 676
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    .restart local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$getCameraInfo$1":I
    .restart local v3    # "cameraInfoInternal":Landroidx/camera/core/impl/CameraInfoInternal;
    .restart local v4    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .restart local v5    # "key":Landroidx/camera/core/CameraIdentifier;
    .restart local v6    # "adapterCameraInfo":Ljava/lang/Object;
    :catchall_0
    move-exception v8

    :try_start_3
    monitor-exit v7

    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    .end local p1    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    throw v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 832
    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$getCameraInfo$1":I
    .end local v3    # "cameraInfoInternal":Landroidx/camera/core/impl/CameraInfoInternal;
    .end local v4    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .end local v5    # "key":Landroidx/camera/core/CameraIdentifier;
    .end local v6    # "adapterCameraInfo":Ljava/lang/Object;
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    .restart local p1    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    :catchall_1
    move-exception v2

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v2
.end method

.method public final getCameraXConfigProvider$camera_lifecycle_release()Landroidx/camera/core/CameraXConfig$Provider;
    .locals 1

    .line 79
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    return-object v0
.end method

.method public getConfigImplType()I
    .locals 1

    .line 90
    iget v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->configImplType:I

    return v0
.end method

.method public final getContext$camera_lifecycle_release()Landroid/content/Context;
    .locals 1

    .line 86
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->context:Landroid/content/Context;

    return-object v0
.end method

.method public hasCamera(Landroidx/camera/core/CameraSelector;)Z
    .locals 5
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraInfoUnavailableException;
        }
    .end annotation

    const-string v0, "cameraSelector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 235
    const-string v0, "CX:hasCamera"

    .local v0, "label$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 787
    .local v1, "$i$f$trace":I
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 788
    nop

    .line 789
    const/4 v2, 0x0

    .line 236
    .local v2, "$i$a$-trace-LifecycleCameraProviderImpl$hasCamera$1":I
    nop

    .line 237
    :try_start_0
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraX$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/core/CameraX;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v3}, Landroidx/camera/core/CameraX;->getCameraRepository()Landroidx/camera/core/impl/CameraRepository;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroidx/camera/core/CameraSelector;->select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    const/4 v3, 0x1

    goto :goto_0

    .line 791
    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$hasCamera$1":I
    :catchall_0
    move-exception v2

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v2

    .line 238
    .restart local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$hasCamera$1":I
    :catch_0
    move-exception v3

    .line 239
    .local v3, "<unused var>":Ljava/lang/IllegalArgumentException;
    const/4 v4, 0x0

    move v3, v4

    .line 789
    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$hasCamera$1":I
    .end local v3    # "<unused var>":Ljava/lang/IllegalArgumentException;
    :goto_0
    nop

    .line 791
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 789
    nop

    .line 243
    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    return v3
.end method

.method public final initAsync$camera_lifecycle_release(Landroid/content/Context;Landroidx/camera/core/CameraXConfig;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraXConfig"    # Landroidx/camera/core/CameraXConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/camera/core/CameraXConfig;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 96
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 97
    .local v1, "$i$a$-synchronized-LifecycleCameraProviderImpl$initAsync$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-eqz v2, :cond_0

    .line 98
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    const-string v3, "null cannot be cast to non-null type com.google.common.util.concurrent.ListenableFuture<java.lang.Void>"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "$i$a$-synchronized-LifecycleCameraProviderImpl$initAsync$1":I
    monitor-exit v0

    return-object v2

    .line 100
    .restart local v1    # "$i$a$-synchronized-LifecycleCameraProviderImpl$initAsync$1":I
    :cond_0
    if-eqz p2, :cond_1

    move-object v2, p2

    .line 766
    .local v2, "it":Landroidx/camera/core/CameraXConfig;
    const/4 v3, 0x0

    .line 100
    .local v3, "$i$a$-let-LifecycleCameraProviderImpl$initAsync$1$1":I
    :try_start_1
    invoke-virtual {p0, v2}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->configure$camera_lifecycle_release(Landroidx/camera/core/CameraXConfig;)V

    .line 101
    .end local v2    # "it":Landroidx/camera/core/CameraXConfig;
    .end local v3    # "$i$a$-let-LifecycleCameraProviderImpl$initAsync$1$1":I
    :cond_1
    new-instance v2, Landroidx/camera/core/CameraX;

    iget-object v3, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    invoke-direct {v2, p1, v3}, Landroidx/camera/core/CameraX;-><init>(Landroid/content/Context;Landroidx/camera/core/CameraXConfig$Provider;)V

    .line 102
    .local v2, "cameraX":Landroidx/camera/core/CameraX;
    invoke-virtual {v2}, Landroidx/camera/core/CameraX;->getConfigImplType()I

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->setConfigImplType(I)V

    .line 105
    iget-object v3, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXShutdownFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v3}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v3

    .line 106
    new-instance v4, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$$ExternalSyntheticLambda1;

    invoke-direct {v4, v2}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/CameraX;)V

    new-instance v5, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$$ExternalSyntheticLambda2;

    invoke-direct {v5, v4}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$$ExternalSyntheticLambda2;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v3

    const-string/jumbo v4, "transformAsync(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    nop

    .line 108
    .local v3, "initFuture":Landroidx/camera/core/impl/utils/futures/FutureChain;
    move-object v4, v3

    check-cast v4, Lcom/google/common/util/concurrent/ListenableFuture;

    iput-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 111
    move-object v4, v3

    check-cast v4, Lcom/google/common/util/concurrent/ListenableFuture;

    .line 112
    new-instance v5, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$initAsync$1$2;

    invoke-direct {v5, p0, v2, p1}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$initAsync$1$2;-><init>(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;Landroidx/camera/core/CameraX;Landroid/content/Context;)V

    check-cast v5, Landroidx/camera/core/impl/utils/futures/FutureCallback;

    .line 123
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v6

    .line 110
    invoke-static {v4, v5, v6}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 126
    move-object v4, v3

    check-cast v4, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v4}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    const-string v5, "nonCancellationPropagating(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "$i$a$-synchronized-LifecycleCameraProviderImpl$initAsync$1":I
    .end local v2    # "cameraX":Landroidx/camera/core/CameraX;
    .end local v3    # "initFuture":Landroidx/camera/core/impl/utils/futures/FutureChain;
    monitor-exit v0

    return-object v4

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public isBound(Landroidx/camera/core/SessionConfig;)Z
    .locals 3
    .param p1, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    const-string/jumbo v0, "sessionConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    invoke-virtual {v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameras()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "next(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 186
    .local v1, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-virtual {v1, p1}, Landroidx/camera/lifecycle/LifecycleCamera;->isBound(Landroidx/camera/core/SessionConfig;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 187
    const/4 v0, 0x1

    return v0

    .line 191
    .end local v1    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public isBound(Landroidx/camera/core/UseCase;)Z
    .locals 3
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    const-string/jumbo v0, "useCase"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 175
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    invoke-virtual {v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameras()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "next(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 176
    .local v1, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-virtual {v1, p1}, Landroidx/camera/lifecycle/LifecycleCamera;->isBound(Landroidx/camera/core/UseCase;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 177
    const/4 v0, 0x1

    return v0

    .line 181
    .end local v1    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public isConcurrentCameraModeOn()Z
    .locals 2

    .line 503
    invoke-direct {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->getCameraOperatingMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeCameraPresenceListener(Landroidx/camera/core/CameraPresenceListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/camera/core/CameraPresenceListener;

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 694
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraAvailabilityProvider()Landroidx/camera/core/impl/CameraPresenceProvider;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->removeCameraPresenceListener(Landroidx/camera/core/CameraPresenceListener;)V

    .line 695
    return-void
.end method

.method public final setCameraXConfigProvider$camera_lifecycle_release(Landroidx/camera/core/CameraXConfig$Provider;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/camera/core/CameraXConfig$Provider;

    .line 79
    iput-object p1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    .line 81
    return-void
.end method

.method public setConfigImplType(I)V
    .locals 0
    .param p1, "<set-?>"    # I

    .line 90
    iput p1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->configImplType:I

    return-void
.end method

.method public final setContext$camera_lifecycle_release(Landroid/content/Context;)V
    .locals 0
    .param p1, "<set-?>"    # Landroid/content/Context;

    .line 86
    iput-object p1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->context:Landroid/content/Context;

    return-void
.end method

.method public final shutdownAsync$camera_lifecycle_release(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 5
    .param p1, "clearConfigProvider"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 152
    new-instance v0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/Threads;->runOnMainSync(Ljava/lang/Runnable;)V

    .line 158
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->shutdown()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 157
    nop

    .line 160
    .local v0, "shutdownFuture":Lcom/google/common/util/concurrent/ListenableFuture;
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lock:Ljava/lang/Object;

    monitor-enter v2

    const/4 v3, 0x0

    .line 161
    .local v3, "$i$a$-synchronized-LifecycleCameraProviderImpl$shutdownAsync$2":I
    if-eqz p1, :cond_1

    .line 162
    :try_start_0
    iput-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    .line 164
    :cond_1
    iput-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 165
    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraXShutdownFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 166
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraInfoMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 167
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->lifecycleCameraKeys:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->clear()V

    .line 168
    nop

    .end local v3    # "$i$a$-synchronized-LifecycleCameraProviderImpl$shutdownAsync$2":I
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    monitor-exit v2

    .line 169
    iput-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->cameraX:Landroidx/camera/core/CameraX;

    .line 170
    iput-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->context:Landroid/content/Context;

    .line 171
    return-object v0

    .line 160
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public unbind(Landroidx/camera/core/SessionConfig;)V
    .locals 5
    .param p1, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    const-string/jumbo v0, "sessionConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 213
    const-string v0, "CX:unbind-sessionConfig"

    .local v0, "label$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 777
    .local v1, "$i$f$trace":I
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 778
    nop

    .line 779
    const/4 v2, 0x0

    .line 214
    .local v2, "$i$a$-trace-LifecycleCameraProviderImpl$unbind$2":I
    :try_start_0
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 215
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    .line 222
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraRepository$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/lifecycle/LifecycleCameraRepository;

    move-result-object v3

    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraKeys$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/HashSet;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    invoke-virtual {v3, p1, v4}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unbind(Landroidx/camera/core/SessionConfig;Ljava/util/Set;)V

    .line 223
    nop

    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$unbind$2":I
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 779
    nop

    .line 781
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 779
    nop

    .line 223
    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    return-void

    .line 216
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    .restart local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$unbind$2":I
    :cond_0
    :try_start_1
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    .line 217
    const-string v4, "Unbind SessionConfig is not supported in concurrent camera mode call unbindAll() first."

    .line 216
    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    .end local p1    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 781
    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$unbind$2":I
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    .restart local p1    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    :catchall_0
    move-exception v2

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v2
.end method

.method public varargs unbind([Landroidx/camera/core/UseCase;)V
    .locals 10
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    const-string/jumbo v0, "useCases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 196
    const-string v1, "CX:unbind"

    .local v1, "label$iv":Ljava/lang/String;
    const/4 v2, 0x0

    .line 772
    .local v2, "$i$f$trace":I
    invoke-static {v1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 773
    nop

    .line 774
    const/4 v0, 0x0

    .line 197
    .local v0, "$i$a$-trace-LifecycleCameraProviderImpl$unbind$1":I
    :try_start_0
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 199
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    .line 205
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraRepository$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/lifecycle/LifecycleCameraRepository;

    move-result-object v3

    .line 206
    new-instance v4, Landroidx/camera/core/LegacySessionConfig;

    invoke-static {p1}, Lkotlin/collections/ArraysKt;->filterNotNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const/4 v8, 0x6

    const/4 v9, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v4 .. v9}, Landroidx/camera/core/LegacySessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v4, Landroidx/camera/core/SessionConfig;

    .line 207
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraKeys$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/HashSet;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    .line 205
    invoke-virtual {v3, v4, v5}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unbind(Landroidx/camera/core/SessionConfig;Ljava/util/Set;)V

    .line 209
    nop

    .end local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$unbind$1":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 774
    nop

    .line 776
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 774
    nop

    .line 209
    .end local v1    # "label$iv":Ljava/lang/String;
    .end local v2    # "$i$f$trace":I
    return-void

    .line 200
    .restart local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$unbind$1":I
    .restart local v1    # "label$iv":Ljava/lang/String;
    .restart local v2    # "$i$f$trace":I
    :cond_0
    :try_start_1
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    .line 201
    const-string v4, "Unbind UseCase is not supported in concurrent camera mode, call unbindAll() first."

    .line 200
    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .end local v1    # "label$iv":Ljava/lang/String;
    .end local v2    # "$i$f$trace":I
    .end local p1    # "useCases":[Landroidx/camera/core/UseCase;
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 776
    .end local v0    # "$i$a$-trace-LifecycleCameraProviderImpl$unbind$1":I
    .restart local v1    # "label$iv":Ljava/lang/String;
    .restart local v2    # "$i$f$trace":I
    .restart local p1    # "useCases":[Landroidx/camera/core/UseCase;
    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public unbindAll()V
    .locals 5

    .line 227
    const-string v0, "CX:unbindAll"

    .local v0, "label$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 782
    .local v1, "$i$f$trace":I
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 783
    nop

    .line 784
    const/4 v2, 0x0

    .line 228
    .local v2, "$i$a$-trace-LifecycleCameraProviderImpl$unbindAll$1":I
    :try_start_0
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 229
    const/4 v3, 0x0

    invoke-static {p0, v3}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$setCameraOperatingMode(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;I)V

    .line 230
    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraRepository$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Landroidx/camera/lifecycle/LifecycleCameraRepository;

    move-result-object v3

    invoke-static {p0}, Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;->access$getLifecycleCameraKeys$p(Landroidx/camera/lifecycle/LifecycleCameraProviderImpl;)Ljava/util/HashSet;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    invoke-virtual {v3, v4}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unbindAll(Ljava/util/Set;)V

    .line 231
    nop

    .end local v2    # "$i$a$-trace-LifecycleCameraProviderImpl$unbindAll$1":I
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 784
    nop

    .line 786
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 784
    nop

    .line 231
    .end local v0    # "label$iv":Ljava/lang/String;
    .end local v1    # "$i$f$trace":I
    return-void

    .line 786
    .restart local v0    # "label$iv":Ljava/lang/String;
    .restart local v1    # "$i$f$trace":I
    :catchall_0
    move-exception v2

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v2
.end method
