.class public abstract Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;
.super Ljava/lang/Object;
.source "NetworkChangeNotifierAutoDetect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/NetworkChangeNotifierAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "RegistrationPolicy"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mNotifier:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 877
    const-class v0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 877
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract destroy()V
.end method

.method protected init(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V
    .locals 0
    .param p1, "notifier"    # Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    .line 901
    iput-object p1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;->mNotifier:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    .line 902
    return-void
.end method

.method protected final register()V
    .locals 1

    .line 884
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;->mNotifier:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    if-eqz v0, :cond_0

    .line 885
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;->mNotifier:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->register()V

    .line 886
    return-void

    .line 884
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method protected final unregister()V
    .locals 1

    .line 892
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;->mNotifier:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    if-eqz v0, :cond_0

    .line 893
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;->mNotifier:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->unregister()V

    .line 894
    return-void

    .line 892
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
