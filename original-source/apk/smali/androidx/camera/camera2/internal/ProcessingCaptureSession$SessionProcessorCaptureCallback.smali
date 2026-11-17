.class Landroidx/camera/camera2/internal/ProcessingCaptureSession$SessionProcessorCaptureCallback;
.super Ljava/lang/Object;
.source "ProcessingCaptureSession.java"

# interfaces
.implements Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/ProcessingCaptureSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SessionProcessorCaptureCallback"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 702
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 703
    return-void
.end method


# virtual methods
.method public onCaptureCompleted(JILandroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p1, "timestamp"    # J
    .param p3, "captureSequenceId"    # I
    .param p4, "result"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 729
    return-void
.end method

.method public onCaptureFailed(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 715
    return-void
.end method

.method public synthetic onCaptureProcessProgressed(I)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/core/impl/SessionProcessor$CaptureCallback$-CC;->$default$onCaptureProcessProgressed(Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;I)V

    return-void
.end method

.method public onCaptureProcessStarted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 711
    return-void
.end method

.method public onCaptureSequenceAborted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 723
    return-void
.end method

.method public onCaptureSequenceCompleted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 719
    return-void
.end method

.method public onCaptureStarted(IJ)V
    .locals 0
    .param p1, "captureSequenceId"    # I
    .param p2, "timestamp"    # J

    .line 707
    return-void
.end method
