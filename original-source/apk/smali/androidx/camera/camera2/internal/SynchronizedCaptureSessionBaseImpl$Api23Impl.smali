.class Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl$Api23Impl;
.super Ljava/lang/Object;
.source "SynchronizedCaptureSessionBaseImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Api23Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 637
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 638
    return-void
.end method

.method static createHighSpeedRequestList(Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;
    .locals 1
    .param p0, "constrainedHighSpeedSession"    # Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;
    .param p1, "captureRequest"    # Landroid/hardware/camera2/CaptureRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;",
            "Landroid/hardware/camera2/CaptureRequest;",
            ")",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 649
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;->createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static getInputSurface(Landroid/hardware/camera2/CameraCaptureSession;)Landroid/view/Surface;
    .locals 1
    .param p0, "cameraCaptureSession"    # Landroid/hardware/camera2/CameraCaptureSession;

    .line 641
    invoke-virtual {p0}, Landroid/hardware/camera2/CameraCaptureSession;->getInputSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method
