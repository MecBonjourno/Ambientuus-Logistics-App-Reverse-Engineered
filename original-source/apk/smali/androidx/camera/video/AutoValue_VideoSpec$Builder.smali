.class final Landroidx/camera/video/AutoValue_VideoSpec$Builder;
.super Landroidx/camera/video/VideoSpec$Builder;
.source "AutoValue_VideoSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/AutoValue_VideoSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private aspectRatio:Ljava/lang/Integer;

.field private bitrate:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private encodeFrameRate:Ljava/lang/Integer;

.field private qualitySelector:Landroidx/camera/video/QualitySelector;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 101
    invoke-direct {p0}, Landroidx/camera/video/VideoSpec$Builder;-><init>()V

    .line 102
    return-void
.end method

.method private constructor <init>(Landroidx/camera/video/VideoSpec;)V
    .locals 1
    .param p1, "source"    # Landroidx/camera/video/VideoSpec;

    .line 103
    invoke-direct {p0}, Landroidx/camera/video/VideoSpec$Builder;-><init>()V

    .line 104
    invoke-virtual {p1}, Landroidx/camera/video/VideoSpec;->getQualitySelector()Landroidx/camera/video/QualitySelector;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->qualitySelector:Landroidx/camera/video/QualitySelector;

    .line 105
    invoke-virtual {p1}, Landroidx/camera/video/VideoSpec;->getEncodeFrameRate()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->encodeFrameRate:Ljava/lang/Integer;

    .line 106
    invoke-virtual {p1}, Landroidx/camera/video/VideoSpec;->getBitrate()Landroid/util/Range;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->bitrate:Landroid/util/Range;

    .line 107
    invoke-virtual {p1}, Landroidx/camera/video/VideoSpec;->getAspectRatio()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->aspectRatio:Ljava/lang/Integer;

    .line 108
    return-void
.end method

.method synthetic constructor <init>(Landroidx/camera/video/VideoSpec;Landroidx/camera/video/AutoValue_VideoSpec$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/camera/video/VideoSpec;
    .param p2, "x1"    # Landroidx/camera/video/AutoValue_VideoSpec$1;

    .line 96
    invoke-direct {p0, p1}, Landroidx/camera/video/AutoValue_VideoSpec$Builder;-><init>(Landroidx/camera/video/VideoSpec;)V

    return-void
.end method


# virtual methods
.method public build()Landroidx/camera/video/VideoSpec;
    .locals 8

    .line 137
    const-string v0, ""

    .line 138
    .local v0, "missing":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->qualitySelector:Landroidx/camera/video/QualitySelector;

    if-nez v1, :cond_0

    .line 139
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " qualitySelector"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 141
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->encodeFrameRate:Ljava/lang/Integer;

    if-nez v1, :cond_1

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " encodeFrameRate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 144
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->bitrate:Landroid/util/Range;

    if-nez v1, :cond_2

    .line 145
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bitrate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 147
    :cond_2
    iget-object v1, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->aspectRatio:Ljava/lang/Integer;

    if-nez v1, :cond_3

    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " aspectRatio"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 150
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 153
    new-instance v2, Landroidx/camera/video/AutoValue_VideoSpec;

    iget-object v3, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->qualitySelector:Landroidx/camera/video/QualitySelector;

    iget-object v1, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->encodeFrameRate:Ljava/lang/Integer;

    .line 155
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->bitrate:Landroid/util/Range;

    iget-object v1, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->aspectRatio:Ljava/lang/Integer;

    .line 157
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Landroidx/camera/video/AutoValue_VideoSpec;-><init>(Landroidx/camera/video/QualitySelector;ILandroid/util/Range;ILandroidx/camera/video/AutoValue_VideoSpec$1;)V

    .line 153
    return-object v2

    .line 151
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Missing required properties:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method setAspectRatio(I)Landroidx/camera/video/VideoSpec$Builder;
    .locals 1
    .param p1, "aspectRatio"    # I

    .line 132
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->aspectRatio:Ljava/lang/Integer;

    .line 133
    return-object p0
.end method

.method public setBitrate(Landroid/util/Range;)Landroidx/camera/video/VideoSpec$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/video/VideoSpec$Builder;"
        }
    .end annotation

    .line 124
    .local p1, "bitrate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-eqz p1, :cond_0

    .line 127
    iput-object p1, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->bitrate:Landroid/util/Range;

    .line 128
    return-object p0

    .line 125
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null bitrate"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setEncodeFrameRate(I)Landroidx/camera/video/VideoSpec$Builder;
    .locals 1
    .param p1, "encodeFrameRate"    # I

    .line 119
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->encodeFrameRate:Ljava/lang/Integer;

    .line 120
    return-object p0
.end method

.method public setQualitySelector(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/VideoSpec$Builder;
    .locals 2
    .param p1, "qualitySelector"    # Landroidx/camera/video/QualitySelector;

    .line 111
    if-eqz p1, :cond_0

    .line 114
    iput-object p1, p0, Landroidx/camera/video/AutoValue_VideoSpec$Builder;->qualitySelector:Landroidx/camera/video/QualitySelector;

    .line 115
    return-object p0

    .line 112
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null qualitySelector"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
