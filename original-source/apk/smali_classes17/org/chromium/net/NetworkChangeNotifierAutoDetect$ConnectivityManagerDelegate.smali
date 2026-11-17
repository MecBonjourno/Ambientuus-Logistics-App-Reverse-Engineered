.class Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;
.super Ljava/lang/Object;
.source "NetworkChangeNotifierAutoDetect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/NetworkChangeNotifierAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ConnectivityManagerDelegate"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mConnectivityManager:Landroid/net/ConnectivityManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 204
    const-class v0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 216
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    nop

    .line 209
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 210
    return-void
.end method

.method private processActiveNetworkInfo(Landroid/net/NetworkInfo;)Landroid/net/NetworkInfo;
    .locals 3
    .param p1, "networkInfo"    # Landroid/net/NetworkInfo;

    .line 223
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 224
    return-object v0

    .line 227
    :cond_0
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 228
    return-object p1

    .line 234
    :cond_1
    nop

    .line 239
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v1

    sget-object v2, Landroid/net/NetworkInfo$DetailedState;->BLOCKED:Landroid/net/NetworkInfo$DetailedState;

    if-eq v1, v2, :cond_2

    .line 242
    return-object v0

    .line 245
    :cond_2
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->getStateForApplication()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_3

    .line 248
    return-object v0

    .line 250
    :cond_3
    return-object p1
.end method


