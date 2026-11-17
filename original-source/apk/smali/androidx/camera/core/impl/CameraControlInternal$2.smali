.class Landroidx/camera/core/impl/CameraControlInternal$2;
.super Ljava/lang/Object;
.source "CameraControlInternal.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraControlInternal;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/CameraControlInternal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addInteropConfig(Landroidx/camera/core/impl/Config;)V
    .locals 0
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 278
    return-void
.end method

.method public addZslConfig(Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 0
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 225
    return-void
.end method

.method public cancelFocusAndMetering()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 263
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public clearInteropConfig()V
    .locals 0

    .line 282
    return-void
.end method

.method public clearZslConfig()V
    .locals 0

    .line 230
    return-void
.end method

.method public synthetic decrementVideoUsage()V
    .locals 0

    invoke-static {p0}, Landroidx/camera/core/impl/CameraControlInternal$-CC;->$default$decrementVideoUsage(Landroidx/camera/core/impl/CameraControlInternal;)V

    return-void
.end method

.method public synthetic enableLowLightBoostAsync(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/CameraControl$-CC;->$default$enableLowLightBoostAsync(Landroidx/camera/core/CameraControl;Z)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    return-object p1
.end method

.method public enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "torch"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 234
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public synthetic getCameraCapturePipelineAsync(II)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/camera/core/impl/CameraControlInternal$-CC;->$default$getCameraCapturePipelineAsync(Landroidx/camera/core/impl/CameraControlInternal;II)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    return-object p1
.end method

.method public getFlashMode()I
    .locals 1

    .line 207
    const/4 v0, 0x2

    return v0
.end method

.method public synthetic getImplementation()Landroidx/camera/core/impl/CameraControlInternal;
    .locals 1

    invoke-static {p0}, Landroidx/camera/core/impl/CameraControlInternal$-CC;->$default$getImplementation(Landroidx/camera/core/impl/CameraControlInternal;)Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v0

    return-object v0
.end method

.method public getInteropConfig()Landroidx/camera/core/impl/Config;
    .locals 1

    .line 286
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSessionConfig()Landroidx/camera/core/impl/SessionConfig;
    .locals 1

    .line 252
    invoke-static {}, Landroidx/camera/core/impl/SessionConfig;->defaultEmptySessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    return-object v0
.end method

.method public synthetic incrementVideoUsage()V
    .locals 0

    invoke-static {p0}, Landroidx/camera/core/impl/CameraControlInternal$-CC;->$default$incrementVideoUsage(Landroidx/camera/core/impl/CameraControlInternal;)V

    return-void
.end method

.method public synthetic isInVideoUsage()Z
    .locals 1

    invoke-static {p0}, Landroidx/camera/core/impl/CameraControlInternal$-CC;->$default$isInVideoUsage(Landroidx/camera/core/impl/CameraControlInternal;)Z

    move-result v0

    return v0
.end method

.method public isZslDisabledByByUserCaseConfig()Z
    .locals 1

    .line 220
    const/4 v0, 0x0

    return v0
.end method

.method public setExposureCompensationIndex(I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "exposure"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 239
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setFlashMode(I)V
    .locals 0
    .param p1, "flashMode"    # I

    .line 212
    return-void
.end method

.method public setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "linearZoom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 273
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public synthetic setLowLightBoostDisabledByUseCaseSessionConfig(Z)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraControlInternal$-CC;->$default$setLowLightBoostDisabledByUseCaseSessionConfig(Landroidx/camera/core/impl/CameraControlInternal;Z)V

    return-void
.end method

.method public synthetic setScreenFlash(Landroidx/camera/core/ImageCapture$ScreenFlash;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/CameraControlInternal$-CC;->$default$setScreenFlash(Landroidx/camera/core/impl/CameraControlInternal;Landroidx/camera/core/ImageCapture$ScreenFlash;)V

    return-void
.end method

.method public synthetic setTorchStrengthLevel(I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/CameraControl$-CC;->$default$setTorchStrengthLevel(Landroidx/camera/core/CameraControl;I)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    return-object p1
.end method

.method public setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "ratio"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 268
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setZslDisabledByUserCaseConfig(Z)V
    .locals 0
    .param p1, "disabled"    # Z

    .line 216
    return-void
.end method

.method public startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/FocusMeteringAction;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/core/FocusMeteringResult;",
            ">;"
        }
    .end annotation

    .line 258
    invoke-static {}, Landroidx/camera/core/FocusMeteringResult;->emptyInstance()Landroidx/camera/core/FocusMeteringResult;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public submitStillCaptureRequests(Ljava/util/List;II)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p2, "captureMode"    # I
    .param p3, "flashType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;II)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 247
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
