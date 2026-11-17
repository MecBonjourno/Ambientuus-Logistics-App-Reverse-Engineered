.class public final Landroidx/camera/video/internal/config/AudioConfigUtil;
.super Ljava/lang/Object;
.source "AudioConfigUtil.java"


# static fields
.field static final AUDIO_CHANNEL_COUNT_DEFAULT:I = 0x1

.field static final AUDIO_SAMPLE_RATE_DEFAULT:I = 0xac44

.field static final AUDIO_SOURCE_DEFAULT:I = 0x5

.field static final AUDIO_SOURCE_FORMAT_DEFAULT:I = 0x2

.field private static final TAG:Ljava/lang/String; = "AudioConfigUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method static synthetic lambda$selectSampleRateOrNearestSupported$0(ILjava/lang/Integer;Ljava/lang/Integer;)I
    .locals 3
    .param p0, "initialTargetSampleRate"    # I
    .param p1, "x"    # Ljava/lang/Integer;
    .param p2, "y"    # Ljava/lang/Integer;

    .line 228
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 229
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v1, p0

    .line 228
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    sub-int/2addr v0, v1

    .line 232
    .local v0, "relativeDifference":I
    if-nez v0, :cond_0

    .line 233
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    float-to-int v1, v1

    return v1

    .line 236
    :cond_0
    int-to-float v1, v0

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    float-to-int v1, v1

    return v1
.end method

.method public static resolveAudioEncoderConfig(Landroidx/camera/video/internal/config/AudioMimeInfo;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/internal/audio/AudioSettings;Landroidx/camera/video/AudioSpec;)Landroidx/camera/video/internal/encoder/AudioEncoderConfig;
    .locals 13
    .param p0, "audioMimeInfo"    # Landroidx/camera/video/internal/config/AudioMimeInfo;
    .param p1, "inputTimebase"    # Landroidx/camera/core/impl/Timebase;
    .param p2, "audioSettings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p3, "audioSpec"    # Landroidx/camera/video/AudioSpec;

    .line 158
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getCompatibleAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v6

    .line 159
    .local v6, "compatibleAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    if-eqz v6, :cond_0

    .line 160
    new-instance v0, Landroidx/camera/video/internal/config/AudioEncoderConfigAudioProfileResolver;

    .line 161
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getProfile()I

    move-result v2

    move-object v3, p1

    move-object v5, p2

    move-object/from16 v4, p3

    invoke-direct/range {v0 .. v6}, Landroidx/camera/video/internal/config/AudioEncoderConfigAudioProfileResolver;-><init>(Ljava/lang/String;ILandroidx/camera/core/impl/Timebase;Landroidx/camera/video/AudioSpec;Landroidx/camera/video/internal/audio/AudioSettings;Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;)V

    .local v0, "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/AudioEncoderConfig;>;"
    goto :goto_0

    .line 164
    .end local v0    # "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/AudioEncoderConfig;>;"
    :cond_0
    new-instance v7, Landroidx/camera/video/internal/config/AudioEncoderConfigDefaultResolver;

    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v8

    .line 165
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getProfile()I

    move-result v9

    move-object v10, p1

    move-object v12, p2

    move-object/from16 v11, p3

    invoke-direct/range {v7 .. v12}, Landroidx/camera/video/internal/config/AudioEncoderConfigDefaultResolver;-><init>(Ljava/lang/String;ILandroidx/camera/core/impl/Timebase;Landroidx/camera/video/AudioSpec;Landroidx/camera/video/internal/audio/AudioSettings;)V

    move-object v0, v7

    .line 168
    .restart local v0    # "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/AudioEncoderConfig;>;"
    :goto_0
    invoke-interface {v0}, Landroidx/core/util/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/AudioEncoderConfig;

    return-object v1
.end method

