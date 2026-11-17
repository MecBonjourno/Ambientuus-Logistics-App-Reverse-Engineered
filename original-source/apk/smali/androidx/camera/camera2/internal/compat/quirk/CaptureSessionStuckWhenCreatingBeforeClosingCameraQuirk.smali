.class public Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionStuckWhenCreatingBeforeClosingCameraQuirk;
.super Ljava/lang/Object;
.source "CaptureSessionStuckWhenCreatingBeforeClosingCameraQuirk.java"

# interfaces
.implements Landroidx/camera/core/impl/Quirk;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static load(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 1
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 41
    invoke-static {p0}, Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionStuckWhenCreatingBeforeClosingCameraQuirk;->shouldLoadForMotoE20(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result v0

    return v0
.end method

.method private static shouldLoadForMotoE20(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 2
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 46
    const-string v0, "motorola"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "moto e20"

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getCameraId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 46
    :goto_0
    return v0
.end method
