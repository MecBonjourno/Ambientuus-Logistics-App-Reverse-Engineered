.class public Lorg/chromium/base/Promise;
.super Ljava/lang/Object;
.source "Promise.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/Promise$PromiseState;,
        Lorg/chromium/base/Promise$AsyncFunction;,
        Lorg/chromium/base/Promise$UnhandledRejectionException;
    }
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
.field private final mFulfillCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/base/Callback<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field private final mRejectCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/Exception;",
            ">;>;"
        }
    .end annotation
.end field

.field private mRejectReason:Ljava/lang/Exception;

.field private mResult:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mState:I

.field private final mThread:Ljava/lang/Thread;

.field private mThrowingRejectionHandler:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 22
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lorg/chromium/base/Promise;->mState:I

    .line 37
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/Promise;->mFulfillCallbacks:Ljava/util/List;

    .line 40
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/Promise;->mRejectCallbacks:Ljava/util/List;

    .line 42
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/Promise;->mThread:Ljava/lang/Thread;

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/Promise;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private checkThread()V
    .locals 2

    .line 285
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    iget-object v0, p0, Lorg/chromium/base/Promise;->mThread:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 286
    return-void

    .line 285
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Promise must only be used on a single Thread."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private exceptInner(Lorg/chromium/base/Callback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/Exception;",
            ">;)V"
        }
    .end annotation

    .line 126
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "onReject":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/Exception;>;"
    iget-boolean v0, p0, Lorg/chromium/base/Promise;->mThrowingRejectionHandler:Z

    if-nez v0, :cond_2

    .line 129
    iget v0, p0, Lorg/chromium/base/Promise;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 130
    iget-object v0, p0, Lorg/chromium/base/Promise;->mRejectReason:Ljava/lang/Exception;

    invoke-direct {p0, p1, v0}, Lorg/chromium/base/Promise;->postCallbackToLooper(Lorg/chromium/base/Callback;Ljava/lang/Object;)V

    goto :goto_0

    .line 131
    :cond_0
    iget v0, p0, Lorg/chromium/base/Promise;->mState:I

    if-nez v0, :cond_1

    .line 132
    iget-object v0, p0, Lorg/chromium/base/Promise;->mRejectCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    :cond_1
    :goto_0
    return-void

    .line 126
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Do not add an exception handler to a Promise you have called the single argument Promise.then(Callback) on."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static fulfilled(Ljava/lang/Object;)Lorg/chromium/base/Promise;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lorg/chromium/base/Promise<",
            "TT;>;"
        }
    .end annotation

    .line 270
    .local p0, "result":Ljava/lang/Object;, "TT;"
    new-instance v0, Lorg/chromium/base/Promise;

    invoke-direct {v0}, Lorg/chromium/base/Promise;-><init>()V

    .line 271
    .local v0, "promise":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    invoke-virtual {v0, p0}, Lorg/chromium/base/Promise;->fulfill(Ljava/lang/Object;)V

    .line 272
    return-object v0
.end method

