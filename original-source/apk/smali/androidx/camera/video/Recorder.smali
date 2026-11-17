.class public final Landroidx/camera/video/Recorder;
.super Ljava/lang/Object;
.source "Recorder.java"

# interfaces
.implements Landroidx/camera/video/VideoOutput;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/Recorder$State;,
        Landroidx/camera/video/Recorder$RecordingRecord;,
        Landroidx/camera/video/Recorder$AudioState;,
        Landroidx/camera/video/Recorder$SetupVideoTask;,
        Landroidx/camera/video/Recorder$Builder;
    }
.end annotation


# static fields
.field private static final AUDIO_CACHE_SIZE:I = 0x3c

.field private static final AUDIO_EXECUTOR:Ljava/util/concurrent/Executor;

.field static final DEFAULT_ENCODER_FACTORY:Landroidx/camera/video/internal/encoder/EncoderFactory;

.field public static final DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

.field private static final INSUFFICIENT_STORAGE_ERROR_MSG:Ljava/lang/String; = "Insufficient storage space. The available storage (%d bytes) is below the required threshold of %d bytes."

.field private static final MEDIA_COLUMN:Ljava/lang/String; = "_data"

.field private static final MEDIA_SPEC_DEFAULT:Landroidx/camera/video/MediaSpec;

.field private static final NOT_PENDING:I = 0x0

.field private static final OUTPUT_STORAGE_FACTORY_DEFAULT:Landroidx/camera/video/internal/OutputStorage$Factory;

.field private static final PENDING:I = 0x1

.field private static final PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

.field private static final PENDING_STATES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/Recorder$State;",
            ">;"
        }
    .end annotation
.end field

.field private static final REQUIRED_FREE_STORAGE_DEFAULT_BYTES:J = 0x3200000L

.field private static final REQUIRED_FREE_STORAGE_UNSET:J = -0x1L

.field private static final RETRY_SETUP_VIDEO_DELAY_MS:J = 0x3e8L

.field private static final RETRY_SETUP_VIDEO_MAX_COUNT:I = 0x3

.field private static final SOURCE_NON_STREAMING_TIMEOUT_MS:J = 0x3e8L

.field private static final TAG:Ljava/lang/String; = "Recorder"

.field private static final VALID_NON_PENDING_STATES_WHILE_PENDING:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/Recorder$State;",
            ">;"
        }
    .end annotation
.end field

.field public static final VIDEO_CAPABILITIES_SOURCE_CAMCORDER_PROFILE:I = 0x0

.field public static final VIDEO_CAPABILITIES_SOURCE_CODEC_CAPABILITIES:I = 0x1

.field static final VIDEO_RECORDING_TYPE_HIGH_SPEED:I = 0x2

.field static final VIDEO_RECORDING_TYPE_REGULAR:I = 0x1

.field private static final VIDEO_SPEC_DEFAULT:Landroidx/camera/video/VideoSpec;

.field static sRetrySetupVideoDelayMs:J

.field static sRetrySetupVideoMaxCount:I


# instance fields
.field mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

.field mActiveSurface:Landroid/view/Surface;

.field mAudioAmplitude:D

.field mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

.field private final mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

.field mAudioErrorCause:Ljava/lang/Throwable;

.field mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

.field mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

.field mAudioState:Landroidx/camera/video/Recorder$AudioState;

.field mAudioTrackIndex:Ljava/lang/Integer;

.field private mAvailableBytesAboveRequired:J

.field mDurationLimitNs:J

.field private final mEncoderNotUsePersistentInputSurface:Z

.field final mEncodingFutures:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field mFileSizeLimitInBytes:J

.field mFirstRecordingAudioDataTimeUs:J

.field mFirstRecordingVideoBitrate:I

.field mFirstRecordingVideoDataTimeUs:J

.field private mHasGlProcessing:Z

.field mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

.field mInProgressRecordingStopping:Z

.field private mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

.field mIsAudioSourceSilenced:Z

.field private final mIsRecording:Landroidx/camera/core/impl/MutableStateObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mLastGeneratedRecordingId:J

.field mLatestSurface:Landroid/view/Surface;

.field mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

.field private final mLock:Ljava/lang/Object;

.field mMediaMuxer:Landroid/media/MediaMuxer;

.field final mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "Landroidx/camera/video/MediaSpec;",
            ">;"
        }
    .end annotation
.end field

.field private mNeedsResetBeforeNextStart:Z

.field private mNonPendingState:Landroidx/camera/video/Recorder$State;

.field private mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

.field private final mOutputStorageFactory:Landroidx/camera/video/internal/OutputStorage$Factory;

.field mOutputUri:Landroid/net/Uri;

.field final mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/internal/utils/RingBuffer<",
            "Landroidx/camera/video/internal/encoder/EncodedData;",
            ">;"
        }
    .end annotation
.end field

.field mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

.field mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

.field mPreviousRecordingAudioDataTimeUs:J

.field mPreviousRecordingVideoDataTimeUs:J

.field mRecordingAudioBytes:J

.field mRecordingBytes:J

.field mRecordingDurationNs:J

.field mRecordingStopError:I

.field mRecordingStopErrorCause:Ljava/lang/Throwable;

.field private final mRequiredFreeStorageBytes:J

.field private mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

.field final mSequentialExecutor:Ljava/util/concurrent/Executor;

.field private mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

.field private mShouldSendResumeEvent:Z

.field mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

.field private mSourceTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

.field private mState:Landroidx/camera/video/Recorder$State;

.field mStreamId:I

.field private final mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "Landroidx/camera/video/StreamInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mUserProvidedExecutor:Ljava/util/concurrent/Executor;

.field private final mVideoCapabilitiesSource:I

.field mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

.field private final mVideoEncoderBitrateRange:Landroidx/camera/core/impl/MutableStateObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private mVideoEncoderConfig:Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

.field private final mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

.field mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

.field mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

.field mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

.field mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

