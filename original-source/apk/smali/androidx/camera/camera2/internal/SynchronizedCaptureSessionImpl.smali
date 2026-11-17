.class Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;
.super Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;
.source "SynchronizedCaptureSessionImpl.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SyncCaptureSessionImpl"


# instance fields
.field private final mCloseSurfaceQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

.field private final mClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mDeferrableSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation
.end field

.field private final mForceCloseSessionQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

.field private final mObjectLock:Ljava/lang/Object;

.field mOpenSessionBlockerFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

.field private final mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

.field private final mSessionResetPolicy:Landroidx/camera/camera2/internal/compat/workaround/SessionResetPolicy;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/Quirks;Landroidx/camera/camera2/internal/CaptureSessionRepository;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Landroid/os/Handler;)V
    .locals 3
    .param p1, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p2, "deviceQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p3, "repository"    # Landroidx/camera/camera2/internal/CaptureSessionRepository;
    .param p4, "executor"    # Ljava/util/concurrent/Executor;
    .param p5, "scheduledExecutorService"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p6, "compatHandler"    # Landroid/os/Handler;

    .line 83
    invoke-direct {p0, p3, p4, p5, p6}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;-><init>(Landroidx/camera/camera2/internal/CaptureSessionRepository;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Landroid/os/Handler;)V

    .line 62
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    .line 74
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 84
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    invoke-direct {v0, p1, p2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;-><init>(Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCloseSurfaceQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    .line 85
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    const-class v2, Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionStuckQuirk;

    invoke-virtual {p1, v2}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_0

    const-class v2, Landroidx/camera/camera2/internal/compat/quirk/IncorrectCaptureStateQuirk;

    .line 86
    invoke-virtual {p1, v2}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    .line 87
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

    invoke-direct {v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mForceCloseSessionQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

    .line 88
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/SessionResetPolicy;

    invoke-direct {v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/SessionResetPolicy;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mSessionResetPolicy:Landroidx/camera/camera2/internal/compat/workaround/SessionResetPolicy;

    .line 89
    iput-object p5, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 90
    return-void
.end method

.method private closeCreatedSession()V
    .locals 3

    .line 122
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getCaptureSessions()Ljava/util/List;

    move-result-object v0

    .line 123
    .local v0, "sessions":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 124
    .local v2, "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    invoke-interface {v2}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->close()V

    .line 125
    .end local v2    # "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_0

    .line 126
    :cond_0
    return-void
.end method


# virtual methods
.method public captureBurstRequests(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I
    .locals 1
    .param p2, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 172
    .local p1, "requests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    .line 173
    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->createMonitorListener(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    .line 172
    invoke-super {p0, p1, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->captureBurstRequests(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 3

    .line 188
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 189
    const-string v0, "close() has been called. Skip this invocation."

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 190
    return-void

    .line 193
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mSessionResetPolicy:Landroidx/camera/camera2/internal/compat/workaround/SessionResetPolicy;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/SessionResetPolicy;->needAbortCapture()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 195
    :try_start_0
    const-string v0, "Call abortCaptures() before closing session."

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 196
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->abortCaptures()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    goto :goto_0

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception when calling abortCaptures()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 202
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_0
    const-string v0, "Session call close()"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 203
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->getRequestsProcessedFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;)V

    .line 207
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 203
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 208
    return-void
.end method

.method debugLog(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 243
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SyncCaptureSessionImpl"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    return-void
.end method

.method public finishClose()V
    .locals 1

    .line 221
    invoke-super {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->finishClose()V

    .line 222
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->stop()V

    .line 223
    return-void
.end method

.method public getOpeningBlocker()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 131
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    .line 132
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->getRequestsProcessedFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 131
    const-wide/16 v2, 0x5dc

    invoke-static {v2, v3, v0, v1}, Landroidx/camera/core/impl/utils/futures/Futures;->makeTimeoutFuture(JLjava/util/concurrent/ScheduledExecutorService;Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$close$2$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl()V
    .locals 1

    .line 205
    const-string v0, "Session call super.close()"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 206
    invoke-super {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->close()V

    .line 207
    return-void
.end method

.method synthetic lambda$onConfigured$1$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "x$0"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 182
    invoke-super {p0, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->onConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    return-void
.end method

.method synthetic lambda$openCaptureSession$0$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "sessionConfigurationCompat"    # Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .param p3, "deferrableSurfaces"    # Ljava/util/List;
    .param p4, "v"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mSessionResetPolicy:Landroidx/camera/camera2/internal/compat/workaround/SessionResetPolicy;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/SessionResetPolicy;->needAbortCapture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->closeCreatedSession()V

    .line 113
    :cond_0
    const-string/jumbo v0, "start openCaptureSession"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 114
    invoke-super {p0, p1, p2, p3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->openCaptureSession(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public onCameraDeviceError(I)V
    .locals 3
    .param p1, "error"    # I

    .line 228
    invoke-super {p0, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->onCameraDeviceError(I)V

    .line 229
    const/4 v0, 0x5

    if-ne p1, v0, :cond_1

    .line 230
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 231
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->isCameraCaptureSessionOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mDeferrableSurfaces:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 232
    const-string v1, "Close DeferrableSurfaces for CameraDevice error."

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 234
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mDeferrableSurfaces:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/DeferrableSurface;

    .line 235
    .local v2, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-virtual {v2}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 236
    .end local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_0

    .line 238
    :cond_0
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 240
    :cond_1
    :goto_1
    return-void
.end method

.method public onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 3
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 212
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 213
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCloseSurfaceQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mDeferrableSurfaces:Ljava/util/List;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->onSessionEnd(Ljava/util/List;)V

    .line 214
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 215
    const-string v0, "onClosed()"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 216
    invoke-super {p0, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 217
    return-void

    .line 214
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 4
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 178
    const-string v0, "Session onConfigured()"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 179
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mForceCloseSessionQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    .line 180
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getCreatingCaptureSessions()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    .line 181
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getCaptureSessions()Ljava/util/List;

    move-result-object v2

    new-instance v3, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;)V

    .line 179
    invoke-virtual {v0, p1, v1, v2, v3}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->onSessionConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;Ljava/util/List;Ljava/util/List;Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession$OnConfigured;)V

    .line 183
    return-void
.end method

.method public openCaptureSession(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 6
    .param p1, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "sessionConfigurationCompat"    # Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraDevice;",
            "Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 97
    .local p3, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 101
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getCaptureSessions()Ljava/util/List;

    move-result-object v1

    .line 102
    .local v1, "configured":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v2, "futureList":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 104
    .local v4, "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    invoke-interface {v4}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->getOpeningBlocker()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    nop

    .end local v4    # "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_0

    .line 106
    :cond_0
    invoke-static {v2}, Landroidx/camera/core/impl/utils/futures/Futures;->successfulAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    iput-object v3, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mOpenSessionBlockerFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 108
    iget-object v3, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mOpenSessionBlockerFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 109
    invoke-static {v3}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v3

    new-instance v4, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda2;

    invoke-direct {v4, p0, p1, p2, p3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)V

    .line 116
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v5

    .line 109
    invoke-virtual {v3, v4, v5}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v3

    .line 108
    invoke-static {v3}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    monitor-exit v0

    return-object v3

    .line 117
    .end local v1    # "configured":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    .end local v2    # "futureList":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setSingleRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p2, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 164
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    .line 165
    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->createMonitorListener(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    .line 164
    invoke-super {p0, p1, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->setSingleRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I

    move-result v0

    return v0
.end method

.method public startWithDeferrableSurface(Ljava/util/List;J)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p2, "timeout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;J)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;>;"
        }
    .end annotation

    .line 139
    .local p1, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 140
    :try_start_0
    iput-object p1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mDeferrableSurfaces:Ljava/util/List;

    .line 141
    invoke-super {p0, p1, p2, p3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->startWithDeferrableSurface(Ljava/util/List;J)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 142
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public stop()Z
    .locals 3

    .line 148
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 149
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->isCameraCaptureSessionOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 150
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCloseSurfaceQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mDeferrableSurfaces:Ljava/util/List;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->onSessionEnd(Ljava/util/List;)V

    goto :goto_0

    .line 152
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mOpenSessionBlockerFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-eqz v1, :cond_1

    .line 153
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mOpenSessionBlockerFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 156
    :cond_1
    :goto_0
    invoke-super {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->stop()Z

    move-result v1

    monitor-exit v0

    return v1

    .line 157
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
