.class final Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;
.super Ljava/lang/Object;
.source "InputConfigurationCompat.java"

# interfaces
.implements Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "InputConfigurationCompatBaseImpl"
.end annotation


# instance fields
.field private final mFormat:I

.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method constructor <init>(III)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "format"    # I

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 204
    iput p1, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mWidth:I

    .line 205
    iput p2, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mHeight:I

    .line 206
    iput p3, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mFormat:I

    .line 207
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 236
    instance-of v0, p1, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 237
    return v1

    .line 240
    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;

    .line 243
    .local v0, "otherInputConfig":Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->getWidth()I

    move-result v2

    iget v3, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mWidth:I

    if-ne v2, v3, :cond_1

    .line 244
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->getHeight()I

    move-result v2

    iget v3, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mHeight:I

    if-ne v2, v3, :cond_1

    .line 245
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->getFormat()I

    move-result v2

    iget v3, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mFormat:I

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 243
    :goto_0
    return v1
.end method

.method public getFormat()I
    .locals 1

    .line 221
    iget v0, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mFormat:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 216
    iget v0, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mHeight:I

    return v0
.end method

.method public getInputConfiguration()Ljava/lang/Object;
    .locals 1

    .line 231
    const/4 v0, 0x0

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 211
    iget v0, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mWidth:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 250
    const/4 v0, 0x1

    .line 252
    .local v0, "h":I
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mWidth:I

    xor-int v0, v1, v2

    .line 253
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mHeight:I

    xor-int v0, v1, v2

    .line 254
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mFormat:I

    xor-int v0, v1, v2

    .line 256
    return v0
.end method

.method public isMultiResolution()Z
    .locals 1

    .line 226
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 262
    iget v0, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mWidth:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mHeight:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatBaseImpl;->mFormat:I

    .line 263
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 262
    const-string v0, "InputConfiguration(w:%d, h:%d, format:%d)"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
