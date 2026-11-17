.class public final Lorg/chromium/base/compat/ApiHelperForQ;
.super Ljava/lang/Object;
.source "ApiHelperForQ.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bindIsolatedService(Landroid/content/Context;Landroid/content/Intent;ILjava/lang/String;Ljava/util/concurrent/Executor;Landroid/content/ServiceConnection;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "instanceName"    # Ljava/lang/String;
    .param p4, "executor"    # Ljava/util/concurrent/Executor;
    .param p5, "connection"    # Landroid/content/ServiceConnection;

    .line 63
    invoke-virtual/range {p0 .. p5}, Landroid/content/Context;->bindIsolatedService(Landroid/content/Intent;ILjava/lang/String;Ljava/util/concurrent/Executor;Landroid/content/ServiceConnection;)Z

    move-result v0

    return v0
.end method

.method public static canAuthenticate(Landroid/hardware/biometrics/BiometricManager;)I
    .locals 1
    .param p0, "manager"    # Landroid/hardware/biometrics/BiometricManager;

    .line 105
    invoke-virtual {p0}, Landroid/hardware/biometrics/BiometricManager;->canAuthenticate()I

    move-result v0

    return v0
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    invoke-static {p0, p1}, Landroid/os/FileUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getBiometricManagerSystemService(Landroid/content/Context;)Landroid/hardware/biometrics/BiometricManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 78
    const-class v0, Landroid/hardware/biometrics/BiometricManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/biometrics/BiometricManager;

    return-object v0
.end method

.method public static getClassification(Landroid/view/MotionEvent;)I
    .locals 1
    .param p0, "event"    # Landroid/view/MotionEvent;

    .line 73
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getClassification()I

    move-result v0

    return v0
.end method

.method public static getCurrentThermalStatus(Landroid/os/PowerManager;)I
    .locals 1
    .param p0, "powerManager"    # Landroid/os/PowerManager;

    .line 115
    invoke-virtual {p0}, Landroid/os/PowerManager;->getCurrentThermalStatus()I

    move-result v0

    return v0
.end method

.method public static getExternalVolumeNames(Landroid/content/Context;)Ljava/util/Set;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 99
    invoke-static {p0}, Landroid/provider/MediaStore;->getExternalVolumeNames(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static getTransportInfo(Landroid/net/NetworkCapabilities;)Landroid/net/TransportInfo;
    .locals 1
    .param p0, "networkCapabilities"    # Landroid/net/NetworkCapabilities;

    .line 110
    invoke-virtual {p0}, Landroid/net/NetworkCapabilities;->getTransportInfo()Landroid/net/TransportInfo;

    move-result-object v0

    return-object v0
.end method

.method public static requestCellInfoUpdate(Landroid/telephony/TelephonyManager;Lorg/chromium/base/Callback;)V
    .locals 2
    .param p0, "telephonyManager"    # Landroid/telephony/TelephonyManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/telephony/TelephonyManager;",
            "Lorg/chromium/base/Callback<",
            "Ljava/util/List<",
            "Landroid/telephony/CellInfo;",
            ">;>;)V"
        }
    .end annotation

    .line 51
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/util/List<Landroid/telephony/CellInfo;>;>;"
    sget-object v0, Lorg/chromium/base/task/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-instance v1, Lorg/chromium/base/compat/ApiHelperForQ$1;

    invoke-direct {v1, p1}, Lorg/chromium/base/compat/ApiHelperForQ$1;-><init>(Lorg/chromium/base/Callback;)V

    invoke-virtual {p0, v0, v1}, Landroid/telephony/TelephonyManager;->requestCellInfoUpdate(Ljava/util/concurrent/Executor;Landroid/telephony/TelephonyManager$CellInfoCallback;)V

    .line 59
    return-void
.end method

.method public static setIncludePending(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;

    .line 94
    invoke-static {p0}, Landroid/provider/MediaStore;->setIncludePending(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static startForeground(Landroid/app/Service;ILandroid/app/Notification;I)V
    .locals 0
    .param p0, "service"    # Landroid/app/Service;
    .param p1, "id"    # I
    .param p2, "notification"    # Landroid/app/Notification;
    .param p3, "foregroundServiceType"    # I

    .line 84
    invoke-virtual {p0, p1, p2, p3}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;I)V

    .line 85
    return-void
.end method

.method public static updateServiceGroup(Landroid/content/Context;Landroid/content/ServiceConnection;II)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "connection"    # Landroid/content/ServiceConnection;
    .param p2, "group"    # I
    .param p3, "importance"    # I

    .line 68
    invoke-virtual {p0, p1, p2, p3}, Landroid/content/Context;->updateServiceGroup(Landroid/content/ServiceConnection;II)V

    .line 69
    return-void
.end method
