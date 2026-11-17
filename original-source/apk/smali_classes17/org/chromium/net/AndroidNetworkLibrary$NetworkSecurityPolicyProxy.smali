.class public Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;
.super Ljava/lang/Object;
.source "AndroidNetworkLibrary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/AndroidNetworkLibrary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetworkSecurityPolicyProxy"
.end annotation


# static fields
.field private static sInstance:Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 356
    new-instance v0, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;

    invoke-direct {v0}, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;-><init>()V

    sput-object v0, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;->sInstance:Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 355
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;
    .locals 1

    .line 359
    sget-object v0, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;->sInstance:Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;

    return-object v0
.end method

.method static synthetic lambda$setInstanceForTesting$0(Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;)V
    .locals 0
    .param p0, "oldValue"    # Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;

    .line 366
    sput-object p0, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;->sInstance:Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;

    return-void
.end method

.method public static setInstanceForTesting(Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;)V
    .locals 2
    .param p0, "networkSecurityPolicyProxy"    # Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;

    .line 364
    sget-object v0, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;->sInstance:Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;

    .line 365
    .local v0, "oldValue":Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;
    sput-object p0, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;->sInstance:Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;

    .line 366
    new-instance v1, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;)V

    invoke-static {v1}, Lorg/chromium/base/ResettersForTesting;->register(Ljava/lang/Runnable;)V

    .line 367
    return-void
.end method


# virtual methods
.method public isCleartextTrafficPermitted()Z
    .locals 1

    .line 380
    nop

    .line 384
    invoke-static {}, Lorg/chromium/base/compat/ApiHelperForM;->isCleartextTrafficPermitted()Z

    move-result v0

    return v0
.end method

.method public isCleartextTrafficPermitted(Ljava/lang/String;)Z
    .locals 2
    .param p1, "host"    # Ljava/lang/String;

    .line 371
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-ge v0, v1, :cond_0

    .line 373
    invoke-virtual {p0}, Lorg/chromium/net/AndroidNetworkLibrary$NetworkSecurityPolicyProxy;->isCleartextTrafficPermitted()Z

    move-result v0

    return v0

    .line 375
    :cond_0
    invoke-static {p1}, Lorg/chromium/base/compat/ApiHelperForN;->isCleartextTrafficPermitted(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
