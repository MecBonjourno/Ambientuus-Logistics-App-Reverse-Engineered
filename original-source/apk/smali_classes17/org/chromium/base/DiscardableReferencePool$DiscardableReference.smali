.class public Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;
.super Ljava/lang/Object;
.source "DiscardableReferencePool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/DiscardableReferencePool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DiscardableReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mPayload:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$mdiscard(Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;->discard()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 42
    const-class v0, Lorg/chromium/base/DiscardableReferencePool;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 46
    .local p0, "this":Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;, "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<TT;>;"
    .local p1, "payload":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    if-eqz p1, :cond_0

    .line 48
    iput-object p1, p0, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;->mPayload:Ljava/lang/Object;

    .line 49
    return-void

    .line 47
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Lorg/chromium/base/DiscardableReferencePool-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method private discard()V
    .locals 1

    .line 63
    .local p0, "this":Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;, "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<TT;>;"
    iget-object v0, p0, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;->mPayload:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;->mPayload:Ljava/lang/Object;

    .line 65
    return-void

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 56
    .local p0, "this":Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;, "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<TT;>;"
    iget-object v0, p0, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;->mPayload:Ljava/lang/Object;

    return-object v0
.end method
