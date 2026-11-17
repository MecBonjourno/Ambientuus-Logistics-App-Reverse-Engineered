.class Lorg/chromium/base/CallbackController$CancelableCallback;
.super Ljava/lang/Object;
.source "CallbackController.java"

# interfaces
.implements Lorg/chromium/base/CallbackController$Cancelable;
.implements Lorg/chromium/base/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/CallbackController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CancelableCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/chromium/base/CallbackController$Cancelable;",
        "Lorg/chromium/base/Callback<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private mCallback:Lorg/chromium/base/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/Callback<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/chromium/base/CallbackController;


# direct methods
.method private constructor <init>(Lorg/chromium/base/CallbackController;Lorg/chromium/base/Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "TT;>;)V"
        }
    .end annotation

    .line 90
    .local p0, "this":Lorg/chromium/base/CallbackController$CancelableCallback;, "Lorg/chromium/base/CallbackController$CancelableCallback<TT;>;"
    .local p2, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TT;>;"
    iput-object p1, p0, Lorg/chromium/base/CallbackController$CancelableCallback;->this$0:Lorg/chromium/base/CallbackController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p2, p0, Lorg/chromium/base/CallbackController$CancelableCallback;->mCallback:Lorg/chromium/base/Callback;

    .line 92
    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/base/CallbackController;Lorg/chromium/base/Callback;Lorg/chromium/base/CallbackController-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lorg/chromium/base/CallbackController$CancelableCallback;-><init>(Lorg/chromium/base/CallbackController;Lorg/chromium/base/Callback;)V

    return-void
.end method


# virtual methods
.method public synthetic bind(Ljava/lang/Object;)Ljava/lang/Runnable;
    .locals 0

    invoke-static {p0, p1}, Lorg/chromium/base/Callback$-CC;->$default$bind(Lorg/chromium/base/Callback;Ljava/lang/Object;)Ljava/lang/Runnable;

    move-result-object p1

    return-object p1
.end method

.method public cancel()V
    .locals 1

    .line 97
    .local p0, "this":Lorg/chromium/base/CallbackController$CancelableCallback;, "Lorg/chromium/base/CallbackController$CancelableCallback<TT;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/base/CallbackController$CancelableCallback;->mCallback:Lorg/chromium/base/Callback;

    .line 98
    return-void
.end method

.method public onResult(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 104
    .local p0, "this":Lorg/chromium/base/CallbackController$CancelableCallback;, "Lorg/chromium/base/CallbackController$CancelableCallback<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lorg/chromium/base/CallbackController$CancelableCallback;->this$0:Lorg/chromium/base/CallbackController;

    invoke-static {v0}, Lorg/chromium/base/CallbackController;->-$$Nest$fgetmReentrantLock(Lorg/chromium/base/CallbackController;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->lock(Ljava/util/concurrent/locks/Lock;)Lorg/chromium/base/CallbackController$AutoCloseableLock;

    move-result-object v0

    .line 105
    .local v0, "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :try_start_0
    iget-object v1, p0, Lorg/chromium/base/CallbackController$CancelableCallback;->mCallback:Lorg/chromium/base/Callback;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/chromium/base/CallbackController$CancelableCallback;->mCallback:Lorg/chromium/base/Callback;

    invoke-interface {v1, p1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->close()V

    .line 107
    .end local v0    # "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :cond_1
    return-void

    .line 104
    .restart local v0    # "acl":Lorg/chromium/base/CallbackController$AutoCloseableLock;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/CallbackController$AutoCloseableLock;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v1
.end method
