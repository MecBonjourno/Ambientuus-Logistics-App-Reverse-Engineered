.class final Landroidx/camera/video/VideoEncoderSession;
.super Ljava/lang/Object;
.source "VideoEncoderSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoEncoderSession"


# instance fields
.field private mActiveSurface:Landroid/view/Surface;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mOnSurfaceUpdateExecutor:Ljava/util/concurrent/Executor;

.field private mOnSurfaceUpdateListener:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

.field private mReadyToReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Landroidx/camera/video/internal/encoder/Encoder;",
            ">;"
        }
    .end annotation
.end field

.field private mReadyToReleaseFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/video/internal/encoder/Encoder;",
            ">;"
        }
    .end annotation
.end field

.field private mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mSequentialExecutor:Ljava/util/concurrent/Executor;

.field private mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

.field private mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

.field private final mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

.field private mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;


# direct methods
.method public static synthetic $r8$lambda$7lkRtlCH6iVomLgyTLAQT9jSafA(Landroidx/camera/video/VideoEncoderSession;Landroidx/camera/core/SurfaceRequest$Result;)V
    .locals 0

    invoke-direct {p0, p1}, Landroidx/camera/video/VideoEncoderSession;->onSurfaceRequestComplete(Landroidx/camera/core/SurfaceRequest$Result;)V

    return-void
.end method

