.class public final synthetic Landroidx/camera/video/VideoCapabilities$-CC;
.super Ljava/lang/Object;
.source "VideoCapabilities.java"


# direct methods
.method public static $default$findNearestHigherSupportedEncoderProfilesFor(Landroidx/camera/video/VideoCapabilities;Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/video/VideoCapabilities;
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 170
    const/4 v0, 0x0

    return-object v0
.end method

.method public static $default$findNearestHigherSupportedQualityFor(Landroidx/camera/video/VideoCapabilities;Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/Quality;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/video/VideoCapabilities;
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 190
    sget-object v0, Landroidx/camera/video/Quality;->NONE:Landroidx/camera/video/Quality;

    return-object v0
.end method

.method public static $default$getProfiles(Landroidx/camera/video/VideoCapabilities;Landroidx/camera/video/Quality;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/video/VideoCapabilities;
    .param p1, "quality"    # Landroidx/camera/video/Quality;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 150
    const/4 v0, 0x0

    return-object v0
.end method

.method public static $default$isStabilizationSupported(Landroidx/camera/video/VideoCapabilities;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/video/VideoCapabilities;

    .line 133
    const/4 v0, 0x0

    return v0
.end method
