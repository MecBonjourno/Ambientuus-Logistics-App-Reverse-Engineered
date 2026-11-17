.class public abstract Lorg/chromium/base/task/AsyncTask;
.super Ljava/lang/Object;
.source "AsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/task/AsyncTask$StealRunnableHandler;,
        Lorg/chromium/base/task/AsyncTask$Status;,
        Lorg/chromium/base/task/AsyncTask$NamedFutureTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final GET_STATUS_UMA_HISTOGRAM:Ljava/lang/String; = "Android.Jank.AsyncTaskGetOnUiThreadStatus"

.field public static final SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static final STEAL_RUNNABLE_HANDLER:Lorg/chromium/base/task/AsyncTask$StealRunnableHandler;

.field private static final TAG:Ljava/lang/String; = "AsyncTask"

.field public static final THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;


# instance fields
.field private final mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/task/AsyncTask<",
            "TResult;>.NamedFutureTask;"
        }
    .end annotation
.end field

.field private mIterationIdForTesting:I

.field private volatile mStatus:I

.field private final mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mWorker:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable<",
            "TResult;>;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetmCancelled(Lorg/chromium/base/task/AsyncTask;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lorg/chromium/base/task/AsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmFuture(Lorg/chromium/base/task/AsyncTask;)Lorg/chromium/base/task/AsyncTask$NamedFutureTask;
    .locals 0

    iget-object p0, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmTaskInvoked(Lorg/chromium/base/task/AsyncTask;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lorg/chromium/base/task/AsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mpostResult(Lorg/chromium/base/task/AsyncTask;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/base/task/AsyncTask;->postResult(Ljava/lang/Object;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mpostResultIfNotInvoked(Lorg/chromium/base/task/AsyncTask;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/base/task/AsyncTask;->postResultIfNotInvoked(Ljava/lang/Object;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 49
    new-instance v0, Lorg/chromium/base/task/AsyncTask$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lorg/chromium/base/task/AsyncTask$$ExternalSyntheticLambda1;-><init>()V

    sput-object v0, Lorg/chromium/base/task/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 56
    new-instance v0, Lorg/chromium/base/task/SerialExecutor;

    invoke-direct {v0}, Lorg/chromium/base/task/SerialExecutor;-><init>()V

    sput-object v0, Lorg/chromium/base/task/AsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 58
    new-instance v0, Lorg/chromium/base/task/AsyncTask$StealRunnableHandler;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/chromium/base/task/AsyncTask$StealRunnableHandler;-><init>(Lorg/chromium/base/task/AsyncTask-IA;)V

    sput-object v0, Lorg/chromium/base/task/AsyncTask;->STEAL_RUNNABLE_HANDLER:Lorg/chromium/base/task/AsyncTask$StealRunnableHandler;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 113
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    const/4 v0, 0x0

    iput v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    .line 65
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 67
    sget v0, Lorg/chromium/base/task/PostTask;->sTestIterationForTesting:I

    iput v0, p0, Lorg/chromium/base/task/AsyncTask;->mIterationIdForTesting:I

    .line 114
    new-instance v0, Lorg/chromium/base/task/AsyncTask$1;

    invoke-direct {v0, p0}, Lorg/chromium/base/task/AsyncTask$1;-><init>(Lorg/chromium/base/task/AsyncTask;)V

    iput-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mWorker:Ljava/util/concurrent/Callable;

    .line 132
    new-instance v0, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    iget-object v1, p0, Lorg/chromium/base/task/AsyncTask;->mWorker:Ljava/util/concurrent/Callable;

    invoke-direct {v0, p0, v1}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;-><init>(Lorg/chromium/base/task/AsyncTask;Ljava/util/concurrent/Callable;)V

    iput-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    .line 133
    return-void
.end method

.method private executionPreamble()V
    .locals 2

    .line 370
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    iget v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    if-eqz v0, :cond_0

    .line 371
    iget v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 376
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot execute task: the task has already been executed (a task can be executed only once)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 373
    :pswitch_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot execute task: the task is already running."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 382
    :cond_0
    :goto_0
    const/4 v0, 0x1

    iput v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    .line 384
    invoke-virtual {p0}, Lorg/chromium/base/task/AsyncTask;->onPreExecute()V

    .line 385
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private finish(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .line 452
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    invoke-virtual {p0}, Lorg/chromium/base/task/AsyncTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 453
    invoke-virtual {p0, p1}, Lorg/chromium/base/task/AsyncTask;->onCancelled(Ljava/lang/Object;)V

    goto :goto_0

    .line 455
    :cond_0
    invoke-virtual {p0, p1}, Lorg/chromium/base/task/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 457
    :goto_0
    const/4 v0, 0x2

    iput v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    .line 458
    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 50
    const/4 v0, 0x1

    invoke-static {v0, p0}, Lorg/chromium/base/task/PostTask;->postTask(ILjava/lang/Runnable;)V

    return-void
.end method

.method private postResult(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .line 144
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    instance-of v0, p0, Lorg/chromium/base/task/BackgroundOnlyAsyncTask;

    if-eqz v0, :cond_0

    .line 145
    const/4 v0, 0x2

    iput v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    goto :goto_0

    .line 146
    :cond_0
    iget v0, p0, Lorg/chromium/base/task/AsyncTask;->mIterationIdForTesting:I

    sget v1, Lorg/chromium/base/task/PostTask;->sTestIterationForTesting:I

    if-ne v0, v1, :cond_1

    .line 147
    new-instance v0, Lorg/chromium/base/task/AsyncTask$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lorg/chromium/base/task/AsyncTask$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/base/task/AsyncTask;Ljava/lang/Object;)V

    invoke-static {v0}, Lorg/chromium/base/ThreadUtils;->postOnUiThread(Ljava/lang/Runnable;)V

    .line 149
    :cond_1
    :goto_0
    return-void
.end method

.method private postResultIfNotInvoked(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .line 136
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    .line 137
    .local v0, "wasTaskInvoked":Z
    if-nez v0, :cond_0

    .line 138
    invoke-direct {p0, p1}, Lorg/chromium/base/task/AsyncTask;->postResult(Ljava/lang/Object;)V

    .line 140
    :cond_0
    return-void
.end method

.method public static takeOverAndroidThreadPool()V
    .locals 2

    .line 105
    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 106
    .local v0, "exec":Ljava/util/concurrent/ThreadPoolExecutor;
    sget-object v1, Lorg/chromium/base/task/AsyncTask;->STEAL_RUNNABLE_HANDLER:Lorg/chromium/base/task/AsyncTask$StealRunnableHandler;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->setRejectedExecutionHandler(Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 107
    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 108
    return-void
.end method


# virtual methods
.method public final cancel(Z)Z
    .locals 2
    .param p1, "mayInterruptIfRunning"    # Z

    .line 292
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 293
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-virtual {v0, p1}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method protected abstract doInBackground()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation
.end method

.method public final executeOnExecutor(Ljava/util/concurrent/Executor;)Lorg/chromium/base/task/AsyncTask;
    .locals 1
    .param p1, "exec"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lorg/chromium/base/task/AsyncTask<",
            "TResult;>;"
        }
    .end annotation

    .line 419
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    invoke-direct {p0}, Lorg/chromium/base/task/AsyncTask;->executionPreamble()V

    .line 420
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 421
    return-object p0
.end method

.method public final executeOnTaskRunner(Lorg/chromium/base/task/TaskRunner;)Lorg/chromium/base/task/AsyncTask;
    .locals 1
    .param p1, "taskRunner"    # Lorg/chromium/base/task/TaskRunner;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/task/TaskRunner;",
            ")",
            "Lorg/chromium/base/task/AsyncTask<",
            "TResult;>;"
        }
    .end annotation

    .line 432
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    invoke-direct {p0}, Lorg/chromium/base/task/AsyncTask;->executionPreamble()V

    .line 433
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-interface {p1, v0}, Lorg/chromium/base/task/TaskRunner;->postTask(Ljava/lang/Runnable;)V

    .line 434
    return-object p0
.end method

.method public final executeWithTaskTraits(I)Lorg/chromium/base/task/AsyncTask;
    .locals 1
    .param p1, "taskTraits"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/chromium/base/task/AsyncTask<",
            "TResult;>;"
        }
    .end annotation

    .line 446
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    invoke-direct {p0}, Lorg/chromium/base/task/AsyncTask;->executionPreamble()V

    .line 447
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-static {p1, v0}, Lorg/chromium/base/task/PostTask;->postTask(ILjava/lang/Runnable;)V

    .line 448
    return-object p0
.end method

.method public final get()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 312
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    invoke-virtual {p0}, Lorg/chromium/base/task/AsyncTask;->getUmaStatus()I

    move-result v0

    .line 313
    .local v0, "status":I
    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    invoke-static {}, Lorg/chromium/base/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 314
    const-string v1, "Android.Jank.AsyncTaskGetOnUiThreadStatus"

    const/4 v2, 0x3

    invoke-static {v1, v0, v2}, Lorg/chromium/base/metrics/RecordHistogram;->recordEnumeratedHistogram(Ljava/lang/String;II)V

    .line 316
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 317
    .local v1, "stackTrace":[Ljava/lang/StackTraceElement;
    const-string v2, ""

    .line 318
    .local v2, "caller":Ljava/lang/String;
    array-length v3, v1

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    .line 319
    aget-object v3, v1, v4

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v3

    aget-object v4, v1, v4

    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 321
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "AsyncTask.get"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v3

    .line 322
    .local v3, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    iget-object v4, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-virtual {v4}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->get()Ljava/lang/Object;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    .local v4, "r":Ljava/lang/Object;, "TResult;"
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lorg/chromium/base/TraceEvent;->close()V

    .line 324
    .end local v1    # "stackTrace":[Ljava/lang/StackTraceElement;
    .end local v2    # "caller":Ljava/lang/String;
    .end local v3    # "e":Lorg/chromium/base/TraceEvent;
    :cond_1
    goto :goto_1

    .line 321
    .end local v4    # "r":Ljava/lang/Object;, "TResult;"
    .restart local v1    # "stackTrace":[Ljava/lang/StackTraceElement;
    .restart local v2    # "caller":Ljava/lang/String;
    .restart local v3    # "e":Lorg/chromium/base/TraceEvent;
    :catchall_0
    move-exception v4

    if-eqz v3, :cond_2

    :try_start_1
    invoke-virtual {v3}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v4

    .line 325
    .end local v1    # "stackTrace":[Ljava/lang/StackTraceElement;
    .end local v2    # "caller":Ljava/lang/String;
    .end local v3    # "e":Lorg/chromium/base/TraceEvent;
    :cond_3
    iget-object v1, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-virtual {v1}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->get()Ljava/lang/Object;

    move-result-object v4

    .line 327
    .restart local v4    # "r":Ljava/lang/Object;, "TResult;"
    :goto_1
    return-object v4
.end method

.method public final get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 6
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 350
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    invoke-virtual {p0}, Lorg/chromium/base/task/AsyncTask;->getUmaStatus()I

    move-result v0

    .line 351
    .local v0, "status":I
    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    invoke-static {}, Lorg/chromium/base/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 352
    const-string v1, "Android.Jank.AsyncTaskGetOnUiThreadStatus"

    const/4 v2, 0x3

    invoke-static {v1, v0, v2}, Lorg/chromium/base/metrics/RecordHistogram;->recordEnumeratedHistogram(Ljava/lang/String;II)V

    .line 354
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 355
    .local v1, "stackTrace":[Ljava/lang/StackTraceElement;
    const-string v2, ""

    .line 356
    .local v2, "caller":Ljava/lang/String;
    array-length v3, v1

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    .line 357
    aget-object v3, v1, v4

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v3

    aget-object v4, v1, v4

    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 359
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "AsyncTask.get"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v3

    .line 360
    .local v3, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    iget-object v4, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-virtual {v4, p1, p2, p3}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 361
    .local v4, "r":Ljava/lang/Object;, "TResult;"
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lorg/chromium/base/TraceEvent;->close()V

    .line 362
    .end local v1    # "stackTrace":[Ljava/lang/StackTraceElement;
    .end local v2    # "caller":Ljava/lang/String;
    .end local v3    # "e":Lorg/chromium/base/TraceEvent;
    :cond_1
    goto :goto_1

    .line 359
    .end local v4    # "r":Ljava/lang/Object;, "TResult;"
    .restart local v1    # "stackTrace":[Ljava/lang/StackTraceElement;
    .restart local v2    # "caller":Ljava/lang/String;
    .restart local v3    # "e":Lorg/chromium/base/TraceEvent;
    :catchall_0
    move-exception v4

    if-eqz v3, :cond_2

    :try_start_1
    invoke-virtual {v3}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v4

    .line 363
    .end local v1    # "stackTrace":[Ljava/lang/StackTraceElement;
    .end local v2    # "caller":Ljava/lang/String;
    .end local v3    # "e":Lorg/chromium/base/TraceEvent;
    :cond_3
    iget-object v1, p0, Lorg/chromium/base/task/AsyncTask;->mFuture:Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-virtual {v1, p1, p2, p3}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v4

    .line 365
    .restart local v4    # "r":Ljava/lang/Object;, "TResult;"
    :goto_1
    return-object v4
.end method

.method public final getStatus()I
    .locals 1

    .line 157
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    iget v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    return v0
.end method

.method public final getUmaStatus()I
    .locals 2

    .line 170
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    iget v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mTaskInvoked:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 171
    :cond_0
    iget v0, p0, Lorg/chromium/base/task/AsyncTask;->mStatus:I

    return v0
.end method

.method public final isCancelled()Z
    .locals 1

    .line 259
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$postResult$1$org-chromium-base-task-AsyncTask(Ljava/lang/Object;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/Object;

    .line 147
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    invoke-direct {p0, p1}, Lorg/chromium/base/task/AsyncTask;->finish(Ljava/lang/Object;)V

    return-void
.end method

.method protected onCancelled()V
    .locals 0

    .line 246
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    return-void
.end method

.method protected onCancelled(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .line 230
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    invoke-virtual {p0}, Lorg/chromium/base/task/AsyncTask;->onCancelled()V

    .line 231
    return-void
.end method

.method protected abstract onPostExecute(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation
.end method

.method protected onPreExecute()V
    .locals 0

    .line 192
    .local p0, "this":Lorg/chromium/base/task/AsyncTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>;"
    return-void
.end method
