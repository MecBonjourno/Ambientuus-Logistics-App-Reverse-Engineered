.class public final synthetic Landroidx/camera/core/impl/CameraInternal$-CC;
.super Ljava/lang/Object;
.source "CameraInternal.java"


# direct methods
.method public static $default$getCameraControl(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/CameraControl;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;

    .line 211
    invoke-interface {p0}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getCameraInfo(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/CameraInfo;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;

    .line 216
    invoke-interface {p0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getExtendedConfig(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/impl/CameraConfig;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;

    .line 249
    invoke-static {}, Landroidx/camera/core/impl/CameraConfigs;->defaultConfig()Landroidx/camera/core/impl/CameraConfig;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getHasTransform(Landroidx/camera/core/impl/CameraInternal;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;

    .line 229
    const/4 v0, 0x1

    return v0
.end method

.method public static $default$isFrontFacing(Landroidx/camera/core/impl/CameraInternal;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;

    .line 149
    invoke-interface {p0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/CameraInfo;->getLensFacing()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static $default$onRemoved(Landroidx/camera/core/impl/CameraInternal;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;

    .line 198
    return-void
.end method

.method public static $default$setActiveResumingMode(Landroidx/camera/core/impl/CameraInternal;Z)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;
    .param p1, "enabled"    # Z

    .line 143
    return-void
.end method

.method public static $default$setExtendedConfig(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraConfig;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;
    .param p1, "cameraConfig"    # Landroidx/camera/core/impl/CameraConfig;

    .line 257
    return-void
.end method

.method public static $default$setPrimary(Landroidx/camera/core/impl/CameraInternal;Z)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/CameraInternal;
    .param p1, "isPrimary"    # Z

    .line 242
    return-void
.end method
