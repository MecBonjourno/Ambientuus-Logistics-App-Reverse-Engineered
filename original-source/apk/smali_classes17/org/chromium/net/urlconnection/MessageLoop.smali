.class Lorg/chromium/net/urlconnection/MessageLoop;
.super Ljava/lang/Object;
.source "MessageLoop.java"

# interfaces
.implements Ljava/util/concurrent/Executor;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final INVALID_THREAD_ID:J = -0x1L


# instance fields
.field private mLoopFailed:Z

.field private mLoopRunning:Z

.field private mPriorInterruptedIOException:Ljava/io/InterruptedIOException;

.field private mPriorRuntimeException:Ljava/lang/RuntimeException;

.field private final mQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mThreadId:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 19
    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mThreadId:J

    .line 42
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mQueue:Ljava/util/concurrent/BlockingQueue;

    .line 43
    return-void
.end method

.method private calledOnValidThread()Z
    .locals 6

    .line 46
    iget-wide v0, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mThreadId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 47
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mThreadId:J

    .line 48
    return v1

    .line 50
    :cond_0
    iget-wide v2, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mThreadId:J

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private take(ZJ)Ljava/lang/Runnable;
    .locals 3
    .param p1, "useTimeout"    # Z
    .param p2, "timeoutNano"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .line 62
    const/4 v0, 0x0

    .line 64
    .local v0, "task":Ljava/lang/Runnable;
    if-nez p1, :cond_0

    .line 65
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .end local v0    # "task":Ljava/lang/Runnable;
    .local v1, "task":Ljava/lang/Runnable;
    goto :goto_0

    .line 68
    .end local v1    # "task":Ljava/lang/Runnable;
    .restart local v0    # "task":Ljava/lang/Runnable;
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mQueue:Ljava/util/concurrent/BlockingQueue;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, p2, p3, v2}, Ljava/util/concurrent/BlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .end local v0    # "task":Ljava/lang/Runnable;
    .restart local v1    # "task":Ljava/lang/Runnable;
    :goto_0
    nop

    .line 75
    if-eqz v1, :cond_1

    .line 79
    return-object v1

    .line 77
    :cond_1
    new-instance v0, Ljava/net/SocketTimeoutException;

    invoke-direct {v0}, Ljava/net/SocketTimeoutException;-><init>()V

    throw v0

    .line 70
    .end local v1    # "task":Ljava/lang/Runnable;
    .restart local v0    # "task":Ljava/lang/Runnable;
    :catch_0
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/InterruptedException;
    new-instance v2, Ljava/io/InterruptedIOException;

    invoke-direct {v2}, Ljava/io/InterruptedIOException;-><init>()V

    .line 72
    .local v2, "exception":Ljava/io/InterruptedIOException;
    invoke-virtual {v2, v1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 73
    throw v2
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "task"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/RejectedExecutionException;
        }
    .end annotation

    .line 152
    if-eqz p1, :cond_0

    .line 156
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    nop

    .line 162
    return-void

    .line 157
    :catch_0
    move-exception v0

    .line 160
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Ljava/util/concurrent/RejectedExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/RejectedExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 153
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public hasLoopFailed()Z
    .locals 1

    .line 175
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopFailed:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 168
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopRunning:Z

    return v0
.end method

.method public loop()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/chromium/net/urlconnection/MessageLoop;->loop(I)V

    .line 90
    return-void
.end method

.method public loop(I)V
    .locals 8
    .param p1, "timeoutMilli"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/MessageLoop;->calledOnValidThread()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 102
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 103
    .local v0, "startNano":J
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v3, p1

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    .line 104
    .local v2, "timeoutNano":J
    iget-boolean v4, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopFailed:Z

    if-eqz v4, :cond_1

    .line 105
    iget-object v4, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mPriorInterruptedIOException:Ljava/io/InterruptedIOException;

    if-eqz v4, :cond_0

    .line 106
    iget-object v4, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mPriorInterruptedIOException:Ljava/io/InterruptedIOException;

    throw v4

    .line 108
    :cond_0
    iget-object v4, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mPriorRuntimeException:Ljava/lang/RuntimeException;

    throw v4

    .line 111
    :cond_1
    iget-boolean v4, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopRunning:Z

    if-nez v4, :cond_4

    .line 115
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopRunning:Z

    .line 116
    :goto_0
    iget-boolean v5, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopRunning:Z

    if-eqz v5, :cond_3

    .line 118
    const/4 v5, 0x0

    if-nez p1, :cond_2

    .line 119
    const-wide/16 v6, 0x0

    :try_start_0
    invoke-direct {p0, v5, v6, v7}, Lorg/chromium/net/urlconnection/MessageLoop;->take(ZJ)Ljava/lang/Runnable;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 121
    :cond_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    sub-long v6, v2, v6

    add-long/2addr v6, v0

    invoke-direct {p0, v4, v6, v7}, Lorg/chromium/net/urlconnection/MessageLoop;->take(ZJ)Ljava/lang/Runnable;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :goto_1
    goto :goto_0

    .line 128
    :catch_0
    move-exception v6

    .line 129
    .local v6, "e":Ljava/lang/RuntimeException;
    iput-boolean v5, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopRunning:Z

    .line 130
    iput-boolean v4, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopFailed:Z

    .line 131
    iput-object v6, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mPriorRuntimeException:Ljava/lang/RuntimeException;

    .line 132
    throw v6

    .line 123
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v6

    .line 124
    .local v6, "e":Ljava/io/InterruptedIOException;
    iput-boolean v5, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopRunning:Z

    .line 125
    iput-boolean v4, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopFailed:Z

    .line 126
    iput-object v6, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mPriorInterruptedIOException:Ljava/io/InterruptedIOException;

    .line 127
    throw v6

    .line 135
    .end local v6    # "e":Ljava/io/InterruptedIOException;
    :cond_3
    return-void

    .line 112
    :cond_4
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Cannot run loop when it is already running."

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 100
    .end local v0    # "startNano":J
    .end local v2    # "timeoutNano":J
    :cond_5
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public quit()V
    .locals 1

    .line 143
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/MessageLoop;->calledOnValidThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/urlconnection/MessageLoop;->mLoopRunning:Z

    .line 145
    return-void

    .line 143
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
