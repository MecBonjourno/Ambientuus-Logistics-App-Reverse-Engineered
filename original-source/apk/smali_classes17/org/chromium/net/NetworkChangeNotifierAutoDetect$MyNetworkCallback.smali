.class Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "NetworkChangeNotifierAutoDetect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/NetworkChangeNotifierAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyNetworkCallback"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mVpnInPlace:Landroid/net/Network;

.field final synthetic this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 710
    const-class v0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    return-void
.end method

.method private constructor <init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V
    .locals 0

    .line 710
    iput-object p1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Lorg/chromium/net/NetworkChangeNotifierAutoDetect-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;-><init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V

    return-void
.end method

.method private ignoreConnectedInaccessibleVpn(Landroid/net/Network;Landroid/net/NetworkCapabilities;)Z
    .locals 1
    .param p1, "network"    # Landroid/net/Network;
    .param p2, "capabilities"    # Landroid/net/NetworkCapabilities;

    .line 749
    if-nez p2, :cond_0

    .line 750
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object p2

    .line 753
    :cond_0
    if-eqz p2, :cond_2

    .line 754
    const/4 v0, 0x4

    invoke-virtual {p2, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v0

    .line 755
    invoke-virtual {v0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->vpnAccessible(Landroid/net/Network;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 753
    :goto_1
    return v0
.end method

.method private ignoreConnectedNetwork(Landroid/net/Network;Landroid/net/NetworkCapabilities;)Z
    .locals 1
    .param p1, "network"    # Landroid/net/Network;
    .param p2, "capabilities"    # Landroid/net/NetworkCapabilities;

    .line 765
    invoke-direct {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->ignoreNetworkDueToVpn(Landroid/net/Network;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 766
    invoke-direct {p0, p1, p2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->ignoreConnectedInaccessibleVpn(Landroid/net/Network;Landroid/net/NetworkCapabilities;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 765
    :goto_1
    return v0
.end method

.method private ignoreNetworkDueToVpn(Landroid/net/Network;)Z
    .locals 1
    .param p1, "network"    # Landroid/net/Network;

    .line 735
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    invoke-virtual {v0, p1}, Landroid/net/Network;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method initializeVpnInPlace()V
    .locals 4

    .line 717
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$smgetAllNetworksFiltered(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;Landroid/net/Network;)[Landroid/net/Network;

    move-result-object v0

    .line 718
    .local v0, "networks":[Landroid/net/Network;
    iput-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    .line 720
    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 721
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v3, v0, v2

    .line 722
    invoke-virtual {v1, v3}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v1

    .line 723
    .local v1, "capabilities":Landroid/net/NetworkCapabilities;
    if-eqz v1, :cond_0

    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 724
    aget-object v2, v0, v2

    iput-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    .line 727
    .end local v1    # "capabilities":Landroid/net/NetworkCapabilities;
    :cond_0
    return-void
.end method

.method public onAvailable(Landroid/net/Network;)V
    .locals 9
    .param p1, "network"    # Landroid/net/Network;

    .line 771
    const-string v0, "NetworkChangeNotifierCallback::onAvailable"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v1

    .line 772
    .local v1, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v0

    .line 773
    invoke-virtual {v0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v0

    .line 774
    .local v0, "capabilities":Landroid/net/NetworkCapabilities;
    invoke-direct {p0, p1, v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->ignoreConnectedNetwork(Landroid/net/Network;Landroid/net/NetworkCapabilities;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    .line 798
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/chromium/base/TraceEvent;->close()V

    .line 775
    :cond_0
    return-void

    .line 777
    :cond_1
    const/4 v2, 0x4

    :try_start_1
    invoke-virtual {v0, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    .line 779
    invoke-virtual {p1, v2}, Landroid/net/Network;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    :cond_2
    const/4 v2, 0x1

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    :goto_0
    move v8, v2

    .line 780
    .local v8, "makeVpnDefault":Z
    if-eqz v8, :cond_4

    .line 781
    iput-object p1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    .line 783
    :cond_4
    invoke-static {p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->networkToNetId(Landroid/net/Network;)J

    move-result-wide v5

    .line 785
    .local v5, "netId":J
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getConnectionType(Landroid/net/Network;)I

    move-result v7

    .line 786
    .local v7, "connectionType":I
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    new-instance v3, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$1;

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$1;-><init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;JIZ)V

    invoke-static {v2, v3}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$mrunOnThread(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 798
    .end local v0    # "capabilities":Landroid/net/NetworkCapabilities;
    .end local v5    # "netId":J
    .end local v7    # "connectionType":I
    .end local v8    # "makeVpnDefault":Z
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lorg/chromium/base/TraceEvent;->close()V

    .line 799
    .end local v1    # "e":Lorg/chromium/base/TraceEvent;
    :cond_5
    return-void

    .line 771
    .restart local v1    # "e":Lorg/chromium/base/TraceEvent;
    :catchall_0
    move-exception v0

    move-object v2, v0

    if-eqz v1, :cond_6

    :try_start_2
    invoke-virtual {v1}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_1
    throw v2
.end method

.method public onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V
    .locals 6
    .param p1, "network"    # Landroid/net/Network;
    .param p2, "networkCapabilities"    # Landroid/net/NetworkCapabilities;

    .line 804
    const-string v0, "NetworkChangeNotifierCallback::onCapabilitiesChanged"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 806
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-direct {p0, p1, p2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->ignoreConnectedNetwork(Landroid/net/Network;Landroid/net/NetworkCapabilities;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 819
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 807
    :cond_0
    return-void

    .line 811
    :cond_1
    :try_start_1
    invoke-static {p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->networkToNetId(Landroid/net/Network;)J

    move-result-wide v1

    .line 812
    .local v1, "netId":J
    iget-object v3, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v3}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;->getConnectionType(Landroid/net/Network;)I

    move-result v3

    .line 813
    .local v3, "connectionType":I
    iget-object v4, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    new-instance v5, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$2;

    invoke-direct {v5, p0, v1, v2, v3}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$2;-><init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;JI)V

    invoke-static {v4, v5}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$mrunOnThread(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 819
    .end local v1    # "netId":J
    .end local v3    # "connectionType":I
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 820
    .end local v0    # "e":Lorg/chromium/base/TraceEvent;
    :cond_2
    return-void

    .line 804
    .restart local v0    # "e":Lorg/chromium/base/TraceEvent;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_3

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    throw v1
.end method

.method public onLosing(Landroid/net/Network;I)V
    .locals 5
    .param p1, "network"    # Landroid/net/Network;
    .param p2, "maxMsToLive"    # I

    .line 824
    const-string v0, "NetworkChangeNotifierCallback::onLosing"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 825
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0, p1, v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->ignoreConnectedNetwork(Landroid/net/Network;Landroid/net/NetworkCapabilities;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 835
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 826
    :cond_0
    return-void

    .line 828
    :cond_1
    :try_start_1
    invoke-static {p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->networkToNetId(Landroid/net/Network;)J

    move-result-wide v1

    .line 829
    .local v1, "netId":J
    iget-object v3, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    new-instance v4, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$3;

    invoke-direct {v4, p0, v1, v2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$3;-><init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;J)V

    invoke-static {v3, v4}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$mrunOnThread(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 835
    .end local v1    # "netId":J
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 836
    .end local v0    # "e":Lorg/chromium/base/TraceEvent;
    :cond_2
    return-void

    .line 824
    .restart local v0    # "e":Lorg/chromium/base/TraceEvent;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_3

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    throw v1
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 5
    .param p1, "network"    # Landroid/net/Network;

    .line 840
    const-string v0, "NetworkChangeNotifierCallback::onLost"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 841
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-direct {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->ignoreNetworkDueToVpn(Landroid/net/Network;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 869
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 842
    :cond_0
    return-void

    .line 844
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    new-instance v2, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$4;

    invoke-direct {v2, p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$4;-><init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;Landroid/net/Network;)V

    invoke-static {v1, v2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$mrunOnThread(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Ljava/lang/Runnable;)V

    .line 853
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    if-eqz v1, :cond_4

    .line 854
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    invoke-virtual {p1, v1}, Landroid/net/Network;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 855
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->mVpnInPlace:Landroid/net/Network;

    .line 857
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$fgetmConnectivityManagerDelegate(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$smgetAllNetworksFiltered(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$ConnectivityManagerDelegate;Landroid/net/Network;)[Landroid/net/Network;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 858
    .local v4, "newNetwork":Landroid/net/Network;
    invoke-virtual {p0, v4}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->onAvailable(Landroid/net/Network;)V

    .line 857
    .end local v4    # "newNetwork":Landroid/net/Network;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 861
    :cond_2
    iget-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-virtual {v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->getCurrentNetworkState()Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getConnectionType()I

    move-result v1

    .line 862
    .local v1, "newConnectionType":I
    iget-object v2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;->this$0:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    new-instance v3, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$5;

    invoke-direct {v3, p0, v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback$5;-><init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$MyNetworkCallback;I)V

    invoke-static {v2, v3}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$mrunOnThread(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Ljava/lang/Runnable;)V

    goto :goto_1

    .line 854
    .end local v1    # "newConnectionType":I
    :cond_3
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    .end local v0    # "e":Lorg/chromium/base/TraceEvent;
    .end local p1    # "network":Landroid/net/Network;
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 869
    .restart local v0    # "e":Lorg/chromium/base/TraceEvent;
    .restart local p1    # "network":Landroid/net/Network;
    :cond_4
    :goto_1
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 870
    .end local v0    # "e":Lorg/chromium/base/TraceEvent;
    :cond_5
    return-void

    .line 840
    .restart local v0    # "e":Lorg/chromium/base/TraceEvent;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_6

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_2
    throw v1
.end method
