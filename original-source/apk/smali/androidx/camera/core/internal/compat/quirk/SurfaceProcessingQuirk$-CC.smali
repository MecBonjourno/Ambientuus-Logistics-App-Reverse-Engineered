.class public final synthetic Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk$-CC;
.super Ljava/lang/Object;
.source "SurfaceProcessingQuirk.java"


# direct methods
.method public static $default$workaroundBySurfaceProcessing(Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;

    .line 37
    const/4 v0, 0x1

    return v0
.end method

.method public static workaroundBySurfaceProcessing(Landroidx/camera/core/impl/Quirks;)Z
    .locals 3
    .param p0, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 45
    const-class v0, Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/Quirks;->getAll(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;

    .line 46
    .local v1, "quirk":Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;
    invoke-interface {v1}, Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;->workaroundBySurfaceProcessing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    const/4 v0, 0x1

    return v0

    .line 49
    .end local v1    # "quirk":Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;
    :cond_0
    goto :goto_0

    .line 50
    :cond_1
    const/4 v0, 0x0

    return v0
.end method
