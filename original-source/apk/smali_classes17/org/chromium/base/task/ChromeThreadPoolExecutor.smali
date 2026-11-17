.class Lorg/chromium/base/task/ChromeThreadPoolExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "ChromeThreadPoolExecutor.java"


# static fields
.field private static final CORE_POOL_SIZE:I

.field private static final CPU_COUNT:I

.field private static final KEEP_ALIVE_SECONDS:I = 0x1e

.field private static final MAXIMUM_POOL_SIZE:I

.field private static final RUNNABLE_WARNING_COUNT:I = 0x20

.field private static final sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static final sThreadFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 25
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    sput v0, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->CPU_COUNT:I

    .line 30
    sget v0, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->CPU_COUNT:I

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x4

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    sput v0, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->CORE_POOL_SIZE:I

    .line 31
    sget v0, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->CPU_COUNT:I

    mul-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->MAXIMUM_POOL_SIZE:I

    .line 34
    new-instance v0, Lorg/chromium/base/task/ChromeThreadPoolExecutor$1;

    invoke-direct {v0}, Lorg/chromium/base/task/ChromeThreadPoolExecutor$1;-><init>()V

    sput-object v0, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 42
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    sput-object v0, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;

    return-void
.end method

.method constructor <init>()V
    .locals 8

    .line 49
    sget v1, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->CORE_POOL_SIZE:I

    sget v2, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->MAXIMUM_POOL_SIZE:I

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v6, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->sPoolWorkQueue:Ljava/util/concurrent/BlockingQueue;

    sget-object v7, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    const-wide/16 v3, 0x1e

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lorg/chromium/base/task/ChromeThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 51
    return-void
.end method

.method constructor <init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V
    .locals 2
    .param p1, "corePoolSize"    # I
    .param p2, "maximumPoolSize"    # I
    .param p3, "keepAliveTime"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p7, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;",
            "Ljava/util/concurrent/ThreadFactory;",
            ")V"
        }
    .end annotation

    .line 56
    .local p6, "workQueue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Ljava/lang/Runnable;>;"
    invoke-direct/range {p0 .. p7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 57
    move-object v0, p7

    move-object p7, p6

    move-object p6, p5

    move-wide p4, p3

    move p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "corePoolSize":I
    .end local p5    # "unit":Ljava/util/concurrent/TimeUnit;
    .local v0, "threadFactory":Ljava/util/concurrent/ThreadFactory;
    .local p2, "corePoolSize":I
    .local p3, "maximumPoolSize":I
    .local p4, "keepAliveTime":J
    .local p6, "unit":Ljava/util/concurrent/TimeUnit;
    .local p7, "workQueue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Ljava/lang/Runnable;>;"
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 58
    return-void
.end method

.method private findClassNamesWithTooManyRunnables(Ljava/util/Map;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 100
    .local p1, "counts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .local v0, "classesWithTooManyRunnables":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 102
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x20

    if-le v3, v4, :cond_0

    .line 103
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_0
    goto :goto_0

    .line 106
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 107
    const-string v1, "NO CLASSES FOUND"

    return-object v1

    .line 109
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getClassName(Ljava/lang/Runnable;)Ljava/lang/String;
    .locals 3
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 64
    .local v0, "blamedClass":Ljava/lang/Class;
    :try_start_0
    const-class v1, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    if-ne v0, v1, :cond_0

    .line 65
    move-object v1, p0

    check-cast v1, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;

    invoke-virtual {v1}, Lorg/chromium/base/task/AsyncTask$NamedFutureTask;->getBlamedClass()Ljava/lang/Class;

    move-result-object v1

    move-object v0, v1

    .end local v0    # "blamedClass":Ljava/lang/Class;
    .local v1, "blamedClass":Ljava/lang/Class;
    goto :goto_0

    .line 66
    .end local v1    # "blamedClass":Ljava/lang/Class;
    .restart local v0    # "blamedClass":Ljava/lang/Class;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Class;->getEnclosingClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/os/AsyncTask;

    if-ne v1, v2, :cond_1

    .line 68
    const-string v1, "this$0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 69
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 70
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 80
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_1
    :goto_0
    goto :goto_1

    .line 76
    :catch_0
    move-exception v1

    .line 77
    .local v1, "e":Ljava/lang/IllegalAccessException;
    sget-boolean v2, Lorg/chromium/build/BuildConfig;->ENABLE_ASSERTS:Z

    if-nez v2, :cond_2

    goto :goto_1

    .line 78
    :cond_2
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 72
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v1

    .line 73
    .local v1, "e":Ljava/lang/NoSuchFieldException;
    sget-boolean v2, Lorg/chromium/build/BuildConfig;->ENABLE_ASSERTS:Z

    if-nez v2, :cond_3

    .end local v1    # "e":Ljava/lang/NoSuchFieldException;
    goto :goto_0

    .line 81
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 74
    .restart local v1    # "e":Ljava/lang/NoSuchFieldException;
    :cond_3
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private getNumberOfClassNameOccurrencesInQueue()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 86
    .local v0, "counts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Runnable;

    invoke-interface {v1, v3}, Ljava/util/concurrent/BlockingQueue;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Runnable;

    .line 87
    .local v1, "copiedQueue":[Ljava/lang/Runnable;
    array-length v3, v1

    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v1, v4

    .line 88
    .local v5, "runnable":Ljava/lang/Runnable;
    invoke-static {v5}, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->getClassName(Ljava/lang/Runnable;)Ljava/lang/String;

    move-result-object v6

    .line 89
    .local v6, "className":Ljava/lang/String;
    invoke-interface {v0, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    goto :goto_1

    :cond_0
    move v7, v2

    .line 90
    .local v7, "count":I
    :goto_1
    add-int/lit8 v8, v7, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v0, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .end local v5    # "runnable":Ljava/lang/Runnable;
    .end local v6    # "className":Ljava/lang/String;
    .end local v7    # "count":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 92
    :cond_1
    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 6
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 115
    :try_start_0
    invoke-super {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    nop

    .line 123
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    invoke-direct {p0}, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->getNumberOfClassNameOccurrencesInQueue()Ljava/util/Map;

    move-result-object v1

    .line 119
    .local v1, "counts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v2, Ljava/util/concurrent/RejectedExecutionException;

    .line 120
    invoke-direct {p0, v1}, Lorg/chromium/base/task/ChromeThreadPoolExecutor;->findClassNamesWithTooManyRunnables(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Prominent classes in AsyncTask: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/util/concurrent/RejectedExecutionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
