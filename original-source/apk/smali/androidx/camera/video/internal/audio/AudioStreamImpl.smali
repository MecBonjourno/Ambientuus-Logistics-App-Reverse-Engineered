.class public Landroidx/camera/video/internal/audio/AudioStreamImpl;
.super Ljava/lang/Object;
.source "AudioStreamImpl.java"

# interfaces
.implements Landroidx/camera/video/internal/audio/AudioStream;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/audio/AudioStreamImpl$AudioRecordingApi29Callback;
    }
.end annotation


# static fields
.field private static final DIFF_LIMIT_FROM_SYSTEM_TIME_NS:J

.field private static final TAG:Ljava/lang/String; = "AudioStreamImpl"


# instance fields
.field private mAudioRecord:Landroid/media/AudioRecord;

.field private mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

.field private mAudioStreamCallback:Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;

.field private final mBufferSize:I

.field private final mBytesPerFrame:I

.field private mCallbackExecutor:Ljava/util/concurrent/Executor;

.field private final mIsReleased:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mIsStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mNotifiedSilenceState:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mSettings:Landroidx/camera/video/internal/audio/AudioSettings;

.field private mShouldFallbackToSystemTime:Z

.field private mTotalFramesRead:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 66
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->DIFF_LIMIT_FROM_SYSTEM_TIME_NS:J

    return-void
.end method

.method public constructor <init>(Landroidx/camera/video/internal/audio/AudioSettings;Landroid/content/Context;)V
    .locals 7
    .param p1, "settings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p2, "attributionContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;
        }
    .end annotation

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsReleased:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mNotifiedSilenceState:Ljava/util/concurrent/atomic/AtomicReference;

    .line 79
    iput-boolean v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mShouldFallbackToSystemTime:Z

    .line 105
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getCaptureSampleRate()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getChannelCount()I

    move-result v2

    .line 106
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getAudioFormat()I

    move-result v3

    .line 105
    invoke-static {v0, v2, v3}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->isSettingsSupported(III)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 114
    iput-object p1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mSettings:Landroidx/camera/video/internal/audio/AudioSettings;

    .line 115
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getBytesPerFrame()I

    move-result v0

    iput v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mBytesPerFrame:I

    .line 117
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getCaptureSampleRate()I

    move-result v0

    .line 118
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getChannelCount()I

    move-result v3

    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getAudioFormat()I

    move-result v4

    .line 117
    invoke-static {v0, v3, v4}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->getMinBufferSize(III)I

    move-result v0

    .line 121
    .local v0, "minBufferSize":I
    if-lez v0, :cond_0

    move v1, v2

    :cond_0
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 122
    mul-int/lit8 v1, v0, 0x2

    iput v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mBufferSize:I

    .line 124
    iget v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mBufferSize:I

    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mSettings:Landroidx/camera/video/internal/audio/AudioSettings;

    invoke-static {v1, v2, p2}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->createAudioRecord(ILandroidx/camera/video/internal/audio/AudioSettings;Landroid/content/Context;)Landroid/media/AudioRecord;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    .line 125
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-static {v1}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->checkAudioRecordInitialStateOrReleaseAndThrow(Landroid/media/AudioRecord;)V

    .line 126
    return-void

    .line 107
    .end local v0    # "minBufferSize":I
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 110
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getCaptureSampleRate()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getChannelCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 111
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getAudioFormat()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v3, v6, v1

    aput-object v4, v6, v2

    const/4 v1, 0x2

    aput-object v5, v6, v1

    .line 107
    const-string v1, "The combination of sample rate %d, channel count %d and audio format %d is not supported."

    invoke-static {v1, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000(Landroidx/camera/video/internal/audio/AudioStreamImpl;)Landroid/media/AudioRecord;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/internal/audio/AudioStreamImpl;

    .line 64
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    return-object v0
.end method

.method private static checkAudioRecordInitialStateOrReleaseAndThrow(Landroid/media/AudioRecord;)V
    .locals 2
    .param p0, "audioRecord"    # Landroid/media/AudioRecord;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;
        }
    .end annotation

    .line 331
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 335
    return-void

    .line 332
    :cond_0
    invoke-virtual {p0}, Landroid/media/AudioRecord;->release()V

    .line 333
    new-instance v0, Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;

    const-string v1, "Unable to initialize AudioRecord"

    invoke-direct {v0, v1}, Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkNotReleasedOrThrow()V
    .locals 2

    .line 278
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsReleased:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "AudioStream has been released."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 279
    return-void
.end method

.method private checkStartedOrThrow()V
    .locals 2

    .line 282
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const-string v1, "AudioStream has not been started."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 283
    return-void
