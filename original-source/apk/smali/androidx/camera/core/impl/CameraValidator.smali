.class public final Landroidx/camera/core/impl/CameraValidator;
.super Ljava/lang/Object;
.source "CameraValidator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/CameraValidator$Api34Impl;,
        Landroidx/camera/core/impl/CameraValidator$CameraIdListIncorrectException;
    }
.end annotation


# static fields
.field private static final EXTERNAL_LENS_FACING:Landroidx/camera/core/CameraSelector;

.field private static final TAG:Ljava/lang/String; = "CameraValidator"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 44
    new-instance v0, Landroidx/camera/core/CameraSelector$Builder;

    invoke-direct {v0}, Landroidx/camera/core/CameraSelector$Builder;-><init>()V

    .line 45
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroidx/camera/core/CameraSelector$Builder;->requireLensFacing(I)Landroidx/camera/core/CameraSelector$Builder;

    move-result-object v0

    .line 46
    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector$Builder;->build()Landroidx/camera/core/CameraSelector;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/CameraValidator;->EXTERNAL_LENS_FACING:Landroidx/camera/core/CameraSelector;

    .line 44
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public static validateCameras(Landroid/content/Context;Landroidx/camera/core/impl/CameraRepository;Landroidx/camera/core/CameraSelector;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cameraRepository"    # Landroidx/camera/core/impl/CameraRepository;
    .param p2, "availableCamerasSelector"    # Landroidx/camera/core/CameraSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/impl/CameraValidator$CameraIdListIncorrectException;
        }
    .end annotation

    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    const-string v2, "CameraValidator"

    if-lt v0, v1, :cond_0

    .line 68
    invoke-static {p0}, Landroidx/camera/core/impl/CameraValidator$Api34Impl;->getDeviceId(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v0

    .line 72
    .local v0, "availableCameras":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/CameraInternal;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Virtual device with ID: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Landroidx/camera/core/impl/CameraValidator$Api34Impl;->getDeviceId(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " has "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 73
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " cameras. Skipping validation."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 72
    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    return-void

    .line 77
    .end local v0    # "availableCameras":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/CameraInternal;>;"
    :cond_0
    const/4 v0, 0x0

    .line 79
    .local v0, "lensFacing":Ljava/lang/Integer;
    if-eqz p2, :cond_1

    .line 80
    :try_start_0
    invoke-virtual {p2}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v1

    move-object v0, v1

    if-nez v1, :cond_1

    .line 81
    const-string v1, "No lens facing info in the availableCamerasSelector, don\'t verify the camera lens facing."

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    return-void

    .line 85
    :catch_0
    move-exception v1

    .line 86
    .local v1, "e":Ljava/lang/IllegalStateException;
    const-string v3, "Cannot get lens facing from the availableCamerasSelector don\'t verify the camera lens facing."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    return-void

    .line 89
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :cond_1
    nop

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Verifying camera lens facing on "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", lensFacingInteger: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 96
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const/4 v3, 0x0

    .line 97
    .local v3, "exception":Ljava/lang/Throwable;
    const/4 v4, 0x0

    .line 99
    .local v4, "availableCameraCount":I
    :try_start_1
    const-string v5, "android.hardware.camera"

    invoke-virtual {v1, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 100
    if-eqz p2, :cond_2

    .line 101
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_3

    .line 104
    :cond_2
    sget-object v5, Landroidx/camera/core/CameraSelector;->DEFAULT_BACK_CAMERA:Landroidx/camera/core/CameraSelector;

    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/camera/core/CameraSelector;->select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 105
    add-int/lit8 v4, v4, 0x1

    .line 111
    :cond_3
    goto :goto_0

    .line 108
    :catch_1
    move-exception v5

    .line 109
    .local v5, "e":Ljava/lang/IllegalArgumentException;
    const-string v6, "Camera LENS_FACING_BACK verification failed"

    invoke-static {v2, v6, v5}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 110
    move-object v3, v5

    .line 113
    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    :try_start_2
    const-string v5, "android.hardware.camera.front"

    invoke-virtual {v1, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 114
    if-eqz p2, :cond_4

    .line 115
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-nez v5, :cond_5

    .line 118
    :cond_4
    sget-object v5, Landroidx/camera/core/CameraSelector;->DEFAULT_FRONT_CAMERA:Landroidx/camera/core/CameraSelector;

    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/camera/core/CameraSelector;->select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_2

    .line 119
    add-int/lit8 v4, v4, 0x1

    .line 125
    :cond_5
    goto :goto_1

    .line 122
    :catch_2
    move-exception v5

    .line 123
    .restart local v5    # "e":Ljava/lang/IllegalArgumentException;
    const-string v6, "Camera LENS_FACING_FRONT verification failed"

    invoke-static {v2, v6, v5}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 124
    move-object v3, v5

    .line 128
    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    :try_start_3
    sget-object v5, Landroidx/camera/core/impl/CameraValidator;->EXTERNAL_LENS_FACING:Landroidx/camera/core/CameraSelector;

    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/camera/core/CameraSelector;->select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;

    .line 129
    const-string v5, "Found a LENS_FACING_EXTERNAL camera"

    invoke-static {v2, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3

    .line 130
    add-int/lit8 v4, v4, 0x1

    .line 132
    goto :goto_2

    .line 131
    :catch_3
    move-exception v5

    .line 134
    :goto_2
    if-nez v3, :cond_6

    .line 140
    return-void

    .line 135
    :cond_6
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Camera LensFacing verification failed, existing cameras: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 136
    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 135
    invoke-static {v2, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    new-instance v2, Landroidx/camera/core/impl/CameraValidator$CameraIdListIncorrectException;

    const-string v5, "Expected camera missing from device."

    invoke-direct {v2, v5, v4, v3}, Landroidx/camera/core/impl/CameraValidator$CameraIdListIncorrectException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v2
.end method