.method constructor <init>(Landroidx/camera/video/internal/encoder/EncoderFactory;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V
    .locals 3
    .param p1, "videoEncoderFactory"    # Landroidx/camera/video/internal/encoder/EncoderFactory;
    .param p2, "sequentialExecutor"    # Ljava/util/concurrent/Executor;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 80
    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mActiveSurface:Landroid/view/Surface;

    .line 81
    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 82
    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mOnSurfaceUpdateExecutor:Ljava/util/concurrent/Executor;

    .line 83
    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mOnSurfaceUpdateListener:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    .line 84
    sget-object v1, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->NOT_INITIALIZED:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    iput-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    .line 85
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot close the encoder before configuring."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 87
    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 88
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mReadyToReleaseFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 90
    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mReadyToReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 94
    iput-object p3, p0, Landroidx/camera/video/VideoEncoderSession;->mExecutor:Ljava/util/concurrent/Executor;

    .line 95
    iput-object p2, p0, Landroidx/camera/video/VideoEncoderSession;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    .line 96
    iput-object p1, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 97
    return-void
.end method

.method private closeInternal()V
    .locals 3

    .line 243
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->ordinal()I

    move-result v0

    const-string v1, "VideoEncoderSession"

    packed-switch v0, :pswitch_data_0

    .line 260
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "State "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not handled"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 257
    :pswitch_0
    const-string v0, "closeInternal in RELEASED state, No-op"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    goto :goto_0

    .line 253
    :pswitch_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "closeInternal in "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " state"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    sget-object v0, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->PENDING_RELEASE:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    .line 255
    goto :goto_0

    .line 248
    :pswitch_2
    invoke-virtual {p0}, Landroidx/camera/video/VideoEncoderSession;->terminateNow()V

    .line 249
    nop

    .line 262
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private configureVideoEncoderInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/video/internal/encoder/VideoEncoderConfig;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 4
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "config"    # Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/SurfaceRequest;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderConfig;",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Landroidx/camera/video/internal/encoder/Encoder;",
            ">;)V"
        }
    .end annotation

    .line 276
    .local p3, "configureCompleter":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/Encoder;>;"
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iget-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mExecutor:Ljava/util/concurrent/Executor;

    .line 277
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getSessionType()I

    move-result v2

    .line 276
    invoke-interface {v0, v1, p2, v2}, Landroidx/camera/video/internal/encoder/EncoderFactory;->createEncoder(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderConfig;I)Landroidx/camera/video/internal/encoder/Encoder;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;
    :try_end_0
    .catch Landroidx/camera/video/internal/encoder/InvalidConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    nop

    .line 284
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->getInput()Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    move-result-object v0

    .line 285
    .local v0, "encoderInput":Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;
    instance-of v1, v0, Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput;

    if-nez v1, :cond_0

    .line 286
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "The EncoderInput of video isn\'t a SurfaceInput."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p3, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 288
    return-void

    .line 290
    :cond_0
    move-object v1, v0

    check-cast v1, Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput;

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p3, p1}, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/VideoEncoderSession;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/SurfaceRequest;)V

    invoke-interface {v1, v2, v3}, Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput;->setOnSurfaceUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;)V

    .line 331
    return-void

    .line 278
    .end local v0    # "encoderInput":Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;
    :catch_0
    move-exception v0

    .line 279
    .local v0, "e":Landroidx/camera/video/internal/encoder/InvalidConfigException;
    const-string v1, "VideoEncoderSession"

    const-string v2, "Unable to initialize video encoder."

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 280
    invoke-virtual {p3, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 281
    return-void
.end method

.method private onSurfaceRequestComplete(Landroidx/camera/core/SurfaceRequest$Result;)V
    .locals 3
    .param p1, "result"    # Landroidx/camera/core/SurfaceRequest$Result;

    .line 335
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Surface can be closed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$Result;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "VideoEncoderSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$Result;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 337
    .local v0, "resultSurface":Landroid/view/Surface;
    iget-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mActiveSurface:Landroid/view/Surface;

    if-ne v0, v1, :cond_0

    .line 338
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mActiveSurface:Landroid/view/Surface;

    .line 339
    iget-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mReadyToReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {v1, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 340
    invoke-direct {p0}, Landroidx/camera/video/VideoEncoderSession;->closeInternal()V

    goto :goto_0

    .line 343
    :cond_0
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 345
    :goto_0
    return-void
.end method


# virtual methods
.method configure(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/video/internal/encoder/VideoEncoderConfig;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "videoEncoderConfig"    # Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/SurfaceRequest;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderConfig;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/video/internal/encoder/Encoder;",
            ">;"
        }
    .end annotation

    .line 102
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 146
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "configure() shouldn\'t be called in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 104
    :pswitch_0
    sget-object v0, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->INITIALIZING:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    .line 106
    iput-object p1, p0, Landroidx/camera/video/VideoEncoderSession;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Create VideoEncoderSession: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "VideoEncoderSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    new-instance v0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/VideoEncoderSession;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 112
    new-instance v0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/VideoEncoderSession;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mReadyToReleaseFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 117
    new-instance v0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1, p2}, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/video/VideoEncoderSession;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/video/internal/encoder/VideoEncoderConfig;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 123
    .local v0, "configureFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/encoder/Encoder;>;"
    new-instance v1, Landroidx/camera/video/VideoEncoderSession$1;

    invoke-direct {v1, p0}, Landroidx/camera/video/VideoEncoderSession$1;-><init>(Landroidx/camera/video/VideoEncoderSession;)V

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 136
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method getActiveSurface()Landroid/view/Surface;
    .locals 2

    .line 230
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    sget-object v1, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->READY:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    if-eq v0, v1, :cond_0

    .line 231
    const/4 v0, 0x0

    return-object v0

    .line 233
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mActiveSurface:Landroid/view/Surface;

    return-object v0
.end method

.method getReadyToReleaseFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/video/internal/encoder/Encoder;",
            ">;"
        }
    .end annotation

    .line 174
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mReadyToReleaseFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method getVideoEncoder()Landroidx/camera/video/internal/encoder/Encoder;
    .locals 1

    .line 238
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    return-object v0
.end method

