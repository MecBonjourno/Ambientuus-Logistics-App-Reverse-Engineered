.class public final Lorg/chromium/base/UnownedUserDataKey;
.super Ljava/lang/Object;
.source "UnownedUserDataKey.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/chromium/base/UnownedUserData;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mClazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mWeakHostAttachments:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lorg/chromium/base/UnownedUserDataHost;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 76
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 69
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/UnownedUserDataKey;->mWeakHostAttachments:Ljava/util/Set;

    .line 77
    iput-object p1, p0, Lorg/chromium/base/UnownedUserDataKey;->mClazz:Ljava/lang/Class;

    .line 78
    return-void
.end method

.method private assertNoDestroyedAttachments()V
    .locals 3

    .line 189
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    sget-boolean v0, Lorg/chromium/build/BuildConfig;->ENABLE_ASSERTS:Z

    if-eqz v0, :cond_1

    .line 190
    iget-object v0, p0, Lorg/chromium/base/UnownedUserDataKey;->mWeakHostAttachments:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/UnownedUserDataHost;

    .line 191
    .local v1, "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    invoke-virtual {v1}, Lorg/chromium/base/UnownedUserDataHost;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 195
    .end local v1    # "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    goto :goto_0

    .line 192
    .restart local v1    # "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v2, "Host should have been removed already."

    invoke-direct {v0, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 197
    .end local v1    # "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    :cond_1
    return-void
.end method

.method private removeHostAttachment(Lorg/chromium/base/UnownedUserDataHost;)V
    .locals 1
    .param p1, "host"    # Lorg/chromium/base/UnownedUserDataHost;

    .line 184
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    invoke-virtual {p1, p0}, Lorg/chromium/base/UnownedUserDataHost;->remove(Lorg/chromium/base/UnownedUserDataKey;)V

    .line 185
    iget-object v0, p0, Lorg/chromium/base/UnownedUserDataKey;->mWeakHostAttachments:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 186
    return-void
.end method


# virtual methods
.method public final attachToHost(Lorg/chromium/base/UnownedUserDataHost;Lorg/chromium/base/UnownedUserData;)V
    .locals 1
    .param p1, "host"    # Lorg/chromium/base/UnownedUserDataHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/UnownedUserDataHost;",
            "TT;)V"
        }
    .end annotation

    .line 93
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    .local p2, "object":Lorg/chromium/base/UnownedUserData;, "TT;"
    invoke-static {p2}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    invoke-virtual {p1, p0, p2}, Lorg/chromium/base/UnownedUserDataHost;->set(Lorg/chromium/base/UnownedUserDataKey;Lorg/chromium/base/UnownedUserData;)V

    .line 98
    invoke-virtual {p0, p1}, Lorg/chromium/base/UnownedUserDataKey;->isAttachedToHost(Lorg/chromium/base/UnownedUserDataHost;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 99
    iget-object v0, p0, Lorg/chromium/base/UnownedUserDataKey;->mWeakHostAttachments:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_0
    return-void
.end method

.method public final detachFromAllHosts(Lorg/chromium/base/UnownedUserData;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 145
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    .local p1, "object":Lorg/chromium/base/UnownedUserData;, "TT;"
    invoke-direct {p0}, Lorg/chromium/base/UnownedUserDataKey;->assertNoDestroyedAttachments()V

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/chromium/base/UnownedUserDataKey;->mWeakHostAttachments:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/UnownedUserDataHost;

    .line 147
    .local v1, "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    invoke-virtual {v1, p0}, Lorg/chromium/base/UnownedUserDataHost;->get(Lorg/chromium/base/UnownedUserDataKey;)Lorg/chromium/base/UnownedUserData;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 148
    invoke-direct {p0, v1}, Lorg/chromium/base/UnownedUserDataKey;->removeHostAttachment(Lorg/chromium/base/UnownedUserDataHost;)V

    .line 150
    .end local v1    # "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    :cond_0
    goto :goto_0

    .line 151
    :cond_1
    return-void
.end method

.method public final detachFromHost(Lorg/chromium/base/UnownedUserDataHost;)V
    .locals 3
    .param p1, "host"    # Lorg/chromium/base/UnownedUserDataHost;

    .line 130
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    invoke-direct {p0}, Lorg/chromium/base/UnownedUserDataKey;->assertNoDestroyedAttachments()V

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/chromium/base/UnownedUserDataKey;->mWeakHostAttachments:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/UnownedUserDataHost;

    .line 132
    .local v1, "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 133
    invoke-direct {p0, v1}, Lorg/chromium/base/UnownedUserDataKey;->removeHostAttachment(Lorg/chromium/base/UnownedUserDataHost;)V

    .line 135
    .end local v1    # "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    :cond_0
    goto :goto_0

    .line 136
    :cond_1
    return-void
.end method

.method getHostAttachmentCount(Lorg/chromium/base/UnownedUserData;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 173
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    .local p1, "object":Lorg/chromium/base/UnownedUserData;, "TT;"
    invoke-direct {p0}, Lorg/chromium/base/UnownedUserDataKey;->assertNoDestroyedAttachments()V

    .line 174
    const/4 v0, 0x0

    .line 175
    .local v0, "ret":I
    iget-object v1, p0, Lorg/chromium/base/UnownedUserDataKey;->mWeakHostAttachments:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/base/UnownedUserDataHost;

    .line 176
    .local v2, "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    invoke-virtual {v2, p0}, Lorg/chromium/base/UnownedUserDataHost;->get(Lorg/chromium/base/UnownedUserDataKey;)Lorg/chromium/base/UnownedUserData;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 177
    add-int/lit8 v0, v0, 0x1

    .line 179
    .end local v2    # "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    :cond_0
    goto :goto_0

    .line 180
    :cond_1
    return v0
.end method

.method final getValueClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation

    .line 82
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    iget-object v0, p0, Lorg/chromium/base/UnownedUserDataKey;->mClazz:Ljava/lang/Class;

    return-object v0
.end method

.method public final isAttachedToAnyHost(Lorg/chromium/base/UnownedUserData;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 168
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    .local p1, "object":Lorg/chromium/base/UnownedUserData;, "TT;"
    invoke-virtual {p0, p1}, Lorg/chromium/base/UnownedUserDataKey;->getHostAttachmentCount(Lorg/chromium/base/UnownedUserData;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final isAttachedToHost(Lorg/chromium/base/UnownedUserDataHost;)Z
    .locals 2
    .param p1, "host"    # Lorg/chromium/base/UnownedUserDataHost;

    .line 160
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    invoke-virtual {p0, p1}, Lorg/chromium/base/UnownedUserDataKey;->retrieveDataFromHost(Lorg/chromium/base/UnownedUserDataHost;)Lorg/chromium/base/UnownedUserData;

    move-result-object v0

    .line 161
    .local v0, "t":Lorg/chromium/base/UnownedUserData;, "TT;"
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public final retrieveDataFromHost(Lorg/chromium/base/UnownedUserDataHost;)Lorg/chromium/base/UnownedUserData;
    .locals 3
    .param p1, "host"    # Lorg/chromium/base/UnownedUserDataHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/UnownedUserDataHost;",
            ")TT;"
        }
    .end annotation

    .line 114
    .local p0, "this":Lorg/chromium/base/UnownedUserDataKey;, "Lorg/chromium/base/UnownedUserDataKey<TT;>;"
    invoke-direct {p0}, Lorg/chromium/base/UnownedUserDataKey;->assertNoDestroyedAttachments()V

    .line 115
    iget-object v0, p0, Lorg/chromium/base/UnownedUserDataKey;->mWeakHostAttachments:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/UnownedUserDataHost;

    .line 116
    .local v1, "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 117
    invoke-virtual {p1, p0}, Lorg/chromium/base/UnownedUserDataHost;->get(Lorg/chromium/base/UnownedUserDataKey;)Lorg/chromium/base/UnownedUserData;

    move-result-object v0

    return-object v0

    .line 119
    .end local v1    # "attachedHost":Lorg/chromium/base/UnownedUserDataHost;
    :cond_0
    goto :goto_0

    .line 120
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
