.class public final Landroidx/camera/camera2/interop/Camera2CameraInfo;
.super Ljava/lang/Object;
.source "Camera2CameraInfo.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2CameraInfo"


# instance fields
.field private mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

.field private mCamera2PhysicalCameraInfo:Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

.field private mExtensionsSpecificChars:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;)V
    .locals 0
    .param p1, "camera2CameraInfoImpl"    # Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 60
    return-void
.end method

.method private constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;Ljava/util/List;)V
    .locals 0
    .param p1, "camera2CameraInfoImpl"    # Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 71
    .local p2, "extensionsSpecificChars":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 73
    iput-object p2, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mExtensionsSpecificChars:Ljava/util/List;

    .line 74
    return-void
.end method

.method public constructor <init>(Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;)V
    .locals 0
    .param p1, "camera2PhysicalCameraInfo"    # Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2PhysicalCameraInfo:Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    .line 68
    return-void
.end method

.method public static extractCameraCharacteristics(Landroidx/camera/core/CameraInfo;)Landroid/hardware/camera2/CameraCharacteristics;
    .locals 3
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 181
    instance-of v0, p0, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    if-eqz v0, :cond_0

    .line 182
    move-object v0, p0

    check-cast v0, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    .line 183
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;->getCameraCharacteristicsCompat()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v0

    .line 184
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->toCameraCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v0

    .line 182
    return-object v0

    .line 187
    :cond_0
    move-object v0, p0

    check-cast v0, Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getImplementation()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    .line 188
    .local v0, "cameraInfoImpl":Landroidx/camera/core/impl/CameraInfoInternal;
    instance-of v1, v0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    const-string v2, "CameraInfo does not contain any Camera2 information."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 190
    move-object v1, v0

    check-cast v1, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 191
    .local v1, "impl":Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCameraCharacteristicsCompat()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->toCameraCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v2

    return-object v2
.end method

.method public static from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/camera2/interop/Camera2CameraInfo;
    .locals 6
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 90
    instance-of v0, p0, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    if-eqz v0, :cond_0

    .line 91
    move-object v0, p0

    check-cast v0, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;->getCamera2CameraInfo()Landroidx/camera/camera2/interop/Camera2CameraInfo;

    move-result-object v0

    return-object v0

    .line 94
    :cond_0
    move-object v0, p0

    check-cast v0, Landroidx/camera/core/impl/CameraInfoInternal;

    .line 95
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getImplementation()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    .line 96
    .local v0, "cameraInfoImpl":Landroidx/camera/core/impl/CameraInfoInternal;
    instance-of v1, v0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    const-string v2, "CameraInfo doesn\'t contain Camera2 implementation."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 98
    move-object v1, v0

    check-cast v1, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 99
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCamera2CameraInfo()Landroidx/camera/camera2/interop/Camera2CameraInfo;

    move-result-object v1

    .line 100
    .local v1, "camera2CameraInfo":Landroidx/camera/camera2/interop/Camera2CameraInfo;
    instance-of v2, p0, Landroidx/camera/core/impl/AdapterCameraInfo;

    if-eqz v2, :cond_1

    .line 101
    move-object v2, p0

    check-cast v2, Landroidx/camera/core/impl/AdapterCameraInfo;

    .line 102
    invoke-virtual {v2}, Landroidx/camera/core/impl/AdapterCameraInfo;->getSessionProcessor()Landroidx/camera/core/impl/SessionProcessor;

    move-result-object v2

    .line 103
    .local v2, "sessionProcessor":Landroidx/camera/core/impl/SessionProcessor;
    if-eqz v2, :cond_1

    .line 104
    new-instance v3, Landroidx/camera/camera2/interop/Camera2CameraInfo;

    iget-object v4, v1, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 106
    invoke-interface {v2}, Landroidx/camera/core/impl/SessionProcessor;->getAvailableCharacteristicsKeyValues()Ljava/util/List;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroidx/camera/camera2/interop/Camera2CameraInfo;-><init>(Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;Ljava/util/List;)V

    move-object v1, v3

    .line 110
    .end local v2    # "sessionProcessor":Landroidx/camera/core/impl/SessionProcessor;
    :cond_1
    return-object v1
.end method


# virtual methods
.method public getCameraCharacteristic(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 150
    .local p1, "key":Landroid/hardware/camera2/CameraCharacteristics$Key;, "Landroid/hardware/camera2/CameraCharacteristics$Key<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2PhysicalCameraInfo:Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2PhysicalCameraInfo:Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;->getCameraCharacteristicsCompat()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 154
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mExtensionsSpecificChars:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 155
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mExtensionsSpecificChars:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 156
    .local v1, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;"
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v2, p1}, Landroid/hardware/camera2/CameraCharacteristics$Key;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 157
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    return-object v0

    .line 159
    .end local v1    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;"
    :cond_1
    goto :goto_0

    .line 161
    :cond_2
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCameraCharacteristicsCompat()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getCameraCharacteristicsMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            ">;"
        }
    .end annotation

    .line 204
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2PhysicalCameraInfo:Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    if-eqz v0, :cond_0

    .line 205
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 207
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCameraCharacteristicsMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getCameraId()Ljava/lang/String;
    .locals 1

    .line 131
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2PhysicalCameraInfo:Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2PhysicalCameraInfo:Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;->getCameraId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 134
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCameraId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
