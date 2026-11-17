.class Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;
.super Ljava/lang/Object;
.source "CameraCaptureSessionCompatBaseImpl.java"

# interfaces
.implements Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CameraCaptureSessionCompatImpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;
    }
.end annotation


# instance fields
.field final mCameraCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

.field final mObject:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/hardware/camera2/CameraCaptureSession;Ljava/lang/Object;)V
    .locals 1
    .param p1, "captureSession"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "implParams"    # Ljava/lang/Object;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraCaptureSession;

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mCameraCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 41
    iput-object p2, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mObject:Ljava/lang/Object;

    .line 42
    return-void
.end method

.method static create(Landroid/hardware/camera2/CameraCaptureSession;Landroid/os/Handler;)Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CameraCaptureSessionCompatImpl;
    .locals 2
    .param p0, "captureSession"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p1, "compatHandler"    # Landroid/os/Handler;

    .line 47
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;

    new-instance v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;

    invoke-direct {v1, p1}, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;-><init>(Landroid/os/Handler;)V

    invoke-direct {v0, p0, v1}, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;-><init>(Landroid/hardware/camera2/CameraCaptureSession;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public captureBurstRequests(Ljava/util/List;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I
    .locals 4
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 57
    .local p1, "requests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper;

    invoke-direct {v0, p2, p3}, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)V

    .line 60
    .local v0, "cb":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mObject:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;

    .line 62
    .local v1, "params":Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mCameraCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;->mCompatHandler:Landroid/os/Handler;

    invoke-virtual {v2, p1, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->captureBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v2

    return v2
.end method

.method public captureSingleRequest(Landroid/hardware/camera2/CaptureRequest;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I
    .locals 4
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 69
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper;

    invoke-direct {v0, p2, p3}, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)V

    .line 72
    .local v0, "cb":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mObject:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;

    .line 74
    .local v1, "params":Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mCameraCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;->mCompatHandler:Landroid/os/Handler;

    invoke-virtual {v2, p1, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v2

    return v2
.end method

.method public setRepeatingBurstRequests(Ljava/util/List;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I
    .locals 4
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 82
    .local p1, "requests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper;

    invoke-direct {v0, p2, p3}, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)V

    .line 85
    .local v0, "cb":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mObject:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;

    .line 87
    .local v1, "params":Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mCameraCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;->mCompatHandler:Landroid/os/Handler;

    invoke-virtual {v2, p1, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v2

    return v2
.end method

.method public setSingleRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I
    .locals 4
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 95
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper;

    invoke-direct {v0, p2, p3}, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)V

    .line 98
    .local v0, "cb":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mObject:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;

    .line 100
    .local v1, "params":Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mCameraCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl$CameraCaptureSessionCompatParamsApi21;->mCompatHandler:Landroid/os/Handler;

    invoke-virtual {v2, p1, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v2

    return v2
.end method

.method public unwrap()Landroid/hardware/camera2/CameraCaptureSession;
    .locals 1

    .line 106
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraCaptureSessionCompatBaseImpl;->mCameraCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object v0
.end method
