.class public Landroidx/camera/camera2/internal/FovUtil;
.super Ljava/lang/Object;
.source "FovUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FovUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method public static focalLengthToViewAngleDegrees(FF)I
    .locals 6
    .param p0, "focalLength"    # F
    .param p1, "sensorLength"    # F

    .line 55
    const/4 v0, 0x0

    cmpl-float v1, p0, v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    const-string v4, "Focal length should be positive."

    invoke-static {v1, v4}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 56
    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    const-string v0, "Sensor length should be positive."

    invoke-static {v2, v0}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 58
    const/high16 v0, 0x40000000    # 2.0f

    mul-float/2addr v0, p0

    div-float v0, p1, v0

    float-to-double v0, v0

    .line 59
    invoke-static {v0, v1}, Ljava/lang/Math;->atan(D)D

    move-result-wide v0

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v0, v4

    .line 58
    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-int v0, v0

    .line 60
    .local v0, "viewAngleDegrees":I
    const/16 v1, 0x168

    const-string v2, "The provided focal length and sensor length result in an invalid view angle degrees."

    invoke-static {v0, v3, v1, v2}, Landroidx/core/util/Preconditions;->checkArgumentInRange(IIILjava/lang/String;)I

    .line 63
    return v0
.end method

.method public static getDefaultFocalLength(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)F
    .locals 2
    .param p0, "cameraCharacteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 141
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_FOCAL_LENGTHS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 142
    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    .line 143
    .local v0, "focalLengths":[F
    const-string v1, "The focal lengths can not be empty."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    const/4 v1, 0x0

    aget v1, v0, v1

    return v1
.end method

.method public static getDeviceDefaultViewAngleDegrees(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;I)I
    .locals 8
    .param p0, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .param p1, "lensFacing"    # I

    .line 76
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraIdList()[Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "cameraIds":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 78
    .local v3, "cameraId":Ljava/lang/String;
    nop

    .line 79
    invoke-virtual {p0, v3}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v4

    .line 80
    .local v4, "cameraCharacteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 81
    invoke-virtual {v4, v5}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 82
    .local v5, "cameraCharacteristicsLensFacing":Ljava/lang/Integer;
    const-string v6, "Lens facing can not be null"

    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {p1}, Landroidx/camera/camera2/internal/LensFacingUtil;->getLensFacingInt(I)I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 86
    nop

    .line 87
    invoke-static {v4}, Landroidx/camera/camera2/internal/FovUtil;->getDefaultFocalLength(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)F

    move-result v1

    .line 88
    invoke-static {v4}, Landroidx/camera/camera2/internal/FovUtil;->getSensorHorizontalLength(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)F

    move-result v2

    .line 86
    invoke-static {v1, v2}, Landroidx/camera/camera2/internal/FovUtil;->focalLengthToViewAngleDegrees(FF)I

    move-result v1
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 77
    .end local v3    # "cameraId":Ljava/lang/String;
    .end local v4    # "cameraCharacteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .end local v5    # "cameraCharacteristicsLensFacing":Ljava/lang/Integer;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 93
    .end local v0    # "cameraIds":[Ljava/lang/String;
    :cond_1
    nop

    .line 95
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unable to get the default focal length with the specified lens facing."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unable to get the default focal length."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getSensorHorizontalLength(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)F
    .locals 7
    .param p0, "cameraCharacteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 107
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PHYSICAL_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 108
    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SizeF;

    .line 110
    .local v0, "sensorSize":Landroid/util/SizeF;
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 111
    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    .line 112
    .local v1, "activeArrayRect":Landroid/graphics/Rect;
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PIXEL_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 114
    .local v2, "pixelArraySize":Landroid/util/Size;
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 115
    invoke-virtual {p0, v3}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 116
    .local v3, "sensorOrientation":Ljava/lang/Integer;
    const-string v4, "The sensor size can\'t be null."

    invoke-static {v0, v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    const-string v4, "The sensor orientation can\'t be null."

    invoke-static {v3, v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    const-string v4, "The active array size can\'t be null."

    invoke-static {v1, v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const-string v4, "The pixel array size can\'t be null."

    invoke-static {v2, v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    invoke-static {v1}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v4

    .line 123
    .local v4, "activeArraySize":Landroid/util/Size;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v5}, Landroidx/camera/core/impl/utils/TransformUtils;->is90or270(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 124
    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->reverseSizeF(Landroid/util/SizeF;)Landroid/util/SizeF;

    move-result-object v0

    .line 125
    invoke-static {v4}, Landroidx/camera/core/impl/utils/TransformUtils;->reverseSize(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v4

    .line 126
    invoke-static {v2}, Landroidx/camera/core/impl/utils/TransformUtils;->reverseSize(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v2

    .line 129
    :cond_0
    invoke-virtual {v0}, Landroid/util/SizeF;->getWidth()F

    move-result v5

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    return v5
.end method
