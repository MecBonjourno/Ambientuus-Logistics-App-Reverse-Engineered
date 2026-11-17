.class public final synthetic Landroidx/camera/core/internal/compat/quirk/AeFpsRangeQuirk$-CC;
.super Ljava/lang/Object;
.source "AeFpsRangeQuirk.java"


# direct methods
.method public static $default$getTargetAeFpsRange(Landroidx/camera/core/internal/compat/quirk/AeFpsRangeQuirk;)Landroid/util/Range;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/internal/compat/quirk/AeFpsRangeQuirk;

    .line 36
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    return-object v0
.end method