.field mVideoTrackIndex:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 314
    sget-object v0, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_PAUSED:Landroidx/camera/video/Recorder$State;

    .line 315
    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    .line 323
    sget-object v0, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    sget-object v1, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    sget-object v2, Landroidx/camera/video/Recorder$State;->RESETTING:Landroidx/camera/video/Recorder$State;

    sget-object v3, Landroidx/camera/video/Recorder$State;->STOPPING:Landroidx/camera/video/Recorder$State;

    sget-object v4, Landroidx/camera/video/Recorder$State;->ERROR:Landroidx/camera/video/Recorder$State;

    .line 324
    invoke-static {v0, v1, v2, v3, v4}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->VALID_NON_PENDING_STATES_WHILE_PENDING:Ljava/util/Set;

    .line 344
    sget-object v0, Landroidx/camera/video/VideoSpec;->QUALITY_SELECTOR_AUTO:Landroidx/camera/video/QualitySelector;

    sput-object v0, Landroidx/camera/video/Recorder;->DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

    .line 347
    invoke-static {}, Landroidx/camera/video/VideoSpec;->builder()Landroidx/camera/video/VideoSpec$Builder;

    move-result-object v0

    sget-object v1, Landroidx/camera/video/Recorder;->DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

    .line 348
    invoke-virtual {v0, v1}, Landroidx/camera/video/VideoSpec$Builder;->setQualitySelector(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/VideoSpec$Builder;

    move-result-object v0

    .line 349
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroidx/camera/video/VideoSpec$Builder;->setAspectRatio(I)Landroidx/camera/video/VideoSpec$Builder;

    move-result-object v0

    .line 350
    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec$Builder;->build()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->VIDEO_SPEC_DEFAULT:Landroidx/camera/video/VideoSpec;

    .line 352
    invoke-static {}, Landroidx/camera/video/MediaSpec;->builder()Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 353
    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->setOutputFormat(I)Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    sget-object v1, Landroidx/camera/video/Recorder;->VIDEO_SPEC_DEFAULT:Landroidx/camera/video/VideoSpec;

    .line 354
    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->setVideoSpec(Landroidx/camera/video/VideoSpec;)Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 355
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec$Builder;->build()Landroidx/camera/video/MediaSpec;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->MEDIA_SPEC_DEFAULT:Landroidx/camera/video/MediaSpec;

    .line 358
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "The video frame producer became inactive before any data was received."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroidx/camera/video/Recorder;->PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

    .line 370
    new-instance v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda9;

    invoke-direct {v0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda9;-><init>()V

    sput-object v0, Landroidx/camera/video/Recorder;->DEFAULT_ENCODER_FACTORY:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 371
    new-instance v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda10;

    invoke-direct {v0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda10;-><init>()V

    sput-object v0, Landroidx/camera/video/Recorder;->OUTPUT_STORAGE_FACTORY_DEFAULT:Landroidx/camera/video/internal/OutputStorage$Factory;

    .line 374
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->ioExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->AUDIO_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 383
    const/4 v0, 0x3

    sput v0, Landroidx/camera/video/Recorder;->sRetrySetupVideoMaxCount:I

    .line 385
    const-wide/16 v0, 0x3e8

    sput-wide v0, Landroidx/camera/video/Recorder;->sRetrySetupVideoDelayMs:J

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/video/MediaSpec;ILandroidx/camera/video/internal/encoder/EncoderFactory;Landroidx/camera/video/internal/encoder/EncoderFactory;Landroidx/camera/video/internal/OutputStorage$Factory;J)V
    .locals 7
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "mediaSpec"    # Landroidx/camera/video/MediaSpec;
    .param p3, "videoCapabilitiesSource"    # I
    .param p4, "videoEncoderFactory"    # Landroidx/camera/video/internal/encoder/EncoderFactory;
    .param p5, "audioEncoderFactory"    # Landroidx/camera/video/internal/encoder/EncoderFactory;
    .param p6, "outputStorageFactory"    # Landroidx/camera/video/internal/OutputStorage$Factory;
    .param p7, "requiredFreeStorageBytes"    # J

    .line 537
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 401
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    .line 402
    const-class v0, Landroidx/camera/video/internal/compat/quirk/EncoderNotUsePersistentInputSurfaceQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    .line 406
    nop

    .line 407
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/MutableStateObservable;->withInitialState(Ljava/lang/Object;)Landroidx/camera/core/impl/MutableStateObservable;

    move-result-object v3

    iput-object v3, p0, Landroidx/camera/video/Recorder;->mVideoEncoderBitrateRange:Landroidx/camera/core/impl/MutableStateObservable;

    .line 412
    sget-object v3, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    iput-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    .line 416
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    .line 418
    iput v2, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    .line 421
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 426
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 429
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mLastGeneratedRecordingId:J

    .line 436
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 438
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    .line 440
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 441
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mSourceTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 442
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 443
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    .line 445
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioTrackIndex:Ljava/lang/Integer;

    .line 447
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    .line 453
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurface:Landroid/view/Surface;

    .line 455
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    .line 457
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 461
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    .line 463
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 465
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 467
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 469
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 471
    sget-object v5, Landroidx/camera/video/Recorder$AudioState;->INITIALIZING:Landroidx/camera/video/Recorder$AudioState;

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    .line 473
    sget-object v5, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    .line 475
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    .line 477
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mRecordingAudioBytes:J

    .line 478
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mRecordingDurationNs:J

    .line 480
    const-wide v5, 0x7fffffffffffffffL

    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    .line 483
    iput v2, p0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoBitrate:I

    .line 486
    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 489
    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    .line 491
    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    .line 493
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 495
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    .line 497
    iput v1, p0, Landroidx/camera/video/Recorder;->mRecordingStopError:I

    .line 500
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mRecordingStopErrorCause:Ljava/lang/Throwable;

    .line 502
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 506
    new-instance v1, Landroidx/camera/core/internal/utils/ArrayRingBuffer;

    const/16 v3, 0x3c

    invoke-direct {v1, v3}, Landroidx/camera/core/internal/utils/ArrayRingBuffer;-><init>(I)V

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    .line 509
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    .line 511
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mIsAudioSourceSilenced:Z

    .line 513
    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 515
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    .line 518
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    .line 521
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderConfig:Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    .line 522
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    .line 524
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mAudioAmplitude:D

    .line 525
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mShouldSendResumeEvent:Z

    .line 526
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

    .line 527
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    .line 528
    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mAvailableBytesAboveRequired:J

    .line 529
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mHasGlProcessing:Z

    .line 538
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mUserProvidedExecutor:Ljava/util/concurrent/Executor;

    .line 539
    if-eqz p1, :cond_1

    move-object v0, p1

    goto :goto_1

    :cond_1
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->ioExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    .line 540
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    .line 542
    invoke-direct {p0, p2}, Landroidx/camera/video/Recorder;->composeRecorderMediaSpec(Landroidx/camera/video/MediaSpec;)Landroidx/camera/video/MediaSpec;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/MutableStateObservable;->withInitialState(Ljava/lang/Object;)Landroidx/camera/core/impl/MutableStateObservable;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    .line 543
    iput p3, p0, Landroidx/camera/video/Recorder;->mVideoCapabilitiesSource:I

    .line 544
    iget v0, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    .line 545
    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;)Landroidx/camera/video/StreamInfo;

    move-result-object v0

    .line 544
    invoke-static {v0}, Landroidx/camera/core/impl/MutableStateObservable;->withInitialState(Ljava/lang/Object;)Landroidx/camera/core/impl/MutableStateObservable;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    .line 546
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/MutableStateObservable;->withInitialState(Ljava/lang/Object;)Landroidx/camera/core/impl/MutableStateObservable;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mIsRecording:Landroidx/camera/core/impl/MutableStateObservable;

    .line 547
    iput-object p4, p0, Landroidx/camera/video/Recorder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 548
    iput-object p5, p0, Landroidx/camera/video/Recorder;->mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 549
    iput-object p6, p0, Landroidx/camera/video/Recorder;->mOutputStorageFactory:Landroidx/camera/video/internal/OutputStorage$Factory;

    .line 550
    new-instance v0, Landroidx/camera/video/VideoEncoderSession;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1, v2, v3}, Landroidx/camera/video/VideoEncoderSession;-><init>(Landroidx/camera/video/internal/encoder/EncoderFactory;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    .line 552
    nop

    .line 553
    const-wide/16 v0, -0x1

    cmp-long v0, p7, v0

    if-eqz v0, :cond_2

    .line 554
    move-wide v0, p7

    goto :goto_2

    :cond_2
    const-wide/32 v0, 0x3200000

    :goto_2
    iput-wide v0, p0, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    .line 555
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mRequiredFreeStorageBytes = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    invoke-static {v1, v2}, Landroidx/camera/video/internal/utils/StorageUtil;->formatSize(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 556
    return-void
.end method

.method static synthetic access$000(Landroidx/camera/video/Recorder;)Z
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/Recorder;

    .line 185
    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mHasGlProcessing:Z

    return v0
.end method

.method static synthetic access$002(Landroidx/camera/video/Recorder;Z)Z
    .locals 0
    .param p0, "x0"    # Landroidx/camera/video/Recorder;
    .param p1, "x1"    # Z

    .line 185
    iput-boolean p1, p0, Landroidx/camera/video/Recorder;->mHasGlProcessing:Z

    return p1
.end method

.method static synthetic access$100(Landroidx/camera/video/Recorder;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/Recorder;

    .line 185
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->safeToCloseVideoEncoder()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1400(Landroidx/camera/video/Recorder;)Landroidx/camera/core/impl/MutableStateObservable;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/Recorder;

    .line 185
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mIsRecording:Landroidx/camera/core/impl/MutableStateObservable;

    return-object v0
.end method

.method static synthetic access$1500()Landroidx/camera/video/internal/OutputStorage$Factory;
    .locals 1

    .line 185
    sget-object v0, Landroidx/camera/video/Recorder;->OUTPUT_STORAGE_FACTORY_DEFAULT:Landroidx/camera/video/internal/OutputStorage$Factory;

    return-object v0
.end method

.method static synthetic access$200(Landroidx/camera/video/Recorder;)Landroidx/camera/video/internal/encoder/EncoderFactory;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/Recorder;

    .line 185
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    return-object v0
.end method

.method static synthetic access$300(Landroidx/camera/video/Recorder;)Ljava/util/concurrent/Executor;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/Recorder;

    .line 185
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic access$400(Landroidx/camera/video/Recorder;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/Recorder;

    .line 185
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    return-object v0
.end method

.method static synthetic access$502(Landroidx/camera/video/Recorder;Landroidx/camera/video/internal/encoder/VideoEncoderConfig;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .locals 0
    .param p0, "x0"    # Landroidx/camera/video/Recorder;
    .param p1, "x1"    # Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    .line 185
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mVideoEncoderConfig:Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    return-object p1
.end method

.method static synthetic access$900(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 1
    .param p0, "x0"    # Ljava/lang/Runnable;
    .param p1, "x1"    # Ljava/util/concurrent/Executor;
    .param p2, "x2"    # J
    .param p4, "x3"    # Ljava/util/concurrent/TimeUnit;

    .line 185
    invoke-static {p0, p1, p2, p3, p4}, Landroidx/camera/video/Recorder;->scheduleTask(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    return-object v0
.end method

.method private clearPendingAudioRingBuffer()V
    .locals 1

    .line 2382
    nop

    :goto_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v0}, Landroidx/camera/core/internal/utils/RingBuffer;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2383
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v0}, Landroidx/camera/core/internal/utils/RingBuffer;->dequeue()Ljava/lang/Object;

    goto :goto_0

    .line 2385
    :cond_0
    return-void
.end method

.method private composeRecorderMediaSpec(Landroidx/camera/video/MediaSpec;)Landroidx/camera/video/MediaSpec;
    .locals 4
    .param p1, "mediaSpec"    # Landroidx/camera/video/MediaSpec;

    .line 1522
    invoke-virtual {p1}, Landroidx/camera/video/MediaSpec;->toBuilder()Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 1525
    .local v0, "mediaSpecBuilder":Landroidx/camera/video/MediaSpec$Builder;
    invoke-virtual {p1}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v1

    .line 1526
    .local v1, "videoSpec":Landroidx/camera/video/VideoSpec;
    invoke-virtual {v1}, Landroidx/camera/video/VideoSpec;->getAspectRatio()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 1527
    new-instance v2, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;

    invoke-direct {v2}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;-><init>()V

    invoke-virtual {v0, v2}, Landroidx/camera/video/MediaSpec$Builder;->configureVideo(Landroidx/core/util/Consumer;)Landroidx/camera/video/MediaSpec$Builder;

    .line 1531
    :cond_0
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec$Builder;->build()Landroidx/camera/video/MediaSpec;

    move-result-object v2

    return-object v2
.end method

.method private configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V
    .locals 11
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "videoSourceTimebase"    # Landroidx/camera/core/impl/Timebase;
    .param p3, "enableRetrySetupVideo"    # Z

    .line 1248
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v0

    const-string v1, "Recorder"

    if-eqz v0, :cond_0

    .line 1249
    const-string v0, "Ignore the SurfaceRequest since it is already served."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1250
    return-void

    .line 1252
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda14;

    invoke-direct {v2, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda14;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-virtual {p1, v0, v2}, Landroidx/camera/core/SurfaceRequest;->setTransformationInfoListener(Ljava/util/concurrent/Executor;Landroidx/camera/core/SurfaceRequest$TransformationInfoListener;)V

    .line 1254
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v0

    .line 1256
    .local v0, "surfaceSize":Landroid/util/Size;
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v2

    .line 1257
    .local v2, "dynamicRange":Landroidx/camera/core/DynamicRange;
    nop

    .line 1258
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v3

    .line 1259
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getSessionType()I

    move-result v4

    .line 1257
    invoke-virtual {p0, v3, v4}, Landroidx/camera/video/Recorder;->getMediaCapabilities(Landroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;

    move-result-object v3

    .line 1260
    .local v3, "capabilities":Landroidx/camera/video/VideoCapabilities;
    invoke-interface {v3, v0, v2}, Landroidx/camera/video/VideoCapabilities;->findNearestHigherSupportedQualityFor(Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/Quality;

    move-result-object v4

    .line 1262
    .local v4, "highestSupportedQuality":Landroidx/camera/video/Quality;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Using supported quality of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for surface size "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1264
    sget-object v5, Landroidx/camera/video/Quality;->NONE:Landroidx/camera/video/Quality;

    if-eq v4, v5, :cond_2

    .line 1265
    invoke-interface {v3, v4, v2}, Landroidx/camera/video/VideoCapabilities;->getProfiles(Landroidx/camera/video/Quality;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 1267
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    if-eqz v5, :cond_1

    goto :goto_0

    .line 1268
    :cond_1
    new-instance v1, Ljava/lang/AssertionError;

    const-string v5, "Camera advertised available quality but did not produce EncoderProfiles  for advertised quality."

    invoke-direct {v1, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 1272
    :cond_2
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mResolvedEncoderProfiles = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1274
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

    if-eqz v1, :cond_3

    .line 1275
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

    invoke-virtual {v1}, Landroidx/camera/video/Recorder$SetupVideoTask;->cancelFailedRetry()V

    .line 1277
    :cond_3
    new-instance v5, Landroidx/camera/video/Recorder$SetupVideoTask;

    iget-boolean v9, p0, Landroidx/camera/video/Recorder;->mHasGlProcessing:Z

    .line 1278
    if-eqz p3, :cond_4

    sget v1, Landroidx/camera/video/Recorder;->sRetrySetupVideoMaxCount:I

    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    :goto_1
    move v10, v1

    move-object v6, p0

    move-object v7, p1

    move-object v8, p2

    .end local p1    # "surfaceRequest":Landroidx/camera/core/SurfaceRequest;
    .end local p2    # "videoSourceTimebase":Landroidx/camera/core/impl/Timebase;
    .local v7, "surfaceRequest":Landroidx/camera/core/SurfaceRequest;
    .local v8, "videoSourceTimebase":Landroidx/camera/core/impl/Timebase;
    invoke-direct/range {v5 .. v10}, Landroidx/camera/video/Recorder$SetupVideoTask;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;ZI)V

    iput-object v5, v6, Landroidx/camera/video/Recorder;->mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

    .line 1279
    iget-object p1, v6, Landroidx/camera/video/Recorder;->mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

    invoke-virtual {p1}, Landroidx/camera/video/Recorder$SetupVideoTask;->start()V

    .line 1280
    return-void
.end method

.method private finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    .locals 7
    .param p1, "recordingToFinalize"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "error"    # I
    .param p3, "cause"    # Ljava/lang/Throwable;

    .line 1107
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecording(Landroid/net/Uri;)V

    .line 1108
    nop

    .line 1110
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    .line 1113
    const/4 v1, 0x1

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    invoke-static/range {v1 .. v6}, Landroidx/camera/video/AudioStats;->of(ILjava/lang/Throwable;DJ)Landroidx/camera/video/AudioStats;

    move-result-object v1

    .line 1111
    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v2, v3, v1}, Landroidx/camera/video/RecordingStats;->of(JJLandroidx/camera/video/AudioStats;)Landroidx/camera/video/RecordingStats;

    move-result-object v1

    sget-object v2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 1115
    invoke-static {v2}, Landroidx/camera/video/OutputResults;->of(Landroid/net/Uri;)Landroidx/camera/video/OutputResults;

    move-result-object v2

    .line 1109
    invoke-static {v0, v1, v2, p2, p3}, Landroidx/camera/video/VideoRecordEvent;->finalizeWithError(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;Landroidx/camera/video/OutputResults;ILjava/lang/Throwable;)Landroidx/camera/video/VideoRecordEvent$Finalize;

    move-result-object v0

    .line 1108
    invoke-virtual {p1, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 1118
    return-void
.end method

.method private getAudioDataToWriteAndClearCache(J)Ljava/util/List;
    .locals 4
    .param p1, "firstVideoDataTimeUs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Landroidx/camera/video/internal/encoder/EncodedData;",
            ">;"
        }
    .end annotation

    .line 1766
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1768
    .local v0, "res":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    :goto_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v1}, Landroidx/camera/core/internal/utils/RingBuffer;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1769
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v1}, Landroidx/camera/core/internal/utils/RingBuffer;->dequeue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1773
    .local v1, "data":Landroidx/camera/video/internal/encoder/EncodedData;
    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/EncodedData;->getPresentationTimeUs()J

    move-result-wide v2

    cmp-long v2, v2, p1

    if-ltz v2, :cond_0

    .line 1774
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1776
    .end local v1    # "data":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_0
    goto :goto_0

    .line 1778
    :cond_1
    return-object v0
.end method

.method public static getHighSpeedVideoCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;
    .locals 1
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 3126
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroidx/camera/video/Recorder;->getHighSpeedVideoCapabilities(Landroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;

    move-result-object v0

    return-object v0
.end method

.method public static getHighSpeedVideoCapabilities(Landroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;
    .locals 2
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;
    .param p1, "videoCapabilitiesSource"    # I

    .line 3153
    const/4 v0, 0x2

    invoke-static {v0, p0, p1}, Landroidx/camera/video/Recorder;->getVideoCapabilitiesInternal(ILandroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;

    move-result-object v0

    .line 3155
    .local v0, "videoCapabilities":Landroidx/camera/video/VideoCapabilities;
    invoke-interface {v0}, Landroidx/camera/video/VideoCapabilities;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public static getVideoCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;
    .locals 2
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 3083
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Landroidx/camera/video/Recorder;->getVideoCapabilitiesInternal(ILandroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;

    move-result-object v0

    return-object v0
.end method

.method public static getVideoCapabilities(Landroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;
    .locals 1
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;
    .param p1, "videoCapabilitiesSource"    # I

    .line 3106
    const/4 v0, 0x1

    invoke-static {v0, p0, p1}, Landroidx/camera/video/Recorder;->getVideoCapabilitiesInternal(ILandroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;

    move-result-object v0

    return-object v0
.end method

.method private static getVideoCapabilitiesInternal(ILandroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;
    .locals 3
    .param p0, "videoRecordingType"    # I
    .param p1, "cameraInfo"    # Landroidx/camera/core/CameraInfo;
    .param p2, "videoCapabilitiesSource"    # I

    .line 3162
    new-instance v0, Landroidx/camera/video/RecorderVideoCapabilities;

    move-object v1, p1

    check-cast v1, Landroidx/camera/core/impl/CameraInfoInternal;

    sget-object v2, Landroidx/camera/video/internal/encoder/VideoEncoderInfoImpl;->FINDER:Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;

    invoke-direct {v0, p2, v1, p0, v2}, Landroidx/camera/video/RecorderVideoCapabilities;-><init>(ILandroidx/camera/core/impl/CameraInfoInternal;ILandroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)V

    return-object v0
.end method

.method private internalAudioStateToAudioStatsState(Landroidx/camera/video/Recorder$AudioState;)I
    .locals 3
    .param p1, "audioState"    # Landroidx/camera/video/Recorder$AudioState;

    .line 2474
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$AudioState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 2500
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid internal audio state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 2497
    :pswitch_0
    const/4 v0, 0x4

    return v0

    .line 2495
    :pswitch_1
    const/4 v0, 0x3

    return v0

    .line 2487
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$RecordingRecord;->isMuted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2488
    const/4 v0, 0x5

    return v0

    .line 2489
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mIsAudioSourceSilenced:Z

    if-eqz v0, :cond_1

    .line 2490
    const/4 v0, 0x2

    return v0

    .line 2492
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 2485
    :pswitch_3
    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;
    .locals 2
    .param p1, "state"    # Landroidx/camera/video/Recorder$State;

    .line 2505
    const-class v0, Landroidx/camera/video/internal/compat/quirk/DeactivateEncoderSurfaceBeforeStopEncoderQuirk;

    .line 2506
    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/compat/quirk/DeactivateEncoderSurfaceBeforeStopEncoderQuirk;

    .line 2507
    .local v0, "quirk":Landroidx/camera/video/internal/compat/quirk/DeactivateEncoderSurfaceBeforeStopEncoderQuirk;
    sget-object v1, Landroidx/camera/video/Recorder$State;->RECORDING:Landroidx/camera/video/Recorder$State;

    if-eq p1, v1, :cond_1

    sget-object v1, Landroidx/camera/video/Recorder$State;->STOPPING:Landroidx/camera/video/Recorder$State;

    if-ne p1, v1, :cond_0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2508
    :cond_0
    sget-object v1, Landroidx/camera/video/StreamInfo$StreamState;->INACTIVE:Landroidx/camera/video/StreamInfo$StreamState;

    goto :goto_1

    :cond_1
    :goto_0
    sget-object v1, Landroidx/camera/video/StreamInfo$StreamState;->ACTIVE:Landroidx/camera/video/StreamInfo$StreamState;

    .line 2507
    :goto_1
    return-object v1
.end method

.method private static isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z
    .locals 5
    .param p0, "activeRecording"    # Landroidx/camera/video/Recording;
    .param p1, "recordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1536
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1537
    return v0

    .line 1540
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/video/Recording;->getRecordingId()J

    move-result-wide v1

    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getRecordingId()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method static synthetic lambda$composeRecorderMediaSpec$9(Landroidx/camera/video/VideoSpec$Builder;)V
    .locals 1
    .param p0, "builder"    # Landroidx/camera/video/VideoSpec$Builder;

    .line 1528
    sget-object v0, Landroidx/camera/video/Recorder;->VIDEO_SPEC_DEFAULT:Landroidx/camera/video/VideoSpec;

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getAspectRatio()I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/camera/video/VideoSpec$Builder;->setAspectRatio(I)Landroidx/camera/video/VideoSpec$Builder;

    return-void
.end method

.method static synthetic lambda$scheduleTask$15(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "executor"    # Ljava/util/concurrent/Executor;
    .param p1, "task"    # Ljava/lang/Runnable;

    .line 3042
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$setVideoEncodingFrameRate$2(ILandroidx/camera/video/VideoSpec$Builder;)V
    .locals 0
    .param p0, "frameRate"    # I
    .param p1, "builder"    # Landroidx/camera/video/VideoSpec$Builder;

    .line 808
    invoke-virtual {p1, p0}, Landroidx/camera/video/VideoSpec$Builder;->setEncodeFrameRate(I)Landroidx/camera/video/VideoSpec$Builder;

    return-void
.end method

.method static synthetic lambda$stopInternal$14(Landroidx/camera/video/internal/encoder/Encoder;)V
    .locals 2
    .param p0, "finalVideoEncoder"    # Landroidx/camera/video/internal/encoder/Encoder;

    .line 2335
    const-string v0, "Recorder"

    const-string v1, "The source didn\'t become non-streaming before timeout. Waited 1000ms"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2338
    const-class v0, Landroidx/camera/video/internal/compat/quirk/DeactivateEncoderSurfaceBeforeStopEncoderQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2344
    invoke-static {p0}, Landroidx/camera/video/Recorder;->notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V

    .line 2346
    :cond_0
    return-void
.end method

.method private makePendingRecordingActiveLocked(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/Recorder$RecordingRecord;
    .locals 5
    .param p1, "state"    # Landroidx/camera/video/Recorder$State;

    .line 2827
    const/4 v0, 0x0

    .line 2828
    .local v0, "startRecordingPaused":Z
    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_PAUSED:Landroidx/camera/video/Recorder$State;

    if-ne p1, v1, :cond_0

    .line 2829
    const/4 v0, 0x1

    goto :goto_0

    .line 2830
    :cond_0
    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    if-ne p1, v1, :cond_4

    .line 2834
    :goto_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v1, :cond_3

    .line 2838
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v1, :cond_2

    .line 2843
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2844
    .local v1, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$RecordingRecord;->getRecordingState()Landroidx/camera/core/impl/StateObservable;

    move-result-object v2

    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    new-instance v4, Landroidx/camera/video/Recorder$7;

    invoke-direct {v4, p0}, Landroidx/camera/video/Recorder$7;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-virtual {v2, v3, v4}, Landroidx/camera/core/impl/StateObservable;->addObserver(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V

    .line 2856
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2858
    if-eqz v0, :cond_1

    .line 2859
    sget-object v2, Landroidx/camera/video/Recorder$State;->PAUSED:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    goto :goto_1

    .line 2861
    :cond_1
    sget-object v2, Landroidx/camera/video/Recorder$State;->RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2864
    :goto_1
    return-object v1

    .line 2839
    .end local v1    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Pending recording should exist when in a PENDING state."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 2835
    :cond_3
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Cannot make pending recording active because another recording is already active."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 2831
    :cond_4
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "makePendingRecordingActiveLocked() can only be called from a pending state."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method private muteInternal(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
    .locals 1
    .param p1, "recordingToMute"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "muted"    # Z

    .line 2362
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->isMuted()Z

    move-result v0

    if-ne v0, p2, :cond_0

    .line 2363
    return-void

    .line 2365
    :cond_0
    invoke-virtual {p1, p2}, Landroidx/camera/video/Recorder$RecordingRecord;->mute(Z)V

    .line 2367
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, p1, :cond_1

    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    if-eqz v0, :cond_1

    .line 2369
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    invoke-virtual {v0, p2}, Landroidx/camera/video/internal/audio/AudioSource;->mute(Z)V

    .line 2371
    :cond_1
    return-void
.end method

.method static notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V
    .locals 1
    .param p0, "encoder"    # Landroidx/camera/video/internal/encoder/Encoder;

    .line 2375
    instance-of v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;

    if-eqz v0, :cond_0

    .line 2376
    move-object v0, p0

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->signalSourceStopped()V

    .line 2378
    :cond_0
    return-void
.end method

.method private onRecordingFinalized(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 11
    .param p1, "finalizedRecording"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2617
    const/4 v0, 0x0

    .line 2618
    .local v0, "needsReset":Z
    const/4 v1, 0x0

    .line 2619
    .local v1, "startRecordingPaused":Z
    const/4 v2, 0x0

    .line 2620
    .local v2, "needsConfigure":Z
    const/4 v3, 0x0

    .line 2621
    .local v3, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v4, 0x0

    .line 2622
    .local v4, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v5, 0x0

    .line 2623
    .local v5, "error":I
    const/4 v6, 0x0

    .line 2624
    .local v6, "errorCause":Ljava/lang/Throwable;
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v7

    .line 2625
    :try_start_0
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v8, p1, :cond_b

    .line 2630
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v8}, Landroidx/camera/video/Recorder$RecordingRecord;->getRecordingState()Landroidx/camera/core/impl/StateObservable;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/camera/core/impl/StateObservable;->removeObservers()V

    .line 2631
    const/4 v8, 0x0

    iput-object v8, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2632
    iget-object v9, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v9}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v9

    packed-switch v9, :pswitch_data_0

    goto/16 :goto_0

    .line 2685
    :pswitch_0
    goto/16 :goto_0

    .line 2634
    :pswitch_1
    const/4 v0, 0x1

    .line 2635
    goto/16 :goto_0

    .line 2643
    :pswitch_2
    iget-boolean v9, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    if-eqz v9, :cond_1

    .line 2648
    iput-object v8, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    .line 2649
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v8, :cond_0

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v8}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v8

    if-nez v8, :cond_0

    .line 2650
    const/4 v2, 0x1

    .line 2652
    :cond_0
    sget-object v8, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v8}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    goto :goto_0

    .line 2654
    :cond_1
    sget-object v8, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v8}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2656
    goto :goto_0

    .line 2691
    :pswitch_3
    new-instance v8, Ljava/lang/AssertionError;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unexpected state on finalize of recording: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "needsReset":Z
    .end local v1    # "startRecordingPaused":Z
    .end local v2    # "needsConfigure":Z
    .end local v3    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v4    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v5    # "error":I
    .end local v6    # "errorCause":Ljava/lang/Throwable;
    .end local p1    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    throw v8

    .line 2658
    .restart local v0    # "needsReset":Z
    .restart local v1    # "startRecordingPaused":Z
    .restart local v2    # "needsConfigure":Z
    .restart local v3    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v4    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v5    # "error":I
    .restart local v6    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    :pswitch_4
    const/4 v1, 0x1

    .line 2661
    :pswitch_5
    iget-object v9, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v10, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne v9, v10, :cond_2

    .line 2662
    iget-object v9, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v4, v9

    .line 2663
    iput-object v8, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2664
    sget-object v8, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v8}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2665
    const/4 v5, 0x4

    .line 2666
    sget-object v8, Landroidx/camera/video/Recorder;->PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

    move-object v6, v8

    goto :goto_0

    .line 2667
    :cond_2
    iget-boolean v9, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    if-eqz v9, :cond_4

    .line 2672
    iput-object v8, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    .line 2673
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v8, :cond_3

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v8}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v8

    if-nez v8, :cond_3

    .line 2674
    const/4 v2, 0x1

    .line 2676
    :cond_3
    sget-object v8, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v8}, Landroidx/camera/video/Recorder;->updateNonPendingState(Landroidx/camera/video/Recorder$State;)V

    goto :goto_0

    .line 2677
    :cond_4
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v8, :cond_5

    .line 2680
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v8}, Landroidx/camera/video/Recorder;->makePendingRecordingActiveLocked(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v8

    move-object v3, v8

    goto :goto_0

    .line 2689
    :pswitch_6
    nop

    .line 2694
    :cond_5
    :goto_0
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2697
    if-eqz v2, :cond_6

    .line 2698
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

    const/4 v9, 0x0

    invoke-direct {p0, v7, v8, v9}, Landroidx/camera/video/Recorder;->configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V

    goto :goto_1

    .line 2699
    :cond_6
    if-eqz v0, :cond_7

    .line 2700
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->reset()V

    goto :goto_1

    .line 2701
    :cond_7
    if-eqz v3, :cond_9

    .line 2704
    iget-boolean v7, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    if-nez v7, :cond_8

    .line 2708
    invoke-direct {p0, v3, v1}, Landroidx/camera/video/Recorder;->startRecording(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    goto :goto_1

    .line 2705
    :cond_8
    new-instance v7, Ljava/lang/AssertionError;

    const-string v8, "Attempt to start a pending recording while the Recorder is waiting for a new surface request."

    invoke-direct {v7, v8}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v7

    .line 2709
    :cond_9
    if-eqz v4, :cond_a

    .line 2710
    invoke-direct {p0, v4, v5, v6}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2712
    :cond_a
    :goto_1
    return-void

    .line 2626
    :cond_b
    :try_start_1
    new-instance v8, Ljava/lang/AssertionError;

    const-string v9, "Active recording did not match finalized recording on finalize."

    invoke-direct {v8, v9}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "needsReset":Z
    .end local v1    # "startRecordingPaused":Z
    .end local v2    # "needsConfigure":Z
    .end local v3    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v4    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v5    # "error":I
    .end local v6    # "errorCause":Ljava/lang/Throwable;
    .end local p1    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    throw v8

    .line 2694
    .restart local v0    # "needsReset":Z
    .restart local v1    # "startRecordingPaused":Z
    .restart local v2    # "needsConfigure":Z
    .restart local v3    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v4    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v5    # "error":I
    .restart local v6    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    :catchall_0
    move-exception v8

    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v8

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onResetVideo()V
    .locals 4

    .line 2423
    const/4 v0, 0x1

    .line 2424
    .local v0, "shouldConfigure":Z
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2425
    :try_start_0
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 2436
    :pswitch_0
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isPersistentRecordingInProgress()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2437
    const/4 v0, 0x0

    .line 2438
    goto :goto_0

    .line 2446
    :cond_0
    :pswitch_1
    sget-object v2, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2447
    goto :goto_0

    .line 2429
    :pswitch_2
    sget-object v2, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v2}, Landroidx/camera/video/Recorder;->updateNonPendingState(Landroidx/camera/video/Recorder$State;)V

    .line 2430
    nop

    .line 2452
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2454
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    .line 2457
    if-eqz v0, :cond_1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v2, :cond_1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 2458
    invoke-virtual {v2}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v2

    if-nez v2, :cond_1

    .line 2459
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-direct {p0, v2, v3, v1}, Landroidx/camera/video/Recorder;->configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V

    .line 2461
    :cond_1
    return-void

    .line 2452
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onSurfaceRequestedInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V
    .locals 1
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;
    .param p3, "hasGlProcessing"    # Z

    .line 1123
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1124
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0}, Landroidx/camera/core/SurfaceRequest;->willNotProvideSurface()Z

    .line 1126
    :cond_0
    iput-boolean p3, p0, Landroidx/camera/video/Recorder;->mHasGlProcessing:Z

    .line 1127
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iput-object p2, p0, Landroidx/camera/video/Recorder;->mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Landroidx/camera/video/Recorder;->configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V

    .line 1128
    return-void
.end method

.method private pauseInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 3
    .param p1, "recordingToPause"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2270
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, p1, :cond_1

    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    if-nez v0, :cond_1

    .line 2271
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2272
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->pause()V

    .line 2274
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->pause()V

    .line 2276
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2277
    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 2278
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v2

    .line 2276
    invoke-static {v1, v2}, Landroidx/camera/video/VideoRecordEvent;->pause(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Pause;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 2280
    :cond_1
    return-void
.end method

.method private prepareRecordingInternal(Landroid/content/Context;Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "options"    # Landroidx/camera/video/OutputOptions;

    .line 702
    const-string v0, "The OutputOptions cannot be null."

    invoke-static {p2, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    new-instance v0, Landroidx/camera/video/PendingRecording;

    invoke-direct {v0, p1, p0, p2}, Landroidx/camera/video/PendingRecording;-><init>(Landroid/content/Context;Landroidx/camera/video/Recorder;Landroidx/camera/video/OutputOptions;)V

    return-object v0
.end method

.method private releaseCurrentAudioSource()V
    .locals 4

    .line 1602
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    if-eqz v0, :cond_0

    .line 1605
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    .line 1606
    .local v0, "audioSource":Landroidx/camera/video/internal/audio/AudioSource;
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    .line 1607
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const-string v1, "Releasing audio source: 0x%x"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Recorder"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1609
    invoke-virtual {v0}, Landroidx/camera/video/internal/audio/AudioSource;->release()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/Recorder$2;

    invoke-direct {v2, p0, v0}, Landroidx/camera/video/Recorder$2;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/internal/audio/AudioSource;)V

    .line 1621
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 1609
    invoke-static {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 1622
    return-void

    .line 1603
    .end local v0    # "audioSource":Landroidx/camera/video/internal/audio/AudioSource;
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Cannot release null audio source."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private reset()V
    .locals 2

    .line 2389
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v0, :cond_0

    .line 2390
    const-string v0, "Recorder"

    const-string v1, "Releasing audio encoder."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2391
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->release()V

    .line 2392
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 2393
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 2395
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    if-eqz v0, :cond_1

    .line 2396
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->releaseCurrentAudioSource()V

    .line 2399
    :cond_1
    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->INITIALIZING:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 2400
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->resetVideo()V

    .line 2401
    return-void
.end method

.method private resetVideo()V
    .locals 2

    .line 2465
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v0, :cond_0

    .line 2466
    const-string v0, "Recorder"

    const-string v1, "Releasing video encoder."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2467
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->tryReleaseVideoEncoder()V

    .line 2469
    :cond_0
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->onResetVideo()V

    .line 2470
    return-void
.end method

.method private restoreNonPendingState()V
    .locals 3

    .line 3026
    sget-object v0, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3030
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 3031
    return-void

    .line 3027
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot restore non-pending state when in state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private resumeInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 3
    .param p1, "recordingToResume"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2285
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, p1, :cond_2

    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    if-nez v0, :cond_2

    .line 2286
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2287
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 2293
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v0, :cond_1

    .line 2294
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 2295
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2296
    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 2297
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v2

    .line 2295
    invoke-static {v1, v2}, Landroidx/camera/video/VideoRecordEvent;->resume(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Resume;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    goto :goto_0

    .line 2301
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/Recorder;->mShouldSendResumeEvent:Z

    .line 2304
    :cond_2
    :goto_0
    return-void
.end method

.method private safeToCloseVideoEncoder()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1397
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Try to safely release video encoder: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1398
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession;->signalTermination()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method private static scheduleTask(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 2
    .param p0, "task"    # Ljava/lang/Runnable;
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "delay"    # J
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "Ljava/util/concurrent/Executor;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation

    .line 3042
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda0;-><init>(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    invoke-interface {v0, v1, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    return-object v0
.end method

.method private setStreamId(I)V
    .locals 3
    .param p1, "streamId"    # I

    .line 2972
    iget v0, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    if-ne v0, p1, :cond_0

    .line 2973
    return-void

    .line 2975
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Transitioning streamId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2976
    iput p1, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    .line 2977
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    invoke-static {p1, v1, v2}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)Landroidx/camera/video/StreamInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 2979
    return-void
.end method

.method private setupAudio(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 10
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioSourceAccessException;,
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 1553
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    .line 1555
    .local v0, "mediaSpec":Landroidx/camera/video/MediaSpec;
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    invoke-static {v0, v1}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioMimeInfo(Landroidx/camera/video/MediaSpec;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;)Landroidx/camera/video/internal/config/AudioMimeInfo;

    move-result-object v1

    .line 1556
    .local v1, "audioMimeInfo":Landroidx/camera/video/internal/config/AudioMimeInfo;
    sget-object v2, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    .line 1559
    .local v2, "audioSourceTimebase":Landroidx/camera/core/impl/Timebase;
    iget-object v3, p0, Landroidx/camera/video/Recorder;->mVideoEncoderConfig:Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    invoke-static {v3}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    .line 1561
    .local v3, "videoEncoderConfig":Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    invoke-virtual {v3}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->getCaptureFrameRate()I

    move-result v4

    invoke-virtual {v3}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->getEncodeFrameRate()I

    move-result v5

    if-eq v4, v5, :cond_0

    .line 1562
    new-instance v4, Landroid/util/Rational;

    invoke-virtual {v3}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->getCaptureFrameRate()I

    move-result v5

    .line 1563
    invoke-virtual {v3}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->getEncodeFrameRate()I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/util/Rational;-><init>(II)V

    .local v4, "expectedSampleRateRatio":Landroid/util/Rational;
    goto :goto_0

    .line 1565
    .end local v4    # "expectedSampleRateRatio":Landroid/util/Rational;
    :cond_0
    const/4 v4, 0x0

    .line 1569
    .restart local v4    # "expectedSampleRateRatio":Landroid/util/Rational;
    :goto_0
    nop

    .line 1570
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v5

    invoke-static {v1, v5, v4}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioSettings(Landroidx/camera/video/internal/config/AudioMimeInfo;Landroidx/camera/video/AudioSpec;Landroid/util/Rational;)Landroidx/camera/video/internal/audio/AudioSettings;

    move-result-object v5

    .line 1572
    .local v5, "audioSettings":Landroidx/camera/video/internal/audio/AudioSettings;
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    if-eqz v6, :cond_1

    .line 1573
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->releaseCurrentAudioSource()V

    .line 1577
    :cond_1
    invoke-direct {p0, p1, v5}, Landroidx/camera/video/Recorder;->setupAudioSource(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/camera/video/internal/audio/AudioSettings;)Landroidx/camera/video/internal/audio/AudioSource;

    move-result-object v6

    iput-object v6, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    .line 1578
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v6, v7, v8

    const-string v6, "Set up new audio source: 0x%x"

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "Recorder"

    invoke-static {v7, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1581
    nop

    .line 1582
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v6

    .line 1581
    invoke-static {v1, v2, v5, v6}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioEncoderConfig(Landroidx/camera/video/internal/config/AudioMimeInfo;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/internal/audio/AudioSettings;Landroidx/camera/video/AudioSpec;)Landroidx/camera/video/internal/encoder/AudioEncoderConfig;

    move-result-object v6

    .line 1583
    .local v6, "audioEncoderConfig":Landroidx/camera/video/internal/encoder/AudioEncoderConfig;
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v9, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 1584
    invoke-static {v9}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v9}, Landroidx/camera/core/SurfaceRequest;->getSessionType()I

    move-result v9

    .line 1583
    invoke-interface {v7, v8, v6, v9}, Landroidx/camera/video/internal/encoder/EncoderFactory;->createEncoder(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderConfig;I)Landroidx/camera/video/internal/encoder/Encoder;

    move-result-object v7

    iput-object v7, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 1587
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v7}, Landroidx/camera/video/internal/encoder/Encoder;->getInput()Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    move-result-object v7

    .line 1588
    .local v7, "bufferProvider":Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;
    instance-of v8, v7, Landroidx/camera/video/internal/encoder/Encoder$ByteBufferInput;

    if-eqz v8, :cond_2

    .line 1591
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    move-object v9, v7

    check-cast v9, Landroidx/camera/video/internal/encoder/Encoder$ByteBufferInput;

    invoke-virtual {v8, v9}, Landroidx/camera/video/internal/audio/AudioSource;->setBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V

    .line 1592
    return-void

    .line 1589
    :cond_2
    new-instance v8, Ljava/lang/AssertionError;

    const-string v9, "The EncoderInput of audio isn\'t a ByteBufferInput."

    invoke-direct {v8, v9}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v8
.end method

.method private setupAudioSource(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/camera/video/internal/audio/AudioSettings;)Landroidx/camera/video/internal/audio/AudioSource;
    .locals 1
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "audioSettings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioSourceAccessException;
        }
    .end annotation

    .line 1598
    sget-object v0, Landroidx/camera/video/Recorder;->AUDIO_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p1, p2, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->performOneTimeAudioSourceCreation(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;)Landroidx/camera/video/internal/audio/AudioSource;

    move-result-object v0

    return-object v0
.end method

.method private startInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 11
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1784
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v0, :cond_a

    .line 1788
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1790
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mOutputStorageFactory:Landroidx/camera/video/internal/OutputStorage$Factory;

    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    invoke-interface {v0, v1}, Landroidx/camera/video/internal/OutputStorage$Factory;->create(Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/internal/OutputStorage;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    .line 1791
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    invoke-interface {v0}, Landroidx/camera/video/internal/OutputStorage;->getAvailableBytes()J

    move-result-wide v0

    .line 1792
    .local v0, "availableBytes":J
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "availableBytes = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0, v1}, Landroidx/camera/video/internal/utils/StorageUtil;->formatSize(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Recorder"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1793
    iget-wide v4, p0, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    cmp-long v2, v0, v4

    const/4 v4, 0x0

    if-gez v2, :cond_0

    .line 1794
    new-instance v2, Ljava/io/IOException;

    .line 1795
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-wide v5, p0, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    .line 1796
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v3, v6, v4

    const/4 v3, 0x1

    aput-object v5, v6, v3

    .line 1795
    const-string v3, "Insufficient storage space. The available storage (%d bytes) is below the required threshold of %d bytes."

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 1794
    const/4 v3, 0x3

    invoke-virtual {p0, v3, v2}, Landroidx/camera/video/Recorder;->finalizeInProgressRecording(ILjava/lang/Throwable;)V

    .line 1797
    return-void

    .line 1799
    :cond_0
    iget-wide v5, p0, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    sub-long v5, v0, v5

    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mAvailableBytesAboveRequired:J

    .line 1801
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/video/OutputOptions;->getFileSizeLimit()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v2, v5, v7

    if-lez v2, :cond_1

    .line 1804
    nop

    .line 1805
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/video/OutputOptions;->getFileSizeLimit()J

    move-result-wide v5

    long-to-double v5, v5

    const-wide v9, 0x3fee666666666666L    # 0.95

    mul-double/2addr v5, v9

    .line 1804
    invoke-static {v5, v6}, Ljava/lang/Math;->round(D)J

    move-result-wide v5

    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 1806
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "File size limit in bytes: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v5, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1808
    :cond_1
    iput-wide v7, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 1811
    :goto_0
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/video/OutputOptions;->getDurationLimitMillis()J

    move-result-wide v5

    cmp-long v2, v5, v7

    if-lez v2, :cond_2

    .line 1812
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 1813
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/camera/video/OutputOptions;->getDurationLimitMillis()J

    move-result-wide v5

    .line 1812
    invoke-virtual {v2, v5, v6}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v5

    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    .line 1814
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Duration limit in nanoseconds: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v5, p0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1816
    :cond_2
    iput-wide v7, p0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    .line 1820
    :goto_1
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$AudioState;->ordinal()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_5

    .line 1828
    :pswitch_0
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Incorrectly invoke startInternal in audio state "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 1831
    :pswitch_1
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v2, Landroidx/camera/video/Recorder$AudioState;->ENABLED:Landroidx/camera/video/Recorder$AudioState;

    goto :goto_2

    .line 1832
    :cond_3
    sget-object v2, Landroidx/camera/video/Recorder$AudioState;->DISABLED:Landroidx/camera/video/Recorder$AudioState;

    .line 1831
    :goto_2
    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 1833
    goto :goto_5

    .line 1835
    :pswitch_2
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1836
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioSupported()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1841
    :try_start_0
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$RecordingRecord;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-nez v2, :cond_5

    .line 1842
    :cond_4
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->setupAudio(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 1844
    :cond_5
    sget-object v2, Landroidx/camera/video/Recorder$AudioState;->ENABLED:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V
    :try_end_0
    .catch Landroidx/camera/video/internal/audio/AudioSourceAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroidx/camera/video/internal/encoder/InvalidConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1855
    goto :goto_5

    .line 1845
    :catch_0
    move-exception v2

    goto :goto_3

    :catch_1
    move-exception v2

    .line 1846
    .local v2, "e":Ljava/lang/Exception;
    :goto_3
    const-string v5, "Unable to create audio resource with error: "

    invoke-static {v3, v5, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1848
    instance-of v3, v2, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    if-eqz v3, :cond_6

    .line 1849
    sget-object v3, Landroidx/camera/video/Recorder$AudioState;->ERROR_ENCODER:Landroidx/camera/video/Recorder$AudioState;

    .local v3, "audioState":Landroidx/camera/video/Recorder$AudioState;
    goto :goto_4

    .line 1851
    .end local v3    # "audioState":Landroidx/camera/video/Recorder$AudioState;
    :cond_6
    sget-object v3, Landroidx/camera/video/Recorder$AudioState;->ERROR_SOURCE:Landroidx/camera/video/Recorder$AudioState;

    .line 1853
    .restart local v3    # "audioState":Landroidx/camera/video/Recorder$AudioState;
    :goto_4
    invoke-virtual {p0, v3}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 1854
    iput-object v2, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    goto :goto_5

    .line 1837
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "audioState":Landroidx/camera/video/Recorder$AudioState;
    :cond_7
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "The Recorder doesn\'t support recording with audio"

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 1860
    :cond_8
    :goto_5
    invoke-direct {p0, p1, v4}, Landroidx/camera/video/Recorder;->updateEncoderCallbacks(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    .line 1861
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1862
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->isMuted()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroidx/camera/video/internal/audio/AudioSource;->start(Z)V

    .line 1863
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 1865
    :cond_9
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 1867
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1868
    invoke-virtual {v3}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v3

    .line 1869
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v4

    .line 1867
    invoke-static {v3, v4}, Landroidx/camera/video/VideoRecordEvent;->start(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Start;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 1870
    return-void

    .line 1785
    .end local v0    # "availableBytes":J
    :cond_a
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Attempted to start a new recording while another was in progress."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private startRecording(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
    .locals 0
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "startRecordingPaused"    # Z

    .line 2878
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->startInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 2879
    if-eqz p2, :cond_0

    .line 2880
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->pauseInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 2882
    :cond_0
    return-void
.end method

.method private static supportedMuxerFormatOrDefaultFrom(Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;I)I
    .locals 3
    .param p0, "profilesProxy"    # Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .param p1, "defaultMuxerFormat"    # I

    .line 3048
    if-eqz p0, :cond_1

    .line 3049
    invoke-virtual {p0}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getRecommendedFileFormat()I

    move-result v0

    const/4 v1, 0x0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 3053
    :sswitch_0
    const/4 v0, 0x1

    return v0

    .line 3051
    :sswitch_1
    return v1

    .line 3055
    :sswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v0, v2, :cond_0

    .line 3057
    return v1

    .line 3059
    :cond_0
    const/4 v0, 0x2

    return v0

    .line 3065
    :cond_1
    :goto_0
    return p1

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0x2 -> :sswitch_1
        0x9 -> :sswitch_0
    .end sparse-switch
.end method

.method private tryReleaseVideoEncoder()V
    .locals 2

    .line 2406
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    if-eqz v0, :cond_1

    .line 2407
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    .line 2408
    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession;->getVideoEncoder()Landroidx/camera/video/internal/encoder/Encoder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2407
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 2410
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Releasing video encoder: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2411
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession;->terminateNow()V

    .line 2412
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    .line 2413
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 2414
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 2415
    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setLatestSurface(Landroid/view/Surface;)V

    goto :goto_1

    .line 2417
    :cond_1
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->safeToCloseVideoEncoder()Lcom/google/common/util/concurrent/ListenableFuture;

    .line 2419
    :goto_1
    return-void
.end method

.method private updateEncoderCallbacks(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
    .locals 3
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "videoOnly"    # Z

    .line 1876
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1877
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->allAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 1878
    .local v0, "listFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/util/List<Ljava/lang/Void;>;>;"
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1879
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 1881
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 1884
    .end local v0    # "listFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/util/List<Ljava/lang/Void;>;>;"
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1979
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p2, :cond_2

    .line 1980
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2100
    :cond_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->allAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/video/Recorder$6;

    invoke-direct {v1, p0}, Landroidx/camera/video/Recorder$6;-><init>(Landroidx/camera/video/Recorder;)V

    .line 2124
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 2100
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 2125
    return-void
.end method

.method private updateNonPendingState(Landroidx/camera/video/Recorder$State;)V
    .locals 4
    .param p1, "state"    # Landroidx/camera/video/Recorder$State;

    .line 3000
    sget-object v0, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3005
    sget-object v0, Landroidx/camera/video/Recorder;->VALID_NON_PENDING_STATES_WHILE_PENDING:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3011
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    if-eq v0, p1, :cond_0

    .line 3012
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    .line 3013
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    iget v1, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    invoke-static {v1, v2, v3}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)Landroidx/camera/video/StreamInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 3016
    :cond_0
    return-void

    .line 3006
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid state transition. State is not a valid non-pending state while in a pending state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 3001
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can only updated non-pending state from a pending state, but state is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method finalizeInProgressRecording(ILjava/lang/Throwable;)V
    .locals 10
    .param p1, "error"    # I
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .line 2520
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_6

    .line 2525
    move v0, p1

    .line 2526
    .local v0, "errorToSend":I
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    if-eqz v1, :cond_3

    .line 2528
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Landroid/media/MediaMuxer;->stop()V

    .line 2529
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Landroid/media/MediaMuxer;->release()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2543
    goto :goto_0

    .line 2530
    :catch_0
    move-exception v1

    .line 2531
    .local v1, "e":Ljava/lang/IllegalStateException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MediaMuxer failed to stop or release with error: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Recorder"

    invoke-static {v6, v5, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2533
    if-nez v0, :cond_2

    .line 2534
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    invoke-static {v5}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/video/internal/OutputStorage;

    invoke-interface {v5}, Landroidx/camera/video/internal/OutputStorage;->getAvailableBytes()J

    move-result-wide v5

    .line 2535
    .local v5, "availableBytes":J
    iget-wide v7, p0, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    cmp-long v7, v5, v7

    if-gez v7, :cond_0

    .line 2536
    const/4 v0, 0x3

    goto :goto_0

    .line 2537
    :cond_0
    iget-wide v7, p0, Landroidx/camera/video/Recorder;->mRecordingAudioBytes:J

    cmp-long v7, v7, v2

    if-nez v7, :cond_1

    .line 2538
    const/16 v0, 0x8

    goto :goto_0

    .line 2540
    :cond_1
    const/4 v0, 0x1

    .line 2544
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    .end local v5    # "availableBytes":J
    :cond_2
    :goto_0
    iput-object v4, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    goto :goto_1

    .line 2545
    :cond_3
    if-nez v0, :cond_4

    .line 2547
    const/16 v0, 0x8

    .line 2550
    :cond_4
    :goto_1
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v5, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    invoke-virtual {v1, v5}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecording(Landroid/net/Uri;)V

    .line 2552
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 2553
    .local v1, "outputOptions":Landroidx/camera/video/OutputOptions;
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v5

    .line 2554
    .local v5, "stats":Landroidx/camera/video/RecordingStats;
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    invoke-static {v6}, Landroidx/camera/video/OutputResults;->of(Landroid/net/Uri;)Landroidx/camera/video/OutputResults;

    move-result-object v6

    .line 2555
    .local v6, "outputResults":Landroidx/camera/video/OutputResults;
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v0, :cond_5

    .line 2556
    invoke-static {v1, v5, v6}, Landroidx/camera/video/VideoRecordEvent;->finalize(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;Landroidx/camera/video/OutputResults;)Landroidx/camera/video/VideoRecordEvent$Finalize;

    move-result-object v8

    goto :goto_2

    .line 2560
    :cond_5
    invoke-static {v1, v5, v6, v0, p2}, Landroidx/camera/video/VideoRecordEvent;->finalizeWithError(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;Landroidx/camera/video/OutputResults;ILjava/lang/Throwable;)Landroidx/camera/video/VideoRecordEvent$Finalize;

    move-result-object v8

    .line 2555
    :goto_2
    invoke-virtual {v7, v8}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 2567
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2568
    .local v7, "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    iput-object v4, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2569
    const/4 v8, 0x0

    iput-boolean v8, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    .line 2570
    iput-object v4, p0, Landroidx/camera/video/Recorder;->mAudioTrackIndex:Ljava/lang/Integer;

    .line 2571
    iput-object v4, p0, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    .line 2572
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->clear()V

    .line 2573
    sget-object v8, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    iput-object v8, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    .line 2574
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    .line 2575
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mRecordingAudioBytes:J

    .line 2576
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mRecordingDurationNs:J

    .line 2577
    const-wide v2, 0x7fffffffffffffffL

    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    .line 2578
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 2579
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    .line 2580
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    .line 2581
    const/4 v8, 0x1

    iput v8, p0, Landroidx/camera/video/Recorder;->mRecordingStopError:I

    .line 2582
    iput-object v4, p0, Landroidx/camera/video/Recorder;->mRecordingStopErrorCause:Ljava/lang/Throwable;

    .line 2583
    iput-object v4, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    .line 2584
    const-wide/16 v8, 0x0

    iput-wide v8, p0, Landroidx/camera/video/Recorder;->mAudioAmplitude:D

    .line 2585
    iput-object v4, p0, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    .line 2586
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mAvailableBytesAboveRequired:J

    .line 2587
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->clearPendingAudioRingBuffer()V

    .line 2588
    invoke-virtual {p0, v4}, Landroidx/camera/video/Recorder;->setInProgressTransformationInfo(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V

    .line 2590
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$AudioState;->ordinal()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_3

    .line 2608
    :pswitch_0
    sget-object v2, Landroidx/camera/video/Recorder$AudioState;->INITIALIZING:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    goto :goto_3

    .line 2600
    :pswitch_1
    sget-object v2, Landroidx/camera/video/Recorder$AudioState;->IDLING:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 2601
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    invoke-virtual {v2}, Landroidx/camera/video/internal/audio/AudioSource;->stop()V

    .line 2602
    goto :goto_3

    .line 2593
    :pswitch_2
    goto :goto_3

    .line 2596
    :pswitch_3
    nop

    .line 2612
    :goto_3
    invoke-direct {p0, v7}, Landroidx/camera/video/Recorder;->onRecordingFinalized(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 2613
    return-void

    .line 2521
    .end local v0    # "errorToSend":I
    .end local v1    # "outputOptions":Landroidx/camera/video/OutputOptions;
    .end local v5    # "stats":Landroidx/camera/video/RecordingStats;
    .end local v6    # "outputResults":Landroidx/camera/video/OutputResults;
    .end local v7    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    :cond_6
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Attempted to finalize in-progress recording, but no recording is in progress."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getAspectRatio()I
    .locals 1

    .line 819
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getAspectRatio()I

    move-result v0

    return v0
.end method

.method public getAudioSource()I
    .locals 1

    .line 740
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/AudioSpec;->getSource()I

    move-result v0

    return v0
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 750
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mUserProvidedExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;
    .locals 11

    .line 2899
    iget-wide v0, p0, Landroidx/camera/video/Recorder;->mRecordingDurationNs:J

    iget-wide v2, p0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    .line 2900
    invoke-direct {p0, v4}, Landroidx/camera/video/Recorder;->internalAudioStateToAudioStatsState(Landroidx/camera/video/Recorder$AudioState;)I

    move-result v5

    iget-object v6, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    iget-wide v7, p0, Landroidx/camera/video/Recorder;->mAudioAmplitude:D

    iget-wide v9, p0, Landroidx/camera/video/Recorder;->mRecordingAudioBytes:J

    invoke-static/range {v5 .. v10}, Landroidx/camera/video/AudioStats;->of(ILjava/lang/Throwable;DJ)Landroidx/camera/video/AudioStats;

    move-result-object v4

    .line 2899
    invoke-static {v0, v1, v2, v3, v4}, Landroidx/camera/video/RecordingStats;->of(JJLandroidx/camera/video/AudioStats;)Landroidx/camera/video/RecordingStats;

    move-result-object v0

    return-object v0
.end method

.method public getMediaCapabilities(Landroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;
    .locals 2
    .param p1, "cameraInfo"    # Landroidx/camera/core/CameraInfo;
    .param p2, "sessionType"    # I

    .line 606
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 607
    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    nop

    .line 608
    .local v0, "videoCaptureType":I
    :goto_0
    iget v1, p0, Landroidx/camera/video/Recorder;->mVideoCapabilitiesSource:I

    invoke-static {v0, p1, v1}, Landroidx/camera/video/Recorder;->getVideoCapabilitiesInternal(ILandroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;

    move-result-object v1

    return-object v1
.end method

.method public getMediaSpec()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Landroidx/camera/video/MediaSpec;",
            ">;"
        }
    .end annotation

    .line 581
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    return-object v0
.end method

.method getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/camera/core/impl/StateObservable<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 2906
    .local p1, "observable":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    invoke-virtual {p1}, Landroidx/camera/core/impl/StateObservable;->fetchData()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 2910
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<TT;>;"
    :try_start_0
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 2911
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 2912
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getQualitySelector()Landroidx/camera/video/QualitySelector;
    .locals 1

    .line 715
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getQualitySelector()Landroidx/camera/video/QualitySelector;

    move-result-object v0

    return-object v0
.end method

.method public getStreamInfo()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Landroidx/camera/video/StreamInfo;",
            ">;"
        }
    .end annotation

    .line 587
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    return-object v0
.end method

.method public getTargetVideoEncodingBitRate()I
    .locals 1

    .line 761
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getBitrate()Landroid/util/Range;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getVideoCapabilitiesSource()I
    .locals 1

    .line 727
    iget v0, p0, Landroidx/camera/video/Recorder;->mVideoCapabilitiesSource:I

    return v0
.end method

.method public getVideoEncoderBitrateRange()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 768
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderBitrateRange:Landroidx/camera/core/impl/MutableStateObservable;

    return-object v0
.end method

.method public getVideoEncodingFrameRate()I
    .locals 1

    .line 780
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getEncodeFrameRate()I

    move-result v0

    return v0
.end method

.method isAudioEnabled()Z
    .locals 2

    .line 2514
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    sget-object v1, Landroidx/camera/video/Recorder$AudioState;->ENABLED:Landroidx/camera/video/Recorder$AudioState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isAudioSupported()Z
    .locals 1

    .line 2917
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/AudioSpec;->getChannelCount()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isPersistentRecordingInProgress()Z
    .locals 1

    .line 1392
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$RecordingRecord;->isPersistent()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSourceStreamRequired()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 593
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mIsRecording:Landroidx/camera/core/impl/MutableStateObservable;

    return-object v0
.end method

.method synthetic lambda$configureInternal$8$androidx-camera-video-Recorder(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V
    .locals 0
    .param p1, "transformationInfo"    # Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 1253
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mSourceTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    return-void
.end method

.method synthetic lambda$mute$7$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
    .locals 0
    .param p1, "finalRecordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "muted"    # Z

    .line 1101
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->muteInternal(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    return-void
.end method

.method synthetic lambda$onSourceStateChanged$1$androidx-camera-video-Recorder(Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 0
    .param p1, "newState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 599
    invoke-virtual {p0, p1}, Landroidx/camera/video/Recorder;->onSourceStateChangedInternal(Landroidx/camera/video/VideoOutput$SourceState;)V

    return-void
.end method

.method synthetic lambda$onSurfaceRequested$0$androidx-camera-video-Recorder(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V
    .locals 0
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;
    .param p3, "hasGlProcessing"    # Z

    .line 575
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/video/Recorder;->onSurfaceRequestedInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V

    return-void
.end method

.method synthetic lambda$pause$4$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 0
    .param p1, "finalActiveRecordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 955
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->pauseInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V

    return-void
.end method

.method synthetic lambda$resume$5$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 0
    .param p1, "finalActiveRecordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1011
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->resumeInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V

    return-void
.end method

.method synthetic lambda$setupAndStartMediaMuxer$10$androidx-camera-video-Recorder(Landroid/net/Uri;)V
    .locals 0
    .param p1, "uri"    # Landroid/net/Uri;

    .line 1710
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    return-void
.end method

.method synthetic lambda$start$3$androidx-camera-video-Recorder()V
    .locals 3

    .line 894
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    .line 899
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/video/Recorder;->configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V

    .line 901
    return-void

    .line 895
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "surface request is required to retry initialization."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method synthetic lambda$stop$6$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V
    .locals 0
    .param p1, "finalActiveRecordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "explicitlyStopTimeUs"    # J
    .param p4, "error"    # I
    .param p5, "errorCause"    # Ljava/lang/Throwable;

    .line 1066
    invoke-virtual/range {p0 .. p5}, Landroidx/camera/video/Recorder;->stopInternal(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V

    return-void
.end method

.method synthetic lambda$updateEncoderCallbacks$11$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 3
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1886
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    new-instance v1, Landroidx/camera/video/Recorder$3;

    invoke-direct {v1, p0, p2, p1}, Landroidx/camera/video/Recorder$3;-><init>(Landroidx/camera/video/Recorder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/video/Recorder$RecordingRecord;)V

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, v1, v2}, Landroidx/camera/video/internal/encoder/Encoder;->setEncoderCallback(Landroidx/camera/video/internal/encoder/EncoderCallback;Ljava/util/concurrent/Executor;)V

    .line 1976
    const-string/jumbo v0, "videoEncodingFuture"

    return-object v0
.end method

.method synthetic lambda$updateEncoderCallbacks$12$androidx-camera-video-Recorder(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .line 1983
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    if-nez v0, :cond_1

    .line 1987
    instance-of v0, p2, Landroidx/camera/video/internal/encoder/EncodeException;

    if-eqz v0, :cond_0

    .line 1988
    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->ERROR_ENCODER:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    goto :goto_0

    .line 1990
    :cond_0
    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->ERROR_SOURCE:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 1992
    :goto_0
    iput-object p2, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    .line 1993
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->updateInProgressStatusEvent(Z)V

    .line 1994
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 1996
    :cond_1
    return-void
.end method

.method synthetic lambda$updateEncoderCallbacks$13$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 4
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1982
    new-instance v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/Recorder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 1998
    .local v0, "audioErrorConsumer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/Recorder$4;

    invoke-direct {v3, p0, v0}, Landroidx/camera/video/Recorder$4;-><init>(Landroidx/camera/video/Recorder;Landroidx/core/util/Consumer;)V

    invoke-virtual {v1, v2, v3}, Landroidx/camera/video/internal/audio/AudioSource;->setAudioSourceCallback(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;)V

    .line 2026
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    new-instance v2, Landroidx/camera/video/Recorder$5;

    invoke-direct {v2, p0, p2, v0, p1}, Landroidx/camera/video/Recorder$5;-><init>(Landroidx/camera/video/Recorder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/core/util/Consumer;Landroidx/camera/video/Recorder$RecordingRecord;)V

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v2, v3}, Landroidx/camera/video/internal/encoder/Encoder;->setEncoderCallback(Landroidx/camera/video/internal/encoder/EncoderCallback;Ljava/util/concurrent/Executor;)V

    .line 2096
    const-string v1, "audioEncodingFuture"

    return-object v1
.end method

.method mute(Landroidx/camera/video/Recording;Z)V
    .locals 4
    .param p1, "activeRecording"    # Landroidx/camera/video/Recording;
    .param p2, "muted"    # Z

    .line 1088
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1089
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1094
    const-string v1, "Recorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mute() called on a recording that is no longer active: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1096
    invoke-virtual {p1}, Landroidx/camera/video/Recording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1094
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1097
    monitor-exit v0

    return-void

    .line 1099
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1100
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1101
    .local v1, "finalRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    :goto_0
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;

    invoke-direct {v3, p0, v1, p2}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1102
    .end local v1    # "finalRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    monitor-exit v0

    .line 1103
    return-void

    .line 1102
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onConfigured()V
    .locals 10

    .line 1444
    const/4 v0, 0x0

    .line 1445
    .local v0, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v1, 0x0

    .line 1446
    .local v1, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v2, 0x0

    .line 1447
    .local v2, "continuePersistentRecording":Z
    const/4 v3, 0x0

    .line 1448
    .local v3, "error":I
    const/4 v4, 0x0

    .line 1449
    .local v4, "errorCause":Ljava/lang/Throwable;
    const/4 v5, 0x0

    .line 1450
    .local v5, "recordingPaused":Z
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1451
    :try_start_0
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v7}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    goto :goto_0

    .line 1476
    :pswitch_0
    const-string v7, "Recorder"

    const-string v8, "onConfigured() was invoked when the Recorder had encountered error"

    invoke-static {v7, v8}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1478
    goto :goto_0

    .line 1458
    :pswitch_1
    iget-boolean v7, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    if-eqz v7, :cond_0

    goto :goto_0

    .line 1459
    :cond_0
    new-instance v7, Ljava/lang/AssertionError;

    const-string v8, "Unexpectedly invoke onConfigured() in a STOPPING state when it\'s not waiting for a new surface."

    invoke-direct {v7, v8}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v2    # "continuePersistentRecording":Z
    .end local v3    # "error":I
    .end local v4    # "errorCause":Ljava/lang/Throwable;
    .end local v5    # "recordingPaused":Z
    throw v7

    .line 1464
    .restart local v0    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v2    # "continuePersistentRecording":Z
    .restart local v3    # "error":I
    .restart local v4    # "errorCause":Ljava/lang/Throwable;
    .restart local v5    # "recordingPaused":Z
    :pswitch_2
    const/4 v5, 0x1

    .line 1467
    :pswitch_3
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isPersistentRecordingInProgress()Z

    move-result v7

    const-string v8, "Unexpectedly invoke onConfigured() when there\'s a non-persistent in-progress recording"

    invoke-static {v7, v8}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1470
    const/4 v2, 0x1

    .line 1471
    goto :goto_0

    .line 1455
    :pswitch_4
    new-instance v7, Ljava/lang/AssertionError;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Incorrectly invoke onConfigured() in state "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v2    # "continuePersistentRecording":Z
    .end local v3    # "error":I
    .end local v4    # "errorCause":Ljava/lang/Throwable;
    .end local v5    # "recordingPaused":Z
    throw v7

    .line 1480
    .restart local v0    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v2    # "continuePersistentRecording":Z
    .restart local v3    # "error":I
    .restart local v4    # "errorCause":Ljava/lang/Throwable;
    .restart local v5    # "recordingPaused":Z
    :pswitch_5
    const/4 v5, 0x1

    .line 1483
    :pswitch_6
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v7, :cond_1

    .line 1486
    goto :goto_0

    .line 1488
    :cond_1
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v8, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne v7, v8, :cond_2

    .line 1489
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v1, v7

    .line 1490
    const/4 v7, 0x0

    iput-object v7, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1491
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->restoreNonPendingState()V

    .line 1492
    const/4 v3, 0x4

    .line 1493
    sget-object v7, Landroidx/camera/video/Recorder;->PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

    move-object v4, v7

    goto :goto_0

    .line 1495
    :cond_2
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v7}, Landroidx/camera/video/Recorder;->makePendingRecordingActiveLocked(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v7

    move-object v0, v7

    goto :goto_0

    .line 1473
    :pswitch_7
    sget-object v7, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1474
    nop

    .line 1499
    :goto_0
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1501
    if-eqz v2, :cond_4

    .line 1502
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    const/4 v7, 0x1

    invoke-direct {p0, v6, v7}, Landroidx/camera/video/Recorder;->updateEncoderCallbacks(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    .line 1503
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v6}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 1504
    iget-boolean v6, p0, Landroidx/camera/video/Recorder;->mShouldSendResumeEvent:Z

    if-eqz v6, :cond_3

    .line 1505
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v7, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1506
    invoke-virtual {v7}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v7

    .line 1507
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v8

    .line 1505
    invoke-static {v7, v8}, Landroidx/camera/video/VideoRecordEvent;->resume(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Resume;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 1508
    const/4 v6, 0x0

    iput-boolean v6, p0, Landroidx/camera/video/Recorder;->mShouldSendResumeEvent:Z

    .line 1510
    :cond_3
    if-eqz v5, :cond_6

    .line 1511
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v6}, Landroidx/camera/video/internal/encoder/Encoder;->pause()V

    goto :goto_1

    .line 1513
    :cond_4
    if-eqz v0, :cond_5

    .line 1515
    invoke-direct {p0, v0, v5}, Landroidx/camera/video/Recorder;->startRecording(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    goto :goto_1

    .line 1516
    :cond_5
    if-eqz v1, :cond_6

    .line 1517
    invoke-direct {p0, v1, v3, v4}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1519
    :cond_6
    :goto_1
    return-void

    .line 1499
    :catchall_0
    move-exception v7

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_0
    .end packed-switch
.end method

.method onEncoderSetupError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "cause"    # Ljava/lang/Throwable;

    .line 1627
    const/4 v0, 0x0

    .line 1628
    .local v0, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1629
    :try_start_0
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 1642
    :pswitch_0
    goto :goto_0

    .line 1652
    :pswitch_1
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Encountered encoder setup error while in unexpected state "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p1    # "cause":Ljava/lang/Throwable;
    throw v2

    .line 1633
    .restart local v0    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p1    # "cause":Ljava/lang/Throwable;
    :pswitch_2
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v0, v2

    .line 1634
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1637
    :pswitch_3
    const/4 v2, -0x1

    invoke-direct {p0, v2}, Landroidx/camera/video/Recorder;->setStreamId(I)V

    .line 1638
    sget-object v2, Landroidx/camera/video/Recorder$State;->ERROR:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1639
    nop

    .line 1655
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1657
    if-eqz v0, :cond_0

    .line 1658
    const/4 v1, 0x7

    invoke-direct {p0, v0, v1, p1}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1660
    :cond_0
    return-void

    .line 1655
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    .locals 9
    .param p1, "recording"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "error"    # I
    .param p3, "cause"    # Ljava/lang/Throwable;

    .line 2717
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne p1, v0, :cond_2

    .line 2722
    const/4 v1, 0x0

    .line 2723
    .local v1, "needsStop":Z
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2724
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 2728
    :pswitch_0
    :try_start_1
    sget-object v0, Landroidx/camera/video/Recorder$State;->STOPPING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2729
    const/4 v0, 0x1

    move v1, v0

    .line 2739
    :pswitch_1
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 2740
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v3, "Internal error occurred for recording but it is not the active recording."

    invoke-direct {v0, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v1    # "needsStop":Z
    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    throw v0

    .line 2752
    .restart local v1    # "needsStop":Z
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :catchall_0
    move-exception v0

    move-object v4, p1

    move v7, p2

    move-object v8, p3

    goto :goto_2

    .line 2749
    :pswitch_2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "In-progress recording error occurred while in unexpected state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v1    # "needsStop":Z
    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2752
    .restart local v1    # "needsStop":Z
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :goto_0
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2754
    if-eqz v1, :cond_1

    .line 2755
    const-wide/16 v5, -0x1

    move-object v3, p0

    move-object v4, p1

    move v7, p2

    move-object v8, p3

    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    .local v4, "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .local v7, "error":I
    .local v8, "cause":Ljava/lang/Throwable;
    invoke-virtual/range {v3 .. v8}, Landroidx/camera/video/Recorder;->stopInternal(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V

    goto :goto_1

    .line 2754
    .end local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v7    # "error":I
    .end local v8    # "cause":Ljava/lang/Throwable;
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :cond_1
    move-object v4, p1

    move v7, p2

    move-object v8, p3

    .line 2757
    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    .restart local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v7    # "error":I
    .restart local v8    # "cause":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 2752
    .end local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v7    # "error":I
    .end local v8    # "cause":Ljava/lang/Throwable;
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :catchall_1
    move-exception v0

    move-object v4, p1

    move v7, p2

    move-object v8, p3

    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    .restart local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v7    # "error":I
    .restart local v8    # "cause":Ljava/lang/Throwable;
    :goto_2
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_2

    .line 2718
    .end local v1    # "needsStop":Z
    .end local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v7    # "error":I
    .end local v8    # "cause":Ljava/lang/Throwable;
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :cond_2
    move-object v4, p1

    move v7, p2

    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .restart local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v7    # "error":I
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "Internal error occurred on recording that is not the current in-progress recording."

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onSourceStateChanged(Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 2
    .param p1, "newState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 599
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/VideoOutput$SourceState;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 600
    return-void
.end method

.method onSourceStateChangedInternal(Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 5
    .param p1, "newState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 1132
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 1133
    .local v0, "oldState":Landroidx/camera/video/VideoOutput$SourceState;
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 1134
    const-string v1, "Recorder"

    if-eq v0, p1, :cond_4

    .line 1135
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Video source has transitioned to state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1141
    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    const/4 v2, 0x0

    if-ne p1, v1, :cond_2

    .line 1142
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    const/4 v3, 0x4

    const/4 v4, 0x0

    if-nez v1, :cond_1

    .line 1143
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

    if-eqz v1, :cond_0

    .line 1144
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

    invoke-virtual {v1}, Landroidx/camera/video/Recorder$SetupVideoTask;->cancelFailedRetry()V

    .line 1145
    iput-object v4, p0, Landroidx/camera/video/Recorder;->mSetupVideoTask:Landroidx/camera/video/Recorder$SetupVideoTask;

    .line 1150
    :cond_0
    invoke-virtual {p0, v3, v4, v2}, Landroidx/camera/video/Recorder;->requestReset(ILjava/lang/Throwable;Z)V

    goto :goto_0

    .line 1155
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    .line 1156
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->isPersistent()Z

    move-result v1

    if-nez v1, :cond_3

    .line 1159
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {p0, v1, v3, v4}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    goto :goto_0

    .line 1163
    :cond_2
    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->ACTIVE_NON_STREAMING:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne p1, v1, :cond_3

    .line 1165
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v1, :cond_3

    .line 1167
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-static {v1}, Landroidx/camera/video/Recorder;->notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V

    .line 1170
    :cond_3
    :goto_0
    return-void

    .line 1137
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Video source transitions to the same state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1138
    return-void
.end method

.method public onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;)V
    .locals 2
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;

    .line 560
    sget-object v0, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Landroidx/camera/video/Recorder;->onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V

    .line 561
    return-void
.end method

.method public onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V
    .locals 4
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;
    .param p3, "hasGlProcessing"    # Z

    .line 567
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 568
    :try_start_0
    const-string v1, "Recorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Surface is requested in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", Current surface: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 570
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    sget-object v2, Landroidx/camera/video/Recorder$State;->ERROR:Landroidx/camera/video/Recorder$State;

    if-ne v1, v2, :cond_0

    .line 571
    sget-object v1, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 573
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 574
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0, p1, p2, p3}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda15;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 576
    return-void

    .line 573
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method onVideoEncoderReady(Landroidx/camera/video/VideoEncoderSession;)V
    .locals 3
    .param p1, "videoEncoderSession"    # Landroidx/camera/video/VideoEncoderSession;

    .line 1404
    invoke-virtual {p1}, Landroidx/camera/video/VideoEncoderSession;->getVideoEncoder()Landroidx/camera/video/internal/encoder/Encoder;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/encoder/Encoder;

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 1405
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderBitrateRange:Landroidx/camera/core/impl/MutableStateObservable;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 1406
    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/Encoder;->getEncoderInfo()Landroidx/camera/video/internal/encoder/EncoderInfo;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedBitrateRange()Landroid/util/Range;

    move-result-object v1

    .line 1405
    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 1407
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->getConfiguredBitrate()I

    move-result v0

    iput v0, p0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoBitrate:I

    .line 1408
    invoke-virtual {p1}, Landroidx/camera/video/VideoEncoderSession;->getActiveSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    .line 1409
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setLatestSurface(Landroid/view/Surface;)V

    .line 1411
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;

    invoke-direct {v1, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-virtual {p1, v0, v1}, Landroidx/camera/video/VideoEncoderSession;->setOnSurfaceUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;)V

    .line 1413
    invoke-virtual {p1}, Landroidx/camera/video/VideoEncoderSession;->getReadyToReleaseFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/video/Recorder$1;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/Recorder$1;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/VideoEncoderSession;)V

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 1439
    return-void
.end method

.method pause(Landroidx/camera/video/Recording;)V
    .locals 4
    .param p1, "activeRecording"    # Landroidx/camera/video/Recording;

    .line 931
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 932
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 937
    const-string v1, "Recorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pause() called on a recording that is no longer active: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 939
    invoke-virtual {p1}, Landroidx/camera/video/Recording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 937
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 940
    monitor-exit v0

    return-void

    .line 943
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v1}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 966
    :pswitch_0
    goto :goto_0

    .line 953
    :pswitch_1
    sget-object v1, Landroidx/camera/video/Recorder$State;->PAUSED:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 954
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 955
    .local v1, "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda16;

    invoke-direct {v3, p0, v1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda16;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 956
    goto :goto_0

    .line 961
    .end local v1    # "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    :pswitch_2
    goto :goto_0

    .line 946
    :pswitch_3
    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_PAUSED:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 947
    goto :goto_0

    .line 951
    :pswitch_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Called pause() from invalid state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "activeRecording":Landroidx/camera/video/Recording;
    throw v1

    .line 972
    .restart local p1    # "activeRecording":Landroidx/camera/video/Recording;
    :goto_0
    monitor-exit v0

    .line 973
    return-void

    .line 972
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public prepareRecording(Landroid/content/Context;Landroidx/camera/video/FileDescriptorOutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileDescriptorOutputOptions"    # Landroidx/camera/video/FileDescriptorOutputOptions;

    .line 666
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 671
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->prepareRecordingInternal(Landroid/content/Context;Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v0

    return-object v0

    .line 667
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "File descriptors as output destinations are not supported on pre-Android O (API 26) devices."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public prepareRecording(Landroid/content/Context;Landroidx/camera/video/FileOutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileOutputOptions"    # Landroidx/camera/video/FileOutputOptions;

    .line 633
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->prepareRecordingInternal(Landroid/content/Context;Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v0

    return-object v0
.end method

.method public prepareRecording(Landroid/content/Context;Landroidx/camera/video/MediaStoreOutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mediaStoreOutputOptions"    # Landroidx/camera/video/MediaStoreOutputOptions;

    .line 697
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->prepareRecordingInternal(Landroid/content/Context;Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v0

    return-object v0
.end method

.method requestReset(ILjava/lang/Throwable;Z)V
    .locals 10
    .param p1, "errorCode"    # I
    .param p2, "errorCause"    # Ljava/lang/Throwable;
    .param p3, "videoOnly"    # Z

    .line 1184
    const/4 v1, 0x0

    .line 1185
    .local v1, "shouldReset":Z
    const/4 v2, 0x0

    .line 1186
    .local v2, "shouldStop":Z
    iget-object v3, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1187
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 1224
    :pswitch_1
    :try_start_1
    sget-object v0, Landroidx/camera/video/Recorder$State;->RESETTING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1225
    goto :goto_1

    .line 1205
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "In-progress recording shouldn\'t be null when in state "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1207
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, v4, :cond_2

    .line 1214
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isPersistentRecordingInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1215
    const/4 v1, 0x1

    goto :goto_1

    .line 1217
    :cond_1
    const/4 v2, 0x1

    .line 1218
    sget-object v0, Landroidx/camera/video/Recorder$State;->RESETTING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1220
    goto :goto_1

    .line 1208
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    const-string v4, "In-progress recording does not match the active recording. Unable to reset encoder."

    invoke-direct {v0, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v1    # "shouldReset":Z
    .end local v2    # "shouldStop":Z
    .end local p1    # "errorCode":I
    .end local p2    # "errorCause":Ljava/lang/Throwable;
    .end local p3    # "videoOnly":Z
    throw v0

    .line 1192
    .restart local v1    # "shouldReset":Z
    .restart local v2    # "shouldStop":Z
    .restart local p1    # "errorCode":I
    .restart local p2    # "errorCause":Ljava/lang/Throwable;
    .restart local p3    # "videoOnly":Z
    :pswitch_3
    const/4 v1, 0x1

    .line 1193
    sget-object v0, Landroidx/camera/video/Recorder$State;->RESETTING:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v0}, Landroidx/camera/video/Recorder;->updateNonPendingState(Landroidx/camera/video/Recorder$State;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1194
    goto :goto_1

    .line 1230
    :catchall_0
    move-exception v0

    move v8, p1

    move-object v9, p2

    goto :goto_3

    .line 1200
    :pswitch_4
    const/4 v1, 0x1

    .line 1201
    nop

    .line 1230
    :goto_1
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1234
    if-eqz v1, :cond_4

    .line 1235
    if-eqz p3, :cond_3

    .line 1236
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->resetVideo()V

    move v8, p1

    move-object v9, p2

    goto :goto_2

    .line 1238
    :cond_3
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->reset()V

    move v8, p1

    move-object v9, p2

    goto :goto_2

    .line 1240
    :cond_4
    if-eqz v2, :cond_5

    .line 1241
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    const-wide/16 v6, -0x1

    move-object v4, p0

    move v8, p1

    move-object v9, p2

    .end local p1    # "errorCode":I
    .end local p2    # "errorCause":Ljava/lang/Throwable;
    .local v8, "errorCode":I
    .local v9, "errorCause":Ljava/lang/Throwable;
    invoke-virtual/range {v4 .. v9}, Landroidx/camera/video/Recorder;->stopInternal(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V

    goto :goto_2

    .line 1240
    .end local v8    # "errorCode":I
    .end local v9    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "errorCode":I
    .restart local p2    # "errorCause":Ljava/lang/Throwable;
    :cond_5
    move v8, p1

    move-object v9, p2

    .line 1243
    .end local p1    # "errorCode":I
    .end local p2    # "errorCause":Ljava/lang/Throwable;
    .restart local v8    # "errorCode":I
    .restart local v9    # "errorCause":Ljava/lang/Throwable;
    :goto_2
    return-void

    .line 1230
    .end local v8    # "errorCode":I
    .end local v9    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "errorCode":I
    .restart local p2    # "errorCause":Ljava/lang/Throwable;
    :catchall_1
    move-exception v0

    move v8, p1

    move-object v9, p2

    .end local p1    # "errorCode":I
    .end local p2    # "errorCause":Ljava/lang/Throwable;
    .restart local v8    # "errorCode":I
    .restart local v9    # "errorCause":Ljava/lang/Throwable;
    :goto_3
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method resume(Landroidx/camera/video/Recording;)V
    .locals 4
    .param p1, "activeRecording"    # Landroidx/camera/video/Recording;

    .line 976
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 977
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 982
    const-string v1, "Recorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "resume() called on a recording that is no longer active: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 984
    invoke-virtual {p1}, Landroidx/camera/video/Recording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 982
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 985
    monitor-exit v0

    return-void

    .line 987
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v1}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 1009
    :pswitch_0
    sget-object v1, Landroidx/camera/video/Recorder$State;->RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1010
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1011
    .local v1, "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda7;

    invoke-direct {v3, p0, v1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1012
    goto :goto_0

    .line 990
    .end local v1    # "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    :pswitch_1
    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 991
    goto :goto_0

    .line 1007
    :pswitch_2
    goto :goto_0

    .line 996
    :pswitch_3
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Called resume() from invalid state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "activeRecording":Landroidx/camera/video/Recording;
    throw v1

    .line 1018
    .restart local p1    # "activeRecording":Landroidx/camera/video/Recording;
    :goto_0
    monitor-exit v0

    .line 1019
    return-void

    .line 1018
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method setAudioState(Landroidx/camera/video/Recorder$AudioState;)V
    .locals 2
    .param p1, "audioState"    # Landroidx/camera/video/Recorder$AudioState;

    .line 3036
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Transitioning audio state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3037
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    .line 3038
    return-void
.end method

.method setInProgressTransformationInfo(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V
    .locals 4
    .param p1, "transformationInfo"    # Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 2985
    const-string v0, "Recorder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Update stream transformation info: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2986
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 2987
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2988
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    iget v2, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v3}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v3

    invoke-static {v2, v3, p1}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)Landroidx/camera/video/StreamInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 2990
    monitor-exit v0

    .line 2991
    return-void

    .line 2990
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setLatestSurface(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    .line 2961
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurface:Landroid/view/Surface;

    if-ne v0, p1, :cond_0

    .line 2962
    return-void

    .line 2964
    :cond_0
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mLatestSurface:Landroid/view/Surface;

    .line 2965
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2966
    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    .line 2967
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 2966
    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->setStreamId(I)V

    .line 2967
    monitor-exit v0

    .line 2968
    return-void

    .line 2967
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setState(Landroidx/camera/video/Recorder$State;)V
    .locals 4
    .param p1, "state"    # Landroidx/camera/video/Recorder$State;

    .line 2926
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    if-eq v0, p1, :cond_4

    .line 2931
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Transitioning Recorder internal state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2935
    const/4 v0, 0x0

    .line 2936
    .local v0, "streamState":Landroidx/camera/video/StreamInfo$StreamState;
    sget-object v1, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2937
    sget-object v1, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 2938
    sget-object v1, Landroidx/camera/video/Recorder;->VALID_NON_PENDING_STATES_WHILE_PENDING:Ljava/util/Set;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2943
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    .line 2944
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v0

    goto :goto_0

    .line 2939
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid state transition. Should not be transitioning to a PENDING state from state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 2946
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    if-eqz v1, :cond_2

    .line 2948
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    .line 2951
    :cond_2
    :goto_0
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    .line 2952
    if-nez v0, :cond_3

    .line 2953
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v0

    .line 2955
    :cond_3
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    iget v2, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    invoke-static {v2, v0, v3}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)Landroidx/camera/video/StreamInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 2956
    return-void

    .line 2927
    .end local v0    # "streamState":Landroidx/camera/video/StreamInfo$StreamState;
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempted to transition to state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", but Recorder is already in state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public setVideoEncodingFrameRate(I)V
    .locals 3
    .param p1, "frameRate"    # I

    .line 806
    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "frameRate must be greater than 0."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 807
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v1}, Landroidx/camera/video/MediaSpec;->toBuilder()Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda5;

    invoke-direct {v2, p1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda5;-><init>(I)V

    invoke-virtual {v1, v2}, Landroidx/camera/video/MediaSpec$Builder;->configureVideo(Landroidx/core/util/Consumer;)Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v1

    .line 808
    invoke-virtual {v1}, Landroidx/camera/video/MediaSpec$Builder;->build()Landroidx/camera/video/MediaSpec;

    move-result-object v1

    .line 807
    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 809
    return-void
.end method

.method setupAndStartMediaMuxer(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 14
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1665
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    if-nez v0, :cond_12

    .line 1669
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v0}, Landroidx/camera/core/internal/utils/RingBuffer;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1670
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Audio is enabled but no audio sample is ready. Cannot start media muxer."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 1674
    :cond_1
    :goto_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    if-eqz v0, :cond_11

    .line 1679
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1680
    .local v0, "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1681
    nop

    .line 1682
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->getPresentationTimeUs()J

    move-result-wide v2

    .line 1681
    invoke-direct {p0, v2, v3}, Landroidx/camera/video/Recorder;->getAudioDataToWriteAndClearCache(J)Ljava/util/List;

    move-result-object v2

    .line 1686
    .local v2, "audioDataToWrite":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v3

    .line 1687
    .local v3, "firstDataSize":J
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1688
    .local v6, "data":Landroidx/camera/video/internal/encoder/EncodedData;
    invoke-interface {v6}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v7

    add-long/2addr v3, v7

    .line 1689
    .end local v6    # "data":Landroidx/camera/video/internal/encoder/EncodedData;
    goto :goto_1

    .line 1690
    :cond_2
    iget-wide v5, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    const/4 v6, 0x1

    if-eqz v5, :cond_4

    iget-wide v7, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    cmp-long v5, v3, v7

    if-lez v5, :cond_4

    .line 1692
    const-string v5, "Recorder"

    const-string v7, "Initial data exceeds file size limit %d > %d"

    .line 1693
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    iget-wide v9, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 1694
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const/4 v10, 0x2

    new-array v11, v10, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v8, v11, v12

    aput-object v9, v11, v6

    .line 1693
    invoke-static {v7, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1692
    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1695
    invoke-virtual {p0, p1, v10, v1}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1761
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1697
    :cond_3
    return-void

    .line 1702
    :cond_4
    const/4 v1, 0x3

    const/4 v5, 0x5

    :try_start_1
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/video/MediaSpec;

    .line 1704
    .local v7, "mediaSpec":Landroidx/camera/video/MediaSpec;
    invoke-virtual {v7}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_5

    .line 1705
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    sget-object v9, Landroidx/camera/video/Recorder;->MEDIA_SPEC_DEFAULT:Landroidx/camera/video/MediaSpec;

    .line 1707
    invoke-virtual {v9}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v9

    .line 1706
    invoke-static {v9}, Landroidx/camera/video/MediaSpec;->outputFormatToMuxerFormat(I)I

    move-result v9

    .line 1705
    invoke-static {v8, v9}, Landroidx/camera/video/Recorder;->supportedMuxerFormatOrDefaultFrom(Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;I)I

    move-result v8

    goto :goto_2

    .line 1708
    :cond_5
    invoke-virtual {v7}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v8

    invoke-static {v8}, Landroidx/camera/video/MediaSpec;->outputFormatToMuxerFormat(I)I

    move-result v8

    :goto_2
    nop

    .line 1709
    .local v8, "muxerOutputFormat":I
    new-instance v9, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda18;

    invoke-direct {v9, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda18;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-virtual {p1, v8, v9}, Landroidx/camera/video/Recorder$RecordingRecord;->performOneTimeMediaMuxerCreation(ILandroidx/core/util/Consumer;)Landroid/media/MediaMuxer;

    move-result-object v9
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1716
    .end local v7    # "mediaSpec":Landroidx/camera/video/MediaSpec;
    .end local v8    # "muxerOutputFormat":I
    .local v9, "mediaMuxer":Landroid/media/MediaMuxer;
    nop

    .line 1718
    :try_start_2
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mSourceTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 1719
    .local v7, "transformationInfo":Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    if-eqz v7, :cond_6

    .line 1720
    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setInProgressTransformationInfo(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V

    .line 1721
    invoke-virtual {v7}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getRotationDegrees()I

    move-result v8

    invoke-virtual {v9, v8}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 1723
    :cond_6
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/camera/video/OutputOptions;->getLocation()Landroid/location/Location;

    move-result-object v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1724
    .local v8, "location":Landroid/location/Location;
    if-eqz v8, :cond_8

    .line 1726
    nop

    .line 1728
    :try_start_3
    invoke-virtual {v8}, Landroid/location/Location;->getLatitude()D

    move-result-wide v10

    invoke-virtual {v8}, Landroid/location/Location;->getLongitude()D

    move-result-wide v12

    .line 1727
    invoke-static {v10, v11, v12, v13}, Landroidx/camera/video/internal/workaround/CorrectNegativeLatLongForMediaMuxer;->adjustGeoLocation(DD)Landroid/util/Pair;

    move-result-object v10

    .line 1729
    .local v10, "geoLocation":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Double;Ljava/lang/Double;>;"
    iget-object v11, v10, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v11, Ljava/lang/Double;

    invoke-virtual {v11}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v11

    double-to-float v11, v11

    iget-object v12, v10, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v12, Ljava/lang/Double;

    .line 1730
    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    double-to-float v12, v12

    .line 1729
    invoke-virtual {v9, v11, v12}, Landroid/media/MediaMuxer;->setLocation(FF)V
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1736
    .end local v10    # "geoLocation":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Double;Ljava/lang/Double;>;"
    goto :goto_3

    .line 1731
    :catch_0
    move-exception v1

    .line 1732
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    :try_start_4
    invoke-virtual {v9}, Landroid/media/MediaMuxer;->release()V

    .line 1733
    invoke-virtual {p0, p1, v5, v1}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1761
    if-eqz v0, :cond_7

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1735
    :cond_7
    return-void

    .line 1739
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :cond_8
    :goto_3
    :try_start_5
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    invoke-interface {v5}, Landroidx/camera/video/internal/encoder/OutputConfig;->getMediaFormat()Landroid/media/MediaFormat;

    move-result-object v5

    invoke-virtual {v9, v5}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    .line 1740
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1741
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    invoke-interface {v5}, Landroidx/camera/video/internal/encoder/OutputConfig;->getMediaFormat()Landroid/media/MediaFormat;

    move-result-object v5

    invoke-virtual {v9, v5}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mAudioTrackIndex:Ljava/lang/Integer;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1744
    :cond_9
    :try_start_6
    invoke-virtual {v9}, Landroid/media/MediaMuxer;->start()V
    :try_end_6
    .catch Ljava/lang/IllegalStateException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1751
    nop

    .line 1754
    :try_start_7
    iput-object v9, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 1757
    invoke-virtual {p0, v0, p1}, Landroidx/camera/video/Recorder;->writeVideoData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 1758
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1759
    .local v5, "data":Landroidx/camera/video/internal/encoder/EncodedData;
    invoke-virtual {p0, v5, p1}, Landroidx/camera/video/Recorder;->writeAudioData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1760
    .end local v5    # "data":Landroidx/camera/video/internal/encoder/EncodedData;
    goto :goto_4

    .line 1761
    .end local v2    # "audioDataToWrite":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    .end local v3    # "firstDataSize":J
    .end local v7    # "transformationInfo":Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    .end local v8    # "location":Landroid/location/Location;
    .end local v9    # "mediaMuxer":Landroid/media/MediaMuxer;
    :cond_a
    if-eqz v0, :cond_b

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1762
    .end local v0    # "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_b
    return-void

    .line 1745
    .restart local v0    # "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    .restart local v2    # "audioDataToWrite":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    .restart local v3    # "firstDataSize":J
    .restart local v7    # "transformationInfo":Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    .restart local v8    # "location":Landroid/location/Location;
    .restart local v9    # "mediaMuxer":Landroid/media/MediaMuxer;
    :catch_1
    move-exception v5

    .line 1746
    .local v5, "e":Ljava/lang/IllegalStateException;
    :try_start_8
    iget-object v10, p0, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    invoke-static {v10}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/video/internal/OutputStorage;

    invoke-interface {v10}, Landroidx/camera/video/internal/OutputStorage;->getAvailableBytes()J

    move-result-wide v10

    .line 1747
    .local v10, "availableBytes":J
    iget-wide v12, p0, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    cmp-long v12, v10, v12

    if-gez v12, :cond_c

    .line 1748
    move v6, v1

    goto :goto_5

    :cond_c
    nop

    .line 1749
    .local v6, "error":I
    :goto_5
    invoke-virtual {p0, p1, v6, v5}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 1761
    if-eqz v0, :cond_d

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1750
    :cond_d
    return-void

    .line 1711
    .end local v5    # "e":Ljava/lang/IllegalStateException;
    .end local v6    # "error":I
    .end local v7    # "transformationInfo":Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    .end local v8    # "location":Landroid/location/Location;
    .end local v9    # "mediaMuxer":Landroid/media/MediaMuxer;
    .end local v10    # "availableBytes":J
    :catch_2
    move-exception v6

    .line 1712
    .local v6, "e":Ljava/io/IOException;
    :try_start_9
    invoke-static {v6}, Landroidx/camera/video/internal/utils/StorageUtil;->isStorageFullException(Ljava/lang/Exception;)Z

    move-result v7

    if-eqz v7, :cond_e

    goto :goto_6

    .line 1713
    :cond_e
    move v1, v5

    :goto_6
    nop

    .line 1714
    .local v1, "error":I
    invoke-virtual {p0, p1, v1, v6}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 1761
    if-eqz v0, :cond_f

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1715
    :cond_f
    return-void

    .line 1679
    .end local v1    # "error":I
    .end local v2    # "audioDataToWrite":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    .end local v3    # "firstDataSize":J
    .end local v6    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_10

    :try_start_a
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    goto :goto_7

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_10
    :goto_7
    throw v1

    .line 1675
    .end local v0    # "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_11
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Media muxer cannot be started without an encoded video frame."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 1666
    :cond_12
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Unable to set up media muxer when one already exists."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method start(Landroidx/camera/video/PendingRecording;)Landroidx/camera/video/Recording;
    .locals 9
    .param p1, "pendingRecording"    # Landroidx/camera/video/PendingRecording;

    .line 845
    const-string v0, "The given PendingRecording cannot be null."

    invoke-static {p1, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 846
    const/4 v0, 0x0

    .line 847
    .local v0, "alreadyInProgressRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v1, 0x0

    .line 848
    .local v1, "error":I
    const/4 v2, 0x0

    .line 850
    .local v2, "errorCause":Ljava/lang/Throwable;
    iget-object v3, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 851
    :try_start_0
    iget-wide v4, p0, Landroidx/camera/video/Recorder;->mLastGeneratedRecordingId:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Landroidx/camera/video/Recorder;->mLastGeneratedRecordingId:J

    .line 852
    .local v4, "recordingId":J
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v6}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    goto/16 :goto_2

    .line 856
    :pswitch_0
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v0, v6

    .line 857
    goto :goto_2

    .line 862
    :pswitch_1
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 863
    invoke-static {v6}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v0, v6

    .line 864
    goto :goto_2

    .line 874
    :pswitch_2
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    sget-object v7, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    if-ne v6, v7, :cond_1

    .line 875
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v6, :cond_0

    iget-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v6, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    const-string v7, "Expected recorder to be idle but a recording is either pending or in progress."

    invoke-static {v6, v7}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 882
    :cond_1
    :try_start_1
    invoke-static {p1, v4, v5}, Landroidx/camera/video/Recorder$RecordingRecord;->from(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v6

    .line 884
    .local v6, "recordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    nop

    .line 885
    invoke-virtual {p1}, Landroidx/camera/video/PendingRecording;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 884
    invoke-virtual {v6, v7}, Landroidx/camera/video/Recorder$RecordingRecord;->initializeRecording(Landroid/content/Context;)V

    .line 886
    iput-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 887
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    sget-object v8, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    if-ne v7, v8, :cond_2

    .line 888
    sget-object v7, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 889
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v8, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda12;

    invoke-direct {v8, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda12;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 890
    :cond_2
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    sget-object v8, Landroidx/camera/video/Recorder$State;->ERROR:Landroidx/camera/video/Recorder$State;

    if-ne v7, v8, :cond_3

    .line 891
    sget-object v7, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 893
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v8, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda13;

    invoke-direct {v8, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda13;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 903
    :cond_3
    sget-object v7, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 910
    .end local v6    # "recordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    :goto_1
    goto :goto_2

    .line 907
    :catch_0
    move-exception v6

    .line 908
    .local v6, "e":Ljava/io/IOException;
    const/4 v1, 0x5

    .line 909
    move-object v2, v6

    .line 913
    .end local v6    # "e":Ljava/io/IOException;
    :goto_2
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 915
    if-nez v0, :cond_5

    .line 918
    if-eqz v1, :cond_4

    .line 919
    const-string v3, "Recorder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Recording was started when the Recorder had encountered error "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 922
    invoke-static {p1, v4, v5}, Landroidx/camera/video/Recorder$RecordingRecord;->from(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v3

    invoke-direct {p0, v3, v1, v2}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 924
    invoke-static {p1, v4, v5}, Landroidx/camera/video/Recording;->createFinalizedFrom(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recording;

    move-result-object v3

    return-object v3

    .line 927
    :cond_4
    invoke-static {p1, v4, v5}, Landroidx/camera/video/Recording;->from(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recording;

    move-result-object v3

    return-object v3

    .line 916
    :cond_5
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v6, "A recording is already in progress. Previous recordings must be stopped before a new recording can be started."

    invoke-direct {v3, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 913
    .end local v4    # "recordingId":J
    :catchall_0
    move-exception v4

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method stop(Landroidx/camera/video/Recording;ILjava/lang/Throwable;)V
    .locals 12
    .param p1, "activeRecording"    # Landroidx/camera/video/Recording;
    .param p2, "error"    # I
    .param p3, "errorCause"    # Ljava/lang/Throwable;

    .line 1023
    const/4 v1, 0x0

    .line 1024
    .local v1, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1025
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v0}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_0

    :try_start_1
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v0}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1030
    const-string v0, "Recorder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "stop() called on a recording that is no longer active: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1032
    invoke-virtual {p1}, Landroidx/camera/video/Recording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1030
    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1033
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    .line 1074
    :catchall_0
    move-exception v0

    move-object v6, p0

    move v10, p2

    move-object v11, p3

    goto/16 :goto_1

    .line 1035
    :cond_0
    :try_start_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    packed-switch v0, :pswitch_data_0

    move-object v6, p0

    move v10, p2

    move-object v11, p3

    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    .local v10, "error":I
    .local v11, "errorCause":Ljava/lang/Throwable;
    goto :goto_0

    .line 1052
    .end local v10    # "error":I
    .end local v11    # "errorCause":Ljava/lang/Throwable;
    .restart local p2    # "error":I
    .restart local p3    # "errorCause":Ljava/lang/Throwable;
    :pswitch_0
    :try_start_3
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v0}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1054
    move-object v6, p0

    move v10, p2

    move-object v11, p3

    goto :goto_0

    .line 1063
    :pswitch_1
    :try_start_4
    sget-object v0, Landroidx/camera/video/Recorder$State;->STOPPING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1064
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v3

    move-wide v8, v3

    .line 1065
    .local v8, "explicitlyStopTimeUs":J
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1066
    .local v7, "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v5, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda1;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-object v6, p0

    move v10, p2

    move-object v11, p3

    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    .restart local v10    # "error":I
    .restart local v11    # "errorCause":Ljava/lang/Throwable;
    :try_start_5
    invoke-direct/range {v5 .. v11}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V

    invoke-interface {v0, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1068
    goto :goto_0

    .line 1040
    .end local v7    # "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v8    # "explicitlyStopTimeUs":J
    .end local v10    # "error":I
    .end local v11    # "errorCause":Ljava/lang/Throwable;
    .restart local p2    # "error":I
    .restart local p3    # "errorCause":Ljava/lang/Throwable;
    :pswitch_2
    move-object v6, p0

    move v10, p2

    move-object v11, p3

    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    .restart local v10    # "error":I
    .restart local v11    # "errorCause":Ljava/lang/Throwable;
    iget-object p2, v6, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, p2}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result p2

    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 1042
    iget-object p2, v6, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v1, p2

    .line 1043
    const/4 p2, 0x0

    iput-object p2, v6, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1044
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->restoreNonPendingState()V

    .line 1045
    goto :goto_0

    .line 1058
    .end local v10    # "error":I
    .end local v11    # "errorCause":Ljava/lang/Throwable;
    .restart local p2    # "error":I
    .restart local p3    # "errorCause":Ljava/lang/Throwable;
    :pswitch_3
    move-object v6, p0

    move v10, p2

    move-object v11, p3

    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    .restart local v10    # "error":I
    .restart local v11    # "errorCause":Ljava/lang/Throwable;
    new-instance p2, Ljava/lang/IllegalStateException;

    const-string p3, "Calling stop() while idling or initializing is invalid."

    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v10    # "error":I
    .end local v11    # "errorCause":Ljava/lang/Throwable;
    .end local p1    # "activeRecording":Landroidx/camera/video/Recording;
    throw p2

    .line 1074
    .restart local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v10    # "error":I
    .restart local v11    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "activeRecording":Landroidx/camera/video/Recording;
    :goto_0
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 1076
    if-eqz v1, :cond_2

    .line 1077
    const/16 p2, 0xa

    if-ne v10, p2, :cond_1

    .line 1078
    const-string p2, "Recorder"

    const-string p3, "Recording was stopped due to recording being garbage collected before any valid data has been produced."

    invoke-static {p2, p3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1081
    :cond_1
    new-instance p2, Ljava/lang/RuntimeException;

    const-string p3, "Recording was stopped before any data could be produced."

    invoke-direct {p2, p3, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/16 p3, 0x8

    invoke-direct {p0, v1, p3, p2}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1085
    :cond_2
    return-void

    .line 1074
    .end local v10    # "error":I
    .end local v11    # "errorCause":Ljava/lang/Throwable;
    .restart local p2    # "error":I
    .restart local p3    # "errorCause":Ljava/lang/Throwable;
    :catchall_1
    move-exception v0

    move-object v6, p0

    move v10, p2

    move-object v11, p3

    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    .restart local v10    # "error":I
    .restart local v11    # "errorCause":Ljava/lang/Throwable;
    :goto_1
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_1

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
        :pswitch_0
    .end packed-switch
.end method

.method stopInternal(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V
    .locals 6
    .param p1, "recordingToStop"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "explicitlyStopTime"    # J
    .param p4, "stopError"    # I
    .param p5, "errorCause"    # Ljava/lang/Throwable;

    .line 2312
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, p1, :cond_3

    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    if-nez v0, :cond_3

    .line 2313
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    .line 2314
    iput p4, p0, Landroidx/camera/video/Recorder;->mRecordingStopError:I

    .line 2315
    iput-object p5, p0, Landroidx/camera/video/Recorder;->mRecordingStopErrorCause:Ljava/lang/Throwable;

    .line 2316
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2317
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->clearPendingAudioRingBuffer()V

    .line 2318
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0, p2, p3}, Landroidx/camera/video/internal/encoder/Encoder;->stop(J)V

    .line 2320
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    if-eqz v0, :cond_1

    .line 2321
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 2322
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 2325
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->ACTIVE_NON_STREAMING:Landroidx/camera/video/VideoOutput$SourceState;

    if-eq v0, v1, :cond_2

    .line 2333
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 2334
    .local v0, "finalVideoEncoder":Landroidx/camera/video/internal/encoder/Encoder;
    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda19;

    invoke-direct {v1, v0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda19;-><init>(Landroidx/camera/video/internal/encoder/Encoder;)V

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    const-wide/16 v3, 0x3e8

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v1, v2, v3, v4, v5}, Landroidx/camera/video/Recorder;->scheduleTask(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    .line 2347
    .end local v0    # "finalVideoEncoder":Landroidx/camera/video/internal/encoder/Encoder;
    goto :goto_0

    .line 2349
    :cond_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-static {v0}, Landroidx/camera/video/Recorder;->notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V

    .line 2356
    :goto_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0, p2, p3}, Landroidx/camera/video/internal/encoder/Encoder;->stop(J)V

    .line 2358
    :cond_3
    return-void
.end method

.method tryServicePendingRecording()V
    .locals 9

    .line 2761
    const/4 v0, 0x0

    .line 2762
    .local v0, "startRecordingPaused":Z
    const/4 v1, 0x0

    .line 2763
    .local v1, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v2, 0x0

    .line 2764
    .local v2, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v3, 0x0

    .line 2765
    .local v3, "error":I
    const/4 v4, 0x0

    .line 2766
    .local v4, "errorCause":Ljava/lang/Throwable;
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 2767
    :try_start_0
    const-string v6, "Recorder"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "tryServicePendingRecording on state: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2768
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v6}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    goto :goto_1

    .line 2770
    :pswitch_0
    const/4 v0, 0x1

    .line 2773
    :pswitch_1
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v7, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne v6, v7, :cond_0

    .line 2774
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v2, v6

    .line 2775
    const/4 v6, 0x0

    iput-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2776
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->restoreNonPendingState()V

    .line 2777
    const/4 v3, 0x4

    .line 2778
    sget-object v6, Landroidx/camera/video/Recorder;->PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

    move-object v4, v6

    .end local v4    # "errorCause":Ljava/lang/Throwable;
    .local v6, "errorCause":Ljava/lang/Throwable;
    goto :goto_1

    .line 2779
    .end local v6    # "errorCause":Ljava/lang/Throwable;
    .restart local v4    # "errorCause":Ljava/lang/Throwable;
    :cond_0
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v6, :cond_2

    iget-boolean v6, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    if-eqz v6, :cond_1

    goto :goto_0

    .line 2786
    :cond_1
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v6, :cond_3

    .line 2789
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v6}, Landroidx/camera/video/Recorder;->makePendingRecordingActiveLocked(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v6

    move-object v1, v6

    .end local v1    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .local v6, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    goto :goto_1

    .line 2780
    .end local v6    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v1    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    :cond_2
    :goto_0
    const-string v6, "Recorder"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "PendingRecording is not handled, active recording = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", need reset flag = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-boolean v8, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2807
    :cond_3
    :goto_1
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2809
    if-eqz v1, :cond_4

    .line 2811
    invoke-direct {p0, v1, v0}, Landroidx/camera/video/Recorder;->startRecording(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    goto :goto_2

    .line 2812
    :cond_4
    if-eqz v2, :cond_5

    .line 2813
    invoke-direct {p0, v2, v3, v4}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2815
    :cond_5
    :goto_2
    return-void

    .line 2807
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method updateInProgressStatusEvent(Z)V
    .locals 3
    .param p1, "printLog"    # Z

    .line 2887
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_0

    .line 2888
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2890
    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 2891
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v2

    .line 2889
    invoke-static {v1, v2}, Landroidx/camera/video/VideoRecordEvent;->status(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Status;

    move-result-object v1

    .line 2888
    invoke-virtual {v0, v1, p1}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;Z)V

    .line 2894
    :cond_0
    return-void
.end method

.method writeAudioData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 23
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;
    .param p2, "recording"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2211
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    iget-wide v3, v1, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v5

    add-long/2addr v3, v5

    .line 2212
    .local v3, "newRecordingBytes":J
    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    const-wide/16 v7, 0x0

    cmp-long v0, v5, v7

    const/4 v5, 0x0

    const-string v6, "Recorder"

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eqz v0, :cond_0

    iget-wide v12, v1, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    cmp-long v0, v3, v12

    if-lez v0, :cond_0

    .line 2214
    nop

    .line 2216
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 2217
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    new-array v8, v10, [Ljava/lang/Object;

    aput-object v0, v8, v9

    aput-object v7, v8, v11

    .line 2215
    const-string v0, "Reach file size limit %d > %d"

    invoke-static {v0, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2214
    invoke-static {v6, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2218
    invoke-virtual {v1, v2, v10, v5}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2219
    return-void

    .line 2222
    :cond_0
    const-wide/16 v12, 0x0

    .line 2223
    .local v12, "newRecordingDurationNs":J
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getPresentationTimeUs()J

    move-result-wide v14

    .line 2224
    .local v14, "currentPresentationTimeUs":J
    move-wide/from16 v16, v7

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    const-wide v18, 0x7fffffffffffffffL

    cmp-long v0, v7, v18

    if-nez v0, :cond_1

    .line 2225
    iput-wide v14, v1, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 2226
    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 2227
    invoke-static {v7, v8}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v5

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v0, v7, v9

    aput-object v5, v7, v11

    .line 2226
    const-string v0, "First audio time: %d (%s)"

    invoke-static {v0, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    move/from16 v20, v11

    goto :goto_1

    .line 2229
    :cond_1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    move/from16 v20, v11

    move-wide/from16 v21, v12

    .end local v12    # "newRecordingDurationNs":J
    .local v21, "newRecordingDurationNs":J
    iget-wide v11, v1, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 2230
    invoke-static {v7, v8, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    sub-long v7, v14, v7

    .line 2229
    invoke-virtual {v0, v7, v8}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v12

    .line 2232
    .end local v21    # "newRecordingDurationNs":J
    .restart local v12    # "newRecordingDurationNs":J
    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    cmp-long v0, v7, v18

    if-eqz v0, :cond_2

    move/from16 v0, v20

    goto :goto_0

    :cond_2
    move v0, v9

    :goto_0
    const-string v7, "There should be a previous data for adjusting the duration."

    invoke-static {v0, v7}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 2239
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    sub-long v7, v14, v7

    invoke-virtual {v0, v7, v8}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v7

    add-long/2addr v7, v12

    .line 2241
    .local v7, "adjustedDurationNs":J
    move-object v0, v6

    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    cmp-long v5, v5, v16

    if-eqz v5, :cond_3

    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    cmp-long v5, v7, v5

    if-lez v5, :cond_3

    .line 2243
    nop

    .line 2244
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-wide/from16 v16, v12

    .end local v12    # "newRecordingDurationNs":J
    .local v16, "newRecordingDurationNs":J
    iget-wide v11, v1, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v5, v10, v9

    aput-object v11, v10, v20

    .line 2243
    const-string v5, "Audio data reaches duration limit %d > %d"

    invoke-static {v5, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2245
    const/16 v0, 0x9

    const/4 v6, 0x0

    invoke-virtual {v1, v2, v0, v6}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2246
    return-void

    .line 2241
    .end local v16    # "newRecordingDurationNs":J
    .restart local v12    # "newRecordingDurationNs":J
    :cond_3
    move-wide/from16 v16, v12

    .line 2251
    .end local v7    # "adjustedDurationNs":J
    .end local v12    # "newRecordingDurationNs":J
    .restart local v16    # "newRecordingDurationNs":J
    move-wide/from16 v12, v16

    .end local v16    # "newRecordingDurationNs":J
    .restart local v12    # "newRecordingDurationNs":J
    :goto_1
    :try_start_0
    iget-object v0, v1, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    iget-object v5, v1, Landroidx/camera/video/Recorder;->mAudioTrackIndex:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 2252
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 2253
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    move-result-object v7

    .line 2251
    invoke-virtual {v0, v5, v6, v7}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2260
    nop

    .line 2262
    iput-wide v3, v1, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    .line 2263
    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mRecordingAudioBytes:J

    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v7

    add-long/2addr v5, v7

    iput-wide v5, v1, Landroidx/camera/video/Recorder;->mRecordingAudioBytes:J

    .line 2264
    iput-wide v14, v1, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    .line 2265
    return-void

    .line 2254
    :catch_0
    move-exception v0

    .line 2255
    .local v0, "e":Ljava/lang/IllegalStateException;
    iget-object v5, v1, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    invoke-static {v5}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/video/internal/OutputStorage;

    invoke-interface {v5}, Landroidx/camera/video/internal/OutputStorage;->getAvailableBytes()J

    move-result-wide v5

    .line 2256
    .local v5, "availableBytes":J
    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    cmp-long v7, v5, v7

    if-gez v7, :cond_4

    .line 2257
    const/4 v11, 0x3

    goto :goto_2

    :cond_4
    move/from16 v11, v20

    .line 2258
    .local v11, "error":I
    :goto_2
    invoke-virtual {v1, v2, v11, v0}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2259
    return-void
.end method

.method writeVideoData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 23
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;
    .param p2, "recording"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2131
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    iget-object v0, v1, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    if-eqz v0, :cond_7

    .line 2137
    iget-wide v3, v1, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v5

    add-long/2addr v3, v5

    .line 2138
    .local v3, "newRecordingBytes":J
    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    const-wide/16 v7, 0x0

    cmp-long v0, v5, v7

    const/4 v5, 0x0

    const-string v6, "Recorder"

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eqz v0, :cond_0

    iget-wide v12, v1, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    cmp-long v0, v3, v12

    if-lez v0, :cond_0

    .line 2140
    nop

    .line 2141
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 2142
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    new-array v8, v10, [Ljava/lang/Object;

    aput-object v0, v8, v9

    aput-object v7, v8, v11

    .line 2141
    const-string v0, "Reach file size limit %d > %d"

    invoke-static {v0, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2140
    invoke-static {v6, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2143
    invoke-virtual {v1, v2, v10, v5}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2144
    return-void

    .line 2147
    :cond_0
    const-wide/16 v12, 0x0

    .line 2148
    .local v12, "newRecordingDurationNs":J
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getPresentationTimeUs()J

    move-result-wide v14

    .line 2150
    .local v14, "currentPresentationTimeUs":J
    move-wide/from16 v16, v7

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    const-wide v18, 0x7fffffffffffffffL

    cmp-long v0, v7, v18

    if-nez v0, :cond_1

    .line 2151
    iput-wide v14, v1, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    .line 2152
    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    .line 2153
    invoke-static {v7, v8}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v5

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v0, v7, v9

    aput-object v5, v7, v11

    .line 2152
    const-string v0, "First video time: %d (%s)"

    invoke-static {v0, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v6

    move/from16 v20, v11

    goto :goto_1

    .line 2155
    :cond_1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    move/from16 v20, v11

    move-wide/from16 v21, v12

    .end local v12    # "newRecordingDurationNs":J
    .local v21, "newRecordingDurationNs":J
    iget-wide v11, v1, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 2156
    invoke-static {v7, v8, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    sub-long v7, v14, v7

    .line 2155
    invoke-virtual {v0, v7, v8}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v12

    .line 2158
    .end local v21    # "newRecordingDurationNs":J
    .restart local v12    # "newRecordingDurationNs":J
    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    cmp-long v0, v7, v18

    if-eqz v0, :cond_2

    move/from16 v0, v20

    goto :goto_0

    :cond_2
    move v0, v9

    :goto_0
    const-string v7, "There should be a previous data for adjusting the duration."

    invoke-static {v0, v7}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 2165
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v7, v1, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    sub-long v7, v14, v7

    invoke-virtual {v0, v7, v8}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v7

    add-long/2addr v7, v12

    .line 2167
    .local v7, "adjustedDurationNs":J
    move-object v0, v6

    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    cmp-long v5, v5, v16

    if-eqz v5, :cond_3

    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    cmp-long v5, v7, v5

    if-lez v5, :cond_3

    .line 2169
    nop

    .line 2170
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-wide/from16 v16, v12

    .end local v12    # "newRecordingDurationNs":J
    .local v16, "newRecordingDurationNs":J
    iget-wide v11, v1, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v5, v10, v9

    aput-object v11, v10, v20

    .line 2169
    const-string v5, "Video data reaches duration limit %d > %d"

    invoke-static {v5, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2171
    const/16 v0, 0x9

    const/4 v6, 0x0

    invoke-virtual {v1, v2, v0, v6}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2172
    return-void

    .line 2167
    .end local v16    # "newRecordingDurationNs":J
    .restart local v12    # "newRecordingDurationNs":J
    :cond_3
    move-wide/from16 v16, v12

    .line 2177
    .end local v7    # "adjustedDurationNs":J
    .end local v12    # "newRecordingDurationNs":J
    .restart local v16    # "newRecordingDurationNs":J
    move-wide/from16 v12, v16

    .end local v16    # "newRecordingDurationNs":J
    .restart local v12    # "newRecordingDurationNs":J
    :goto_1
    :try_start_0
    iget-object v6, v1, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    iget-object v7, v1, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 2178
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    move-result-object v11

    .line 2177
    invoke-virtual {v6, v7, v8, v11}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2185
    nop

    .line 2187
    iput-wide v3, v1, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    .line 2188
    iput-wide v12, v1, Landroidx/camera/video/Recorder;->mRecordingDurationNs:J

    .line 2189
    iput-wide v14, v1, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    .line 2191
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->isKeyFrame()Z

    move-result v6

    invoke-virtual {v1, v6}, Landroidx/camera/video/Recorder;->updateInProgressStatusEvent(Z)V

    .line 2193
    iget-wide v6, v1, Landroidx/camera/video/Recorder;->mAvailableBytesAboveRequired:J

    cmp-long v6, v3, v6

    if-lez v6, :cond_5

    .line 2194
    iget-object v6, v1, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    invoke-static {v6}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/video/internal/OutputStorage;

    invoke-interface {v6}, Landroidx/camera/video/internal/OutputStorage;->getAvailableBytes()J

    move-result-wide v6

    .line 2195
    .local v6, "availableBytes":J
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "availableBytes = "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v6, v7}, Landroidx/camera/video/internal/utils/StorageUtil;->formatSize(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2196
    move-wide/from16 v16, v6

    .end local v6    # "availableBytes":J
    .local v16, "availableBytes":J
    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    cmp-long v0, v16, v5

    if-gez v0, :cond_4

    .line 2197
    new-instance v0, Ljava/io/IOException;

    .line 2199
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    iget-wide v6, v1, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    .line 2200
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v5, v7, v9

    aput-object v6, v7, v20

    .line 2199
    const-string v5, "Insufficient storage space. The available storage (%d bytes) is below the required threshold of %d bytes."

    invoke-static {v5, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 2197
    const/4 v8, 0x3

    invoke-virtual {v1, v2, v8, v0}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2201
    return-void

    .line 2203
    :cond_4
    iget-wide v5, v1, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    sub-long v5, v16, v5

    iput-wide v5, v1, Landroidx/camera/video/Recorder;->mAvailableBytesAboveRequired:J

    .line 2205
    .end local v16    # "availableBytes":J
    :cond_5
    return-void

    .line 2179
    :catch_0
    move-exception v0

    const/4 v8, 0x3

    .line 2180
    .local v0, "e":Ljava/lang/IllegalStateException;
    iget-object v5, v1, Landroidx/camera/video/Recorder;->mOutputStorage:Landroidx/camera/video/internal/OutputStorage;

    invoke-static {v5}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/video/internal/OutputStorage;

    invoke-interface {v5}, Landroidx/camera/video/internal/OutputStorage;->getAvailableBytes()J

    move-result-wide v5

    .line 2181
    .local v5, "availableBytes":J
    iget-wide v9, v1, Landroidx/camera/video/Recorder;->mRequiredFreeStorageBytes:J

    cmp-long v7, v5, v9

    if-gez v7, :cond_6

    .line 2182
    move v11, v8

    goto :goto_2

    :cond_6
    move/from16 v11, v20

    .line 2183
    .local v11, "error":I
    :goto_2
    invoke-virtual {v1, v2, v11, v0}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2184
    return-void

    .line 2133
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    .end local v3    # "newRecordingBytes":J
    .end local v5    # "availableBytes":J
    .end local v11    # "error":I
    .end local v12    # "newRecordingDurationNs":J
    .end local v14    # "currentPresentationTimeUs":J
    :cond_7
    new-instance v0, Ljava/lang/AssertionError;

    const-string v3, "Video data comes before the track is added to MediaMuxer."

    invoke-direct {v0, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
