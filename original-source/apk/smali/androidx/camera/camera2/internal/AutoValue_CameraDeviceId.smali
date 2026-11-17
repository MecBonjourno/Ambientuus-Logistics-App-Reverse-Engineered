.class final Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;
.super Landroidx/camera/camera2/internal/CameraDeviceId;
.source "AutoValue_CameraDeviceId.java"


# instance fields
.field private final brand:Ljava/lang/String;

.field private final cameraId:Ljava/lang/String;

.field private final device:Ljava/lang/String;

.field private final model:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "brand"    # Ljava/lang/String;
    .param p2, "device"    # Ljava/lang/String;
    .param p3, "model"    # Ljava/lang/String;
    .param p4, "cameraId"    # Ljava/lang/String;

    .line 22
    invoke-direct {p0}, Landroidx/camera/camera2/internal/CameraDeviceId;-><init>()V

    .line 23
    if-eqz p1, :cond_3

    .line 26
    iput-object p1, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->brand:Ljava/lang/String;

    .line 27
    if-eqz p2, :cond_2

    .line 30
    iput-object p2, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->device:Ljava/lang/String;

    .line 31
    if-eqz p3, :cond_1

    .line 34
    iput-object p3, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->model:Ljava/lang/String;

    .line 35
    if-eqz p4, :cond_0

    .line 38
    iput-object p4, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->cameraId:Ljava/lang/String;

    .line 39
    return-void

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null cameraId"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null model"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null device"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 24
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null brand"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 73
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 74
    return v0

    .line 76
    :cond_0
    instance-of v1, p1, Landroidx/camera/camera2/internal/CameraDeviceId;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 77
    move-object v1, p1

    check-cast v1, Landroidx/camera/camera2/internal/CameraDeviceId;

    .line 78
    .local v1, "that":Landroidx/camera/camera2/internal/CameraDeviceId;
    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->brand:Ljava/lang/String;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CameraDeviceId;->getBrand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->device:Ljava/lang/String;

    .line 79
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CameraDeviceId;->getDevice()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->model:Ljava/lang/String;

    .line 80
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CameraDeviceId;->getModel()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->cameraId:Ljava/lang/String;

    .line 81
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CameraDeviceId;->getCameraId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 78
    :goto_0
    return v0

    .line 83
    .end local v1    # "that":Landroidx/camera/camera2/internal/CameraDeviceId;
    :cond_2
    return v2
.end method

.method public getBrand()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->brand:Ljava/lang/String;

    return-object v0
.end method

.method public getCameraId()Ljava/lang/String;
    .locals 1

    .line 58
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->cameraId:Ljava/lang/String;

    return-object v0
.end method

.method public getDevice()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->device:Ljava/lang/String;

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->model:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 88
    const/4 v0, 0x1

    .line 89
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 90
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->brand:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 91
    mul-int/2addr v0, v1

    .line 92
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->device:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 93
    mul-int/2addr v0, v1

    .line 94
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->model:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 95
    mul-int/2addr v0, v1

    .line 96
    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->cameraId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 97
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CameraDeviceId{brand="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->brand:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", device="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->device:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", model="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->model:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cameraId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_CameraDeviceId;->cameraId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
