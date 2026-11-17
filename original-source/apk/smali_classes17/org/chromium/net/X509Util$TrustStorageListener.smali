.class final Lorg/chromium/net/X509Util$TrustStorageListener;
.super Landroid/content/BroadcastReceiver;
.source "X509Util.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/X509Util;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TrustStorageListener"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/net/X509Util-IA;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/X509Util$TrustStorageListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 60
    const-string v0, "Unable to reload the default TrustManager"

    const-string v1, "X509Util"

    const/4 v2, 0x0

    .line 61
    .local v2, "shouldReloadTrustManager":Z
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_2

    .line 62
    const-string v3, "android.security.action.TRUST_STORE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 63
    const/4 v2, 0x1

    goto :goto_0

    .line 64
    :cond_0
    const-string v3, "android.security.action.KEYCHAIN_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 65
    invoke-static {}, Lorg/chromium/net/X509UtilJni;->get()Lorg/chromium/net/X509Util$Natives;

    move-result-object v3

    invoke-interface {v3}, Lorg/chromium/net/X509Util$Natives;->notifyClientCertStoreChanged()V

    goto :goto_0

    .line 66
    :cond_1
    const-string v3, "android.security.action.KEY_ACCESS_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 67
    const-string v3, "android.security.extra.KEY_ACCESSIBLE"

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_3

    .line 70
    invoke-static {}, Lorg/chromium/net/X509UtilJni;->get()Lorg/chromium/net/X509Util$Natives;

    move-result-object v3

    invoke-interface {v3}, Lorg/chromium/net/X509Util$Natives;->notifyClientCertStoreChanged()V

    goto :goto_0

    .line 74
    :cond_2
    const-string v3, "android.security.STORAGE_CHANGED"

    .line 78
    .local v3, "action":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 79
    const/4 v2, 0x1

    .line 80
    invoke-static {}, Lorg/chromium/net/X509UtilJni;->get()Lorg/chromium/net/X509Util$Natives;

    move-result-object v4

    invoke-interface {v4}, Lorg/chromium/net/X509Util$Natives;->notifyClientCertStoreChanged()V

    .line 84
    .end local v3    # "action":Ljava/lang/String;
    :cond_3
    :goto_0
    if-eqz v2, :cond_4

    .line 86
    :try_start_0
    invoke-static {}, Lorg/chromium/net/X509Util;->-$$Nest$smreloadDefaultTrustManager()V
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :goto_1
    goto :goto_2

    .line 91
    :catch_0
    move-exception v3

    .line 92
    .local v3, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-static {v1, v0, v3}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 89
    .end local v3    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v3

    .line 90
    .local v3, "e":Ljava/security/KeyStoreException;
    invoke-static {v1, v0, v3}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v3    # "e":Ljava/security/KeyStoreException;
    goto :goto_1

    .line 87
    :catch_2
    move-exception v3

    .line 88
    .local v3, "e":Ljava/security/cert/CertificateException;
    invoke-static {v1, v0, v3}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v3    # "e":Ljava/security/cert/CertificateException;
    goto :goto_1

    .line 95
    :cond_4
    :goto_2
    return-void
.end method
