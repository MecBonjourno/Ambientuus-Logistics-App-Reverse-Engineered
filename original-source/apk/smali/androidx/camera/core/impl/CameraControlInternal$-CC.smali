.class public final synthetic Landroidx/camera/core/impl/CameraControlInternal$-CC;
.super Ljava/lang/Object;
.source "CameraControlInternal.java"


# direct methods
.method public static $default$decrementVideoUsage(Landroidx/camera/core/impl/CameraControlInternal;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraControlInternal;

    .line 195
    return-void
.end method

.method public static $default$getCameraCapturePipelineAsync(Landroidx/camera/core/impl/CameraControlInternal;II)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraControlInternal;
    .param p1, "captureMode"    # I
    .param p2, "flashType"    # I

    .line 143
    new-instance v0, Landroidx/camera/core/impl/CameraControlInternal$1;

    invoke-direct {v0, p0}, Landroidx/camera/core/impl/CameraControlInternal$1;-><init>(Landroidx/camera/core/impl/CameraControlInternal;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getImplementation(Landroidx/camera/core/impl/CameraControlInternal;)Landroidx/camera/core/impl/CameraControlInternal;
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraControlInternal;

    .line 188
    return-object p0
.end method

.method public static $default$incrementVideoUsage(Landroidx/camera/core/impl/CameraControlInternal;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraControlInternal;

    .line 192
    return-void
.end method

.method public static $default$isInVideoUsage(Landroidx/camera/core/impl/CameraControlInternal;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraControlInternal;

    .line 200
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$setLowLightBoostDisabledByUseCaseSessionConfig(Landroidx/camera/core/impl/CameraControlInternal;Z)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraControlInternal;
    .param p1, "disabled"    # Z

    .line 117
    return-void
.end method

.method public static $default$setScreenFlash(Landroidx/camera/core/impl/CameraControlInternal;Landroidx/camera/core/ImageCapture$ScreenFlash;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraControlInternal;
    .param p1, "screenFlash"    # Landroidx/camera/core/ImageCapture$ScreenFlash;

    .line 71
    return-void
.end method
