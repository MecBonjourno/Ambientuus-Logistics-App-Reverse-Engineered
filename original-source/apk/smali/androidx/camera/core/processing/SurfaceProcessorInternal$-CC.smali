.class public final synthetic Landroidx/camera/core/processing/SurfaceProcessorInternal$-CC;
.super Ljava/lang/Object;
.source "SurfaceProcessorInternal.java"


# direct methods
.method public static $default$snapshot(Landroidx/camera/core/processing/SurfaceProcessorInternal;II)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/processing/SurfaceProcessorInternal;
    .param p1, "jpegQuality"    # I
    .param p2, "rotationDegrees"    # I

    .line 54
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
