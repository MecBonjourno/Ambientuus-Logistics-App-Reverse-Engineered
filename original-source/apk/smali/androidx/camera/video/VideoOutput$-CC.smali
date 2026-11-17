.class public final synthetic Landroidx/camera/video/VideoOutput$-CC;
.super Ljava/lang/Object;
.source "VideoOutput.java"


# direct methods
.method public static $default$getMediaCapabilities(Landroidx/camera/video/VideoOutput;Landroidx/camera/core/CameraInfo;I)Landroidx/camera/video/VideoCapabilities;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/video/VideoOutput;
    .param p1, "cameraInfo"    # Landroidx/camera/core/CameraInfo;
    .param p2, "sessionType"    # I

    .line 164
    sget-object v0, Landroidx/camera/video/VideoCapabilities;->EMPTY:Landroidx/camera/video/VideoCapabilities;

    return-object v0
.end method

.method public static $default$getMediaSpec(Landroidx/camera/video/VideoOutput;)Landroidx/camera/core/impl/Observable;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/video/VideoOutput;

    .line 132
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/ConstantObservable;->withValue(Ljava/lang/Object;)Landroidx/camera/core/impl/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getStreamInfo(Landroidx/camera/video/VideoOutput;)Landroidx/camera/core/impl/Observable;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/video/VideoOutput;

    .line 112
    sget-object v0, Landroidx/camera/video/StreamInfo;->ALWAYS_ACTIVE_OBSERVABLE:Landroidx/camera/core/impl/Observable;

    return-object v0
.end method

.method public static $default$isSourceStreamRequired(Landroidx/camera/video/VideoOutput;)Landroidx/camera/core/impl/Observable;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/video/VideoOutput;

    .line 145
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/ConstantObservable;->withValue(Ljava/lang/Object;)Landroidx/camera/core/impl/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static $default$onSourceStateChanged(Landroidx/camera/video/VideoOutput;Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/video/VideoOutput;
    .param p1, "sourceState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 154
    return-void
.end method

.method public static $default$onSurfaceRequested(Landroidx/camera/video/VideoOutput;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Z)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/video/VideoOutput;
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;
    .param p3, "hasGlProcessing"    # Z

    .line 103
    invoke-interface {p0, p1}, Landroidx/camera/video/VideoOutput;->onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;)V

    .line 104
    return-void
.end method
