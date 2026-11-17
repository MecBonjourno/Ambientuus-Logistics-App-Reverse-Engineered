.class public Landroidx/camera/video/internal/compat/quirk/ExtraSupportedQualityQuirk;
.super Ljava/lang/Object;
.source "ExtraSupportedQualityQuirk.java"

# interfaces
.implements Landroidx/camera/core/impl/Quirk;


# static fields
.field private static final MOTO_C_FRONT_CAM_ID:Ljava/lang/String; = "1"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getExtraEncoderProfilesForMotoC(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)Ljava/util/Map;
    .locals 10
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p2, "encoderProfilesProvider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;
    .param p3, "videoEncoderInfoFinder"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Landroidx/camera/core/impl/EncoderProfilesProvider;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy;",
            ">;"
        }
    .end annotation

    .line 88
    const-string v0, "1"

    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 89
    const/4 v0, 0x4

    invoke-interface {p2, v0}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 94
    :cond_0
    const/4 v2, 0x1

    invoke-interface {p2, v2}, Landroidx/camera/core/impl/EncoderProfilesProvider;->getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v3

    .line 95
    .local v3, "profilesHigh":Landroidx/camera/core/impl/EncoderProfilesProxy;
    nop

    .line 96
    invoke-static {v3}, Landroidx/camera/video/internal/utils/EncoderProfilesUtil;->getFirstVideoProfile(Landroidx/camera/core/impl/EncoderProfilesProxy;)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object v4

    .line 97
    .local v4, "videoProfileHigh":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    if-nez v4, :cond_1

    .line 98
    return-object v1

    .line 100
    :cond_1
    nop

    .line 101
    invoke-static {v4, p3}, Landroidx/camera/video/internal/compat/quirk/ExtraSupportedQualityQuirk;->getSupportedBitrateRange(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)Landroid/util/Range;

    move-result-object v1

    .line 102
    .local v1, "supportedBitrateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v5, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_480P:Landroid/util/Size;

    .line 103
    invoke-static {v4, v5, v1}, Landroidx/camera/video/internal/utils/EncoderProfilesUtil;->deriveVideoProfile(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroid/util/Size;Landroid/util/Range;)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object v5

    .line 104
    .local v5, "derivedVideoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    nop

    .line 106
    invoke-interface {v3}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getDefaultDurationSeconds()I

    move-result v6

    .line 107
    invoke-interface {v3}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getRecommendedFileFormat()I

    move-result v7

    .line 108
    invoke-interface {v3}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getAudioProfiles()Ljava/util/List;

    move-result-object v8

    .line 109
    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    .line 105
    invoke-static {v6, v7, v8, v9}, Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;->create(IILjava/util/List;Ljava/util/List;)Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;

    move-result-object v6

    .line 112
    .local v6, "profiles480p":Landroidx/camera/core/impl/EncoderProfilesProxy;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 113
    .local v7, "extraEncoderProfilesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/EncoderProfilesProxy;>;"
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v7, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    invoke-virtual {v4}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getResolution()Landroid/util/Size;

    move-result-object v0

    .line 116
    .local v0, "sizeHigh":Landroid/util/Size;
    sget-object v8, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_480P:Landroid/util/Size;

    invoke-static {v8}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v8

    invoke-static {v0}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v9

    if-le v8, v9, :cond_2

    .line 117
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v7, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    :cond_2
    return-object v7

    .line 90
    .end local v0    # "sizeHigh":Landroid/util/Size;
    .end local v1    # "supportedBitrateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v3    # "profilesHigh":Landroidx/camera/core/impl/EncoderProfilesProxy;
    .end local v4    # "videoProfileHigh":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .end local v5    # "derivedVideoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .end local v6    # "profiles480p":Landroidx/camera/core/impl/EncoderProfilesProxy;
    .end local v7    # "extraEncoderProfilesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/EncoderProfilesProxy;>;"
    :cond_3
    :goto_0
    return-object v1
.end method

.method private static getSupportedBitrateRange(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)Landroid/util/Range;
    .locals 2
    .param p0, "videoProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .param p1, "videoEncoderInfoFinder"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;",
            ")",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 125
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;->find(Ljava/lang/String;)Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    move-result-object v0

    .line 126
    .local v0, "encoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedBitrateRange()Landroid/util/Range;

    move-result-object v1

    goto :goto_0

    .line 127
    :cond_0
    sget-object v1, Landroidx/camera/video/VideoSpec;->BITRATE_RANGE_AUTO:Landroid/util/Range;

    .line 126
    :goto_0
    return-object v1
.end method

.method private static isMotoC()Z
    .locals 2

    .line 66
    const-string v0, "motorola"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "moto c"

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static load()Z
    .locals 1

    .line 62
    invoke-static {}, Landroidx/camera/video/internal/compat/quirk/ExtraSupportedQualityQuirk;->isMotoC()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getExtraEncoderProfiles(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)Ljava/util/Map;
    .locals 1
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p2, "encoderProfilesProvider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;
    .param p3, "videoEncoderInfoFinder"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Landroidx/camera/core/impl/EncoderProfilesProvider;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy;",
            ">;"
        }
    .end annotation

    .line 74
    invoke-static {}, Landroidx/camera/video/internal/compat/quirk/ExtraSupportedQualityQuirk;->isMotoC()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/video/internal/compat/quirk/ExtraSupportedQualityQuirk;->getExtraEncoderProfilesForMotoC(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 78
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
