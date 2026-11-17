.class Lorg/chromium/net/NetworkChangeNotifier$1;
.super Ljava/lang/Object;
.source "NetworkChangeNotifier.java"

# interfaces
.implements Lorg/chromium/net/NetworkChangeNotifierAutoDetect$Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityStateInternal(ZLorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/chromium/net/NetworkChangeNotifier;


# direct methods
.method constructor <init>(Lorg/chromium/net/NetworkChangeNotifier;)V
    .locals 0
    .param p1, "this$0"    # Lorg/chromium/net/NetworkChangeNotifier;

    .line 201
    iput-object p1, p0, Lorg/chromium/net/NetworkChangeNotifier$1;->this$0:Lorg/chromium/net/NetworkChangeNotifier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnectionCostChanged(I)V
    .locals 1
    .param p1, "newConnectionCost"    # I

    .line 208
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier$1;->this$0:Lorg/chromium/net/NetworkChangeNotifier;

    invoke-virtual {v0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionCostChange(I)V

    .line 209
    return-void
.end method

.method public onConnectionSubtypeChanged(I)V
    .locals 1
    .param p1, "newConnectionSubtype"    # I

    .line 212
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier$1;->this$0:Lorg/chromium/net/NetworkChangeNotifier;

    invoke-virtual {v0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionSubtypeChange(I)V

    .line 213
    return-void
.end method

.method public onConnectionTypeChanged(I)V
    .locals 1
    .param p1, "newConnectionType"    # I

    .line 204
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier$1;->this$0:Lorg/chromium/net/NetworkChangeNotifier;

    invoke-static {v0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->-$$Nest$mupdateCurrentConnectionType(Lorg/chromium/net/NetworkChangeNotifier;I)V

    .line 205
    return-void
.end method

.method public onNetworkConnect(JI)V
    .locals 1
    .param p1, "netId"    # J
    .param p3, "connectionType"    # I

    .line 216
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier$1;->this$0:Lorg/chromium/net/NetworkChangeNotifier;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfNetworkConnect(JI)V

    .line 217
    return-void
.end method

.method public onNetworkDisconnect(J)V
    .locals 1
    .param p1, "netId"    # J

    .line 224
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier$1;->this$0:Lorg/chromium/net/NetworkChangeNotifier;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfNetworkDisconnect(J)V

    .line 225
    return-void
.end method

.method public onNetworkSoonToDisconnect(J)V
    .locals 1
    .param p1, "netId"    # J

    .line 220
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier$1;->this$0:Lorg/chromium/net/NetworkChangeNotifier;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfNetworkSoonToDisconnect(J)V

    .line 221
    return-void
.end method

.method public purgeActiveNetworkList([J)V
    .locals 1
    .param p1, "activeNetIds"    # [J

    .line 228
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier$1;->this$0:Lorg/chromium/net/NetworkChangeNotifier;

    invoke-virtual {v0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversToPurgeActiveNetworkList([J)V

    .line 229
    return-void
.end method
