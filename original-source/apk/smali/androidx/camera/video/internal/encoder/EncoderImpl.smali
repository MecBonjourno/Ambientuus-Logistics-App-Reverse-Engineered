.class public Landroidx/camera/video/internal/encoder/EncoderImpl;
.super Ljava/lang/Object;
.source "EncoderImpl.java"

# interfaces
.implements Landroidx/camera/video/internal/encoder/Encoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;,
        Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;,
        Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;,
        Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;,
        Landroidx/camera/video/internal/encoder/EncoderImpl$Api23Impl;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final NO_LIMIT_LONG:J = 0x7fffffffffffffffL

.field private static final NO_RANGE:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field static final PARAMETER_KEY_TIMELAPSE_ENABLED:Ljava/lang/String; = "time-lapse-enable"

.field static final PARAMETER_KEY_TIMELAPSE_FPS:Ljava/lang/String; = "time-lapse-fps"

.field private static final SIGNAL_EOS_TIMEOUT_MS:J = 0x3e8L

.field private static final STOP_TIMEOUT_MS:J = 0x3e8L


# instance fields
.field private final mAcquisitionQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;>;"
        }
    .end annotation
.end field

.field final mActivePauseResumeTimeRanges:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Landroid/util/Range<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mCaptureToEncodeFrameRateRatio:Landroid/util/Rational;

.field private final mCodecStopAsFlushWorkaroundEnabled:Z

.field final mEncodedDataSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/internal/encoder/EncodedDataImpl;",
            ">;"
        }
    .end annotation
.end field

.field mEncoderCallback:Landroidx/camera/video/internal/encoder/EncoderCallback;

.field mEncoderCallbackExecutor:Ljava/util/concurrent/Executor;

.field private final mEncoderConfig:Landroidx/camera/video/internal/encoder/EncoderConfig;

.field final mEncoderExecutor:Ljava/util/concurrent/Executor;

.field private final mEncoderInfo:Landroidx/camera/video/internal/encoder/EncoderInfo;

.field final mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

.field final mFreeInputBufferIndexQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mInputBufferSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field final mInputTimebase:Landroidx/camera/core/impl/Timebase;

.field private mIsFlushedAfterEndOfStream:Z

.field final mIsVideoEncoder:Z

.field mLastDataStopTimestamp:Ljava/lang/Long;

.field final mLock:Ljava/lang/Object;

.field final mMediaCodec:Landroid/media/MediaCodec;

.field private mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

.field mMediaCodecEosSignalled:Z

.field final mMediaFormat:Landroid/media/MediaFormat;

.field mPendingCodecStop:Z

.field private final mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private mSourceStoppedSignalled:Z

.field mStartStopTimeRangeUs:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

.field mStopTimeoutFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field final mTag:Ljava/lang/String;

.field final mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

.field mTotalPausedDurationUs:J


# direct methods
.method public static synthetic $r8$lambda$SlAnbggd9lEp59VusripYrYneuw(Landroidx/camera/video/internal/encoder/EncoderImpl;)V
    .locals 0

    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->signalEndOfInputStream()V

    return-void
.end method