.method isConfiguredSurfaceRequest(Landroidx/camera/core/SurfaceRequest;)Z
    .locals 3
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;

    .line 153
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->ordinal()I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 165
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "State "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not handled"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :pswitch_0
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 163
    :pswitch_1
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method synthetic lambda$configure$0$androidx-camera-video-VideoEncoderSession(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "closeCompleter"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 109
    iput-object p1, p0, Landroidx/camera/video/VideoEncoderSession;->mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ReleasedFuture "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$configure$1$androidx-camera-video-VideoEncoderSession(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "requestCompleteCompleter"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 114
    iput-object p1, p0, Landroidx/camera/video/VideoEncoderSession;->mReadyToReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ReadyToReleaseFuture "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$configure$2$androidx-camera-video-VideoEncoderSession(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/video/internal/encoder/VideoEncoderConfig;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "videoEncoderConfig"    # Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .param p3, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 119
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/video/VideoEncoderSession;->configureVideoEncoderInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/video/internal/encoder/VideoEncoderConfig;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ConfigureVideoEncoderFuture "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$configureVideoEncoderInternal$4$androidx-camera-video-VideoEncoderSession(Landroid/view/Surface;)V
    .locals 1
    .param p1, "surface"    # Landroid/view/Surface;

    .line 322
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mOnSurfaceUpdateListener:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    invoke-interface {v0, p1}, Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;->onSurfaceUpdate(Landroid/view/Surface;)V

    return-void
.end method

.method synthetic lambda$configureVideoEncoderInternal$5$androidx-camera-video-VideoEncoderSession(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/SurfaceRequest;Landroid/view/Surface;)V
    .locals 4
    .param p1, "configureCompleter"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p2, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p3, "surface"    # Landroid/view/Surface;

    .line 292
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->ordinal()I

    move-result v0

    const/4 v1, 0x0

    const-string v2, "VideoEncoderSession"

    packed-switch v0, :pswitch_data_0

    .line 327
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "State "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not handled"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 319
    :pswitch_0
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mOnSurfaceUpdateListener:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mOnSurfaceUpdateExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    .line 321
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mOnSurfaceUpdateExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p3}, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/VideoEncoderSession;Landroid/view/Surface;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 324
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Surface is updated in READY state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    goto :goto_0

    .line 302
    :pswitch_1
    invoke-virtual {p2}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not provide surface, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 304
    const-string v3, "EMPTY"

    invoke-static {p2, v3}, Lj$/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " is already serviced."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 303
    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-virtual {p1, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 307
    invoke-direct {p0}, Landroidx/camera/video/VideoEncoderSession;->closeInternal()V

    .line 308
    goto :goto_0

    .line 311
    :cond_1
    iput-object p3, p0, Landroidx/camera/video/VideoEncoderSession;->mActiveSurface:Landroid/view/Surface;

    .line 312
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "provide surface: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/video/VideoEncoderSession;)V

    invoke-virtual {p2, p3, v0, v1}, Landroidx/camera/core/SurfaceRequest;->provideSurface(Landroid/view/Surface;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    .line 315
    sget-object v0, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->READY:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    .line 316
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 317
    goto :goto_0

    .line 298
    :pswitch_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not provide surface in "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    invoke-virtual {p1, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 300
    nop

    .line 330
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method synthetic lambda$terminateNow$3$androidx-camera-video-VideoEncoderSession()V
    .locals 2

    .line 216
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    return-void
.end method

.method setOnSurfaceUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;)V
    .locals 0
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "onSurfaceUpdateListener"    # Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    .line 267
    iput-object p1, p0, Landroidx/camera/video/VideoEncoderSession;->mOnSurfaceUpdateExecutor:Ljava/util/concurrent/Executor;

    .line 268
    iput-object p2, p0, Landroidx/camera/video/VideoEncoderSession;->mOnSurfaceUpdateListener:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    .line 269
    return-void
.end method

.method signalTermination()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 190
    invoke-direct {p0}, Landroidx/camera/video/VideoEncoderSession;->closeInternal()V

    .line 191
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method terminateNow()V
    .locals 4

    .line 196
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->ordinal()I

    move-result v0

    const-string v1, "VideoEncoderSession"

    packed-switch v0, :pswitch_data_0

    .line 224
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "State "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not handled"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 202
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "terminateNow in "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", No-op"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    return-void

    .line 209
    :pswitch_1
    sget-object v0, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->RELEASED:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    .line 210
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mReadyToReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {v0, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 211
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 212
    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v2, :cond_0

    .line 213
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "VideoEncoder is releasing: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    iget-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/Encoder;->release()V

    .line 215
    iget-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/Encoder;->getReleasedFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/VideoEncoderSession;)V

    iget-object v3, p0, Landroidx/camera/video/VideoEncoderSession;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v2, v3}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 217
    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    goto :goto_0

    .line 219
    :cond_0
    const-string v2, "There\'s no VideoEncoder to release! Finish release completer."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    iget-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 222
    nop

    .line 226
    :goto_0
    return-void

    .line 199
    :pswitch_2
    sget-object v0, Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;->RELEASED:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    iput-object v0, p0, Landroidx/camera/video/VideoEncoderSession;->mVideoEncoderState:Landroidx/camera/video/VideoEncoderSession$VideoEncoderState;

    .line 200
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 349
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "VideoEncoderSession@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/VideoEncoderSession;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    const-string v2, "SURFACE_REQUEST_NOT_CONFIGURED"

    invoke-static {v1, v2}, Lj$/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
