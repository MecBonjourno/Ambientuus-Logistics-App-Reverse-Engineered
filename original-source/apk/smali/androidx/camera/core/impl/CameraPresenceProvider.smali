.class public final Landroidx/camera/core/impl/CameraPresenceProvider;
.super Ljava/lang/Object;
.source "CameraPresenseProvider.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/CameraPresenceProvider$Companion;,
        Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;,
        Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCameraPresenseProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CameraPresenseProvider.kt\nandroidx/camera/core/impl/CameraPresenceProvider\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n*L\n1#1,351:1\n1557#2:352\n1628#2,3:353\n1557#2:356\n1628#2,3:357\n1863#2,2:360\n1863#2,2:362\n1863#2,2:364\n1557#2:366\n1628#2,3:367\n1863#2,2:370\n1863#2,2:372\n1863#2,2:374\n1557#2:376\n1628#2,3:377\n1863#2,2:384\n1863#2,2:386\n295#2,2:388\n126#3:380\n153#3,3:381\n*S KotlinDebug\n*F\n+ 1 CameraPresenseProvider.kt\nandroidx/camera/core/impl/CameraPresenceProvider\n*L\n77#1:352\n77#1:353,3\n145#1:356\n145#1:357,3\n149#1:360,2\n162#1:362,2\n170#1:364,2\n175#1:366\n175#1:367,3\n178#1:370,2\n189#1:372,2\n190#1:374,2\n302#1:376\n302#1:377,3\n336#1:384,2\n342#1:386,2\n308#1:388,2\n304#1:380\n304#1:381,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000|\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\"\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\n\u0018\u0000 ;2\u00020\u0001:\u00039:;B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0016\u0010\u001e\u001a\u00020\u001f2\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nJ\u0006\u0010 \u001a\u00020\u001fJ\u0016\u0010!\u001a\u00020\u001f2\u000c\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002J$\u0010#\u001a\u00020\u001f2\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u00020\u000e0%2\u000c\u0010&\u001a\u0008\u0012\u0004\u0012\u00020\u000e0%H\u0002J\u000e\u0010\'\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020\u0016J\u000e\u0010)\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020\u0016J\u0010\u0010*\u001a\u00020\u001f2\u0006\u0010+\u001a\u00020\u001bH\u0002J\u0010\u0010,\u001a\u00020\u001f2\u0006\u0010-\u001a\u00020.H\u0002J\u0010\u0010/\u001a\u00020\u001f2\u0006\u0010+\u001a\u00020\u001bH\u0002J\u0008\u00100\u001a\u00020\u001fH\u0002J\u0016\u00101\u001a\u00020\u001f2\u0006\u0010(\u001a\u0002022\u0006\u00103\u001a\u00020\u0003J\u000e\u00104\u001a\u00020\u001f2\u0006\u0010(\u001a\u000202J\u0016\u00105\u001a\u00020\u001f2\u000c\u00106\u001a\u0008\u0012\u0004\u0012\u00020\u000e0%H\u0002J\u0016\u00107\u001a\u00020\u001f2\u000c\u00108\u001a\u0008\u0012\u0004\u0012\u00020\u000e0%H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u000b\u001a\u0010\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000f\u001a\u00060\u0010R\u00020\u0000X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00160\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00180\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\u0019\u001a\u0014\u0012\u0004\u0012\u00020\u001b\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001d0\u001c0\u001a8\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006<"
    }
    d2 = {
        "Landroidx/camera/core/impl/CameraPresenceProvider;",
        "",
        "backgroundExecutor",
        "Ljava/util/concurrent/Executor;",
        "<init>",
        "(Ljava/util/concurrent/Executor;)V",
        "observerLock",
        "cameraFactory",
        "Landroidx/camera/core/impl/CameraFactory;",
        "cameraRepository",
        "Landroidx/camera/core/impl/CameraRepository;",
        "sourcePresenceObservable",
        "Landroidx/camera/core/impl/Observable;",
        "",
        "Landroidx/camera/core/CameraIdentifier;",
        "sourceObserver",
        "Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;",
        "currentFilteredIds",
        "isMonitoring",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "dependentInternalListeners",
        "Ljava/util/concurrent/CopyOnWriteArrayList;",
        "Landroidx/camera/core/impl/InternalCameraPresenceListener;",
        "publicApiListeners",
        "Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;",
        "cameraStateObservers",
        "",
        "",
        "Landroidx/lifecycle/Observer;",
        "Landroidx/camera/core/CameraState;",
        "startup",
        "",
        "shutdown",
        "processFilteredCameraIdUpdate",
        "newFilteredIdentifiers",
        "notifyPublicListeners",
        "addedCameras",
        "",
        "removedCameras",
        "addDependentInternalListener",
        "listener",
        "removeDependentInternalListener",
        "conditionallySetupCameraStateObserver",
        "systemCameraId",
        "setupCameraStateObserver",
        "cameraInfoInternal",
        "Landroidx/camera/core/impl/CameraInfoInternal;",
        "removeCameraStateObserver",
        "clearAllCameraStateObservers",
        "addCameraPresenceListener",
        "Landroidx/camera/core/CameraPresenceListener;",
        "executor",
        "removeCameraPresenceListener",
        "notifyPublicCamerasAdded",
        "addedIds",
        "notifyPublicCamerasRemoved",
        "removedIds",
        "ListenerWrapper",
        "SourceObservableObserver",
        "Companion",
        "camera-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Landroidx/camera/core/impl/CameraPresenceProvider$Companion;

.field private static final TAG:Ljava/lang/String; = "CameraPresencePrvdr"


# instance fields
.field private final backgroundExecutor:Ljava/util/concurrent/Executor;

.field private cameraFactory:Landroidx/camera/core/impl/CameraFactory;

.field private cameraRepository:Landroidx/camera/core/impl/CameraRepository;

.field private final cameraStateObservers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/lifecycle/Observer<",
            "Landroidx/camera/core/CameraState;",
            ">;>;"
        }
    .end annotation
.end field

.field private volatile currentFilteredIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;"
        }
    .end annotation
.end field

.field private final dependentInternalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Landroidx/camera/core/impl/InternalCameraPresenceListener;",
            ">;"
        }
    .end annotation
.end field

.field private final isMonitoring:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final observerLock:Ljava/lang/Object;

.field private final publicApiListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private final sourceObserver:Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;

