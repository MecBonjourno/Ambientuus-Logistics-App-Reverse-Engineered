.class public final Landroidx/camera/camera2/internal/Camera2CameraFactory;
.super Ljava/lang/Object;
.source "Camera2CameraFactory.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraFactory;


# static fields
.field private static final DEFAULT_ALLOWED_CONCURRENT_OPEN_CAMERAS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Camera2CameraFactory"


# instance fields
.field private mAvailableCameraIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mAvailableCamerasSelector:Landroidx/camera/core/CameraSelector;

.field private final mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

.field private final mCameraInfos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;",
            ">;"
        }
    .end annotation
.end field

.field private final mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

.field private final mCameraOpenRetryMaxTimeoutInMs:J

.field private final mCameraPresenceObservable:Landroidx/camera/camera2/internal/Camera2PresenceSource;

.field private final mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

.field private final mCameraXConfig:Landroidx/camera/core/CameraXConfig;

.field private final mContext:Landroid/content/Context;

.field private final mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

.field private final mLock:Ljava/lang/Object;

.field private final mStreamSpecsCalculator:Landroidx/camera/core/internal/StreamSpecsCalculator;

.field private final mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/camera/core/impl/CameraThreadConfig;Landroidx/camera/core/CameraSelector;J)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "threadConfig"    # Landroidx/camera/core/impl/CameraThreadConfig;
    .param p3, "availableCamerasSelector"    # Landroidx/camera/core/CameraSelector;
    .param p4, "cameraOpenRetryMaxTimeoutInMs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/InitializationException;
        }
    .end annotation

    .line 84
    const/4 v6, 0x0

    sget-object v7, Landroidx/camera/core/internal/StreamSpecsCalculator;->NO_OP_STREAM_SPECS_CALCULATOR:Landroidx/camera/core/internal/StreamSpecsCalculator;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "threadConfig":Landroidx/camera/core/impl/CameraThreadConfig;
    .end local p3    # "availableCamerasSelector":Landroidx/camera/core/CameraSelector;
    .end local p4    # "cameraOpenRetryMaxTimeoutInMs":J
    .local v1, "context":Landroid/content/Context;
    .local v2, "threadConfig":Landroidx/camera/core/impl/CameraThreadConfig;
    .local v3, "availableCamerasSelector":Landroidx/camera/core/CameraSelector;
    .local v4, "cameraOpenRetryMaxTimeoutInMs":J
    invoke-direct/range {v0 .. v7}, Landroidx/camera/camera2/internal/Camera2CameraFactory;-><init>(Landroid/content/Context;Landroidx/camera/core/impl/CameraThreadConfig;Landroidx/camera/core/CameraSelector;JLandroidx/camera/core/CameraXConfig;Landroidx/camera/core/internal/StreamSpecsCalculator;)V

    .line 86
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/camera/core/impl/CameraThreadConfig;Landroidx/camera/core/CameraSelector;JLandroidx/camera/core/CameraXConfig;Landroidx/camera/core/internal/StreamSpecsCalculator;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "threadConfig"    # Landroidx/camera/core/impl/CameraThreadConfig;
    .param p3, "availableCamerasSelector"    # Landroidx/camera/core/CameraSelector;
    .param p4, "cameraOpenRetryMaxTimeoutInMs"    # J
    .param p6, "cameraXConfig"    # Landroidx/camera/core/CameraXConfig;
    .param p7, "streamSpecsCalculator"    # Landroidx/camera/core/internal/StreamSpecsCalculator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/InitializationException;
        }
    .end annotation

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraInfos:Ljava/util/Map;

    .line 75
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mLock:Ljava/lang/Object;

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    .line 96
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mContext:Landroid/content/Context;

    .line 97
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    .line 98
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraThreadConfig;->getSchedulerHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {p1, v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->from(Landroid/content/Context;Landroid/os/Handler;)Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 99
    invoke-static {p1}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getInstance(Landroid/content/Context;)Landroidx/camera/camera2/internal/DisplayInfoManager;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 101
    new-instance v0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;-><init>(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    .line 102
    new-instance v0, Landroidx/camera/core/impl/CameraStateRegistry;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/impl/CameraStateRegistry;-><init>(Landroidx/camera/core/concurrent/CameraCoordinator;I)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

    .line 104
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

    invoke-interface {v0, v1}, Landroidx/camera/core/concurrent/CameraCoordinator;->addListener(Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;)V

    .line 105
    iput-wide p4, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraOpenRetryMaxTimeoutInMs:J

    .line 106
    iput-object p7, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mStreamSpecsCalculator:Landroidx/camera/core/internal/StreamSpecsCalculator;

    .line 107
    iput-object p6, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    .line 108
    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCamerasSelector:Landroidx/camera/core/CameraSelector;

    .line 113
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraIdList()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .local v0, "cameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    nop

    .line 117
    new-instance v1, Landroidx/camera/camera2/internal/Camera2PresenceSource;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    .line 118
    invoke-virtual {v3}, Landroidx/camera/core/impl/CameraThreadConfig;->getCameraExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Landroidx/camera/camera2/internal/Camera2PresenceSource;-><init>(Ljava/util/List;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/util/concurrent/Executor;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraPresenceObservable:Landroidx/camera/camera2/internal/Camera2PresenceSource;

    .line 119
    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/Camera2CameraFactory;->onCameraIdsUpdated(Ljava/util/List;)V

    .line 120
    return-void

    .line 114
    .end local v0    # "cameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v1, Landroidx/camera/core/InitializationException;

    invoke-static {v0}, Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;->createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/camera/core/InitializationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private getBackwardCompatibleCameraIds(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/InitializationException;
        }
    .end annotation

    .line 215
    .local p1, "availableCameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 217
    .local v0, "backwardCompatibleCameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 220
    .local v2, "cameraId":Ljava/lang/String;
    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_2

    .line 223
    :cond_0
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-static {v3, v2}, Landroidx/camera/camera2/internal/CameraIdUtil;->isBackwardCompatible(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 224
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 226
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Camera "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is filtered out because its capabilities do not contain REQUEST_AVAILABLE_CAPABILITIES_BACKWARD_COMPATIBLE."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Camera2CameraFactory"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .end local v2    # "cameraId":Ljava/lang/String;
    :goto_1
    goto :goto_0

    .line 221
    .restart local v2    # "cameraId":Ljava/lang/String;
    :cond_2
    :goto_2
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    goto :goto_0

    .line 231
    .end local v2    # "cameraId":Ljava/lang/String;
    :cond_3
    return-object v0
.end method


# virtual methods
.method public getAvailableCameraIds()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 187
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 188
    :try_start_0
    new-instance v1, Ljava/util/LinkedHashSet;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 189
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCamera(Ljava/lang/String;)Landroidx/camera/core/impl/CameraInternal;
    .locals 16
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 151
    move-object/from16 v1, p0

    iget-object v2, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 152
    :try_start_0
    iget-object v0, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    move-object/from16 v6, p1

    invoke-interface {v0, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    new-instance v3, Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget-object v4, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mContext:Landroid/content/Context;

    iget-object v5, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 159
    invoke-virtual/range {p0 .. p1}, Landroidx/camera/camera2/internal/Camera2CameraFactory;->getCameraInfo(Ljava/lang/String;)Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    move-result-object v7

    iget-object v8, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    iget-object v9, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

    iget-object v0, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    .line 162
    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraThreadConfig;->getCameraExecutor()Ljava/util/concurrent/Executor;

    move-result-object v10

    iget-object v0, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    .line 163
    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraThreadConfig;->getSchedulerHandler()Landroid/os/Handler;

    move-result-object v11

    iget-object v12, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    iget-wide v13, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraOpenRetryMaxTimeoutInMs:J

    iget-object v15, v1, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    invoke-direct/range {v3 .. v15}, Landroidx/camera/camera2/internal/Camera2CameraImpl;-><init>(Landroid/content/Context;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;Landroidx/camera/core/concurrent/CameraCoordinator;Landroidx/camera/core/impl/CameraStateRegistry;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroidx/camera/camera2/internal/DisplayInfoManager;JLandroidx/camera/core/CameraXConfig;)V

    .line 157
    return-object v3

    .line 153
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v3, "The given camera id is not on the available camera id list."

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "cameraId":Ljava/lang/String;
    throw v0

    .line 156
    .restart local p1    # "cameraId":Ljava/lang/String;
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;
    .locals 1

    .line 194
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    return-object v0
.end method

.method getCameraInfo(Ljava/lang/String;)Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    .locals 4
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 172
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraInfos:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 173
    .local v0, "camera2CameraInfoImpl":Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    if-nez v0, :cond_0

    .line 174
    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mStreamSpecsCalculator:Landroidx/camera/core/internal/StreamSpecsCalculator;

    invoke-direct {v1, p1, v2, v3}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;-><init>(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Landroidx/camera/core/internal/StreamSpecsCalculator;)V

    move-object v0, v1

    .line 176
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraInfos:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :cond_0
    return-object v0

    .line 179
    .end local v0    # "camera2CameraInfoImpl":Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    invoke-static {v0}, Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;->createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;

    move-result-object v1

    throw v1
.end method

.method public getCameraManager()Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .locals 1

    .line 199
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    return-object v0
.end method

.method public bridge synthetic getCameraManager()Ljava/lang/Object;
    .locals 1

    .line 57
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraFactory;->getCameraManager()Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    move-result-object v0

    return-object v0
.end method

.method public getCameraPresenceSource()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;>;"
        }
    .end annotation

    .line 204
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraPresenceObservable:Landroidx/camera/camera2/internal/Camera2PresenceSource;

    return-object v0
.end method

.method public onCameraIdsUpdated(Ljava/util/List;)V
    .locals 7
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
            Landroidx/camera/core/InitializationException;
        }
    .end annotation

    .line 129
    .local p1, "cameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 130
    .local v0, "rawIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCamerasSelector:Landroidx/camera/core/CameraSelector;

    invoke-static {p0, v1, v0}, Landroidx/camera/camera2/internal/CameraSelectionOptimizer;->getSelectedAvailableCameraIds(Landroidx/camera/camera2/internal/Camera2CameraFactory;Landroidx/camera/core/CameraSelector;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 132
    .local v1, "optimizedIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/Camera2CameraFactory;->getBackwardCompatibleCameraIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 133
    .local v2, "filteredIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_0
    .catch Landroidx/camera/core/InitializationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    :try_start_1
    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 135
    monitor-exit v3

    return-void

    .line 137
    :cond_0
    const-string v4, "Camera2CameraFactory"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Updated available camera list: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " -> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    iput-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    .line 140
    monitor-exit v3

    .line 145
    .end local v0    # "rawIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "optimizedIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "filteredIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    nop

    .line 146
    return-void

    .line 140
    .restart local v0    # "rawIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "optimizedIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "filteredIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p1    # "cameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_2
    throw v4
    :try_end_2
    .catch Landroidx/camera/core/InitializationException; {:try_start_2 .. :try_end_2} :catch_0

    .line 141
    .end local v0    # "rawIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "optimizedIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "filteredIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local p1    # "cameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Landroidx/camera/core/InitializationException;
    const-string v1, "Camera2CameraFactory"

    const-string v2, "Unable to get backward compatible camera ids"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 144
    throw v0
.end method

.method public shutdown()V
    .locals 1

    .line 209
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v0}, Landroidx/camera/core/concurrent/CameraCoordinator;->shutdown()V

    .line 210
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraPresenceObservable:Landroidx/camera/camera2/internal/Camera2PresenceSource;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->stopMonitoring()V

    .line 211
    return-void
.end method