.method static synthetic lambda$then$0(Ljava/lang/Exception;)V
    .locals 2
    .param p0, "reason"    # Ljava/lang/Exception;

    .line 83
    new-instance v0, Lorg/chromium/base/Promise$UnhandledRejectionException;

    const-string v1, "Promise was rejected without a rejection handler."

    invoke-direct {v0, v1, p0}, Lorg/chromium/base/Promise$UnhandledRejectionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method static synthetic lambda$then$1(Lorg/chromium/base/Promise;Ljava/util/function/Function;Ljava/lang/Object;)V
    .locals 1
    .param p0, "promise"    # Lorg/chromium/base/Promise;
    .param p1, "function"    # Ljava/util/function/Function;
    .param p2, "result"    # Ljava/lang/Object;

    .line 151
    :try_start_0
    invoke-interface {p1, p2}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/chromium/base/Promise;->fulfill(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    goto :goto_0

    .line 152
    :catch_0
    move-exception v0

    .line 154
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v0}, Lorg/chromium/base/Promise;->reject(Ljava/lang/Exception;)V

    .line 156
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$then$2(Lorg/chromium/base/Promise$AsyncFunction;Lorg/chromium/base/Promise;Ljava/lang/Object;)V
    .locals 3
    .param p0, "function"    # Lorg/chromium/base/Promise$AsyncFunction;
    .param p1, "promise"    # Lorg/chromium/base/Promise;
    .param p2, "result"    # Ljava/lang/Object;

    .line 182
    :try_start_0
    invoke-interface {p0, p2}, Lorg/chromium/base/Promise$AsyncFunction;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/Promise;

    invoke-static {p1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lorg/chromium/base/Promise$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Lorg/chromium/base/Promise$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/base/Promise;)V

    invoke-static {p1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lorg/chromium/base/Promise$$ExternalSyntheticLambda1;

    invoke-direct {v2, p1}, Lorg/chromium/base/Promise$$ExternalSyntheticLambda1;-><init>(Lorg/chromium/base/Promise;)V

    invoke-virtual {v0, v1, v2}, Lorg/chromium/base/Promise;->then(Lorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    goto :goto_0

    .line 183
    :catch_0
    move-exception v0

    .line 185
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1, v0}, Lorg/chromium/base/Promise;->reject(Ljava/lang/Exception;)V

    .line 187
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private postCallbackToLooper(Lorg/chromium/base/Callback;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/chromium/base/Callback<",
            "TS;>;TS;)V"
        }
    .end annotation

    .line 292
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TS;>;"
    .local p2, "result":Ljava/lang/Object;, "TS;"
    iget-object v0, p0, Lorg/chromium/base/Promise;->mHandler:Landroid/os/Handler;

    invoke-interface {p1, p2}, Lorg/chromium/base/Callback;->bind(Ljava/lang/Object;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 293
    return-void
.end method

.method public static rejected()Lorg/chromium/base/Promise;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lorg/chromium/base/Promise<",
            "TT;>;"
        }
    .end annotation

    .line 279
    new-instance v0, Lorg/chromium/base/Promise;

    invoke-direct {v0}, Lorg/chromium/base/Promise;-><init>()V

    .line 280
    .local v0, "promise":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    invoke-virtual {v0}, Lorg/chromium/base/Promise;->reject()V

    .line 281
    return-object v0
.end method

.method private thenInner(Lorg/chromium/base/Callback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "TT;>;)V"
        }
    .end annotation

    .line 118
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "onFulfill":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TT;>;"
    iget v0, p0, Lorg/chromium/base/Promise;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 119
    iget-object v0, p0, Lorg/chromium/base/Promise;->mResult:Ljava/lang/Object;

    invoke-direct {p0, p1, v0}, Lorg/chromium/base/Promise;->postCallbackToLooper(Lorg/chromium/base/Callback;Ljava/lang/Object;)V

    goto :goto_0

    .line 120
    :cond_0
    iget v0, p0, Lorg/chromium/base/Promise;->mState:I

    if-nez v0, :cond_1

    .line 121
    iget-object v0, p0, Lorg/chromium/base/Promise;->mFulfillCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public except(Lorg/chromium/base/Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/Exception;",
            ">;)V"
        }
    .end annotation

    .line 113
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "onReject":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/Exception;>;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 114
    invoke-direct {p0, p1}, Lorg/chromium/base/Promise;->exceptInner(Lorg/chromium/base/Callback;)V

    .line 115
    return-void
.end method

.method public fulfill(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 200
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 201
    iget v0, p0, Lorg/chromium/base/Promise;->mState:I

    if-nez v0, :cond_1

    .line 203
    const/4 v0, 0x1

    iput v0, p0, Lorg/chromium/base/Promise;->mState:I

    .line 204
    iput-object p1, p0, Lorg/chromium/base/Promise;->mResult:Ljava/lang/Object;

    .line 206
    iget-object v0, p0, Lorg/chromium/base/Promise;->mFulfillCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/Callback;

    .line 207
    .local v1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TT;>;"
    invoke-direct {p0, v1, p1}, Lorg/chromium/base/Promise;->postCallbackToLooper(Lorg/chromium/base/Callback;Ljava/lang/Object;)V

    .line 208
    .end local v1    # "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TT;>;"
    goto :goto_0

    .line 210
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/Promise;->mFulfillCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 211
    return-void

    .line 201
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public getResult()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 262
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    invoke-virtual {p0}, Lorg/chromium/base/Promise;->isFulfilled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 263
    iget-object v0, p0, Lorg/chromium/base/Promise;->mResult:Ljava/lang/Object;

    return-object v0

    .line 262
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public isFulfilled()Z
    .locals 2

    .line 244
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 245
    iget v0, p0, Lorg/chromium/base/Promise;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isRejected()Z
    .locals 2

    .line 252
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 253
    iget v0, p0, Lorg/chromium/base/Promise;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public reject()V
    .locals 1

    .line 237
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/chromium/base/Promise;->reject(Ljava/lang/Exception;)V

    .line 238
    return-void
.end method

.method public reject(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "reason"    # Ljava/lang/Exception;

    .line 221
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 222
    iget v0, p0, Lorg/chromium/base/Promise;->mState:I

    if-nez v0, :cond_1

    .line 224
    const/4 v0, 0x2

    iput v0, p0, Lorg/chromium/base/Promise;->mState:I

    .line 225
    iput-object p1, p0, Lorg/chromium/base/Promise;->mRejectReason:Ljava/lang/Exception;

    .line 227
    iget-object v0, p0, Lorg/chromium/base/Promise;->mRejectCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/Callback;

    .line 228
    .local v1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/Exception;>;"
    invoke-direct {p0, v1, p1}, Lorg/chromium/base/Promise;->postCallbackToLooper(Lorg/chromium/base/Callback;Ljava/lang/Object;)V

    .line 229
    .end local v1    # "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/Exception;>;"
    goto :goto_0

    .line 230
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/Promise;->mRejectCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 231
    return-void

    .line 222
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public then(Ljava/util/function/Function;)Lorg/chromium/base/Promise;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<RT:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "TT;TRT;>;)",
            "Lorg/chromium/base/Promise<",
            "TRT;>;"
        }
    .end annotation

    .line 141
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "function":Ljava/util/function/Function;, "Ljava/util/function/Function<TT;TRT;>;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 144
    new-instance v0, Lorg/chromium/base/Promise;

    invoke-direct {v0}, Lorg/chromium/base/Promise;-><init>()V

    .line 149
    .local v0, "promise":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TRT;>;"
    new-instance v1, Lorg/chromium/base/Promise$$ExternalSyntheticLambda2;

    invoke-direct {v1, v0, p1}, Lorg/chromium/base/Promise$$ExternalSyntheticLambda2;-><init>(Lorg/chromium/base/Promise;Ljava/util/function/Function;)V

    invoke-direct {p0, v1}, Lorg/chromium/base/Promise;->thenInner(Lorg/chromium/base/Callback;)V

    .line 159
    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lorg/chromium/base/Promise$$ExternalSyntheticLambda1;

    invoke-direct {v1, v0}, Lorg/chromium/base/Promise$$ExternalSyntheticLambda1;-><init>(Lorg/chromium/base/Promise;)V

    invoke-direct {p0, v1}, Lorg/chromium/base/Promise;->exceptInner(Lorg/chromium/base/Callback;)V

    .line 161
    return-object v0
.end method

.method public then(Lorg/chromium/base/Promise$AsyncFunction;)Lorg/chromium/base/Promise;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<RT:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/chromium/base/Promise$AsyncFunction<",
            "TT;TRT;>;)",
            "Lorg/chromium/base/Promise<",
            "TRT;>;"
        }
    .end annotation

    .line 170
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "function":Lorg/chromium/base/Promise$AsyncFunction;, "Lorg/chromium/base/Promise$AsyncFunction<TT;TRT;>;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 173
    new-instance v0, Lorg/chromium/base/Promise;

    invoke-direct {v0}, Lorg/chromium/base/Promise;-><init>()V

    .line 178
    .local v0, "promise":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TRT;>;"
    new-instance v1, Lorg/chromium/base/Promise$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1, v0}, Lorg/chromium/base/Promise$$ExternalSyntheticLambda3;-><init>(Lorg/chromium/base/Promise$AsyncFunction;Lorg/chromium/base/Promise;)V

    invoke-direct {p0, v1}, Lorg/chromium/base/Promise;->thenInner(Lorg/chromium/base/Callback;)V

    .line 190
    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lorg/chromium/base/Promise$$ExternalSyntheticLambda1;

    invoke-direct {v1, v0}, Lorg/chromium/base/Promise$$ExternalSyntheticLambda1;-><init>(Lorg/chromium/base/Promise;)V

    invoke-direct {p0, v1}, Lorg/chromium/base/Promise;->exceptInner(Lorg/chromium/base/Callback;)V

    .line 192
    return-object v0
