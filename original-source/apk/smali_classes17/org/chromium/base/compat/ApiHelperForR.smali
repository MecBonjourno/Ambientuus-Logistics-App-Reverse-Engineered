.class public final Lorg/chromium/base/compat/ApiHelperForR;
.super Ljava/lang/Object;
.source "ApiHelperForR.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDisplay(Landroid/content/Context;)Landroid/view/Display;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    move-result-object v0

    return-object v0
.end method

.method public static getMaximumWindowMetricsBounds(Landroid/view/WindowManager;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "manager"    # Landroid/view/WindowManager;

    .line 63
    invoke-interface {p0}, Landroid/view/WindowManager;->getMaximumWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method public static getVolumeDir(Landroid/os/storage/StorageManager;Landroid/net/Uri;)Ljava/io/File;
    .locals 1
    .param p0, "manager"    # Landroid/os/storage/StorageManager;
    .param p1, "uri"    # Landroid/net/Uri;

    .line 41
    invoke-virtual {p0, p1}, Landroid/os/storage/StorageManager;->getStorageVolume(Landroid/net/Uri;)Landroid/os/storage/StorageVolume;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/storage/StorageVolume;->getDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static setProcessStateSummary(Landroid/app/ActivityManager;[B)V
    .locals 0
    .param p0, "am"    # Landroid/app/ActivityManager;
    .param p1, "bytes"    # [B

    .line 55
    invoke-virtual {p0, p1}, Landroid/app/ActivityManager;->setProcessStateSummary([B)V

    .line 56
    return-void
.end method

.method public static verifyInputEvent(Landroid/hardware/input/InputManager;Landroid/view/InputEvent;)Landroid/view/VerifiedInputEvent;
    .locals 1
    .param p0, "manager"    # Landroid/hardware/input/InputManager;
    .param p1, "inputEvent"    # Landroid/view/InputEvent;

    .line 48
    invoke-virtual {p0, p1}, Landroid/hardware/input/InputManager;->verifyInputEvent(Landroid/view/InputEvent;)Landroid/view/VerifiedInputEvent;

    move-result-object v0

    return-object v0
.end method
