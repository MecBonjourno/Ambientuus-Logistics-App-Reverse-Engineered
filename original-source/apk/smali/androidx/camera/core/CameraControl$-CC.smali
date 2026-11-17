.class public final synthetic Landroidx/camera/core/CameraControl$-CC;
.super Ljava/lang/Object;
.source "CameraControl.java"


# direct methods
.method public static $default$enableLowLightBoostAsync(Landroidx/camera/core/CameraControl;Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/CameraControl;
    .param p1, "lowLightBoost"    # Z

    .line 119
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Not supported!"

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public static $default$setTorchStrengthLevel(Landroidx/camera/core/CameraControl;I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/CameraControl;
    .param p1, "torchStrengthLevel"    # I

    .line 259
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Setting torch strength is not supported on the device."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
