.class Lorg/chromium/base/LifetimeAssert$WrappedReference$1;
.super Ljava/lang/Thread;
.source "LifetimeAssert.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/LifetimeAssert$WrappedReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "arg0"    # Ljava/lang/String;

    .line 86
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 88
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/chromium/base/LifetimeAssert$WrappedReference$1;->setDaemon(Z)V

    .line 89
    invoke-virtual {p0}, Lorg/chromium/base/LifetimeAssert$WrappedReference$1;->start()V

    .line 90
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 97
    nop

    :goto_0
    :try_start_0
    invoke-static {}, Lorg/chromium/base/LifetimeAssert$WrappedReference;->-$$Nest$sfgetsReferenceQueue()Ljava/lang/ref/ReferenceQueue;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->remove()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;

    .line 98
    .local v0, "wrapper":Lorg/chromium/base/LifetimeAssert$WrappedReference;
    invoke-static {}, Lorg/chromium/base/LifetimeAssert$WrappedReference;->-$$Nest$sfgetsActiveWrappers()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 101
    goto :goto_0

    .line 103
    :cond_0
    iget-boolean v1, v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->mSafeToGc:Z

    if-nez v1, :cond_2

    .line 104
    const-string v1, "Object of type %s was GC\'ed without cleanup. Refer to \"Caused by\" for where object was created."

    iget-object v2, v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->mTargetClass:Ljava/lang/Class;

    .line 107
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    .line 104
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "msg":Ljava/lang/String;
    sget-object v2, Lorg/chromium/base/LifetimeAssert;->sTestHook:Lorg/chromium/base/LifetimeAssert$TestHook;

    if-eqz v2, :cond_1

    .line 109
    sget-object v2, Lorg/chromium/base/LifetimeAssert;->sTestHook:Lorg/chromium/base/LifetimeAssert$TestHook;

    invoke-interface {v2, v0, v1}, Lorg/chromium/base/LifetimeAssert$TestHook;->onCleaned(Lorg/chromium/base/LifetimeAssert$WrappedReference;Ljava/lang/String;)V

    goto :goto_1

    .line 111
    :cond_1
    new-instance v2, Lorg/chromium/base/LifetimeAssert$LifetimeAssertException;

    iget-object v3, v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->mCreationException:Lorg/chromium/base/LifetimeAssert$CreationException;

    invoke-direct {v2, v1, v3}, Lorg/chromium/base/LifetimeAssert$LifetimeAssertException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 114
    .end local v1    # "msg":Ljava/lang/String;
    :cond_2
    sget-object v1, Lorg/chromium/base/LifetimeAssert;->sTestHook:Lorg/chromium/base/LifetimeAssert$TestHook;

    if-eqz v1, :cond_3

    .line 115
    sget-object v1, Lorg/chromium/base/LifetimeAssert;->sTestHook:Lorg/chromium/base/LifetimeAssert$TestHook;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lorg/chromium/base/LifetimeAssert$TestHook;->onCleaned(Lorg/chromium/base/LifetimeAssert$WrappedReference;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 114
    :cond_3
    :goto_1
    nop

    .line 119
    .end local v0    # "wrapper":Lorg/chromium/base/LifetimeAssert$WrappedReference;
    :goto_2
    goto :goto_0

    .line 117
    :catch_0
    move-exception v0

    .line 118
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
