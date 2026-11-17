.class public Lorg/chromium/base/task/TaskRunnerImpl;
.super Ljava/lang/Object;
.source "TaskRunnerImpl.java"

# interfaces
.implements Lorg/chromium/base/task/TaskRunner;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;,
        Lorg/chromium/base/task/TaskRunnerImpl$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final sCleaners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;",
            ">;"
        }
    .end annotation
.end field

.field private static final sQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDidOneTimeInitialization:Z

.field private volatile mNativeTaskRunnerAndroid:J

.field private mPreNativeDelayedTasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mPreNativeTaskLock:Ljava/lang/Object;

.field private mPreNativeTasks:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected final mRunPreNativeTaskClosure:Ljava/lang/Runnable;

.field private final mTaskRunnerType:I

.field private final mTaskTraits:I

.field private final mTraceEvent:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetmNativeTaskRunnerAndroid(Lorg/chromium/base/task/TaskRunnerImpl;)J
    .locals 2

    iget-wide v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgetsQueue()Ljava/lang/ref/ReferenceQueue;
    .locals 1

    sget-object v0, Lorg/chromium/base/task/TaskRunnerImpl;->sQueue:Ljava/lang/ref/ReferenceQueue;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 30
    nop

    .line 34
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    sput-object v0, Lorg/chromium/base/task/TaskRunnerImpl;->sQueue:Ljava/lang/ref/ReferenceQueue;

    .line 38
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/chromium/base/task/TaskRunnerImpl;->sCleaners:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(I)V
    .locals 2
    .param p1, "traits"    # I

    .line 120
    const-string v0, "TaskRunnerImpl"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/chromium/base/task/TaskRunnerImpl;-><init>(ILjava/lang/String;I)V

    .line 121
    invoke-static {}, Lorg/chromium/base/task/TaskRunnerImpl;->destroyGarbageCollectedTaskRunners()V

    .line 122
    return-void
.end method

.method protected constructor <init>(ILjava/lang/String;I)V
    .locals 2
    .param p1, "traits"    # I
    .param p2, "traceCategory"    # Ljava/lang/String;
    .param p3, "taskRunnerType"    # I

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Lorg/chromium/base/task/TaskRunnerImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/chromium/base/task/TaskRunnerImpl$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/base/task/TaskRunnerImpl;)V

    iput-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mRunPreNativeTaskClosure:Ljava/lang/Runnable;

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTaskLock:Ljava/lang/Object;

    .line 132
    iput p1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mTaskTraits:I

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".PreNativeTask.run"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mTraceEvent:Ljava/lang/String;

    .line 134
    iput p3, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mTaskRunnerType:I

    .line 135
    return-void
.end method

