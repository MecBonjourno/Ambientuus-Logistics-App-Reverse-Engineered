.class public Landroidx/camera/core/impl/CameraRepository;
.super Ljava/lang/Object;
.source "CameraRepository.java"

# interfaces
.implements Landroidx/camera/core/impl/InternalCameraPresenceListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraRepository"


# instance fields
.field private mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

.field private final mCameras:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;"
        }
    .end annotation
.end field

.field private final mCamerasLock:Ljava/lang/Object;

.field private mDeinitCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mDeinitFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mReleasingCameras:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    .line 49
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    .line 51
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mReleasingCameras:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public deinit()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v0

    .line 88
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    :goto_0
    monitor-exit v0

    return-object v1

    .line 91
    :cond_1
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 92
    .local v1, "currentFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    if-nez v1, :cond_2

    .line 98
    new-instance v2, Landroidx/camera/core/impl/CameraRepository$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Landroidx/camera/core/impl/CameraRepository$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/impl/CameraRepository;)V

    invoke-static {v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    move-object v1, v2

    .line 104
    iput-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 108
    :cond_2
    iget-object v2, p0, Landroidx/camera/core/impl/CameraRepository;->mReleasingCameras:Ljava/util/Set;

    iget-object v3, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 109
    iget-object v2, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraInternal;

    .line 112
    .local v3, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInternal;->release()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    new-instance v5, Landroidx/camera/core/impl/CameraRepository$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0, v3}, Landroidx/camera/core/impl/CameraRepository$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/impl/CameraRepository;Landroidx/camera/core/impl/CameraInternal;)V

    .line 128
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v6

    .line 112
    invoke-interface {v4, v5, v6}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 129
    .end local v3    # "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    goto :goto_1

    .line 132
    :cond_3
    iget-object v2, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 133
    monitor-exit v0

    return-object v1

    .line 134
    .end local v1    # "currentFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCamera(Ljava/lang/String;)Landroidx/camera/core/impl/CameraInternal;
    .locals 5
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 144
    iget-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v0

    .line 145
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraInternal;

    .line 146
    .local v1, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    if-eqz v1, :cond_0

    .line 149
    monitor-exit v0

    return-object v1

    .line 147
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid camera: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "cameraId":Ljava/lang/String;
    throw v2

    .line 150
    .end local v1    # "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local p1    # "cameraId":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getCameraIds()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 168
    iget-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v0

    .line 169
    :try_start_0
    new-instance v1, Ljava/util/LinkedHashSet;

    iget-object v2, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 170
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCameras()Ljava/util/LinkedHashSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;"
        }
    .end annotation

    .line 158
    iget-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v0

    .line 159
    :try_start_0
    new-instance v1, Ljava/util/LinkedHashSet;

    iget-object v2, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 160
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public init(Landroidx/camera/core/impl/CameraFactory;)V
    .locals 7
    .param p1, "cameraFactory"    # Landroidx/camera/core/impl/CameraFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/InitializationException;
        }
    .end annotation

    .line 64
    iput-object p1, p0, Landroidx/camera/core/impl/CameraRepository;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    .line 65
    iget-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v0

    .line 67
    :try_start_0
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraFactory;->getAvailableCameraIds()Ljava/util/Set;

    move-result-object v1

    .line 68
    .local v1, "camerasList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 69
    .local v3, "id":Ljava/lang/String;
    const-string v4, "CameraRepository"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Added camera: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    iget-object v4, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {p1, v3}, Landroidx/camera/core/impl/CameraFactory;->getCamera(Ljava/lang/String;)Landroidx/camera/core/impl/CameraInternal;

    move-result-object v5

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/CameraInternal;

    .line 71
    .local v4, "cameraToRemove":Landroidx/camera/core/impl/CameraInternal;
    if-eqz v4, :cond_0

    .line 72
    invoke-interface {v4}, Landroidx/camera/core/impl/CameraInternal;->release()Lcom/google/common/util/concurrent/ListenableFuture;
    :try_end_0
    .catch Landroidx/camera/core/CameraUnavailableException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "cameraToRemove":Landroidx/camera/core/impl/CameraInternal;
    :cond_0
    goto :goto_0

    .line 77
    .end local v1    # "camerasList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    nop

    .line 78
    :try_start_1
    monitor-exit v0

    .line 79
    return-void

    .line 78
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 75
    :catch_0
    move-exception v1

    .line 76
    .local v1, "e":Landroidx/camera/core/CameraUnavailableException;
    new-instance v2, Landroidx/camera/core/InitializationException;

    invoke-direct {v2, v1}, Landroidx/camera/core/InitializationException;-><init>(Ljava/lang/Throwable;)V

    .end local p1    # "cameraFactory":Landroidx/camera/core/impl/CameraFactory;
    throw v2

    .line 78
    .end local v1    # "e":Landroidx/camera/core/CameraUnavailableException;
    .restart local p1    # "cameraFactory":Landroidx/camera/core/impl/CameraFactory;
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method synthetic lambda$deinit$0$androidx-camera-core-impl-CameraRepository(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 99
    iget-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v0

    .line 100
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 101
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    const-string v0, "CameraRepository-deinit"

    return-object v0

    .line 101
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method synthetic lambda$deinit$1$androidx-camera-core-impl-CameraRepository(Landroidx/camera/core/impl/CameraInternal;)V
    .locals 3
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;

    .line 113
    iget-object v0, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v0

    .line 118
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mReleasingCameras:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 119
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mReleasingCameras:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 120
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 124
    iput-object v2, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 125
    iput-object v2, p0, Landroidx/camera/core/impl/CameraRepository;->mDeinitFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 127
    :cond_0
    monitor-exit v0

    .line 128
    return-void

    .line 127
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCamerasUpdated(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/impl/CameraUpdateException;
        }
    .end annotation

    .line 176
    .local p1, "newCameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 178
    .local v0, "newCameras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/camera/core/impl/CameraInternal;>;"
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v1

    .line 179
    :try_start_0
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 180
    .local v2, "newCamerasToCreate":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v3, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 181
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 184
    :try_start_1
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 185
    .local v3, "cameraId":Ljava/lang/String;
    iget-object v4, p0, Landroidx/camera/core/impl/CameraRepository;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    invoke-interface {v4, v3}, Landroidx/camera/core/impl/CameraFactory;->getCamera(Ljava/lang/String;)Landroidx/camera/core/impl/CameraInternal;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Landroidx/camera/core/CameraUnavailableException; {:try_start_1 .. :try_end_1} :catch_0

    .line 186
    nop

    .end local v3    # "cameraId":Ljava/lang/String;
    goto :goto_0

    .line 189
    :cond_0
    nop

    .line 192
    iget-object v1, p0, Landroidx/camera/core/impl/CameraRepository;->mCamerasLock:Ljava/lang/Object;

    monitor-enter v1

    .line 194
    :try_start_2
    new-instance v3, Ljava/util/HashSet;

    iget-object v4, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 195
    .local v3, "cameraIdsToRemove":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3, p1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 197
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 198
    .local v4, "camerasToDisconnect":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CameraInternal;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 199
    .local v6, "cameraId":Ljava/lang/String;
    iget-object v7, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    nop

    .end local v6    # "cameraId":Ljava/lang/String;
    goto :goto_1

    .line 203
    :cond_1
    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    .line 204
    .local v5, "finalCameras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/camera/core/impl/CameraInternal;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 205
    .local v7, "cameraId":Ljava/lang/String;
    iget-object v8, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 206
    iget-object v8, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 208
    :cond_2
    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .end local v7    # "cameraId":Ljava/lang/String;
    :goto_3
    goto :goto_2

    .line 213
    :cond_3
    iget-object v6, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->clear()V

    .line 214
    iget-object v6, p0, Landroidx/camera/core/impl/CameraRepository;->mCameras:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 216
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/CameraInternal;

    .line 217
    .local v7, "cameraToRemove":Landroidx/camera/core/impl/CameraInternal;
    if-eqz v7, :cond_4

    .line 218
    invoke-interface {v7}, Landroidx/camera/core/impl/CameraInternal;->onRemoved()V

    .line 220
    .end local v7    # "cameraToRemove":Landroidx/camera/core/impl/CameraInternal;
    :cond_4
    goto :goto_4

    .line 221
    .end local v3    # "cameraIdsToRemove":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v4    # "camerasToDisconnect":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CameraInternal;>;"
    .end local v5    # "finalCameras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/camera/core/impl/CameraInternal;>;"
    :cond_5
    monitor-exit v1

    .line 222
    return-void

    .line 221
    :catchall_0
    move-exception v3

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 187
    :catch_0
    move-exception v1

    .line 188
    .local v1, "e":Landroidx/camera/core/CameraUnavailableException;
    new-instance v3, Landroidx/camera/core/impl/CameraUpdateException;

    const-string v4, "Failed to create CameraInternal"

    invoke-direct {v3, v4, v1}, Landroidx/camera/core/impl/CameraUpdateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 181
    .end local v1    # "e":Landroidx/camera/core/CameraUnavailableException;
    .end local v2    # "newCamerasToCreate":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catchall_1
    move-exception v2

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2
.end method
