.class Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;
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
    name = "GetAccountsCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/accounts/AccountManagerCallback<",
        "[",
        "Landroid/accounts/Account;",
        ">;"
    }
.end annotation


# instance fields
.field private final mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

.field final synthetic this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;


# direct methods
.method public constructor <init>(Lorg/chromium/net/HttpNegotiateAuthenticator;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V
    .locals 0
    .param p1, "this$0"    # Lorg/chromium/net/HttpNegotiateAuthenticator;
    .param p2, "requestData"    # Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    .line 95
    iput-object p1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p2, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    .line 97
    return-void
.end method


# virtual methods
.method public run(Landroid/accounts/AccountManagerFuture;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/AccountManagerFuture<",
            "[",
            "Landroid/accounts/Account;",
            ">;)V"
        }
    .end annotation

    .line 103
    .local p1, "future":Landroid/accounts/AccountManagerFuture;, "Landroid/accounts/AccountManagerFuture<[Landroid/accounts/Account;>;"
    const-string v1, "net_auth"

    :try_start_0
    invoke-interface {p1}, Landroid/accounts/AccountManagerFuture;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/accounts/Account;
    :try_end_0
    .catch Landroid/accounts/OperationCanceledException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/accounts/AuthenticatorException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .local v0, "accounts":[Landroid/accounts/Account;
    nop

    .line 111
    array-length v2, v0

    if-nez v2, :cond_0

    .line 112
    const-string v2, "ERR_MISSING_AUTH_CREDENTIALS: No account provided for the kerberos authentication. Please verify the configuration policies and that the CONTACTS runtime permission is granted. "

    invoke-static {v1, v2}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    invoke-static {}, Lorg/chromium/net/HttpNegotiateAuthenticatorJni;->get()Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;

    move-result-object v3

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-wide v4, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    iget-object v6, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    const/16 v7, -0x155

    const/4 v8, 0x0

    invoke-interface/range {v3 .. v8}, Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;->setResult(JLorg/chromium/net/HttpNegotiateAuthenticator;ILjava/lang/String;)V

    .line 118
    return-void

    .line 121
    :cond_0
    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    .line 122
    array-length v2, v0

    .line 125
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 122
    const-string v3, "ERR_MISSING_AUTH_CREDENTIALS: Found %d accounts eligible for the kerberos authentication. Please fix the configuration by providing a single account."

    invoke-static {v1, v3, v2}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    invoke-static {}, Lorg/chromium/net/HttpNegotiateAuthenticatorJni;->get()Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;

    move-result-object v4

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-wide v5, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    iget-object v7, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    const/16 v8, -0x155

    const/4 v9, 0x0

    invoke-interface/range {v4 .. v9}, Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;->setResult(JLorg/chromium/net/HttpNegotiateAuthenticator;ILjava/lang/String;)V

    .line 129
    return-void

    .line 132
    :cond_1
    iget-object v2, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "android.permission.USE_CREDENTIALS"

    invoke-virtual {v2, v4, v5, v3}, Lorg/chromium/net/HttpNegotiateAuthenticator;->lacksPermission(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 137
    const-string v2, "ERR_MISCONFIGURED_AUTH_ENVIRONMENT: USE_CREDENTIALS permission not granted. Aborting authentication."

    invoke-static {v1, v2}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    invoke-static {}, Lorg/chromium/net/HttpNegotiateAuthenticatorJni;->get()Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;

    move-result-object v3

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-wide v4, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    iget-object v6, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    const/16 v7, -0x157

    const/4 v8, 0x0

    invoke-interface/range {v3 .. v8}, Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;->setResult(JLorg/chromium/net/HttpNegotiateAuthenticator;ILjava/lang/String;)V

    .line 142
    return-void

    .line 144
    :cond_2
    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    const/4 v2, 0x0

    aget-object v2, v0, v2

    iput-object v2, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->account:Landroid/accounts/Account;

    .line 145
    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-object v2, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->accountManager:Landroid/accounts/AccountManager;

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-object v3, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->account:Landroid/accounts/Account;

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-object v4, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->authTokenType:Ljava/lang/String;

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-object v5, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->options:Landroid/os/Bundle;

    new-instance v7, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    iget-object v6, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    invoke-direct {v7, v1, v6}, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;-><init>(Lorg/chromium/net/HttpNegotiateAuthenticator;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V

    new-instance v8, Landroid/os/Handler;

    .line 148
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->getUiThreadLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v8, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 145
    const/4 v6, 0x1

    invoke-virtual/range {v2 .. v8}, Landroid/accounts/AccountManager;->getAuthToken(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;ZLandroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    .line 149
    return-void

    .line 104
    .end local v0    # "accounts":[Landroid/accounts/Account;
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    const-string v2, "ERR_UNEXPECTED: Error while attempting to retrieve accounts."

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 106
    invoke-static {}, Lorg/chromium/net/HttpNegotiateAuthenticatorJni;->get()Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;

    move-result-object v3

    iget-object v1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->mRequestData:Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    iget-wide v4, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    iget-object v6, p0, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;->this$0:Lorg/chromium/net/HttpNegotiateAuthenticator;

    const/16 v7, -0x9

    const/4 v8, 0x0

    invoke-interface/range {v3 .. v8}, Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;->setResult(JLorg/chromium/net/HttpNegotiateAuthenticator;ILjava/lang/String;)V

    .line 108
    return-void
.end method
