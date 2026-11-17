.class public final synthetic Landroidx/camera/core/impl/RequestProcessor$Callback$-CC;
.super Ljava/lang/Object;
.source "RequestProcessor.java"


# direct methods
.method public static $default$onCaptureBufferLost(Landroidx/camera/core/impl/RequestProcessor$Callback;Landroidx/camera/core/impl/RequestProcessor$Request;JI)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "frameNumber"    # J
    .param p4, "outputConfigId"    # I

    .line 116
    return-void
.end method

.method public static $default$onCaptureCompleted(Landroidx/camera/core/impl/RequestProcessor$Callback;Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "captureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 107
    return-void
.end method

.method public static $default$onCaptureFailed(Landroidx/camera/core/impl/RequestProcessor$Callback;Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureFailure;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "captureFailure"    # Landroidx/camera/core/impl/CameraCaptureFailure;

    .line 111
    return-void
.end method

.method public static $default$onCaptureProgressed(Landroidx/camera/core/impl/RequestProcessor$Callback;Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "captureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 103
    return-void
.end method

.method public static $default$onCaptureSequenceAborted(Landroidx/camera/core/impl/RequestProcessor$Callback;I)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .param p1, "sequenceId"    # I

    .line 120
    return-void
.end method

.method public static $default$onCaptureSequenceCompleted(Landroidx/camera/core/impl/RequestProcessor$Callback;IJ)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .param p1, "sequenceId"    # I
    .param p2, "frameNumber"    # J

    .line 118
    return-void
.end method

.method public static $default$onCaptureStarted(Landroidx/camera/core/impl/RequestProcessor$Callback;Landroidx/camera/core/impl/RequestProcessor$Request;JJ)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "frameNumber"    # J
    .param p4, "timestamp"    # J

    .line 99
    return-void
.end method
