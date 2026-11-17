.class public Lorg/chromium/net/HttpNegotiateAuthenticator;
.super Ljava/lang/Object;
.source "HttpNegotiateAuthenticator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;,
        Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;,
        Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;,
        Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "net::android"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final TAG:Ljava/lang/String; = "net_auth"


# instance fields
.field private final mAccountType:Ljava/lang/String;

.field private mSpnegoContext:Landroid/os/Bundle;


# direct methods
.method static bridge synthetic -$$Nest$mprocessResult(Lorg/chromium/net/HttpNegotiateAuthenticator;Landroid/os/Bundle;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lorg/chromium/net/HttpNegotiateAuthenticator;->processResult(Landroid/os/Bundle;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 61
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "accountType"    # Ljava/lang/String;

    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 202
    iput-object p1, p0, Lorg/chromium/net/HttpNegotiateAuthenticator;->mAccountType:Ljava/lang/String;

    .line 203
    return-void

    .line 201
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method static create(Ljava/lang/String;)Lorg/chromium/net/HttpNegotiateAuthenticator;
    .locals 1
    .param p0, "accountType"    # Ljava/lang/String;

    .line 211
    new-instance v0, Lorg/chromium/net/HttpNegotiateAuthenticator;

    invoke-direct {v0, p0}, Lorg/chromium/net/HttpNegotiateAuthenticator;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private processResult(Landroid/os/Bundle;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V
    .locals 7
    .param p1, "result"    # Landroid/os/Bundle;
    .param p2, "requestData"    # Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    .line 259
    const-string v0, "spnegoContext"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/HttpNegotiateAuthenticator;->mSpnegoContext:Landroid/os/Bundle;

    .line 262
    const-string v0, "spnegoResult"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 295
    const/16 v0, -0x9

    move v5, v0

    .local v0, "status":I
    goto :goto_0

    .line 292
    .end local v0    # "status":I
    :pswitch_0
    const/16 v0, -0x149

    .line 293
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 289
    .end local v0    # "status":I
    :pswitch_1
    const/16 v0, -0x158

    .line 290
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 286
    .end local v0    # "status":I
    :pswitch_2
    const/16 v0, -0x155

    .line 287
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 283
    .end local v0    # "status":I
    :pswitch_3
    const/16 v0, -0x153

    .line 284
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 280
    .end local v0    # "status":I
    :pswitch_4
    const/16 v0, -0x152

    .line 281
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 277
    .end local v0    # "status":I
    :pswitch_5
    const/16 v0, -0x140

    .line 278
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 274
    .end local v0    # "status":I
    :pswitch_6
    const/16 v0, -0x156

    .line 275
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 271
    .end local v0    # "status":I
    :pswitch_7
    const/4 v0, -0x3

    .line 272
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 268
    .end local v0    # "status":I
    :pswitch_8
    const/16 v0, -0x9

    .line 269
    .restart local v0    # "status":I
    move v5, v0

    goto :goto_0

    .line 265
    .end local v0    # "status":I
    :pswitch_9
    const/4 v0, 0x0

    .line 266
    .restart local v0    # "status":I
    move v5, v0

    .line 297
    .end local v0    # "status":I
    .local v5, "status":I
    :goto_0
    invoke-static {}, Lorg/chromium/net/HttpNegotiateAuthenticatorJni;->get()Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;

    move-result-object v1

    iget-wide v2, p2, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    .line 299
    const-string v0, "authtoken"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 297
    move-object v4, p0

    invoke-interface/range {v1 .. v6}, Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;->setResult(JLorg/chromium/net/HttpNegotiateAuthenticator;ILjava/lang/String;)V

    .line 300
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private requestTokenWithActivity(Landroid/content/Context;Landroid/app/Activity;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;[Ljava/lang/String;)V
    .locals 19
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "requestData"    # Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;
    .param p4, "features"    # [Ljava/lang/String;

    .line 347
    move-object/from16 v3, p0

    move-object/from16 v6, p3

    const/4 v0, 0x0

    move v7, v0

    .line 348
    .local v7, "isPreM":Z
    if-eqz v7, :cond_0

    .line 349
    const-string v0, "android.permission.MANAGE_ACCOUNTS"

    goto :goto_0

    .line 350
    :cond_0
    const-string v0, "android.permission.GET_ACCOUNTS"

    :goto_0
    move-object v8, v0

    .line 359
    .local v8, "permission":Ljava/lang/String;
    move-object/from16 v9, p1

    invoke-virtual {v3, v9, v8, v7}, Lorg/chromium/net/HttpNegotiateAuthenticator;->lacksPermission(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 360
    const-string v0, "net_auth"

    const-string v1, "ERR_MISCONFIGURED_AUTH_ENVIRONMENT: %s permission not granted. Aborting authentication"

    invoke-static {v0, v1, v8}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 362
    invoke-static {}, Lorg/chromium/net/HttpNegotiateAuthenticatorJni;->get()Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;

    move-result-object v0

    iget-wide v1, v6, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    const/16 v4, -0x157

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;->setResult(JLorg/chromium/net/HttpNegotiateAuthenticator;ILjava/lang/String;)V

    .line 365
    return-void

    .line 368
    :cond_1
    iget-object v10, v6, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->accountManager:Landroid/accounts/AccountManager;

    iget-object v11, v3, Lorg/chromium/net/HttpNegotiateAuthenticator;->mAccountType:Ljava/lang/String;

    iget-object v12, v6, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->authTokenType:Ljava/lang/String;

    iget-object v0, v6, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->options:Landroid/os/Bundle;

    new-instance v1, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;

    invoke-direct {v1, v3, v6}, Lorg/chromium/net/HttpNegotiateAuthenticator$GetTokenCallback;-><init>(Lorg/chromium/net/HttpNegotiateAuthenticator;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V

    new-instance v2, Landroid/os/Handler;

    .line 370
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->getUiThreadLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 368
    const/4 v15, 0x0

    move-object/from16 v14, p2

    move-object/from16 v13, p4

    move-object/from16 v16, v0

    move-object/from16 v17, v1

    move-object/from16 v18, v2

    invoke-virtual/range {v10 .. v18}, Landroid/accounts/AccountManager;->getAuthTokenByFeatures(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    .line 371
    return-void
.end method

.method private requestTokenWithoutActivity(Landroid/content/Context;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;[Ljava/lang/String;)V
    .locals 8
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "requestData"    # Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;
    .param p3, "features"    # [Ljava/lang/String;

    .line 312
    const-string v0, "android.permission.GET_ACCOUNTS"

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lorg/chromium/net/HttpNegotiateAuthenticator;->lacksPermission(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    const-string v0, "net_auth"

    const-string v1, "ERR_MISCONFIGURED_AUTH_ENVIRONMENT: GET_ACCOUNTS permission not granted. Aborting authentication."

    invoke-static {v0, v1}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    invoke-static {}, Lorg/chromium/net/HttpNegotiateAuthenticatorJni;->get()Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;

    move-result-object v2

    iget-wide v3, p2, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    const/16 v6, -0x157

    const/4 v7, 0x0

    move-object v5, p0

    invoke-interface/range {v2 .. v7}, Lorg/chromium/net/HttpNegotiateAuthenticator$Natives;->setResult(JLorg/chromium/net/HttpNegotiateAuthenticator;ILjava/lang/String;)V

    .line 325
    return-void

    .line 327
    :cond_0
    move-object v5, p0

    iget-object v0, p2, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->accountManager:Landroid/accounts/AccountManager;

    iget-object v1, v5, Lorg/chromium/net/HttpNegotiateAuthenticator;->mAccountType:Ljava/lang/String;

    new-instance v2, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;

    invoke-direct {v2, p0, p2}, Lorg/chromium/net/HttpNegotiateAuthenticator$GetAccountsCallback;-><init>(Lorg/chromium/net/HttpNegotiateAuthenticator;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;)V

    new-instance v3, Landroid/os/Handler;

    .line 328
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->getUiThreadLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 327
    invoke-virtual {v0, v1, p3, v2, v3}, Landroid/accounts/AccountManager;->getAccountsByTypeAndFeatures(Ljava/lang/String;[Ljava/lang/String;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    .line 329
    return-void
.end method


# virtual methods
.method getNextAuthToken(JLjava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .param p1, "nativeResultObject"    # J
    .param p3, "principal"    # Ljava/lang/String;
    .param p4, "authToken"    # Ljava/lang/String;
    .param p5, "canDelegate"    # Z

    .line 226
    if-eqz p3, :cond_3

    .line 228
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 229
    .local v0, "applicationContext":Landroid/content/Context;
    new-instance v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;

    invoke-direct {v1}, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;-><init>()V

    .line 230
    .local v1, "requestData":Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SPNEGO:HOSTBASED:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->authTokenType:Ljava/lang/String;

    .line 231
    invoke-static {v0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    iput-object v2, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->accountManager:Landroid/accounts/AccountManager;

    .line 232
    iput-wide p1, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->nativeResultObject:J

    .line 233
    const-string v2, "SPNEGO"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    .line 235
    .local v2, "features":[Ljava/lang/String;
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    iput-object v3, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->options:Landroid/os/Bundle;

    .line 236
    if-eqz p4, :cond_0

    .line 237
    iget-object v3, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->options:Landroid/os/Bundle;

    const-string v4, "incomingAuthToken"

    invoke-virtual {v3, v4, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    :cond_0
    iget-object v3, p0, Lorg/chromium/net/HttpNegotiateAuthenticator;->mSpnegoContext:Landroid/os/Bundle;

    if-eqz v3, :cond_1

    .line 241
    iget-object v3, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->options:Landroid/os/Bundle;

    const-string v4, "spnegoContext"

    iget-object v5, p0, Lorg/chromium/net/HttpNegotiateAuthenticator;->mSpnegoContext:Landroid/os/Bundle;

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 244
    :cond_1
    iget-object v3, v1, Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;->options:Landroid/os/Bundle;

    const-string v4, "canDelegate"

    invoke-virtual {v3, v4, p5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 246
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->getLastTrackedFocusedActivity()Landroid/app/Activity;

    move-result-object v3

    .line 247
    .local v3, "activity":Landroid/app/Activity;
    if-nez v3, :cond_2

    .line 248
    invoke-direct {p0, v0, v1, v2}, Lorg/chromium/net/HttpNegotiateAuthenticator;->requestTokenWithoutActivity(Landroid/content/Context;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;[Ljava/lang/String;)V

    goto :goto_0

    .line 250
    :cond_2
    invoke-direct {p0, v0, v3, v1, v2}, Lorg/chromium/net/HttpNegotiateAuthenticator;->requestTokenWithActivity(Landroid/content/Context;Landroid/app/Activity;Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;[Ljava/lang/String;)V

    .line 252
    :goto_0
    return-void

    .line 226
    .end local v0    # "applicationContext":Landroid/content/Context;
    .end local v1    # "requestData":Lorg/chromium/net/HttpNegotiateAuthenticator$RequestData;
    .end local v2    # "features":[Ljava/lang/String;
    .end local v3    # "activity":Landroid/app/Activity;
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method lacksPermission(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "permission"    # Ljava/lang/String;
    .param p3, "onlyPreM"    # Z

    .line 379
    const/4 v0, 0x0

    if-eqz p3, :cond_0

    return v0

    .line 381
    :cond_0
    nop

    .line 382
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    invoke-virtual {p1, p2, v1, v2}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v1

    .line 383
    .local v1, "permissionResult":I
    if-eqz v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method
