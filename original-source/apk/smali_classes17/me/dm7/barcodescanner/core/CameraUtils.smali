.class public Lme/dm7/barcodescanner/core/CameraUtils;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCameraInstance()Landroid/hardware/Camera;
    .locals 1

    .line 10
    const/4 v0, -0x1

    invoke-static {v0}, Lme/dm7/barcodescanner/core/CameraUtils;->getCameraInstance(I)Landroid/hardware/Camera;

    move-result-object v0

    return-object v0
.end method

.method public static getCameraInstance(I)Landroid/hardware/Camera;
    .locals 2
    .param p0, "cameraId"    # I

    .line 15
    const/4 v0, 0x0

    .line 17
    .local v0, "c":Landroid/hardware/Camera;
    const/4 v1, -0x1

    if-ne p0, v1, :cond_0

    .line 18
    :try_start_0
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v1

    move-object v0, v1

    .end local v0    # "c":Landroid/hardware/Camera;
    .local v1, "c":Landroid/hardware/Camera;
    goto :goto_0

    .line 20
    .end local v1    # "c":Landroid/hardware/Camera;
    .restart local v0    # "c":Landroid/hardware/Camera;
    :cond_0
    invoke-static {p0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 25
    :goto_0
    goto :goto_1

    .line 23
    :catch_0
    move-exception v1

    .line 26
    :goto_1
    return-object v0
.end method

.method public static isFlashSupported(Landroid/hardware/Camera;)Z
    .locals 6
    .param p0, "camera"    # Landroid/hardware/Camera;

    .line 31
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    .line 32
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 34
    .local v1, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 35
    return v0

    .line 38
    :cond_0
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v2

    .line 39
    .local v2, "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v5, "off"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 42
    .end local v1    # "parameters":Landroid/hardware/Camera$Parameters;
    .end local v2    # "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    nop

    .line 46
    return v4

    .line 40
    .restart local v1    # "parameters":Landroid/hardware/Camera$Parameters;
    .restart local v2    # "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    :goto_0
    return v0

    .line 43
    .end local v1    # "parameters":Landroid/hardware/Camera$Parameters;
    .end local v2    # "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    return v0
.end method
