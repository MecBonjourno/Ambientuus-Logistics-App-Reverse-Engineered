.class public Lorg/chromium/base/RadioUtils;
.super Ljava/lang/Object;
.source "RadioUtils.java"


# annotations
.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base::android"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static sHaveAccessNetworkState:Ljava/lang/Boolean;

.field private static sHaveAccessWifiState:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 28
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getCellDataActivity()I
    .locals 4

    .line 131
    invoke-static {}, Lorg/chromium/base/RadioUtils;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 132
    const-string v0, "RadioUtils::getCellDataActivity"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 134
    .local v0, "te":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_1
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDataActivity()I

    move-result v2
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 142
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 137
    :cond_0
    return v2

    .line 138
    :catch_0
    move-exception v2

    .line 140
    .local v2, "e":Ljava/lang/SecurityException;
    nop

    .line 142
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 140
    :cond_1
    const/4 v3, -0x1

    return v3

    .line 132
    .end local v1    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .end local v2    # "e":Ljava/lang/SecurityException;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v1

    .line 131
    .end local v0    # "te":Lorg/chromium/base/TraceEvent;
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static getCellSignalLevel()I
    .locals 5

    .line 105
    invoke-static {}, Lorg/chromium/base/RadioUtils;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 106
    const-string v0, "RadioUtils::getCellSignalLevel"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 108
    .local v0, "te":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    const/4 v2, -0x1

    .line 112
    .local v2, "level":I
    :try_start_1
    invoke-static {v1}, Lorg/chromium/base/compat/ApiHelperForP;->getSignalStrength(Landroid/telephony/TelephonyManager;)Landroid/telephony/SignalStrength;

    move-result-object v3

    .line 113
    .local v3, "signalStrength":Landroid/telephony/SignalStrength;
    if-eqz v3, :cond_0

    .line 114
    invoke-virtual {v3}, Landroid/telephony/SignalStrength;->getLevel()I

    move-result v4
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v2, v4

    .line 119
    .end local v3    # "signalStrength":Landroid/telephony/SignalStrength;
    :cond_0
    goto :goto_0

    .line 116
    :catch_0
    move-exception v3

    .line 120
    :goto_0
    nop

    .line 121
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 120
    :cond_1
    return v2

    .line 106
    .end local v1    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .end local v2    # "level":I
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw v1

    .line 105
    .end local v0    # "te":Lorg/chromium/base/TraceEvent;
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static haveAccessNetworkState()Z
    .locals 4

    .line 51
    sget-object v0, Lorg/chromium/base/RadioUtils;->sHaveAccessNetworkState:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    .line 53
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 54
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    .line 55
    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    .line 53
    const-string v3, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {v0, v3, v1, v2}, Lorg/chromium/base/ApiCompatibilityUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/RadioUtils;->sHaveAccessNetworkState:Ljava/lang/Boolean;

    .line 58
    :cond_1
    sget-object v0, Lorg/chromium/base/RadioUtils;->sHaveAccessNetworkState:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private static haveAccessWifiState()Z
    .locals 4

    .line 64
    sget-object v0, Lorg/chromium/base/RadioUtils;->sHaveAccessWifiState:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    .line 66
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 67
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    .line 66
    const-string v3, "android.permission.ACCESS_WIFI_STATE"

    invoke-static {v0, v3, v1, v2}, Lorg/chromium/base/ApiCompatibilityUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/RadioUtils;->sHaveAccessWifiState:Ljava/lang/Boolean;

    .line 70
    :cond_1
    sget-object v0, Lorg/chromium/base/RadioUtils;->sHaveAccessWifiState:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private static isSupported()Z
    .locals 2

    .line 44
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    invoke-static {}, Lorg/chromium/base/RadioUtils;->haveAccessNetworkState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    invoke-static {}, Lorg/chromium/base/RadioUtils;->haveAccessWifiState()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 44
    :goto_0
    return v0
.end method

.method private static isWifiConnected()Z
    .locals 5

    .line 80
    invoke-static {}, Lorg/chromium/base/RadioUtils;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 81
    const-string v0, "RadioUtils::isWifiConnected"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 83
    .local v0, "te":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 85
    .local v1, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-static {v1}, Lorg/chromium/base/compat/ApiHelperForM;->getActiveNetwork(Landroid/net/ConnectivityManager;)Landroid/net/Network;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    .local v2, "network":Landroid/net/Network;
    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 87
    nop

    .line 95
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 87
    :cond_0
    return v3

    .line 89
    :cond_1
    nop

    .line 90
    :try_start_1
    invoke-virtual {v1, v2}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    .local v4, "networkCapabilities":Landroid/net/NetworkCapabilities;
    if-nez v4, :cond_3

    .line 92
    nop

    .line 95
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 92
    :cond_2
    return v3

    .line 94
    :cond_3
    const/4 v3, 0x1

    :try_start_2
    invoke-virtual {v4, v3}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 94
    :cond_4
    return v3

    .line 81
    .end local v1    # "connectivityManager":Landroid/net/ConnectivityManager;
    .end local v2    # "network":Landroid/net/Network;
    .end local v4    # "networkCapabilities":Landroid/net/NetworkCapabilities;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_5

    :try_start_3
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_0
    throw v1

    .line 80
    .end local v0    # "te":Lorg/chromium/base/TraceEvent;
    :cond_6
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
