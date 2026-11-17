.class public Landroidx/camera/camera2/internal/Camera2RequestProcessor;
.super Ljava/lang/Object;
.source "Camera2RequestProcessor.java"

# interfaces
.implements Landroidx/camera/core/impl/RequestProcessor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2RequestProcessor"


# instance fields
.field private mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

.field private volatile mIsClosed:Z

.field private final mLock:Ljava/lang/Object;

.field private mProcessorSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SessionProcessorSurface;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mSessionConfig:Landroidx/camera/core/impl/SessionConfig;


# direct methods
.method public constructor <init>(Landroidx/camera/camera2/internal/CaptureSession;Ljava/util/List;)V
    .locals 3
    .param p1, "captureSession"    # Landroidx/camera/camera2/internal/CaptureSession;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/CaptureSession;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SessionProcessorSurface;",
            ">;)V"
        }
    .end annotation

    .line 76
    .local p2, "processorSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SessionProcessorSurface;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    .line 70
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    .line 77
    iget-object v1, p1, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v2, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENED:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CaptureSession state must be OPENED. Current state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 79
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    .line 81
    return-void
.end method

.method private areRequestsValid(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/RequestProcessor$Request;",
            ">;)Z"
        }
    .end annotation

    .line 106
    .local p1, "requests":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/RequestProcessor$Request;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/RequestProcessor$Request;

    .line 107
    .local v1, "request":Landroidx/camera/core/impl/RequestProcessor$Request;
    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->isRequestValid(Landroidx/camera/core/impl/RequestProcessor$Request;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 108
    const/4 v0, 0x0

    return v0

    .line 110
    .end local v1    # "request":Landroidx/camera/core/impl/RequestProcessor$Request;
    :cond_0
    goto :goto_0

    .line 111
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private findSurface(I)Landroidx/camera/core/impl/DeferrableSurface;
    .locals 5
    .param p1, "outputConfigId"    # I

    .line 319
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 320
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 321
    monitor-exit v0

    return-object v2

    .line 323
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/SessionProcessorSurface;

    .line 324
    .local v3, "sessionProcessorSurface":Landroidx/camera/core/impl/SessionProcessorSurface;
    invoke-virtual {v3}, Landroidx/camera/core/impl/SessionProcessorSurface;->getOutputConfigId()I

    move-result v4

    if-ne v4, p1, :cond_1

    .line 325
    monitor-exit v0

    return-object v3

    .line 327
    .end local v3    # "sessionProcessorSurface":Landroidx/camera/core/impl/SessionProcessorSurface;
    :cond_1
    goto :goto_0

    .line 328
    :cond_2
    monitor-exit v0

    return-object v2

    .line 329
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isRequestValid(Landroidx/camera/core/impl/RequestProcessor$Request;)Z
    .locals 5
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;

    .line 115
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTargetOutputConfigIds()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "Camera2RequestProcessor"

    if-eqz v0, :cond_0

    .line 116
    const-string v0, "Unable to submit the RequestProcessor.Request: empty targetOutputConfigIds"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    return v1

    .line 120
    :cond_0
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTargetOutputConfigIds()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 121
    .local v3, "outputConfigId":Ljava/lang/Integer;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->findSurface(I)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v4

    if-nez v4, :cond_1

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to submit the RequestProcessor.Request: targetOutputConfigId("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ") is not a valid id"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    return v1

    .line 126
    .end local v3    # "outputConfigId":Ljava/lang/Integer;
    :cond_1
    goto :goto_0

    .line 128
    :cond_2
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public abortCaptures()V
    .locals 2

    .line 210
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 211
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    if-nez v1, :cond_0

    goto :goto_0

    .line 214
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession;->abortCaptures()V

    .line 215
    monitor-exit v0

    .line 216
    return-void

    .line 212
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    .line 215
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public close()V
    .locals 2

    .line 87
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 88
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    .line 89
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    .line 90
    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 91
    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    .line 92
    monitor-exit v0

    .line 93
    return-void

    .line 92
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method findOutputConfigId(Landroid/view/Surface;)I
    .locals 5
    .param p1, "surface"    # Landroid/view/Surface;

    .line 299
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 300
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    const/4 v2, -0x1

    if-nez v1, :cond_0

    .line 301
    monitor-exit v0

    return v2

    .line 303
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/SessionProcessorSurface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    .local v3, "sessionProcessorSurface":Landroidx/camera/core/impl/SessionProcessorSurface;
    :try_start_1
    invoke-virtual {v3}, Landroidx/camera/core/impl/SessionProcessorSurface;->getSurface()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v4

    if-ne v4, p1, :cond_1

    .line 306
    invoke-virtual {v3}, Landroidx/camera/core/impl/SessionProcessorSurface;->getOutputConfigId()I

    move-result v1
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v0

    return v1

    .line 311
    :cond_1
    goto :goto_1

    .line 308
    :catch_0
    move-exception v4

    goto :goto_1

    :catch_1
    move-exception v4

    .line 312
    .end local v3    # "sessionProcessorSurface":Landroidx/camera/core/impl/SessionProcessorSurface;
    :goto_1
    goto :goto_0

    .line 314
    :cond_2
    monitor-exit v0

    return v2

    .line 315
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public setRepeating(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;)I
    .locals 6
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "callback"    # Landroidx/camera/core/impl/RequestProcessor$Callback;

    .line 174
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 175
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    if-nez v1, :cond_4

    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->isRequestValid(Landroidx/camera/core/impl/RequestProcessor$Request;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 179
    :cond_0
    new-instance v1, Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-direct {v1}, Landroidx/camera/core/impl/SessionConfig$Builder;-><init>()V

    .line 180
    .local v1, "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTemplateId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 181
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getParameters()Landroidx/camera/core/impl/Config;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 182
    new-instance v2, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;

    const/4 v3, 0x1

    invoke-direct {v2, p0, p1, p2, v3}, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;-><init>(Landroidx/camera/camera2/internal/Camera2RequestProcessor;Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;Z)V

    invoke-static {v2}, Landroidx/camera/camera2/internal/CaptureCallbackContainer;->create(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroidx/camera/camera2/internal/CaptureCallbackContainer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 185
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    if-eqz v2, :cond_2

    .line 189
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 190
    .local v3, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-virtual {v1, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 191
    nop

    .end local v3    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_0

    .line 194
    :cond_1
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v2

    .line 195
    .local v2, "tagBundle":Landroidx/camera/core/impl/TagBundle;
    invoke-virtual {v2}, Landroidx/camera/core/impl/TagBundle;->listKeys()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 196
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v2, v4}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroidx/camera/core/impl/SessionConfig$Builder;->addTag(Ljava/lang/String;Ljava/lang/Object;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 197
    nop

    .end local v4    # "key":Ljava/lang/String;
    goto :goto_1

    .line 200
    .end local v2    # "tagBundle":Landroidx/camera/core/impl/TagBundle;
    :cond_2
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTargetOutputConfigIds()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 201
    .local v3, "outputConfigId":Ljava/lang/Integer;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->findSurface(I)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 202
    nop

    .end local v3    # "outputConfigId":Ljava/lang/Integer;
    goto :goto_2

    .line 204
    :cond_3
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/camera2/internal/CaptureSession;->issueRepeatingCaptureRequests(Landroidx/camera/core/impl/SessionConfig;)I

    move-result v2

    monitor-exit v0

    return v2

    .line 176
    .end local v1    # "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    :cond_4
    :goto_3
    monitor-exit v0

    const/4 v0, -0x1

    return v0

    .line 205
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public stopRepeating()V
    .locals 2

    .line 220
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 221
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    if-nez v1, :cond_0

    goto :goto_0

    .line 224
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession;->stopRepeating()V

    .line 225
    monitor-exit v0

    .line 226
    return-void

    .line 222
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    .line 225
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public submit(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;)I
    .locals 2
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "callback"    # Landroidx/camera/core/impl/RequestProcessor$Callback;

    .line 135
    const/4 v0, 0x1

    new-array v0, v0, [Landroidx/camera/core/impl/RequestProcessor$Request;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->submit(Ljava/util/List;Landroidx/camera/core/impl/RequestProcessor$Callback;)I

    move-result v0

    return v0
.end method

.method public submit(Ljava/util/List;Landroidx/camera/core/impl/RequestProcessor$Callback;)I
    .locals 9
    .param p2, "callback"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/RequestProcessor$Request;",
            ">;",
            "Landroidx/camera/core/impl/RequestProcessor$Callback;",
            ")I"
        }
    .end annotation

    .line 142
    .local p1, "requests":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/RequestProcessor$Request;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 143
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    if-nez v1, :cond_3

    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->areRequestsValid(Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    if-nez v1, :cond_0

    goto :goto_2

    .line 147
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v1, "captureConfigs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/camera/core/impl/CaptureConfig;>;"
    const/4 v2, 0x1

    .line 149
    .local v2, "shouldInvokeSequenceCallback":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/RequestProcessor$Request;

    .line 150
    .local v4, "request":Landroidx/camera/core/impl/RequestProcessor$Request;
    new-instance v5, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 151
    .local v5, "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    invoke-interface {v4}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTemplateId()I

    move-result v6

    invoke-virtual {v5, v6}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 152
    invoke-interface {v4}, Landroidx/camera/core/impl/RequestProcessor$Request;->getParameters()Landroidx/camera/core/impl/Config;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 153
    new-instance v6, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;

    invoke-direct {v6, p0, v4, p2, v2}, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;-><init>(Landroidx/camera/camera2/internal/Camera2RequestProcessor;Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;Z)V

    .line 154
    invoke-static {v6}, Landroidx/camera/camera2/internal/CaptureCallbackContainer;->create(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroidx/camera/camera2/internal/CaptureCallbackContainer;

    move-result-object v6

    .line 153
    invoke-virtual {v5, v6}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 159
    const/4 v2, 0x0

    .line 161
    invoke-interface {v4}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTargetOutputConfigIds()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 162
    .local v7, "outputConfigId":Ljava/lang/Integer;
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-direct {p0, v8}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->findSurface(I)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 163
    .end local v7    # "outputConfigId":Ljava/lang/Integer;
    goto :goto_1

    .line 164
    :cond_1
    invoke-virtual {v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    nop

    .end local v4    # "request":Landroidx/camera/core/impl/RequestProcessor$Request;
    .end local v5    # "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    goto :goto_0

    .line 166
    :cond_2
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v3, v1}, Landroidx/camera/camera2/internal/CaptureSession;->issueBurstCaptureRequest(Ljava/util/List;)I

    move-result v3

    monitor-exit v0

    return v3

    .line 144
    .end local v1    # "captureConfigs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/camera/core/impl/CaptureConfig;>;"
    .end local v2    # "shouldInvokeSequenceCallback":Z
    :cond_3
    :goto_2
    monitor-exit v0

    const/4 v0, -0x1

    return v0

    .line 167
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V
    .locals 2
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 100
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 101
    :try_start_0
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 102
    monitor-exit v0

    .line 103
    return-void

    .line 102
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
