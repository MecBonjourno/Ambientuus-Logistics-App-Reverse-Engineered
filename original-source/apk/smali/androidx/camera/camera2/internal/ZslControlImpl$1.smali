.class Landroidx/camera/camera2/internal/ZslControlImpl$1;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "ZslControlImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/camera2/internal/ZslControlImpl;->addZslConfig(Landroidx/camera/core/impl/SessionConfig$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/camera2/internal/ZslControlImpl;

.field final synthetic val$imageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/ZslControlImpl;Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/ZslControlImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 214
    iput-object p1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$1;->this$0:Landroidx/camera/camera2/internal/ZslControlImpl;

    iput-object p2, p0, Landroidx/camera/camera2/internal/ZslControlImpl$1;->val$imageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0
    .param p1, "cameraCaptureSession"    # Landroid/hardware/camera2/CameraCaptureSession;

    .line 227
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3
    .param p1, "cameraCaptureSession"    # Landroid/hardware/camera2/CameraCaptureSession;

    .line 218
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraCaptureSession;->getInputSurface()Landroid/view/Surface;

    move-result-object v0

    .line 219
    .local v0, "surface":Landroid/view/Surface;
    if-eqz v0, :cond_0

    .line 220
    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$1;->val$imageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    .line 221
    const/4 v2, 0x1

    invoke-static {v0, v2}, Landroidx/camera/core/internal/compat/ImageWriterCompat;->newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;

    move-result-object v2

    .line 220
    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->onImageWriterCreated(Landroid/media/ImageWriter;)V

    .line 223
    :cond_0
    return-void
.end method
