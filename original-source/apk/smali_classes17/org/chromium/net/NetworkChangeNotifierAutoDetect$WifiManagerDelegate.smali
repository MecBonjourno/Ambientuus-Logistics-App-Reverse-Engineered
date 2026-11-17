.class Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;
.super Ljava/lang/Object;
.source "NetworkChangeNotifierAutoDetect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/NetworkChangeNotifierAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WifiManagerDelegate"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mHasWifiPermission:Z

.field private mHasWifiPermissionComputed:Z

.field private final mLock:Ljava/lang/Object;

.field private mWifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 511
    const-class v0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 532
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 514
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mLock:Ljava/lang/Object;

    .line 534
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mContext:Landroid/content/Context;

    .line 535
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 525
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 514
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mLock:Ljava/lang/Object;

    .line 527
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private getWifiInfoLocked()Landroid/net/wifi/WifiInfo;
    .locals 3

    .line 576
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 577
    :catch_0
    move-exception v0

    .line 580
    .local v0, "firstException":Ljava/lang/NullPointerException;
    :try_start_1
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v1

    .line 581
    :catch_1
    move-exception v1

    .line 582
    .local v1, "secondException":Ljava/lang/NullPointerException;
    const/4 v2, 0x0

    return-object v2
.end method

.method private hasPermissionLocked()Z
    .locals 3

    .line 541
    iget-boolean v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mHasWifiPermissionComputed:Z

    if-eqz v0, :cond_0

    .line 542
    iget-boolean v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mHasWifiPermission:Z

    return v0

    .line 544
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mContext:Landroid/content/Context;

    .line 545
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 544
    const-string v2, "android.permission.ACCESS_WIFI_STATE"

    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mHasWifiPermission:Z

    .line 548
    iget-boolean v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mHasWifiPermission:Z

    if-eqz v0, :cond_2

    .line 549
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mContext:Landroid/content/Context;

    const-string v2, "wifi"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    goto :goto_1

    .line 550
    :cond_2
    const/4 v0, 0x0

    :goto_1
    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 551
    iput-boolean v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mHasWifiPermissionComputed:Z

    .line 552
    iget-boolean v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mHasWifiPermission:Z

    return v0
.end method


# virtual methods
.method getWifiSsid()Ljava/lang/String;
    .locals 3

    .line 559
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 561
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->hasPermissionLocked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 562
    invoke-direct {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;->getWifiInfoLocked()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    .line 563
    .local v1, "wifiInfo":Landroid/net/wifi/WifiInfo;
    if-eqz v1, :cond_0

    .line 564
    invoke-virtual {v1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v2

    monitor-exit v0

    return-object v2

    .line 566
    :cond_0
    const-string v2, ""

    monitor-exit v0

    return-object v2

    .line 568
    .end local v1    # "wifiInfo":Landroid/net/wifi/WifiInfo;
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 569
    invoke-static {}, Lorg/chromium/net/AndroidNetworkLibrary;->getWifiSSID()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 568
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
