.class public final Lorg/chromium/base/compat/ApiHelperForM;
.super Ljava/lang/Object;
.source "ApiHelperForM.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createIconWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;
    .locals 1
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .line 153
    invoke-static {p0}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    return-object v0
.end method

.method public static getActionButton(Landroid/view/MotionEvent;)I
    .locals 1
    .param p0, "event"    # Landroid/view/MotionEvent;

    .line 138
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getActionButton()I

    move-result v0

    return v0
.end method

.method public static getActionModeType(Landroid/view/ActionMode;)I
    .locals 1
    .param p0, "actionMode"    # Landroid/view/ActionMode;

    .line 115
    invoke-virtual {p0}, Landroid/view/ActionMode;->getType()I

    move-result v0

    return v0
.end method

.method public static getActiveNetwork(Landroid/net/ConnectivityManager;)Landroid/net/Network;
    .locals 1
    .param p0, "connectivityManager"    # Landroid/net/ConnectivityManager;

    .line 65
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v0

    return-object v0
.end method

.method public static getBoundNetworkForProcess(Landroid/net/ConnectivityManager;)Landroid/net/Network;
    .locals 1
    .param p0, "connectivityManager"    # Landroid/net/ConnectivityManager;

    .line 55
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getBoundNetworkForProcess()Landroid/net/Network;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultActionModeHideDuration()J
    .locals 2

    .line 119
    invoke-static {}, Landroid/view/ViewConfiguration;->getDefaultActionModeHideDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getModePhysicalHeight(Landroid/view/Display$Mode;)I
    .locals 1
    .param p0, "mode"    # Landroid/view/Display$Mode;

    .line 148
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v0

    return v0
.end method

.method public static getModePhysicalWidth(Landroid/view/Display$Mode;)I
    .locals 1
    .param p0, "mode"    # Landroid/view/Display$Mode;

    .line 143
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v0

    return v0
.end method

.method public static getNetworkHandle(Landroid/net/Network;)J
    .locals 2
    .param p0, "network"    # Landroid/net/Network;

    .line 60
    invoke-virtual {p0}, Landroid/net/Network;->getNetworkHandle()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getNetworkInfo(Landroid/net/ConnectivityManager;Landroid/net/Network;)Landroid/net/NetworkInfo;
    .locals 1
    .param p0, "connectivityManager"    # Landroid/net/ConnectivityManager;
    .param p1, "network"    # Landroid/net/Network;

    .line 71
    invoke-virtual {p0, p1}, Landroid/net/ConnectivityManager;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v0

    return-object v0
.end method

.method public static getPendingIntentImmutableFlag()I
    .locals 1

    .line 127
    const/high16 v0, 0x4000000

    return v0
.end method

.method public static getSystemService(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 163
    .local p1, "serviceClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static hideActionMode(Landroid/view/ActionMode;J)V
    .locals 0
    .param p0, "actionMode"    # Landroid/view/ActionMode;
    .param p1, "duration"    # J

    .line 123
    invoke-virtual {p0, p1, p2}, Landroid/view/ActionMode;->hide(J)V

    .line 124
    return-void
.end method

.method public static invalidateContentRectOnActionMode(Landroid/view/ActionMode;)V
    .locals 0
    .param p0, "actionMode"    # Landroid/view/ActionMode;

    .line 107
    invoke-virtual {p0}, Landroid/view/ActionMode;->invalidateContentRect()V

    .line 108
    return-void
.end method

.method public static isCleartextTrafficPermitted()Z
    .locals 1

    .line 94
    invoke-static {}, Landroid/security/NetworkSecurityPolicy;->getInstance()Landroid/security/NetworkSecurityPolicy;

    move-result-object v0

    invoke-virtual {v0}, Landroid/security/NetworkSecurityPolicy;->isCleartextTrafficPermitted()Z

    move-result v0

    return v0
.end method

.method public static isDeviceIdleMode(Landroid/os/PowerManager;)Z
    .locals 1
    .param p0, "powerManager"    # Landroid/os/PowerManager;

    .line 158
    invoke-virtual {p0}, Landroid/os/PowerManager;->isDeviceIdleMode()Z

    move-result v0

    return v0
.end method

.method public static isPermissionRevokedByPolicy(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "permission"    # Ljava/lang/String;

    .line 88
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 89
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 88
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->isPermissionRevokedByPolicy(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isProcess64Bit()Z
    .locals 1

    .line 50
    invoke-static {}, Landroid/os/Process;->is64Bit()Z

    move-result v0

    return v0
.end method

.method public static isSystemUser(Landroid/os/UserManager;)Z
    .locals 1
    .param p0, "userManager"    # Landroid/os/UserManager;

    .line 99
    invoke-virtual {p0}, Landroid/os/UserManager;->isSystemUser()Z

    move-result v0

    return v0
.end method

.method public static onPageCommitVisible(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0
    .param p0, "webViewClient"    # Landroid/webkit/WebViewClient;
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .line 43
    invoke-virtual {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageCommitVisible(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public static onWindowFocusChangedOnActionMode(Landroid/view/ActionMode;Z)V
    .locals 0
    .param p0, "actionMode"    # Landroid/view/ActionMode;
    .param p1, "gainFocus"    # Z

    .line 111
    invoke-virtual {p0, p1}, Landroid/view/ActionMode;->onWindowFocusChanged(Z)V

    .line 112
    return-void
.end method

.method public static reportNetworkConnectivity(Landroid/net/ConnectivityManager;Landroid/net/Network;Z)V
    .locals 0
    .param p0, "connectivityManager"    # Landroid/net/ConnectivityManager;
    .param p1, "network"    # Landroid/net/Network;
    .param p2, "hasConnectivity"    # Z

    .line 133
    invoke-virtual {p0, p1, p2}, Landroid/net/ConnectivityManager;->reportNetworkConnectivity(Landroid/net/Network;Z)V

    .line 134
    return-void
.end method

.method public static requestActivityPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "requestCode"    # I

    .line 77
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 78
    return-void
.end method

.method public static shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "permission"    # Ljava/lang/String;

    .line 83
    invoke-virtual {p0, p1}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