.method private static destroyGarbageCollectedTaskRunners()V
    .locals 3

    .line 107
    nop

    :goto_0
    sget-object v0, Lorg/chromium/base/task/TaskRunnerImpl;->sQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;

    .line 108
    .local v0, "cleaner":Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;
    if-nez v0, :cond_0

    return-void

    .line 109
    :cond_0
    invoke-virtual {v0}, Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;->destroy()V

    .line 110
    sget-object v1, Lorg/chromium/base/task/TaskRunnerImpl;->sCleaners:Ljava/util/Set;

    monitor-enter v1

    .line 111
    :try_start_0
    sget-object v2, Lorg/chromium/base/task/TaskRunnerImpl;->sCleaners:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 112
    monitor-exit v1

    .line 113
    .end local v0    # "cleaner":Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;
    goto :goto_0

    .line 112
    .restart local v0    # "cleaner":Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private oneTimeInitialization()V
    .locals 1

    .line 185
    iget-boolean v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mDidOneTimeInitialization:Z

    if-eqz v0, :cond_0

    return-void

    .line 186
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mDidOneTimeInitialization:Z

    .line 187
    invoke-static {p0}, Lorg/chromium/base/task/PostTask;->registerPreNativeTaskRunner(Lorg/chromium/base/task/TaskRunnerImpl;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 188
    invoke-virtual {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->initNativeTaskRunner()V

    goto :goto_0

    .line 190
    :cond_1
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    .line 191
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeDelayedTasks:Ljava/util/List;

    .line 193
    :goto_0
    return-void
.end method


# virtual methods
.method protected belongsToCurrentThreadInternal()Ljava/lang/Boolean;
    .locals 4

    .line 175
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lorg/chromium/base/task/TaskRunnerImpl;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 176
    iget-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTaskLock:Ljava/lang/Object;

    monitor-enter v0

    .line 177
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->oneTimeInitialization()V

    .line 178
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    iget-wide v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 180
    :cond_0
    invoke-static {}, Lorg/chromium/base/task/TaskRunnerImplJni;->get()Lorg/chromium/base/task/TaskRunnerImpl$Natives;

    move-result-object v0

    iget-wide v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    invoke-interface {v0, v1, v2}, Lorg/chromium/base/task/TaskRunnerImpl$Natives;->belongsToCurrentThread(J)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 178
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 175
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method clearTaskQueueForTesting()I
    .locals 4

    .line 61
    const/4 v0, 0x0

    .line 62
    .local v0, "taskCount":I
    iget-object v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTaskLock:Ljava/lang/Object;

    monitor-enter v1

    .line 63
    :try_start_0
    iget-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    if-eqz v2, :cond_0

    .line 64
    iget-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    iget-object v3, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeDelayedTasks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int v0, v2, v3

    .line 65
    iget-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 66
    iget-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeDelayedTasks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 68
    :cond_0
    monitor-exit v1

    .line 69
    return v0

    .line 68
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method initNativeTaskRunner()V
    .locals 11

    .line 257
    invoke-static {}, Lorg/chromium/base/task/TaskRunnerImplJni;->get()Lorg/chromium/base/task/TaskRunnerImpl$Natives;

    move-result-object v0

    iget v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mTaskRunnerType:I

    iget v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mTaskTraits:I

    invoke-interface {v0, v1, v2}, Lorg/chromium/base/task/TaskRunnerImpl$Natives;->init(II)J

    move-result-wide v4

    .line 258
    .local v4, "nativeTaskRunnerAndroid":J
    iget-object v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTaskLock:Ljava/lang/Object;

    monitor-enter v1

    .line 259
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 260
    iget-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Ljava/lang/Runnable;

    .line 261
    .local v6, "task":Ljava/lang/Runnable;
    invoke-static {}, Lorg/chromium/base/task/TaskRunnerImplJni;->get()Lorg/chromium/base/task/TaskRunnerImpl$Natives;

    move-result-object v3

    .line 262
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    .line 261
    const-wide/16 v7, 0x0

    invoke-interface/range {v3 .. v9}, Lorg/chromium/base/task/TaskRunnerImpl$Natives;->postDelayedTask(JLjava/lang/Runnable;JLjava/lang/String;)V

    .line 263
    .end local v6    # "task":Ljava/lang/Runnable;
    goto :goto_0

    .line 264
    :cond_0
    iput-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    .line 266
    :cond_1
    iget-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeDelayedTasks:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 267
    iget-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeDelayedTasks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;

    move-object v10, v3

    .line 268
    .local v10, "task":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Long;>;"
    invoke-static {}, Lorg/chromium/base/task/TaskRunnerImplJni;->get()Lorg/chromium/base/task/TaskRunnerImpl$Natives;

    move-result-object v3

    iget-object v6, v10, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Runnable;

    iget-object v7, v10, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Long;

    .line 269
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    .line 268
    invoke-interface/range {v3 .. v9}, Lorg/chromium/base/task/TaskRunnerImpl$Natives;->postDelayedTask(JLjava/lang/Runnable;JLjava/lang/String;)V

    .line 270
    .end local v10    # "task":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Long;>;"
    goto :goto_1

    .line 271
    :cond_2
    iput-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeDelayedTasks:Ljava/util/List;

    .line 276
    :cond_3
    iget-wide v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    const-wide/16 v6, 0x0

    cmp-long v0, v2, v6

    if-nez v0, :cond_4

    .line 277
    iput-wide v4, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    .line 278
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 279
    sget-object v2, Lorg/chromium/base/task/TaskRunnerImpl;->sCleaners:Ljava/util/Set;

    monitor-enter v2

    .line 280
    :try_start_1
    sget-object v0, Lorg/chromium/base/task/TaskRunnerImpl;->sCleaners:Ljava/util/Set;

    new-instance v1, Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;

    invoke-direct {v1, p0}, Lorg/chromium/base/task/TaskRunnerImpl$TaskRunnerCleaner;-><init>(Lorg/chromium/base/task/TaskRunnerImpl;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 281
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 286
    invoke-static {}, Lorg/chromium/base/task/TaskRunnerImpl;->destroyGarbageCollectedTaskRunners()V

    .line 287
    return-void

    .line 281
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 276
    :cond_4
    :try_start_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    .end local v4    # "nativeTaskRunnerAndroid":J
    throw v0

    .line 278
    .restart local v4    # "nativeTaskRunnerAndroid":J
    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public postDelayedTask(Ljava/lang/Runnable;J)V
    .locals 9
    .param p1, "task"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J

    .line 145
    iget-wide v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    const-wide/16 v3, 0x0

    cmp-long v0, v1, v3

    if-eqz v0, :cond_0

    .line 146
    invoke-static {}, Lorg/chromium/base/task/TaskRunnerImplJni;->get()Lorg/chromium/base/task/TaskRunnerImpl$Natives;

    move-result-object v1

    iget-wide v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    .line 147
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    .line 146
    move-object v4, p1

    move-wide v5, p2

    invoke-interface/range {v1 .. v7}, Lorg/chromium/base/task/TaskRunnerImpl$Natives;->postDelayedTask(JLjava/lang/Runnable;JLjava/lang/String;)V

    .line 148
    return-void

    .line 150
    :cond_0
    iget-object v8, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTaskLock:Ljava/lang/Object;

    monitor-enter v8

    .line 151
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->oneTimeInitialization()V

    .line 152
    iget-wide v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    cmp-long v0, v1, v3

    if-eqz v0, :cond_1

    .line 153
    invoke-static {}, Lorg/chromium/base/task/TaskRunnerImplJni;->get()Lorg/chromium/base/task/TaskRunnerImpl$Natives;

    move-result-object v1

    iget-wide v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mNativeTaskRunnerAndroid:J

    .line 154
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    .line 153
    move-object v4, p1

    move-wide v5, p2

    invoke-interface/range {v1 .. v7}, Lorg/chromium/base/task/TaskRunnerImpl$Natives;->postDelayedTask(JLjava/lang/Runnable;JLjava/lang/String;)V

    .line 155
    monitor-exit v8

    return-void

    .line 161
    :cond_1
    cmp-long v0, p2, v3

    if-nez v0, :cond_2

    .line 162
    iget-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 163
    invoke-virtual {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->schedulePreNativeTask()V

    goto :goto_0

    .line 164
    :cond_2
    invoke-virtual/range {p0 .. p3}, Lorg/chromium/base/task/TaskRunnerImpl;->schedulePreNativeDelayedTask(Ljava/lang/Runnable;J)Z

    move-result v0

    if-nez v0, :cond_3

    .line 165
    new-instance v0, Landroid/util/Pair;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, p1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 166
    .local v0, "preNativeDelayedTask":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Long;>;"
    iget-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeDelayedTasks:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .end local v0    # "preNativeDelayedTask":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Long;>;"
    :cond_3
    :goto_0
    monitor-exit v8

    .line 169
    return-void

    .line 168
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public postTask(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "task"    # Ljava/lang/Runnable;

    .line 139
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/chromium/base/task/TaskRunnerImpl;->postDelayedTask(Ljava/lang/Runnable;J)V

    .line 140
    return-void
.end method

.method protected runPreNativeTask()V
    .locals 3

    .line 219
    iget-object v0, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mTraceEvent:Ljava/lang/String;

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 221
    .local v0, "te":Lorg/chromium/base/TraceEvent;
    :try_start_0
    iget-object v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTaskLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 222
    :try_start_1
    iget-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    if-nez v2, :cond_1

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 249
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 222
    :cond_0
    return-void

    .line 223
    :cond_1
    :try_start_2
    iget-object v2, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mPreNativeTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    .line 224
    .local v2, "task":Ljava/lang/Runnable;
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 225
    :try_start_3
    iget v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mTaskTraits:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 236
    :pswitch_0
    const/4 v1, -0x1

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 237
    goto :goto_0

    .line 232
    :pswitch_1
    const/4 v1, 0x0

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 233
    goto :goto_0

    .line 228
    :pswitch_2
    const/16 v1, 0xa

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 229
    nop

    .line 248
    :goto_0
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 249
    .end local v2    # "task":Ljava/lang/Runnable;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 250
    .end local v0    # "te":Lorg/chromium/base/TraceEvent;
    :cond_2
    return-void

    .line 224
    .restart local v0    # "te":Lorg/chromium/base/TraceEvent;
    :catchall_0
    move-exception v2

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .end local v0    # "te":Lorg/chromium/base/TraceEvent;
    :try_start_5
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 219
    .restart local v0    # "te":Lorg/chromium/base/TraceEvent;
    :catchall_1
    move-exception v1

    if-eqz v0, :cond_3

    :try_start_6
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_1

    :catchall_2
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_1
    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected schedulePreNativeDelayedTask(Ljava/lang/Runnable;J)Z
    .locals 1
    .param p1, "task"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J

    .line 210
    const/4 v0, 0x0

    return v0
.end method

.method protected schedulePreNativeTask()V
    .locals 2

    .line 200
    invoke-static {}, Lorg/chromium/base/task/PostTask;->getPrenativeThreadPoolExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iget-object v1, p0, Lorg/chromium/base/task/TaskRunnerImpl;->mRunPreNativeTaskClosure:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 201
    return-void
.end method
