.class public final Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;
.super Ljava/lang/Object;
.source "AudioSettingsDefaultResolver.java"

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
.field private static final TAG:Ljava/lang/String; = "DefAudioResolver"


# instance fields
.field private final mAudioSpec:Landroidx/camera/video/AudioSpec;

.field private final mCaptureToEncodeRatio:Landroid/util/Rational;


# direct methods
.method public constructor <init>(Landroidx/camera/video/AudioSpec;Landroid/util/Rational;)V
    .locals 0
    .param p1, "audioSpec"    # Landroidx/camera/video/AudioSpec;
    .param p2, "captureToEncodeRatio"    # Landroid/util/Rational;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    .line 52
    iput-object p2, p0, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;->mCaptureToEncodeRatio:Landroid/util/Rational;

    .line 53
    return-void
.end method


# virtual methods
.method public get()Landroidx/camera/video/internal/audio/AudioSettings;
    .locals 10

    .line 58
    iget-object v0, p0, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-static {v0}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioSource(Landroidx/camera/video/AudioSpec;)I

    move-result v0

    .line 61
    .local v0, "resolvedAudioSource":I
    iget-object v1, p0, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-static {v1}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioSourceFormat(Landroidx/camera/video/AudioSpec;)I

    move-result v1

    .line 64
    .local v1, "resolvedSourceFormat":I
    iget-object v2, p0, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-virtual {v2}, Landroidx/camera/video/AudioSpec;->getChannelCount()I

    move-result v2

    .line 66
    .local v2, "audioSpecChannelCount":I
    const/4 v3, -0x1

    const-string v4, "DefAudioResolver"

    if-ne v2, v3, :cond_0

    .line 67
    const/4 v3, 0x1

    .line 68
    .local v3, "resolvedChannelCount":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Using fallback AUDIO channel count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 70
    .end local v3    # "resolvedChannelCount":I
    :cond_0
    move v3, v2

    .line 71
    .restart local v3    # "resolvedChannelCount":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Using supplied AUDIO channel count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    :goto_0
    iget-object v5, p0, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-virtual {v5}, Landroidx/camera/video/AudioSpec;->getSampleRate()Landroid/util/Range;

    move-result-object v5

    .line 77
    .local v5, "audioSpecSampleRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v6, Landroidx/camera/video/AudioSpec;->SAMPLE_RATE_RANGE_AUTO:Landroid/util/Range;

    invoke-virtual {v6, v5}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 78
    const v6, 0xac44

    .local v6, "targetSampleRate":I
    goto :goto_1

    .line 80
    .end local v6    # "targetSampleRate":I
    :cond_1
    invoke-virtual {v5}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 82
    .restart local v6    # "targetSampleRate":I
    :goto_1
    iget-object v7, p0, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;->mCaptureToEncodeRatio:Landroid/util/Rational;

    invoke-static {v5, v6, v3, v0, v7}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveSampleRates(Landroid/util/Range;IIILandroid/util/Rational;)Landroidx/camera/video/internal/config/CaptureEncodeRates;

    move-result-object v7

    .line 85
    .local v7, "resolvedSampleRates":Landroidx/camera/video/internal/config/CaptureEncodeRates;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Using AUDIO sample rate resolved from AudioSpec: Capture sample rate: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 86
    invoke-virtual {v7}, Landroidx/camera/video/internal/config/CaptureEncodeRates;->getCaptureRate()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Hz. Encode sample rate: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 87
    invoke-virtual {v7}, Landroidx/camera/video/internal/config/CaptureEncodeRates;->getEncodeRate()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Hz."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 85
    invoke-static {v4, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-static {}, Landroidx/camera/video/internal/audio/AudioSettings;->builder()Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v4

    .line 90
    invoke-virtual {v4, v0}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setAudioSource(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v4

    .line 91
    invoke-virtual {v4, v1}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setAudioFormat(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v4

    .line 92
    invoke-virtual {v4, v3}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setChannelCount(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v4

    .line 93
    invoke-virtual {v7}, Landroidx/camera/video/internal/config/CaptureEncodeRates;->getCaptureRate()I

    move-result v8

    invoke-virtual {v4, v8}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setCaptureSampleRate(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v4

    .line 94
    invoke-virtual {v7}, Landroidx/camera/video/internal/config/CaptureEncodeRates;->getEncodeRate()I

    move-result v8

    invoke-virtual {v4, v8}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setEncodeSampleRate(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v4

    .line 95
    invoke-virtual {v4}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->build()Landroidx/camera/video/internal/audio/AudioSettings;

    move-result-object v4

    .line 89
    return-object v4
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 34
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;->get()Landroidx/camera/video/internal/audio/AudioSettings;

    move-result-object v0

    return-object v0
.end method
