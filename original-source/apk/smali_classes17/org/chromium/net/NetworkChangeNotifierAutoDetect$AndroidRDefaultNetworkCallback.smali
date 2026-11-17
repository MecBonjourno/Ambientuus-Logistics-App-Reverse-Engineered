.class Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "NetworkChangeNotifierAutoDetect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/NetworkChangeNotifierAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AndroidRDefaultNetworkCallback"
.end annotation


# instance fields
.field mLinkProperties:Landroid/net/LinkProperties;

.field mNetworkCapabilities:Landroid/net/NetworkCapabilities;

.field final synthetic this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;


# direct methods
.method private constructor <init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V
    .locals 0

    .line 619
    iput-object p1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Lorg/chromium/net/NetworkChangeNotifierAutoDetect-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;-><init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V

    return-void
.end method

.method private getNetworkState(Landroid/net/Network;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;
    .locals 12
    .param p1, "network"    # Landroid/net/Network;

    .line 669
    const/4 v0, -0x1

    .line 670
    .local v0, "type":I
    const/4 v1, -0x1

    .line 671
    .local v1, "subtype":I
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    .line 672
    const/4 v4, 0x5

    invoke-virtual {v2, v4}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_1

    .line 675
    :cond_0
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 676
    const/4 v0, 0x0

    .line 683
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getRawNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 684
    .local v2, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_1

    .line 685
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v1

    .line 687
    .end local v2    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_1
    move v6, v0

    move v7, v1

    goto :goto_2

    :cond_2
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/4 v4, 0x3

    invoke-virtual {v2, v4}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 688
    const/16 v0, 0x9

    move v6, v0

    move v7, v1

    goto :goto_2

    .line 689
    :cond_3
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 690
    const/4 v0, 0x7

    move v6, v0

    move v7, v1

    goto :goto_2

    .line 691
    :cond_4
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 694
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 695
    .restart local v2    # "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    goto :goto_0

    :cond_5
    const/16 v4, 0x11

    :goto_0
    move v0, v4

    move v6, v0

    move v7, v1

    goto :goto_2

    .line 691
    .end local v2    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_6
    move v6, v0

    move v7, v1

    goto :goto_2

    .line 674
    :cond_7
    :goto_1
    const/4 v0, 0x1

    move v6, v0

    move v7, v1

    .line 697
    .end local v0    # "type":I
    .end local v1    # "subtype":I
    .local v6, "type":I
    .local v7, "subtype":I
    :goto_2
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v0

    xor-int/lit8 v8, v0, 0x1

    .line 699
    .local v8, "isMetered":Z
    new-instance v4, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    .line 700
    invoke-static {p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->networkToNetId(Landroid/net/Network;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mLinkProperties:Landroid/net/LinkProperties;

    .line 701
    invoke-static {v0}, Lorg/chromium/base/compat/ApiHelperForP;->isPrivateDnsActive(Landroid/net/LinkProperties;)Z

    move-result v10

    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mLinkProperties:Landroid/net/LinkProperties;

    .line 702
    invoke-static {v0}, Lorg/chromium/base/compat/ApiHelperForP;->getPrivateDnsServerName(Landroid/net/LinkProperties;)Ljava/lang/String;

    move-result-object v11

    const/4 v5, 0x1

    invoke-direct/range {v4 .. v11}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;-><init>(ZIIZLjava/lang/String;ZLjava/lang/String;)V

    .line 699
    return-object v4
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 1
    .param p1, "network"    # Landroid/net/Network;

    .line 631
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mLinkProperties:Landroid/net/LinkProperties;

    .line 632
    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    .line 633
    return-void
.end method

.method public onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V
    .locals 2
    .param p1, "network"    # Landroid/net/Network;
    .param p2, "networkCapabilities"    # Landroid/net/NetworkCapabilities;

    .line 657
    iput-object p2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    .line 658
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmRegistered(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mLinkProperties:Landroid/net/LinkProperties;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    if-eqz v0, :cond_0

    .line 659
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-direct {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->getNetworkState(Landroid/net/Network;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$mconnectionTypeChangedTo(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;)V

    .line 661
    :cond_0
    return-void
.end method

.method public onLinkPropertiesChanged(Landroid/net/Network;Landroid/net/LinkProperties;)V
    .locals 2
    .param p1, "network"    # Landroid/net/Network;
    .param p2, "linkProperties"    # Landroid/net/LinkProperties;

    .line 647
    iput-object p2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mLinkProperties:Landroid/net/LinkProperties;

    .line 648
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmRegistered(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mLinkProperties:Landroid/net/LinkProperties;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    if-eqz v0, :cond_0

    .line 649
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-direct {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->getNetworkState(Landroid/net/Network;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$mconnectionTypeChangedTo(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;)V

    .line 651
    :cond_0
    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 9
    .param p1, "network"    # Landroid/net/Network;

    .line 637
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mLinkProperties:Landroid/net/LinkProperties;

    .line 638
    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->mNetworkCapabilities:Landroid/net/NetworkCapabilities;

    .line 639
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmRegistered(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 640
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$AndroidRDefaultNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    new-instance v1, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    const/4 v7, 0x0

    const-string v8, ""

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v8}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;-><init>(ZIIZLjava/lang/String;ZLjava/lang/String;)V

    invoke-static {v0, v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$mconnectionTypeChangedTo(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;)V

    .line 642
    :cond_0
    return-void
.end method
