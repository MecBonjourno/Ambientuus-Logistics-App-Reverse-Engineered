.class public final synthetic Landroidx/camera/camera2/internal/compat/quirk/CaptureIntentPreviewQuirk$-CC;
.super Ljava/lang/Object;
.source "CaptureIntentPreviewQuirk.java"


# direct methods
.method public static $default$workaroundByCaptureIntentPreview(Landroidx/camera/camera2/internal/compat/quirk/CaptureIntentPreviewQuirk;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/camera2/internal/compat/quirk/CaptureIntentPreviewQuirk;

    .line 40
    const/4 v0, 0x1

    return v0
.end method

.method public static workaroundByCaptureIntentPreview(Landroidx/camera/core/impl/Quirks;)Z
    .locals 3
    .param p0, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 48
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/CaptureIntentPreviewQuirk;

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

    check-cast v1, Landroidx/camera/camera2/internal/compat/quirk/CaptureIntentPreviewQuirk;

    .line 49
    .local v1, "quirk":Landroidx/camera/camera2/internal/compat/quirk/CaptureIntentPreviewQuirk;
    invoke-interface {v1}, Landroidx/camera/camera2/internal/compat/quirk/CaptureIntentPreviewQuirk;->workaroundByCaptureIntentPreview()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 50
    const/4 v0, 0x1

    return v0

    .line 52
    .end local v1    # "quirk":Landroidx/camera/camera2/internal/compat/quirk/CaptureIntentPreviewQuirk;
    :cond_0
    goto :goto_0

    .line 53
    :cond_1
    const/4 v0, 0x0

    return v0
.end method
