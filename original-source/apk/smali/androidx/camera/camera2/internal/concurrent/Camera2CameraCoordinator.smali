.class public Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;
.super Ljava/lang/Object;
.source "Camera2CameraCoordinator.java"

# interfaces
.implements Landroidx/camera/core/concurrent/CameraCoordinator;


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2CameraCoordinator"


# instance fields
.field private mActiveConcurrentCameraInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

.field private mCameraOperatingMode:I

.field private mConcurrentCameraIdMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mConcurrentCameraIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mConcurrentCameraModeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V
    .locals 3
    .param p1, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    .line 62
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    .line 71
    iput-object p1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    .line 75
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraIdList()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 76
    .local v0, "cameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->onCamerasUpdated(Ljava/util/List;)V
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroidx/camera/core/impl/CameraUpdateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .end local v0    # "cameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_1

    .line 77
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    const-string v1, "Camera2CameraCoordinator"

    const-string v2, "Failed to get concurrent camera ids"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 80
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private static createCameraSelectorById(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;)Landroidx/camera/core/CameraSelector;
    .locals 5
    .param p0, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 255
    new-instance v0, Landroidx/camera/core/CameraSelector$Builder;

    invoke-direct {v0}, Landroidx/camera/core/CameraSelector$Builder;-><init>()V

    new-instance v1, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;)V

    .line 256
    invoke-virtual {v0, v1}, Landroidx/camera/core/CameraSelector$Builder;->addCameraFilter(Landroidx/camera/core/CameraFilter;)Landroidx/camera/core/CameraSelector$Builder;

    move-result-object v0

    .line 267
    .local v0, "builder":Landroidx/camera/core/CameraSelector$Builder;
    nop

    .line 268
    :try_start_0
    invoke-virtual {p0, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v1

    .line 269
    .local v1, "cameraCharacteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 271
    .local v2, "cameraLensFacing":Ljava/lang/Integer;
    if-eqz v2, :cond_0

    .line 272
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v3}, Landroidx/camera/core/CameraSelector$Builder;->requireLensFacing(I)Landroidx/camera/core/CameraSelector$Builder;
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    .end local v1    # "cameraCharacteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .end local v2    # "cameraLensFacing":Ljava/lang/Integer;
    :cond_0
    nop

    .line 280
    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector$Builder;->build()Landroidx/camera/core/CameraSelector;

    move-result-object v1

    return-object v1

    .line 274
    :catch_0
    move-exception v1

    .line 277
    .local v1, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to get camera characteristics for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method static synthetic lambda$createCameraSelectorById$0(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .param p0, "cameraId"    # Ljava/lang/String;
    .param p1, "cameraInfos"    # Ljava/util/List;

    .line 257
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/CameraInfo;

    .line 258
    .local v1, "cameraInfo":Landroidx/camera/core/CameraInfo;
    invoke-static {v1}, Landroidx/camera/camera2/interop/Camera2CameraInfo;->from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/camera2/interop/Camera2CameraInfo;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/camera2/interop/Camera2CameraInfo;->getCameraId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 259
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 261
    .end local v1    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    :cond_0
    goto :goto_0

    .line 263
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No camera can be find for id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private notifyCameraModeListener(Ljava/util/List;II)V
    .locals 2
    .param p2, "prevMode"    # I
    .param p3, "currMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;",
            ">;II)V"
        }
    .end annotation

    .line 221
    .local p1, "listeners":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;

    .line 222
    .local v1, "listener":Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;
    invoke-interface {v1, p2, p3}, Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;->onCameraOperatingModeUpdated(II)V

    .line 223
    .end local v1    # "listener":Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;
    goto :goto_0

    .line 224
    :cond_0
    return-void
.end method


