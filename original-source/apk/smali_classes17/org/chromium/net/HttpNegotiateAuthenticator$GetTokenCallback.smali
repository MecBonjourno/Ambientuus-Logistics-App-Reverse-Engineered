.class Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;
.super Ljava/lang/Object;
.source "HttpNegotiateAuthenticator.java"

# interfaces
.implements Landroid/accounts/AccountManagerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/HttpNegotiateAuthenticator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GetTokenCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/accounts/AccountManagerCallback<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field private final mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

.field final synthetic this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;


# direct methods
.method static bridge synthetic -$$Nest$fgetmRequestData(Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;)Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    return-object p0
.end method

.method public constructor <init>(Lorg/chromium/net/HttpNegotiateAuthenticator;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V
    .locals 0
    .param p1, "this$0"    # Lorg/chromium/net/HttpNegotiateAuthenticator;
    .param p2, "requestData"    # Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    .line 155
    iput-object p1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    iput-object p2, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    .line 157
    return-void
.end method


# virtual methods
.method public run(Landroid/accounts/AccountManagerFuture;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/AccountManagerFuture<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 163
    .local p1, "future":Landroid/accounts/AccountManagerFuture;, "Landroid/accounts/AccountManagerFuture<Landroid/os/Bundle;>;"
    :try_start_0
    invoke-interface {p1}, Landroid/accounts/AccountManagerFuture;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/accounts/OperationCanceledException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/accounts/AuthenticatorException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    .local v0, "result":Landroid/os/Bundle;
    nop

    .line 171
    const-string v1, "intent"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 172
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 180
    .local v1, "appContext":Landroid/content/Context;
    new-instance v2, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback$1;

    invoke-direct {v2, p0, v1}, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback$1;-><init>(Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;Landroid/content/Context;)V

    .line 192
    .local v2, "broadcastReceiver":Landroid/content/BroadcastReceiver;
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.accounts.LOGIN_ACCOUNTS_CHANGED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2, v3}, Lorg/chromium/base/ContextUtils;->registerProtectedBroadcastReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 194
    .end local v1    # "appContext":Landroid/content/Context;
    .end local v2    # "broadcastReceiver":Landroid/content/BroadcastReceiver;
    goto :goto_0

    .line 195
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    iget-object v2, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    invoke-static {v1, v0, v2}, Lorg/chromium/net/HttpNegotiateAuthenticator;->-$$Nest$mprocessResult(Lorg/chromium/net/HttpNegotiateAuthenticator;Landroid/os/Bundle;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V

    .line 197
    :goto_0
    return-void

    .line 164
    .end local v0    # "result":Landroid/os/Bundle;
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    const-string v1, "net_auth"

    const-string v2, "ERR_UNEXPECTED: Error while attempting to obtain a token."

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    invoke-static {}, Lorg/chromium/net/HttpNegotiateAuthenticatorJni;->get()Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;

    move-result-object v3

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-wide v4, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    iget-object v6, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    const/16 v7, -0x9

    const/4 v8, 0x0

    invoke-interface/range {v3 .. v8}, Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;->setResult(JLorg/chromium/net/HttpNegotiateAuthenticator;ILjava/lang/String;)V

    .line 168
    return-void
.end method
