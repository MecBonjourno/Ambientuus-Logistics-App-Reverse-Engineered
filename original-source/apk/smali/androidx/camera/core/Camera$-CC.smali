.class public final synthetic Landroidx/camera/core/Camera$-CC;
.super Ljava/lang/Object;
.source "Camera.java"


# direct methods
.method public static varargs $default$isUseCasesCombinationSupported(Landroidx/camera/core/Camera;Z[Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/Camera;
    .param p1, "withStreamSharing"    # Z
    .param p2, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 106
    const/4 v0, 0x1

    return v0
.end method

.method public static varargs $default$isUseCasesCombinationSupported(Landroidx/camera/core/Camera;[Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/Camera;
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 76
    const/4 v0, 0x1

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/Camera;->isUseCasesCombinationSupported(Z[Landroidx/camera/core/UseCase;)Z

    move-result v0

    return v0
.end method

.method public static varargs $default$isUseCasesCombinationSupportedByFramework(Landroidx/camera/core/Camera;[Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/Camera;
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 91
    const/4 v0, 0x0

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/Camera;->isUseCasesCombinationSupported(Z[Landroidx/camera/core/UseCase;)Z

    move-result v0

    return v0
.end method