.field private sourcePresenceObservable:Landroidx/camera/core/impl/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Observable<",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$8I2SiglK5IZGTt2SYeSQEdhpeBc(Landroidx/camera/core/impl/CameraPresenceProvider;Ljava/lang/String;Landroidx/camera/core/CameraState;)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/camera/core/impl/CameraPresenceProvider;->setupCameraStateObserver$lambda$12$lambda$10(Landroidx/camera/core/impl/CameraPresenceProvider;Ljava/lang/String;Landroidx/camera/core/CameraState;)V

    return-void
.end method

.method public static synthetic $r8$lambda$8Ym79PrdzIbe9ZH0nlNggsEfBxI(Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;Ljava/util/Set;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->notifyPublicCamerasRemoved$lambda$25$lambda$24(Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;Ljava/util/Set;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Omf4-xmour570Qlbqn6YgAsRU_U(Ljava/util/List;Landroidx/lifecycle/Observer;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/camera/core/impl/CameraPresenceProvider;->clearAllCameraStateObservers$lambda$19$lambda$18(Ljava/util/List;Landroidx/lifecycle/Observer;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$PVjrlB0Or3XGwhWIeq5U0oZ1nis(Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;Ljava/util/Set;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->notifyPublicCamerasAdded$lambda$23$lambda$22(Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;Ljava/util/Set;)V

    return-void
.end method

.method public static synthetic $r8$lambda$QK9vdqSUyEL-apx1arOPzylH_V8(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/lifecycle/Observer;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->setupCameraStateObserver$lambda$12$lambda$11(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/lifecycle/Observer;)V

    return-void
.end method

.method public static synthetic $r8$lambda$SNnCfn9TRg8o1J1EtT6wC3LbQtU(Landroidx/camera/core/CameraPresenceListener;Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;)Z
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->removeCameraPresenceListener$lambda$21(Landroidx/camera/core/CameraPresenceListener;Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$XKi76LxyFhWORa1AKswZJpdjH1w(Landroidx/camera/core/impl/CameraInternal;Landroidx/lifecycle/Observer;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->removeCameraStateObserver$lambda$14$lambda$13(Landroidx/camera/core/impl/CameraInternal;Landroidx/lifecycle/Observer;)V

    return-void
.end method

.method public static synthetic $r8$lambda$xjY4GsoHFr1S2xQGIshTWTmB_hU(Landroidx/camera/core/impl/CameraPresenceProvider;Landroidx/camera/core/CameraPresenceListener;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->addCameraPresenceListener$lambda$20(Landroidx/camera/core/impl/CameraPresenceProvider;Landroidx/camera/core/CameraPresenceListener;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/camera/core/impl/CameraPresenceProvider$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/CameraPresenceProvider$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/camera/core/impl/CameraPresenceProvider;->Companion:Landroidx/camera/core/impl/CameraPresenceProvider$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "backgroundExecutor"    # Ljava/util/concurrent/Executor;

    const-string v0, "backgroundExecutor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->backgroundExecutor:Ljava/util/concurrent/Executor;

    .line 43
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->observerLock:Ljava/lang/Object;

    .line 48
    new-instance v0, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;

    invoke-direct {v0, p0}, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;-><init>(Landroidx/camera/core/impl/CameraPresenceProvider;)V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->sourceObserver:Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;

    .line 50
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->currentFilteredIds:Ljava/util/List;

    .line 52
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->isMonitoring:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 54
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->dependentInternalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 55
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->publicApiListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 57
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraStateObservers:Ljava/util/Map;

    .line 41
    return-void
.end method

.method public static final synthetic access$getCameraFactory$p(Landroidx/camera/core/impl/CameraPresenceProvider;)Landroidx/camera/core/impl/CameraFactory;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/core/impl/CameraPresenceProvider;

    .line 41
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraFactory:Landroidx/camera/core/impl/CameraFactory;

    return-object v0
.end method

.method public static final synthetic access$getSourcePresenceObservable$p(Landroidx/camera/core/impl/CameraPresenceProvider;)Landroidx/camera/core/impl/Observable;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/core/impl/CameraPresenceProvider;

    .line 41
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->sourcePresenceObservable:Landroidx/camera/core/impl/Observable;

    return-object v0
.end method

.method public static final synthetic access$isMonitoring$p(Landroidx/camera/core/impl/CameraPresenceProvider;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "$this"    # Landroidx/camera/core/impl/CameraPresenceProvider;

    .line 41
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->isMonitoring:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method public static final synthetic access$processFilteredCameraIdUpdate(Landroidx/camera/core/impl/CameraPresenceProvider;Ljava/util/List;)V
    .locals 0
    .param p0, "$this"    # Landroidx/camera/core/impl/CameraPresenceProvider;
    .param p1, "newFilteredIdentifiers"    # Ljava/util/List;

    .line 41
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->processFilteredCameraIdUpdate(Ljava/util/List;)V

    return-void
.end method

.method private static final addCameraPresenceListener$lambda$20(Landroidx/camera/core/impl/CameraPresenceProvider;Landroidx/camera/core/CameraPresenceListener;)V
    .locals 2
    .param p0, "this$0"    # Landroidx/camera/core/impl/CameraPresenceProvider;
    .param p1, "$listener"    # Landroidx/camera/core/CameraPresenceListener;

    .line 324
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->currentFilteredIds:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    .line 325
    .local v0, "currentIds":Ljava/util/Set;
    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 326
    invoke-interface {p1, v0}, Landroidx/camera/core/CameraPresenceListener;->onCamerasAdded(Ljava/util/Set;)V

    .line 328
    :cond_0
    return-void
.end method

.method private final clearAllCameraStateObservers()V
    .locals 15

    .line 290
    const/4 v0, 0x0

    .line 291
    .local v0, "observersToClear":Ljava/lang/Object;
    iget-object v1, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->observerLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v2, 0x0

    .line 292
    .local v2, "$i$a$-synchronized-CameraPresenceProvider$clearAllCameraStateObservers$1":I
    :try_start_0
    iget-object v3, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraStateObservers:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    .line 293
    nop

    .end local v2    # "$i$a$-synchronized-CameraPresenceProvider$clearAllCameraStateObservers$1":I
    monitor-exit v1

    return-void

    .line 295
    .restart local v2    # "$i$a$-synchronized-CameraPresenceProvider$clearAllCameraStateObservers$1":I
    :cond_0
    :try_start_1
    iget-object v3, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraStateObservers:Ljava/util/Map;

    invoke-static {v3}, Lkotlin/collections/MapsKt;->toMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    move-object v0, v3

    .line 296
    iget-object v3, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraStateObservers:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 297
    nop

    .end local v2    # "$i$a$-synchronized-CameraPresenceProvider$clearAllCameraStateObservers$1":I
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 291
    monitor-exit v1

    .line 299
    iget-object v1, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraRepository:Landroidx/camera/core/impl/CameraRepository;

    .line 300
    .local v1, "repo":Landroidx/camera/core/impl/CameraRepository;
    if-eqz v1, :cond_3

    .line 302
    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v2

    const-string v3, "getCameras(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 376
    .local v3, "$i$f$map":I
    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v2, v5}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v2

    .local v5, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 377
    .local v6, "$i$f$mapTo":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 378
    .local v8, "item$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Landroidx/camera/core/impl/CameraInternal;

    .local v9, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    const/4 v10, 0x0

    .line 302
    .local v10, "$i$a$-map-CameraPresenceProvider$clearAllCameraStateObservers$cameraInfosToRemoveObserver$1":I
    invoke-interface {v9}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v9

    .line 378
    .end local v9    # "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v10    # "$i$a$-map-CameraPresenceProvider$clearAllCameraStateObservers$cameraInfosToRemoveObserver$1":I
    invoke-interface {v4, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 379
    .end local v8    # "item$iv$iv":Ljava/lang/Object;
    :cond_1
    nop

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v5    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$mapTo":I
    check-cast v4, Ljava/util/List;

    .line 376
    nop

    .line 302
    .end local v2    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$map":I
    nop

    .line 301
    nop

    .line 303
    .local v4, "cameraInfosToRemoveObserver":Ljava/util/List;
    const-string v2, "CameraPresencePrvdr"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Clearing all "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " state observers."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    move-object v2, v0

    .local v2, "$this$map$iv":Ljava/util/Map;
    const/4 v3, 0x0

    .line 380
    .restart local v3    # "$i$f$map":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v5, Ljava/util/Collection;

    .local v5, "destination$iv$iv":Ljava/util/Collection;
    move-object v6, v2

    .local v6, "$this$mapTo$iv$iv":Ljava/util/Map;
    const/4 v7, 0x0

    .line 381
    .local v7, "$i$f$mapTo":I
    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 382
    .local v9, "item$iv$iv":Ljava/util/Map$Entry;
    const/4 v10, 0x0

    .local v10, "$i$a$-map-CameraPresenceProvider$clearAllCameraStateObservers$2":I
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .local v11, "cameraId":Ljava/lang/String;
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/lifecycle/Observer;

    .line 305
    .local v12, "observer":Landroidx/lifecycle/Observer;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v13

    new-instance v14, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda1;

    invoke-direct {v14, v4, v12, v11}, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda1;-><init>(Ljava/util/List;Landroidx/lifecycle/Observer;Ljava/lang/String;)V

    invoke-interface {v13, v14}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 315
    nop

    .end local v10    # "$i$a$-map-CameraPresenceProvider$clearAllCameraStateObservers$2":I
    .end local v11    # "cameraId":Ljava/lang/String;
    .end local v12    # "observer":Landroidx/lifecycle/Observer;
    sget-object v10, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 382
    invoke-interface {v5, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 383
    .end local v9    # "item$iv$iv":Ljava/util/Map$Entry;
    :cond_2
    nop

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v6    # "$this$mapTo$iv$iv":Ljava/util/Map;
    .end local v7    # "$i$f$mapTo":I
    check-cast v5, Ljava/util/List;

    .line 380
    nop

    .line 317
    .end local v2    # "$this$map$iv":Ljava/util/Map;
    .end local v3    # "$i$f$map":I
    .end local v4    # "cameraInfosToRemoveObserver":Ljava/util/List;
    :cond_3
    return-void

    .line 291
    .end local v1    # "repo":Landroidx/camera/core/impl/CameraRepository;
    :catchall_0
    move-exception v2

    monitor-exit v1

    throw v2
.end method

.method private static final clearAllCameraStateObservers$lambda$19$lambda$18(Ljava/util/List;Landroidx/lifecycle/Observer;Ljava/lang/String;)V
    .locals 7
    .param p0, "$cameraInfosToRemoveObserver"    # Ljava/util/List;
    .param p1, "$observer"    # Landroidx/lifecycle/Observer;
    .param p2, "$cameraId"    # Ljava/lang/String;

    .line 306
    nop

    .line 309
    nop

    .line 310
    nop

    .line 307
    :try_start_0
    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    .line 308
    nop

    .local v0, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 388
    .local v1, "$i$f$firstOrNull":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/camera/core/impl/CameraInfoInternal;

    .local v4, "it":Landroidx/camera/core/impl/CameraInfoInternal;
    const/4 v5, 0x0

    .line 308
    .local v5, "$i$a$-firstOrNull-CameraPresenceProvider$clearAllCameraStateObservers$2$1$1":I
    invoke-interface {v4}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 388
    .end local v4    # "it":Landroidx/camera/core/impl/CameraInfoInternal;
    .end local v5    # "$i$a$-firstOrNull-CameraPresenceProvider$clearAllCameraStateObservers$2$1$1":I
    if-eqz v6, :cond_0

    goto :goto_0

    .line 389
    .end local v3    # "element$iv":Ljava/lang/Object;
    :cond_1
    const/4 v3, 0x0

    .line 308
    .end local v0    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$firstOrNull":I
    :goto_0
    check-cast v3, Landroidx/camera/core/impl/CameraInfoInternal;

    .line 309
    if-eqz v3, :cond_2

    .line 307
    nop

    .line 309
    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraState()Landroidx/lifecycle/LiveData;

    move-result-object v0

    .line 310
    if-eqz v0, :cond_2

    .line 307
    nop

    .line 310
    invoke-virtual {v0, p1}, Landroidx/lifecycle/LiveData;->removeObserver(Landroidx/lifecycle/Observer;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 309
    :cond_2
    goto :goto_1

    .line 311
    :catch_0
    move-exception v0

    .line 314
    :goto_1
    return-void
.end method

.method private final conditionallySetupCameraStateObserver(Ljava/lang/String;)V
    .locals 4
    .param p1, "systemCameraId"    # Ljava/lang/String;

    .line 220
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraRepository:Landroidx/camera/core/impl/CameraRepository;

    if-nez v0, :cond_0

    return-void

    .line 221
    .local v0, "repo":Landroidx/camera/core/impl/CameraRepository;
    :cond_0
    nop

    .line 222
    :try_start_0
    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CameraRepository;->getCamera(Ljava/lang/String;)Landroidx/camera/core/impl/CameraInternal;

    move-result-object v1

    const-string v2, "getCamera(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 223
    .local v1, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v2

    const-string v3, "getCameraInfoInternal(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, v2}, Landroidx/camera/core/impl/CameraPresenceProvider;->setupCameraStateObserver(Landroidx/camera/core/impl/CameraInfoInternal;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    goto :goto_0

    .line 224
    :catch_0
    move-exception v1

    .line 226
    .local v1, "<unused var>":Ljava/lang/IllegalArgumentException;
    nop

    .line 227
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CameraInternal not found for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Cannot setup state observer."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 225
    const-string v3, "CameraPresencePrvdr"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    .end local v1    # "<unused var>":Ljava/lang/IllegalArgumentException;
    :goto_0
    return-void
.end method

.method private final notifyPublicCamerasAdded(Ljava/util/Set;)V
    .locals 8
    .param p1, "addedIds"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;)V"
        }
    .end annotation

    .line 336
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->publicApiListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 384
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;

    .local v4, "wrapper":Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;
    const/4 v5, 0x0

    .line 337
    .local v5, "$i$a$-forEach-CameraPresenceProvider$notifyPublicCamerasAdded$1":I
    invoke-virtual {v4}, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v6

    new-instance v7, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda3;

    invoke-direct {v7, v4, p1}, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;Ljava/util/Set;)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 338
    nop

    .line 384
    .end local v4    # "wrapper":Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;
    .end local v5    # "$i$a$-forEach-CameraPresenceProvider$notifyPublicCamerasAdded$1":I
    nop

    .end local v3    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 385
    :cond_0
    nop

    .line 339
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$forEach":I
    return-void
.end method

.method private static final notifyPublicCamerasAdded$lambda$23$lambda$22(Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;Ljava/util/Set;)V
    .locals 1
    .param p0, "$wrapper"    # Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;
    .param p1, "$addedIds"    # Ljava/util/Set;

    .line 337
    invoke-virtual {p0}, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;->getListener()Landroidx/camera/core/CameraPresenceListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/CameraPresenceListener;->onCamerasAdded(Ljava/util/Set;)V

    return-void
.end method

.method private final notifyPublicCamerasRemoved(Ljava/util/Set;)V
    .locals 8
    .param p1, "removedIds"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;)V"
        }
    .end annotation

    .line 342
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->publicApiListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 386
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;

    .local v4, "wrapper":Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;
    const/4 v5, 0x0

    .line 343
    .local v5, "$i$a$-forEach-CameraPresenceProvider$notifyPublicCamerasRemoved$1":I
    invoke-virtual {v4}, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v6

    new-instance v7, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda0;

    invoke-direct {v7, v4, p1}, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;Ljava/util/Set;)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 344
    nop

    .line 386
    .end local v4    # "wrapper":Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;
    .end local v5    # "$i$a$-forEach-CameraPresenceProvider$notifyPublicCamerasRemoved$1":I
    nop

    .end local v3    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 387
    :cond_0
    nop

    .line 345
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$forEach":I
    return-void
.end method

.method private static final notifyPublicCamerasRemoved$lambda$25$lambda$24(Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;Ljava/util/Set;)V
    .locals 1
    .param p0, "$wrapper"    # Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;
    .param p1, "$removedIds"    # Ljava/util/Set;

    .line 343
    invoke-virtual {p0}, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;->getListener()Landroidx/camera/core/CameraPresenceListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/CameraPresenceListener;->onCamerasRemoved(Ljava/util/Set;)V

    return-void
.end method

.method private final notifyPublicListeners(Ljava/util/Set;Ljava/util/Set;)V
    .locals 4
    .param p1, "addedCameras"    # Ljava/util/Set;
    .param p2, "removedCameras"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;)V"
        }
    .end annotation

    .line 200
    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const-string v1, "Notifying "

    const-string v2, "CameraPresencePrvdr"

    if-nez v0, :cond_0

    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " cameras added."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider;->notifyPublicCamerasAdded(Ljava/util/Set;)V

    .line 204
    :cond_0
    move-object v0, p2

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 205
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " cameras removed."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    invoke-direct {p0, p2}, Landroidx/camera/core/impl/CameraPresenceProvider;->notifyPublicCamerasRemoved(Ljava/util/Set;)V

    .line 208
    :cond_1
    return-void
.end method

.method private final processFilteredCameraIdUpdate(Ljava/util/List;)V
    .locals 21
    .param p1, "newFilteredIdentifiers"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;)V"
        }
    .end annotation

    .line 132
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "CameraPresencePrvdr"

    iget-object v0, v1, Landroidx/camera/core/impl/CameraPresenceProvider;->currentFilteredIds:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    .line 133
    .local v4, "oldFilteredIdsSnapshot":Ljava/util/List;
    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    return-void

    .line 138
    :cond_0
    move-object v0, v4

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v5

    .line 139
    .local v5, "oldIdSet":Ljava/util/Set;
    move-object v0, v2

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v6

    .line 140
    .local v6, "newIdSet":Ljava/util/Set;
    move-object v0, v5

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v6, v0}, Lkotlin/collections/SetsKt;->minus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v7

    .line 141
    .local v7, "addedCameras":Ljava/util/Set;
    move-object v0, v6

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v5, v0}, Lkotlin/collections/SetsKt;->minus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v8

    .line 144
    .local v8, "removedCameras":Ljava/util/Set;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v9, v0

    check-cast v9, Ljava/util/List;

    .line 145
    .local v9, "successfullyUpdatedListeners":Ljava/util/List;
    move-object v0, v2

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 356
    .local v10, "$i$f$map":I
    new-instance v11, Ljava/util/ArrayList;

    const/16 v12, 0xa

    invoke-static {v0, v12}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v11, v13}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v11, Ljava/util/Collection;

    .local v11, "destination$iv$iv":Ljava/util/Collection;
    move-object v13, v0

    .local v13, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v14, 0x0

    .line 357
    .local v14, "$i$f$mapTo":I
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_1

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    .line 358
    .local v16, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v17, v16

    check-cast v17, Landroidx/camera/core/CameraIdentifier;

    .local v17, "it":Landroidx/camera/core/CameraIdentifier;
    const/16 v18, 0x0

    .line 145
    .local v18, "$i$a$-map-CameraPresenceProvider$processFilteredCameraIdUpdate$newFilteredIdStrings$1":I
    invoke-virtual/range {v17 .. v17}, Landroidx/camera/core/CameraIdentifier;->getInternalId()Ljava/lang/String;

    move-result-object v12

    .line 358
    .end local v17    # "it":Landroidx/camera/core/CameraIdentifier;
    .end local v18    # "$i$a$-map-CameraPresenceProvider$processFilteredCameraIdUpdate$newFilteredIdStrings$1":I
    invoke-interface {v11, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/16 v12, 0xa

    goto :goto_0

    .line 359
    .end local v16    # "item$iv$iv":Ljava/lang/Object;
    :cond_1
    nop

    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v13    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v14    # "$i$f$mapTo":I
    check-cast v11, Ljava/util/List;

    .line 356
    nop

    .line 145
    .end local v0    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$map":I
    nop

    .line 147
    .local v11, "newFilteredIdStrings":Ljava/util/List;
    nop

    .line 149
    :try_start_0
    move-object v0, v8

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 360
    .local v10, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .local v13, "element$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Landroidx/camera/core/CameraIdentifier;

    .local v14, "it":Landroidx/camera/core/CameraIdentifier;
    const/4 v15, 0x0

    .line 149
    .local v15, "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$1":I
    move-object/from16 v16, v0

    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .local v16, "$this$forEach$iv":Ljava/lang/Iterable;
    invoke-virtual {v14}, Landroidx/camera/core/CameraIdentifier;->getInternalId()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Landroidx/camera/core/impl/CameraPresenceProvider;->removeCameraStateObserver(Ljava/lang/String;)V

    .line 360
    .end local v14    # "it":Landroidx/camera/core/CameraIdentifier;
    .end local v15    # "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$1":I
    move-object/from16 v0, v16

    .end local v13    # "element$iv":Ljava/lang/Object;
    goto :goto_1

    .line 361
    .end local v16    # "$this$forEach$iv":Ljava/lang/Iterable;
    .restart local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    :cond_2
    move-object/from16 v16, v0

    .line 152
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$forEach":I
    iget-object v0, v1, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraRepository:Landroidx/camera/core/impl/CameraRepository;

    if-eqz v0, :cond_3

    .local v0, "it":Landroidx/camera/core/impl/CameraRepository;
    const/4 v10, 0x0

    .line 153
    .local v10, "$i$a$-let-CameraPresenceProvider$processFilteredCameraIdUpdate$2":I
    const-string v12, "Updating CameraRepository..."

    invoke-static {v3, v12}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    invoke-virtual {v0, v11}, Landroidx/camera/core/impl/CameraRepository;->onCamerasUpdated(Ljava/util/List;)V

    .line 155
    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    const-string v12, "CameraRepository updated successfully."

    invoke-static {v3, v12}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    nop

    .line 152
    .end local v0    # "it":Landroidx/camera/core/impl/CameraRepository;
    .end local v10    # "$i$a$-let-CameraPresenceProvider$processFilteredCameraIdUpdate$2":I
    :cond_3
    nop

    .line 160
    iget-object v0, v1, Landroidx/camera/core/impl/CameraPresenceProvider;->dependentInternalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 161
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Updating "

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v10, v1, Landroidx/camera/core/impl/CameraPresenceProvider;->dependentInternalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v10}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v10, " dependent listeners..."

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    iget-object v0, v1, Landroidx/camera/core/impl/CameraPresenceProvider;->dependentInternalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 362
    .local v10, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .restart local v13    # "element$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Landroidx/camera/core/impl/InternalCameraPresenceListener;

    .local v14, "listener":Landroidx/camera/core/impl/InternalCameraPresenceListener;
    const/4 v15, 0x0

    .line 163
    .local v15, "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$3":I
    invoke-interface {v14, v11}, Landroidx/camera/core/impl/InternalCameraPresenceListener;->onCamerasUpdated(Ljava/util/List;)V

    .line 164
    invoke-static {v14}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v9, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    nop

    .line 362
    .end local v14    # "listener":Landroidx/camera/core/impl/InternalCameraPresenceListener;
    .end local v15    # "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$3":I
    nop

    .end local v13    # "element$iv":Ljava/lang/Object;
    goto :goto_2

    .line 363
    :cond_4
    nop

    .line 169
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$forEach":I
    :cond_5
    iput-object v2, v1, Landroidx/camera/core/impl/CameraPresenceProvider;->currentFilteredIds:Ljava/util/List;

    .line 170
    move-object v0, v7

    check-cast v0, Ljava/lang/Iterable;

    .restart local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 364
    .restart local v10    # "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .restart local v13    # "element$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Landroidx/camera/core/CameraIdentifier;

    .local v14, "it":Landroidx/camera/core/CameraIdentifier;
    const/4 v15, 0x0

    .line 170
    .local v15, "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$4":I
    move-object/from16 v16, v0

    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .restart local v16    # "$this$forEach$iv":Ljava/lang/Iterable;
    invoke-virtual {v14}, Landroidx/camera/core/CameraIdentifier;->getInternalId()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Landroidx/camera/core/impl/CameraPresenceProvider;->conditionallySetupCameraStateObserver(Ljava/lang/String;)V

    .line 364
    .end local v14    # "it":Landroidx/camera/core/CameraIdentifier;
    .end local v15    # "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$4":I
    move-object/from16 v0, v16

    .end local v13    # "element$iv":Ljava/lang/Object;
    goto :goto_3

    .line 365
    .end local v16    # "$this$forEach$iv":Ljava/lang/Iterable;
    .restart local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    :cond_6
    move-object/from16 v16, v0

    .line 171
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$forEach":I
    invoke-direct {v1, v7, v8}, Landroidx/camera/core/impl/CameraPresenceProvider;->notifyPublicListeners(Ljava/util/Set;Ljava/util/Set;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 v19, v4

    goto/16 :goto_9

    .line 172
    :catch_0
    move-exception v0

    move-object v10, v0

    .line 174
    .local v10, "e":Ljava/lang/Exception;
    const-string v0, "A core module failed to update. Rolling back changes."

    move-object v12, v10

    check-cast v12, Ljava/lang/Throwable;

    invoke-static {v3, v0, v12}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 175
    move-object v0, v4

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 366
    .local v12, "$i$f$map":I
    new-instance v13, Ljava/util/ArrayList;

    const/16 v14, 0xa

    invoke-static {v0, v14}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v14

    invoke-direct {v13, v14}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v13, Ljava/util/Collection;

    .local v13, "destination$iv$iv":Ljava/util/Collection;
    move-object v14, v0

    .local v14, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v15, 0x0

    .line 367
    .local v15, "$i$f$mapTo":I
    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_4
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_7

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    .line 368
    .local v17, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v18, v17

    check-cast v18, Landroidx/camera/core/CameraIdentifier;

    .local v18, "it":Landroidx/camera/core/CameraIdentifier;
    const/16 v19, 0x0

    .line 175
    .local v19, "$i$a$-map-CameraPresenceProvider$processFilteredCameraIdUpdate$oldFilteredIdStrings$1":I
    move-object/from16 v20, v0

    .end local v0    # "$this$map$iv":Ljava/lang/Iterable;
    .local v20, "$this$map$iv":Ljava/lang/Iterable;
    invoke-virtual/range {v18 .. v18}, Landroidx/camera/core/CameraIdentifier;->getInternalId()Ljava/lang/String;

    move-result-object v0

    .line 368
    .end local v18    # "it":Landroidx/camera/core/CameraIdentifier;
    .end local v19    # "$i$a$-map-CameraPresenceProvider$processFilteredCameraIdUpdate$oldFilteredIdStrings$1":I
    invoke-interface {v13, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v20

    goto :goto_4

    .line 369
    .end local v17    # "item$iv$iv":Ljava/lang/Object;
    .end local v20    # "$this$map$iv":Ljava/lang/Iterable;
    .restart local v0    # "$this$map$iv":Ljava/lang/Iterable;
    :cond_7
    move-object/from16 v20, v0

    .end local v0    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v13    # "destination$iv$iv":Ljava/util/Collection;
    .end local v14    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v15    # "$i$f$mapTo":I
    .restart local v20    # "$this$map$iv":Ljava/lang/Iterable;
    move-object v0, v13

    check-cast v0, Ljava/util/List;

    .line 366
    nop

    .line 175
    .end local v12    # "$i$f$map":I
    .end local v20    # "$this$map$iv":Ljava/lang/Iterable;
    move-object v12, v0

    .line 178
    .local v12, "oldFilteredIdStrings":Ljava/util/List;
    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->asReversedMutable(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Ljava/lang/Iterable;

    .local v13, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v14, 0x0

    .line 370
    .local v14, "$i$f$forEach":I
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    .local v16, "element$iv":Ljava/lang/Object;
    move-object/from16 v2, v16

    check-cast v2, Landroidx/camera/core/impl/InternalCameraPresenceListener;

    .local v2, "listener":Landroidx/camera/core/impl/InternalCameraPresenceListener;
    const/16 v17, 0x0

    .line 179
    .local v17, "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$5":I
    nop

    .line 180
    :try_start_1
    invoke-interface {v2, v12}, Landroidx/camera/core/impl/InternalCameraPresenceListener;->onCamerasUpdated(Ljava/util/List;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v19, v4

    goto :goto_6

    .line 181
    :catch_1
    move-exception v0

    .line 182
    .local v0, "rollbackException":Ljava/lang/Exception;
    move-object/from16 v18, v0

    .end local v0    # "rollbackException":Ljava/lang/Exception;
    .local v18, "rollbackException":Ljava/lang/Exception;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v19, v4

    .end local v4    # "oldFilteredIdsSnapshot":Ljava/util/List;
    .local v19, "oldFilteredIdsSnapshot":Ljava/util/List;
    const-string v4, "Failed to rollback listener: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v4, v18

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v3, v0, v4}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 184
    .end local v18    # "rollbackException":Ljava/lang/Exception;
    :goto_6
    nop

    .line 370
    .end local v2    # "listener":Landroidx/camera/core/impl/InternalCameraPresenceListener;
    .end local v17    # "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$5":I
    move-object/from16 v2, p1

    move-object/from16 v4, v19

    .end local v16    # "element$iv":Ljava/lang/Object;
    goto :goto_5

    .line 371
    .end local v19    # "oldFilteredIdsSnapshot":Ljava/util/List;
    .restart local v4    # "oldFilteredIdsSnapshot":Ljava/util/List;
    :cond_8
    move-object/from16 v19, v4

    .line 189
    .end local v4    # "oldFilteredIdsSnapshot":Ljava/util/List;
    .end local v13    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v14    # "$i$f$forEach":I
    .restart local v19    # "oldFilteredIdsSnapshot":Ljava/util/List;
    move-object v0, v8

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 372
    .local v2, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .local v4, "element$iv":Ljava/lang/Object;
    move-object v13, v4

    check-cast v13, Landroidx/camera/core/CameraIdentifier;

    .local v13, "it":Landroidx/camera/core/CameraIdentifier;
    const/4 v14, 0x0

    .line 189
    .local v14, "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$6":I
    invoke-virtual {v13}, Landroidx/camera/core/CameraIdentifier;->getInternalId()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v1, v15}, Landroidx/camera/core/impl/CameraPresenceProvider;->conditionallySetupCameraStateObserver(Ljava/lang/String;)V

    .line 372
    .end local v13    # "it":Landroidx/camera/core/CameraIdentifier;
    .end local v14    # "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$6":I
    nop

    .end local v4    # "element$iv":Ljava/lang/Object;
    goto :goto_7

    .line 373
    :cond_9
    nop

    .line 190
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEach":I
    move-object v0, v7

    check-cast v0, Ljava/lang/Iterable;

    .restart local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 374
    .restart local v2    # "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .restart local v4    # "element$iv":Ljava/lang/Object;
    move-object v13, v4

    check-cast v13, Landroidx/camera/core/CameraIdentifier;

    .restart local v13    # "it":Landroidx/camera/core/CameraIdentifier;
    const/4 v14, 0x0

    .line 190
    .local v14, "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$7":I
    invoke-virtual {v13}, Landroidx/camera/core/CameraIdentifier;->getInternalId()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v1, v15}, Landroidx/camera/core/impl/CameraPresenceProvider;->removeCameraStateObserver(Ljava/lang/String;)V

    .line 374
    .end local v13    # "it":Landroidx/camera/core/CameraIdentifier;
    .end local v14    # "$i$a$-forEach-CameraPresenceProvider$processFilteredCameraIdUpdate$7":I
    nop

    .end local v4    # "element$iv":Ljava/lang/Object;
    goto :goto_8

    .line 375
    :cond_a
    nop

    .line 192
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEach":I
    .end local v10    # "e":Ljava/lang/Exception;
    .end local v12    # "oldFilteredIdStrings":Ljava/util/List;
    :goto_9
    return-void
.end method

.method private static final removeCameraPresenceListener$lambda$21(Landroidx/camera/core/CameraPresenceListener;Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;)Z
    .locals 1
    .param p0, "$listener"    # Landroidx/camera/core/CameraPresenceListener;
    .param p1, "it"    # Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;

    .line 332
    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;->getListener()Landroidx/camera/core/CameraPresenceListener;

    move-result-object v0

    invoke-static {v0, p0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private final removeCameraStateObserver(Ljava/lang/String;)V
    .locals 8
    .param p1, "systemCameraId"    # Ljava/lang/String;

    .line 271
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->observerLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 272
    .local v1, "$i$a$-synchronized-CameraPresenceProvider$removeCameraStateObserver$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraStateObservers:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/lifecycle/Observer;

    .line 273
    .local v2, "observer":Landroidx/lifecycle/Observer;
    iget-object v3, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraRepository:Landroidx/camera/core/impl/CameraRepository;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 274
    .local v3, "repo":Landroidx/camera/core/impl/CameraRepository;
    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    .line 275
    nop

    .line 276
    :try_start_1
    invoke-virtual {v3, p1}, Landroidx/camera/core/impl/CameraRepository;->getCamera(Ljava/lang/String;)Landroidx/camera/core/impl/CameraInternal;

    move-result-object v4

    const-string v5, "getCamera(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 277
    .local v4, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v5

    new-instance v6, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda2;

    invoke-direct {v6, v4, v2}, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/impl/CameraInternal;Landroidx/lifecycle/Observer;)V

    invoke-interface {v5, v6}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 280
    const-string v5, "CameraPresencePrvdr"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Removed state observer for: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v4    # "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    goto :goto_0

    .line 281
    :catch_0
    move-exception v4

    .line 285
    :cond_0
    :goto_0
    nop

    .end local v1    # "$i$a$-synchronized-CameraPresenceProvider$removeCameraStateObserver$1":I
    .end local v2    # "observer":Landroidx/lifecycle/Observer;
    .end local v3    # "repo":Landroidx/camera/core/impl/CameraRepository;
    :try_start_2
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 271
    monitor-exit v0

    .line 286
    return-void

    .line 271
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static final removeCameraStateObserver$lambda$14$lambda$13(Landroidx/camera/core/impl/CameraInternal;Landroidx/lifecycle/Observer;)V
    .locals 1
    .param p0, "$cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p1, "$observer"    # Landroidx/lifecycle/Observer;

    .line 278
    invoke-interface {p0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraState()Landroidx/lifecycle/LiveData;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/lifecycle/LiveData;->removeObserver(Landroidx/lifecycle/Observer;)V

    .line 279
    return-void
.end method

.method private final setupCameraStateObserver(Landroidx/camera/core/impl/CameraInfoInternal;)V
    .locals 7
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;

    .line 234
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getCameraId(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 235
    .local v0, "cameraIdStr":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->isMonitoring:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    .line 236
    return-void

    .line 239
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->observerLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v2, 0x0

    .line 240
    .local v2, "$i$a$-synchronized-CameraPresenceProvider$setupCameraStateObserver$1":I
    :try_start_0
    iget-object v3, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraStateObservers:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    .line 241
    nop

    .end local v2    # "$i$a$-synchronized-CameraPresenceProvider$setupCameraStateObserver$1":I
    monitor-exit v1

    return-void

    .line 244
    .restart local v2    # "$i$a$-synchronized-CameraPresenceProvider$setupCameraStateObserver$1":I
    :cond_1
    nop

    .line 243
    :try_start_1
    new-instance v3, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda5;

    invoke-direct {v3, p0, v0}, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/core/impl/CameraPresenceProvider;Ljava/lang/String;)V

    .line 261
    .local v3, "stateObserver":Landroidx/lifecycle/Observer;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v4

    new-instance v5, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda6;

    invoke-direct {v5, p1, v3}, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/lifecycle/Observer;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 264
    iget-object v4, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraStateObservers:Ljava/util/Map;

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    const-string v4, "CameraPresencePrvdr"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Registered state observer for camera: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    nop

    .end local v2    # "$i$a$-synchronized-CameraPresenceProvider$setupCameraStateObserver$1":I
    .end local v3    # "stateObserver":Landroidx/lifecycle/Observer;
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 239
    monitor-exit v1

    .line 267
    return-void

    .line 239
    :catchall_0
    move-exception v2

    monitor-exit v1

    throw v2
.end method

.method private static final setupCameraStateObserver$lambda$12$lambda$10(Landroidx/camera/core/impl/CameraPresenceProvider;Ljava/lang/String;Landroidx/camera/core/CameraState;)V
    .locals 4
    .param p0, "this$0"    # Landroidx/camera/core/impl/CameraPresenceProvider;
    .param p1, "$cameraIdStr"    # Ljava/lang/String;
    .param p2, "cameraState"    # Landroidx/camera/core/CameraState;

    .line 245
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->isMonitoring:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const-string v1, "CameraPresencePrvdr"

    if-nez v0, :cond_0

    .line 247
    nop

    .line 248
    nop

    .line 246
    const-string v0, "Ignore camera state change handling since already stop monitoring"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 251
    :cond_0
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroidx/camera/core/CameraState;->getError()Landroidx/camera/core/CameraState$StateError;

    move-result-object v2

    goto :goto_0

    :cond_1
    move-object v2, v0

    :goto_0
    if-nez v2, :cond_3

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Landroidx/camera/core/CameraState;->getType()Landroidx/camera/core/CameraState$Type;

    move-result-object v2

    goto :goto_1

    :cond_2
    move-object v2, v0

    :goto_1
    sget-object v3, Landroidx/camera/core/CameraState$Type;->CLOSED:Landroidx/camera/core/CameraState$Type;

    if-ne v2, v3, :cond_5

    .line 254
    :cond_3
    nop

    .line 255
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Camera "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " state changed to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Landroidx/camera/core/CameraState;->getType()Landroidx/camera/core/CameraState$Type;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " with error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 256
    invoke-virtual {p2}, Landroidx/camera/core/CameraState;->getError()Landroidx/camera/core/CameraState$StateError;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroidx/camera/core/CameraState$StateError;->getCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 255
    :cond_4
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 256
    nop

    .line 255
    const-string v2, ". Triggering refresh."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 253
    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->sourcePresenceObservable:Landroidx/camera/core/impl/Observable;

    if-eqz v0, :cond_5

    invoke-interface {v0}, Landroidx/camera/core/impl/Observable;->fetchData()Lcom/google/common/util/concurrent/ListenableFuture;

    .line 260
    :cond_5
    :goto_2
    return-void
.end method

.method private static final setupCameraStateObserver$lambda$12$lambda$11(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/lifecycle/Observer;)V
    .locals 1
    .param p0, "$cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p1, "$stateObserver"    # Landroidx/lifecycle/Observer;

    .line 262
    invoke-interface {p0}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraState()Landroidx/lifecycle/LiveData;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/lifecycle/LiveData;->observeForever(Landroidx/lifecycle/Observer;)V

    .line 263
    return-void
.end method


# virtual methods
.method public final addCameraPresenceListener(Landroidx/camera/core/CameraPresenceListener;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "listener"    # Landroidx/camera/core/CameraPresenceListener;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 320
    new-instance v0, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;

    invoke-direct {v0, p1, p2}, Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;-><init>(Landroidx/camera/core/CameraPresenceListener;Ljava/util/concurrent/Executor;)V

    .line 321
    .local v0, "wrapper":Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;
    iget-object v1, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->publicApiListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    new-instance v1, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/impl/CameraPresenceProvider;Landroidx/camera/core/CameraPresenceListener;)V

    invoke-interface {p2, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 329
    return-void
.end method

.method public final addDependentInternalListener(Landroidx/camera/core/impl/InternalCameraPresenceListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/camera/core/impl/InternalCameraPresenceListener;

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 211
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->dependentInternalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 212
    return-void
.end method

.method public final removeCameraPresenceListener(Landroidx/camera/core/CameraPresenceListener;)V
    .locals 2
    .param p1, "listener"    # Landroidx/camera/core/CameraPresenceListener;

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 332
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->publicApiListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    check-cast v0, Ljava/util/List;

    new-instance v1, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda7;

    invoke-direct {v1, p1}, Landroidx/camera/core/impl/CameraPresenceProvider$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/core/CameraPresenceListener;)V

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->removeAll(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Z

    .line 333
    return-void
.end method

.method public final removeDependentInternalListener(Landroidx/camera/core/impl/InternalCameraPresenceListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/camera/core/impl/InternalCameraPresenceListener;

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 215
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->dependentInternalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 216
    return-void
.end method

.method public final shutdown()V
    .locals 2

    .line 87
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->isMonitoring:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    const-string v1, "CameraPresencePrvdr"

    if-nez v0, :cond_0

    .line 88
    const-string v0, "Shutdown called when not monitoring. Ignoring."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    return-void

    .line 91
    :cond_0
    const-string v0, "Shutting down CameraPresenceProvider monitoring."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->sourcePresenceObservable:Landroidx/camera/core/impl/Observable;

    if-eqz v0, :cond_1

    iget-object v1, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->sourceObserver:Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;

    check-cast v1, Landroidx/camera/core/impl/Observable$Observer;

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/Observable;->removeObserver(Landroidx/camera/core/impl/Observable$Observer;)V

    .line 94
    :cond_1
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraPresenceProvider;->clearAllCameraStateObservers()V

    .line 96
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->dependentInternalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 97
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->publicApiListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 98
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->currentFilteredIds:Ljava/util/List;

    .line 99
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraFactory:Landroidx/camera/core/impl/CameraFactory;

    .line 100
    iput-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraRepository:Landroidx/camera/core/impl/CameraRepository;

    .line 101
    return-void
.end method

.method public final startup(Landroidx/camera/core/impl/CameraFactory;Landroidx/camera/core/impl/CameraRepository;)V
    .locals 17
    .param p1, "cameraFactory"    # Landroidx/camera/core/impl/CameraFactory;
    .param p2, "cameraRepository"    # Landroidx/camera/core/impl/CameraRepository;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const-string v3, "cameraFactory"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "cameraRepository"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    iget-object v3, v0, Landroidx/camera/core/impl/CameraPresenceProvider;->isMonitoring:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v3

    if-nez v3, :cond_0

    .line 72
    return-void

    .line 74
    :cond_0
    const-string v3, "CameraPresencePrvdr"

    const-string v4, "Starting CameraPresenceProvider monitoring."

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    nop

    .line 77
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraFactory;->getAvailableCameraIds()Ljava/util/Set;

    move-result-object v3

    const-string v4, "getAvailableCameraIds(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/lang/Iterable;

    .local v3, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 352
    .local v4, "$i$f$map":I
    new-instance v5, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v3, v6}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v5, Ljava/util/Collection;

    .local v5, "destination$iv$iv":Ljava/util/Collection;
    move-object v6, v3

    .local v6, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 353
    .local v7, "$i$f$mapTo":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 354
    .local v9, "item$iv$iv":Ljava/lang/Object;
    move-object v11, v9

    check-cast v11, Ljava/lang/String;

    .local v11, "it":Ljava/lang/String;
    const/16 v16, 0x0

    .line 77
    .local v16, "$i$a$-map-CameraPresenceProvider$startup$1":I
    sget-object v10, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-static {v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v14, 0x6

    const/4 v15, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v10 .. v15}, Landroidx/camera/core/CameraIdentifier$Companion;->create$default(Landroidx/camera/core/CameraIdentifier$Companion;Ljava/lang/String;Ljava/lang/String;Landroidx/camera/core/impl/Identifier;ILjava/lang/Object;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v10

    .line 354
    .end local v11    # "it":Ljava/lang/String;
    .end local v16    # "$i$a$-map-CameraPresenceProvider$startup$1":I
    invoke-interface {v5, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 355
    .end local v9    # "item$iv$iv":Ljava/lang/Object;
    :cond_1
    nop

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v6    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapTo":I
    check-cast v5, Ljava/util/List;

    .line 352
    nop

    .line 76
    .end local v3    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$map":I
    iput-object v5, v0, Landroidx/camera/core/impl/CameraPresenceProvider;->currentFilteredIds:Ljava/util/List;

    .line 78
    iput-object v1, v0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraFactory:Landroidx/camera/core/impl/CameraFactory;

    .line 79
    iput-object v2, v0, Landroidx/camera/core/impl/CameraPresenceProvider;->cameraRepository:Landroidx/camera/core/impl/CameraRepository;

    .line 80
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraFactory;->getCameraPresenceSource()Landroidx/camera/core/impl/Observable;

    move-result-object v3

    iput-object v3, v0, Landroidx/camera/core/impl/CameraPresenceProvider;->sourcePresenceObservable:Landroidx/camera/core/impl/Observable;

    .line 82
    iget-object v3, v0, Landroidx/camera/core/impl/CameraPresenceProvider;->sourcePresenceObservable:Landroidx/camera/core/impl/Observable;

    if-eqz v3, :cond_2

    iget-object v4, v0, Landroidx/camera/core/impl/CameraPresenceProvider;->backgroundExecutor:Ljava/util/concurrent/Executor;

    iget-object v5, v0, Landroidx/camera/core/impl/CameraPresenceProvider;->sourceObserver:Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;

    check-cast v5, Landroidx/camera/core/impl/Observable$Observer;

    invoke-interface {v3, v4, v5}, Landroidx/camera/core/impl/Observable;->addObserver(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V

    .line 83
    :cond_2
    return-void
.end method