.method public static resolveAudioMimeInfo(Landroidx/camera/video/MediaSpec;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;)Landroidx/camera/video/internal/config/AudioMimeInfo;
    .locals 13
    .param p0, "mediaSpec"    # Landroidx/camera/video/MediaSpec;
    .param p1, "encoderProfiles"    # Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 74
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v0

    invoke-static {v0}, Landroidx/camera/video/MediaSpec;->outputFormatToAudioMime(I)Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "mediaSpecAudioMime":Ljava/lang/String;
    nop

    .line 76
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v1

    invoke-static {v1}, Landroidx/camera/video/MediaSpec;->outputFormatToAudioProfile(I)I

    move-result v1

    .line 77
    .local v1, "mediaSpecAudioProfile":I
    move-object v2, v0

    .line 78
    .local v2, "resolvedAudioMime":Ljava/lang/String;
    move v3, v1

    .line 79
    .local v3, "resolvedAudioProfile":I
    const/4 v4, 0x0

    .line 80
    .local v4, "compatibleAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 81
    invoke-virtual {p1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v5

    .line 82
    .local v5, "audioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    invoke-virtual {v5}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v6

    .line 83
    .local v6, "encoderProfileAudioMime":Ljava/lang/String;
    invoke-virtual {v5}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getProfile()I

    move-result v7

    .line 85
    .local v7, "encoderProfileAudioProfile":I
    const-string v8, "audio/none"

    invoke-static {v6, v8}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    const-string v9, ")]"

    const-string v10, "AudioConfigUtil"

    const-string v11, "(profile: "

    if-eqz v8, :cond_0

    .line 86
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "EncoderProfiles contains undefined AUDIO mime type so cannot be used. May rely on fallback defaults to derive settings [chosen mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 90
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v8

    const/4 v12, -0x1

    if-ne v8, v12, :cond_1

    .line 91
    move-object v4, v5

    .line 92
    move-object v2, v6

    .line 93
    move v3, v7

    .line 94
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec contains OUTPUT_FORMAT_AUTO. Using EncoderProfiles to derive AUDIO settings [mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 97
    :cond_1
    invoke-static {v0, v6}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    if-ne v1, v7, :cond_2

    .line 99
    move-object v4, v5

    .line 100
    move-object v2, v6

    .line 101
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec audio mime/profile matches EncoderProfiles. Using EncoderProfiles to derive AUDIO settings [mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 105
    :cond_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec audio mime or profile does not match EncoderProfiles, so EncoderProfiles settings cannot be used. May rely on fallback defaults to derive AUDIO settings [EncoderProfiles mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v12, "), chosen mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .end local v5    # "audioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    .end local v6    # "encoderProfileAudioMime":Ljava/lang/String;
    .end local v7    # "encoderProfileAudioProfile":I
    :cond_3
    :goto_0
    invoke-static {v2}, Landroidx/camera/video/internal/config/AudioMimeInfo;->builder(Ljava/lang/String;)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;

    move-result-object v5

    .line 115
    invoke-virtual {v5, v3}, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;->setProfile(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;

    .line 116
    .local v5, "mimeInfoBuilder":Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;
    if-eqz v4, :cond_4

    .line 117
    invoke-virtual {v5, v4}, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;->setCompatibleAudioProfile(Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;

    .line 120
    :cond_4
    invoke-virtual {v5}, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;->build()Landroidx/camera/video/internal/config/AudioMimeInfo;

    move-result-object v6

    return-object v6
.end method

.method public static resolveAudioSettings(Landroidx/camera/video/internal/config/AudioMimeInfo;Landroidx/camera/video/AudioSpec;Landroid/util/Rational;)Landroidx/camera/video/internal/audio/AudioSettings;
    .locals 3
    .param p0, "audioMimeInfo"    # Landroidx/camera/video/internal/config/AudioMimeInfo;
    .param p1, "audioSpec"    # Landroidx/camera/video/AudioSpec;
    .param p2, "captureToEncodeRatio"    # Landroid/util/Rational;

    .line 134
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getCompatibleAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v0

    .line 135
    .local v0, "compatibleAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    if-eqz v0, :cond_0

    .line 136
    new-instance v1, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;

    invoke-direct {v1, p1, v0, p2}, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;-><init>(Landroidx/camera/video/AudioSpec;Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;Landroid/util/Rational;)V

    .local v1, "settingsSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/audio/AudioSettings;>;"
    goto :goto_0

    .line 139
    .end local v1    # "settingsSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/audio/AudioSettings;>;"
    :cond_0
    new-instance v1, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;

    invoke-direct {v1, p1, p2}, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;-><init>(Landroidx/camera/video/AudioSpec;Landroid/util/Rational;)V

    .line 142
    .restart local v1    # "settingsSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/audio/AudioSettings;>;"
    :goto_0
    invoke-interface {v1}, Landroidx/core/util/Supplier;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/audio/AudioSettings;

    return-object v2
.end method

.method static resolveAudioSource(Landroidx/camera/video/AudioSpec;)I
    .locals 4
    .param p0, "audioSpec"    # Landroidx/camera/video/AudioSpec;

    .line 172
    invoke-virtual {p0}, Landroidx/camera/video/AudioSpec;->getSource()I

    move-result v0

    .line 173
    .local v0, "resolvedAudioSource":I
    const/4 v1, -0x1

    const-string v2, "AudioConfigUtil"

    if-ne v0, v1, :cond_0

    .line 174
    const/4 v0, 0x5

    .line 175
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Using default AUDIO source: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 177
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Using provided AUDIO source: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    :goto_0
    return v0
.end method

.method static resolveAudioSourceFormat(Landroidx/camera/video/AudioSpec;)I
    .locals 4
    .param p0, "audioSpec"    # Landroidx/camera/video/AudioSpec;

    .line 184
    invoke-virtual {p0}, Landroidx/camera/video/AudioSpec;->getSourceFormat()I

    move-result v0

    .line 185
    .local v0, "resolvedAudioSourceFormat":I
    const/4 v1, -0x1

    const-string v2, "AudioConfigUtil"

    if-ne v0, v1, :cond_0

    .line 188
    const/4 v0, 0x2

    .line 189
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Using default AUDIO source format: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 191
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Using provided AUDIO source format: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    :goto_0
    return v0
.end method

.method static resolveSampleRates(Landroid/util/Range;IIILandroid/util/Rational;)Landroidx/camera/video/internal/config/CaptureEncodeRates;
    .locals 10
    .param p1, "initialTargetEncodeSampleRate"    # I
    .param p2, "channelCount"    # I
    .param p3, "sourceFormat"    # I
    .param p4, "captureToEncodeRatio"    # Landroid/util/Rational;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;III",
            "Landroid/util/Rational;",
            ")",
            "Landroidx/camera/video/internal/config/CaptureEncodeRates;"
        }
    .end annotation

    .line 294
    .local p0, "targetEncodeSampeRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-nez p4, :cond_0

    .line 295
    invoke-static {p0, p2, p3, p1}, Landroidx/camera/video/internal/config/AudioConfigUtil;->selectSampleRateOrNearestSupported(Landroid/util/Range;III)I

    move-result v0

    .line 298
    .local v0, "resolvedCaptureSampleRate":I
    move v1, v0

    .local v1, "resolvedEncodeSampleRate":I
    goto :goto_1

    .line 301
    .end local v0    # "resolvedCaptureSampleRate":I
    .end local v1    # "resolvedEncodeSampleRate":I
    :cond_0
    sget-object v0, Landroidx/camera/video/AudioSpec;->SAMPLE_RATE_RANGE_AUTO:Landroid/util/Range;

    invoke-virtual {p0, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 302
    sget-object v0, Landroidx/camera/video/AudioSpec;->SAMPLE_RATE_RANGE_AUTO:Landroid/util/Range;

    .local v0, "scaledTargetEncodeSampleRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    goto :goto_0

    .line 304
    .end local v0    # "scaledTargetEncodeSampleRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_1
    nop

    .line 305
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0, p4}, Landroidx/camera/video/internal/config/CaptureEncodeRatesKt;->toCaptureRate(ILandroid/util/Rational;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 306
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1, p4}, Landroidx/camera/video/internal/config/CaptureEncodeRatesKt;->toCaptureRate(ILandroid/util/Rational;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 304
    invoke-static {v0, v1}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v0

    .line 309
    .restart local v0    # "scaledTargetEncodeSampleRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :goto_0
    invoke-static {p1, p4}, Landroidx/camera/video/internal/config/CaptureEncodeRatesKt;->toCaptureRate(ILandroid/util/Rational;)I

    move-result v1

    .line 311
    .local v1, "scaledInitialTargetEncodeSampleRate":I
    invoke-static {v0, p2, p3, v1}, Landroidx/camera/video/internal/config/AudioConfigUtil;->selectSampleRateOrNearestSupported(Landroid/util/Range;III)I

    move-result v2

    .line 314
    .local v2, "resolvedCaptureSampleRate":I
    invoke-static {v2, p4}, Landroidx/camera/video/internal/config/CaptureEncodeRatesKt;->toEncodeRate(ILandroid/util/Rational;)I

    move-result v3

    move v0, v2

    move v1, v3

    .line 318
    .end local v2    # "resolvedCaptureSampleRate":I
    .local v0, "resolvedCaptureSampleRate":I
    .local v1, "resolvedEncodeSampleRate":I
    :goto_1
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 322
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 323
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x7

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v3, v8, v9

    const/4 v3, 0x1

    aput-object v4, v8, v3

    const/4 v3, 0x2

    aput-object p0, v8, v3

    const/4 v3, 0x3

    aput-object v5, v8, v3

    const/4 v3, 0x4

    aput-object v6, v8, v3

    const/4 v3, 0x5

    aput-object v7, v8, v3

    const/4 v3, 0x6

    aput-object p4, v8, v3

    .line 318
    const-string v3, "Resolved capture/encode sample rate %dHz/%dHz, [target sample rate range: %s, target sample rate: %d, channel count: %d, source format: %d, capture to encode sample rate ratio: %s]"

    invoke-static {v2, v3, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "AudioConfigUtil"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    new-instance v2, Landroidx/camera/video/internal/config/CaptureEncodeRates;

    invoke-direct {v2, v0, v1}, Landroidx/camera/video/internal/config/CaptureEncodeRates;-><init>(II)V

    return-object v2
.end method

.method static scaleAndClampBitrate(IIIIILandroid/util/Range;)I
    .locals 21
    .param p0, "baseBitrate"    # I
    .param p1, "actualChannelCount"    # I
    .param p2, "baseChannelCount"    # I
    .param p3, "actualSampleRate"    # I
    .param p4, "baseSampleRate"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIII",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 260
    .local p5, "clampedRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move-object/from16 v0, p5

    new-instance v1, Landroid/util/Rational;

    move/from16 v2, p1

    move/from16 v3, p2

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    .line 262
    .local v1, "channelCountRatio":Landroid/util/Rational;
    new-instance v4, Landroid/util/Rational;

    move/from16 v5, p3

    move/from16 v6, p4

    invoke-direct {v4, v5, v6}, Landroid/util/Rational;-><init>(II)V

    .line 264
    .local v4, "sampleRateRatio":Landroid/util/Rational;
    move/from16 v7, p0

    int-to-double v8, v7

    invoke-virtual {v1}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v10

    mul-double/2addr v8, v10

    .line 265
    invoke-virtual {v4}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v10

    mul-double/2addr v8, v10

    double-to-int v8, v8

    .line 267
    .local v8, "resolvedBitrate":I
    const-string v9, ""

    .line 268
    .local v9, "debugString":Ljava/lang/String;
    const-string v10, "AudioConfigUtil"

    invoke-static {v10}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v11

    const/4 v12, 0x2

    const/4 v14, 0x0

    if-eqz v11, :cond_0

    .line 269
    nop

    .line 270
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    .line 271
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    const/16 v20, 0x1

    const/4 v13, 0x6

    new-array v13, v13, [Ljava/lang/Object;

    aput-object v11, v13, v14

    aput-object v15, v13, v20

    aput-object v16, v13, v12

    const/4 v11, 0x3

    aput-object v17, v13, v11

    const/4 v11, 0x4

    aput-object v18, v13, v11

    const/4 v11, 0x5

    aput-object v19, v13, v11

    .line 269
    const-string v11, "Base Bitrate(%dbps) * Channel Count Ratio(%d / %d) * Sample Rate Ratio(%d / %d) = %d"

    invoke-static {v11, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 268
    :cond_0
    const/16 v20, 0x1

    .line 274
    :goto_0
    sget-object v11, Landroidx/camera/video/AudioSpec;->BITRATE_RANGE_AUTO:Landroid/util/Range;

    invoke-virtual {v11, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 275
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v0, v11}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 276
    invoke-static {v10}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 277
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 278
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    new-array v12, v12, [Ljava/lang/Object;

    aput-object v0, v12, v14

    aput-object v13, v12, v20

    .line 277
    const-string v13, "\nClamped to range %s -> %dbps"

    invoke-static {v13, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 281
    :cond_1
    invoke-static {v10, v9}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    return v8
.end method

.method static selectSampleRateOrNearestSupported(Landroid/util/Range;III)I
    .locals 6
    .param p1, "channelCount"    # I
    .param p2, "sourceFormat"    # I
    .param p3, "initialTargetSampleRate"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;III)I"
        }
    .end annotation

    .line 200
    .local p0, "targetRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move v0, p3

    .line 202
    .local v0, "selectedSampleRate":I
    const/4 v1, 0x0

    .line 203
    .local v1, "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .line 205
    .local v2, "i":I
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v3

    const-string v4, "Sample rate "

    const-string v5, "AudioConfigUtil"

    if-eqz v3, :cond_1

    .line 206
    invoke-static {v0, p1, p2}, Landroidx/camera/video/internal/audio/AudioSource;->isSettingsSupported(III)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 208
    return v0

    .line 210
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Hz is not supported by audio source with channel count "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " and source format "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 215
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Hz is not in target range "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    :goto_1
    if-nez v1, :cond_2

    .line 223
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Trying common sample rates in proximity order to target "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Hz"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    new-instance v3, Ljava/util/ArrayList;

    sget-object v4, Landroidx/camera/video/internal/audio/AudioSettings;->COMMON_SAMPLE_RATES:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 227
    .end local v1    # "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v3, "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Landroidx/camera/video/internal/config/AudioConfigUtil$$ExternalSyntheticLambda0;

    invoke-direct {v1, p3}, Landroidx/camera/video/internal/config/AudioConfigUtil$$ExternalSyntheticLambda0;-><init>(I)V

    invoke-static {v3, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    move-object v1, v3

    .line 240
    .end local v3    # "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v1    # "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 241
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move v2, v3

    goto/16 :goto_0

    .line 250
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_3
    const-string v3, "No sample rate found in target range or supported by audio source. Falling back to default sample rate of 44100Hz"

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    const v3, 0xac44

    return v3
.end method
