.class final Landroidx/camera/camera2/internal/TorchControl;
.super Ljava/lang/Object;
.source "TorchControl.java"


# static fields
.field static final DEFAULT_TORCH_STATE:I = 0x0

.field static final OFF:I = 0x0

.field static final ON:I = 0x1

.field private static final TAG:Ljava/lang/String; = "TorchControl"

.field static final USED_AS_FLASH:I = 0x2


# instance fields
.field private final mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field private mDefaultTorchStrength:I

.field mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mHasFlashUnit:Z

.field private mIsActive:Z

.field private mIsTorchStrengthSupported:Z

.field mTargetTorchEnabled:Z

.field private mTargetTorchStrength:I

.field private final mTorchState:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mTorchStrength:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "camera2CameraControlImpl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
    .param p2, "cameraCharacteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object p1, p0, Landroidx/camera/camera2/internal/TorchControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 103
    iput-object p3, p0, Landroidx/camera/camera2/internal/TorchControl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 105
    invoke-static {p2}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;->isFlashAvailable(Landroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mHasFlashUnit:Z

    .line 106
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->isTorchStrengthLevelSupported()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsTorchStrengthSupported:Z

    .line 107
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mHasFlashUnit:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsTorchStrengthSupported:Z

    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getDefaultTorchStrengthLevel()I

    move-result v0

    goto :goto_0

    .line 109
    :cond_0
    move v0, v1

    :goto_0
    iput v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mDefaultTorchStrength:I

    .line 110
    iget v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mDefaultTorchStrength:I

    iput v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchStrength:I

    .line 111
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchState:Landroidx/lifecycle/MutableLiveData;

    .line 112
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    iget v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mDefaultTorchStrength:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrength:Landroidx/lifecycle/MutableLiveData;

    .line 113
    new-instance v0, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/camera2/internal/TorchControl;)V

    .line 138
    .local v0, "captureResultListener":Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;
    iget-object v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->addCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 139
    return-void
.end method

.method private setLiveDataValue(Landroidx/lifecycle/MutableLiveData;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/lifecycle/MutableLiveData<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 351
    .local p1, "liveData":Landroidx/lifecycle/MutableLiveData;, "Landroidx/lifecycle/MutableLiveData<TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 352
    invoke-virtual {p1, p2}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    goto :goto_0

    .line 354
    :cond_0
    invoke-virtual {p1, p2}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    .line 356
    :goto_0
    return-void
.end method

.method private setTorchState(I)V
    .locals 3
    .param p1, "internalState"    # I

    .line 334
    packed-switch p1, :pswitch_data_0

    .line 345
    const/4 v0, 0x0

    .local v0, "state":I
    goto :goto_0

    .line 336
    .end local v0    # "state":I
    :pswitch_0
    const/4 v0, 0x1

    .line 337
    .restart local v0    # "state":I
    nop

    .line 347
    :goto_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchState:Landroidx/lifecycle/MutableLiveData;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Landroidx/camera/camera2/internal/TorchControl;->setLiveDataValue(Landroidx/lifecycle/MutableLiveData;Ljava/lang/Object;)V

    .line 348
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 200
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mHasFlashUnit:Z

    if-nez v0, :cond_0

    .line 201
    const-string v0, "TorchControl"

    const-string v1, "Unable to enableTorch due to there is no flash unit."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No flash unit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 205
    :cond_0
    move v0, p1

    .line 206
    .local v0, "torchState":I
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/TorchControl;->setTorchState(I)V

    .line 208
    new-instance v1, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0, p1}, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/TorchControl;IZ)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1
.end method

.method enableTorchInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;I)V
    .locals 3
    .param p2, "torchState"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;I)V"
        }
    .end annotation

    .line 234
    .local p1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mHasFlashUnit:Z

    if-nez v0, :cond_1

    .line 235
    if-eqz p1, :cond_0

    .line 236
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No flash unit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 238
    :cond_0
    return-void

    .line 241
    :cond_1
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsActive:Z

    const/4 v1, 0x0

    if-nez v0, :cond_3

    .line 242
    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/TorchControl;->setTorchState(I)V

    .line 243
    if-eqz p1, :cond_2

    .line 244
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 246
    :cond_2
    return-void

    .line 249
    :cond_3
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isLowLightBoostOn()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 250
    if-eqz p1, :cond_4

    .line 251
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Torch can not be enabled when low-light boost is on!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 254
    :cond_4
    return-void

    .line 257
    :cond_5
    if-eqz p2, :cond_6

    const/4 v1, 0x1

    :cond_6
    iput-boolean v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchEnabled:Z

    .line 258
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->enableTorchInternal(I)V

    .line 259
    invoke-direct {p0, p2}, Landroidx/camera/camera2/internal/TorchControl;->setTorchState(I)V

    .line 260
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_7

    .line 261
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v1, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v2, "There is a new enableTorch being set"

    invoke-direct {v1, v2}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 264
    :cond_7
    iput-object p1, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 265
    return-void
.end method

.method forceUpdateTorchStateToOff()V
    .locals 1

    .line 324
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchEnabled:Z

    if-nez v0, :cond_0

    .line 325
    return-void

    .line 328
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchEnabled:Z

    .line 329
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/TorchControl;->setTorchState(I)V

    .line 330
    return-void
.end method

.method getTorchState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 223
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchState:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method getTorchStrengthLevel()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 227
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrength:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method synthetic lambda$enableTorch$1$androidx-camera-camera2-internal-TorchControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;I)V
    .locals 0
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p2, "torchState"    # I

    .line 209
    invoke-virtual {p0, p1, p2}, Landroidx/camera/camera2/internal/TorchControl;->enableTorchInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;I)V

    return-void
