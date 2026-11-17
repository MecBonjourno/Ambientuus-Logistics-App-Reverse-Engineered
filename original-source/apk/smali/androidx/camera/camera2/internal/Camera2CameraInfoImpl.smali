.class public final Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
.super Ljava/lang/Object;
.source "Camera2CameraInfoImpl.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraInfoInternal;


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2CameraInfo"


# instance fields
.field private mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field private final mCamera2CameraInfo:Landroidx/camera/camera2/interop/Camera2CameraInfo;

.field private final mCamera2EncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

.field private mCameraCaptureCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            "Ljava/util/concurrent/Executor;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

.field private final mCameraId:Ljava/lang/String;

.field private final mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

.field private final mCameraQuirks:Landroidx/camera/core/impl/Quirks;

.field private final mCameraStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/utils/RedirectableLiveData<",
            "Landroidx/camera/core/CameraState;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private mPhysicalCameraInfos:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/utils/RedirectableLiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/utils/RedirectableLiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/utils/RedirectableLiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/utils/RedirectableLiveData<",
            "Landroidx/camera/core/ZoomState;",
            ">;"
        }
    .end annotation
.end field

.field private final mStreamSpecsCalculator:Landroidx/camera/core/internal/StreamSpecsCalculator;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V
    .locals 1
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 143
    sget-object v0, Landroidx/camera/core/internal/StreamSpecsCalculator;->NO_OP_STREAM_SPECS_CALCULATOR:Landroidx/camera/core/internal/StreamSpecsCalculator;

    invoke-direct {p0, p1, p2, v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;-><init>(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Landroidx/camera/core/internal/StreamSpecsCalculator;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Landroidx/camera/core/internal/StreamSpecsCalculator;)V
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .param p3, "streamSpecsCalculator"    # Landroidx/camera/core/internal/StreamSpecsCalculator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 119
    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 121
    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 123
    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 126
    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    .line 154
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraId:Ljava/lang/String;

    .line 155
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 157
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraId:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 158
    new-instance v0, Landroidx/camera/camera2/interop/Camera2CameraInfo;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/interop/Camera2CameraInfo;-><init>(Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraInfo:Landroidx/camera/camera2/interop/Camera2CameraInfo;

    .line 159
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {p1, v0}, Landroidx/camera/camera2/internal/compat/quirk/CameraQuirks;->get(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/core/impl/Quirks;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    .line 160
    new-instance v0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    invoke-direct {v0, p1, v1}, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;-><init>(Ljava/lang/String;Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2EncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 162
    new-instance v0, Landroidx/camera/core/impl/utils/RedirectableLiveData;

    sget-object v1, Landroidx/camera/core/CameraState$Type;->CLOSED:Landroidx/camera/core/CameraState$Type;

    .line 163
    invoke-static {v1}, Landroidx/camera/core/CameraState;->create(Landroidx/camera/core/CameraState$Type;)Landroidx/camera/core/CameraState;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/utils/RedirectableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 164
    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mStreamSpecsCalculator:Landroidx/camera/core/internal/StreamSpecsCalculator;

    .line 165
    return-void
.end method

.method private logDeviceInfo()V
    .locals 0

    .line 272
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->logDeviceLevel()V

    .line 273
    return-void
.end method

.method private logDeviceLevel()V
    .locals 4

    .line 278
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getSupportedHardwareLevel()I

    move-result v0

    .line 279
    .local v0, "deviceLevel":I
    packed-switch v0, :pswitch_data_0

    .line 296
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, "levelString":Ljava/lang/String;
    goto :goto_0

    .line 284
    .end local v1    # "levelString":Ljava/lang/String;
    :pswitch_0
    const-string v1, "INFO_SUPPORTED_HARDWARE_LEVEL_EXTERNAL"

    .line 285
    .restart local v1    # "levelString":Ljava/lang/String;
    goto :goto_0

    .line 293
    .end local v1    # "levelString":Ljava/lang/String;
    :pswitch_1
    const-string v1, "INFO_SUPPORTED_HARDWARE_LEVEL_3"

    .line 294
    .restart local v1    # "levelString":Ljava/lang/String;
    goto :goto_0

    .line 281
    .end local v1    # "levelString":Ljava/lang/String;
    :pswitch_2
    const-string v1, "INFO_SUPPORTED_HARDWARE_LEVEL_LEGACY"

    .line 282
    .restart local v1    # "levelString":Ljava/lang/String;
    goto :goto_0

    .line 290
    .end local v1    # "levelString":Ljava/lang/String;
    :pswitch_3
    const-string v1, "INFO_SUPPORTED_HARDWARE_LEVEL_FULL"

    .line 291
    .restart local v1    # "levelString":Ljava/lang/String;
    goto :goto_0

    .line 287
    .end local v1    # "levelString":Ljava/lang/String;
    :pswitch_4
    const-string v1, "INFO_SUPPORTED_HARDWARE_LEVEL_LIMITED"

    .line 288
    .restart local v1    # "levelString":Ljava/lang/String;
    nop

    .line 299
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Device Level: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Camera2CameraInfo"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public addSessionCaptureCallback(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 589
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 590
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    if-nez v1, :cond_1

    .line 591
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    if-nez v1, :cond_0

    .line 592
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    .line 594
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    new-instance v2, Landroid/util/Pair;

    invoke-direct {v2, p2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 595
    monitor-exit v0

    return-void

    .line 598
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1, p1, p2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->addSessionCameraCaptureCallback(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 599
    monitor-exit v0

    .line 600
    return-void

    .line 599
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getAvailableCapabilities()Ljava/util/Set;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 796
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 797
    .local v0, "capabilitySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 799
    .local v1, "capabilities":[I
    if-eqz v1, :cond_0

    .line 800
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget v4, v1, v3

    .line 801
    .local v4, "capability":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 800
    .end local v4    # "capability":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 805
    :cond_0
    return-object v0
.end method

.method public getCamera2CameraInfo()Landroidx/camera/camera2/interop/Camera2CameraInfo;
    .locals 1

    .line 665
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraInfo:Landroidx/camera/camera2/interop/Camera2CameraInfo;

    return-object v0
.end method

.method public getCameraCharacteristics()Ljava/lang/Object;
    .locals 1

    .line 670
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->toCameraCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v0

    return-object v0
.end method

.method public getCameraCharacteristicsCompat()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .locals 1

    .line 223
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    return-object v0
.end method

.method public getCameraCharacteristicsMap()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            ">;"
        }
    .end annotation

    .line 698
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 700
    .local v0, "map":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Landroid/hardware/camera2/CameraCharacteristics;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraId:Ljava/lang/String;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->toCameraCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getPhysicalCameraIds()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 703
    .local v2, "physicalCameraId":Ljava/lang/String;
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraId:Ljava/lang/String;

    invoke-static {v2, v3}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 704
    goto :goto_0

    .line 707
    :cond_0
    :try_start_0
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 708
    invoke-virtual {v3, v2}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v3

    .line 709
    invoke-virtual {v3}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->toCameraCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v3

    .line 707
    invoke-virtual {v0, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 713
    goto :goto_1

    .line 710
    :catch_0
    move-exception v3

    .line 711
    .local v3, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to get CameraCharacteristics for cameraId "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Camera2CameraInfo"

    invoke-static {v5, v4, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 714
    .end local v2    # "physicalCameraId":Ljava/lang/String;
    .end local v3    # "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    :goto_1
    goto :goto_0

    .line 715
    :cond_1
    return-object v0
.end method

.method public getCameraId()Ljava/lang/String;
    .locals 1

    .line 219
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraId:Ljava/lang/String;

    return-object v0
.end method

.method public synthetic getCameraIdentifier()Landroidx/camera/core/CameraIdentifier;
    .locals 1

    invoke-static {p0}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$getCameraIdentifier(Landroidx/camera/core/impl/CameraInfoInternal;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    return-object v0
.end method

.method public getCameraQuirks()Landroidx/camera/core/impl/Quirks;
    .locals 1

    .line 626
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    return-object v0
.end method

.method public synthetic getCameraSelector()Landroidx/camera/core/CameraSelector;
    .locals 1

    invoke-static {p0}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$getCameraSelector(Landroidx/camera/core/impl/CameraInfoInternal;)Landroidx/camera/core/CameraSelector;

    move-result-object v0

    return-object v0
.end method

.method public getCameraState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/camera/core/CameraState;",
            ">;"
        }
    .end annotation

    .line 384
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    return-object v0
.end method

.method public getEncoderProfilesProvider()Landroidx/camera/core/impl/EncoderProfilesProvider;
    .locals 1

    .line 466
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2EncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    return-object v0
.end method

.method public getExposureState()Landroidx/camera/core/ExposureState;
    .locals 2

    .line 374
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 375
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    if-nez v1, :cond_0

    .line 376
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v1}, Landroidx/camera/camera2/internal/ExposureControl;->getDefaultExposureState(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/core/ExposureState;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 378
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getExposureControl()Landroidx/camera/camera2/internal/ExposureControl;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/ExposureControl;->getExposureState()Landroidx/camera/core/ExposureState;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 379
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public synthetic getImplementation()Landroidx/camera/core/impl/CameraInfoInternal;
    .locals 1

    invoke-static {p0}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$getImplementation(Landroidx/camera/core/impl/CameraInfoInternal;)Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    return-object v0
.end method

.method public getImplementationType()Ljava/lang/String;
    .locals 2

    .line 400
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getSupportedHardwareLevel()I

    move-result v0

    .line 401
    .local v0, "hardwareLevel":I
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 402
    const-string v1, "androidx.camera.camera2.legacy"

    goto :goto_0

    :cond_0
    const-string v1, "androidx.camera.camera2"

    .line 401
    :goto_0
    return-object v1
.end method

.method public getIntrinsicZoomRatio()F
    .locals 5

    .line 408
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 409
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 410
    .local v0, "lensFacing":Ljava/lang/Integer;
    const/high16 v1, 0x3f800000    # 1.0f

    if-nez v0, :cond_0

    .line 411
    return v1

    .line 417
    :cond_0
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 419
    invoke-static {v2}, Landroidx/camera/camera2/internal/FovUtil;->getDefaultFocalLength(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)F

    move-result v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 420
    invoke-static {v3}, Landroidx/camera/camera2/internal/FovUtil;->getSensorHorizontalLength(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)F

    move-result v3

    .line 418
    invoke-static {v2, v3}, Landroidx/camera/camera2/internal/FovUtil;->focalLengthToViewAngleDegrees(FF)I

    move-result v2

    .line 421
    .local v2, "fovDegrees":I
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 422
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 421
    invoke-static {v3, v4}, Landroidx/camera/camera2/internal/FovUtil;->getDeviceDefaultViewAngleDegrees(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;I)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 427
    .local v1, "defaultFovDegrees":I
    nop

    .line 429
    int-to-float v3, v1

    int-to-float v4, v2

    div-float/2addr v3, v4

    return v3

    .line 423
    .end local v1    # "defaultFovDegrees":I
    .end local v2    # "fovDegrees":I
    :catch_0
    move-exception v2

    .line 424
    .local v2, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The camera is unable to provide necessary information to resolve its intrinsic zoom ratio with error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Camera2CameraInfo"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    return v1
.end method

.method public getLensFacing()I
    .locals 3

    .line 229
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 230
    .local v0, "lensFacing":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "Unable to get the lens facing of the camera."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 231
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Landroidx/camera/camera2/internal/LensFacingUtil;->getCameraSelectorLensFacing(I)I

    move-result v1

    return v1
.end method

.method public getLowLightBoostState()Landroidx/lifecycle/LiveData;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 334
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 335
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    if-nez v1, :cond_1

    .line 336
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-nez v1, :cond_0

    .line 337
    new-instance v1, Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 338
    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/camera/core/impl/utils/RedirectableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 340
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    monitor-exit v0

    return-object v1

    .line 344
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-eqz v1, :cond_2

    .line 345
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    monitor-exit v0

    return-object v1

    .line 348
    :cond_2
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getLowLightBoostControl()Landroidx/camera/camera2/internal/LowLightBoostControl;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/LowLightBoostControl;->getLowLightBoostState()Landroidx/lifecycle/LiveData;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 349
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getMaxTorchStrengthLevel()I
    .locals 1

    .line 743
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->isTorchStrengthSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getMaxTorchStrengthLevel()I

    move-result v0

    goto :goto_0

    .line 744
    :cond_0
    const/4 v0, 0x0

    .line 743
    :goto_0
    return v0
.end method

.method public getPhysicalCameraCharacteristics(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "physicalCameraId"    # Ljava/lang/String;

    .line 676
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getPhysicalCameraIds()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 677
    return-object v0

    .line 679
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v1

    .line 680
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->toCameraCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v0
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 679
    return-object v0

    .line 681
    :catch_0
    move-exception v1

    .line 682
    .local v1, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to get CameraCharacteristics for cameraId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Camera2CameraInfo"

    invoke-static {v3, v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 686
    .end local v1    # "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    return-object v0
.end method

.method public getPhysicalCameraInfos()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation

    .line 720
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mPhysicalCameraInfos:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 721
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mPhysicalCameraInfos:Ljava/util/Set;

    .line 722
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getPhysicalCameraIds()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 724
    .local v1, "physicalCameraId":Ljava/lang/String;
    :try_start_0
    new-instance v2, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;

    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-direct {v2, v1, v3}, Landroidx/camera/camera2/internal/Camera2PhysicalCameraInfoImpl;-><init>(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V

    .line 727
    .local v2, "physicalCameraInfo":Landroidx/camera/core/CameraInfo;
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mPhysicalCameraInfos:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 733
    nop

    .line 734
    .end local v1    # "physicalCameraId":Ljava/lang/String;
    .end local v2    # "physicalCameraInfo":Landroidx/camera/core/CameraInfo;
    goto :goto_0

    .line 728
    .restart local v1    # "physicalCameraId":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 729
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to get CameraCharacteristics for cameraId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Camera2CameraInfo"

    invoke-static {v3, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 732
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    return-object v2

    .line 737
    .end local v0    # "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    .end local v1    # "physicalCameraId":Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mPhysicalCameraInfos:Ljava/util/Set;

    return-object v0
.end method

.method getSensorOrientation()I
    .locals 2

    .line 251
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 252
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 253
    .local v0, "sensorOrientation":Ljava/lang/Integer;
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method public getSensorRect()Landroid/graphics/Rect;
    .locals 5

    .line 571
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    .line 573
    .local v0, "sensorRect":Landroid/graphics/Rect;
    const-string/jumbo v1, "robolectric"

    sget-object v2, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    if-nez v0, :cond_0

    .line 574
    new-instance v1, Landroid/graphics/Rect;

    const/16 v2, 0xfa0

    const/16 v3, 0xbb8

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1

    .line 576
    :cond_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    return-object v1
.end method

.method public getSensorRotationDegrees()I
    .locals 1

    .line 267
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getSensorRotationDegrees(I)I

    move-result v0

    return v0
.end method

.method public getSensorRotationDegrees(I)I
    .locals 5
    .param p1, "relativeRotation"    # I

    .line 236
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getSensorOrientation()I

    move-result v0

    .line 237
    .local v0, "sensorOrientation":I
    nop

    .line 238
    invoke-static {p1}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v1

    .line 242
    .local v1, "relativeRotationDegrees":I
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getLensFacing()I

    move-result v2

    .line 243
    .local v2, "lensFacing":I
    const/4 v3, 0x1

    if-ne v3, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 244
    .local v3, "isOppositeFacingScreen":Z
    :goto_0
    invoke-static {v1, v0, v3}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->getRelativeImageRotation(IIZ)I

    move-result v4

    return v4
.end method

.method public getSupportedDynamicRanges()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 517
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->fromCameraCharacteristics(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    move-result-object v0

    .line 520
    .local v0, "dynamicRangesCompat":Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public getSupportedFrameRateRanges()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 631
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 632
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Range;

    .line 634
    .local v0, "availableTargetFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    if-eqz v0, :cond_0

    .line 635
    new-instance v1, Ljava/util/HashSet;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v1

    .line 637
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public synthetic getSupportedFrameRateRanges(Landroidx/camera/core/SessionConfig;)Ljava/util/Set;
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$getSupportedFrameRateRanges(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/SessionConfig;)Ljava/util/Set;

    move-result-object p1

    return-object p1
.end method

.method getSupportedHardwareLevel()I
    .locals 2

    .line 258
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 259
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 261
    .local v0, "deviceLevel":Ljava/lang/Integer;
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method public getSupportedHighResolutions(I)Ljava/util/List;
    .locals 3
    .param p1, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 509
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 510
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 511
    .local v0, "mapCompat":Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;
    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getHighResolutionOutputSizes(I)[Landroid/util/Size;

    move-result-object v1

    .line 512
    .local v1, "size":[Landroid/util/Size;
    if-eqz v1, :cond_0

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    :goto_0
    return-object v2
.end method

.method public getSupportedHighSpeedFrameRateRanges()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 531
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 532
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getHighSpeedVideoFpsRanges()[Landroid/util/Range;

    move-result-object v0

    .line 533
    .local v0, "ranges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    if-eqz v0, :cond_0

    new-instance v1, Ljava/util/HashSet;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getSupportedHighSpeedFrameRateRangesFor(Landroid/util/Size;)Ljava/util/Set;
    .locals 4
    .param p1, "size"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/Set<",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 539
    const/4 v0, 0x0

    .line 541
    .local v0, "ranges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v1

    .line 542
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getHighSpeedVideoFpsRangesFor(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 545
    goto :goto_0

    .line 543
    :catch_0
    move-exception v1

    .line 544
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can\'t get high speed frame rate ranges for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Camera2CameraInfo"

    invoke-static {v3, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 546
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    if-eqz v0, :cond_0

    new-instance v1, Ljava/util/HashSet;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_1

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    :goto_1
    return-object v1
.end method

.method public getSupportedHighSpeedResolutions()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 551
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 552
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getHighSpeedVideoSizes()[Landroid/util/Size;

    move-result-object v0

    .line 553
    .local v0, "sizes":[Landroid/util/Size;
    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getSupportedHighSpeedResolutionsFor(Landroid/util/Range;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 559
    .local p1, "fpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .line 561
    .local v0, "sizes":[Landroid/util/Size;
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v1

    .line 562
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getHighSpeedVideoSizesFor(Landroid/util/Range;)[Landroid/util/Size;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 565
    goto :goto_0

    .line 563
    :catch_0
    move-exception v1

    .line 564
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can\'t get high speed resolutions for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Camera2CameraInfo"

    invoke-static {v3, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 566
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_1

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    :goto_1
    return-object v1
.end method

.method public getSupportedOutputFormats()Ljava/util/Set;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 485
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 486
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 487
    .local v0, "mapCompat":Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getOutputFormats()[I

    move-result-object v1

    .line 488
    .local v1, "formats":[I
    if-nez v1, :cond_0

    .line 489
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    return-object v2

    .line 492
    :cond_0
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 493
    .local v2, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget v5, v1, v4

    .line 494
    .local v5, "format":I
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 493
    .end local v5    # "format":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 496
    :cond_1
    return-object v2
.end method

.method public getSupportedResolutions(I)Ljava/util/List;
    .locals 3
    .param p1, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 501
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 502
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 503
    .local v0, "mapCompat":Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;
    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v1

    .line 504
    .local v1, "size":[Landroid/util/Size;
    if-eqz v1, :cond_0

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    :goto_0
    return-object v2
.end method

.method public getTimebase()Landroidx/camera/core/impl/Timebase;
    .locals 2

    .line 471
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_TIMESTAMP_SOURCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 473
    .local v0, "timeSource":Ljava/lang/Integer;
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 479
    sget-object v1, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    return-object v1

    .line 476
    :pswitch_0
    sget-object v1, Landroidx/camera/core/impl/Timebase;->REALTIME:Landroidx/camera/core/impl/Timebase;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getTorchState()Landroidx/lifecycle/LiveData;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 309
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 310
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    if-nez v1, :cond_1

    .line 311
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-nez v1, :cond_0

    .line 312
    new-instance v1, Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 313
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/camera/core/impl/utils/RedirectableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 315
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    monitor-exit v0

    return-object v1

    .line 319
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-eqz v1, :cond_2

    .line 320
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    monitor-exit v0

    return-object v1

    .line 323
    :cond_2
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getTorchControl()Landroidx/camera/camera2/internal/TorchControl;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/TorchControl;->getTorchState()Landroidx/lifecycle/LiveData;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 324
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getTorchStrengthLevel()Landroidx/lifecycle/LiveData;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 749
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 750
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    if-nez v1, :cond_2

    .line 751
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-nez v1, :cond_1

    .line 752
    new-instance v1, Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 753
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->isTorchStrengthSupported()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 754
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getDefaultTorchStrengthLevel()I

    move-result v2

    goto :goto_0

    .line 755
    :cond_0
    const/4 v2, 0x0

    .line 753
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/camera/core/impl/utils/RedirectableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 757
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    monitor-exit v0

    return-object v1

    .line 760
    :cond_2
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-eqz v1, :cond_3

    .line 761
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    monitor-exit v0

    return-object v1

    .line 764
    :cond_3
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getTorchControl()Landroidx/camera/camera2/internal/TorchControl;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/TorchControl;->getTorchStrengthLevel()Landroidx/lifecycle/LiveData;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 765
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getZoomState()Landroidx/lifecycle/LiveData;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/camera/core/ZoomState;",
            ">;"
        }
    .end annotation

    .line 354
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 355
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    if-nez v1, :cond_1

    .line 356
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-nez v1, :cond_0

    .line 357
    new-instance v1, Landroidx/camera/core/impl/utils/RedirectableLiveData;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 358
    invoke-static {v2}, Landroidx/camera/camera2/internal/ZoomControl;->getDefaultZoomState(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/core/ZoomState;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/camera/core/impl/utils/RedirectableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    .line 360
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    monitor-exit v0

    return-object v1

    .line 364
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-eqz v1, :cond_2

    .line 365
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    monitor-exit v0

    return-object v1

    .line 368
    :cond_2
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getZoomControl()Landroidx/camera/camera2/internal/ZoomControl;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/ZoomControl;->getZoomState()Landroidx/lifecycle/LiveData;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 369
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public hasFlashUnit()Z
    .locals 2

    .line 304
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V

    invoke-static {v1}, Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;->isFlashAvailable(Landroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;)Z

    move-result v0

    return v0
.end method

.method public synthetic isCaptureProcessProgressSupported()Z
    .locals 1

    invoke-static {p0}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$isCaptureProcessProgressSupported(Landroidx/camera/core/impl/CameraInfoInternal;)Z

    move-result v0

    return v0
.end method

.method public synthetic isFeatureGroupSupported(Landroidx/camera/core/SessionConfig;)Z
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$isFeatureGroupSupported(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/SessionConfig;)Z

    move-result p1

    return p1
.end method

.method public isFocusMeteringSupported(Landroidx/camera/core/FocusMeteringAction;)Z
    .locals 2
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;

    .line 434
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 435
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    if-nez v1, :cond_0

    .line 436
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    .line 438
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getFocusMeteringControl()Landroidx/camera/camera2/internal/FocusMeteringControl;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->isFocusMeteringSupported(Landroidx/camera/core/FocusMeteringAction;)Z

    move-result v1

    monitor-exit v0

    return v1

    .line 440
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isHighSpeedSupported()Z
    .locals 2

    .line 525
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    const/16 v1, 0x9

    invoke-static {v0, v1}, Landroidx/camera/camera2/internal/ZslUtil;->isCapabilitySupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isLogicalMultiCameraSupported()Z
    .locals 2

    .line 459
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    const/16 v1, 0xb

    invoke-static {v0, v1}, Landroidx/camera/camera2/internal/ZslUtil;->isCapabilitySupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;I)Z

    move-result v0

    return v0
.end method

.method public isLowLightBoostSupported()Z
    .locals 1

    .line 329
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0}, Landroidx/camera/camera2/internal/LowLightBoostControl;->checkLowLightBoostAvailability(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result v0

    return v0
.end method

.method public synthetic isPostviewSupported()Z
    .locals 1

    invoke-static {p0}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$isPostviewSupported(Landroidx/camera/core/impl/CameraInfoInternal;)Z

    move-result v0

    return v0
.end method

.method public isPreviewStabilizationSupported()Z
    .locals 1

    .line 658
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0}, Landroidx/camera/camera2/internal/VideoStabilizationUtil;->isPreviewStabilizationSupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result v0

    return v0
.end method

.method public isPrivateReprocessingSupported()Z
    .locals 2

    .line 453
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroidx/camera/camera2/internal/ZslUtil;->isCapabilitySupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;I)Z

    move-result v0

    return v0
.end method

.method public synthetic isResolvedFeatureGroupSupported(Landroidx/camera/core/featuregroup/impl/ResolvedFeatureGroup;Landroidx/camera/core/SessionConfig;)Z
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$isResolvedFeatureGroupSupported(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/featuregroup/impl/ResolvedFeatureGroup;Landroidx/camera/core/SessionConfig;)Z

    move-result p1

    return p1
.end method

.method public isTorchStrengthSupported()Z
    .locals 1

    .line 770
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->isTorchStrengthLevelSupported()Z

    move-result v0

    return v0
.end method

.method public synthetic isUseCaseCombinationSupported(Ljava/util/List;)Z
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$isUseCaseCombinationSupported(Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/List;)Z

    move-result p1

    return p1
.end method

.method public synthetic isUseCaseCombinationSupported(Ljava/util/List;I)Z
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$isUseCaseCombinationSupported(Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/List;I)Z

    move-result p1

    return p1
.end method

.method public synthetic isUseCaseCombinationSupported(Ljava/util/List;IZ)Z
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$isUseCaseCombinationSupported(Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/List;IZ)Z

    move-result p1

    return p1
.end method

.method public isUseCaseCombinationSupported(Ljava/util/List;IZLandroidx/camera/core/impl/CameraConfig;)Z
    .locals 7
    .param p2, "cameraMode"    # I
    .param p3, "isFeatureComboInvocation"    # Z
    .param p4, "cameraConfig"    # Landroidx/camera/core/impl/CameraConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/UseCase;",
            ">;IZ",
            "Landroidx/camera/core/impl/CameraConfig;",
            ")Z"
        }
    .end annotation

    .line 778
    .local p1, "useCases":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    :try_start_0
    sget-object v0, Landroidx/camera/core/internal/StreamSpecsCalculator;->Companion:Landroidx/camera/core/internal/StreamSpecsCalculator$Companion;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mStreamSpecsCalculator:Landroidx/camera/core/internal/StreamSpecsCalculator;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    move-object v3, p0

    move-object v4, p1

    move v2, p2

    move v6, p3

    move-object v5, p4

    .end local p1    # "useCases":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .end local p2    # "cameraMode":I
    .end local p3    # "isFeatureComboInvocation":Z
    .end local p4    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .local v2, "cameraMode":I
    .local v4, "useCases":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .local v5, "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .local v6, "isFeatureComboInvocation":Z
    :try_start_1
    invoke-virtual/range {v0 .. v6}, Landroidx/camera/core/internal/StreamSpecsCalculator$Companion;->calculateSuggestedStreamSpecsCompat(Landroidx/camera/core/internal/StreamSpecsCalculator;ILandroidx/camera/core/impl/CameraInfoInternal;Ljava/util/List;Landroidx/camera/core/impl/CameraConfig;Z)Landroidx/camera/core/internal/StreamSpecQueryResult;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 789
    nop

    .line 791
    const/4 p1, 0x1

    return p1

    .line 786
    :catch_0
    move-exception v0

    move-object p1, v0

    goto :goto_0

    .end local v2    # "cameraMode":I
    .end local v4    # "useCases":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .end local v5    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .end local v6    # "isFeatureComboInvocation":Z
    .restart local p1    # "useCases":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .restart local p2    # "cameraMode":I
    .restart local p3    # "isFeatureComboInvocation":Z
    .restart local p4    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    :catch_1
    move-exception v0

    move-object v4, p1

    move v2, p2

    move v6, p3

    move-object v5, p4

    move-object p1, v0

    .line 787
    .end local p2    # "cameraMode":I
    .end local p3    # "isFeatureComboInvocation":Z
    .end local p4    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .restart local v2    # "cameraMode":I
    .restart local v4    # "useCases":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .restart local v5    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .restart local v6    # "isFeatureComboInvocation":Z
    .local p1, "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    const-string p2, "Camera2CameraInfo"

    const-string p3, "isUseCaseCombinationSupported: calculateSuggestedStreamSpecs failed"

    invoke-static {p2, p3, p1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 788
    const/4 p2, 0x0

    return p2
.end method

.method public isVideoStabilizationSupported()Z
    .locals 6

    .line 643
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 644
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 646
    .local v0, "availableVideoStabilizationModes":[I
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 647
    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v0, v3

    .line 648
    .local v4, "mode":I
    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 649
    return v5

    .line 647
    .end local v4    # "mode":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 653
    :cond_1
    return v1
.end method

.method public isZslSupported()Z
    .locals 1

    .line 447
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->isPrivateReprocessingSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/ZslDisablerQuirk;

    .line 448
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 447
    :goto_0
    return v0
.end method

.method linkWithCameraControl(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;)V
    .locals 6
    .param p1, "camera2CameraControlImpl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 174
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 175
    :try_start_0
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 177
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-eqz v1, :cond_0

    .line 178
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectZoomStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 179
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getZoomControl()Landroidx/camera/camera2/internal/ZoomControl;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/ZoomControl;->getZoomState()Landroidx/lifecycle/LiveData;

    move-result-object v2

    .line 178
    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/utils/RedirectableLiveData;->redirectTo(Landroidx/lifecycle/LiveData;)V

    .line 182
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-eqz v1, :cond_1

    .line 183
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 184
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getTorchControl()Landroidx/camera/camera2/internal/TorchControl;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/TorchControl;->getTorchState()Landroidx/lifecycle/LiveData;

    move-result-object v2

    .line 183
    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/utils/RedirectableLiveData;->redirectTo(Landroidx/lifecycle/LiveData;)V

    .line 187
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-eqz v1, :cond_2

    .line 188
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectTorchStrengthLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 189
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getTorchControl()Landroidx/camera/camera2/internal/TorchControl;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/TorchControl;->getTorchStrengthLevel()Landroidx/lifecycle/LiveData;

    move-result-object v2

    .line 188
    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/utils/RedirectableLiveData;->redirectTo(Landroidx/lifecycle/LiveData;)V

    .line 192
    :cond_2
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    if-eqz v1, :cond_3

    .line 193
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mRedirectLowLightBoostStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 194
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getLowLightBoostControl()Landroidx/camera/camera2/internal/LowLightBoostControl;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/LowLightBoostControl;->getLowLightBoostState()Landroidx/lifecycle/LiveData;

    move-result-object v2

    .line 193
    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/utils/RedirectableLiveData;->redirectTo(Landroidx/lifecycle/LiveData;)V

    .line 197
    :cond_3
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    if-eqz v1, :cond_5

    .line 199
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 200
    .local v2, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Landroidx/camera/core/impl/CameraCaptureCallback;Ljava/util/concurrent/Executor;>;"
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-object v4, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/util/concurrent/Executor;

    iget-object v5, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Landroidx/camera/core/impl/CameraCaptureCallback;

    invoke-virtual {v3, v4, v5}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->addSessionCameraCaptureCallback(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 202
    .end local v2    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Landroidx/camera/core/impl/CameraCaptureCallback;Ljava/util/concurrent/Executor;>;"
    goto :goto_0

    .line 203
    :cond_4
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    .line 205
    :cond_5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->logDeviceInfo()V

    .line 207
    return-void

    .line 205
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public querySupportedDynamicRanges(Ljava/util/Set;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;)",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 582
    .local p1, "candidateDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    nop

    .line 583
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v0

    .line 582
    invoke-static {p1, v0}, Landroidx/camera/core/impl/DynamicRanges;->findAllPossibleMatches(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public removeSessionCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 4
    .param p1, "callback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 604
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 605
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    if-nez v1, :cond_3

    .line 606
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    if-nez v1, :cond_0

    .line 607
    monitor-exit v0

    return-void

    .line 609
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraCaptureCallbacks:Ljava/util/List;

    .line 610
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 611
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/util/Pair<Landroidx/camera/core/impl/CameraCaptureCallback;Ljava/util/concurrent/Executor;>;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 612
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 613
    .local v2, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Landroidx/camera/core/impl/CameraCaptureCallback;Ljava/util/concurrent/Executor;>;"
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-ne v3, p1, :cond_1

    .line 614
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 616
    .end local v2    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Landroidx/camera/core/impl/CameraCaptureCallback;Ljava/util/concurrent/Executor;>;"
    :cond_1
    goto :goto_0

    .line 617
    :cond_2
    monitor-exit v0

    return-void

    .line 619
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/util/Pair<Landroidx/camera/core/impl/CameraCaptureCallback;Ljava/util/concurrent/Executor;>;>;"
    :cond_3
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->removeSessionCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 620
    monitor-exit v0

    .line 621
    return-void

    .line 620
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setCameraStateSource(Landroidx/lifecycle/LiveData;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/camera/core/CameraState;",
            ">;)V"
        }
    .end annotation

    .line 214
    .local p1, "cameraStateSource":Landroidx/lifecycle/LiveData;, "Landroidx/lifecycle/LiveData<Landroidx/camera/core/CameraState;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->mCameraStateLiveData:Landroidx/camera/core/impl/utils/RedirectableLiveData;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/utils/RedirectableLiveData;->redirectTo(Landroidx/lifecycle/LiveData;)V

    .line 215
    return-void
.end method

.method public synthetic setCameraUseCaseAdapterProvider(Landroidx/camera/core/CameraUseCaseAdapterProvider;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraInfoInternal$-CC;->$default$setCameraUseCaseAdapterProvider(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/CameraUseCaseAdapterProvider;)V

    return-void
.end method
