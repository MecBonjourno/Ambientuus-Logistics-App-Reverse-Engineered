.class final Lorg/chromium/base/metrics/CachingUmaRecorder;
.super Ljava/lang/Object;
.source "CachingUmaRecorder.java"

# interfaces
.implements Lorg/chromium/base/metrics/UmaRecorder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;,
        Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final MAX_HISTOGRAM_COUNT:I = 0x100

.field static final MAX_USER_ACTION_COUNT:I = 0x100

.field private static final TAG:Ljava/lang/String; = "CachingUmaRecorder"


# instance fields
.field private mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

.field private mDroppedHistogramSampleCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mDroppedUserActionCount:I

.field private mHistogramByName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;",
            ">;"
        }
    .end annotation
.end field

.field private final mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mUserActionCallbacksForTesting:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mUserActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 34
    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>(Z)V

    iput-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 226
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    .line 235
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDroppedHistogramSampleCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 238
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActions:Ljava/util/List;

    return-void
.end method

.method private cacheHistogramSampleAlreadyWriteLocked(ILjava/lang/String;IIII)V
    .locals 8
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "sample"    # I
    .param p4, "min"    # I
    .param p5, "max"    # I
    .param p6, "numBuckets"    # I

    .line 441
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->isWriteLockedByCurrentThread()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 442
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;

    .line 443
    .local v6, "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    if-nez v6, :cond_1

    .line 444
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v1, 0x100

    if-ge v0, v1, :cond_0

    .line 450
    new-instance v0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;

    move v1, p1

    move-object v2, p2

    move v3, p4

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;-><init>(ILjava/lang/String;III)V

    move-object v6, v0

    .line 451
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    invoke-interface {v0, p2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v6

    goto :goto_0

    .line 446
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Too many histograms in cache"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 443
    :cond_1
    move-object v0, v6

    .line 453
    .end local v6    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    .local v0, "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :goto_0
    move v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->addSample(ILjava/lang/String;IIII)Z

    move-result v7

    if-nez v7, :cond_2

    .line 454
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDroppedHistogramSampleCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 456
    :cond_2
    return-void

    .line 441
    .end local v0    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private cacheOrRecordHistogramSample(ILjava/lang/String;IIII)V
    .locals 3
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "sample"    # I
    .param p4, "min"    # I
    .param p5, "max"    # I
    .param p6, "numBuckets"    # I

    .line 369
    invoke-direct/range {p0 .. p6}, Lorg/chromium/base/metrics/CachingUmaRecorder;->tryAppendOrRecordSample(ILjava/lang/String;IIII)Z

    move-result v0

    move v1, p6

    move p6, p5

    move p5, p4

    move p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "type":I
    .local v1, "numBuckets":I
    .local p2, "type":I
    .local p3, "name":Ljava/lang/String;
    .local p4, "sample":I
    .local p5, "min":I
    .local p6, "max":I
    if-eqz v0, :cond_0

    .line 370
    return-void

    .line 373
    :cond_0
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 375
    :try_start_0
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    if-nez v0, :cond_1

    .line 376
    move p1, p2

    move-object p2, p3

    move p3, p4

    move p4, p5

    move p5, p6

    move p6, v1

    .end local v1    # "numBuckets":I
    .restart local p1    # "type":I
    .local p2, "name":Ljava/lang/String;
    .local p3, "sample":I
    .local p4, "min":I
    .local p5, "max":I
    .local p6, "numBuckets":I
    :try_start_1
    invoke-direct/range {p0 .. p6}, Lorg/chromium/base/metrics/CachingUmaRecorder;->cacheHistogramSampleAlreadyWriteLocked(ILjava/lang/String;IIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move p6, p5

    move p5, p4

    move p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    .line 382
    .end local p1    # "type":I
    .restart local v1    # "numBuckets":I
    .local p2, "type":I
    .local p3, "name":Ljava/lang/String;
    .local p4, "sample":I
    .local p5, "min":I
    .local p6, "max":I
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 377
    return-void

    .line 382
    .end local v1    # "numBuckets":I
    .restart local p1    # "type":I
    .local p2, "name":Ljava/lang/String;
    .local p3, "sample":I
    .local p4, "min":I
    .local p5, "max":I
    .local p6, "numBuckets":I
    :catchall_0
    move-exception v0

    move v1, p6

    move p6, p5

    move p5, p4

    move p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "type":I
    .restart local v1    # "numBuckets":I
    .local p2, "type":I
    .local p3, "name":Ljava/lang/String;
    .local p4, "sample":I
    .local p5, "min":I
    .local p6, "max":I
    goto :goto_1

    .line 380
    :cond_1
    :try_start_2
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 382
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 383
    nop

    .line 388
    :try_start_3
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v0, :cond_2

    .line 389
    move p1, p2

    move-object p2, p3

    move p3, p4

    move p4, p5

    move p5, p6

    move p6, v1

    .end local v1    # "numBuckets":I
    .restart local p1    # "type":I
    .local p2, "name":Ljava/lang/String;
    .local p3, "sample":I
    .local p4, "min":I
    .local p5, "max":I
    .local p6, "numBuckets":I
    :try_start_4
    invoke-direct/range {p0 .. p6}, Lorg/chromium/base/metrics/CachingUmaRecorder;->recordHistogramSampleAlreadyLocked(ILjava/lang/String;IIII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move p6, p5

    move p5, p4

    move p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    .line 391
    .end local p1    # "type":I
    .restart local v1    # "numBuckets":I
    .local p2, "type":I
    .local p3, "name":Ljava/lang/String;
    .local p4, "sample":I
    .local p5, "min":I
    .local p6, "max":I
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 392
    nop

    .line 393
    return-void

    .line 391
    .end local v1    # "numBuckets":I
    .restart local p1    # "type":I
    .local p2, "name":Ljava/lang/String;
    .local p3, "sample":I
    .local p4, "min":I
    .local p5, "max":I
    .local p6, "numBuckets":I
    :catchall_1
    move-exception v0

    move v1, p6

    move p6, p5

    move p5, p4

    move p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "type":I
    .restart local v1    # "numBuckets":I
    .local p2, "type":I
    .local p3, "name":Ljava/lang/String;
    .local p4, "sample":I
    .local p5, "min":I
    .local p6, "max":I
    goto :goto_0

    .line 388
    :cond_2
    :try_start_5
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    .end local v1    # "numBuckets":I
    .end local p2    # "type":I
    .end local p3    # "name":Ljava/lang/String;
    .end local p4    # "sample":I
    .end local p5    # "min":I
    .end local p6    # "max":I
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 391
    .restart local v1    # "numBuckets":I
    .restart local p2    # "type":I
    .restart local p3    # "name":Ljava/lang/String;
    .restart local p4    # "sample":I
    .restart local p5    # "min":I
    .restart local p6    # "max":I
    :catchall_2
    move-exception v0

    :goto_0
    iget-object v2, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 392
    throw v0

    .line 382
    :catchall_3
    move-exception v0

    :goto_1
    iget-object v2, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 383
    throw v0
.end method

.method private flushHistogramsAlreadyLocked(Ljava/util/Map;I)V
    .locals 7
    .param p2, "droppedHistogramSampleCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;",
            ">;I)V"
        }
    .end annotation

    .line 326
    .local p1, "cache":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;>;"
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_2

    .line 327
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadHoldCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 328
    const/4 v0, 0x0

    .line 329
    .local v0, "flushedHistogramSampleCount":I
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    .line 330
    .local v1, "flushedHistogramCount":I
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;

    .line 331
    .local v3, "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    iget-object v4, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-virtual {v3, v4}, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->flushTo(Lorg/chromium/base/metrics/UmaRecorder;)I

    move-result v4

    add-int/2addr v0, v4

    .line 332
    .end local v3    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    goto :goto_0

    .line 333
    :cond_0
    nop

    .line 334
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v2, 0x1

    aput-object v3, v5, v2

    const/4 v2, 0x2

    aput-object v4, v5, v2

    .line 333
    const-string v2, "CachingUmaRecorder"

    const-string v3, "Flushed %d samples from %d histograms, %d samples were dropped."

    invoke-static {v2, v3, v5}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 335
    return-void

    .line 327
    .end local v0    # "flushedHistogramSampleCount":I
    .end local v1    # "flushedHistogramCount":I
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 326
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Unexpected: cache is flushed, but delegate is null"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private flushUserActionsAlreadyLocked(Ljava/util/List;I)V
    .locals 4
    .param p2, "droppedUserActionCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;",
            ">;I)V"
        }
    .end annotation

    .line 346
    .local p1, "cache":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;>;"
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_2

    .line 347
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadHoldCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 348
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;

    .line 349
    .local v1, "userAction":Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;
    iget-object v2, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-virtual {v1, v2}, Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;->flushTo(Lorg/chromium/base/metrics/UmaRecorder;)V

    .line 350
    .end local v1    # "userAction":Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;
    goto :goto_0

    .line 351
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 352
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 351
    const-string v2, "CachingUmaRecorder"

    const-string v3, "Flushed %d user action samples, %d samples were dropped."

    invoke-static {v2, v3, v0, v1}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 353
    return-void

    .line 347
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 346
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Unexpected: cache is flushed, but delegate is null"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private recordHistogramSampleAlreadyLocked(ILjava/lang/String;IIII)V
    .locals 8
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "sample"    # I
    .param p4, "min"    # I
    .param p5, "max"    # I
    .param p6, "numBuckets"    # I

    .line 472
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadHoldCount()I

    move-result v0

    if-lez v0, :cond_3

    .line 473
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->isWriteLockedByCurrentThread()Z

    move-result v0

    if-nez v0, :cond_2

    .line 474
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_1

    .line 475
    packed-switch p1, :pswitch_data_0

    .line 489
    move-object v2, p2

    move v3, p3

    move v4, p4

    .end local p2    # "name":Ljava/lang/String;
    .end local p3    # "sample":I
    .end local p4    # "min":I
    .local v2, "name":Ljava/lang/String;
    .local v3, "sample":I
    .local v4, "min":I
    new-instance p2, Ljava/lang/UnsupportedOperationException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Unknown histogram type "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 486
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "sample":I
    .end local v4    # "min":I
    .restart local p2    # "name":Ljava/lang/String;
    .restart local p3    # "sample":I
    .restart local p4    # "min":I
    :pswitch_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface {v0, p2, p3}, Lorg/chromium/base/metrics/UmaRecorder;->recordSparseHistogram(Ljava/lang/String;I)V

    .line 487
    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    goto :goto_1

    .line 483
    :pswitch_1
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .end local p2    # "name":Ljava/lang/String;
    .end local p3    # "sample":I
    .end local p4    # "min":I
    .end local p5    # "max":I
    .end local p6    # "numBuckets":I
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "sample":I
    .restart local v4    # "min":I
    .local v5, "max":I
    .local v6, "numBuckets":I
    invoke-interface/range {v1 .. v6}, Lorg/chromium/base/metrics/UmaRecorder;->recordLinearHistogram(Ljava/lang/String;IIII)V

    .line 484
    goto :goto_1

    .line 480
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "sample":I
    .end local v4    # "min":I
    .end local v5    # "max":I
    .end local v6    # "numBuckets":I
    .restart local p2    # "name":Ljava/lang/String;
    .restart local p3    # "sample":I
    .restart local p4    # "min":I
    .restart local p5    # "max":I
    .restart local p6    # "numBuckets":I
    :pswitch_2
    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .end local p2    # "name":Ljava/lang/String;
    .end local p3    # "sample":I
    .end local p4    # "min":I
    .end local p5    # "max":I
    .end local p6    # "numBuckets":I
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "sample":I
    .restart local v4    # "min":I
    .restart local v5    # "max":I
    .restart local v6    # "numBuckets":I
    move v7, v6

    move v6, v5

    move v5, v4

    move v4, v3

    move-object v3, v2

    .end local v2    # "name":Ljava/lang/String;
    .local v3, "name":Ljava/lang/String;
    .local v4, "sample":I
    .local v5, "min":I
    .local v6, "max":I
    .local v7, "numBuckets":I
    iget-object v2, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface/range {v2 .. v7}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 481
    move-object v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    .end local v7    # "numBuckets":I
    .restart local v2    # "name":Ljava/lang/String;
    .local v3, "sample":I
    .local v4, "min":I
    .local v5, "max":I
    .local v6, "numBuckets":I
    goto :goto_1

    .line 477
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "sample":I
    .end local v4    # "min":I
    .end local v5    # "max":I
    .end local v6    # "numBuckets":I
    .restart local p2    # "name":Ljava/lang/String;
    .restart local p3    # "sample":I
    .restart local p4    # "min":I
    .restart local p5    # "max":I
    .restart local p6    # "numBuckets":I
    :pswitch_3
    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .end local p2    # "name":Ljava/lang/String;
    .end local p3    # "sample":I
    .end local p4    # "min":I
    .end local p5    # "max":I
    .end local p6    # "numBuckets":I
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "sample":I
    .restart local v4    # "min":I
    .restart local v5    # "max":I
    .restart local v6    # "numBuckets":I
    iget-object p2, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v3, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    invoke-interface {p2, v2, p3}, Lorg/chromium/base/metrics/UmaRecorder;->recordBooleanHistogram(Ljava/lang/String;Z)V

    .line 478
    nop

    .line 491
    :goto_1
    return-void

    .line 474
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "sample":I
    .end local v4    # "min":I
    .end local v5    # "max":I
    .end local v6    # "numBuckets":I
    .restart local p2    # "name":Ljava/lang/String;
    .restart local p3    # "sample":I
    .restart local p4    # "min":I
    .restart local p5    # "max":I
    .restart local p6    # "numBuckets":I
    :cond_1
    move-object v2, p2

    move v3, p3

    .end local p2    # "name":Ljava/lang/String;
    .end local p3    # "sample":I
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "sample":I
    new-instance p2, Ljava/lang/AssertionError;

    const-string p3, "recordSampleAlreadyLocked called with no delegate to record to"

    invoke-direct {p2, p3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2

    .line 473
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "sample":I
    .restart local p2    # "name":Ljava/lang/String;
    .restart local p3    # "sample":I
    :cond_2
    move-object v2, p2

    .end local p2    # "name":Ljava/lang/String;
    .restart local v2    # "name":Ljava/lang/String;
    new-instance p2, Ljava/lang/AssertionError;

    invoke-direct {p2}, Ljava/lang/AssertionError;-><init>()V

    throw p2

    .line 472
    .end local v2    # "name":Ljava/lang/String;
    .restart local p2    # "name":Ljava/lang/String;
    :cond_3
    move-object v2, p2

    .end local p2    # "name":Ljava/lang/String;
    .restart local v2    # "name":Ljava/lang/String;
    new-instance p2, Ljava/lang/AssertionError;

    invoke-direct {p2}, Ljava/lang/AssertionError;-><init>()V

    throw p2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private swapUserActionCallbacksForTesting(Lorg/chromium/base/metrics/UmaRecorder;Lorg/chromium/base/metrics/UmaRecorder;)V
    .locals 2
    .param p1, "previousRecorder"    # Lorg/chromium/base/metrics/UmaRecorder;
    .param p2, "newRecorder"    # Lorg/chromium/base/metrics/UmaRecorder;

    .line 671
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    if-nez v0, :cond_0

    return-void

    .line 673
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 674
    if-eqz p1, :cond_1

    .line 675
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    .line 676
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/Callback;

    .line 675
    invoke-interface {p1, v1}, Lorg/chromium/base/metrics/UmaRecorder;->removeUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V

    .line 678
    :cond_1
    if-eqz p2, :cond_2

    .line 679
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/Callback;

    invoke-interface {p2, v1}, Lorg/chromium/base/metrics/UmaRecorder;->addUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V

    .line 673
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 682
    .end local v0    # "i":I
    :cond_3
    return-void
.end method

.method private tryAppendOrRecordSample(ILjava/lang/String;IIII)Z
    .locals 9
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "sample"    # I
    .param p4, "min"    # I
    .param p5, "max"    # I
    .param p6, "numBuckets"    # I

    .line 408
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 410
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 411
    :try_start_1
    invoke-direct/range {p0 .. p6}, Lorg/chromium/base/metrics/CachingUmaRecorder;->recordHistogramSampleAlreadyLocked(ILjava/lang/String;IIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v3, p1

    move-object p1, p0

    .line 412
    .end local p1    # "type":I
    .local v3, "type":I
    nop

    .line 423
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 412
    return v1

    .line 423
    .end local v3    # "type":I
    .restart local p1    # "type":I
    :catchall_0
    move-exception v0

    move v3, p1

    move-object p1, p0

    move-object v4, p2

    .end local p1    # "type":I
    .restart local v3    # "type":I
    goto :goto_1

    .line 414
    .end local v3    # "type":I
    .restart local p1    # "type":I
    :cond_0
    move v3, p1

    move-object p1, p0

    .end local p1    # "type":I
    .restart local v3    # "type":I
    :try_start_2
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 415
    .local v2, "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    if-nez v2, :cond_1

    .line 416
    nop

    .line 423
    iget-object v0, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 416
    const/4 v0, 0x0

    return v0

    .line 418
    :cond_1
    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    .end local p2    # "name":Ljava/lang/String;
    .end local p3    # "sample":I
    .end local p4    # "min":I
    .end local p5    # "max":I
    .end local p6    # "numBuckets":I
    .local v4, "name":Ljava/lang/String;
    .local v5, "sample":I
    .local v6, "min":I
    .local v7, "max":I
    .local v8, "numBuckets":I
    :try_start_3
    invoke-virtual/range {v2 .. v8}, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->addSample(ILjava/lang/String;IIII)Z

    move-result p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .end local v5    # "sample":I
    .end local v6    # "min":I
    .end local v7    # "max":I
    .end local v8    # "numBuckets":I
    .restart local p3    # "sample":I
    .restart local p4    # "min":I
    .restart local p5    # "max":I
    .restart local p6    # "numBuckets":I
    if-nez p2, :cond_2

    .line 419
    :try_start_4
    iget-object p2, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDroppedHistogramSampleCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 423
    .end local v2    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :catchall_1
    move-exception v0

    goto :goto_1

    .line 421
    .restart local v2    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :cond_2
    :goto_0
    nop

    .line 423
    iget-object p2, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 421
    return v1

    .line 423
    .end local v2    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    .end local p3    # "sample":I
    .end local p4    # "min":I
    .end local p5    # "max":I
    .end local p6    # "numBuckets":I
    .restart local v5    # "sample":I
    .restart local v6    # "min":I
    .restart local v7    # "max":I
    .restart local v8    # "numBuckets":I
    :catchall_2
    move-exception v0

    move p3, v5

    move p4, v6

    move p5, v7

    move p6, v8

    .end local v5    # "sample":I
    .end local v6    # "min":I
    .end local v7    # "max":I
    .end local v8    # "numBuckets":I
    .restart local p3    # "sample":I
    .restart local p4    # "min":I
    .restart local p5    # "max":I
    .restart local p6    # "numBuckets":I
    goto :goto_1

    .end local v4    # "name":Ljava/lang/String;
    .restart local p2    # "name":Ljava/lang/String;
    :catchall_3
    move-exception v0

    move-object v4, p2

    .end local p2    # "name":Ljava/lang/String;
    .restart local v4    # "name":Ljava/lang/String;
    goto :goto_1

    .end local v3    # "type":I
    .end local v4    # "name":Ljava/lang/String;
    .restart local p1    # "type":I
    .restart local p2    # "name":Ljava/lang/String;
    :catchall_4
    move-exception v0

    move v3, p1

    move-object v4, p2

    move-object p1, p0

    .end local p1    # "type":I
    .end local p2    # "name":Ljava/lang/String;
    .restart local v3    # "type":I
    .restart local v4    # "name":Ljava/lang/String;
    :goto_1
    iget-object p2, p1, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 424
    throw v0
.end method


# virtual methods
.method public addUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 638
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 640
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    if-nez v0, :cond_0

    .line 641
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    .line 643
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 644
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface {v0, p1}, Lorg/chromium/base/metrics/UmaRecorder;->addUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 646
    :cond_1
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 647
    nop

    .line 648
    return-void

    .line 646
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 647
    throw v0
.end method

.method public getHistogramSamplesForTesting(Ljava/lang/String;)Ljava/util/List;
    .locals 9
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/chromium/base/metrics/HistogramBucket;",
            ">;"
        }
    .end annotation

    .line 607
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 609
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface {v0, p1}, Lorg/chromium/base/metrics/UmaRecorder;->getHistogramSamplesForTesting(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 631
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 609
    return-object v0

    .line 611
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;

    .line 612
    .local v0, "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    if-nez v0, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 631
    iget-object v2, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 612
    return-object v1

    .line 614
    :cond_1
    :try_start_2
    monitor-enter v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 615
    :try_start_3
    invoke-static {v0}, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->-$$Nest$fgetmSamples(Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Integer;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Integer;

    .line 616
    .local v1, "samplesCopy":[Ljava/lang/Integer;
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 617
    :try_start_4
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 618
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 619
    .local v2, "buckets":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/metrics/HistogramBucket;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_4

    .line 620
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 621
    .local v4, "value":I
    const/4 v5, 0x0

    .line 623
    .local v5, "countInBucket":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 624
    add-int/lit8 v3, v3, 0x1

    .line 625
    array-length v6, v1

    if-ge v3, v6, :cond_3

    aget-object v6, v1, v3

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eq v6, v4, :cond_2

    .line 627
    :cond_3
    new-instance v6, Lorg/chromium/base/metrics/HistogramBucket;

    add-int/lit8 v7, v4, 0x1

    int-to-long v7, v7

    invoke-direct {v6, v4, v7, v8, v5}, Lorg/chromium/base/metrics/HistogramBucket;-><init>(IJI)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 628
    nop

    .end local v4    # "value":I
    .end local v5    # "countInBucket":I
    goto :goto_0

    .line 629
    .end local v3    # "i":I
    :cond_4
    nop

    .line 631
    iget-object v3, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 629
    return-object v2

    .line 616
    .end local v1    # "samplesCopy":[Ljava/lang/Integer;
    .end local v2    # "buckets":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/metrics/HistogramBucket;>;"
    :catchall_0
    move-exception v1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .end local p1    # "name":Ljava/lang/String;
    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 631
    .end local v0    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    .restart local p1    # "name":Ljava/lang/String;
    :catchall_1
    move-exception v0

    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 632
    throw v0
.end method

.method public getHistogramTotalCountForTesting(Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 590
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 592
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface {v0, p1}, Lorg/chromium/base/metrics/UmaRecorder;->getHistogramTotalCountForTesting(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 600
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 592
    return v0

    .line 594
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 595
    .local v0, "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    if-nez v0, :cond_1

    .line 600
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 595
    const/4 v1, 0x0

    return v1

    .line 596
    :cond_1
    :try_start_2
    monitor-enter v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 597
    :try_start_3
    invoke-static {v0}, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->-$$Nest$fgetmSamples(Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 600
    iget-object v2, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 597
    return v1

    .line 598
    :catchall_0
    move-exception v1

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .end local p1    # "name":Ljava/lang/String;
    :try_start_5
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 600
    .end local v0    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    .restart local p1    # "name":Ljava/lang/String;
    :catchall_1
    move-exception v0

    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 601
    throw v0
.end method

.method public getHistogramValueCountForTesting(Ljava/lang/String;I)I
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I

    .line 569
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 571
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface {v0, p1, p2}, Lorg/chromium/base/metrics/UmaRecorder;->getHistogramValueCountForTesting(Ljava/lang/String;I)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 583
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 571
    return v0

    .line 573
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 574
    .local v0, "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    if-nez v0, :cond_1

    .line 583
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 574
    const/4 v1, 0x0

    return v1

    .line 575
    :cond_1
    const/4 v1, 0x0

    .line 576
    .local v1, "sampleCount":I
    :try_start_2
    monitor-enter v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 577
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    :try_start_3
    invoke-static {v0}, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->-$$Nest$fgetmSamples(Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 578
    invoke-static {v0}, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->-$$Nest$fgetmSamples(Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, p2, :cond_2

    add-int/lit8 v1, v1, 0x1

    .line 577
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 580
    .end local v2    # "i":I
    :cond_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 581
    nop

    .line 583
    iget-object v2, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 581
    return v1

    .line 580
    :catchall_0
    move-exception v2

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "sample":I
    :try_start_5
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 583
    .end local v0    # "histogram":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    .end local v1    # "sampleCount":I
    .restart local p1    # "name":Ljava/lang/String;
    .restart local p2    # "sample":I
    :catchall_1
    move-exception v0

    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 584
    throw v0
.end method

.method public recordBooleanHistogram(Ljava/lang/String;Z)V
    .locals 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "boolSample"    # Z

    .line 495
    move v3, p2

    .line 496
    .local v3, "sample":I
    const/4 v7, 0x0

    .line 497
    .local v7, "min":I
    const/4 v8, 0x0

    .line 498
    .local v8, "max":I
    const/4 v9, 0x0

    .line 499
    .local v9, "numBuckets":I
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v1, 0x1

    const/4 v4, 0x0

    move-object v0, p0

    move-object v2, p1

    .end local p1    # "name":Ljava/lang/String;
    .local v2, "name":Ljava/lang/String;
    invoke-direct/range {v0 .. v6}, Lorg/chromium/base/metrics/CachingUmaRecorder;->cacheOrRecordHistogramSample(ILjava/lang/String;IIII)V

    .line 500
    return-void
.end method

.method public recordExponentialHistogram(Ljava/lang/String;IIII)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I
    .param p3, "min"    # I
    .param p4, "max"    # I
    .param p5, "numBuckets"    # I

    .line 505
    const/4 v1, 0x2

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "sample":I
    .end local p3    # "min":I
    .end local p4    # "max":I
    .end local p5    # "numBuckets":I
    .local v2, "name":Ljava/lang/String;
    .local v3, "sample":I
    .local v4, "min":I
    .local v5, "max":I
    .local v6, "numBuckets":I
    invoke-direct/range {v0 .. v6}, Lorg/chromium/base/metrics/CachingUmaRecorder;->cacheOrRecordHistogramSample(ILjava/lang/String;IIII)V

    .line 507
    return-void
.end method

.method public recordLinearHistogram(Ljava/lang/String;IIII)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I
    .param p3, "min"    # I
    .param p4, "max"    # I
    .param p5, "numBuckets"    # I

    .line 511
    const/4 v1, 0x3

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "sample":I
    .end local p3    # "min":I
    .end local p4    # "max":I
    .end local p5    # "numBuckets":I
    .local v2, "name":Ljava/lang/String;
    .local v3, "sample":I
    .local v4, "min":I
    .local v5, "max":I
    .local v6, "numBuckets":I
    invoke-direct/range {v0 .. v6}, Lorg/chromium/base/metrics/CachingUmaRecorder;->cacheOrRecordHistogramSample(ILjava/lang/String;IIII)V

    .line 512
    return-void
.end method

.method public recordSparseHistogram(Ljava/lang/String;I)V
    .locals 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I

    .line 516
    const/4 v0, 0x0

    .line 517
    .local v0, "min":I
    const/4 v1, 0x0

    .line 518
    .local v1, "max":I
    const/4 v2, 0x0

    .line 519
    .local v2, "numBuckets":I
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x4

    const/4 v7, 0x0

    move-object v3, p0

    move-object v5, p1

    move v6, p2

    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "sample":I
    .local v5, "name":Ljava/lang/String;
    .local v6, "sample":I
    invoke-direct/range {v3 .. v9}, Lorg/chromium/base/metrics/CachingUmaRecorder;->cacheOrRecordHistogramSample(ILjava/lang/String;IIII)V

    .line 520
    return-void
.end method

.method public recordUserAction(Ljava/lang/String;J)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "elapsedRealtimeMillis"    # J

    .line 524
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 526
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_0

    .line 527
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface {v0, p1, p2, p3}, Lorg/chromium/base/metrics/UmaRecorder;->recordUserAction(Ljava/lang/String;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 531
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 528
    return-void

    .line 531
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 532
    nop

    .line 534
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 536
    :try_start_1
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-nez v0, :cond_3

    .line 537
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x100

    if-ge v0, v1, :cond_2

    .line 538
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActions:Ljava/util/List;

    new-instance v1, Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;

    invoke-direct {v1, p1, p2, p3}, Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;-><init>(Ljava/lang/String;J)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 543
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 544
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 545
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/Callback;

    invoke-interface {v1, p1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 544
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 553
    .end local v0    # "i":I
    :cond_1
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 548
    return-void

    .line 540
    :cond_2
    :try_start_2
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Too many user actions in cache"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "elapsedRealtimeMillis":J
    throw v0

    .line 551
    .restart local p1    # "name":Ljava/lang/String;
    .restart local p2    # "elapsedRealtimeMillis":J
    :cond_3
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 553
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 554
    nop

    .line 559
    :try_start_3
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_4

    .line 560
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface {v0, p1, p2, p3}, Lorg/chromium/base/metrics/UmaRecorder;->recordUserAction(Ljava/lang/String;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 562
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 563
    nop

    .line 564
    return-void

    .line 562
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 559
    :cond_4
    :try_start_4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "elapsedRealtimeMillis":J
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 562
    .restart local p1    # "name":Ljava/lang/String;
    .restart local p2    # "elapsedRealtimeMillis":J
    :goto_1
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 563
    throw v0

    .line 553
    :catchall_1
    move-exception v0

    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 554
    throw v0

    .line 531
    :catchall_2
    move-exception v0

    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 532
    throw v0
.end method

.method public removeUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 653
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 655
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 660
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActionCallbacksForTesting:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 661
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    invoke-interface {v0, p1}, Lorg/chromium/base/metrics/UmaRecorder;->removeUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 663
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 664
    nop

    .line 665
    return-void

    .line 656
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Attempting to remove a user action callback without previously registering any."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local p1    # "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/String;>;"
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 663
    .restart local p1    # "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/String;>;"
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 664
    throw v0
.end method

.method public setDelegate(Lorg/chromium/base/metrics/UmaRecorder;)Lorg/chromium/base/metrics/UmaRecorder;
    .locals 7
    .param p1, "recorder"    # Lorg/chromium/base/metrics/UmaRecorder;

    .line 270
    const/4 v0, 0x0

    .line 271
    .local v0, "histogramCache":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;>;"
    const/4 v1, 0x0

    .line 272
    .local v1, "droppedHistogramSampleCount":I
    const/4 v2, 0x0

    .line 273
    .local v2, "userActionCache":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/metrics/CachingUmaRecorder$UserAction;>;"
    const/4 v3, 0x0

    .line 275
    .local v3, "droppedUserActionCount":I
    iget-object v4, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 277
    :try_start_0
    iget-object v4, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    .line 278
    .local v4, "previous":Lorg/chromium/base/metrics/UmaRecorder;
    iput-object p1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDelegate:Lorg/chromium/base/metrics/UmaRecorder;

    .line 279
    sget-boolean v5, Lorg/chromium/build/BuildConfig;->IS_FOR_TEST:Z

    if-eqz v5, :cond_0

    .line 280
    invoke-direct {p0, v4, p1}, Lorg/chromium/base/metrics/CachingUmaRecorder;->swapUserActionCallbacksForTesting(Lorg/chromium/base/metrics/UmaRecorder;Lorg/chromium/base/metrics/UmaRecorder;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 282
    :cond_0
    if-nez p1, :cond_1

    .line 283
    nop

    .line 299
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 283
    return-object v4

    .line 285
    :cond_1
    :try_start_1
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_2

    .line 286
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    move-object v0, v5

    .line 287
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mHistogramByName:Ljava/util/Map;

    .line 288
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDroppedHistogramSampleCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v5

    move v1, v5

    .line 290
    :cond_2
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActions:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 291
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActions:Ljava/util/List;

    move-object v2, v5

    .line 292
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mUserActions:Ljava/util/List;

    .line 293
    iget v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDroppedUserActionCount:I

    move v3, v5

    .line 294
    iput v6, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mDroppedUserActionCount:I

    .line 297
    :cond_3
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 299
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 300
    nop

    .line 303
    if-eqz v0, :cond_4

    .line 304
    :try_start_2
    invoke-direct {p0, v0, v1}, Lorg/chromium/base/metrics/CachingUmaRecorder;->flushHistogramsAlreadyLocked(Ljava/util/Map;I)V

    goto :goto_0

    .line 310
    :catchall_0
    move-exception v5

    goto :goto_1

    .line 306
    :cond_4
    :goto_0
    if-eqz v2, :cond_5

    .line 307
    invoke-direct {p0, v2, v3}, Lorg/chromium/base/metrics/CachingUmaRecorder;->flushUserActionsAlreadyLocked(Ljava/util/List;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 310
    :goto_1
    iget-object v6, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 311
    throw v5

    .line 310
    :cond_5
    :goto_2
    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 311
    nop

    .line 312
    return-object v4

    .line 299
    .end local v4    # "previous":Lorg/chromium/base/metrics/UmaRecorder;
    :catchall_1
    move-exception v4

    iget-object v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder;->mRwLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 300
    throw v4
.end method