.end method

.method synthetic lambda$enableTorch$2$androidx-camera-camera2-internal-TorchControl(IZLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "torchState"    # I
    .param p2, "enabled"    # Z
    .param p3, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 209
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p3, p1}, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/camera2/internal/TorchControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "enableTorch: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$new$0$androidx-camera-camera2-internal-TorchControl(Landroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 6
    .param p1, "captureResult"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 114
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 115
    invoke-virtual {p1}, Landroid/hardware/camera2/TotalCaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    .line 116
    .local v0, "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 117
    .local v3, "flashMode":Ljava/lang/Integer;
    if-eqz v3, :cond_0

    .line 118
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    move v4, v1

    .line 120
    .local v4, "torchEnabled":Z
    :goto_0
    iget-boolean v5, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchEnabled:Z

    if-ne v4, v5, :cond_1

    .line 121
    iget-object v5, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v5, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 122
    iput-object v2, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 125
    .end local v0    # "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    .end local v3    # "flashMode":Ljava/lang/Integer;
    .end local v4    # "torchEnabled":Z
    :cond_1
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsTorchStrengthSupported:Z

    if-eqz v0, :cond_2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x23

    if-lt v0, v3, :cond_2

    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_2

    .line 128
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->FLASH_STRENGTH_LEVEL:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 130
    .local v0, "torchStrength":Ljava/lang/Integer;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v4, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchStrength:I

    if-ne v3, v4, :cond_2

    .line 131
    iget-object v3, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v3, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 132
    iput-object v2, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 136
    .end local v0    # "torchStrength":Ljava/lang/Integer;
    :cond_2
    return v1
.end method

.method synthetic lambda$setTorchStrengthLevel$3$androidx-camera-camera2-internal-TorchControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;I)V
    .locals 0
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p2, "torchStrengthLevel"    # I

    .line 277
    invoke-virtual {p0, p1, p2}, Landroidx/camera/camera2/internal/TorchControl;->setTorchStrengthLevelInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;I)V

    return-void
.end method

.method synthetic lambda$setTorchStrengthLevel$4$androidx-camera-camera2-internal-TorchControl(ILandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "torchStrengthLevel"    # I
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 276
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p2, p1}, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/internal/TorchControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 278
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "setTorchStrength: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method setActive(Z)V
    .locals 4
    .param p1, "isActive"    # Z

    .line 148
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsActive:Z

    if-ne v0, p1, :cond_0

    .line 149
    return-void

    .line 152
    :cond_0
    iput-boolean p1, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsActive:Z

    .line 154
    if-nez p1, :cond_3

    .line 155
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchEnabled:Z

    if-eqz v0, :cond_1

    .line 156
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchEnabled:Z

    .line 157
    iget v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mDefaultTorchStrength:I

    iput v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchStrength:I

    .line 158
    iget-object v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->enableTorchInternal(I)V

    .line 159
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/TorchControl;->setTorchState(I)V

    .line 160
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrength:Landroidx/lifecycle/MutableLiveData;

    iget v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mDefaultTorchStrength:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Landroidx/camera/camera2/internal/TorchControl;->setLiveDataValue(Landroidx/lifecycle/MutableLiveData;Ljava/lang/Object;)V

    .line 163
    :cond_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    const-string v2, "Camera is not active."

    if-eqz v0, :cond_2

    .line 164
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v3, Landroidx/camera/core/CameraControl$OperationCanceledException;

    invoke-direct {v3, v2}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 166
    iput-object v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mEnableTorchCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 169
    :cond_2
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_3

    .line 170
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v3, Landroidx/camera/core/CameraControl$OperationCanceledException;

    invoke-direct {v3, v2}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 172
    iput-object v1, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 175
    :cond_3
    return-void
.end method

.method setTorchStrengthLevel(I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "torchStrengthLevel"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 268
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsTorchStrengthSupported:Z

    if-nez v0, :cond_0

    .line 269
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Setting torch strength is not supported on the device."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 273
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrength:Landroidx/lifecycle/MutableLiveData;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Landroidx/camera/camera2/internal/TorchControl;->setLiveDataValue(Landroidx/lifecycle/MutableLiveData;Ljava/lang/Object;)V

    .line 275
    new-instance v0, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/TorchControl;I)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method setTorchStrengthLevelInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;I)V
    .locals 3
    .param p2, "torchStrengthLevel"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;I)V"
        }
    .end annotation

    .line 285
    .local p1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsTorchStrengthSupported:Z

    if-nez v0, :cond_1

    .line 286
    if-eqz p1, :cond_0

    .line 287
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Setting torch strength is not supported on the device."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 290
    :cond_0
    return-void

    .line 293
    :cond_1
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mIsActive:Z

    if-nez v0, :cond_3

    .line 294
    if-eqz p1, :cond_2

    .line 295
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 297
    :cond_2
    return-void

    .line 300
    :cond_3
    iput p2, p0, Landroidx/camera/camera2/internal/TorchControl;->mTargetTorchStrength:I

    .line 301
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->setTorchStrengthLevelInternal(I)V

    .line 302
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isTorchOn()Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p1, :cond_4

    .line 305
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    goto :goto_0

    .line 307
    :cond_4
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_5

    .line 308
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v1, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v2, "There is a new torch strength being set."

    invoke-direct {v1, v2}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 311
    :cond_5
    iput-object p1, p0, Landroidx/camera/camera2/internal/TorchControl;->mTorchStrengthCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 313
    :goto_0
    return-void
.end method
