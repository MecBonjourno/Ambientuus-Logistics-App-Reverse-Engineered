.class Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ProxyChangeListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/ProxyChangeListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProxyReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/chromium/net/ProxyChangeListener;


# direct methods
.method private constructor <init>(Lorg/chromium/net/ProxyChangeListener;)V
    .locals 0

    .line 155
    iput-object p1, p0, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;->this$0:Lorg/chromium/net/ProxyChangeListener;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/net/ProxyChangeListener;Lorg/chromium/net/ProxyChangeListener-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;-><init>(Lorg/chromium/net/ProxyChangeListener;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onReceive$0$org-chromium-net-ProxyChangeListener$ProxyReceiver(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .line 160
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;->this$0:Lorg/chromium/net/ProxyChangeListener;

    invoke-static {p1}, Lorg/chromium/net/ProxyChangeListener;->-$$Nest$smextractNewProxy(Landroid/content/Intent;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/chromium/net/ProxyChangeListener;->-$$Nest$mproxySettingsChanged(Lorg/chromium/net/ProxyChangeListener;Lorg/chromium/net/ProxyChangeListener$ProxyConfig;)V

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 159
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.PROXY_CHANGE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;->this$0:Lorg/chromium/net/ProxyChangeListener;

    new-instance v1, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2}, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;Landroid/content/Intent;)V

    invoke-static {v0, v1}, Lorg/chromium/net/ProxyChangeListener;->-$$Nest$mrunOnThread(Lorg/chromium/net/ProxyChangeListener;Ljava/lang/Runnable;)V

    .line 162
    :cond_0
    return-void
.end method