# virtual methods
.method protected getAllNetworksUnfiltered()[Landroid/net/Network;
    .locals 2

    .line 356
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v0

    .line 358
    .local v0, "networks":[Landroid/net/Network;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Landroid/net/Network;

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method getConnectionType(Landroid/net/Network;)I
    .locals 3
    .param p1, "network"    # Landroid/net/Network;

    .line 341
    invoke-virtual {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 342
    .local v0, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 343
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v2

    invoke-static {v1, v2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$smconvertToConnectionType(II)I

    move-result v1

    return v1

    .line 345
    :cond_0
    const/4 v1, 0x6

    return v1
.end method

.method getDefaultNetwork()Landroid/net/Network;
    .locals 10

    .line 451
    const/4 v0, 0x0

    .line 452
    .local v0, "defaultNetwork":Landroid/net/Network;
    nop

    .line 453
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-static {v1}, Lorg/chromium/base/compat/ApiHelperForM;->getActiveNetwork(Landroid/net/ConnectivityManager;)Landroid/net/Network;

    move-result-object v0

    .line 456
    if-eqz v0, :cond_0

    .line 457
    return-object v0

    .line 464
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 465
    .local v1, "defaultNetworkInfo":Landroid/net/NetworkInfo;
    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 466
    return-object v2

    .line 468
    :cond_1
    invoke-static {p0, v2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$smgetAllNetworksFiltered(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;Landroid/net/Network;)[Landroid/net/Network;

    move-result-object v2

    .line 469
    .local v2, "networks":[Landroid/net/Network;
    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_7

    aget-object v5, v2, v4

    .line 470
    .local v5, "network":Landroid/net/Network;
    invoke-virtual {p0, v5}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getRawNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v6

    .line 471
    .local v6, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v6, :cond_6

    .line 472
    invoke-virtual {v6}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v8

    if-eq v7, v8, :cond_2

    .line 479
    invoke-virtual {v6}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    const/16 v8, 0x11

    if-ne v7, v8, :cond_6

    .line 484
    :cond_2
    if-eqz v0, :cond_4

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1d

    if-lt v7, v8, :cond_4

    .line 486
    invoke-virtual {v6}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v7

    sget-object v8, Landroid/net/NetworkInfo$DetailedState;->CONNECTING:Landroid/net/NetworkInfo$DetailedState;

    if-ne v7, v8, :cond_3

    .line 488
    goto :goto_1

    .line 491
    :cond_3
    invoke-virtual {p0, v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getRawNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v7

    .line 492
    .local v7, "prevDefaultNetworkInfo":Landroid/net/NetworkInfo;
    if-eqz v7, :cond_4

    .line 493
    invoke-virtual {v7}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v8

    sget-object v9, Landroid/net/NetworkInfo$DetailedState;->CONNECTING:Landroid/net/NetworkInfo$DetailedState;

    if-ne v8, v9, :cond_4

    .line 495
    const/4 v0, 0x0

    .line 502
    .end local v7    # "prevDefaultNetworkInfo":Landroid/net/NetworkInfo;
    :cond_4
    if-nez v0, :cond_5

    .line 503
    move-object v0, v5

    goto :goto_1

    .line 502
    :cond_5
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 469
    .end local v5    # "network":Landroid/net/Network;
    .end local v6    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_6
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 506
    :cond_7
    return-object v0
.end method

.method protected getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;
    .locals 3
    .param p1, "network"    # Landroid/net/Network;

    .line 395
    const/4 v0, 0x2

    .line 396
    .local v0, "retryCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 400
    :try_start_0
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v2, p1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 401
    :catch_0
    move-exception v2

    .line 396
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 405
    .end local v1    # "i":I
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;
    .locals 3
    .param p1, "network"    # Landroid/net/Network;

    .line 325
    invoke-virtual {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getRawNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 326
    .local v0, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    const/16 v2, 0x11

    if-ne v1, v2, :cond_0

    .line 330
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 332
    :cond_0
    return-object v0
.end method

.method getNetworkState(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;
    .locals 12
    .param p1, "wifiManagerDelegate"    # Lorg/chromium/net/NetworkChangeNotifierAutoDetect$WifiManagerDelegate;

    .line 258
    const/4 v0, 0x0

    .line 260
    .local v0, "network":Landroid/net/Network;
    nop

    .line 261
    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getDefaultNetwork()Landroid/net/Network;

    move-result-object v0

    .line 262
    invoke-virtual {p0, v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 266
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    invoke-direct {p0, v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->processActiveNetworkInfo(Landroid/net/NetworkInfo;)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 267
    if-nez v1, :cond_0

    .line 268
    new-instance v2, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    const/4 v8, 0x0

    const-string v9, ""

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v9}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;-><init>(ZIIZLjava/lang/String;ZLjava/lang/String;)V

    return-object v2

    .line 271
    :cond_0
    if-eqz v0, :cond_3

    .line 272
    invoke-virtual {p0, v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v2

    .line 273
    .local v2, "capabilities":Landroid/net/NetworkCapabilities;
    if-eqz v2, :cond_1

    .line 274
    const/16 v3, 0xb

    invoke-virtual {v2, v3}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    move v8, v3

    .line 276
    .local v8, "isMetered":Z
    invoke-static {v0}, Lorg/chromium/net/AndroidNetworkLibrary;->getDnsStatus(Landroid/net/Network;)Lorg/chromium/net/DnsStatus;

    move-result-object v3

    .line 277
    .local v3, "dnsStatus":Lorg/chromium/net/DnsStatus;
    if-nez v3, :cond_2

    .line 278
    new-instance v4, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v6

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v7

    .line 279
    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->networkToNetId(Landroid/net/Network;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const-string v11, ""

    const/4 v5, 0x1

    invoke-direct/range {v4 .. v11}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;-><init>(ZIIZLjava/lang/String;ZLjava/lang/String;)V

    .line 278
    return-object v4

    .line 281
    :cond_2
    new-instance v4, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v6

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v7

    .line 282
    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->networkToNetId(Landroid/net/Network;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    .line 283
    invoke-virtual {v3}, Lorg/chromium/net/DnsStatus;->getPrivateDnsActive()Z

    move-result v10

    invoke-virtual {v3}, Lorg/chromium/net/DnsStatus;->getPrivateDnsServerName()Ljava/lang/String;

    move-result-object v11

    const/4 v5, 0x1

    invoke-direct/range {v4 .. v11}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;-><init>(ZIIZLjava/lang/String;ZLjava/lang/String;)V

    .line 281
    return-object v4

    .line 286
    .end local v2    # "capabilities":Landroid/net/NetworkCapabilities;
    .end local v3    # "dnsStatus":Lorg/chromium/net/DnsStatus;
    .end local v8    # "isMetered":Z
    :cond_3
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method getRawNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;
    .locals 3
    .param p1, "network"    # Landroid/net/Network;

    .line 309
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, p1}, Landroid/net/ConnectivityManager;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 310
    :catch_0
    move-exception v0

    .line 313
    .local v0, "firstException":Ljava/lang/NullPointerException;
    :try_start_1
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1, p1}, Landroid/net/ConnectivityManager;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v1

    .line 314
    :catch_1
    move-exception v1

    .line 315
    .local v1, "secondException":Ljava/lang/NullPointerException;
    const/4 v2, 0x0

    return-object v2
.end method

.method registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;Landroid/os/Handler;)V
    .locals 1
    .param p1, "networkCallback"    # Landroid/net/ConnectivityManager$NetworkCallback;
    .param p2, "handler"    # Landroid/os/Handler;

    .line 434
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-static {v0, p1, p2}, Lorg/chromium/base/compat/ApiHelperForO;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager;Landroid/net/ConnectivityManager$NetworkCallback;Landroid/os/Handler;)V

    .line 436
    return-void
.end method

.method registerNetworkCallback(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;Landroid/os/Handler;)V
    .locals 3
    .param p1, "networkRequest"    # Landroid/net/NetworkRequest;
    .param p2, "networkCallback"    # Landroid/net/ConnectivityManager$NetworkCallback;
    .param p3, "handler"    # Landroid/os/Handler;

    .line 416
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_2

    .line 417
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskReads()Lorg/chromium/base/StrictModeContext;

    move-result-object v0

    .line 420
    .local v0, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1, p1, p2, p3}, Landroid/net/ConnectivityManager;->registerNetworkCallback(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;Landroid/os/Handler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 422
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 417
    .end local v0    # "ignored":Lorg/chromium/base/StrictModeContext;
    :cond_0
    goto :goto_1

    .restart local v0    # "ignored":Lorg/chromium/base/StrictModeContext;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1

    .line 424
    .end local v0    # "ignored":Lorg/chromium/base/StrictModeContext;
    :cond_2
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, p1, p2}, Landroid/net/ConnectivityManager;->registerNetworkCallback(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 426
    :goto_1
    return-void
.end method

.method unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    .locals 1
    .param p1, "networkCallback"    # Landroid/net/ConnectivityManager$NetworkCallback;

    .line 443
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, p1}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 444
    return-void
.end method

.method protected vpnAccessible(Landroid/net/Network;)Z
    .locals 4
    .param p1, "network"    # Landroid/net/Network;

    .line 369
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    .line 372
    .local v0, "s":Ljava/net/Socket;
    :try_start_0
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowAllVmPolicies()Lorg/chromium/base/StrictModeContext;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 375
    .local v1, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_1
    invoke-virtual {p1, v0}, Landroid/net/Network;->bindSocket(Ljava/net/Socket;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 376
    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 381
    .end local v1    # "ignored":Lorg/chromium/base/StrictModeContext;
    :cond_0
    :try_start_3
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 384
    goto :goto_0

    .line 382
    :catch_0
    move-exception v1

    .line 385
    nop

    .line 386
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 372
    .restart local v1    # "ignored":Lorg/chromium/base/StrictModeContext;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_1

    :try_start_4
    invoke-virtual {v1}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    :try_start_5
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "s":Ljava/net/Socket;
    .end local p1    # "network":Landroid/net/Network;
    :cond_1
    :goto_1
    throw v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 380
    .end local v1    # "ignored":Lorg/chromium/base/StrictModeContext;
    .restart local v0    # "s":Ljava/net/Socket;
    .restart local p1    # "network":Landroid/net/Network;
    :catchall_2
    move-exception v1

    .line 381
    :try_start_6
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    .line 384
    goto :goto_2

    .line 382
    :catch_1
    move-exception v2

    .line 385
    :goto_2
    throw v1

    .line 376
    :catch_2
    move-exception v1

    .line 378
    .local v1, "e":Ljava/io/IOException;
    nop

    .line 381
    :try_start_7
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 384
    goto :goto_3

    .line 382
    :catch_3
    move-exception v2

    .line 378
    :goto_3
    const/4 v2, 0x0

    return v2
.end method
