.class public final Landroidx/camera/core/impl/CameraStateRegistry;
.super Ljava/lang/Object;
.source "CameraStateRegistry.java"

# interfaces
.implements Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;,
        Landroidx/camera/core/impl/CameraStateRegistry$OnConfigureAvailableListener;,
        Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;
    }
.end annotation


# static fields
.field private static final MAX_ALLOWED_CONCURRENT_CAMERAS_IN_CONCURRENT_MODE:I = 0x2

.field private static final MAX_ALLOWED_CONCURRENT_CAMERAS_IN_SINGLE_MODE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CameraStateRegistry"


# instance fields
.field private mAvailableCameras:I

.field private final mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

.field private final mCameraStates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/Camera;",
            "Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;",
            ">;"
        }
    .end annotation
.end field

.field private final mDebugString:Ljava/lang/StringBuilder;

.field private final mLock:Ljava/lang/Object;

.field private mMaxAllowedOpenedCameras:I


# direct methods
.method public constructor <init>(Landroidx/camera/core/concurrent/CameraCoordinator;I)V
    .locals 2
    .param p1, "cameraCoordinator"    # Landroidx/camera/core/concurrent/CameraCoordinator;
    .param p2, "maxAllowedOpenedCameras"    # I

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    .line 57
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    .line 78
    iput p2, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    .line 79
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 80
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    .line 81
    iget v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    iput v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    .line 82
    monitor-exit v0

    .line 83
    return-void

    .line 82
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    .locals 4
    .param p1, "targetCameraId"    # Ljava/lang/String;

    .line 409
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/Camera;

    .line 410
    .local v1, "camera":Landroidx/camera/core/Camera;
    invoke-interface {v1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v2}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v2

    .line 411
    .local v2, "cameraId":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 412
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    return-object v0

    .line 414
    .end local v1    # "camera":Landroidx/camera/core/Camera;
    .end local v2    # "cameraId":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 415
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z
    .locals 1
    .param p0, "state"    # Landroidx/camera/core/impl/CameraInternal$State;

    .line 351
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/impl/CameraInternal$State;->holdsCameraSlot()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private recalculateAvailableCameras()V
    .locals 14

    .line 357
    const-string v0, "CameraStateRegistry"

    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "-------------------------------------------------------------------\n"

    const-string v3, "%-45s%-22s\n"

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v1, :cond_0

    .line 358
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 359
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    const-string v7, "Recalculating open cameras:\n"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v8, v4, [Ljava/lang/Object;

    const-string v9, "Camera"

    aput-object v9, v8, v6

    const-string v9, "State"

    aput-object v9, v8, v5

    invoke-static {v7, v3, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    :cond_0
    const/4 v1, 0x0

    .line 369
    .local v1, "openCount":I
    iget-object v7, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    .line 370
    .local v8, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 372
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v9}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v9}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/camera/core/impl/CameraInternal$State;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    .line 373
    :cond_1
    const-string v9, "UNKNOWN"

    :goto_1
    nop

    .line 374
    .local v9, "stateString":Ljava/lang/String;
    iget-object v10, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 375
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/camera/core/Camera;

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    new-array v13, v4, [Ljava/lang/Object;

    aput-object v12, v13, v6

    aput-object v9, v13, v5

    invoke-static {v11, v3, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 374
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    .end local v9    # "stateString":Ljava/lang/String;
    :cond_2
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v9}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v9

    invoke-static {v9}, Landroidx/camera/core/impl/CameraStateRegistry;->isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 379
    add-int/lit8 v1, v1, 0x1

    .line 381
    .end local v8    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    :cond_3
    goto :goto_0

    .line 382
    :cond_4
    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 383
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    iget-object v2, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 386
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget v8, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    .line 387
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v7, v4, v6

    aput-object v8, v4, v5

    .line 385
    const-string v5, "Open count: %d (Max allowed: %d)"

    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    iget-object v2, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    :cond_5
    iget v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    sub-int/2addr v0, v1

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    .line 393
    return-void
.end method

.method private static traceState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)V
    .locals 2
    .param p0, "camera"    # Landroidx/camera/core/Camera;
    .param p1, "state"    # Landroidx/camera/core/impl/CameraInternal$State;

    .line 490
    invoke-static {}, Landroidx/tracing/Trace;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CX:State["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 492
    .local v0, "counterName":Ljava/lang/String;
    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraInternal$State;->ordinal()I

    move-result v1

    invoke-static {v0, v1}, Landroidx/tracing/Trace;->setCounter(Ljava/lang/String;I)V

    .line 494
    .end local v0    # "counterName":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private unregisterCamera(Landroidx/camera/core/Camera;)Landroidx/camera/core/impl/CameraInternal$State;
    .locals 2
    .param p1, "camera"    # Landroidx/camera/core/Camera;

    .line 316
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    .line 317
    .local v0, "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    if-eqz v0, :cond_0

    .line 318
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraStateRegistry;->recalculateAvailableCameras()V

    .line 319
    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v1

    return-object v1

    .line 322
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private updateAndVerifyState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)Landroidx/camera/core/impl/CameraInternal$State;
    .locals 3
    .param p1, "camera"    # Landroidx/camera/core/Camera;
    .param p2, "state"    # Landroidx/camera/core/impl/CameraInternal$State;

    .line 329
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    const-string v1, "Cannot update state of camera which has not yet been registered. Register with CameraStateRegistry.registerCamera()"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    .line 331
    invoke-virtual {v0, p2}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->setState(Landroidx/camera/core/impl/CameraInternal$State;)Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v0

    .line 333
    .local v0, "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    sget-object v1, Landroidx/camera/core/impl/CameraInternal$State;->OPENING:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne p2, v1, :cond_2

    .line 336
    invoke-static {p2}, Landroidx/camera/core/impl/CameraStateRegistry;->isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroidx/camera/core/impl/CameraInternal$State;->OPENING:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    const-string v2, "Cannot mark camera as opening until camera was successful at calling CameraStateRegistry.tryOpenCamera()"

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 342
    :cond_2
    if-eq v0, p2, :cond_3

    .line 343
    invoke-static {p1, p2}, Landroidx/camera/core/impl/CameraStateRegistry;->traceState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)V

    .line 344
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraStateRegistry;->recalculateAvailableCameras()V

    .line 347
    :cond_3
    return-object v0
