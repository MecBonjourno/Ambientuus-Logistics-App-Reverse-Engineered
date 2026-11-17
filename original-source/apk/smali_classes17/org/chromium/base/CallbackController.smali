.class public final Lorg/chromium/base/CallbackController;
.super Ljava/lang/Object;
.source "CallbackController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/CallbackController$AutoCloseableLock;,
        Lorg/chromium/base/CallbackController$CancelableCallback;,
        Lorg/chromium/base/CallbackController$CancelableRunnable;,
        Lorg/chromium/base/CallbackController$Cancelable;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mCancelables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Lorg/chromium/base/CallbackController$Cancelable;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mReentrantLock:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method static bridge synthetic -$$Nest$fgetmReentrantLock(Lorg/chromium/base/CallbackController;)Ljava/util/concurrent/locks/ReentrantLock;
    .locals 0

    iget-object p0, p0, Lorg/chromium/base/CallbackController;->mReentrantLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 78
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/CallbackController;->mCancelables:Ljava/util/ArrayList;

    .line 164
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    iput-object v0, p0, Lorg/chromium/base/CallbackController;->mReentrantLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-void
.end method

.method private checkNotCanceled()V
    .locals 2

    .line 229
    iget-object v0, p0, Lorg/chromium/base/CallbackController;->mCancelables:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 232
    return-void

    .line 230
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This CallbackController has already been destroyed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 215
    iget-object v0, p0, Lorg/chromium/base/CallbackController;->mReentrantLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v0

    if-nez v0, :cond_3

    .line 217
    iget-object v0, p0, Lorg/chromium/base/CallbackController;->mReentrantLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-static {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->lock(Ljava/util/concurrent/locks/Lock;)Lorg/chromium/base/CallbackController$AutoCloseableLock;

    move-result-object v0

    .line 218
    .local v0, "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/base/CallbackController;->checkNotCanceled()V

    .line 219
    iget-object v1, p0, Lorg/chromium/base/CallbackController;->mCancelables:Ljava/util/ArrayList;

    invoke-static {v1}, Lorg/chromium/base/CollectionUtil;->strengthen(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/base/CallbackController$Cancelable;

    .line 220
    .local v2, "cancelable":Lorg/chromium/base/CallbackController$Cancelable;
    invoke-interface {v2}, Lorg/chromium/base/CallbackController$Cancelable;->cancel()V

    .line 221
    .end local v2    # "cancelable":Lorg/chromium/base/CallbackController$Cancelable;
    goto :goto_0

    .line 222
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/chromium/base/CallbackController;->mCancelables:Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->close()V

    .line 224
    .end local v0    # "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :cond_1
    return-void

    .line 217
    .restart local v0    # "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw v1

    .line 215
    .end local v0    # "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public makeCancelable(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 195
    iget-object v0, p0, Lorg/chromium/base/CallbackController;->mReentrantLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-static {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->lock(Ljava/util/concurrent/locks/Lock;)Lorg/chromium/base/CallbackController$AutoCloseableLock;

    move-result-object v0

    .line 196
    .local v0, "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/base/CallbackController;->checkNotCanceled()V

    .line 197
    new-instance v1, Lorg/chromium/base/CallbackController$CancelableRunnable;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lorg/chromium/base/CallbackController$CancelableRunnable;-><init>(Lorg/chromium/base/CallbackController;Ljava/lang/Runnable;Lorg/chromium/base/CallbackController-IA;)V

    .line 198
    .local v1, "cancelable":Lorg/chromium/base/CallbackController$CancelableRunnable;
    iget-object v2, p0, Lorg/chromium/base/CallbackController;->mCancelables:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    nop

    .line 200
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->close()V

    .line 199
    :cond_0
    return-object v1

    .line 195
    .end local v1    # "cancelable":Lorg/chromium/base/CallbackController$CancelableRunnable;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method

.method public makeCancelable(Lorg/chromium/base/Callback;)Lorg/chromium/base/Callback;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/chromium/base/Callback<",
            "TT;>;)",
            "Lorg/chromium/base/Callback<",
            "TT;>;"
        }
    .end annotation

    .line 177
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TT;>;"
    iget-object v0, p0, Lorg/chromium/base/CallbackController;->mReentrantLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-static {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->lock(Ljava/util/concurrent/locks/Lock;)Lorg/chromium/base/CallbackController$AutoCloseableLock;

    move-result-object v0

    .line 178
    .local v0, "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/base/CallbackController;->checkNotCanceled()V

    .line 179
    new-instance v1, Lorg/chromium/base/CallbackController$CancelableCallback;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lorg/chromium/base/CallbackController$CancelableCallback;-><init>(Lorg/chromium/base/CallbackController;Lorg/chromium/base/Callback;Lorg/chromium/base/CallbackController-IA;)V

    .line 180
    .local v1, "cancelable":Lorg/chromium/base/CallbackController$CancelableCallback;, "Lorg/chromium/base/CallbackController$CancelableCallback<TT;>;"
    iget-object v2, p0, Lorg/chromium/base/CallbackController;->mCancelables:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    nop

    .line 182
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->close()V

    .line 181
    :cond_0
    return-object v1

    .line 177
    .end local v1    # "cancelable":Lorg/chromium/base/CallbackController$CancelableCallback;, "Lorg/chromium/base/CallbackController$CancelableCallback<TT;>;"
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method
