.class final Landroidx/camera/lifecycle/LifecycleCameraRepository;
.super Ljava/lang/Object;
.source "LifecycleCameraRepository.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;,
        Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;,
        Landroidx/camera/lifecycle/LifecycleCameraRepository$FromUseCaseAdapter;
    }
.end annotation


# static fields
.field private static final INSTANCE_LOCK:Ljava/lang/Object;

.field private static final TAG:Ljava/lang/String; = "LifecycleCameraRepository"

.field private static sInstance:Landroidx/camera/lifecycle/LifecycleCameraRepository;


# instance fields
.field private final mActiveLifecycleOwners:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Landroidx/lifecycle/LifecycleOwner;",
            ">;"
        }
    .end annotation
.end field

.field mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

.field private final mCameraMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;",
            "Landroidx/camera/lifecycle/LifecycleCamera;",
            ">;"
        }
    .end annotation
.end field

.field private final mLifecycleObserverMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;",
            "Ljava/util/Set<",
            "Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 79
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->INSTANCE_LOCK:Ljava/lang/Object;

    .line 81
    const/4 v0, 0x0

    sput-object v0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->sInstance:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    .line 92
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    .line 109
    return-void
.end method

.method static getInstance()Landroidx/camera/lifecycle/LifecycleCameraRepository;
    .locals 2

    .line 112
    sget-object v0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->INSTANCE_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 113
    :try_start_0
    sget-object v1, Landroidx/camera/lifecycle/LifecycleCameraRepository;->sInstance:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    if-nez v1, :cond_0

    .line 114
    new-instance v1, Landroidx/camera/lifecycle/LifecycleCameraRepository;

    invoke-direct {v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;-><init>()V

    sput-object v1, Landroidx/camera/lifecycle/LifecycleCameraRepository;->sInstance:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    .line 116
    :cond_0
    sget-object v1, Landroidx/camera/lifecycle/LifecycleCameraRepository;->sInstance:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    monitor-exit v0

    return-object v1

    .line 117
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getLifecycleCameraRepositoryObserver(Landroidx/lifecycle/LifecycleOwner;)Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    .locals 4
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 311
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 312
    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    .line 313
    .local v2, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    invoke-virtual {v2}, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 314
    monitor-exit v0

    return-object v2

    .line 316
    .end local v2    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    :cond_0
    goto :goto_0

    .line 318
    :cond_1
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    .line 319
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private hasUseCaseBound(Landroidx/lifecycle/LifecycleOwner;)Z
    .locals 7
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 551
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 552
    nop

    .line 553
    :try_start_0
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameraRepositoryObserver(Landroidx/lifecycle/LifecycleOwner;)Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    move-result-object v1

    .line 555
    .local v1, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 556
    monitor-exit v0

    return v2

    .line 559
    :cond_0
    iget-object v3, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 563
    .local v3, "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    .line 564
    .local v5, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v6, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/lifecycle/LifecycleCamera;

    invoke-static {v6}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/lifecycle/LifecycleCamera;

    invoke-virtual {v6}, Landroidx/camera/lifecycle/LifecycleCamera;->getUseCases()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 565
    monitor-exit v0

    const/4 v0, 0x1

    return v0

    .line 567
    .end local v5    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    :cond_1
    goto :goto_0

    .line 569
    :cond_2
    monitor-exit v0

    return v2

    .line 570
    .end local v1    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    .end local v3    # "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private registerCamera(Landroidx/camera/lifecycle/LifecycleCamera;)V
    .locals 6
    .param p1, "lifecycleCamera"    # Landroidx/camera/lifecycle/LifecycleCamera;

    .line 226
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 227
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/lifecycle/LifecycleCamera;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v1

    .line 228
    .local v1, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    nop

    .line 229
    invoke-virtual {p1}, Landroidx/camera/lifecycle/LifecycleCamera;->getCameraUseCaseAdapter()Landroidx/camera/core/internal/CameraUseCaseAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getAdapterIdentifier()Landroidx/camera/core/CameraIdentifier;

    move-result-object v2

    .line 228
    invoke-static {v1, v2}, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;->create(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraIdentifier;)Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    move-result-object v2

    .line 231
    .local v2, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    nop

    .line 232
    invoke-direct {p0, v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameraRepositoryObserver(Landroidx/lifecycle/LifecycleOwner;)Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    move-result-object v3

    .line 236
    .local v3, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    if-eqz v3, :cond_0

    .line 237
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    .local v4, "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    goto :goto_0

    .line 239
    .end local v4    # "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :cond_0
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 242
    .restart local v4    # "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :goto_0
    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 243
    iget-object v5, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v5, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    if-nez v3, :cond_1

    .line 247
    new-instance v5, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    invoke-direct {v5, v1, p0}, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;-><init>(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/lifecycle/LifecycleCameraRepository;)V

    .line 248
    .end local v3    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    .local v5, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    iget-object v3, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    invoke-interface {v1}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 251
    .end local v1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local v2    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    .end local v4    # "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    .end local v5    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    :cond_1
    monitor-exit v0

    .line 252
    return-void

    .line 251
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private suspendUseCases(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 5
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 577
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 578
    nop

    .line 579
    :try_start_0
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameraRepositoryObserver(Landroidx/lifecycle/LifecycleOwner;)Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    move-result-object v1

    .line 586
    .local v1, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    if-nez v1, :cond_0

    .line 587
    monitor-exit v0

    return-void

    .line 590
    :cond_0
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    .line 591
    .local v3, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/lifecycle/LifecycleCamera;

    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/lifecycle/LifecycleCamera;

    invoke-virtual {v4}, Landroidx/camera/lifecycle/LifecycleCamera;->suspend()V

    .line 592
    .end local v3    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    goto :goto_0

    .line 593
    .end local v1    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    :cond_1
    monitor-exit v0

    .line 594
    return-void

    .line 593
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private unregisterCamera(Landroidx/camera/lifecycle/LifecycleCamera;)V
    .locals 8
    .param p1, "lifecycleCamera"    # Landroidx/camera/lifecycle/LifecycleCamera;

    .line 255
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 256
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/lifecycle/LifecycleCamera;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v1

    .line 257
    .local v1, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    nop

    .line 258
    invoke-virtual {p1}, Landroidx/camera/lifecycle/LifecycleCamera;->getCameraUseCaseAdapter()Landroidx/camera/core/internal/CameraUseCaseAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getAdapterIdentifier()Landroidx/camera/core/CameraIdentifier;

    move-result-object v2

    .line 257
    invoke-static {v1, v2}, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;->create(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraIdentifier;)Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    move-result-object v2

    .line 259
    .local v2, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v3, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 262
    .local v3, "lifecycleOwnerToUnregister":Ljava/util/Set;, "Ljava/util/Set<Landroidx/lifecycle/LifecycleOwner;>;"
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    .line 263
    .local v5, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    invoke-virtual {v5}, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 264
    iget-object v6, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    .line 265
    .local v6, "keySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    invoke-interface {v6, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 266
    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 267
    invoke-virtual {v5}, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 270
    .end local v5    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    .end local v6    # "keySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :cond_0
    goto :goto_0

    .line 271
    :cond_1
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/lifecycle/LifecycleOwner;

    .line 272
    .local v5, "owner":Landroidx/lifecycle/LifecycleOwner;
    invoke-virtual {p0, v5}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unregisterLifecycle(Landroidx/lifecycle/LifecycleOwner;)V

    .line 273
    .end local v5    # "owner":Landroidx/lifecycle/LifecycleOwner;
    goto :goto_1

    .line 274
    .end local v1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local v2    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    .end local v3    # "lifecycleOwnerToUnregister":Ljava/util/Set;, "Ljava/util/Set<Landroidx/lifecycle/LifecycleOwner;>;"
    :cond_2
    monitor-exit v0

    .line 275
    return-void

    .line 274
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private unsuspendUseCases(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 6
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 602
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 603
    nop

    .line 604
    :try_start_0
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameraRepositoryObserver(Landroidx/lifecycle/LifecycleOwner;)Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    move-result-object v1

    .line 606
    .local v1, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    .line 607
    .local v3, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 609
    .local v4, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/lifecycle/LifecycleCamera;

    invoke-virtual {v5}, Landroidx/camera/lifecycle/LifecycleCamera;->getUseCases()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 610
    invoke-virtual {v4}, Landroidx/camera/lifecycle/LifecycleCamera;->unsuspend()V

    .line 612
    .end local v3    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    .end local v4    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    :cond_0
    goto :goto_0

    .line 613
    .end local v1    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    :cond_1
    monitor-exit v0

    .line 614
    return-void

    .line 613
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method bindToLifecycleCamera(Landroidx/camera/lifecycle/LifecycleCamera;Landroidx/camera/core/SessionConfig;Landroidx/camera/core/concurrent/CameraCoordinator;)V
    .locals 8
    .param p1, "lifecycleCamera"    # Landroidx/camera/lifecycle/LifecycleCamera;
    .param p2, "sessionConfig"    # Landroidx/camera/core/SessionConfig;
    .param p3, "cameraCoordinator"    # Landroidx/camera/core/concurrent/CameraCoordinator;

    .line 344
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 345
    :try_start_0
    invoke-virtual {p2}, Landroidx/camera/core/SessionConfig;->getUseCases()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 346
    iput-object p3, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    .line 347
    invoke-virtual {p1}, Landroidx/camera/lifecycle/LifecycleCamera;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v1

    .line 350
    .local v1, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    nop

    .line 351
    invoke-direct {p0, v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameraRepositoryObserver(Landroidx/lifecycle/LifecycleOwner;)Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    move-result-object v2

    .line 352
    .local v2, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    if-nez v2, :cond_1

    .line 354
    monitor-exit v0

    return-void

    .line 356
    :cond_1
    iget-object v3, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 361
    .local v3, "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    if-eqz v4, :cond_2

    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v4}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_5

    .line 363
    :cond_2
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    .line 364
    .local v5, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v6, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/lifecycle/LifecycleCamera;

    invoke-static {v6}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 365
    .local v6, "camera":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-virtual {v6, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    invoke-virtual {v6}, Landroidx/camera/lifecycle/LifecycleCamera;->getUseCases()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 366
    invoke-virtual {v6}, Landroidx/camera/lifecycle/LifecycleCamera;->isLegacySessionConfigBound()Z

    move-result v7

    if-nez v7, :cond_3

    invoke-virtual {p2}, Landroidx/camera/core/SessionConfig;->isLegacy()Z

    move-result v7

    if-nez v7, :cond_3

    .line 369
    invoke-virtual {v6}, Landroidx/camera/lifecycle/LifecycleCamera;->unbindAll()V

    goto :goto_2

    .line 371
    :cond_3
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v7, "Multiple LifecycleCameras with use cases are registered to the same LifecycleOwner. Please unbind first."

    invoke-direct {v4, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    .end local p2    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    .end local p3    # "cameraCoordinator":Landroidx/camera/core/concurrent/CameraCoordinator;
    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 376
    .end local v5    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    .end local v6    # "camera":Landroidx/camera/lifecycle/LifecycleCamera;
    .restart local p1    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    .restart local p2    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    .restart local p3    # "cameraCoordinator":Landroidx/camera/core/concurrent/CameraCoordinator;
    :cond_4
    :goto_2
    goto :goto_1

    .line 380
    :cond_5
    :try_start_1
    invoke-virtual {p1, p2}, Landroidx/camera/lifecycle/LifecycleCamera;->bind(Landroidx/camera/core/SessionConfig;)V
    :try_end_1
    .catch Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 383
    nop

    .line 387
    :try_start_2
    invoke-interface {v1}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/lifecycle/Lifecycle;->getCurrentState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object v4

    sget-object v5, Landroidx/lifecycle/Lifecycle$State;->STARTED:Landroidx/lifecycle/Lifecycle$State;

    invoke-virtual {v4, v5}, Landroidx/lifecycle/Lifecycle$State;->isAtLeast(Landroidx/lifecycle/Lifecycle$State;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 389
    invoke-virtual {p0, v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->setActive(Landroidx/lifecycle/LifecycleOwner;)V

    .line 391
    .end local v1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local v2    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    .end local v3    # "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :cond_6
    monitor-exit v0

    .line 392
    return-void

    .line 381
    .restart local v1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local v2    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    .restart local v3    # "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :catch_0
    move-exception v4

    .line 382
    .local v4, "e":Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    .end local p1    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    .end local p2    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    .end local p3    # "cameraCoordinator":Landroidx/camera/core/concurrent/CameraCoordinator;
    throw v5

    .line 391
    .end local v1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local v2    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    .end local v3    # "lifecycleCameraKeySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    .end local v4    # "e":Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraException;
    .restart local p1    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    .restart local p2    # "sessionConfig":Landroidx/camera/core/SessionConfig;
    .restart local p3    # "cameraCoordinator":Landroidx/camera/core/concurrent/CameraCoordinator;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method clear()V
    .locals 5

    .line 207
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 208
    :try_start_0
    new-instance v1, Ljava/util/HashSet;

    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    .line 209
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 210
    .local v1, "keySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    .line 211
    .local v3, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    invoke-virtual {v3}, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unregisterLifecycle(Landroidx/lifecycle/LifecycleOwner;)V

    .line 212
    .end local v3    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    goto :goto_0

    .line 213
    .end local v1    # "keySet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;>;"
    :cond_0
    monitor-exit v0

    .line 214
    return-void

    .line 213
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method createLifecycleCamera(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/internal/CameraUseCaseAdapter;)Landroidx/camera/lifecycle/LifecycleCamera;
    .locals 5
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraUseCaseAdapter"    # Landroidx/camera/core/internal/CameraUseCaseAdapter;

    .line 137
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 138
    :try_start_0
    invoke-virtual {p2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getAdapterIdentifier()Landroidx/camera/core/CameraIdentifier;

    move-result-object v1

    invoke-static {p1, v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;->create(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraIdentifier;)Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    move-result-object v1

    .line 139
    .local v1, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-string v3, "LifecycleCamera already exists for the given LifecycleOwner and set of cameras"

    invoke-static {v2, v3}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 144
    new-instance v2, Landroidx/camera/lifecycle/LifecycleCamera;

    invoke-direct {v2, p1, p2}, Landroidx/camera/lifecycle/LifecycleCamera;-><init>(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/internal/CameraUseCaseAdapter;)V

    .line 146
    .local v2, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-virtual {p2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getUseCases()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 147
    invoke-virtual {v2}, Landroidx/camera/lifecycle/LifecycleCamera;->suspend()V

    .line 151
    :cond_1
    invoke-interface {p1}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/lifecycle/Lifecycle;->getCurrentState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object v3

    sget-object v4, Landroidx/lifecycle/Lifecycle$State;->DESTROYED:Landroidx/lifecycle/Lifecycle$State;

    if-ne v3, v4, :cond_2

    .line 152
    monitor-exit v0

    return-object v2

    .line 155
    :cond_2
    invoke-direct {p0, v2}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->registerCamera(Landroidx/camera/lifecycle/LifecycleCamera;)V

    .line 156
    .end local v1    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    monitor-exit v0

    .line 157
    return-object v2

    .line 156
    .end local v2    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getLifecycleCamera(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraIdentifier;)Landroidx/camera/lifecycle/LifecycleCamera;
    .locals 3
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraUseCaseAdapterIdentifier"    # Landroidx/camera/core/CameraIdentifier;

    .line 172
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 173
    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-static {p1, p2}, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;->create(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraIdentifier;)Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/lifecycle/LifecycleCamera;

    monitor-exit v0

    return-object v1

    .line 174
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getLifecycleCameras()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Landroidx/camera/lifecycle/LifecycleCamera;",
            ">;"
        }
    .end annotation

    .line 182
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 183
    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-static {v1}, Lj$/util/DesugarCollections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 184
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method removeLifecycleCameras(Ljava/util/Set;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;",
            ">;)V"
        }
    .end annotation

    .line 191
    .local p1, "lifecycleCameraKeys":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 193
    if-nez p1, :cond_0

    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    goto :goto_0

    .line 200
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 193
    :cond_0
    move-object v1, p1

    .line 195
    .local v1, "keysToUnbind":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    .line 196
    .local v3, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 197
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/lifecycle/LifecycleCamera;

    invoke-direct {p0, v4}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unregisterCamera(Landroidx/camera/lifecycle/LifecycleCamera;)V

    .line 199
    .end local v3    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    :cond_1
    goto :goto_1

    .line 200
    .end local v1    # "keysToUnbind":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :cond_2
    monitor-exit v0

    .line 201
    return-void

    .line 200
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setActive(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 3
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 493
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 496
    :try_start_0
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->hasUseCaseBound(Landroidx/lifecycle/LifecycleOwner;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 497
    monitor-exit v0

    return-void

    .line 502
    :cond_0
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 503
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    goto :goto_0

    .line 508
    :cond_1
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v1}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_3

    .line 510
    :cond_2
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/lifecycle/LifecycleOwner;

    .line 511
    .local v1, "currentActiveLifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 512
    invoke-direct {p0, v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->suspendUseCases(Landroidx/lifecycle/LifecycleOwner;)V

    .line 514
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    invoke-virtual {v2, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    .line 515
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    invoke-virtual {v2, p1}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 520
    .end local v1    # "currentActiveLifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unsuspendUseCases(Landroidx/lifecycle/LifecycleOwner;)V

    .line 521
    monitor-exit v0

    .line 522
    return-void

    .line 521
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setInactive(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 2
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 533
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 535
    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    .line 536
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->suspendUseCases(Landroidx/lifecycle/LifecycleOwner;)V

    .line 540
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 541
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mActiveLifecycleOwners:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/lifecycle/LifecycleOwner;

    .line 542
    .local v1, "newActiveLifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    invoke-direct {p0, v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unsuspendUseCases(Landroidx/lifecycle/LifecycleOwner;)V

    .line 544
    .end local v1    # "newActiveLifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    :cond_0
    monitor-exit v0

    .line 545
    return-void

    .line 544
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method unbind(Landroidx/camera/core/SessionConfig;)V
    .locals 1
    .param p1, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    .line 406
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unbind(Landroidx/camera/core/SessionConfig;Ljava/util/Set;)V

    .line 407
    return-void
.end method

.method unbind(Landroidx/camera/core/SessionConfig;Ljava/util/Set;)V
    .locals 7
    .param p1, "sessionConfig"    # Landroidx/camera/core/SessionConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/SessionConfig;",
            "Ljava/util/Set<",
            "Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;",
            ">;)V"
        }
    .end annotation

    .line 423
    .local p2, "lifecycleCameraKeys":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 425
    if-nez p2, :cond_0

    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    goto :goto_0

    .line 442
    :catchall_0
    move-exception v1

    goto :goto_4

    .line 425
    :cond_0
    move-object v1, p2

    .line 426
    .local v1, "keysToUnbind":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    .line 427
    .local v3, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 428
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 429
    .local v4, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-virtual {v4}, Landroidx/camera/lifecycle/LifecycleCamera;->getUseCases()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v5, 0x1

    goto :goto_2

    :cond_1
    const/4 v5, 0x0

    .line 430
    .local v5, "hasUseCase":Z
    :goto_2
    invoke-virtual {v4, p1}, Landroidx/camera/lifecycle/LifecycleCamera;->unbind(Landroidx/camera/core/SessionConfig;)V

    .line 435
    if-eqz v5, :cond_2

    invoke-virtual {v4}, Landroidx/camera/lifecycle/LifecycleCamera;->getUseCases()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 436
    invoke-virtual {v4}, Landroidx/camera/lifecycle/LifecycleCamera;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->setInactive(Landroidx/lifecycle/LifecycleOwner;)V

    .line 438
    .end local v4    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    .end local v5    # "hasUseCase":Z
    :cond_2
    goto :goto_3

    .line 439
    :cond_3
    const-string v4, "LifecycleCameraRepository"

    const-string v5, "Attempt to unbind use cases from an invalid camera."

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    .end local v3    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    :goto_3
    goto :goto_1

    .line 442
    .end local v1    # "keysToUnbind":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :cond_4
    monitor-exit v0

    .line 443
    return-void

    .line 442
    :goto_4
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method unbindAll()V
    .locals 1

    .line 455
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unbindAll(Ljava/util/Set;)V

    .line 456
    return-void
.end method

.method unbindAll(Ljava/util/Set;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;",
            ">;)V"
        }
    .end annotation

    .line 467
    .local p1, "lifecycleCameraKeys":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 469
    if-nez p1, :cond_0

    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    goto :goto_0

    .line 477
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 469
    :cond_0
    move-object v1, p1

    .line 470
    .local v1, "keysToUnbind":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    .line 471
    .local v3, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 472
    .local v4, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    if-eqz v4, :cond_1

    .line 473
    invoke-virtual {v4}, Landroidx/camera/lifecycle/LifecycleCamera;->unbindAll()V

    .line 474
    invoke-virtual {v4}, Landroidx/camera/lifecycle/LifecycleCamera;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->setInactive(Landroidx/lifecycle/LifecycleOwner;)V

    .line 476
    .end local v3    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    .end local v4    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    :cond_1
    goto :goto_1

    .line 477
    .end local v1    # "keysToUnbind":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;>;"
    :cond_2
    monitor-exit v0

    .line 478
    return-void

    .line 477
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method unregisterLifecycle(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 5
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 286
    iget-object v0, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 287
    nop

    .line 288
    :try_start_0
    invoke-direct {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameraRepositoryObserver(Landroidx/lifecycle/LifecycleOwner;)Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;

    move-result-object v1

    .line 294
    .local v1, "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    if-nez v1, :cond_0

    .line 295
    monitor-exit v0

    return-void

    .line 298
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->setInactive(Landroidx/lifecycle/LifecycleOwner;)V

    .line 300
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;

    .line 301
    .local v3, "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    iget-object v4, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mCameraMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    nop

    .end local v3    # "key":Landroidx/camera/lifecycle/LifecycleCameraRepository$Key;
    goto :goto_0

    .line 304
    :cond_1
    iget-object v2, p0, Landroidx/camera/lifecycle/LifecycleCameraRepository;->mLifecycleObserverMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    invoke-virtual {v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v2

    invoke-interface {v2}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroidx/lifecycle/Lifecycle;->removeObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 306
    .end local v1    # "observer":Landroidx/camera/lifecycle/LifecycleCameraRepository$LifecycleCameraRepositoryObserver;
    monitor-exit v0

    .line 307
    return-void

    .line 306
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
