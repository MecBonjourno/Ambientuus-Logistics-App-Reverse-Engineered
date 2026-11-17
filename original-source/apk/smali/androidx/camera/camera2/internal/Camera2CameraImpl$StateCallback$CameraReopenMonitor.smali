.class Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;
.super Ljava/lang/Object;
.source "Camera2CameraImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CameraReopenMonitor"
.end annotation


# static fields
.field static final ACTIVE_REOPEN_DELAY_BASE_MS:I = 0x3e8

.field static final ACTIVE_REOPEN_LIMIT_MS:I = 0x1b7740

.field static final INVALID_TIME:I = -0x1

.field static final REOPEN_DELAY_MS:I = 0x2bc

.field static final REOPEN_LIMIT_MS:I = 0x2710


# instance fields
.field private final mCameraOpenRetryMaxTimeoutInMs:J

.field private mFirstReopenTime:J

.field final synthetic this$1:Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;J)V
    .locals 2
    .param p1, "this$1"    # Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;
    .param p2, "cameraOpenRetryMaxTimeoutInMs"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 2507
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->this$1:Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2505
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mFirstReopenTime:J

    .line 2508
    iput-wide p2, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mCameraOpenRetryMaxTimeoutInMs:J

    .line 2509
    return-void
.end method


# virtual methods
.method canScheduleCameraReopen()Z
    .locals 4

    .line 2549
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->getElapsedTime()J

    move-result-wide v0

    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->getReopenLimitMs()I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ltz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 2553
    .local v0, "hasReachedLimit":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 2554
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->reset()V

    .line 2555
    return v2

    .line 2558
    :cond_1
    return v1
.end method

.method getElapsedTime()J
    .locals 6

    .line 2539
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 2541
    .local v0, "now":J
    iget-wide v2, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mFirstReopenTime:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 2542
    iput-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mFirstReopenTime:J

    .line 2545
    :cond_0
    iget-wide v2, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mFirstReopenTime:J

    sub-long v2, v0, v2

    return-wide v2
.end method

.method getReopenDelayMs()I
    .locals 4

    .line 2512
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->this$1:Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;->shouldActiveResume()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2513
    const/16 v0, 0x2bc

    return v0

    .line 2515
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->getElapsedTime()J

    move-result-wide v0

    .line 2516
    .local v0, "elapsedTime":J
    const-wide/32 v2, 0x1d4c0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    .line 2517
    const/16 v2, 0x3e8

    return v2

    .line 2518
    :cond_1
    const-wide/32 v2, 0x493e0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_2

    .line 2519
    const/16 v2, 0x7d0

    return v2

    .line 2521
    :cond_2
    const/16 v2, 0xfa0

    return v2
.end method

.method getReopenLimitMs()I
    .locals 5

    .line 2527
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->this$1:Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback;->shouldActiveResume()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-nez v0, :cond_1

    .line 2528
    iget-wide v3, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mCameraOpenRetryMaxTimeoutInMs:J

    cmp-long v0, v3, v1

    const/16 v1, 0x2710

    if-lez v0, :cond_0

    .line 2529
    iget-wide v2, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mCameraOpenRetryMaxTimeoutInMs:J

    long-to-int v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_0

    .line 2530
    :cond_0
    nop

    .line 2528
    :goto_0
    return v1

    .line 2532
    :cond_1
    iget-wide v3, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mCameraOpenRetryMaxTimeoutInMs:J

    cmp-long v0, v3, v1

    const v1, 0x1b7740

    if-lez v0, :cond_2

    .line 2533
    iget-wide v2, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mCameraOpenRetryMaxTimeoutInMs:J

    long-to-int v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_1

    .line 2534
    :cond_2
    nop

    .line 2532
    :goto_1
    return v1
.end method

.method reset()V
    .locals 2

    .line 2562
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$StateCallback$CameraReopenMonitor;->mFirstReopenTime:J

    .line 2563
    return-void
.end method
