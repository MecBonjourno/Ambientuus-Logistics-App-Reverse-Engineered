.class Landroidx/camera/view/ProcessCameraProviderWrapperImpl;
.super Ljava/lang/Object;
.source "ProcessCameraProviderWrapperImpl.java"

# interfaces
.implements Landroidx/camera/view/ProcessCameraProviderWrapper;


# instance fields
.field private final mProcessCameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;


# direct methods
.method constructor <init>(Landroidx/camera/lifecycle/ProcessCameraProvider;)V
    .locals 0
    .param p1, "processCameraProvider"    # Landroidx/camera/lifecycle/ProcessCameraProvider;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Landroidx/camera/view/ProcessCameraProviderWrapperImpl;->mProcessCameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    .line 43
    return-void
.end method


# virtual methods
.method public bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/UseCaseGroup;)Landroidx/camera/core/Camera;
    .locals 1
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "useCaseGroup"    # Landroidx/camera/core/UseCaseGroup;

    .line 64
    iget-object v0, p0, Landroidx/camera/view/ProcessCameraProviderWrapperImpl;->mProcessCameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/camera/lifecycle/ProcessCameraProvider;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/UseCaseGroup;)Landroidx/camera/core/Camera;

    move-result-object v0

    return-object v0
.end method

.method public getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;
    .locals 1
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 75
    iget-object v0, p0, Landroidx/camera/view/ProcessCameraProviderWrapperImpl;->mProcessCameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-virtual {v0, p1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;

    move-result-object v0

    return-object v0
.end method

.method public hasCamera(Landroidx/camera/core/CameraSelector;)Z
    .locals 1
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraInfoUnavailableException;
        }
    .end annotation

    .line 48
    iget-object v0, p0, Landroidx/camera/view/ProcessCameraProviderWrapperImpl;->mProcessCameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-virtual {v0, p1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->hasCamera(Landroidx/camera/core/CameraSelector;)Z

    move-result v0

    return v0
.end method

.method public shutdownAsync()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Landroidx/camera/view/ProcessCameraProviderWrapperImpl;->mProcessCameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-virtual {v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->shutdownAsync()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public varargs unbind([Landroidx/camera/core/UseCase;)V
    .locals 1
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 53
    iget-object v0, p0, Landroidx/camera/view/ProcessCameraProviderWrapperImpl;->mProcessCameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-virtual {v0, p1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->unbind([Landroidx/camera/core/UseCase;)V

    .line 54
    return-void
.end method

.method public unbindAll()V
    .locals 1

    .line 58
    iget-object v0, p0, Landroidx/camera/view/ProcessCameraProviderWrapperImpl;->mProcessCameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-virtual {v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->unbindAll()V

    .line 59
    return-void
.end method