.end method

.method public then(Lorg/chromium/base/Callback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "TT;>;)V"
        }
    .end annotation

    .line 70
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "onFulfill":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TT;>;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 74
    iget-boolean v0, p0, Lorg/chromium/base/Promise;->mThrowingRejectionHandler:Z

    if-eqz v0, :cond_0

    .line 75
    invoke-direct {p0, p1}, Lorg/chromium/base/Promise;->thenInner(Lorg/chromium/base/Callback;)V

    .line 76
    return-void

    .line 79
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/Promise;->mRejectCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 82
    new-instance v0, Lorg/chromium/base/Promise$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Lorg/chromium/base/Promise$$ExternalSyntheticLambda4;-><init>()V

    .line 87
    .local v0, "onReject":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/Exception;>;"
    invoke-virtual {p0, p1, v0}, Lorg/chromium/base/Promise;->then(Lorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V

    .line 88
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/chromium/base/Promise;->mThrowingRejectionHandler:Z

    .line 89
    return-void

    .line 79
    .end local v0    # "onReject":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/Exception;>;"
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Do not call the single argument Promise.then(Callback) on a Promise that already has a rejection handler."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public then(Lorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "TT;>;",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/Exception;",
            ">;)V"
        }
    .end annotation

    .line 101
    .local p0, "this":Lorg/chromium/base/Promise;, "Lorg/chromium/base/Promise<TT;>;"
    .local p1, "onFulfill":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<TT;>;"
    .local p2, "onReject":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/Exception;>;"
    invoke-direct {p0}, Lorg/chromium/base/Promise;->checkThread()V

    .line 102
    invoke-direct {p0, p1}, Lorg/chromium/base/Promise;->thenInner(Lorg/chromium/base/Callback;)V

    .line 103
    invoke-direct {p0, p2}, Lorg/chromium/base/Promise;->exceptInner(Lorg/chromium/base/Callback;)V

    .line 104
    return-void
.end method
