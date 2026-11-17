.class public final Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;
.super Ljava/lang/Object;
.source "Camera2DeviceSurfaceManager.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraDeviceSurfaceManager;


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2DeviceSurfaceManager"


# instance fields
.field private final mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

.field private final mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

.field private final mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mLock:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/camera/camera2/internal/CamcorderProfileHelper;Ljava/lang/Object;Ljava/util/Set;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "camcorderProfileHelper"    # Landroidx/camera/camera2/internal/CamcorderProfileHelper;
    .param p3, "cameraManager"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/camera/camera2/internal/CamcorderProfileHelper;",
            "Ljava/lang/Object;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 99
    .local p4, "availableCameraIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mLock:Ljava/lang/Object;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;

    .line 100
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    .line 102
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mContext:Landroid/content/Context;

    .line 104
    instance-of v0, p3, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    if-eqz v0, :cond_0

    .line 105
    move-object v0, p3

    check-cast v0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    goto :goto_0

    .line 107
    :cond_0
    invoke-static {p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->from(Landroid/content/Context;)Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 111
    :goto_0
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->onCamerasUpdated(Ljava/util/List;)V
    :try_end_0
    .catch Landroidx/camera/core/impl/CameraUpdateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    nop

    .line 119
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Landroidx/camera/core/impl/CameraUpdateException;
    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraUpdateException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Landroidx/camera/core/CameraUnavailableException;

    if-eqz v1, :cond_1

    .line 114
    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraUpdateException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/CameraUnavailableException;

    throw v1

    .line 116
    :cond_1
    new-instance v1, Landroidx/camera/core/CameraUnavailableException;

    const/4 v2, 0x3

    invoke-direct {v1, v2, v0}, Landroidx/camera/core/CameraUnavailableException;-><init>(ILjava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Object;Ljava/util/Set;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraManager"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Object;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 81
    .local p3, "availableCameraIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager$1;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager$1;-><init>()V

    invoke-direct {p0, p1, v0, p2, p3}, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;-><init>(Landroid/content/Context;Landroidx/camera/camera2/internal/CamcorderProfileHelper;Ljava/lang/Object;Ljava/util/Set;)V

    .line 93
    return-void
.end method

.method private createSurfaceCombination(Ljava/lang/String;)Landroidx/camera/camera2/internal/SupportedSurfaceCombination;
    .locals 7
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 161
    sget-object v0, Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;->NO_OP_FEATURE_COMBINATION_QUERY:Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;

    .line 164
    .local v0, "featureCombinationQuery":Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x23

    if-lt v1, v2, :cond_0

    .line 166
    new-instance v1, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mContext:Landroid/content/Context;

    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-direct {v1, v2, p1, v3}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;-><init>(Landroid/content/Context;Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V

    move-object v0, v1

    move-object v6, v0

    goto :goto_0

    .line 164
    :cond_0
    move-object v6, v0

    .line 170
    .end local v0    # "featureCombinationQuery":Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;
    .local v6, "featureCombinationQuery":Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;
    :goto_0
    new-instance v1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mContext:Landroid/content/Context;

    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    iget-object v5, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    move-object v3, p1

    .end local p1    # "cameraId":Ljava/lang/String;
    .local v3, "cameraId":Ljava/lang/String;
    invoke-direct/range {v1 .. v6}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;-><init>(Landroid/content/Context;Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Landroidx/camera/camera2/internal/CamcorderProfileHelper;Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;)V

    return-object v1
.end method


# virtual methods
.method public getSuggestedStreamSpecs(ILjava/lang/String;Ljava/util/List;Ljava/util/Map;ZZZZ)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;
    .locals 10
    .param p1, "cameraMode"    # I
    .param p2, "cameraId"    # Ljava/lang/String;
    .param p5, "isPreviewStabilizationOn"    # Z
    .param p6, "hasVideoCapture"    # Z
    .param p7, "isFeatureComboInvocation"    # Z
    .param p8, "findMaxSupportedFrameRate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;ZZZZ)",
            "Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;"
        }
    .end annotation

    .line 218
    .local p3, "existingSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p4, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-interface {p4}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "No new use cases to be bound."

    invoke-static {v0, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 221
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;

    .line 222
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;

    .line 224
    .local v2, "supportedSurfaceCombination":Landroidx/camera/camera2/internal/SupportedSurfaceCombination;
    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No such camera id in supported combination list: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 227
    move v3, p1

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    invoke-virtual/range {v2 .. v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getSuggestedStreamSpecifications(ILjava/util/List;Ljava/util/Map;ZZZZ)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;

    move-result-object v0

    return-object v0
.end method

.method public onCamerasUpdated(Ljava/util/List;)V
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
            Landroidx/camera/core/impl/CameraUpdateException;
        }
    .end annotation

    .line 124
    .local p1, "newCameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 126
    .local v0, "newCombinations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/camera/camera2/internal/SupportedSurfaceCombination;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 127
    :try_start_0
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 128
    .local v2, "combinationsToCreate":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 129
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 132
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

    .line 133
    .local v3, "cameraId":Ljava/lang/String;
    invoke-direct {p0, v3}, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->createSurfaceCombination(Ljava/lang/String;)Landroidx/camera/camera2/internal/SupportedSurfaceCombination;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Landroidx/camera/core/CameraUnavailableException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 134
    nop

    .end local v3    # "cameraId":Ljava/lang/String;
    goto :goto_0

    .line 138
    :cond_0
    nop

    .line 141
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 142
    :try_start_2
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 143
    .local v3, "finalCombinations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/camera/camera2/internal/SupportedSurfaceCombination;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 144
    .local v5, "cameraId":Ljava/lang/String;
    iget-object v6, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 145
    iget-object v6, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;

    .line 146
    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;

    .line 145
    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 148
    :cond_1
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .end local v5    # "cameraId":Ljava/lang/String;
    :goto_2
    goto :goto_1

    .line 151
    :cond_2
    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 152
    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 153
    .end local v3    # "finalCombinations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/camera/camera2/internal/SupportedSurfaceCombination;>;"
    monitor-exit v1

    .line 154
    return-void

    .line 153
    :catchall_0
    move-exception v3

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 135
    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    .line 137
    .local v1, "e":Ljava/lang/Exception;
    :goto_3
    new-instance v3, Landroidx/camera/core/impl/CameraUpdateException;

    const-string v4, "Failed to create SupportedSurfaceCombination"

    invoke-direct {v3, v4, v1}, Landroidx/camera/core/impl/CameraUpdateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 129
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "combinationsToCreate":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catchall_1
    move-exception v2

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2
.end method

.method public transformSurfaceConfig(ILjava/lang/String;ILandroid/util/Size;Landroidx/camera/core/impl/StreamUseCase;)Landroidx/camera/core/impl/SurfaceConfig;
    .locals 4
    .param p1, "cameraMode"    # I
    .param p2, "cameraId"    # Ljava/lang/String;
    .param p3, "imageFormat"    # I
    .param p4, "size"    # Landroid/util/Size;
    .param p5, "streamUseCase"    # Landroidx/camera/core/impl/StreamUseCase;

    .line 195
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;->mCameraSupportedSurfaceCombinationMap:Ljava/util/Map;

    .line 196
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;

    .line 198
    .local v0, "supportedSurfaceCombination":Landroidx/camera/camera2/internal/SupportedSurfaceCombination;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No such camera id in supported combination list: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 201
    invoke-virtual {v0, p1, p3, p4, p5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->transformSurfaceConfig(IILandroid/util/Size;Landroidx/camera/core/impl/StreamUseCase;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v1

    return-object v1
.end method
