.class public final Landroidx/camera/camera2/internal/VideoStabilizationUtil;
.super Ljava/lang/Object;
.source "VideoStabilizationUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static isPreviewStabilizationSupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 6
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 40
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 41
    return v2

    .line 43
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 45
    .local v0, "availableVideoStabilizationModes":[I
    if-eqz v0, :cond_4

    array-length v1, v0

    if-nez v1, :cond_1

    goto :goto_1

    .line 49
    :cond_1
    array-length v1, v0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_3

    aget v4, v0, v3

    .line 50
    .local v4, "mode":I
    const/4 v5, 0x2

    if-ne v4, v5, :cond_2

    .line 51
    const/4 v1, 0x1

    return v1

    .line 49
    .end local v4    # "mode":I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 54
    :cond_3
    return v2

    .line 47
    :cond_4
    :goto_1
    return v2
.end method
