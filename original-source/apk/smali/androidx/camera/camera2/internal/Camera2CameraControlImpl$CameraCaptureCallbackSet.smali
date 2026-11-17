.class final Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;
.super Landroidx/camera/core/impl/CameraCaptureCallback;
.source "Camera2CameraControlImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CameraCaptureCallbackSet"
.end annotation


# instance fields
.field mCallbackExecutors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field

.field mCallbacks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1057
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraCaptureCallback;-><init>()V

    .line 1058
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbacks:Ljava/util/Set;

    .line 1059
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbackExecutors:Ljava/util/Map;

    return-void
.end method

.method static synthetic lambda$onCaptureCancelled$2(Landroidx/camera/core/impl/CameraCaptureCallback;I)V
    .locals 0
    .param p0, "callback"    # Landroidx/camera/core/impl/CameraCaptureCallback;
    .param p1, "captureConfigId"    # I

    .line 1109
    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCancelled(I)V

    .line 1110
    return-void
.end method

.method static synthetic lambda$onCaptureCompleted$0(Landroidx/camera/core/impl/CameraCaptureCallback;ILandroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p0, "callback"    # Landroidx/camera/core/impl/CameraCaptureCallback;
    .param p1, "captureConfigId"    # I
    .param p2, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 1081
    invoke-virtual {p0, p1, p2}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCompleted(ILandroidx/camera/core/impl/CameraCaptureResult;)V

    .line 1082
    return-void
.end method

.method static synthetic lambda$onCaptureFailed$1(Landroidx/camera/core/impl/CameraCaptureCallback;ILandroidx/camera/core/impl/CameraCaptureFailure;)V
    .locals 0
    .param p0, "callback"    # Landroidx/camera/core/impl/CameraCaptureCallback;
    .param p1, "captureConfigId"    # I
    .param p2, "failure"    # Landroidx/camera/core/impl/CameraCaptureFailure;

    .line 1095
    invoke-virtual {p0, p1, p2}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureFailed(ILandroidx/camera/core/impl/CameraCaptureFailure;)V

    .line 1096
    return-void
.end method


# virtual methods
.method addCaptureCallback(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 1064
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbacks:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1065
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbackExecutors:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1066
    return-void
.end method

.method public onCaptureCancelled(I)V
    .locals 5
    .param p1, "captureConfigId"    # I

    .line 1106
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbacks:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 1108
    .local v1, "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbackExecutors:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda2;

    invoke-direct {v3, v1, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/impl/CameraCaptureCallback;I)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1113
    goto :goto_1

    .line 1111
    :catch_0
    move-exception v2

    .line 1112
    .local v2, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v3, "Camera2CameraControlImp"

    const-string v4, "Executor rejected to invoke onCaptureCancelled."

    invoke-static {v3, v4, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1114
    .end local v1    # "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    .end local v2    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_1
    goto :goto_0

    .line 1115
    :cond_0
    return-void
.end method

.method public onCaptureCompleted(ILandroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 5
    .param p1, "captureConfigId"    # I
    .param p2, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 1078
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbacks:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 1080
    .local v1, "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbackExecutors:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda1;

    invoke-direct {v3, v1, p1, p2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/impl/CameraCaptureCallback;ILandroidx/camera/core/impl/CameraCaptureResult;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1085
    goto :goto_1

    .line 1083
    :catch_0
    move-exception v2

    .line 1084
    .local v2, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v3, "Camera2CameraControlImp"

    const-string v4, "Executor rejected to invoke onCaptureCompleted."

    invoke-static {v3, v4, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1086
    .end local v1    # "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    .end local v2    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_1
    goto :goto_0

    .line 1087
    :cond_0
    return-void
.end method

.method public onCaptureFailed(ILandroidx/camera/core/impl/CameraCaptureFailure;)V
    .locals 5
    .param p1, "captureConfigId"    # I
    .param p2, "failure"    # Landroidx/camera/core/impl/CameraCaptureFailure;

    .line 1092
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbacks:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 1094
    .local v1, "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbackExecutors:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda0;

    invoke-direct {v3, v1, p1, p2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/impl/CameraCaptureCallback;ILandroidx/camera/core/impl/CameraCaptureFailure;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1099
    goto :goto_1

    .line 1097
    :catch_0
    move-exception v2

    .line 1098
    .local v2, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v3, "Camera2CameraControlImp"

    const-string v4, "Executor rejected to invoke onCaptureFailed."

    invoke-static {v3, v4, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1100
    .end local v1    # "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    .end local v2    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_1
    goto :goto_0

    .line 1101
    :cond_0
    return-void
.end method

.method removeCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 1
    .param p1, "callback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 1070
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbacks:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1071
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->mCallbackExecutors:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1072
    return-void
.end method
