.class Lorg/chromium/base/task/AsyncTask$NamedFutureTask;
.super Ljava/util/concurrent/FutureTask;
.source "AsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/task/AsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NamedFutureTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask<",
        "TResult;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/chromium/base/task/AsyncTask;


# direct methods
.method constructor <init>(Lorg/chromium/base/task/AsyncTask;Ljava/util/concurrent/Callable;)V
    .locals 0
    .param p1, "this$0"    # Lorg/chromium/base/task/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "TResult;>;)V"
        }
    .end annotation

    .line 461
    .local p0, "this":Lorg/chromium/base/task/AsyncTask$NamedFutureTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>.NamedFutureTask;"
    .local p2, "c":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TResult;>;"
    iput-object p1, p0, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->this$0:Lorg/chromium/base/task/AsyncTask;

    .line 462
    invoke-direct {p0, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 463
    return-void
.end method


# virtual methods
.method protected done()V
    .locals 4

    .line 492
    .local p0, "this":Lorg/chromium/base/task/AsyncTask$NamedFutureTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>.NamedFutureTask;"
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->this$0:Lorg/chromium/base/task/AsyncTask;

    invoke-virtual {p0}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/chromium/base/task/AsyncTask;->-$$Nest$mpostResultIfNotInvoked(Lorg/chromium/base/task/AsyncTask;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 498
    :catch_0
    move-exception v0

    .line 499
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    iget-object v1, p0, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->this$0:Lorg/chromium/base/task/AsyncTask;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/chromium/base/task/AsyncTask;->-$$Nest$mpostResultIfNotInvoked(Lorg/chromium/base/task/AsyncTask;Ljava/lang/Object;)V

    goto :goto_1

    .line 495
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    :catch_1
    move-exception v0

    .line 496
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    new-instance v1, Ljava/lang/RuntimeException;

    .line 497
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    const-string v3, "An error occurred while executing doInBackground()"

    invoke-direct {v1, v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 493
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_2
    move-exception v0

    .line 494
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v1, "AsyncTask"

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 500
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_0
    nop

    .line 501
    :goto_1
    return-void
.end method

.method getBlamedClass()Ljava/lang/Class;
    .locals 1

    .line 466
    .local p0, "this":Lorg/chromium/base/task/AsyncTask$NamedFutureTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>.NamedFutureTask;"
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->this$0:Lorg/chromium/base/task/AsyncTask;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 3

    .line 472
    .local p0, "this":Lorg/chromium/base/task/AsyncTask$NamedFutureTask;, "Lorg/chromium/base/task/AsyncTask<TResult;>.NamedFutureTask;"
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->this$0:Lorg/chromium/base/task/AsyncTask;

    invoke-static {v0}, Lorg/chromium/base/task/AsyncTask;->-$$Nest$fgetmFuture(Lorg/chromium/base/task/AsyncTask;)Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    move-result-object v0

    .line 473
    invoke-virtual {v0}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->getBlamedClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AsyncTask.run: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 472
    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 474
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_1
    invoke-super {p0}, Ljava/util/concurrent/FutureTask;->run()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 475
    if-eqz v0, :cond_0

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 485
    .end local v0    # "e":Lorg/chromium/base/TraceEvent;
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 486
    nop

    .line 487
    return-void

    .line 472
    .restart local v0    # "e":Lorg/chromium/base/TraceEvent;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_3
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 485
    .end local v0    # "e":Lorg/chromium/base/TraceEvent;
    :catchall_2
    move-exception v0

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 486
    throw v0
.end method
