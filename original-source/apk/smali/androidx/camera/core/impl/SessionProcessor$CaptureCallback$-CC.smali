.class public final synthetic Landroidx/camera/core/impl/SessionProcessor$CaptureCallback$-CC;
.super Ljava/lang/Object;
.source "SessionProcessor.java"


# direct methods
.method public static $default$onCaptureCompleted(Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;JILandroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
    .param p1, "timestamp"    # J
    .param p3, "captureSequenceId"    # I
    .param p4, "captureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 337
    return-void
.end method

.method public static $default$onCaptureFailed(Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;I)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
    .param p1, "captureSequenceId"    # I

    .line 297
    return-void
.end method

.method public static $default$onCaptureProcessProgressed(Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;I)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
    .param p1, "progress"    # I

    .line 351
    return-void
.end method

.method public static $default$onCaptureProcessStarted(Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;I)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
    .param p1, "captureSequenceId"    # I

    .line 288
    return-void
.end method

.method public static $default$onCaptureSequenceAborted(Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;I)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
    .param p1, "captureSequenceId"    # I

    .line 317
    return-void
.end method

.method public static $default$onCaptureSequenceCompleted(Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;I)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
    .param p1, "captureSequenceId"    # I

    .line 310
    return-void
.end method

.method public static $default$onCaptureStarted(Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;IJ)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
    .param p1, "captureSequenceId"    # I
    .param p2, "timestamp"    # J

    .line 280
    return-void
.end method
