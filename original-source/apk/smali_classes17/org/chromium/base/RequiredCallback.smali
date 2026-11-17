.class public Lorg/chromium/base/RequiredCallback;
.super Ljava/lang/Object;
.source "RequiredCallback.java"

# interfaces
.implements Lorg/chromium/base/Callback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/chromium/base/Callback<",
        "TT;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mCallback:Lorg/chromium/base/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/Callback<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mLifetimeAssert:Lorg/chromium/base/LifetimeAssert;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 15
    return-void
.end method

.method public constructor <init>(Lorg/chromium/base/Callback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "TT;>;)V"
        }
    .end annotation

    .line 20
    .local p0, "this":Lorg/chromium/base/RequiredCallback;, "Lorg/chromium/base/RequiredCallback<TT;>;"
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-static {p0}, Lorg/chromium/base/LifetimeAssert;->create(Ljava/lang/Object;)Lorg/chromium/base/LifetimeAssert;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/RequiredCallback;->mLifetimeAssert:Lorg/chromium/base/LifetimeAssert;

    .line 21
    iput-object p1, p0, Lorg/chromium/base/RequiredCallback;->mCallback:Lorg/chromium/base/Callback;

    .line 22
    return-void
.end method


# virtual methods
.method public synthetic bind(Ljava/lang/Object;)Ljava/lang/Runnable;
    .locals 0

    invoke-static {p0, p1}, Lorg/chromium/base/Callback$-CC;->$default$bind(Lorg/chromium/base/Callback;Ljava/lang/Object;)Ljava/lang/Runnable;

    move-result-object p1

    return-object p1
.end method

.method public onResult(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 26
    .local p0, "this":Lorg/chromium/base/RequiredCallback;, "Lorg/chromium/base/RequiredCallback<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lorg/chromium/base/RequiredCallback;->mCallback:Lorg/chromium/base/Callback;

    if-eqz v0, :cond_0

    .line 27
    iget-object v0, p0, Lorg/chromium/base/RequiredCallback;->mCallback:Lorg/chromium/base/Callback;

    invoke-interface {v0, p1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    .line 28
    iget-object v0, p0, Lorg/chromium/base/RequiredCallback;->mLifetimeAssert:Lorg/chromium/base/LifetimeAssert;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/chromium/base/LifetimeAssert;->setSafeToGc(Lorg/chromium/base/LifetimeAssert;Z)V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/base/RequiredCallback;->mCallback:Lorg/chromium/base/Callback;

    .line 30
    return-void

    .line 26
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Callback was already called."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
