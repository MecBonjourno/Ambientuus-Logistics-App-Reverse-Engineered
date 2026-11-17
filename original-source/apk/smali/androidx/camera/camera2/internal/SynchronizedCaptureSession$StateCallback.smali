.class public abstract Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
.super Ljava/lang/Object;
.source "SynchronizedCaptureSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "StateCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method onActive(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 326
    return-void
.end method

.method onCaptureQueueEmpty(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 331
    return-void
.end method

.method public onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 364
    return-void
.end method

.method public onConfigureFailed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 345
    return-void
.end method

.method onConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 341
    return-void
.end method

.method onReady(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 322
    return-void
.end method

.method onSessionFinished(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 386
    return-void
.end method

.method onSurfacePrepared(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;Landroid/view/Surface;)V
    .locals 0
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    .param p2, "surface"    # Landroid/view/Surface;

    .line 337
    return-void
.end method
