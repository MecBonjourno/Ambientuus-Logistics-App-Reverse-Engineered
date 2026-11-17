.class public final synthetic Landroidx/camera/core/CameraInfo$-CC;
.super Ljava/lang/Object;
.source "CameraInfo.java"


# direct methods
.method public static $default$getCameraIdentifier(Landroidx/camera/core/CameraInfo;)Landroidx/camera/core/CameraIdentifier;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 612
    const/4 v0, 0x0

    return-object v0
.end method

.method public static $default$getIntrinsicZoomRatio(Landroidx/camera/core/CameraInfo;)F
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 270
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public static $default$getLensFacing(Landroidx/camera/core/CameraInfo;)I
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 240
    const/4 v0, -0x1

    return v0
.end method

.method public static $default$getLowLightBoostState(Landroidx/camera/core/CameraInfo;)Landroidx/lifecycle/LiveData;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 553
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static $default$getMaxTorchStrengthLevel(Landroidx/camera/core/CameraInfo;)I
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 482
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$getPhysicalCameraInfos(Landroidx/camera/core/CameraInfo;)Ljava/util/Set;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 471
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getSupportedFrameRateRanges(Landroidx/camera/core/CameraInfo;)Ljava/util/Set;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 329
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getSupportedFrameRateRanges(Landroidx/camera/core/CameraInfo;Landroidx/camera/core/SessionConfig;)Ljava/util/Set;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;
    .param p1, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    .line 365
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getTorchStrengthLevel(Landroidx/camera/core/CameraInfo;)Landroidx/lifecycle/LiveData;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 495
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static $default$isFeatureGroupSupported(Landroidx/camera/core/CameraInfo;Landroidx/camera/core/SessionConfig;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;
    .param p1, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    .line 594
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$isFocusMeteringSupported(Landroidx/camera/core/CameraInfo;Landroidx/camera/core/FocusMeteringAction;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;

    .line 288
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$isLogicalMultiCameraSupported(Landroidx/camera/core/CameraInfo;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 379
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$isLowLightBoostSupported(Landroidx/camera/core/CameraInfo;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 535
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$isPrivateReprocessingSupported(Landroidx/camera/core/CameraInfo;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 391
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$isTorchStrengthSupported(Landroidx/camera/core/CameraInfo;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 513
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$isZslSupported(Landroidx/camera/core/CameraInfo;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 305
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$querySupportedDynamicRanges(Landroidx/camera/core/CameraInfo;Ljava/util/Set;)Ljava/util/Set;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/CameraInfo;

    .line 453
    .local p1, "candidateDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    sget-object v0, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    .line 454
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 453
    invoke-static {p1, v0}, Landroidx/camera/core/impl/DynamicRanges;->findAllPossibleMatches(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static mustPlayShutterSound()Z
    .locals 1

    .line 129
    invoke-static {}, Landroidx/camera/core/internal/compat/MediaActionSoundCompat;->mustPlayShutterSound()Z

    move-result v0

    return v0
.end method
