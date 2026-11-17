.class public final synthetic Landroidx/camera/core/CameraProvider$-CC;
.super Ljava/lang/Object;
.source "CameraProvider.kt"


# direct methods
.method public static $default$getCameraInfo(Landroidx/camera/core/CameraProvider;Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/CameraProvider;
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 0
    const-string v0, "cameraSelector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "The camera provider is not implemented properly."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic getConfigImplType$annotations()V
    .locals 0

    .line 0
    return-void
.end method
