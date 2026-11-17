.class public final Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;
.super Ljava/lang/Object;
.source "AudioSettingsAudioProfileResolver.java"

# interfaces
.implements Landroidx/core/util/Supplier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/core/util/Supplier<",
        "Landroidx/camera/video/internal/audio/AudioSettings;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioSrcAdPrflRslvr"


# instance fields
.field private final mAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

.field private final mAudioSpec:Landroidx/camera/video/AudioSpec;

.field private final mCaptureToEncodeRatio:Landroid/util/Rational;


# direct methods
.method public constructor <init>(Landroidx/camera/video/AudioSpec;Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;Landroid/util/Rational;)V
    .locals 0
    .param p1, "audioSpec"    # Landroidx/camera/video/AudioSpec;
    .param p2, "audioProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    .param p3, "captureToEncodeRatio"    # Landroid/util/Rational;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    .line 56
    iput-object p2, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    .line 57
    iput-object p3, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mCaptureToEncodeRatio:Landroid/util/Rational;

    .line 58
    return-void
.end method


# virtual methods
.method public get()Landroidx/camera/video/internal/audio/AudioSettings;
    .locals 11

    .line 63
    iget-object v0, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-static {v0}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioSource(Landroidx/camera/video/AudioSpec;)I

    move-result v0

    .line 66
    .local v0, "resolvedAudioSource":I
    iget-object v1, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-static {v1}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioSourceFormat(Landroidx/camera/video/AudioSpec;)I

    move-result v1

    .line 68
    .local v1, "resolvedSourceFormat":I
    iget-object v2, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-virtual {v2}, Landroidx/camera/video/AudioSpec;->getChannelCount()I

    move-result v2

    .line 70
    .local v2, "audioSpecChannelCount":I
    iget-object v3, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    invoke-virtual {v3}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getChannels()I

    move-result v3

    .line 71
    .local v3, "audioProfileChannelCount":I
    const/4 v4, -0x1

    const-string v5, "AudioSrcAdPrflRslvr"

    if-ne v2, v4, :cond_0

    .line 72
    move v4, v3

    .line 73
    .local v4, "resolvedChannelCount":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Resolved AUDIO channel count from AudioProfile: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 76
    .end local v4    # "resolvedChannelCount":I
    :cond_0
    move v4, v2

    .line 77
    .restart local v4    # "resolvedChannelCount":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Media spec AUDIO channel count overrides AudioProfile [AudioProfile channel count: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", Resolved Channel Count: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    :goto_0
    iget-object v6, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-virtual {v6}, Landroidx/camera/video/AudioSpec;->getSampleRate()Landroid/util/Range;

    move-result-object v6

    .line 83
    .local v6, "audioSpecSampleRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    iget-object v7, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    invoke-virtual {v7}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getSampleRate()I

    move-result v7

    .line 84
    .local v7, "audioProfileSampleRate":I
    iget-object v8, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mCaptureToEncodeRatio:Landroid/util/Rational;

    invoke-static {v6, v7, v4, v1, v8}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveSampleRates(Landroid/util/Range;IIILandroid/util/Rational;)Landroidx/camera/video/internal/config/CaptureEncodeRates;

    move-result-object v8

    .line 87
    .local v8, "resolvedSampleRates":Landroidx/camera/video/internal/config/CaptureEncodeRates;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Using resolved AUDIO sample rate or nearest supported from AudioProfile: Capture sample rate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 88
    invoke-virtual {v8}, Landroidx/camera/video/internal/config/CaptureEncodeRates;->getCaptureRate()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "Hz. Encode sample rate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 89
    invoke-virtual {v8}, Landroidx/camera/video/internal/config/CaptureEncodeRates;->getEncodeRate()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "Hz. [AudioProfile sample rate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "Hz]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 87
    invoke-static {v5, v9}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-static {}, Landroidx/camera/video/internal/audio/AudioSettings;->builder()Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v5

    .line 93
    invoke-virtual {v5, v0}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setAudioSource(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v5

    .line 94
    invoke-virtual {v5, v1}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setAudioFormat(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v5

    .line 95
    invoke-virtual {v5, v4}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setChannelCount(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v5

    .line 96
    invoke-virtual {v8}, Landroidx/camera/video/internal/config/CaptureEncodeRates;->getCaptureRate()I

    move-result v9

    invoke-virtual {v5, v9}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setCaptureSampleRate(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v5

    .line 97
    invoke-virtual {v8}, Landroidx/camera/video/internal/config/CaptureEncodeRates;->getEncodeRate()I

    move-result v9

    invoke-virtual {v5, v9}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setEncodeSampleRate(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v5

    .line 98
    invoke-virtual {v5}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->build()Landroidx/camera/video/internal/audio/AudioSettings;

    move-result-object v5

    .line 92
    return-object v5
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 35
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->get()Landroidx/camera/video/internal/audio/AudioSettings;

    move-result-object v0

    return-object v0
.end method
