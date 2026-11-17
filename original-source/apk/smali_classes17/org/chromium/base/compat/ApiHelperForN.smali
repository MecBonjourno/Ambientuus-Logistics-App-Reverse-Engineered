.class public final Lorg/chromium/base/compat/ApiHelperForN;
.super Ljava/lang/Object;
.source "ApiHelperForN.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getRestrictBackgroundStatus(Landroid/net/ConnectivityManager;)I
    .locals 1
    .param p0, "cm"    # Landroid/net/ConnectivityManager;

    .line 66
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getRestrictBackgroundStatus()I

    move-result v0

    return v0
.end method

.method public static getStartUptimeMillis()J
    .locals 2

    .line 61
    invoke-static {}, Landroid/os/Process;->getStartUptimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static isCleartextTrafficPermitted(Ljava/lang/String;)Z
    .locals 1
    .param p0, "host"    # Ljava/lang/String;

    .line 51
    invoke-static {}, Landroid/security/NetworkSecurityPolicy;->getInstance()Landroid/security/NetworkSecurityPolicy;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/security/NetworkSecurityPolicy;->isCleartextTrafficPermitted(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static onResolvePointerIcon(Landroid/view/View;Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 56
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;

    move-result-object v0

    return-object v0
.end method

.method public static setCryptoInfoPattern(Landroid/media/MediaCodec$CryptoInfo;II)V
    .locals 1
    .param p0, "cryptoInfo"    # Landroid/media/MediaCodec$CryptoInfo;
    .param p1, "encrypt"    # I
    .param p2, "skip"    # I

    .line 40
    new-instance v0, Landroid/media/MediaCodec$CryptoInfo$Pattern;

    invoke-direct {v0, p1, p2}, Landroid/media/MediaCodec$CryptoInfo$Pattern;-><init>(II)V

    invoke-virtual {p0, v0}, Landroid/media/MediaCodec$CryptoInfo;->setPattern(Landroid/media/MediaCodec$CryptoInfo$Pattern;)V

    .line 41
    return-void
.end method

.method public static setVrModeEnabled(Landroid/app/Activity;ZLandroid/content/ComponentName;)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "enabled"    # Z
    .param p2, "requestedComponent"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 46
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->setVrModeEnabled(ZLandroid/content/ComponentName;)V

    .line 47
    return-void
.end method

.method public static startDragAndDrop(Landroid/view/View;Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "data"    # Landroid/content/ClipData;
    .param p2, "shadowBuilder"    # Landroid/view/View$DragShadowBuilder;
    .param p3, "myLocalState"    # Ljava/lang/Object;
    .param p4, "flags"    # I

    .line 35
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result v0

    return v0
.end method