.end method

.method private static createAudioFormat(III)Landroid/media/AudioFormat;
    .locals 2
    .param p0, "sampleRate"    # I
    .param p1, "channelCount"    # I
    .param p2, "audioFormat"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 322
    new-instance v0, Landroid/media/AudioFormat$Builder;

    invoke-direct {v0}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 323
    invoke-virtual {v0, p0}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 324
    invoke-static {p1}, Landroidx/camera/video/internal/audio/AudioUtils;->channelCountToChannelMask(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 325
    invoke-virtual {v0, p2}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 326
    invoke-virtual {v0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    move-result-object v0

    .line 322
    return-object v0
.end method

.method private static createAudioFormat(Landroidx/camera/video/internal/audio/AudioSettings;)Landroid/media/AudioFormat;
    .locals 3
    .param p0, "settings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 315
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSettings;->getCaptureSampleRate()I

    move-result v0

    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSettings;->getChannelCount()I

    move-result v1

    .line 316
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSettings;->getAudioFormat()I

    move-result v2

    .line 315
    invoke-static {v0, v1, v2}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->createAudioFormat(III)Landroid/media/AudioFormat;

    move-result-object v0

    return-object v0
.end method

.method private static createAudioRecord(ILandroidx/camera/video/internal/audio/AudioSettings;Landroid/content/Context;)Landroid/media/AudioRecord;
    .locals 4
    .param p0, "bufferSizeInByte"    # I
    .param p1, "settings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 289
    nop

    .line 290
    invoke-static {p1}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->createAudioFormat(Landroidx/camera/video/internal/audio/AudioSettings;)Landroid/media/AudioFormat;

    move-result-object v0

    .line 291
    .local v0, "audioFormatObj":Landroid/media/AudioFormat;
    invoke-static {}, Landroidx/camera/video/internal/compat/Api23Impl;->createAudioRecordBuilder()Landroid/media/AudioRecord$Builder;

    move-result-object v1

    .line 292
    .local v1, "audioRecordBuilder":Landroid/media/AudioRecord$Builder;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1f

    if-lt v2, v3, :cond_0

    if-eqz p2, :cond_0

    .line 293
    invoke-static {v1, p2}, Landroidx/camera/video/internal/compat/Api31Impl;->setContext(Landroid/media/AudioRecord$Builder;Landroid/content/Context;)V

    .line 295
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getAudioSource()I

    move-result v2

    invoke-static {v1, v2}, Landroidx/camera/video/internal/compat/Api23Impl;->setAudioSource(Landroid/media/AudioRecord$Builder;I)V

    .line 296
    invoke-static {v1, v0}, Landroidx/camera/video/internal/compat/Api23Impl;->setAudioFormat(Landroid/media/AudioRecord$Builder;Landroid/media/AudioFormat;)V

    .line 297
    invoke-static {v1, p0}, Landroidx/camera/video/internal/compat/Api23Impl;->setBufferSizeInBytes(Landroid/media/AudioRecord$Builder;I)V

    .line 299
    :try_start_0
    invoke-static {v1}, Landroidx/camera/video/internal/compat/Api23Impl;->build(Landroid/media/AudioRecord$Builder;)Landroid/media/AudioRecord;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 300
    :catch_0
    move-exception v2

    .line 301
    .local v2, "e":Ljava/lang/UnsupportedOperationException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private generatePresentationTimeNs()J
    .locals 7

    .line 253
    const-wide/16 v0, -0x1

    .line 254
    .local v0, "presentationTimeNs":J
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x18

    if-lt v2, v3, :cond_2

    iget-boolean v2, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mShouldFallbackToSystemTime:Z

    if-nez v2, :cond_2

    .line 255
    new-instance v2, Landroid/media/AudioTimestamp;

    invoke-direct {v2}, Landroid/media/AudioTimestamp;-><init>()V

    .line 256
    .local v2, "audioTimestamp":Landroid/media/AudioTimestamp;
    iget-object v3, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    const/4 v4, 0x0

    invoke-static {v3, v2, v4}, Landroidx/camera/video/internal/compat/Api24Impl;->getTimestamp(Landroid/media/AudioRecord;Landroid/media/AudioTimestamp;I)I

    move-result v3

    if-nez v3, :cond_1

    .line 258
    iget-object v3, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mSettings:Landroidx/camera/video/internal/audio/AudioSettings;

    invoke-virtual {v3}, Landroidx/camera/video/internal/audio/AudioSettings;->getCaptureSampleRate()I

    move-result v3

    iget-wide v4, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mTotalFramesRead:J

    invoke-static {v3, v4, v5, v2}, Landroidx/camera/video/internal/audio/AudioUtils;->computeInterpolatedTimeNs(IJLandroid/media/AudioTimestamp;)J

    move-result-wide v0

    .line 262
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sub-long v3, v0, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    .line 263
    .local v3, "timestampDiff":J
    sget-wide v5, Landroidx/camera/video/internal/audio/AudioStreamImpl;->DIFF_LIMIT_FROM_SYSTEM_TIME_NS:J

    cmp-long v5, v3, v5

    if-lez v5, :cond_0

    .line 264
    const/4 v5, 0x1

    iput-boolean v5, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mShouldFallbackToSystemTime:Z

    .line 265
    const-wide/16 v0, -0x1

    .line 267
    .end local v3    # "timestampDiff":J
    :cond_0
    goto :goto_0

    .line 268
    :cond_1
    const-string v3, "AudioStreamImpl"

    const-string v4, "Unable to get audio timestamp"

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .end local v2    # "audioTimestamp":Landroid/media/AudioTimestamp;
    :cond_2
    :goto_0
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_3

    .line 272
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 274
    :cond_3
    return-wide v0
.end method

.method private static getMinBufferSize(III)I
    .locals 1
    .param p0, "sampleRate"    # I
    .param p1, "channelCount"    # I
    .param p2, "audioFormat"    # I

    .line 358
    invoke-static {p1}, Landroidx/camera/video/internal/audio/AudioUtils;->channelCountToChannelConfig(I)I

    move-result v0

    invoke-static {p0, v0, p2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    return v0
.end method

.method private static hasAudioTimestampQuirk()Z
    .locals 1

    .line 354
    const-class v0, Landroidx/camera/video/internal/compat/quirk/AudioTimestampFramePositionIncorrectQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSettingsSupported(III)Z
    .locals 2
    .param p0, "sampleRate"    # I
    .param p1, "channelCount"    # I
    .param p2, "audioFormat"    # I

    .line 339
    const/4 v0, 0x0

    if-lez p0, :cond_2

    if-gtz p1, :cond_0

    goto :goto_0

    .line 342
    :cond_0
    invoke-static {p0, p1, p2}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->getMinBufferSize(III)I

    move-result v1

    if-gtz v1, :cond_1

    .line 343
    return v0

    .line 346
    :cond_1
    :try_start_0
    invoke-static {p0, p1, p2}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->createAudioFormat(III)Landroid/media/AudioFormat;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 349
    nop

    .line 350
    const/4 v0, 0x1

    return v0

    .line 347
    :catch_0
    move-exception v1

    .line 348
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    return v0

    .line 340
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :cond_2
    :goto_0
    return v0
.end method

.method static synthetic lambda$notifySilenced$0(Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;Z)V
    .locals 0
    .param p0, "callback"    # Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;
    .param p1, "isSilenced"    # Z

    .line 247
    invoke-interface {p0, p1}, Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;->onSilenceStateChanged(Z)V

    return-void
.end method


# virtual methods
.method notifySilenced(Z)V
    .locals 4
    .param p1, "isSilenced"    # Z

    .line 243
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 244
    .local v0, "executor":Ljava/util/concurrent/Executor;
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioStreamCallback:Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;

    .line 245
    .local v1, "callback":Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 246
    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mNotifiedSilenceState:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 247
    new-instance v2, Landroidx/camera/video/internal/audio/AudioStreamImpl$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1, p1}, Landroidx/camera/video/internal/audio/AudioStreamImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;Z)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 250
    :cond_0
    return-void
.end method

.method public read(Ljava/nio/ByteBuffer;)Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;
    .locals 8
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 206
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->checkNotReleasedOrThrow()V

    .line 207
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->checkStartedOrThrow()V

    .line 209
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    iget v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mBufferSize:I

    invoke-virtual {v0, p1, v1}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    move-result v0

    .line 210
    .local v0, "sizeInBytes":I
    const-wide/16 v1, 0x0

    .line 211
    .local v1, "timestampNs":J
    if-lez v0, :cond_0

    .line 212
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 213
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->generatePresentationTimeNs()J

    move-result-wide v1

    .line 214
    iget-wide v3, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mTotalFramesRead:J

    int-to-long v5, v0

    iget v7, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mBytesPerFrame:I

    invoke-static {v5, v6, v7}, Landroidx/camera/video/internal/audio/AudioUtils;->sizeToFrameCount(JI)J

    move-result-wide v5

    add-long/2addr v3, v5

    iput-wide v3, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mTotalFramesRead:J

    .line 216
    :cond_0
    invoke-static {v0, v1, v2}, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;->of(IJ)Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;

    move-result-object v3

    return-object v3
.end method

.method public release()V
    .locals 2

    .line 183
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsReleased:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    return-void

    .line 186
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    if-eqz v0, :cond_1

    .line 187
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    invoke-static {v0, v1}, Landroidx/camera/video/internal/compat/Api29Impl;->unregisterAudioRecordingCallback(Landroid/media/AudioRecord;Landroid/media/AudioManager$AudioRecordingCallback;)V

    .line 189
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 190
    return-void
.end method

.method public setCallback(Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;Ljava/util/concurrent/Executor;)V
    .locals 3
    .param p1, "callback"    # Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 221
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "AudioStream can not be started when setCallback."

    invoke-static {v0, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 222
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->checkNotReleasedOrThrow()V

    .line 223
    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    const-string v0, "executor can\'t be null with non-null callback."

    invoke-static {v1, v0}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 225
    iput-object p1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioStreamCallback:Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;

    .line 226
    iput-object p2, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 227
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_5

    .line 228
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    if-eqz v0, :cond_2

    .line 229
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    invoke-static {v0, v1}, Landroidx/camera/video/internal/compat/Api29Impl;->unregisterAudioRecordingCallback(Landroid/media/AudioRecord;Landroid/media/AudioManager$AudioRecordingCallback;)V

    .line 231
    :cond_2
    if-nez p1, :cond_3

    .line 232
    return-void

    .line 234
    :cond_3
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    if-nez v0, :cond_4

    .line 235
    new-instance v0, Landroidx/camera/video/internal/audio/AudioStreamImpl$AudioRecordingApi29Callback;

    invoke-direct {v0, p0}, Landroidx/camera/video/internal/audio/AudioStreamImpl$AudioRecordingApi29Callback;-><init>(Landroidx/camera/video/internal/audio/AudioStreamImpl;)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    .line 237
    :cond_4
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    invoke-static {v0, p2, v1}, Landroidx/camera/video/internal/compat/Api29Impl;->registerAudioRecordingCallback(Landroid/media/AudioRecord;Ljava/util/concurrent/Executor;Landroid/media/AudioManager$AudioRecordingCallback;)V

    .line 240
    :cond_5
    return-void
.end method

.method public start()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;
        }
    .end annotation

    .line 130
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->checkNotReleasedOrThrow()V

    .line 131
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    return-void

    .line 135
    :cond_0
    invoke-static {}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->hasAudioTimestampQuirk()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 137
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-static {v0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->checkAudioRecordInitialStateOrReleaseAndThrow(Landroid/media/AudioRecord;)V

    .line 140
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    .line 141
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v0

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-ne v0, v2, :cond_4

    .line 146
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mTotalFramesRead:J

    .line 147
    iput-boolean v3, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mShouldFallbackToSystemTime:Z

    .line 148
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mNotifiedSilenceState:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 149
    const/4 v0, 0x0

    .line 150
    .local v0, "isSilenced":Z
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v2, v4, :cond_3

    .line 151
    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-static {v2}, Landroidx/camera/video/internal/compat/Api29Impl;->getActiveRecordingConfiguration(Landroid/media/AudioRecord;)Landroid/media/AudioRecordingConfiguration;

    move-result-object v2

    .line 153
    .local v2, "config":Landroid/media/AudioRecordingConfiguration;
    if-eqz v2, :cond_2

    invoke-static {v2}, Landroidx/camera/video/internal/compat/Api29Impl;->isClientSilenced(Landroid/media/AudioRecordingConfiguration;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_0

    :cond_2
    move v1, v3

    :goto_0
    move v0, v1

    .line 155
    .end local v2    # "config":Landroid/media/AudioRecordingConfiguration;
    :cond_3
    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->notifySilenced(Z)V

    .line 156
    return-void

    .line 142
    .end local v0    # "isSilenced":Z
    :cond_4
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 143
    new-instance v0, Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to start AudioRecord with state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    .line 144
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public stop()V
    .locals 3

    .line 161
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->checkNotReleasedOrThrow()V

    .line 162
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mIsStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 163
    return-void

    .line 165
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 166
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to stop AudioRecord with state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    .line 168
    invoke-virtual {v1}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 167
    const-string v1, "AudioStreamImpl"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    :cond_1
    invoke-static {}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->hasAudioTimestampQuirk()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 176
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 177
    iget v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mBufferSize:I

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mSettings:Landroidx/camera/video/internal/audio/AudioSettings;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->createAudioRecord(ILandroidx/camera/video/internal/audio/AudioSettings;Landroid/content/Context;)Landroid/media/AudioRecord;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    .line 179
    :cond_2
    return-void
.end method
