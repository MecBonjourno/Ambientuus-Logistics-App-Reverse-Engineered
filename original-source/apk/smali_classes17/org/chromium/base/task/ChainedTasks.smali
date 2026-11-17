.class public Lorg/chromium/base/task/ChainedTasks;
.super Ljava/lang/Object;
.source "ChainedTasks.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private volatile mCanceled:Z

.field private mFinalized:Z

.field private mIterationIdForTesting:I

.field private final mRunAndPost:Ljava/lang/Runnable;

.field private final mTasks:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Runnable;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetmCanceled(Lorg/chromium/base/task/ChainedTasks;)Z
    .locals 0

    iget-boolean p0, p0, Lorg/chromium/base/task/ChainedTasks;->mCanceled:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmIterationIdForTesting(Lorg/chromium/base/task/ChainedTasks;)I
    .locals 0

    iget p0, p0, Lorg/chromium/base/task/ChainedTasks;->mIterationIdForTesting:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmTasks(Lorg/chromium/base/task/ChainedTasks;)Ljava/util/LinkedList;
    .locals 0

    iget-object p0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    .line 34
    sget v0, Lorg/chromium/base/task/PostTask;->sTestIterationForTesting:I

    iput v0, p0, Lorg/chromium/base/task/ChainedTasks;->mIterationIdForTesting:I

    .line 36
    new-instance v0, Lorg/chromium/base/task/ChainedTasks$1;

    invoke-direct {v0, p0}, Lorg/chromium/base/task/ChainedTasks$1;-><init>(Lorg/chromium/base/task/ChainedTasks;)V

    iput-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mRunAndPost:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Runnable;)V
    .locals 4
    .param p1, "traits"    # I
    .param p2, "task"    # Ljava/lang/Runnable;

    .line 59
    iget v0, p0, Lorg/chromium/base/task/ChainedTasks;->mIterationIdForTesting:I

    sget v1, Lorg/chromium/base/task/PostTask;->sTestIterationForTesting:I

    if-ne v0, v1, :cond_1

    .line 61
    iget-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    monitor-enter v0

    .line 62
    :try_start_0
    iget-boolean v1, p0, Lorg/chromium/base/task/ChainedTasks;->mFinalized:Z

    if-nez v1, :cond_0

    .line 63
    iget-object v1, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    new-instance v2, Landroid/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 64
    monitor-exit v0

    .line 65
    return-void

    .line 62
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Must not call add() after start()"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local p1    # "traits":I
    .end local p2    # "task":Ljava/lang/Runnable;
    throw v1

    .line 64
    .restart local p1    # "traits":I
    .restart local p2    # "task":Ljava/lang/Runnable;
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0

    .line 59
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public cancel()V
    .locals 2

    .line 71
    iget-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    monitor-enter v0

    .line 72
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lorg/chromium/base/task/ChainedTasks;->mFinalized:Z

    .line 73
    iput-boolean v1, p0, Lorg/chromium/base/task/ChainedTasks;->mCanceled:Z

    .line 74
    monitor-exit v0

    .line 75
    return-void

    .line 74
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method synthetic lambda$start$0$org-chromium-base-task-ChainedTasks()V
    .locals 3

    .line 93
    iget-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 94
    .local v1, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Runnable;>;"
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/chromium/base/task/PostTask;->canRunTaskImmediately(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    iget-object v2, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 96
    iget-boolean v2, p0, Lorg/chromium/base/task/ChainedTasks;->mCanceled:Z

    if-eqz v2, :cond_0

    return-void

    .line 97
    .end local v1    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Runnable;>;"
    :cond_0
    goto :goto_0

    .line 94
    .restart local v1    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Runnable;>;"
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 98
    .end local v1    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Runnable;>;"
    :cond_2
    return-void
.end method

.method public start(Z)V
    .locals 3
    .param p1, "coalesceTasks"    # Z

    .line 84
    iget-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    monitor-enter v0

    .line 85
    :try_start_0
    iget-boolean v1, p0, Lorg/chromium/base/task/ChainedTasks;->mFinalized:Z

    if-nez v1, :cond_2

    .line 86
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/chromium/base/task/ChainedTasks;->mFinalized:Z

    .line 87
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    iget-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 89
    :cond_0
    if-eqz p1, :cond_1

    .line 91
    iget-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 92
    .local v0, "traits":I
    new-instance v1, Lorg/chromium/base/task/ChainedTasks$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lorg/chromium/base/task/ChainedTasks$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/base/task/ChainedTasks;)V

    invoke-static {v0, v1}, Lorg/chromium/base/task/PostTask;->runOrPostTask(ILjava/lang/Runnable;)V

    .line 99
    .end local v0    # "traits":I
    goto :goto_0

    .line 100
    :cond_1
    iget-object v0, p0, Lorg/chromium/base/task/ChainedTasks;->mTasks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lorg/chromium/base/task/ChainedTasks;->mRunAndPost:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Lorg/chromium/base/task/PostTask;->postTask(ILjava/lang/Runnable;)V

    .line 102
    :goto_0
    return-void

    .line 85
    :cond_2
    :try_start_1
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Cannot call start() several times"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local p1    # "coalesceTasks":Z
    throw v1

    .line 87
    .restart local p1    # "coalesceTasks":Z
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_1
.end method
