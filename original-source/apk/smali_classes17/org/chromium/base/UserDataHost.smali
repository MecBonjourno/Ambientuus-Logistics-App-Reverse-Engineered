.class public final Lorg/chromium/base/UserDataHost;
.super Ljava/lang/Object;
.source "UserDataHost.java"


# instance fields
.field private final mThreadId:J

.field private mUserDataMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "+",
            "Lorg/chromium/base/UserData;",
            ">;",
            "Lorg/chromium/base/UserData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/chromium/base/UserDataHost;->mThreadId:J

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/UserDataHost;->mUserDataMap:Ljava/util/HashMap;

    return-void
.end method

.method private static checkArgument(Z)V
    .locals 2
    .param p0, "condition"    # Z

    .line 61
    if-eqz p0, :cond_0

    .line 65
    return-void

    .line 62
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Neither key nor object of UserDataHost can be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkThreadAndState()V
    .locals 4

    .line 68
    iget-wide v0, p0, Lorg/chromium/base/UserDataHost;->mThreadId:J

    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 71
    iget-object v0, p0, Lorg/chromium/base/UserDataHost;->mUserDataMap:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 74
    return-void

    .line 72
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Operation is not allowed after destroy()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "UserData must only be used on a single thread."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 126
    invoke-direct {p0}, Lorg/chromium/base/UserDataHost;->checkThreadAndState()V

    .line 130
    iget-object v0, p0, Lorg/chromium/base/UserDataHost;->mUserDataMap:Ljava/util/HashMap;

    .line 131
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Class<+Lorg/chromium/base/UserData;>;Lorg/chromium/base/UserData;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/chromium/base/UserDataHost;->mUserDataMap:Ljava/util/HashMap;

    .line 132
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/base/UserData;

    .local v2, "userData":Lorg/chromium/base/UserData;
    invoke-interface {v2}, Lorg/chromium/base/UserData;->destroy()V

    .end local v2    # "userData":Lorg/chromium/base/UserData;
    goto :goto_0

    .line 133
    :cond_0
    return-void
.end method

.method public getUserData(Ljava/lang/Class;)Lorg/chromium/base/UserData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/chromium/base/UserData;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 98
    .local p1, "key":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Lorg/chromium/base/UserDataHost;->checkThreadAndState()V

    .line 99
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lorg/chromium/base/UserDataHost;->checkArgument(Z)V

    .line 101
    iget-object v0, p0, Lorg/chromium/base/UserDataHost;->mUserDataMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/UserData;

    return-object v0
.end method

.method public removeUserData(Ljava/lang/Class;)Lorg/chromium/base/UserData;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/chromium/base/UserData;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 111
    .local p1, "key":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Lorg/chromium/base/UserDataHost;->checkThreadAndState()V

    .line 112
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lorg/chromium/base/UserDataHost;->checkArgument(Z)V

    .line 114
    iget-object v0, p0, Lorg/chromium/base/UserDataHost;->mUserDataMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 117
    iget-object v0, p0, Lorg/chromium/base/UserDataHost;->mUserDataMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/UserData;

    return-object v0

    .line 115
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "UserData for the key is not present."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setUserData(Ljava/lang/Class;Lorg/chromium/base/UserData;)Lorg/chromium/base/UserData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/chromium/base/UserData;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    .line 83
    .local p1, "key":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "object":Lorg/chromium/base/UserData;, "TT;"
    invoke-direct {p0}, Lorg/chromium/base/UserDataHost;->checkThreadAndState()V

    .line 84
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lorg/chromium/base/UserDataHost;->checkArgument(Z)V

    .line 86
    iget-object v0, p0, Lorg/chromium/base/UserDataHost;->mUserDataMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    invoke-virtual {p0, p1}, Lorg/chromium/base/UserDataHost;->getUserData(Ljava/lang/Class;)Lorg/chromium/base/UserData;

    move-result-object v0

    return-object v0
.end method
