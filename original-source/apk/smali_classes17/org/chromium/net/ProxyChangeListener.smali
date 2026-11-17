.class public Lorg/chromium/net/ProxyChangeListener;
.super Ljava/lang/Object;
.source "ProxyChangeListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/ProxyChangeListener$Delegate;,
        Lorg/chromium/net/ProxyChangeListener$ProxyConfig;,
        Lorg/chromium/net/ProxyChangeListener$Natives;,
        Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "net"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final TAG:Ljava/lang/String; = "ProxyChangeListener"

.field private static sEnabled:Z


# instance fields
.field private mDelegate:Lorg/chromium/net/ProxyChangeListener$Delegate;

.field private final mHandler:Landroid/os/Handler;

.field private final mLooper:Landroid/os/Looper;

.field private mNativePtr:J

.field private mProxyReceiver:Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

.field private mRealProxyReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static bridge synthetic -$$Nest$mproxySettingsChanged(Lorg/chromium/net/ProxyChangeListener;Lorg/chromium/net/ProxyChangeListener$ProxyConfig;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/ProxyChangeListener;->proxySettingsChanged(Lorg/chromium/net/ProxyChangeListener$ProxyConfig;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrunOnThread(Lorg/chromium/net/ProxyChangeListener;Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/ProxyChangeListener;->runOnThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smextractNewProxy(Landroid/content/Intent;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
    .locals 0

    invoke-static {p0}, Lorg/chromium/net/ProxyChangeListener;->extractNewProxy(Landroid/content/Intent;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 46
    nop

    .line 50
    const/4 v0, 0x1

    sput-boolean v0, Lorg/chromium/net/ProxyChangeListener;->sEnabled:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mLooper:Landroid/os/Looper;

    .line 114
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lorg/chromium/net/ProxyChangeListener;->mLooper:Landroid/os/Looper;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mHandler:Landroid/os/Handler;

    .line 115
    return-void
.end method

.method private assertOnThread()V
    .locals 2

    .line 329
    sget-boolean v0, Lorg/chromium/build/BuildConfig;->ENABLE_ASSERTS:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->onThread()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 330
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must be called on ProxyChangeListener thread."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 332
    :cond_1
    :goto_0
    return-void
.end method

.method public static create()Lorg/chromium/net/ProxyChangeListener;
    .locals 1

    .line 129
    new-instance v0, Lorg/chromium/net/ProxyChangeListener;

    invoke-direct {v0}, Lorg/chromium/net/ProxyChangeListener;-><init>()V

    return-object v0
.end method

.method private static extractNewProxy(Landroid/content/Intent;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
    .locals 2
    .param p0, "intent"    # Landroid/content/Intent;

    .line 171
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 172
    .local v0, "extras":Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 173
    const/4 v1, 0x0

    return-object v1

    .line 175
    :cond_0
    nop

    .line 176
    nop

    .line 177
    const-string v1, "android.intent.extra.PROXY_INFO"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ProxyInfo;

    .line 176
    invoke-static {v1}, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->-$$Nest$smfromProxyInfo(Landroid/net/ProxyInfo;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    move-result-object v1

    return-object v1
.end method

.method public static getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "property"    # Ljava/lang/String;

    .line 134
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getProxyConfig(Landroid/content/Intent;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
    .locals 8
    .param p1, "intent"    # Landroid/content/Intent;

    .line 245
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 247
    .local v0, "connectivityManager":Landroid/net/ConnectivityManager;
    nop

    .line 248
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getDefaultProxy()Landroid/net/ProxyInfo;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->-$$Nest$smfromProxyInfo(Landroid/net/ProxyInfo;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    move-result-object v1

    .line 250
    .local v1, "configFromConnectivityManager":Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
    if-nez v1, :cond_0

    .line 251
    sget-object v2, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->DIRECT:Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    return-object v2

    .line 252
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt v2, v3, :cond_2

    iget-object v2, v1, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mHost:Ljava/lang/String;

    .line 253
    const-string v3, "localhost"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, v1, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPort:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    .line 255
    invoke-static {p1}, Lorg/chromium/net/ProxyChangeListener;->extractNewProxy(Landroid/content/Intent;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    move-result-object v2

    .line 256
    .local v2, "configFromIntent":Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
    const-string v3, "ProxyChangeListener"

    const-string v4, "configFromConnectivityManager = %s, configFromIntent = %s"

    invoke-static {v3, v4, v1, v2}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 265
    if-nez v2, :cond_1

    const/4 v3, 0x0

    return-object v3

    .line 266
    :cond_1
    iget-object v3, v2, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mHost:Ljava/lang/String;

    .line 267
    .local v3, "correctHost":Ljava/lang/String;
    iget v4, v2, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPort:I

    .line 268
    .local v4, "correctPort":I
    new-instance v5, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    iget-object v6, v1, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPacUrl:Ljava/lang/String;

    iget-object v7, v1, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mExclusionList:[Ljava/lang/String;

    invoke-direct {v5, v3, v4, v6, v7}, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;)V

    return-object v5

    .line 271
    .end local v2    # "configFromIntent":Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
    .end local v3    # "correctHost":Ljava/lang/String;
    .end local v4    # "correctPort":I
    :cond_2
    return-object v1
.end method

.method private onThread()Z
    .locals 2

    .line 325
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mLooper:Landroid/os/Looper;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private proxySettingsChanged(Lorg/chromium/net/ProxyChangeListener$ProxyConfig;)V
    .locals 9
    .param p1, "cfg"    # Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    .line 220
    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->assertOnThread()V

    .line 222
    sget-boolean v0, Lorg/chromium/net/ProxyChangeListener;->sEnabled:Z

    if-nez v0, :cond_0

    .line 223
    return-void

    .line 225
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mDelegate:Lorg/chromium/net/ProxyChangeListener$Delegate;

    if-eqz v0, :cond_1

    .line 227
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mDelegate:Lorg/chromium/net/ProxyChangeListener$Delegate;

    invoke-interface {v0}, Lorg/chromium/net/ProxyChangeListener$Delegate;->proxySettingsChanged()V

    .line 229
    :cond_1
    iget-wide v0, p0, Lorg/chromium/net/ProxyChangeListener;->mNativePtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    .line 230
    return-void

    .line 233
    :cond_2
    if-eqz p1, :cond_3

    .line 234
    invoke-static {}, Lorg/chromium/net/ProxyChangeListenerJni;->get()Lorg/chromium/net/ProxyChangeListener$Natives;

    move-result-object v1

    iget-wide v2, p0, Lorg/chromium/net/ProxyChangeListener;->mNativePtr:J

    iget-object v5, p1, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mHost:Ljava/lang/String;

    iget v6, p1, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPort:I

    iget-object v7, p1, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPacUrl:Ljava/lang/String;

    iget-object v8, p1, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mExclusionList:[Ljava/lang/String;

    move-object v4, p0

    invoke-interface/range {v1 .. v8}, Lorg/chromium/net/ProxyChangeListener$Natives;->proxySettingsChangedTo(JLorg/chromium/net/ProxyChangeListener;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 238
    :cond_3
    move-object v4, p0

    invoke-static {}, Lorg/chromium/net/ProxyChangeListenerJni;->get()Lorg/chromium/net/ProxyChangeListener$Natives;

    move-result-object v0

    iget-wide v1, v4, Lorg/chromium/net/ProxyChangeListener;->mNativePtr:J

    invoke-interface {v0, v1, v2, p0}, Lorg/chromium/net/ProxyChangeListener$Natives;->proxySettingsChanged(JLorg/chromium/net/ProxyChangeListener;)V

    .line 240
    :goto_0
    return-void
.end method

.method private registerBroadcastReceiver()V
    .locals 4

    .line 279
    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->assertOnThread()V

    .line 280
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mProxyReceiver:Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

    if-nez v0, :cond_2

    .line 281
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mRealProxyReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_1

    .line 283
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 284
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.PROXY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 286
    new-instance v1, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;-><init>(Lorg/chromium/net/ProxyChangeListener;Lorg/chromium/net/ProxyChangeListener-IA;)V

    iput-object v1, p0, Lorg/chromium/net/ProxyChangeListener;->mProxyReceiver:Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

    .line 287
    nop

    .line 293
    invoke-static {}, Lorg/chromium/base/ContextUtils;->isSdkSandboxProcess()Z

    move-result v1

    if-nez v1, :cond_0

    .line 301
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/chromium/net/ProxyChangeListener;->mProxyReceiver:Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .line 300
    invoke-static {v1, v2, v3}, Lorg/chromium/base/ContextUtils;->registerNonExportedBroadcastReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 306
    :cond_0
    new-instance v1, Lorg/chromium/net/ProxyBroadcastReceiver;

    invoke-direct {v1, p0}, Lorg/chromium/net/ProxyBroadcastReceiver;-><init>(Lorg/chromium/net/ProxyChangeListener;)V

    iput-object v1, p0, Lorg/chromium/net/ProxyChangeListener;->mRealProxyReceiver:Landroid/content/BroadcastReceiver;

    .line 308
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/chromium/net/ProxyChangeListener;->mRealProxyReceiver:Landroid/content/BroadcastReceiver;

    .line 307
    invoke-static {v1, v2, v0}, Lorg/chromium/base/ContextUtils;->registerProtectedBroadcastReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 310
    return-void

    .line 281
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 280
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private runOnThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 335
    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->onThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 336
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 338
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 340
    :goto_0
    return-void
.end method

.method public static setEnabled(Z)V
    .locals 0
    .param p0, "enabled"    # Z

    .line 118
    sput-boolean p0, Lorg/chromium/net/ProxyChangeListener;->sEnabled:Z

    .line 119
    return-void
.end method

.method private unregisterBroadcastReceiver()V
    .locals 2

    .line 313
    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->assertOnThread()V

    .line 314
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mProxyReceiver:Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

    if-eqz v0, :cond_1

    .line 316
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lorg/chromium/net/ProxyChangeListener;->mProxyReceiver:Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 317
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mRealProxyReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 318
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lorg/chromium/net/ProxyChangeListener;->mRealProxyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 320
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mProxyReceiver:Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

    .line 321
    iput-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mRealProxyReceiver:Landroid/content/BroadcastReceiver;

    .line 322
    return-void

    .line 314
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method synthetic lambda$setDelegateForTesting$0$org-chromium-net-ProxyChangeListener(Lorg/chromium/net/ProxyChangeListener$Delegate;)V
    .locals 0
    .param p1, "oldValue"    # Lorg/chromium/net/ProxyChangeListener$Delegate;

    .line 124
    iput-object p1, p0, Lorg/chromium/net/ProxyChangeListener;->mDelegate:Lorg/chromium/net/ProxyChangeListener$Delegate;

    return-void
.end method

.method synthetic lambda$updateProxyConfigFromConnectivityManager$1$org-chromium-net-ProxyChangeListener(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 275
    invoke-direct {p0, p1}, Lorg/chromium/net/ProxyChangeListener;->getProxyConfig(Landroid/content/Intent;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/chromium/net/ProxyChangeListener;->proxySettingsChanged(Lorg/chromium/net/ProxyChangeListener$ProxyConfig;)V

    return-void
.end method

.method public setDelegateForTesting(Lorg/chromium/net/ProxyChangeListener$Delegate;)V
    .locals 2
    .param p1, "delegate"    # Lorg/chromium/net/ProxyChangeListener$Delegate;

    .line 122
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener;->mDelegate:Lorg/chromium/net/ProxyChangeListener$Delegate;

    .line 123
    .local v0, "oldValue":Lorg/chromium/net/ProxyChangeListener$Delegate;
    iput-object p1, p0, Lorg/chromium/net/ProxyChangeListener;->mDelegate:Lorg/chromium/net/ProxyChangeListener$Delegate;

    .line 124
    new-instance v1, Lorg/chromium/net/ProxyChangeListener$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Lorg/chromium/net/ProxyChangeListener$$ExternalSyntheticLambda1;-><init>(Lorg/chromium/net/ProxyChangeListener;Lorg/chromium/net/ProxyChangeListener$Delegate;)V

    invoke-static {v1}, Lorg/chromium/base/ResettersForTesting;->register(Ljava/lang/Runnable;)V

    .line 125
    return-void
.end method

.method public start(J)V
    .locals 5
    .param p1, "nativePtr"    # J

    .line 139
    const-string v0, "ProxyChangeListener.start"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 140
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->assertOnThread()V

    .line 141
    iget-wide v1, p0, Lorg/chromium/net/ProxyChangeListener;->mNativePtr:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    .line 142
    iput-wide p1, p0, Lorg/chromium/net/ProxyChangeListener;->mNativePtr:J

    .line 143
    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->registerBroadcastReceiver()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 145
    .end local v0    # "e":Lorg/chromium/base/TraceEvent;
    :cond_0
    return-void

    .line 141
    .restart local v0    # "e":Lorg/chromium/base/TraceEvent;
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    .end local v0    # "e":Lorg/chromium/base/TraceEvent;
    .end local p1    # "nativePtr":J
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    .restart local v0    # "e":Lorg/chromium/base/TraceEvent;
    .restart local p1    # "nativePtr":J
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v1
.end method

.method public stop()V
    .locals 2

    .line 149
    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->assertOnThread()V

    .line 150
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/chromium/net/ProxyChangeListener;->mNativePtr:J

    .line 151
    invoke-direct {p0}, Lorg/chromium/net/ProxyChangeListener;->unregisterBroadcastReceiver()V

    .line 152
    return-void
.end method

.method updateProxyConfigFromConnectivityManager(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 275
    new-instance v0, Lorg/chromium/net/ProxyChangeListener$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lorg/chromium/net/ProxyChangeListener$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/net/ProxyChangeListener;Landroid/content/Intent;)V

    invoke-direct {p0, v0}, Lorg/chromium/net/ProxyChangeListener;->runOnThread(Ljava/lang/Runnable;)V

    .line 276
    return-void
.end method
