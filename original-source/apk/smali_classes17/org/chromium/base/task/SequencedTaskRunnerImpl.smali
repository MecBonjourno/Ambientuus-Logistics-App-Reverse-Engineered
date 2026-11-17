.class public Lorg/chromium/base/task/SequencedTaskRunnerImpl;
.super Lorg/chromium/base/task/TaskRunnerImpl;
.source "SequencedTaskRunnerImpl.java"

# interfaces
.implements Lorg/chromium/base/task/SequencedTaskRunner;


# instance fields
.field private mPendingTasks:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile mReadyToCreateNativeTaskRunner:Z


# direct methods
.method constructor <init>(I)V
    .locals 2
    .param p1, "traits"    # I

    .line 22
    const-string v0, "SequencedTaskRunnerImpl"

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/chromium/base/task/TaskRunnerImpl;-><init>(ILjava/lang/String;I)V

    .line 14
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/task/SequencedTaskRunnerImpl;->mPendingTasks:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    return-void
.end method


# virtual methods
.method initNativeTaskRunner()V
    .locals 1

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/base/task/SequencedTaskRunnerImpl;->mReadyToCreateNativeTaskRunner:Z

    .line 55
    iget-object v0, p0, Lorg/chromium/base/task/SequencedTaskRunnerImpl;->mPendingTasks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 56
    invoke-super {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->initNativeTaskRunner()V

    .line 58
    :cond_0
    return-void
.end method

.method protected runPreNativeTask()V
    .locals 1

    .line 34
    invoke-super {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->runPreNativeTask()V

    .line 35
    iget-object v0, p0, Lorg/chromium/base/task/SequencedTaskRunnerImpl;->mPendingTasks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-lez v0, :cond_1

    .line 36
    iget-boolean v0, p0, Lorg/chromium/base/task/SequencedTaskRunnerImpl;->mReadyToCreateNativeTaskRunner:Z

    if-nez v0, :cond_0

    .line 38
    invoke-super {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->schedulePreNativeTask()V

    goto :goto_0

    .line 41
    :cond_0
    invoke-super {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->initNativeTaskRunner()V

    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method protected schedulePreNativeTask()V
    .locals 1

    .line 27
    iget-object v0, p0, Lorg/chromium/base/task/SequencedTaskRunnerImpl;->mPendingTasks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 28
    invoke-super {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->schedulePreNativeTask()V

    .line 30
    :cond_0
    return-void
.end method
