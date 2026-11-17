.class public Lorg/chromium/net/impl/CronetBidirectionalStream;
.super Lorg/chromium/net/ExperimentalBidirectionalStream;
.source "CronetBidirectionalStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/CronetBidirectionalStream$State;,
        Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;,
        Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;,
        Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "cronet"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mCallback:Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;

.field private final mDelayRequestHeadersUntilFirstFlush:Z

.field private mEndOfStreamWritten:Z

.field private mException:Lorg/chromium/net/CronetException;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mFlushData:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

.field private final mInitialMethod:Ljava/lang/String;

.field private final mInitialPriority:I

.field private final mInitialUrl:Ljava/lang/String;

.field private mMetrics:Lorg/chromium/net/RequestFinishedInfo$Metrics;

.field private mNativeStream:J

.field private final mNativeStreamLock:Ljava/lang/Object;

.field private final mNetworkHandle:J

.field private mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

.field private mOnReadCompletedTask:Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;

.field private mPendingData:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private mReadState:I

.field private final mRequestAnnotations:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

.field private final mRequestHeaders:[Ljava/lang/String;

.field private mRequestHeadersSent:Z

.field private mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

.field private final mTrafficStatsTag:I

.field private final mTrafficStatsTagSet:Z

.field private final mTrafficStatsUid:I

.field private final mTrafficStatsUidSet:Z

.field private mWriteState:I


# direct methods
.method static bridge synthetic -$$Nest$fgetmCallback(Lorg/chromium/net/impl/CronetBidirectionalStream;)Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mCallback:Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmInflightDoneCallbackCount(Lorg/chromium/net/impl/CronetBidirectionalStream;)Lorg/chromium/net/impl/RefCountDelegate;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmInitialMethod(Lorg/chromium/net/impl/CronetBidirectionalStream;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialMethod:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmNativeStreamLock(Lorg/chromium/net/impl/CronetBidirectionalStream;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmReadState(Lorg/chromium/net/impl/CronetBidirectionalStream;)I
    .locals 0

    iget p0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmRequestHeadersSent(Lorg/chromium/net/impl/CronetBidirectionalStream;)Z
    .locals 0

    iget-boolean p0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeadersSent:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmResponseInfo(Lorg/chromium/net/impl/CronetBidirectionalStream;)Lorg/chromium/net/impl/UrlResponseInfoImpl;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmWriteState(Lorg/chromium/net/impl/CronetBidirectionalStream;)I
    .locals 0

    iget p0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fputmReadState(Lorg/chromium/net/impl/CronetBidirectionalStream;I)V
    .locals 0

    iput p1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmRequestHeadersSent(Lorg/chromium/net/impl/CronetBidirectionalStream;Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeadersSent:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmWriteState(Lorg/chromium/net/impl/CronetBidirectionalStream;I)V
    .locals 0

    iput p1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mfailWithExceptionOnExecutor(Lorg/chromium/net/impl/CronetBidirectionalStream;Lorg/chromium/net/CronetException;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetBidirectionalStream;->failWithExceptionOnExecutor(Lorg/chromium/net/CronetException;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$misDoneLocked(Lorg/chromium/net/impl/CronetBidirectionalStream;)Z
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mmaybeOnSucceededOnExecutor(Lorg/chromium/net/impl/CronetBidirectionalStream;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->maybeOnSucceededOnExecutor()V

    return-void
.end method

.method static bridge synthetic -$$Nest$monCallbackException(Lorg/chromium/net/impl/CronetBidirectionalStream;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetBidirectionalStream;->onCallbackException(Ljava/lang/Exception;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdoesMethodAllowWriteData(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->doesMethodAllowWriteData(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 45
    return-void
.end method

.method constructor <init>(Lorg/chromium/net/impl/CronetUrlRequestContext;Ljava/lang/String;ILorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;Ljava/lang/String;Ljava/util/List;ZLjava/util/Collection;ZIZIJ)V
    .locals 10
    .param p1, "requestContext"    # Lorg/chromium/net/impl/CronetUrlRequestContext;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "priority"    # I
    .param p4, "callback"    # Lorg/chromium/net/BidirectionalStream$Callback;
    .param p5, "executor"    # Ljava/util/concurrent/Executor;
    .param p6, "httpMethod"    # Ljava/lang/String;
    .param p8, "delayRequestHeadersUntilNextFlush"    # Z
    .param p10, "trafficStatsTagSet"    # Z
    .param p11, "trafficStatsTag"    # I
    .param p12, "trafficStatsUidSet"    # Z
    .param p13, "trafficStatsUid"    # I
    .param p14, "networkHandle"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/net/impl/CronetUrlRequestContext;",
            "Ljava/lang/String;",
            "I",
            "Lorg/chromium/net/BidirectionalStream$Callback;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;Z",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;ZIZIJ)V"
        }
    .end annotation

    .line 246
    .local p7, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p9, "requestAnnotations":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    invoke-direct {p0}, Lorg/chromium/net/ExperimentalBidirectionalStream;-><init>()V

    .line 109
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    .line 143
    const/4 v0, 0x0

    iput v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    .line 153
    iput v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    .line 247
    iput-object p1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 248
    iput-object p2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialUrl:Ljava/lang/String;

    .line 249
    invoke-static {p3}, Lorg/chromium/net/impl/CronetBidirectionalStream;->convertStreamPriority(I)I

    move-result v0

    iput v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialPriority:I

    .line 250
    new-instance v0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;

    invoke-direct {v0, p4}, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;-><init>(Lorg/chromium/net/BidirectionalStream$Callback;)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mCallback:Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;

    .line 251
    move-object v0, p5

    iput-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mExecutor:Ljava/util/concurrent/Executor;

    .line 252
    move-object/from16 v1, p6

    iput-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialMethod:Ljava/lang/String;

    .line 253
    invoke-static/range {p7 .. p7}, Lorg/chromium/net/impl/CronetBidirectionalStream;->stringsFromHeaderList(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeaders:[Ljava/lang/String;

    .line 254
    move/from16 v2, p8

    iput-boolean v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mDelayRequestHeadersUntilFirstFlush:Z

    .line 255
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    .line 256
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    .line 257
    move-object/from16 v3, p9

    iput-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestAnnotations:Ljava/util/Collection;

    .line 258
    move/from16 v4, p10

    iput-boolean v4, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mTrafficStatsTagSet:Z

    .line 259
    move/from16 v5, p11

    iput v5, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mTrafficStatsTag:I

    .line 260
    move/from16 v6, p12

    iput-boolean v6, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mTrafficStatsUidSet:Z

    .line 261
    move/from16 v7, p13

    iput v7, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mTrafficStatsUid:I

    .line 262
    move-wide/from16 v8, p14

    iput-wide v8, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNetworkHandle:J

    .line 263
    return-void
.end method

.method private static convertStreamPriority(I)I
    .locals 2
    .param p0, "priority"    # I

    .line 735
    packed-switch p0, :pswitch_data_0

    .line 747
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid stream priority."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 745
    :pswitch_0
    const/4 v0, 0x5

    return v0

    .line 743
    :pswitch_1
    const/4 v0, 0x4

    return v0

    .line 741
    :pswitch_2
    const/4 v0, 0x3

    return v0

    .line 739
    :pswitch_3
    const/4 v0, 0x2

    return v0

    .line 737
    :pswitch_4
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private destroyNativeStreamLocked(Z)V
    .locals 6
    .param p1, "sendOnCanceled"    # Z

    .line 780
    sget-object v0, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "destroyNativeStreamLocked "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 781
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 782
    return-void

    .line 784
    :cond_0
    invoke-static {}, Lorg/chromium/net/impl/CronetBidirectionalStreamJni;->get()Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;

    move-result-object v0

    iget-wide v4, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    invoke-interface {v0, v4, v5, p0, p1}, Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;->destroy(JLorg/chromium/net/impl/CronetBidirectionalStream;Z)V

    .line 786
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->onRequestDestroyed()V

    .line 787
    iput-wide v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    .line 788
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    .line 789
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 791
    :cond_1
    return-void
.end method

.method private static doesMethodAllowWriteData(Ljava/lang/String;)Z
    .locals 1
    .param p0, "methodName"    # Ljava/lang/String;

    .line 713
    const-string v0, "GET"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "HEAD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private failWithException(Lorg/chromium/net/CronetException;)V
    .locals 1
    .param p1, "exception"    # Lorg/chromium/net/CronetException;

    .line 831
    new-instance v0, Lorg/chromium/net/impl/CronetBidirectionalStream$5;

    invoke-direct {v0, p0, p1}, Lorg/chromium/net/impl/CronetBidirectionalStream$5;-><init>(Lorg/chromium/net/impl/CronetBidirectionalStream;Lorg/chromium/net/CronetException;)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 837
    return-void
.end method

.method private failWithExceptionOnExecutor(Lorg/chromium/net/CronetException;)V
    .locals 3
    .param p1, "e"    # Lorg/chromium/net/CronetException;

    .line 797
    iput-object p1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mException:Lorg/chromium/net/CronetException;

    .line 799
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 800
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 801
    monitor-exit v0

    return-void

    .line 803
    :cond_0
    const/4 v1, 0x6

    iput v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    iput v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    .line 804
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetBidirectionalStream;->destroyNativeStreamLocked(Z)V

    .line 805
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 807
    :try_start_1
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mCallback:Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;

    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v0, p0, v1, p1}, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->onFailed(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 811
    goto :goto_0

    .line 808
    :catch_0
    move-exception v0

    .line 809
    .local v0, "failException":Ljava/lang/Exception;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception notifying of failed request"

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 812
    .end local v0    # "failException":Ljava/lang/Exception;
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    invoke-virtual {v0}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 813
    return-void

    .line 805
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private static headersListFromStrings([Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
    .param p0, "headers"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 717
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    div-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 718
    .local v0, "headersList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 719
    new-instance v2, Ljava/util/AbstractMap$SimpleImmutableEntry;

    aget-object v3, p0, v1

    add-int/lit8 v4, v1, 0x1

    aget-object v4, p0, v4

    invoke-direct {v2, v3, v4}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 718
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 721
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method private isDoneLocked()Z
    .locals 4

    .line 467
    iget v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private maybeOnSucceededOnExecutor()V
    .locals 3

    .line 474
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 475
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 476
    monitor-exit v0

    return-void

    .line 478
    :cond_0
    iget v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    const/16 v2, 0xa

    if-ne v1, v2, :cond_2

    iget v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    goto :goto_1

    .line 481
    :cond_1
    const/4 v1, 0x7

    iput v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    iput v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    .line 484
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetBidirectionalStream;->destroyNativeStreamLocked(Z)V

    .line 485
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 487
    :try_start_1
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mCallback:Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;

    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v0, p0, v1}, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->onSucceeded(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 490
    goto :goto_0

    .line 488
    :catch_0
    move-exception v0

    .line 489
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception in onSucceeded method"

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 491
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    invoke-virtual {v0}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 492
    return-void

    .line 479
    :cond_2
    :goto_1
    :try_start_2
    monitor-exit v0

    return-void

    .line 485
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private onCallbackException(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .line 821
    new-instance v0, Lorg/chromium/net/impl/CallbackExceptionImpl;

    const-string v1, "CalledByNative method has thrown an exception"

    invoke-direct {v0, v1, p1}, Lorg/chromium/net/impl/CallbackExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 823
    .local v0, "streamError":Lorg/chromium/net/CallbackException;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception in CalledByNative method"

    invoke-static {v1, v2, p1}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 824
    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->failWithExceptionOnExecutor(Lorg/chromium/net/CronetException;)V

    .line 825
    return-void
.end method

.method private onCanceled()V
    .locals 1

    .line 654
    new-instance v0, Lorg/chromium/net/impl/CronetBidirectionalStream$4;

    invoke-direct {v0, p0}, Lorg/chromium/net/impl/CronetBidirectionalStream$4;-><init>(Lorg/chromium/net/impl/CronetBidirectionalStream;)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 665
    return-void
.end method

.method private onError(IIILjava/lang/String;J)V
    .locals 3
    .param p1, "errorCode"    # I
    .param p2, "nativeError"    # I
    .param p3, "nativeQuicError"    # I
    .param p4, "errorString"    # Ljava/lang/String;
    .param p5, "receivedByteCount"    # J

    .line 634
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    if-eqz v0, :cond_0

    .line 635
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v0, p5, p6}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->setReceivedByteCount(J)V

    .line 637
    :cond_0
    const/16 v0, 0xa

    const-string v1, "Exception in BidirectionalStream: "

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 643
    :cond_1
    new-instance v0, Lorg/chromium/net/impl/BidirectionalStreamNetworkException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lorg/chromium/net/impl/BidirectionalStreamNetworkException;-><init>(Ljava/lang/String;II)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->failWithException(Lorg/chromium/net/CronetException;)V

    goto :goto_1

    .line 639
    :cond_2
    :goto_0
    new-instance v0, Lorg/chromium/net/impl/QuicExceptionImpl;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2, p3}, Lorg/chromium/net/impl/QuicExceptionImpl;-><init>(Ljava/lang/String;III)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 646
    :goto_1
    return-void
.end method

.method private onMetricsCollected(JJJJJJJJJJJJJZJJ)V
    .locals 35
    .param p1, "requestStartMs"    # J
    .param p3, "dnsStartMs"    # J
    .param p5, "dnsEndMs"    # J
    .param p7, "connectStartMs"    # J
    .param p9, "connectEndMs"    # J
    .param p11, "sslStartMs"    # J
    .param p13, "sslEndMs"    # J
    .param p15, "sendingStartMs"    # J
    .param p17, "sendingEndMs"    # J
    .param p19, "pushStartMs"    # J
    .param p21, "pushEndMs"    # J
    .param p23, "responseStartMs"    # J
    .param p25, "requestEndMs"    # J
    .param p27, "socketReused"    # Z
    .param p28, "sentByteCount"    # J
    .param p30, "receivedByteCount"    # J

    .line 677
    move-object/from16 v1, p0

    iget-object v2, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v2

    .line 679
    :try_start_0
    iget-object v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mMetrics:Lorg/chromium/net/RequestFinishedInfo$Metrics;

    if-nez v0, :cond_5

    .line 682
    new-instance v3, Lorg/chromium/net/impl/CronetMetrics;

    move-wide/from16 v4, p1

    move-wide/from16 v6, p3

    move-wide/from16 v8, p5

    move-wide/from16 v10, p7

    move-wide/from16 v12, p9

    move-wide/from16 v14, p11

    move-wide/from16 v16, p13

    move-wide/from16 v18, p15

    move-wide/from16 v20, p17

    move-wide/from16 v22, p19

    move-wide/from16 v24, p21

    move-wide/from16 v26, p23

    move-wide/from16 v28, p25

    move/from16 v30, p27

    move-wide/from16 v31, p28

    move-wide/from16 v33, p30

    invoke-direct/range {v3 .. v34}, Lorg/chromium/net/impl/CronetMetrics;-><init>(JJJJJJJJJJJJJZJJ)V

    iput-object v3, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mMetrics:Lorg/chromium/net/RequestFinishedInfo$Metrics;

    .line 686
    iget v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    iget v3, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    if-ne v0, v3, :cond_4

    .line 687
    iget v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    const/4 v3, 0x5

    const/4 v4, 0x7

    if-eq v0, v4, :cond_1

    iget v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    const/4 v5, 0x6

    if-eq v0, v5, :cond_1

    iget v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    .end local p1    # "requestStartMs":J
    .end local p3    # "dnsStartMs":J
    .end local p5    # "dnsEndMs":J
    .end local p7    # "connectStartMs":J
    .end local p9    # "connectEndMs":J
    .end local p11    # "sslStartMs":J
    .end local p13    # "sslEndMs":J
    .end local p15    # "sendingStartMs":J
    .end local p17    # "sendingEndMs":J
    .end local p19    # "pushStartMs":J
    .end local p21    # "pushEndMs":J
    .end local p23    # "responseStartMs":J
    .end local p25    # "requestEndMs":J
    .end local p27    # "socketReused":Z
    .end local p28    # "sentByteCount":J
    .end local p30    # "receivedByteCount":J
    throw v0

    .line 690
    .restart local p1    # "requestStartMs":J
    .restart local p3    # "dnsStartMs":J
    .restart local p5    # "dnsEndMs":J
    .restart local p7    # "connectStartMs":J
    .restart local p9    # "connectEndMs":J
    .restart local p11    # "sslStartMs":J
    .restart local p13    # "sslEndMs":J
    .restart local p15    # "sendingStartMs":J
    .restart local p17    # "sendingEndMs":J
    .restart local p19    # "pushStartMs":J
    .restart local p21    # "pushEndMs":J
    .restart local p23    # "responseStartMs":J
    .restart local p25    # "requestEndMs":J
    .restart local p27    # "socketReused":Z
    .restart local p28    # "sentByteCount":J
    .restart local p30    # "receivedByteCount":J
    :cond_1
    :goto_0
    iget v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    if-ne v0, v4, :cond_2

    .line 691
    const/4 v0, 0x0

    move v7, v0

    .local v0, "finishedReason":I
    goto :goto_1

    .line 692
    .end local v0    # "finishedReason":I
    :cond_2
    iget v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    if-ne v0, v3, :cond_3

    .line 693
    const/4 v0, 0x2

    move v7, v0

    .restart local v0    # "finishedReason":I
    goto :goto_1

    .line 695
    .end local v0    # "finishedReason":I
    :cond_3
    const/4 v0, 0x1

    move v7, v0

    .line 697
    .local v7, "finishedReason":I
    :goto_1
    new-instance v3, Lorg/chromium/net/impl/RequestFinishedInfoImpl;

    iget-object v4, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialUrl:Ljava/lang/String;

    iget-object v5, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestAnnotations:Ljava/util/Collection;

    iget-object v6, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mMetrics:Lorg/chromium/net/RequestFinishedInfo$Metrics;

    iget-object v8, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    iget-object v9, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mException:Lorg/chromium/net/CronetException;

    invoke-direct/range {v3 .. v9}, Lorg/chromium/net/impl/RequestFinishedInfoImpl;-><init>(Ljava/lang/String;Ljava/util/Collection;Lorg/chromium/net/RequestFinishedInfo$Metrics;ILorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V

    .line 700
    .local v3, "requestFinishedInfo":Lorg/chromium/net/RequestFinishedInfo;
    iget-object v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    iget-object v4, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    invoke-virtual {v0, v3, v4}, Lorg/chromium/net/impl/CronetUrlRequestContext;->reportRequestFinished(Lorg/chromium/net/RequestFinishedInfo;Lorg/chromium/net/impl/RefCountDelegate;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 703
    .end local v3    # "requestFinishedInfo":Lorg/chromium/net/RequestFinishedInfo;
    .end local v7    # "finishedReason":I
    :try_start_1
    iget-object v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    invoke-virtual {v0}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 704
    nop

    .line 705
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 706
    return-void

    .line 686
    :cond_4
    :try_start_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    .end local p1    # "requestStartMs":J
    .end local p3    # "dnsStartMs":J
    .end local p5    # "dnsEndMs":J
    .end local p7    # "connectStartMs":J
    .end local p9    # "connectEndMs":J
    .end local p11    # "sslStartMs":J
    .end local p13    # "sslEndMs":J
    .end local p15    # "sendingStartMs":J
    .end local p17    # "sendingEndMs":J
    .end local p19    # "pushStartMs":J
    .end local p21    # "pushEndMs":J
    .end local p23    # "responseStartMs":J
    .end local p25    # "requestEndMs":J
    .end local p27    # "socketReused":Z
    .end local p28    # "sentByteCount":J
    .end local p30    # "receivedByteCount":J
    throw v0

    .line 680
    .restart local p1    # "requestStartMs":J
    .restart local p3    # "dnsStartMs":J
    .restart local p5    # "dnsEndMs":J
    .restart local p7    # "connectStartMs":J
    .restart local p9    # "connectEndMs":J
    .restart local p11    # "sslStartMs":J
    .restart local p13    # "sslEndMs":J
    .restart local p15    # "sendingStartMs":J
    .restart local p17    # "sendingEndMs":J
    .restart local p19    # "pushStartMs":J
    .restart local p21    # "pushEndMs":J
    .restart local p23    # "responseStartMs":J
    .restart local p25    # "requestEndMs":J
    .restart local p27    # "socketReused":Z
    .restart local p28    # "sentByteCount":J
    .restart local p30    # "receivedByteCount":J
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "Metrics collection should only happen once."

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "requestStartMs":J
    .end local p3    # "dnsStartMs":J
    .end local p5    # "dnsEndMs":J
    .end local p7    # "connectStartMs":J
    .end local p9    # "connectEndMs":J
    .end local p11    # "sslStartMs":J
    .end local p13    # "sslEndMs":J
    .end local p15    # "sendingStartMs":J
    .end local p17    # "sendingEndMs":J
    .end local p19    # "pushStartMs":J
    .end local p21    # "pushEndMs":J
    .end local p23    # "responseStartMs":J
    .end local p25    # "requestEndMs":J
    .end local p27    # "socketReused":Z
    .end local p28    # "sentByteCount":J
    .end local p30    # "receivedByteCount":J
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 703
    .restart local p1    # "requestStartMs":J
    .restart local p3    # "dnsStartMs":J
    .restart local p5    # "dnsEndMs":J
    .restart local p7    # "connectStartMs":J
    .restart local p9    # "connectEndMs":J
    .restart local p11    # "sslStartMs":J
    .restart local p13    # "sslEndMs":J
    .restart local p15    # "sendingStartMs":J
    .restart local p17    # "sendingEndMs":J
    .restart local p19    # "pushStartMs":J
    .restart local p21    # "pushEndMs":J
    .restart local p23    # "responseStartMs":J
    .restart local p25    # "requestEndMs":J
    .restart local p27    # "socketReused":Z
    .restart local p28    # "sentByteCount":J
    .restart local p30    # "receivedByteCount":J
    :catchall_0
    move-exception v0

    :try_start_3
    iget-object v3, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    invoke-virtual {v3}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 704
    nop

    .end local p1    # "requestStartMs":J
    .end local p3    # "dnsStartMs":J
    .end local p5    # "dnsEndMs":J
    .end local p7    # "connectStartMs":J
    .end local p9    # "connectEndMs":J
    .end local p11    # "sslStartMs":J
    .end local p13    # "sslEndMs":J
    .end local p15    # "sendingStartMs":J
    .end local p17    # "sendingEndMs":J
    .end local p19    # "pushStartMs":J
    .end local p21    # "pushEndMs":J
    .end local p23    # "responseStartMs":J
    .end local p25    # "requestEndMs":J
    .end local p27    # "socketReused":Z
    .end local p28    # "sentByteCount":J
    .end local p30    # "receivedByteCount":J
    throw v0

    .line 705
    .restart local p1    # "requestStartMs":J
    .restart local p3    # "dnsStartMs":J
    .restart local p5    # "dnsEndMs":J
    .restart local p7    # "connectStartMs":J
    .restart local p9    # "connectEndMs":J
    .restart local p11    # "sslStartMs":J
    .restart local p13    # "sslEndMs":J
    .restart local p15    # "sendingStartMs":J
    .restart local p17    # "sendingEndMs":J
    .restart local p19    # "pushStartMs":J
    .restart local p21    # "pushEndMs":J
    .restart local p23    # "responseStartMs":J
    .restart local p25    # "requestEndMs":J
    .restart local p27    # "socketReused":Z
    .restart local p28    # "sentByteCount":J
    .restart local p30    # "receivedByteCount":J
    :catchall_1
    move-exception v0

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method private onReadCompleted(Ljava/nio/ByteBuffer;IIIJ)V
    .locals 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "bytesRead"    # I
    .param p3, "initialPosition"    # I
    .param p4, "initialLimit"    # I
    .param p5, "receivedByteCount"    # J

    .line 561
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v0, p5, p6}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->setReceivedByteCount(J)V

    .line 562
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    const/4 v1, 0x0

    if-ne v0, p3, :cond_5

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    if-eq v0, p4, :cond_0

    goto :goto_2

    .line 567
    :cond_0
    if-ltz p2, :cond_4

    add-int v0, p3, p2

    if-le v0, p4, :cond_1

    goto :goto_1

    .line 571
    :cond_1
    add-int v0, p3, p2

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 572
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;

    iget-object v0, v0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_3

    .line 573
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;

    iput-object p1, v0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 574
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;

    if-nez p2, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, v0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->mEndOfStream:Z

    .line 575
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 576
    return-void

    .line 572
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 568
    :cond_4
    :goto_1
    new-instance v0, Lorg/chromium/net/impl/CronetExceptionImpl;

    const-string v2, "Invalid number of bytes read"

    invoke-direct {v0, v2, v1}, Lorg/chromium/net/impl/CronetExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 569
    return-void

    .line 563
    :cond_5
    :goto_2
    new-instance v0, Lorg/chromium/net/impl/CronetExceptionImpl;

    const-string v2, "ByteBuffer modified externally during read"

    invoke-direct {v0, v2, v1}, Lorg/chromium/net/impl/CronetExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 565
    return-void
.end method

.method private onResponseHeadersReceived(ILjava/lang/String;[Ljava/lang/String;J)V
    .locals 5
    .param p1, "httpStatusCode"    # I
    .param p2, "negotiatedProtocol"    # Ljava/lang/String;
    .param p3, "headers"    # [Ljava/lang/String;
    .param p4, "receivedByteCount"    # J

    .line 531
    :try_start_0
    invoke-direct/range {p0 .. p5}, Lorg/chromium/net/impl/CronetBidirectionalStream;->prepareResponseInfoOnNetworkThread(ILjava/lang/String;[Ljava/lang/String;J)Lorg/chromium/net/impl/UrlResponseInfoImpl;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-wide v1, p4

    move-object p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "httpStatusCode":I
    .local v1, "receivedByteCount":J
    .local p2, "httpStatusCode":I
    .local p3, "negotiatedProtocol":Ljava/lang/String;
    .local p4, "headers":[Ljava/lang/String;
    :try_start_1
    iput-object v0, p1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 536
    nop

    .line 537
    new-instance p5, Lorg/chromium/net/impl/CronetBidirectionalStream$2;

    invoke-direct {p5, p0}, Lorg/chromium/net/impl/CronetBidirectionalStream$2;-><init>(Lorg/chromium/net/impl/CronetBidirectionalStream;)V

    invoke-direct {p0, p5}, Lorg/chromium/net/impl/CronetBidirectionalStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 555
    return-void

    .line 533
    :catch_0
    move-exception v0

    move-object p5, v0

    goto :goto_0

    .end local v1    # "receivedByteCount":J
    .restart local p1    # "httpStatusCode":I
    .local p2, "negotiatedProtocol":Ljava/lang/String;
    .local p3, "headers":[Ljava/lang/String;
    .local p4, "receivedByteCount":J
    :catch_1
    move-exception v0

    move-wide v1, p4

    move-object p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    move-object p5, v0

    .line 534
    .end local p1    # "httpStatusCode":I
    .restart local v1    # "receivedByteCount":J
    .local p2, "httpStatusCode":I
    .local p3, "negotiatedProtocol":Ljava/lang/String;
    .local p4, "headers":[Ljava/lang/String;
    .local p5, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v0, Lorg/chromium/net/impl/CronetExceptionImpl;

    const-string v3, "Cannot prepare ResponseInfo"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4}, Lorg/chromium/net/impl/CronetExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 535
    return-void
.end method

.method private onResponseTrailersReceived([Ljava/lang/String;)V
    .locals 2
    .param p1, "trailers"    # [Ljava/lang/String;

    .line 610
    new-instance v0, Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;

    .line 611
    invoke-static {p1}, Lorg/chromium/net/impl/CronetBidirectionalStream;->headersListFromStrings([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;-><init>(Ljava/util/List;)V

    .line 612
    .local v0, "trailersBlock":Lorg/chromium/net/UrlResponseInfo$HeaderBlock;
    new-instance v1, Lorg/chromium/net/impl/CronetBidirectionalStream$3;

    invoke-direct {v1, p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream$3;-><init>(Lorg/chromium/net/impl/CronetBidirectionalStream;Lorg/chromium/net/UrlResponseInfo$HeaderBlock;)V

    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetBidirectionalStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 628
    return-void
.end method

.method private onStreamReady(Z)V
    .locals 1
    .param p1, "requestHeadersSent"    # Z

    .line 497
    new-instance v0, Lorg/chromium/net/impl/CronetBidirectionalStream$1;

    invoke-direct {v0, p0, p1}, Lorg/chromium/net/impl/CronetBidirectionalStream$1;-><init>(Lorg/chromium/net/impl/CronetBidirectionalStream;Z)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 520
    return-void
.end method

.method private onWritevCompleted([Ljava/nio/ByteBuffer;[I[IZ)V
    .locals 5
    .param p1, "byteBuffers"    # [Ljava/nio/ByteBuffer;
    .param p2, "initialPositions"    # [I
    .param p3, "initialLimits"    # [I
    .param p4, "endOfStream"    # Z

    .line 582
    array-length v0, p1

    array-length v1, p2

    if-ne v0, v1, :cond_7

    .line 583
    array-length v0, p1

    array-length v1, p3

    if-ne v0, v1, :cond_6

    .line 584
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 585
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    .line 586
    :cond_0
    const/16 v1, 0x8

    iput v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    .line 588
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 589
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->sendFlushDataLocked()V

    .line 591
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 592
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_5

    .line 593
    aget-object v1, p1, v0

    .line 594
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    aget v3, p2, v0

    if-ne v2, v3, :cond_4

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    aget v3, p3, v0

    if-eq v2, v3, :cond_2

    goto :goto_2

    .line 600
    :cond_2
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    .line 601
    new-instance v2, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;

    if-eqz p4, :cond_3

    array-length v3, p1

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    if-ne v0, v3, :cond_3

    goto :goto_1

    :cond_3
    const/4 v4, 0x0

    :goto_1
    invoke-direct {v2, p0, v1, v4}, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;-><init>(Lorg/chromium/net/impl/CronetBidirectionalStream;Ljava/nio/ByteBuffer;Z)V

    invoke-direct {p0, v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 592
    .end local v1    # "buffer":Ljava/nio/ByteBuffer;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 595
    .restart local v1    # "buffer":Ljava/nio/ByteBuffer;
    :cond_4
    :goto_2
    new-instance v2, Lorg/chromium/net/impl/CronetExceptionImpl;

    const-string v3, "ByteBuffer modified externally during write"

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lorg/chromium/net/impl/CronetExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 597
    return-void

    .line 605
    .end local v0    # "i":I
    .end local v1    # "buffer":Ljava/nio/ByteBuffer;
    :cond_5
    return-void

    .line 591
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 583
    :cond_6
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 582
    :cond_7
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private postTaskToExecutor(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "task"    # Ljava/lang/Runnable;

    .line 757
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 767
    goto :goto_0

    .line 758
    :catch_0
    move-exception v0

    .line 759
    .local v0, "failException":Ljava/util/concurrent/RejectedExecutionException;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception posting task to executor"

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 763
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v1

    .line 764
    const/4 v2, 0x6

    :try_start_1
    iput v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    iput v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    .line 765
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->destroyNativeStreamLocked(Z)V

    .line 766
    monitor-exit v1

    .line 768
    .end local v0    # "failException":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void

    .line 766
    .restart local v0    # "failException":Ljava/util/concurrent/RejectedExecutionException;
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private prepareResponseInfoOnNetworkThread(ILjava/lang/String;[Ljava/lang/String;J)Lorg/chromium/net/impl/UrlResponseInfoImpl;
    .locals 10
    .param p1, "httpStatusCode"    # I
    .param p2, "negotiatedProtocol"    # Ljava/lang/String;
    .param p3, "headers"    # [Ljava/lang/String;
    .param p4, "receivedByteCount"    # J

    .line 772
    new-instance v0, Lorg/chromium/net/impl/UrlResponseInfoImpl;

    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialUrl:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 773
    invoke-static {p3}, Lorg/chromium/net/impl/CronetBidirectionalStream;->headersListFromStrings([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v7, 0x0

    const-string v3, ""

    move v2, p1

    move-object v6, p2

    move-wide v8, p4

    .end local p1    # "httpStatusCode":I
    .end local p2    # "negotiatedProtocol":Ljava/lang/String;
    .end local p4    # "receivedByteCount":J
    .local v2, "httpStatusCode":I
    .local v6, "negotiatedProtocol":Ljava/lang/String;
    .local v8, "receivedByteCount":J
    invoke-direct/range {v0 .. v9}, Lorg/chromium/net/impl/UrlResponseInfoImpl;-><init>(Ljava/util/List;ILjava/lang/String;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;J)V

    .line 775
    .local v0, "responseInfo":Lorg/chromium/net/impl/UrlResponseInfoImpl;
    return-object v0
.end method

.method private sendFlushDataLocked()V
    .locals 10

    .line 396
    iget v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_5

    .line 397
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    .line 398
    .local v0, "size":I
    new-array v6, v0, [Ljava/nio/ByteBuffer;

    .line 399
    .local v6, "buffers":[Ljava/nio/ByteBuffer;
    new-array v7, v0, [I

    .line 400
    .local v7, "positions":[I
    new-array v8, v0, [I

    .line 401
    .local v8, "limits":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 402
    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    .line 403
    .local v3, "buffer":Ljava/nio/ByteBuffer;
    aput-object v3, v6, v2

    .line 404
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    aput v4, v7, v2

    .line 405
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    aput v4, v8, v2

    .line 401
    .end local v3    # "buffer":Ljava/nio/ByteBuffer;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 407
    .end local v2    # "i":I
    :cond_0
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 408
    array-length v2, v6

    const/4 v3, 0x1

    if-lt v2, v3, :cond_3

    .line 409
    const/16 v2, 0x9

    iput v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    .line 410
    iput-boolean v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeadersSent:Z

    .line 411
    invoke-static {}, Lorg/chromium/net/impl/CronetBidirectionalStreamJni;->get()Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;

    move-result-object v2

    move v5, v3

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    iget-boolean v9, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mEndOfStreamWritten:Z

    if-eqz v9, :cond_1

    iget-object v9, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    .line 413
    invoke-virtual {v9}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_1

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    :goto_1
    move v9, v5

    .line 411
    move-object v5, p0

    invoke-interface/range {v2 .. v9}, Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;->writevData(JLorg/chromium/net/impl/CronetBidirectionalStream;[Ljava/nio/ByteBuffer;[I[IZ)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 419
    return-void

    .line 416
    :cond_2
    iput v1, v5, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    .line 417
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unable to call native writev."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 408
    :cond_3
    move-object v5, p0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 407
    :cond_4
    move-object v5, p0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 396
    .end local v0    # "size":I
    .end local v6    # "buffers":[Ljava/nio/ByteBuffer;
    .end local v7    # "positions":[I
    .end local v8    # "limits":[I
    :cond_5
    move-object v5, p0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static stringsFromHeaderList(Ljava/util/List;)[Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 725
    .local p0, "headersList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    .line 726
    .local v0, "headersArray":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 727
    .local v1, "i":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 728
    .local v3, "requestHeader":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "i":I
    .local v4, "i":I
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v0, v1

    .line 729
    add-int/lit8 v1, v4, 0x1

    .end local v4    # "i":I
    .restart local v1    # "i":I
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v0, v4

    .line 730
    .end local v3    # "requestHeader":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0

    .line 731
    :cond_0
    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 449
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 450
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result v1

    if-nez v1, :cond_1

    iget v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    if-nez v1, :cond_0

    goto :goto_0

    .line 453
    :cond_0
    const/4 v1, 0x5

    iput v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    iput v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    .line 454
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetBidirectionalStream;->destroyNativeStreamLocked(Z)V

    .line 455
    monitor-exit v0

    .line 456
    return-void

    .line 451
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    .line 455
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public flush()V
    .locals 4

    .line 355
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 356
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result v1

    if-nez v1, :cond_7

    iget v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    const/16 v2, 0x8

    const/16 v3, 0x9

    if-eq v1, v2, :cond_0

    iget v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    if-eq v1, v3, :cond_0

    goto :goto_1

    .line 360
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 363
    iget-boolean v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeadersSent:Z

    if-nez v1, :cond_1

    .line 364
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeadersSent:Z

    .line 365
    invoke-static {}, Lorg/chromium/net/impl/CronetBidirectionalStreamJni;->get()Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;

    move-result-object v1

    iget-wide v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    invoke-interface {v1, v2, v3, p0}, Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;->sendRequestHeaders(JLorg/chromium/net/impl/CronetBidirectionalStream;)V

    .line 367
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialMethod:Ljava/lang/String;

    invoke-static {v1}, Lorg/chromium/net/impl/CronetBidirectionalStream;->doesMethodAllowWriteData(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 368
    const/16 v1, 0xa

    iput v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    .line 371
    :cond_1
    monitor-exit v0

    return-void

    .line 374
    :cond_2
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 377
    :cond_4
    :goto_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    .line 378
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 379
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 382
    :cond_5
    iget v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    if-ne v1, v3, :cond_6

    .line 385
    monitor-exit v0

    return-void

    .line 387
    :cond_6
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->sendFlushDataLocked()V

    .line 388
    monitor-exit v0

    .line 389
    return-void

    .line 358
    :cond_7
    :goto_1
    monitor-exit v0

    return-void

    .line 388
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getFlushDataForTesting()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    .line 438
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 439
    :try_start_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 440
    .local v1, "flushData":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mFlushData:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    .line 441
    .local v3, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 442
    nop

    .end local v3    # "buffer":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 443
    :cond_0
    monitor-exit v0

    return-object v1

    .line 444
    .end local v1    # "flushData":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPendingDataForTesting()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    .line 425
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 426
    :try_start_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 427
    .local v1, "pendingData":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    .line 428
    .local v3, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 429
    nop

    .end local v3    # "buffer":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 430
    :cond_0
    monitor-exit v0

    return-object v1

    .line 431
    .end local v1    # "pendingData":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isDone()Z
    .locals 2

    .line 460
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 461
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result v1

    monitor-exit v0

    return v1

    .line 462
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public read(Ljava/nio/ByteBuffer;)V
    .locals 10
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 309
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v1

    .line 310
    :try_start_0
    invoke-static {p1}, Lorg/chromium/net/impl/Preconditions;->checkHasRemaining(Ljava/nio/ByteBuffer;)V

    .line 311
    invoke-static {p1}, Lorg/chromium/net/impl/Preconditions;->checkDirect(Ljava/nio/ByteBuffer;)V

    .line 312
    iget v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_3

    .line 315
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    .line 316
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    .line 330
    :catchall_0
    move-exception v0

    move-object v6, p0

    move-object v7, p1

    goto :goto_0

    .line 318
    :cond_0
    :try_start_2
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v0, :cond_1

    .line 319
    :try_start_3
    new-instance v0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;-><init>(Lorg/chromium/net/impl/CronetBidirectionalStream;Lorg/chromium/net/impl/CronetBidirectionalStream-IA;)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 321
    :cond_1
    const/4 v0, 0x3

    :try_start_4
    iput v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    .line 322
    invoke-static {}, Lorg/chromium/net/impl/CronetBidirectionalStreamJni;->get()Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;

    move-result-object v3

    iget-wide v4, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    .line 323
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v8

    .line 324
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 322
    move-object v6, p0

    move-object v7, p1

    .end local p1    # "buffer":Ljava/nio/ByteBuffer;
    .local v7, "buffer":Ljava/nio/ByteBuffer;
    :try_start_5
    invoke-interface/range {v3 .. v9}, Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;->readData(JLorg/chromium/net/impl/CronetBidirectionalStream;Ljava/nio/ByteBuffer;II)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 330
    monitor-exit v1

    .line 331
    return-void

    .line 327
    :cond_2
    iput v2, v6, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I

    .line 328
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unable to call native read"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v7    # "buffer":Ljava/nio/ByteBuffer;
    throw p1

    .line 313
    .restart local p1    # "buffer":Ljava/nio/ByteBuffer;
    :cond_3
    move-object v6, p0

    move-object v7, p1

    .end local p1    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v7    # "buffer":Ljava/nio/ByteBuffer;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unexpected read attempt."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v7    # "buffer":Ljava/nio/ByteBuffer;
    throw p1

    .line 330
    .restart local p1    # "buffer":Ljava/nio/ByteBuffer;
    :catchall_1
    move-exception v0

    move-object v6, p0

    move-object v7, p1

    .end local p1    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v7    # "buffer":Ljava/nio/ByteBuffer;
    :goto_0
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_0
.end method

.method public setOnDestroyedCallbackForTesting(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "onDestroyedCallbackForTesting"    # Ljava/lang/Runnable;

    .line 709
    iput-object p1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    .line 710
    return-void
.end method

.method public start()V
    .locals 16

    .line 267
    move-object/from16 v1, p0

    iget-object v11, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v11

    .line 268
    :try_start_0
    iget v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_4

    .line 272
    const/4 v12, 0x0

    :try_start_1
    invoke-static {}, Lorg/chromium/net/impl/CronetBidirectionalStreamJni;->get()Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;

    move-result-object v0

    iget-object v2, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 274
    invoke-virtual {v2}, Lorg/chromium/net/impl/CronetUrlRequestContext;->getUrlRequestContextAdapter()J

    move-result-wide v2

    iget-boolean v4, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mDelayRequestHeadersUntilFirstFlush:Z

    const/4 v13, 0x1

    if-nez v4, :cond_0

    move v4, v13

    goto :goto_0

    :cond_0
    move v4, v12

    :goto_0
    iget-boolean v5, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mTrafficStatsTagSet:Z

    iget v6, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mTrafficStatsTag:I

    iget-boolean v7, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mTrafficStatsUidSet:Z

    iget v8, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mTrafficStatsUid:I

    iget-wide v9, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNetworkHandle:J

    .line 272
    invoke-interface/range {v0 .. v10}, Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;->createBidirectionalStream(Lorg/chromium/net/impl/CronetBidirectionalStream;JZZIZIJ)J

    move-result-wide v2

    iput-wide v2, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    .line 277
    iget-object v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->onRequestStarted()V

    .line 278
    new-instance v0, Lorg/chromium/net/impl/RefCountDelegate;

    iget-object v2, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 279
    invoke-static {v2}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lorg/chromium/net/impl/CronetBidirectionalStream$$ExternalSyntheticLambda0;

    invoke-direct {v3, v2}, Lorg/chromium/net/impl/CronetBidirectionalStream$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/net/impl/CronetUrlRequestContext;)V

    invoke-direct {v0, v3}, Lorg/chromium/net/impl/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    .line 282
    iget-object v0, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    invoke-virtual {v0}, Lorg/chromium/net/impl/RefCountDelegate;->increment()V

    .line 284
    invoke-static {}, Lorg/chromium/net/impl/CronetBidirectionalStreamJni;->get()Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;

    move-result-object v0

    iget-wide v2, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStream:J

    iget-object v4, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialUrl:Ljava/lang/String;

    iget v5, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialPriority:I

    iget-object v6, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialMethod:Ljava/lang/String;

    iget-object v7, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeaders:[Ljava/lang/String;

    iget-object v8, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialMethod:Ljava/lang/String;

    .line 286
    invoke-static {v8}, Lorg/chromium/net/impl/CronetBidirectionalStream;->doesMethodAllowWriteData(Ljava/lang/String;)Z

    move-result v8
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v8, :cond_1

    move v8, v13

    goto :goto_1

    :cond_1
    move v8, v12

    .line 284
    :goto_1
    move-wide v14, v2

    move-object v3, v1

    move-wide v1, v14

    :try_start_2
    invoke-interface/range {v0 .. v8}, Lorg/chromium/net/impl/CronetBidirectionalStream$Natives;->start(JLorg/chromium/net/impl/CronetBidirectionalStream;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;Z)I

    move-result v0
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v1, v3

    .line 287
    .local v0, "startResult":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 290
    if-gtz v0, :cond_2

    .line 295
    :try_start_3
    iput v13, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mWriteState:I

    iput v13, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mReadState:I
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 303
    .end local v0    # "startResult":I
    nop

    .line 304
    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 305
    return-void

    .line 291
    .restart local v0    # "startResult":I
    :cond_2
    add-int/lit8 v2, v0, -0x1

    .line 292
    .local v2, "headerPos":I
    :try_start_5
    new-instance v3, Ljava/lang/IllegalArgumentException;

    iget-object v4, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeaders:[Ljava/lang/String;

    aget-object v4, v4, v2

    iget-object v5, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mRequestHeaders:[Ljava/lang/String;

    add-int/lit8 v6, v2, 0x1

    aget-object v5, v5, v6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid header "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 288
    .end local v2    # "headerPos":I
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    iget-object v3, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInitialMethod:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid http method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 304
    .end local v0    # "startResult":I
    :catchall_0
    move-exception v0

    move-object v1, v3

    goto :goto_3

    .line 296
    :catch_0
    move-exception v0

    move-object v1, v3

    goto :goto_2

    :catch_1
    move-exception v0

    .line 299
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_2
    :try_start_6
    invoke-direct {v1, v12}, Lorg/chromium/net/impl/CronetBidirectionalStream;->destroyNativeStreamLocked(Z)V

    .line 300
    iget-object v2, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    invoke-virtual {v2}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 301
    iget-object v2, v1, Lorg/chromium/net/impl/CronetBidirectionalStream;->mInflightDoneCallbackCount:Lorg/chromium/net/impl/RefCountDelegate;

    invoke-virtual {v2}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 302
    throw v0

    .line 269
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Stream is already started."

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 304
    :catchall_1
    move-exception v0

    :goto_3
    monitor-exit v11
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v0
.end method

.method public write(Ljava/nio/ByteBuffer;Z)V
    .locals 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "endOfStream"    # Z

    .line 335
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mNativeStreamLock:Ljava/lang/Object;

    monitor-enter v0

    .line 336
    :try_start_0
    invoke-static {p1}, Lorg/chromium/net/impl/Preconditions;->checkDirect(Ljava/nio/ByteBuffer;)V

    .line 337
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    .line 338
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Empty buffer before end of stream."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "buffer":Ljava/nio/ByteBuffer;
    .end local p2    # "endOfStream":Z
    throw v1

    .line 340
    .restart local p1    # "buffer":Ljava/nio/ByteBuffer;
    .restart local p2    # "endOfStream":Z
    :cond_1
    :goto_0
    iget-boolean v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mEndOfStreamWritten:Z

    if-nez v1, :cond_4

    .line 343
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->isDoneLocked()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 344
    monitor-exit v0

    return-void

    .line 346
    :cond_2
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mPendingData:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 347
    if-eqz p2, :cond_3

    .line 348
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream;->mEndOfStreamWritten:Z

    .line 350
    :cond_3
    monitor-exit v0

    .line 351
    return-void

    .line 341
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Write after writing end of stream."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "buffer":Ljava/nio/ByteBuffer;
    .end local p2    # "endOfStream":Z
    throw v1

    .line 350
    .restart local p1    # "buffer":Ljava/nio/ByteBuffer;
    .restart local p2    # "endOfStream":Z
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