# virtual methods
.method public addListener(Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;)V
    .locals 2
    .param p1, "listener"    # Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;

    .line 228
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 229
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    monitor-exit v0

    .line 231
    return-void

    .line 230
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getActiveConcurrentCameraInfos()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation

    .line 150
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 151
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 152
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCameraOperatingMode()I
    .locals 2

    .line 187
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 188
    :try_start_0
    iget v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    monitor-exit v0

    return v1

    .line 189
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getConcurrentCameraSelectors()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraSelector;",
            ">;>;"
        }
    .end annotation

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v0, "concurrentCameraSelectorLists":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroidx/camera/core/CameraSelector;>;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 136
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 137
    .local v3, "concurrentCameraIdList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v4, "cameraSelectors":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraSelector;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 139
    .local v6, "concurrentCameraId":Ljava/lang/String;
    iget-object v7, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 140
    invoke-static {v7, v6}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->createCameraSelectorById(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;)Landroidx/camera/core/CameraSelector;

    move-result-object v7

    .line 139
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    nop

    .end local v6    # "concurrentCameraId":Ljava/lang/String;
    goto :goto_1

    .line 142
    :cond_0
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    nop

    .end local v3    # "concurrentCameraIdList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v4    # "cameraSelectors":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraSelector;>;"
    goto :goto_0

    .line 144
    :cond_1
    monitor-exit v1

    .line 145
    return-object v0

    .line 144
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getPairedConcurrentCameraId(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 165
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 166
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 167
    monitor-exit v0

    return-object v2

    .line 169
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 170
    .local v1, "pairedIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v1, :cond_1

    .line 171
    monitor-exit v0

    return-object v2

    .line 173
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 174
    .local v4, "pairedCameraId":Ljava/lang/String;
    iget-object v5, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/CameraInfo;

    .line 175
    .local v6, "cameraInfo":Landroidx/camera/core/CameraInfo;
    invoke-static {v6}, Landroidx/camera/camera2/interop/Camera2CameraInfo;->from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/camera2/interop/Camera2CameraInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/camera/camera2/interop/Camera2CameraInfo;->getCameraId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 176
    monitor-exit v0

    return-object v4

    .line 178
    .end local v6    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    :cond_2
    goto :goto_1

    .line 179
    .end local v4    # "pairedCameraId":Ljava/lang/String;
    :cond_3
    goto :goto_0

    .line 180
    .end local v1    # "pairedIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    monitor-exit v0

    .line 181
    return-object v2

    .line 180
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public synthetic init(Landroidx/camera/core/impl/CameraRepository;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/concurrent/CameraCoordinator$-CC;->$default$init(Landroidx/camera/core/concurrent/CameraCoordinator;Landroidx/camera/core/impl/CameraRepository;)V

    return-void
.end method

.method public onCamerasUpdated(Ljava/util/List;)V
    .locals 12
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

    .line 85
    .local p1, "cameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 86
    .local v0, "tempConcurrentCameraIdMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 89
    .local v1, "tempConcurrentCameraIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Set<Ljava/lang/String;>;>;"
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getConcurrentCameraIds()Ljava/util/Set;

    move-result-object v2

    .line 90
    .local v2, "allConcurrentSets":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Set<Ljava/lang/String;>;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    .line 91
    .local v4, "concurrentSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p1, v4}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 92
    goto :goto_0

    .line 95
    :cond_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 96
    .local v5, "cameraIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x2

    if-lt v6, v7, :cond_4

    .line 97
    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 98
    .local v6, "id1":Ljava/lang/String;
    const/4 v7, 0x1

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_1

    .line 100
    .local v7, "id2":Ljava/lang/String;
    :try_start_1
    iget-object v8, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-static {v8, v6}, Landroidx/camera/camera2/internal/CameraIdUtil;->isBackwardCompatible(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    iget-object v8, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-static {v8, v7}, Landroidx/camera/camera2/internal/CameraIdUtil;->isBackwardCompatible(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 102
    new-instance v8, Ljava/util/HashSet;

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 104
    invoke-interface {v0, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 105
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    :cond_1
    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 110
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    :cond_2
    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Landroidx/camera/core/InitializationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_1 .. :try_end_1} :catch_1

    .line 117
    :cond_3
    goto :goto_1

    .line 114
    :catch_0
    move-exception v8

    .line 115
    .local v8, "e":Landroidx/camera/core/InitializationException;
    :try_start_2
    const-string v9, "Camera2CameraCoordinator"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Concurrent camera id pair: ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ") is not backward compatible"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_2 .. :try_end_2} :catch_1

    .line 119
    .end local v4    # "concurrentSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v5    # "cameraIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "id1":Ljava/lang/String;
    .end local v7    # "id2":Ljava/lang/String;
    .end local v8    # "e":Landroidx/camera/core/InitializationException;
    :cond_4
    :goto_1
    goto/16 :goto_0

    .line 122
    .end local v2    # "allConcurrentSets":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Set<Ljava/lang/String;>;>;"
    :cond_5
    nop

    .line 125
    iget-object v2, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 126
    :try_start_3
    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    .line 127
    iput-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;

    .line 128
    const-string v3, "Camera2CameraCoordinator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Updated concurrent camera map: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    monitor-exit v2

    .line 130
    return-void

    .line 129
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 120
    :catch_1
    move-exception v2

    .line 121
    .local v2, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v3, Landroidx/camera/core/impl/CameraUpdateException;

    const-string v4, "Failed to retrieve concurrent camera id info."

    invoke-direct {v3, v4, v2}, Landroidx/camera/core/impl/CameraUpdateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public removeListener(Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;)V
    .locals 2
    .param p1, "listener"    # Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;

    .line 235
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 236
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 237
    monitor-exit v0

    .line 238
    return-void

    .line 237
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setActiveConcurrentCameraInfos(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;)V"
        }
    .end annotation

    .line 157
    .local p1, "cameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 158
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    .line 159
    monitor-exit v0

    .line 160
    return-void

    .line 159
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setCameraOperatingMode(I)V
    .locals 5
    .param p1, "cameraOperatingMode"    # I

    .line 194
    const/4 v0, 0x0

    .line 197
    .local v0, "listenersSnapshot":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 198
    :try_start_0
    iget v2, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    if-ne p1, v2, :cond_0

    .line 199
    monitor-exit v1

    return-void

    .line 203
    :cond_0
    iget v2, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    .line 204
    .local v2, "previousMode":I
    iput p1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    .line 207
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v0, v3

    .line 210
    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    if-eq p1, v3, :cond_1

    .line 212
    iget-object v3, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 214
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    invoke-direct {p0, v0, v2, p1}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->notifyCameraModeListener(Ljava/util/List;II)V

    .line 217
    return-void

    .line 214
    .end local v2    # "previousMode":I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public shutdown()V
    .locals 2

    .line 242
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 243
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 244
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 245
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 246
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 247
    const/4 v1, 0x0

    iput v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    .line 248
    monitor-exit v0

    .line 249
    return-void

    .line 248
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
