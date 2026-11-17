.class public final synthetic Landroidx/camera/core/ImageInfo$-CC;
.super Ljava/lang/Object;
.source "ImageInfo.java"


# direct methods
.method public static $default$getFlashState(Landroidx/camera/core/ImageInfo;)I
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/ImageInfo;

    .line 127
    const/4 v0, 0x0

    return v0
.end method

.method public static $default$getSensorToBufferTransformMatrix(Landroidx/camera/core/ImageInfo;)Landroid/graphics/Matrix;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/ImageInfo;

    .line 119
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    return-object v0
.end method