.end method


# virtual methods
.method public isCameraClosing()Z
    .locals 5

    .line 397
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 398
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 399
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v3}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/impl/CameraInternal$State;->CLOSING:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne v3, v4, :cond_0

    .line 400
    monitor-exit v0

    const/4 v0, 0x1

    return v0

    .line 402
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    :cond_0
    goto :goto_0

    .line 403
    :cond_1
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    .line 404
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public markCameraState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)V
    .locals 1
    .param p1, "camera"    # Landroidx/camera/core/Camera;
    .param p2, "state"    # Landroidx/camera/core/impl/CameraInternal$State;

    .line 209
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Landroidx/camera/core/impl/CameraStateRegistry;->markCameraState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;Z)V

    .line 210
    return-void
.end method

.method public markCameraState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;Z)V
    .locals 9
    .param p1, "camera"    # Landroidx/camera/core/Camera;
    .param p2, "state"    # Landroidx/camera/core/impl/CameraInternal$State;
    .param p3, "notifyImmediately"    # Z

    .line 232
    const/4 v0, 0x0

    .line 233
    .local v0, "camerasToNotifyOpen":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    const/4 v1, 0x0

    .line 234
    .local v1, "cameraToNotifyConfigure":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    iget-object v2, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 236
    :try_start_0
    iget v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    .line 237
    .local v3, "previousAvailableCameras":I
    sget-object v4, Landroidx/camera/core/impl/CameraInternal$State;->RELEASED:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne p2, v4, :cond_0

    .line 238
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/CameraStateRegistry;->unregisterCamera(Landroidx/camera/core/Camera;)Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v4

    .local v4, "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    goto :goto_0

    .line 240
    .end local v4    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    :cond_0
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/impl/CameraStateRegistry;->updateAndVerifyState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v4

    .line 243
    .restart local v4    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    :goto_0
    if-ne v4, p2, :cond_1

    .line 245
    monitor-exit v2

    return-void

    .line 250
    :cond_1
    iget-object v5, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v5}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_2

    sget-object v5, Landroidx/camera/core/impl/CameraInternal$State;->CONFIGURED:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne p2, v5, :cond_2

    .line 252
    invoke-interface {p1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v5}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v5

    .line 253
    .local v5, "cameraId":Ljava/lang/String;
    iget-object v6, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v6, v5}, Landroidx/camera/core/concurrent/CameraCoordinator;->getPairedConcurrentCameraId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 254
    .local v6, "pairedCameraId":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 255
    invoke-direct {p0, v6}, Landroidx/camera/core/impl/CameraStateRegistry;->getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    move-result-object v7

    move-object v1, v7

    .line 259
    .end local v5    # "cameraId":Ljava/lang/String;
    .end local v6    # "pairedCameraId":Ljava/lang/String;
    :cond_2
    const/4 v5, 0x1

    if-ge v3, v5, :cond_5

    iget v5, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    if-lez v5, :cond_5

    .line 261
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    move-object v0, v5

    .line 262
    iget-object v5, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 263
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v7}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v7

    sget-object v8, Landroidx/camera/core/impl/CameraInternal$State;->PENDING_OPEN:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne v7, v8, :cond_3

    .line 264
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/Camera;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    :cond_3
    goto :goto_1

    :cond_4
    goto :goto_2

    .line 267
    :cond_5
    sget-object v5, Landroidx/camera/core/impl/CameraInternal$State;->PENDING_OPEN:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne p2, v5, :cond_6

    iget v5, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    if-lez v5, :cond_6

    .line 270
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    move-object v0, v5

    .line 271
    iget-object v5, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-interface {v0, p1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    :cond_6
    :goto_2
    if-eqz v0, :cond_7

    if-nez p3, :cond_7

    .line 276
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .end local v3    # "previousAvailableCameras":I
    .end local v4    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    :cond_7
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    if-eqz v0, :cond_8

    .line 282
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    .line 283
    .local v3, "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    invoke-virtual {v3}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->notifyOnOpenAvailableListener()V

    .line 284
    .end local v3    # "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    goto :goto_3

    .line 288
    :cond_8
    if-eqz v1, :cond_9

    .line 289
    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->notifyOnConfigureAvailableListener()V

    .line 291
    :cond_9
    return-void

    .line 278
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public onCameraOperatingModeUpdated(II)V
    .locals 5
    .param p1, "prevMode"    # I
    .param p2, "currMode"    # I

    .line 297
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 298
    const/4 v1, 0x1

    const/4 v2, 0x2

    if-ne p2, v2, :cond_0

    .line 299
    move v3, v2

    goto :goto_0

    .line 300
    :cond_0
    move v3, v1

    :goto_0
    :try_start_0
    iput v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    .line 301
    const/4 v3, 0x0

    if-eq p1, v2, :cond_1

    if-ne p2, v2, :cond_1

    move v4, v1

    goto :goto_1

    :cond_1
    move v4, v3

    .line 304
    .local v4, "isConcurrentCameraModeOn":Z
    :goto_1
    if-ne p1, v2, :cond_2

    if-eq p2, v2, :cond_2

    goto :goto_2

    :cond_2
    move v1, v3

    .line 307
    .local v1, "isConcurrentCameraModeOff":Z
    :goto_2
    if-nez v4, :cond_3

    if-eqz v1, :cond_4

    .line 308
    :cond_3
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraStateRegistry;->recalculateAvailableCameras()V

    .line 310
    .end local v1    # "isConcurrentCameraModeOff":Z
    .end local v4    # "isConcurrentCameraModeOn":Z
    :cond_4
    monitor-exit v0

    .line 311
    return-void

    .line 310
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerCamera(Landroidx/camera/core/Camera;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraStateRegistry$OnConfigureAvailableListener;Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;)V
    .locals 4
    .param p1, "camera"    # Landroidx/camera/core/Camera;
    .param p2, "notifyExecutor"    # Ljava/util/concurrent/Executor;
    .param p3, "onConfigureAvailableListener"    # Landroidx/camera/core/impl/CameraStateRegistry$OnConfigureAvailableListener;
    .param p4, "onOpenAvailableListener"    # Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;

    .line 107
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 108
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Camera is already registered: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 110
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    new-instance v2, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p2, p3, p4}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;-><init>(Landroidx/camera/core/impl/CameraInternal$State;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraStateRegistry$OnConfigureAvailableListener;Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    monitor-exit v0

    .line 113
    return-void

    .line 112
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public tryOpenCamera(Landroidx/camera/core/Camera;)Z
    .locals 12
    .param p1, "camera"    # Landroidx/camera/core/Camera;

    .line 134
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 135
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    const-string v2, "Camera must first be registered with registerCamera()"

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    .line 137
    .local v1, "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    const/4 v2, 0x0

    .line 138
    .local v2, "success":Z
    const-string v3, "CameraStateRegistry"

    invoke-static {v3}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    .line 139
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 140
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v7, "tryOpenCamera(%s) [Available Cameras: %d, Already Open: %b (Previous state: %s)]"

    iget v8, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    .line 142
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v9

    invoke-static {v9}, Landroidx/camera/core/impl/CameraStateRegistry;->isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    .line 143
    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v10

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    aput-object p1, v11, v5

    aput-object v8, v11, v4

    const/4 v8, 0x2

    aput-object v9, v11, v8

    const/4 v8, 0x3

    aput-object v10, v11, v8

    .line 140
    invoke-static {v6, v7, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    :cond_0
    iget v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    if-gtz v3, :cond_1

    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/impl/CameraStateRegistry;->isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 147
    :cond_1
    sget-object v3, Landroidx/camera/core/impl/CameraInternal$State;->OPENING:Landroidx/camera/core/impl/CameraInternal$State;

    invoke-virtual {v1, v3}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->setState(Landroidx/camera/core/impl/CameraInternal$State;)Landroidx/camera/core/impl/CameraInternal$State;

    .line 148
    sget-object v3, Landroidx/camera/core/impl/CameraInternal$State;->OPENING:Landroidx/camera/core/impl/CameraInternal$State;

    invoke-static {p1, v3}, Landroidx/camera/core/impl/CameraStateRegistry;->traceState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)V

    .line 149
    const/4 v2, 0x1

    .line 152
    :cond_2
    const-string v3, "CameraStateRegistry"

    invoke-static {v3}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 153
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, " --> %s"

    .line 154
    if-eqz v2, :cond_3

    const-string v8, "SUCCESS"

    goto :goto_0

    :cond_3
    const-string v8, "FAIL"

    :goto_0
    new-array v4, v4, [Ljava/lang/Object;

    aput-object v8, v4, v5

    invoke-static {v6, v7, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 153
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    const-string v3, "CameraStateRegistry"

    iget-object v4, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    :cond_4
    if-eqz v2, :cond_5

    .line 161
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraStateRegistry;->recalculateAvailableCameras()V

    .line 164
    :cond_5
    monitor-exit v0

    return v2

    .line 165
    .end local v1    # "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    .end local v2    # "success":Z
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public tryOpenCaptureSession(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 9
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "pairedCameraId"    # Ljava/lang/String;

    .line 179
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 180
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v1}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v1, v2, :cond_0

    .line 181
    monitor-exit v0

    return v3

    .line 183
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/CameraStateRegistry;->getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    move-result-object v1

    .line 184
    .local v1, "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v4

    goto :goto_0

    :cond_1
    move-object v4, v2

    .line 186
    .local v4, "selfState":Landroidx/camera/core/impl/CameraInternal$State;
    :goto_0
    if-eqz p2, :cond_2

    invoke-direct {p0, p2}, Landroidx/camera/core/impl/CameraStateRegistry;->getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    move-result-object v5

    goto :goto_1

    :cond_2
    move-object v5, v2

    .line 188
    .local v5, "pairedRegistration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    :goto_1
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v2

    .line 189
    .local v2, "pairedState":Landroidx/camera/core/impl/CameraInternal$State;
    :cond_3
    sget-object v6, Landroidx/camera/core/impl/CameraInternal$State;->OPEN:Landroidx/camera/core/impl/CameraInternal$State;

    invoke-virtual {v6, v4}, Landroidx/camera/core/impl/CameraInternal$State;->equals(Ljava/lang/Object;)Z

    move-result v6

    const/4 v7, 0x0

    if-nez v6, :cond_5

    sget-object v6, Landroidx/camera/core/impl/CameraInternal$State;->CONFIGURED:Landroidx/camera/core/impl/CameraInternal$State;

    .line 190
    invoke-virtual {v6, v4}, Landroidx/camera/core/impl/CameraInternal$State;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    goto :goto_2

    :cond_4
    move v6, v7

    goto :goto_3

    :cond_5
    :goto_2
    move v6, v3

    .line 191
    .local v6, "isSelfAvailable":Z
    :goto_3
    sget-object v8, Landroidx/camera/core/impl/CameraInternal$State;->OPEN:Landroidx/camera/core/impl/CameraInternal$State;

    invoke-virtual {v8, v2}, Landroidx/camera/core/impl/CameraInternal$State;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    sget-object v8, Landroidx/camera/core/impl/CameraInternal$State;->CONFIGURED:Landroidx/camera/core/impl/CameraInternal$State;

    .line 192
    invoke-virtual {v8, v2}, Landroidx/camera/core/impl/CameraInternal$State;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    goto :goto_4

    :cond_6
    move v8, v7

    goto :goto_5

    :cond_7
    :goto_4
    move v8, v3

    .line 193
    .local v8, "isPairAvailable":Z
    :goto_5
    if-eqz v6, :cond_8

    if-eqz v8, :cond_8

    goto :goto_6

    :cond_8
    move v3, v7

    :goto_6
    monitor-exit v0

    return v3

    .line 194
    .end local v1    # "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    .end local v2    # "pairedState":Landroidx/camera/core/impl/CameraInternal$State;
    .end local v4    # "selfState":Landroidx/camera/core/impl/CameraInternal$State;
    .end local v5    # "pairedRegistration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    .end local v6    # "isSelfAvailable":Z
    .end local v8    # "isPairAvailable":Z
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
