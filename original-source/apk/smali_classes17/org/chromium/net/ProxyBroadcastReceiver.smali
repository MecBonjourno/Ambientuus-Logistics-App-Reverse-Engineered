.class final Lorg/chromium/net/ProxyBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ProxyBroadcastReceiver.java"


# instance fields
.field private final mListener:Lorg/chromium/net/ProxyChangeListener;


# direct methods
.method constructor <init>(Lorg/chromium/net/ProxyChangeListener;)V
    .locals 0
    .param p1, "listener"    # Lorg/chromium/net/ProxyChangeListener;

    .line 15
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 16
    iput-object p1, p0, Lorg/chromium/net/ProxyBroadcastReceiver;->mListener:Lorg/chromium/net/ProxyChangeListener;

    .line 17
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 21
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.PROXY_CHANGE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 22
    iget-object v0, p0, Lorg/chromium/net/ProxyBroadcastReceiver;->mListener:Lorg/chromium/net/ProxyChangeListener;

    invoke-virtual {v0, p2}, Lorg/chromium/net/ProxyChangeListener;->updateProxyConfigFromConnectivityManager(Landroid/content/Intent;)V

    .line 24
    :cond_0
    return-void
.end method
