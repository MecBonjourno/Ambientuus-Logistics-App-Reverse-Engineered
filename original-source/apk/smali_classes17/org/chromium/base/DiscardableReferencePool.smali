.class public Lorg/chromium/base/DiscardableReferencePool;
.super Ljava/lang/Object;
.source "DiscardableReferencePool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mPool:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 35
    .local v0, "map":Ljava/util/WeakHashMap;, "Ljava/util/WeakHashMap<Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<*>;Ljava/lang/Boolean;>;"
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/base/DiscardableReferencePool;->mPool:Ljava/util/Set;

    .line 36
    return-void
.end method


# virtual methods
.method public drain()V
    .locals 2

    .line 99
    iget-object v0, p0, Lorg/chromium/base/DiscardableReferencePool;->mPool:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;

    .line 100
    .local v1, "ref":Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;, "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<*>;"
    invoke-static {v1}, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;->-$$Nest$mdiscard(Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;)V

    .line 101
    .end local v1    # "ref":Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;, "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<*>;"
    goto :goto_0

    .line 102
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/DiscardableReferencePool;->mPool:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 103
    return-void
.end method

.method public put(Ljava/lang/Object;)Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<",
            "TT;>;"
        }
    .end annotation

    .line 74
    .local p1, "payload":Ljava/lang/Object;, "TT;"
    if-eqz p1, :cond_0

    .line 75
    new-instance v0, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;-><init>(Ljava/lang/Object;Lorg/chromium/base/DiscardableReferencePool-IA;)V

    .line 76
    .local v0, "reference":Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;, "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<TT;>;"
    iget-object v1, p0, Lorg/chromium/base/DiscardableReferencePool;->mPool:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 77
    return-object v0

    .line 74
    .end local v0    # "reference":Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;, "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<TT;>;"
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public remove(Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<",
            "*>;)V"
        }
    .end annotation

    .line 86
    .local p1, "ref":Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;, "Lorg/chromium/base/DiscardableReferencePool$DiscardableReference<*>;"
    if-eqz p1, :cond_2

    .line 87
    iget-object v0, p0, Lorg/chromium/base/DiscardableReferencePool;->mPool:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 88
    :cond_0
    invoke-virtual {p1}, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 90
    invoke-static {p1}, Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;->-$$Nest$mdiscard(Lorg/chromium/base/DiscardableReferencePool$DiscardableReference;)V

    .line 91
    iget-object v0, p0, Lorg/chromium/base/DiscardableReferencePool;->mPool:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 92
    return-void

    .line 88
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 86
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