.method public static synthetic $r8$lambda$kfgy1ft7hGhWsVbp27upmh1easY(Landroidx/camera/video/internal/encoder/EncoderImpl;J)J
    .locals 0

    invoke-direct {p0, p1, p2}, Landroidx/camera/video/internal/encoder/EncoderImpl;->toPresentationTimeUsByCaptureEncodeRatio(J)J

    move-result-wide p0

    return-wide p0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 159
    const-wide v0, 0x7fffffffffffffffL

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0, v0}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl;->NO_RANGE:Landroid/util/Range;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderConfig;I)V
    .locals 8
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "encoderConfig"    # Landroidx/camera/video/internal/encoder/EncoderConfig;
    .param p3, "sessionType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLock:Ljava/lang/Object;

    .line 183
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mFreeInputBufferIndexQueue:Ljava/util/Queue;

    .line 185
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    .line 186
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    .line 187
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncodedDataSet:Ljava/util/Set;

    .line 195
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    .line 208
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderCallback;->EMPTY:Landroidx/camera/video/internal/encoder/EncoderCallback;

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallback:Landroidx/camera/video/internal/encoder/EncoderCallback;

    .line 211
    nop

    .line 213
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 216
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl;->NO_RANGE:Landroid/util/Range;

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    .line 218
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    .line 220
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    .line 224
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    .line 226
    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    .line 228
    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    .line 230
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    .line 231
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSourceStoppedSignalled:Z

    .line 232
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecEosSignalled:Z

    .line 246
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/EncoderConfig;

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderConfig:Landroidx/camera/video/internal/encoder/EncoderConfig;

    .line 249
    invoke-static {p2}, Landroidx/camera/video/internal/utils/CodecUtil;->createCodec(Landroidx/camera/video/internal/encoder/EncoderConfig;)Landroid/media/MediaCodec;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    .line 250
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v1

    .line 251
    .local v1, "mediaCodecInfo":Landroid/media/MediaCodecInfo;
    invoke-static {p1}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    .line 252
    invoke-interface {p2}, Landroidx/camera/video/internal/encoder/EncoderConfig;->toMediaFormat()Landroid/media/MediaFormat;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    .line 253
    invoke-interface {p2}, Landroidx/camera/video/internal/encoder/EncoderConfig;->getInputTimebase()Landroidx/camera/core/impl/Timebase;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 254
    new-instance v2, Landroidx/camera/video/internal/encoder/SystemTimeProvider;

    invoke-direct {v2}, Landroidx/camera/video/internal/encoder/SystemTimeProvider;-><init>()V

    new-instance v3, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda10;

    invoke-direct {v3, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda10;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-static {v2, v3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->transformTimeProvider(Landroidx/camera/video/internal/encoder/TimeProvider;Landroidx/arch/core/util/Function;)Landroidx/camera/video/internal/encoder/TimeProvider;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    .line 256
    instance-of v2, p2, Landroidx/camera/video/internal/encoder/AudioEncoderConfig;

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 257
    move-object v2, p2

    check-cast v2, Landroidx/camera/video/internal/encoder/AudioEncoderConfig;

    .line 258
    .local v2, "audioEncoderConfig":Landroidx/camera/video/internal/encoder/AudioEncoderConfig;
    const-string v4, "AudioEncoder"

    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    .line 259
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    .line 260
    new-instance v4, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    invoke-direct {v4, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    .line 261
    new-instance v4, Landroidx/camera/video/internal/encoder/AudioEncoderInfoImpl;

    invoke-interface {p2}, Landroidx/camera/video/internal/encoder/EncoderConfig;->getMimeType()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Landroidx/camera/video/internal/encoder/AudioEncoderInfoImpl;-><init>(Landroid/media/MediaCodecInfo;Ljava/lang/String;)V

    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInfo:Landroidx/camera/video/internal/encoder/EncoderInfo;

    .line 262
    new-instance v4, Landroid/util/Rational;

    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/AudioEncoderConfig;->getCaptureSampleRate()I

    move-result v5

    .line 263
    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/AudioEncoderConfig;->getEncodeSampleRate()I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/util/Rational;-><init>(II)V

    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCaptureToEncodeFrameRateRatio:Landroid/util/Rational;

    .line 264
    .end local v2    # "audioEncoderConfig":Landroidx/camera/video/internal/encoder/AudioEncoderConfig;
    goto :goto_0

    :cond_0
    instance-of v2, p2, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    if-eqz v2, :cond_2

    .line 265
    move-object v2, p2

    check-cast v2, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    .line 266
    .local v2, "videoEncoderConfig":Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    const-string v4, "VideoEncoder"

    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    .line 267
    iput-boolean v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    .line 268
    new-instance v4, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    invoke-direct {v4, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    .line 269
    new-instance v4, Landroidx/camera/video/internal/encoder/VideoEncoderInfoImpl;

    .line 270
    invoke-interface {p2}, Landroidx/camera/video/internal/encoder/EncoderConfig;->getMimeType()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Landroidx/camera/video/internal/encoder/VideoEncoderInfoImpl;-><init>(Landroid/media/MediaCodecInfo;Ljava/lang/String;)V

    .line 271
    .local v4, "videoEncoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-direct {p0, v4, v5}, Landroidx/camera/video/internal/encoder/EncoderImpl;->clampVideoBitrateIfNotSupported(Landroidx/camera/video/internal/encoder/VideoEncoderInfo;Landroid/media/MediaFormat;)V

    .line 272
    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInfo:Landroidx/camera/video/internal/encoder/EncoderInfo;

    .line 273
    new-instance v5, Landroid/util/Rational;

    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->getCaptureFrameRate()I

    move-result v6

    .line 274
    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->getEncodeFrameRate()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/util/Rational;-><init>(II)V

    iput-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCaptureToEncodeFrameRateRatio:Landroid/util/Rational;

    .line 275
    .end local v2    # "videoEncoderConfig":Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .end local v4    # "videoEncoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    nop

    .line 279
    :goto_0
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mInputTimebase = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mMediaFormat = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mCaptureToEncodeFrameRateRatio = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCaptureToEncodeFrameRateRatio:Landroid/util/Rational;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    :try_start_0
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V
    :try_end_0
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 287
    nop

    .line 289
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 290
    .local v2, "releaseFutureRef":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;>;"
    new-instance v4, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;

    invoke-direct {v4, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 291
    invoke-static {v4}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    .line 290
    invoke-static {v4}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 295
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 297
    iget-boolean v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    if-eqz v4, :cond_1

    if-ne p3, v3, :cond_1

    const-class v4, Landroidx/camera/video/internal/compat/quirk/PreviewFreezeAfterHighSpeedRecordingQuirk;

    .line 299
    invoke-static {v4}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v4

    if-eqz v4, :cond_1

    move v0, v3

    goto :goto_1

    :cond_1
    nop

    :goto_1
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCodecStopAsFlushWorkaroundEnabled:Z

    .line 301
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->CONFIGURED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 302
    return-void

    .line 285
    .end local v2    # "releaseFutureRef":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;>;"
    :catch_0
    move-exception v0

    .line 286
    .local v0, "e":Landroid/media/MediaCodec$CodecException;
    new-instance v2, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    invoke-direct {v2, v0}, Landroidx/camera/video/internal/encoder/InvalidConfigException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 276
    .end local v0    # "e":Landroid/media/MediaCodec$CodecException;
    :cond_2
    new-instance v0, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    const-string v2, "Unknown encoder config type"

    invoke-direct {v0, v2}, Landroidx/camera/video/internal/encoder/InvalidConfigException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000(Landroidx/camera/video/internal/encoder/EncoderImpl;J)J
    .locals 2
    .param p0, "x0"    # Landroidx/camera/video/internal/encoder/EncoderImpl;
    .param p1, "x1"    # J

    .line 100
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/internal/encoder/EncoderImpl;->toPresentationTimeUsByCaptureEncodeRatio(J)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$100(Landroidx/camera/video/internal/encoder/EncoderImpl;)Ljava/util/concurrent/Future;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/internal/encoder/EncoderImpl;

    .line 100
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;

    return-object v0
.end method

.method static synthetic access$102(Landroidx/camera/video/internal/encoder/EncoderImpl;Ljava/util/concurrent/Future;)Ljava/util/concurrent/Future;
    .locals 0
    .param p0, "x0"    # Landroidx/camera/video/internal/encoder/EncoderImpl;
    .param p1, "x1"    # Ljava/util/concurrent/Future;

    .line 100
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;

    return-object p1
.end method

.method static synthetic access$200(Landroidx/camera/video/internal/encoder/EncoderImpl;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/internal/encoder/EncoderImpl;

    .line 100
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->isSlowMotion()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Landroidx/camera/video/internal/encoder/EncoderImpl;)Landroidx/camera/video/internal/encoder/EncoderConfig;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/internal/encoder/EncoderImpl;

    .line 100
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderConfig:Landroidx/camera/video/internal/encoder/EncoderConfig;

    return-object v0
.end method

.method private addSignalEosTimeoutIfNeeded()V
    .locals 7

    .line 789
    const-class v0, Landroidx/camera/video/internal/compat/quirk/SignalEosOutputBufferNotComeQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 790
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    .line 791
    .local v0, "codecCallback":Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    .line 792
    .local v1, "executor":Ljava/util/concurrent/Executor;
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;

    if-eqz v2, :cond_0

    .line 793
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 795
    :cond_0
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    new-instance v3, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda5;

    invoke-direct {v3, v1, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda5;-><init>(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;)V

    const-wide/16 v4, 0x3e8

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v3, v4, v5, v6}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;

    .line 799
    .end local v0    # "codecCallback":Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;
    .end local v1    # "executor":Ljava/util/concurrent/Executor;
    :cond_1
    return-void
.end method

.method private clampVideoBitrateIfNotSupported(Landroidx/camera/video/internal/encoder/VideoEncoderInfo;Landroid/media/MediaFormat;)V
    .locals 5
    .param p1, "videoEncoderInfo"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    .param p2, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 313
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 314
    const-string v0, "bitrate"

    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 315
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    .line 316
    .local v1, "origBitrate":I
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedBitrateRange()Landroid/util/Range;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 317
    .local v2, "newBitrate":I
    if-eq v1, v2, :cond_0

    .line 318
    invoke-virtual {p2, v0, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 319
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "updated bitrate from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    .end local v1    # "origBitrate":I
    .end local v2    # "newBitrate":I
    :cond_0
    return-void
.end method

.method static hasEndOfStreamFlag(Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 1
    .param p0, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;

    .line 1110
    iget v0, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private hasStopCodecAfterSurfaceRemovalCrashMediaServerQuirk()Z
    .locals 1

    .line 1114
    const-class v0, Landroidx/camera/video/internal/compat/quirk/StopCodecAfterSurfaceRemovalCrashMediaServerQuirk;

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

.method static isKeyFrame(Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 2
    .param p0, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;

    .line 1105
    iget v0, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static isRationalOne(Landroid/util/Rational;)Z
    .locals 2
    .param p0, "rational"    # Landroid/util/Rational;

    .line 1147
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/util/Rational;->getDenominator()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Rational;->getNumerator()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isSlowMotion()Z
    .locals 1

    .line 1143
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCaptureToEncodeFrameRateRatio:Landroid/util/Rational;

    invoke-static {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->isRationalOne(Landroid/util/Rational;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method static synthetic lambda$acquireInputBuffer$13(Ljava/util/concurrent/atomic/AtomicReference;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1044
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1045
    const-string v0, "acquireInputBuffer"

    return-object v0
.end method

.method static synthetic lambda$addSignalEosTimeoutIfNeeded$9(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;)V
    .locals 1
    .param p0, "executor"    # Ljava/util/concurrent/Executor;
    .param p1, "codecCallback"    # Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    .line 796
    invoke-static {p1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda6;

    invoke-direct {v0, p1}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$new$0(Ljava/util/concurrent/atomic/AtomicReference;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p0, "releaseFutureRef"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 292
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 293
    const-string v0, "mReleasedFuture"

    return-object v0
.end method

.method static synthetic lambda$notifyError$11(Landroidx/camera/video/internal/encoder/EncoderCallback;ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "callback"    # Landroidx/camera/video/internal/encoder/EncoderCallback;
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .line 889
    new-instance v0, Landroidx/camera/video/internal/encoder/EncodeException;

    invoke-direct {v0, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncodeException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderCallback;->onEncodeError(Landroidx/camera/video/internal/encoder/EncodeException;)V

    return-void
.end method

.method private releaseInternal()V
    .locals 2

    .line 699
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v1, "releaseInternal"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 700
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    if-eqz v0, :cond_1

    .line 702
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCodecStopAsFlushWorkaroundEnabled:Z

    if-nez v0, :cond_0

    .line 703
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.stop()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 704
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 706
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    .line 709
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.release()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 710
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 712
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    if-eqz v0, :cond_2

    .line 713
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->releaseSurface()V

    .line 716
    :cond_2
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->RELEASED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 718
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 719
    return-void
.end method

.method private reset()V
    .locals 4

    .line 326
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl;->NO_RANGE:Landroid/util/Range;

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    .line 327
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    .line 328
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->clear()V

    .line 329
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mFreeInputBufferIndexQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 332
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 333
    .local v1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    invoke-virtual {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setCancelled()Z

    .line 334
    .end local v1    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    goto :goto_0

    .line 335
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 337
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.reset()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->reset()V

    .line 339
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    .line 340
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSourceStoppedSignalled:Z

    .line 341
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecEosSignalled:Z

    .line 342
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    .line 343
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    .line 344
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 345
    iput-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    .line 347
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_2

    .line 348
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 349
    iput-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSignalEosTimeoutFuture:Ljava/util/concurrent/Future;

    .line 351
    :cond_2
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    if-eqz v0, :cond_3

    .line 352
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;->stop()V

    .line 354
    :cond_3
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    invoke-direct {v0, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    .line 355
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.setCallback()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    invoke-virtual {v0, v1}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;)V

    .line 358
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.configure()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 361
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    if-eqz v0, :cond_4

    .line 362
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->resetSurface()V

    .line 364
    :cond_4
    return-void
.end method

.method private setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V
    .locals 3
    .param p1, "state"    # Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    .line 762
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, p1, :cond_0

    .line 763
    return-void

    .line 765
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Transitioning encoder internal state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " --> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 766
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    .line 767
    return-void
.end method

.method private signalEndOfInputStream()V
    .locals 3

    .line 803
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v1, "signalEndOfInputStream"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->acquireInputBuffer()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$1;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$1;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 840
    return-void
.end method

.method private toPresentationTimeUsByCaptureEncodeRatio(J)J
    .locals 4
    .param p1, "systemTimeUs"    # J

    .line 1121
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->isSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1122
    long-to-double v0, p1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCaptureToEncodeFrameRateRatio:Landroid/util/Rational;

    invoke-virtual {v2}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v2

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    goto :goto_0

    .line 1123
    :cond_0
    move-wide v0, p1

    .line 1121
    :goto_0
    return-wide v0
.end method

.method private static transformTimeProvider(Landroidx/camera/video/internal/encoder/TimeProvider;Landroidx/arch/core/util/Function;)Landroidx/camera/video/internal/encoder/TimeProvider;
    .locals 1
    .param p0, "baseTimeProvider"    # Landroidx/camera/video/internal/encoder/TimeProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/internal/encoder/TimeProvider;",
            "Landroidx/arch/core/util/Function<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)",
            "Landroidx/camera/video/internal/encoder/TimeProvider;"
        }
    .end annotation

    .line 1129
    .local p1, "transform":Landroidx/arch/core/util/Function;, "Landroidx/arch/core/util/Function<Ljava/lang/Long;Ljava/lang/Long;>;"
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$3;

    invoke-direct {v0, p1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$3;-><init>(Landroidx/arch/core/util/Function;Landroidx/camera/video/internal/encoder/TimeProvider;)V

    return-object v0
.end method


# virtual methods
.method acquireInputBuffer()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;"
        }
    .end annotation

    .line 1031
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1060
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1057
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 1054
    :pswitch_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is in error state."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 1041
    :pswitch_2
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 1042
    .local v0, "ref":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;>;"
    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda7;

    invoke-direct {v1, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda7;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 1047
    .local v1, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 1048
    .local v2, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v3, v2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 1049
    new-instance v3, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda8;

    invoke-direct {v3, p0, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    iget-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->addCancellationListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 1051
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->matchAcquisitionsAndFreeBufferIndexes()V

    .line 1052
    return-object v1

    .line 1033
    .end local v0    # "ref":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;>;"
    .end local v1    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    .end local v2    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    :pswitch_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is not started yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method generatePresentationTimeUs()J
    .locals 2

    .line 1100
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v0

    return-wide v0
.end method

.method getAdjustedTimeUs(Landroid/media/MediaCodec$BufferInfo;)J
    .locals 4
    .param p1, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;

    .line 1005
    iget-wide v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 1006
    iget-wide v0, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget-wide v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    sub-long/2addr v0, v2

    .local v0, "adjustedTimeUs":J
    goto :goto_0

    .line 1008
    .end local v0    # "adjustedTimeUs":J
    :cond_0
    iget-wide v0, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 1010
    .restart local v0    # "adjustedTimeUs":J
    :goto_0
    return-wide v0
.end method

.method public getConfiguredBitrate()I
    .locals 3

    .line 379
    const/4 v0, 0x0

    .line 380
    .local v0, "configuredBitrate":I
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    const-string v2, "bitrate"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 381
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    .line 383
    :cond_0
    return v0
.end method

.method public getEncoderInfo()Landroidx/camera/video/internal/encoder/EncoderInfo;
    .locals 1

    .line 374
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInfo:Landroidx/camera/video/internal/encoder/EncoderInfo;

    return-object v0
.end method

.method public getInput()Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;
    .locals 1

    .line 369
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    return-object v0
.end method

.method public getReleasedFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 671
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method handleEncodeError(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .line 852
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 869
    :pswitch_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Get more than one error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 871
    goto :goto_0

    .line 864
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ERROR:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 865
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda18;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->stopMediaCodec(Ljava/lang/Runnable;)V

    .line 866
    goto :goto_0

    .line 855
    :pswitch_2
    invoke-virtual {p0, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->notifyError(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 856
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V

    .line 857
    nop

    .line 876
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method handleEncodeError(Landroid/media/MediaCodec$CodecException;)V
    .locals 2
    .param p1, "e"    # Landroid/media/MediaCodec$CodecException;

    .line 845
    const/4 v0, 0x1

    invoke-virtual {p1}, Landroid/media/MediaCodec$CodecException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 846
    return-void
.end method

.method handleStopped()V
    .locals 2

    .line 964
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_RELEASE:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, v1, :cond_0

    .line 965
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->releaseInternal()V

    goto :goto_0

    .line 967
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    .line 968
    .local v0, "oldState":Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;
    iget-boolean v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    if-nez v1, :cond_1

    .line 972
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V

    .line 974
    :cond_1
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->CONFIGURED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 975
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-eq v0, v1, :cond_2

    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START_PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, v1, :cond_3

    .line 976
    :cond_2
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->start()V

    .line 977
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START_PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, v1, :cond_3

    .line 978
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->pause()V

    .line 982
    .end local v0    # "oldState":Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;
    :cond_3
    :goto_0
    return-void
.end method

.method isInPauseRange(J)Z
    .locals 5
    .param p1, "timeUs"    # J

    .line 1016
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Range;

    .line 1017
    .local v1, "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1018
    const/4 v0, 0x1

    return v0

    .line 1019
    :cond_0
    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v3, p1, v3

    if-gez v3, :cond_1

    .line 1021
    return v2

    .line 1024
    .end local v1    # "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    :cond_1
    goto :goto_0

    .line 1025
    :cond_2
    return v2
.end method

.method synthetic lambda$acquireInputBuffer$14$androidx-camera-video-internal-encoder-EncoderImpl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 1049
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method synthetic lambda$handleEncodeError$10$androidx-camera-video-internal-encoder-EncoderImpl(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .line 865
    invoke-virtual {p0, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->notifyError(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method synthetic lambda$matchAcquisitionsAndFreeBufferIndexes$15$androidx-camera-video-internal-encoder-EncoderImpl(Landroidx/camera/video/internal/encoder/InputBufferImpl;)V
    .locals 1
    .param p1, "inputBuffer"    # Landroidx/camera/video/internal/encoder/InputBufferImpl;

    .line 1091
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method synthetic lambda$pause$5$androidx-camera-video-internal-encoder-EncoderImpl(J)V
    .locals 4
    .param p1, "pauseTriggerTimeUs"    # J

    .line 608
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 630
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 628
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 617
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START_PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 618
    goto :goto_0

    .line 621
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Pause on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1, p2}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    .line 623
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-wide v2, 0x7fffffffffffffffL

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v1

    .line 622
    invoke-interface {v0, v1}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    .line 624
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 625
    goto :goto_0

    .line 615
    :pswitch_3
    nop

    .line 632
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$release$6$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 3

    .line 646
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 663
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 661
    :pswitch_0
    goto :goto_0

    .line 656
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_RELEASE:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 657
    goto :goto_0

    .line 651
    :pswitch_2
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->releaseInternal()V

    .line 652
    nop

    .line 665
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$requestKeyFrame$8$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 2

    .line 741
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 755
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 743
    :pswitch_1
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->requestKeyFrameToMediaCodec()V

    .line 744
    goto :goto_0

    .line 752
    :pswitch_2
    nop

    .line 757
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$signalSourceStopped$7$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 2

    .line 685
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSourceStoppedSignalled:Z

    .line 686
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    if-eqz v0, :cond_1

    .line 688
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCodecStopAsFlushWorkaroundEnabled:Z

    if-nez v0, :cond_0

    .line 689
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.stop()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 690
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 692
    :cond_0
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V

    .line 694
    :cond_1
    return-void
.end method

.method synthetic lambda$start$1$androidx-camera-video-internal-encoder-EncoderImpl(J)V
    .locals 9
    .param p1, "startTriggerTimeUs"    # J

    .line 400
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v0

    const-wide v1, 0x7fffffffffffffffL

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    .line 480
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 478
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 474
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 475
    goto/16 :goto_2

    .line 428
    :pswitch_2
    iput-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    .line 430
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    .line 431
    .local v0, "pauseRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    const/4 v3, 0x0

    if-eqz v0, :cond_0

    .line 432
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v1, v5, v1

    if-nez v1, :cond_0

    move v1, v4

    goto :goto_0

    :cond_0
    move v1, v3

    .line 431
    :goto_0
    const-string v2, "There should be a \"pause\" before \"resume\""

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 434
    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 435
    .local v1, "pauseTimeUs":J
    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    .line 436
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v6

    .line 435
    invoke-interface {v5, v6}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    .line 440
    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Resume on "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {p1, p2}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\nPaused duration = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sub-long v7, p1, v1

    .line 441
    invoke-static {v7, v8}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 440
    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    iget-boolean v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    if-nez v5, :cond_1

    const-class v5, Landroidx/camera/video/internal/compat/quirk/AudioEncoderIgnoresInputTimestampQuirk;

    invoke-static {v5}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v5

    if-eqz v5, :cond_1

    goto :goto_1

    .line 449
    :cond_1
    iget-boolean v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    if-eqz v5, :cond_2

    const-class v5, Landroidx/camera/video/internal/compat/quirk/VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk;

    invoke-static {v5}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v5

    if-eqz v5, :cond_2

    goto :goto_1

    .line 454
    :cond_2
    invoke-virtual {p0, v3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setMediaCodecPaused(Z)V

    .line 455
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v3, v3, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    if-eqz v3, :cond_3

    .line 456
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v3, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    invoke-virtual {v3, v4}, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;->setActive(Z)V

    .line 462
    :cond_3
    :goto_1
    iget-boolean v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    if-eqz v3, :cond_4

    .line 463
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->requestKeyFrameToMediaCodec()V

    .line 465
    :cond_4
    sget-object v3, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->STARTED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 466
    goto :goto_2

    .line 471
    .end local v0    # "pauseRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    .end local v1    # "pauseTimeUs":J
    :pswitch_3
    goto :goto_2

    .line 402
    :pswitch_4
    iput-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    .line 404
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Start on "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1, p2}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    :try_start_0
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    if-eqz v0, :cond_5

    .line 410
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V

    .line 412
    :cond_5
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    .line 413
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.start()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V
    :try_end_0
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 418
    nop

    .line 419
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    if-eqz v0, :cond_6

    .line 420
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    invoke-virtual {v0, v4}, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;->setActive(Z)V

    .line 422
    :cond_6
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->STARTED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 423
    nop

    .line 482
    :goto_2
    return-void

    .line 415
    :catch_0
    move-exception v0

    .line 416
    .local v0, "e":Landroid/media/MediaCodec$CodecException;
    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(Landroid/media/MediaCodec$CodecException;)V

    .line 417
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$stop$2$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 2

    .line 548
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    if-eqz v0, :cond_0

    .line 549
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "The data didn\'t reach the expected timestamp before timeout, stop the codec."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    .line 554
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->signalCodecStop()V

    .line 555
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    .line 557
    :cond_0
    return-void
.end method

.method synthetic lambda$stop$3$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 2

    .line 547
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda13;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$stop$4$androidx-camera-video-internal-encoder-EncoderImpl(JJ)V
    .locals 10
    .param p1, "expectedStopTimeUs"    # J
    .param p3, "stopTriggerTimeUs"    # J

    .line 501
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 568
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 566
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 562
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->CONFIGURED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 563
    goto/16 :goto_1

    .line 509
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    .line 510
    .local v0, "currentState":Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->STOPPING:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 511
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 512
    .local v1, "startTimeUs":J
    const-wide v3, 0x7fffffffffffffffL

    cmp-long v3, v1, v3

    if-eqz v3, :cond_4

    .line 516
    const-wide/16 v3, -0x1

    cmp-long v3, p1, v3

    if-nez v3, :cond_0

    .line 517
    move-wide v3, p3

    .local v3, "stopTimeUs":J
    goto :goto_0

    .line 518
    .end local v3    # "stopTimeUs":J
    :cond_0
    cmp-long v3, p1, v1

    if-gez v3, :cond_1

    .line 523
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v4, "The expected stop time is less than the start time. Use current time as stop time."

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    move-wide v3, p3

    .restart local v3    # "stopTimeUs":J
    goto :goto_0

    .line 527
    .end local v3    # "stopTimeUs":J
    :cond_1
    move-wide v3, p1

    .line 529
    .restart local v3    # "stopTimeUs":J
    :goto_0
    cmp-long v5, v3, v1

    if-ltz v5, :cond_3

    .line 534
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    .line 535
    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Stop on "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v3, v4}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 538
    sget-object v5, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, v5, :cond_2

    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    if-eqz v5, :cond_2

    .line 539
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->signalCodecStop()V

    goto :goto_1

    .line 541
    :cond_2
    const/4 v5, 0x1

    iput-boolean v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    .line 545
    nop

    .line 546
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v5

    new-instance v6, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda2;

    invoke-direct {v6, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    const-wide/16 v7, 0x3e8

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v5, v6, v7, v8, v9}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    .line 559
    goto :goto_1

    .line 530
    :cond_3
    new-instance v5, Ljava/lang/AssertionError;

    const-string v6, "The start time should be before the stop time."

    invoke-direct {v5, v6}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 513
    .end local v3    # "stopTimeUs":J
    :cond_4
    new-instance v3, Ljava/lang/AssertionError;

    const-string v4, "There should be a \"start\" before \"stop\""

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 506
    .end local v0    # "currentState":Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;
    .end local v1    # "startTimeUs":J
    :pswitch_3
    nop

    .line 570
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$stopMediaCodec$12$androidx-camera-video-internal-encoder-EncoderImpl(Ljava/util/List;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "futures"    # Ljava/util/List;
    .param p2, "afterStop"    # Ljava/lang/Runnable;

    .line 920
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ERROR:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-eq v0, v1, :cond_3

    .line 921
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 922
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "encoded data and input buffers are returned"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 924
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    const-string v1, "mMediaCodec.stop()"

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSourceStoppedSignalled:Z

    if-nez v0, :cond_2

    .line 925
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->hasStopCodecAfterSurfaceRemovalCrashMediaServerQuirk()Z

    move-result v0

    if-nez v0, :cond_2

    .line 936
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mCodecStopAsFlushWorkaroundEnabled:Z

    if-eqz v0, :cond_1

    .line 937
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    goto :goto_0

    .line 940
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.flush()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 941
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 943
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    goto :goto_1

    .line 950
    :cond_2
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 951
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 954
    :cond_3
    :goto_1
    if-eqz p2, :cond_4

    .line 955
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 957
    :cond_4
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleStopped()V

    .line 958
    return-void
.end method

.method matchAcquisitionsAndFreeBufferIndexes()V
    .locals 6

    .line 1067
    nop

    :goto_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mFreeInputBufferIndexQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1068
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 1069
    .local v0, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mFreeInputBufferIndexQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1073
    .local v1, "bufferIndex":I
    :try_start_0
    new-instance v2, Landroidx/camera/video/internal/encoder/EncoderImpl$2;

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-direct {v2, p0, v3, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$2;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;Landroid/media/MediaCodec;I)V
    :try_end_0
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1087
    .local v2, "inputBuffer":Landroidx/camera/video/internal/encoder/InputBufferImpl;
    nop

    .line 1088
    invoke-virtual {v0, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1089
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1090
    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/InputBufferImpl;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    new-instance v4, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda9;

    invoke-direct {v4, p0, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda9;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;Landroidx/camera/video/internal/encoder/InputBufferImpl;)V

    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v3, v4, v5}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_1

    .line 1093
    :cond_0
    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/InputBufferImpl;->cancel()Z

    .line 1095
    .end local v0    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    .end local v1    # "bufferIndex":I
    .end local v2    # "inputBuffer":Landroidx/camera/video/internal/encoder/InputBufferImpl;
    :goto_1
    goto :goto_0

    .line 1084
    .restart local v0    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    .restart local v1    # "bufferIndex":I
    :catch_0
    move-exception v2

    .line 1085
    .local v2, "e":Landroid/media/MediaCodec$CodecException;
    invoke-virtual {p0, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(Landroid/media/MediaCodec$CodecException;)V

    .line 1086
    return-void

    .line 1096
    .end local v0    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    .end local v1    # "bufferIndex":I
    .end local v2    # "e":Landroid/media/MediaCodec$CodecException;
    :cond_1
    return-void
.end method

.method notifyError(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .line 883
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 884
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallback:Landroidx/camera/video/internal/encoder/EncoderCallback;

    .line 885
    .local v1, "callback":Landroidx/camera/video/internal/encoder/EncoderCallback;
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 886
    .local v2, "executor":Ljava/util/concurrent/Executor;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 888
    :try_start_1
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/internal/encoder/EncoderCallback;ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 892
    goto :goto_0

    .line 890
    :catch_0
    move-exception v0

    .line 891
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v4, "Unable to post to the supplied executor."

    invoke-static {v3, v4, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 893
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void

    .line 886
    .end local v1    # "callback":Landroidx/camera/video/internal/encoder/EncoderCallback;
    .end local v2    # "executor":Ljava/util/concurrent/Executor;
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public pause()V
    .locals 4

    .line 606
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->generatePresentationTimeUs()J

    move-result-wide v0

    .line 607
    .local v0, "pauseTriggerTimeUs":J
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda12;

    invoke-direct {v3, p0, v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda12;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;J)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 633
    return-void
.end method

.method public release()V
    .locals 2

    .line 645
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda14;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 666
    return-void
.end method

.method public requestKeyFrame()V
    .locals 2

    .line 740
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda15;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 758
    return-void
.end method

.method requestKeyFrameToMediaCodec()V
    .locals 3

    .line 781
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 782
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "request-sync"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 783
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v2, "mMediaCodec.setParameters - requestKeyFrameToMediaCodec"

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 784
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    .line 785
    return-void
.end method

.method public setEncoderCallback(Landroidx/camera/video/internal/encoder/EncoderCallback;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "encoderCallback"    # Landroidx/camera/video/internal/encoder/EncoderCallback;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 731
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 732
    :try_start_0
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallback:Landroidx/camera/video/internal/encoder/EncoderCallback;

    .line 733
    iput-object p2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 734
    monitor-exit v0

    .line 735
    return-void

    .line 734
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setMediaCodecPaused(Z)V
    .locals 4
    .param p1, "paused"    # Z

    .line 772
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 773
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "drop-input-frames"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 774
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mMediaCodec.setParameters - setMediaCodecPaused: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 775
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    .line 776
    return-void
.end method

.method signalCodecStop()V
    .locals 4

    .line 576
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v1, "signalCodecStop"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 577
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    if-eqz v0, :cond_1

    .line 578
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;->setActive(Z)V

    .line 580
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 581
    .local v0, "futures":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/encoder/InputBuffer;

    .line 582
    .local v2, "inputBuffer":Landroidx/camera/video/internal/encoder/InputBuffer;
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/InputBuffer;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 583
    .end local v2    # "inputBuffer":Landroidx/camera/video/internal/encoder/InputBuffer;
    goto :goto_0

    .line 584
    :cond_0
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->successfulAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v2, v3}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .end local v0    # "futures":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    goto :goto_1

    .line 586
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    if-eqz v0, :cond_2

    .line 588
    :try_start_0
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->addSignalEosTimeoutIfNeeded()V

    .line 589
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v1, "mMediaCodec.signalEndOfInputStream()"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 591
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecEosSignalled:Z
    :try_end_0
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 594
    goto :goto_2

    .line 592
    :catch_0
    move-exception v0

    .line 593
    .local v0, "e":Landroid/media/MediaCodec$CodecException;
    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(Landroid/media/MediaCodec$CodecException;)V

    goto :goto_2

    .line 586
    .end local v0    # "e":Landroid/media/MediaCodec$CodecException;
    :cond_2
    :goto_1
    nop

    .line 596
    :goto_2
    return-void
.end method

.method public signalSourceStopped()V
    .locals 2

    .line 683
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v1, "signalSourceStopped"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 684
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda16;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 695
    return-void
.end method

.method public start()V
    .locals 4

    .line 398
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->generatePresentationTimeUs()J

    move-result-wide v0

    .line 399
    .local v0, "startTriggerTimeUs":J
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0, v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;J)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 483
    return-void
.end method

.method public stop()V
    .locals 2

    .line 490
    const-wide/16 v0, -0x1

    invoke-virtual {p0, v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->stop(J)V

    .line 491
    return-void
.end method

.method public stop(J)V
    .locals 7
    .param p1, "expectedStopTimeUs"    # J

    .line 499
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->generatePresentationTimeUs()J

    move-result-wide v4

    .line 500
    .local v4, "stopTriggerTimeUs":J
    iget-object v6, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda4;

    move-object v1, p0

    move-wide v2, p1

    .end local p1    # "expectedStopTimeUs":J
    .local v2, "expectedStopTimeUs":J
    invoke-direct/range {v0 .. v5}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;JJ)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 571
    return-void
.end method

.method stopMediaCodec(Ljava/lang/Runnable;)V
    .locals 4
    .param p1, "afterStop"    # Ljava/lang/Runnable;

    .line 898
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v1, "stopMediaCodec"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 905
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 906
    .local v0, "futures":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncodedDataSet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/encoder/EncodedDataImpl;

    .line 907
    .local v2, "dataToClose":Landroidx/camera/video/internal/encoder/EncodedDataImpl;
    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/EncodedDataImpl;->getClosedFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 908
    .end local v2    # "dataToClose":Landroidx/camera/video/internal/encoder/EncodedDataImpl;
    goto :goto_0

    .line 909
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/encoder/InputBuffer;

    .line 910
    .local v2, "inputBuffer":Landroidx/camera/video/internal/encoder/InputBuffer;
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/InputBuffer;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 911
    .end local v2    # "inputBuffer":Landroidx/camera/video/internal/encoder/InputBuffer;
    goto :goto_1

    .line 912
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 913
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Waiting for resources to return. encoded data = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncodedDataSet:Ljava/util/Set;

    .line 914
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", input buffers = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    .line 915
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 913
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 917
    :cond_2
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->successfulAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda17;

    invoke-direct {v2, p0, v0, p1}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda17;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;Ljava/util/List;Ljava/lang/Runnable;)V

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v2, v3}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 959
    return-void
.end method

.method updateTotalPausedDuration(J)V
    .locals 7
    .param p1, "bufferPresentationTimeUs"    # J

    .line 987
    nop

    :goto_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 988
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    .line 989
    .local v0, "pauseRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long v1, p1, v1

    if-lez v1, :cond_0

    .line 991
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    .line 992
    iget-wide v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v3, v5

    add-long/2addr v1, v3

    iput-wide v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    .line 993
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Total paused duration = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    .line 994
    invoke-static {v3, v4}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 993
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 998
    .end local v0    # "pauseRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    goto :goto_0

    .line 999
    :cond_0
    return-void
.end method
