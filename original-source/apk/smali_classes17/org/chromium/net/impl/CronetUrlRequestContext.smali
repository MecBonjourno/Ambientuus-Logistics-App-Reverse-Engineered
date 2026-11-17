.class public Lorg/chromium/net/impl/CronetUrlRequestContext;
.super Lorg/chromium/net/impl/CronetEngineBase;
.source "CronetUrlRequestContext.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "cronet"
.end annotation


# static fields
.field static final LOG_TAG:Ljava/lang/String;

.field private static final sInUseStoragePaths:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mActiveRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mCronetEngineId:I

.field private mDownstreamThroughputKbps:I

.field private mEffectiveConnectionType:I

.field private final mEnableTelemetry:Z

.field private final mFinishedListenerLock:Ljava/lang/Object;

.field private final mFinishedListenerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/chromium/net/RequestFinishedInfo$Listener;",
            "Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;",
            ">;"
        }
    .end annotation
.end field

.field private mHttpRttMs:I

.field private final mInUseStoragePath:Ljava/lang/String;

.field private final mInitCompleted:Landroid/os/ConditionVariable;

.field private mIsLogging:Z

.field private mIsStoppingNetLog:Z

.field private final mLock:Ljava/lang/Object;

.field private final mLogger:Lorg/chromium/net/impl/CronetLogger;

.field private mNetworkHandle:J

.field private final mNetworkQualityEstimatorEnabled:Z

.field private final mNetworkQualityLock:Ljava/lang/Object;

.field private mNetworkThread:Ljava/lang/Thread;

.field private final mRttListenerList:Lorg/chromium/base/ObserverList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/ObserverList<",
            "Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private final mRunningRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mStopNetLogCompleted:Landroid/os/ConditionVariable;

.field private final mThroughputListenerList:Lorg/chromium/base/ObserverList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/ObserverList<",
            "Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private mTransportRttMs:I

.field private mUrlRequestContextAdapter:J


# direct methods
.method static bridge synthetic -$$Nest$fgetmLock(Lorg/chromium/net/impl/CronetUrlRequestContext;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUrlRequestContextAdapter(Lorg/chromium/net/impl/CronetUrlRequestContext;)J
    .locals 2

    iget-wide v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    return-wide v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 59
    const-class v0, Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    .line 158
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/chromium/net/impl/CronetUrlRequestContext;->sInUseStoragePaths:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Lorg/chromium/net/impl/CronetEngineBuilderImpl;)V
    .locals 5
    .param p1, "builder"    # Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 199
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetEngineBase;-><init>()V

    .line 64
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    .line 65
    new-instance v0, Landroid/os/ConditionVariable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/os/ConditionVariable;-><init>(Z)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mInitCompleted:Landroid/os/ConditionVariable;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRunningRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 81
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mActiveRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 100
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    .line 107
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerLock:Ljava/lang/Object;

    .line 113
    iput v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mEffectiveConnectionType:I

    .line 120
    const/4 v0, -0x1

    iput v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mHttpRttMs:I

    .line 127
    iput v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mTransportRttMs:I

    .line 134
    iput v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mDownstreamThroughputKbps:I

    .line 137
    new-instance v0, Lorg/chromium/base/ObserverList;

    invoke-direct {v0}, Lorg/chromium/base/ObserverList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRttListenerList:Lorg/chromium/base/ObserverList;

    .line 142
    new-instance v0, Lorg/chromium/base/ObserverList;

    invoke-direct {v0}, Lorg/chromium/base/ObserverList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mThroughputListenerList:Lorg/chromium/base/ObserverList;

    .line 148
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerMap:Ljava/util/Map;

    .line 154
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mStopNetLogCompleted:Landroid/os/ConditionVariable;

    .line 176
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkHandle:J

    .line 200
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iput v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mCronetEngineId:I

    .line 201
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRttListenerList:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0}, Lorg/chromium/base/ObserverList;->disableThreadAsserts()V

    .line 202
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mThroughputListenerList:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0}, Lorg/chromium/base/ObserverList;->disableThreadAsserts()V

    .line 203
    invoke-virtual {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->networkQualityEstimatorEnabled()Z

    move-result v0

    iput-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    .line 204
    invoke-virtual {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/chromium/net/impl/CronetLibraryLoader;->ensureInitialized(Landroid/content/Context;Lorg/chromium/net/impl/CronetEngineBuilderImpl;)V

    .line 205
    invoke-virtual {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->httpCacheMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 206
    invoke-virtual {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->storagePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mInUseStoragePath:Ljava/lang/String;

    .line 207
    sget-object v0, Lorg/chromium/net/impl/CronetUrlRequestContext;->sInUseStoragePaths:Ljava/util/HashSet;

    monitor-enter v0

    .line 208
    :try_start_0
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->sInUseStoragePaths:Ljava/util/HashSet;

    iget-object v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mInUseStoragePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 211
    monitor-exit v0

    goto :goto_0

    .line 209
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Disk cache storage path already in use"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "builder":Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    throw v1

    .line 211
    .restart local p1    # "builder":Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 213
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mInUseStoragePath:Ljava/lang/String;

    .line 215
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 216
    nop

    .line 217
    :try_start_1
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v1

    .line 218
    invoke-static {p1}, Lorg/chromium/net/impl/CronetUrlRequestContext;->createNativeUrlRequestContextConfig(Lorg/chromium/net/impl/CronetEngineBuilderImpl;)J

    move-result-wide v2

    .line 217
    invoke-interface {v1, v2, v3}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->createRequestContextAdapter(J)J

    move-result-wide v1

    iput-wide v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    .line 219
    iget-wide v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_3

    .line 222
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v1

    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    invoke-interface {v1, v2, v3, p0}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->getEnableTelemetry(JLorg/chromium/net/impl/CronetUrlRequestContext;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mEnableTelemetry:Z

    .line 224
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 226
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mEnableTelemetry:Z

    if-eqz v0, :cond_2

    .line 227
    invoke-virtual {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContext;->getCronetSource()Lorg/chromium/net/impl/CronetLogger$CronetSource;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetLoggerFactory;->createLogger(Landroid/content/Context;Lorg/chromium/net/impl/CronetLogger$CronetSource;)Lorg/chromium/net/impl/CronetLogger;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLogger:Lorg/chromium/net/impl/CronetLogger;

    goto :goto_1

    .line 229
    :cond_2
    invoke-static {}, Lorg/chromium/net/impl/CronetLoggerFactory;->createNoOpLogger()Lorg/chromium/net/impl/CronetLogger;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLogger:Lorg/chromium/net/impl/CronetLogger;

    .line 232
    :goto_1
    :try_start_2
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLogger:Lorg/chromium/net/impl/CronetLogger;

    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->getCronetEngineId()I

    move-result v1

    new-instance v2, Lorg/chromium/net/impl/CronetLogger$CronetEngineBuilderInfo;

    invoke-direct {v2, p1}, Lorg/chromium/net/impl/CronetLogger$CronetEngineBuilderInfo;-><init>(Lorg/chromium/net/impl/CronetEngineBuilderImpl;)V

    .line 233
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->buildCronetVersion()Lorg/chromium/net/impl/CronetLogger$CronetVersion;

    move-result-object v3

    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContext;->getCronetSource()Lorg/chromium/net/impl/CronetLogger$CronetSource;

    move-result-object v4

    .line 232
    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/chromium/net/impl/CronetLogger;->logCronetEngineCreation(ILorg/chromium/net/impl/CronetLogger$CronetEngineBuilderInfo;Lorg/chromium/net/impl/CronetLogger$CronetVersion;Lorg/chromium/net/impl/CronetLogger$CronetSource;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 237
    goto :goto_2

    .line 234
    :catch_0
    move-exception v0

    .line 236
    .local v0, "e":Ljava/lang/RuntimeException;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Error while trying to log CronetEngine creation: "

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 240
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_2
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequestContext$1;

    invoke-direct {v0, p0}, Lorg/chromium/net/impl/CronetUrlRequestContext$1;-><init>(Lorg/chromium/net/impl/CronetUrlRequestContext;)V

    invoke-static {v0}, Lorg/chromium/net/impl/CronetLibraryLoader;->postToInitThread(Ljava/lang/Runnable;)V

    .line 253
    return-void

    .line 220
    :cond_3
    :try_start_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Context Adapter creation failed."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .end local p1    # "builder":Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    throw v1

    .line 224
    .restart local p1    # "builder":Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1
.end method

.method private buildCronetVersion()Lorg/chromium/net/impl/CronetLogger$CronetVersion;
    .locals 3

    .line 377
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->getVersionString()Ljava/lang/String;

    move-result-object v0

    .line 380
    .local v0, "version":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v0, v1, v2

    .line 381
    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v0, v1, v2

    .line 382
    new-instance v1, Lorg/chromium/net/impl/CronetLogger$CronetVersion;

    invoke-direct {v1, v0}, Lorg/chromium/net/impl/CronetLogger$CronetVersion;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private checkHaveAdapter()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 704
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->haveRequestContextAdapter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 707
    return-void

    .line 705
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Engine is shut down."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static convertConnectionTypeToApiValue(I)I
    .locals 3
    .param p0, "type"    # I

    .line 715
    packed-switch p0, :pswitch_data_0

    .line 729
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Internal Error: Illegal EffectiveConnectionType value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 725
    :pswitch_0
    const/4 v0, 0x5

    return v0

    .line 723
    :pswitch_1
    const/4 v0, 0x4

    return v0

    .line 721
    :pswitch_2
    const/4 v0, 0x3

    return v0

    .line 719
    :pswitch_3
    const/4 v0, 0x2

    return v0

    .line 717
    :pswitch_4
    const/4 v0, 0x1

    return v0

    .line 727
    :pswitch_5
    const/4 v0, 0x0

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static createNativeUrlRequestContextConfig(Lorg/chromium/net/impl/CronetEngineBuilderImpl;)J
    .locals 10
    .param p0, "builder"    # Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 268
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v0

    .line 269
    invoke-static {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->createRequestContextConfigOptions(Lorg/chromium/net/impl/CronetEngineBuilderImpl;)Lorg/chromium/net/RequestContextConfigOptions;

    move-result-object v1

    invoke-virtual {v1}, Lorg/chromium/net/RequestContextConfigOptions;->toByteArray()[B

    move-result-object v1

    .line 268
    invoke-interface {v0, v1}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->createRequestContextConfig([B)J

    move-result-wide v3

    .line 270
    .local v3, "urlRequestContextConfig":J
    const-wide/16 v0, 0x0

    cmp-long v0, v3, v0

    if-eqz v0, :cond_2

    .line 273
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->quicHints()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;

    .line 274
    .local v1, "quicHint":Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-object v5, v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;->mHost:Ljava/lang/String;

    iget v6, v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;->mPort:I

    iget v7, v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;->mAlternatePort:I

    invoke-interface/range {v2 .. v7}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->addQuicHint(JLjava/lang/String;II)V

    .line 276
    .end local v1    # "quicHint":Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;
    goto :goto_0

    .line 277
    :cond_0
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->publicKeyPins()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;

    .line 278
    .local v1, "pkp":Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-object v5, v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;->mHost:Ljava/lang/String;

    iget-object v6, v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;->mHashes:[[B

    iget-boolean v7, v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;->mIncludeSubdomains:Z

    iget-object v8, v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;->mExpirationDate:Ljava/util/Date;

    .line 279
    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    .line 278
    invoke-interface/range {v2 .. v9}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->addPkp(JLjava/lang/String;[[BZJ)V

    .line 280
    .end local v1    # "pkp":Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;
    goto :goto_1

    .line 281
    :cond_1
    return-wide v3

    .line 271
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Experimental options parsing failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static createRequestContextConfigOptions(Lorg/chromium/net/impl/CronetEngineBuilderImpl;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 3
    .param p0, "engineBuilder"    # Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 287
    invoke-static {}, Lorg/chromium/net/RequestContextConfigOptions;->newBuilder()Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 288
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->quicEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setQuicEnabled(Z)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 289
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->http2Enabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setHttp2Enabled(Z)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 290
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->brotliEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setBrotliEnabled(Z)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 291
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->cacheDisabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setDisableCache(Z)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 292
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->httpCacheMode()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setHttpCacheMode(I)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 293
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->httpCacheMaxSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setHttpCacheMaxSize(J)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 294
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mockCertVerifier()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setMockCertVerifier(J)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 296
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->networkQualityEstimatorEnabled()Z

    move-result v1

    .line 295
    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setEnableNetworkQualityEstimator(Z)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 298
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->publicKeyPinningBypassForLocalTrustAnchorsEnabled()Z

    move-result v1

    .line 297
    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setBypassPublicKeyPinningForLocalTrustAnchors(Z)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 300
    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->threadPriority(I)I

    move-result v1

    .line 299
    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setNetworkThreadPriority(I)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    move-result-object v0

    .line 302
    .local v0, "resultBuilder":Lorg/chromium/net/RequestContextConfigOptions$Builder;
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->getUserAgent()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 303
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->getUserAgent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setUserAgent(Ljava/lang/String;)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    .line 306
    :cond_0
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->storagePath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 307
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->storagePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setStoragePath(Ljava/lang/String;)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    .line 310
    :cond_1
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->getDefaultQuicUserAgentId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 311
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->getDefaultQuicUserAgentId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setQuicDefaultUserAgentId(Ljava/lang/String;)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    .line 314
    :cond_2
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->experimentalOptions()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 315
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->experimentalOptions()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->setExperimentalOptions(Ljava/lang/String;)Lorg/chromium/net/RequestContextConfigOptions$Builder;

    .line 318
    :cond_3
    invoke-virtual {v0}, Lorg/chromium/net/RequestContextConfigOptions$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v1
.end method

.method static getCronetSource()Lorg/chromium/net/impl/CronetLogger$CronetSource;
    .locals 3

    .line 256
    const-class v0, Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 257
    .local v0, "implClassLoader":Ljava/lang/ClassLoader;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "java.lang.BootClassLoader"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 258
    sget-object v1, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_PLATFORM:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    return-object v1

    .line 260
    :cond_0
    const-class v1, Lorg/chromium/net/CronetEngine;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 261
    .local v1, "apiClassLoader":Ljava/lang/ClassLoader;
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v2, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_STATICALLY_LINKED:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    goto :goto_0

    .line 262
    :cond_1
    sget-object v2, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_PLAY_SERVICES:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 261
    :goto_0
    return-object v2
.end method

.method private haveRequestContextAdapter()Z
    .locals 4

    .line 711
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private initNetworkThread()V
    .locals 2

    .line 737
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkThread:Ljava/lang/Thread;

    .line 738
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mInitCompleted:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 739
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    const-string v1, "ChromiumNet"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 740
    return-void
.end method

.method static synthetic lambda$postObservationTaskToExecutor$0(Ljava/lang/Runnable;Lorg/chromium/net/impl/RefCountDelegate;)V
    .locals 3
    .param p0, "task"    # Ljava/lang/Runnable;
    .param p1, "inflightCallbackCount"    # Lorg/chromium/net/impl/RefCountDelegate;

    .line 823
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 827
    if-eqz p1, :cond_0

    :goto_0
    invoke-virtual {p1}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    .line 824
    :catch_0
    move-exception v0

    .line 825
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception thrown from observation task"

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 827
    .end local v0    # "e":Ljava/lang/Exception;
    if-eqz p1, :cond_0

    goto :goto_0

    .line 829
    :cond_0
    :goto_1
    return-void

    .line 827
    :goto_2
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 828
    :cond_1
    throw v0
.end method

.method private onEffectiveConnectionTypeChanged(I)V
    .locals 2
    .param p1, "effectiveConnectionType"    # I

    .line 745
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 748
    :try_start_0
    iput p1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mEffectiveConnectionType:I

    .line 749
    monitor-exit v0

    .line 750
    return-void

    .line 749
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private onRTTOrThroughputEstimatesComputed(III)V
    .locals 2
    .param p1, "httpRttMs"    # I
    .param p2, "transportRttMs"    # I
    .param p3, "downstreamThroughputKbps"    # I

    .line 756
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 757
    :try_start_0
    iput p1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mHttpRttMs:I

    .line 758
    iput p2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mTransportRttMs:I

    .line 759
    iput p3, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mDownstreamThroughputKbps:I

    .line 760
    monitor-exit v0

    .line 761
    return-void

    .line 760
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private onRttObservation(IJI)V
    .locals 10
    .param p1, "rttMs"    # I
    .param p2, "whenMs"    # J
    .param p4, "source"    # I

    .line 766
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v1

    .line 768
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRttListenerList:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;

    move-object v5, v2

    .line 769
    .local v5, "listener":Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;
    new-instance v3, Lorg/chromium/net/impl/CronetUrlRequestContext$2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v4, p0

    move v6, p1

    move-wide v7, p2

    move v9, p4

    .end local p1    # "rttMs":I
    .end local p2    # "whenMs":J
    .end local p4    # "source":I
    .local v6, "rttMs":I
    .local v7, "whenMs":J
    .local v9, "source":I
    :try_start_1
    invoke-direct/range {v3 .. v9}, Lorg/chromium/net/impl/CronetUrlRequestContext$2;-><init>(Lorg/chromium/net/impl/CronetUrlRequestContext;Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;IJI)V

    .line 775
    .local v3, "task":Ljava/lang/Runnable;
    invoke-virtual {v5}, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object p1

    invoke-static {p1, v3}, Lorg/chromium/net/impl/CronetUrlRequestContext;->postObservationTaskToExecutor(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    .line 776
    .end local v3    # "task":Ljava/lang/Runnable;
    .end local v5    # "listener":Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;
    move p1, v6

    move-wide p2, v7

    move p4, v9

    goto :goto_0

    .line 777
    .end local v6    # "rttMs":I
    .end local v7    # "whenMs":J
    .end local v9    # "source":I
    .restart local p1    # "rttMs":I
    .restart local p2    # "whenMs":J
    .restart local p4    # "source":I
    :cond_0
    move v6, p1

    move-wide v7, p2

    move v9, p4

    .end local p1    # "rttMs":I
    .end local p2    # "whenMs":J
    .end local p4    # "source":I
    .restart local v6    # "rttMs":I
    .restart local v7    # "whenMs":J
    .restart local v9    # "source":I
    monitor-exit v1

    .line 778
    return-void

    .line 777
    .end local v6    # "rttMs":I
    .end local v7    # "whenMs":J
    .end local v9    # "source":I
    .restart local p1    # "rttMs":I
    .restart local p2    # "whenMs":J
    .restart local p4    # "source":I
    :catchall_0
    move-exception v0

    move v6, p1

    move-wide v7, p2

    move v9, p4

    move-object p1, v0

    .end local p1    # "rttMs":I
    .end local p2    # "whenMs":J
    .end local p4    # "source":I
    .restart local v6    # "rttMs":I
    .restart local v7    # "whenMs":J
    .restart local v9    # "source":I
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :catchall_1
    move-exception v0

    move-object p1, v0

    goto :goto_1
.end method

.method private onThroughputObservation(IJI)V
    .locals 10
    .param p1, "throughputKbps"    # I
    .param p2, "whenMs"    # J
    .param p4, "source"    # I

    .line 784
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v1

    .line 786
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mThroughputListenerList:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;

    move-object v5, v2

    .line 787
    .local v5, "listener":Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;
    new-instance v3, Lorg/chromium/net/impl/CronetUrlRequestContext$3;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v4, p0

    move v6, p1

    move-wide v7, p2

    move v9, p4

    .end local p1    # "throughputKbps":I
    .end local p2    # "whenMs":J
    .end local p4    # "source":I
    .local v6, "throughputKbps":I
    .local v7, "whenMs":J
    .local v9, "source":I
    :try_start_1
    invoke-direct/range {v3 .. v9}, Lorg/chromium/net/impl/CronetUrlRequestContext$3;-><init>(Lorg/chromium/net/impl/CronetUrlRequestContext;Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;IJI)V

    .line 793
    .local v3, "task":Ljava/lang/Runnable;
    invoke-virtual {v5}, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object p1

    invoke-static {p1, v3}, Lorg/chromium/net/impl/CronetUrlRequestContext;->postObservationTaskToExecutor(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    .line 794
    .end local v3    # "task":Ljava/lang/Runnable;
    .end local v5    # "listener":Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;
    move p1, v6

    move-wide p2, v7

    move p4, v9

    goto :goto_0

    .line 795
    .end local v6    # "throughputKbps":I
    .end local v7    # "whenMs":J
    .end local v9    # "source":I
    .restart local p1    # "throughputKbps":I
    .restart local p2    # "whenMs":J
    .restart local p4    # "source":I
    :cond_0
    move v6, p1

    move-wide v7, p2

    move v9, p4

    .end local p1    # "throughputKbps":I
    .end local p2    # "whenMs":J
    .end local p4    # "source":I
    .restart local v6    # "throughputKbps":I
    .restart local v7    # "whenMs":J
    .restart local v9    # "source":I
    monitor-exit v1

    .line 796
    return-void

    .line 795
    .end local v6    # "throughputKbps":I
    .end local v7    # "whenMs":J
    .end local v9    # "source":I
    .restart local p1    # "throughputKbps":I
    .restart local p2    # "whenMs":J
    .restart local p4    # "source":I
    :catchall_0
    move-exception v0

    move v6, p1

    move-wide v7, p2

    move v9, p4

    move-object p1, v0

    .end local p1    # "throughputKbps":I
    .end local p2    # "whenMs":J
    .end local p4    # "source":I
    .restart local v6    # "throughputKbps":I
    .restart local v7    # "whenMs":J
    .restart local v9    # "source":I
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :catchall_1
    move-exception v0

    move-object p1, v0

    goto :goto_1
.end method

.method private static postObservationTaskToExecutor(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "executor"    # Ljava/util/concurrent/Executor;
    .param p1, "task"    # Ljava/lang/Runnable;

    .line 838
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->postObservationTaskToExecutor(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;Lorg/chromium/net/impl/RefCountDelegate;)V

    .line 839
    return-void
.end method

.method private static postObservationTaskToExecutor(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;Lorg/chromium/net/impl/RefCountDelegate;)V
    .locals 3
    .param p0, "executor"    # Ljava/util/concurrent/Executor;
    .param p1, "task"    # Ljava/lang/Runnable;
    .param p2, "inflightCallbackCount"    # Lorg/chromium/net/impl/RefCountDelegate;

    .line 819
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lorg/chromium/net/impl/RefCountDelegate;->increment()V

    .line 821
    :cond_0
    :try_start_0
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequestContext$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1, p2}, Lorg/chromium/net/impl/CronetUrlRequestContext$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;Lorg/chromium/net/impl/RefCountDelegate;)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 834
    goto :goto_0

    .line 830
    :catch_0
    move-exception v0

    .line 831
    .local v0, "failException":Ljava/util/concurrent/RejectedExecutionException;
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 832
    :cond_1
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception posting task to executor"

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 835
    .end local v0    # "failException":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void
.end method


# virtual methods
.method public addRequestFinishedListener(Lorg/chromium/net/RequestFinishedInfo$Listener;)V
    .locals 3
    .param p1, "listener"    # Lorg/chromium/net/RequestFinishedInfo$Listener;

    .line 627
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 628
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerMap:Ljava/util/Map;

    new-instance v2, Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;

    invoke-direct {v2, p1}, Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;-><init>(Lorg/chromium/net/RequestFinishedInfo$Listener;)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 630
    monitor-exit v0

    .line 631
    return-void

    .line 630
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public addRttListener(Lorg/chromium/net/NetworkQualityRttListener;)V
    .locals 6
    .param p1, "listener"    # Lorg/chromium/net/NetworkQualityRttListener;

    .line 552
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_1

    .line 555
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 556
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRttListenerList:Lorg/chromium/base/ObserverList;

    invoke-virtual {v1}, Lorg/chromium/base/ObserverList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 557
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 558
    :try_start_1
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 559
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    const/4 v5, 0x1

    invoke-interface {v2, v3, v4, p0, v5}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->provideRTTObservations(JLorg/chromium/net/impl/CronetUrlRequestContext;Z)V

    .line 561
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p1    # "listener":Lorg/chromium/net/NetworkQualityRttListener;
    :try_start_2
    throw v2

    .line 563
    .restart local p1    # "listener":Lorg/chromium/net/NetworkQualityRttListener;
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRttListenerList:Lorg/chromium/base/ObserverList;

    new-instance v2, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;

    invoke-direct {v2, p1}, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;-><init>(Lorg/chromium/net/NetworkQualityRttListener;)V

    invoke-virtual {v1, v2}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 565
    monitor-exit v0

    .line 566
    return-void

    .line 565
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 553
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network quality estimator must be enabled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addThroughputListener(Lorg/chromium/net/NetworkQualityThroughputListener;)V
    .locals 6
    .param p1, "listener"    # Lorg/chromium/net/NetworkQualityThroughputListener;

    .line 589
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_1

    .line 592
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 593
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mThroughputListenerList:Lorg/chromium/base/ObserverList;

    invoke-virtual {v1}, Lorg/chromium/base/ObserverList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 594
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 595
    :try_start_1
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 596
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    const/4 v5, 0x1

    invoke-interface {v2, v3, v4, p0, v5}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->provideThroughputObservations(JLorg/chromium/net/impl/CronetUrlRequestContext;Z)V

    .line 598
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p1    # "listener":Lorg/chromium/net/NetworkQualityThroughputListener;
    :try_start_2
    throw v2

    .line 600
    .restart local p1    # "listener":Lorg/chromium/net/NetworkQualityThroughputListener;
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mThroughputListenerList:Lorg/chromium/base/ObserverList;

    new-instance v2, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;

    invoke-direct {v2, p1}, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;-><init>(Lorg/chromium/net/NetworkQualityThroughputListener;)V

    invoke-virtual {v1, v2}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 602
    monitor-exit v0

    .line 603
    return-void

    .line 602
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 590
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network quality estimator must be enabled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bindToNetwork(J)V
    .locals 0
    .param p1, "networkHandle"    # J

    .line 528
    nop

    .line 532
    iput-wide p1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkHandle:J

    .line 533
    return-void
.end method

.method public configureNetworkQualityEstimatorForTesting(ZZZ)V
    .locals 9
    .param p1, "useLocalHostRequests"    # Z
    .param p2, "useSmallerResponses"    # Z
    .param p3, "disableOfflineCheck"    # Z

    .line 539
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_0

    .line 542
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 543
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 544
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v5, p0

    move v6, p1

    move v7, p2

    move v8, p3

    .end local p1    # "useLocalHostRequests":Z
    .end local p2    # "useSmallerResponses":Z
    .end local p3    # "disableOfflineCheck":Z
    .local v6, "useLocalHostRequests":Z
    .local v7, "useSmallerResponses":Z
    .local v8, "disableOfflineCheck":Z
    :try_start_1
    invoke-interface/range {v2 .. v8}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->configureNetworkQualityEstimatorForTesting(JLorg/chromium/net/impl/CronetUrlRequestContext;ZZZ)V

    .line 547
    monitor-exit v1

    .line 548
    return-void

    .line 547
    .end local v6    # "useLocalHostRequests":Z
    .end local v7    # "useSmallerResponses":Z
    .end local v8    # "disableOfflineCheck":Z
    .restart local p1    # "useLocalHostRequests":Z
    .restart local p2    # "useSmallerResponses":Z
    .restart local p3    # "disableOfflineCheck":Z
    :catchall_0
    move-exception v0

    move v6, p1

    move v7, p2

    move v8, p3

    move-object p1, v0

    .end local p1    # "useLocalHostRequests":Z
    .end local p2    # "useSmallerResponses":Z
    .end local p3    # "disableOfflineCheck":Z
    .restart local v6    # "useLocalHostRequests":Z
    .restart local v7    # "useSmallerResponses":Z
    .restart local v8    # "disableOfflineCheck":Z
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :catchall_1
    move-exception v0

    move-object p1, v0

    goto :goto_0

    .line 540
    .end local v6    # "useLocalHostRequests":Z
    .end local v7    # "useSmallerResponses":Z
    .end local v8    # "disableOfflineCheck":Z
    .restart local p1    # "useLocalHostRequests":Z
    .restart local p2    # "useSmallerResponses":Z
    .restart local p3    # "disableOfflineCheck":Z
    :cond_0
    move v6, p1

    move v7, p2

    .end local p1    # "useLocalHostRequests":Z
    .end local p2    # "useSmallerResponses":Z
    .restart local v6    # "useLocalHostRequests":Z
    .restart local v7    # "useSmallerResponses":Z
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Network quality estimator must be enabled"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected createBidirectionalStream(Ljava/lang/String;Lorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;Ljava/lang/String;Ljava/util/List;IZLjava/util/Collection;ZIZIJ)Lorg/chromium/net/ExperimentalBidirectionalStream;
    .locals 17
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/chromium/net/BidirectionalStream$Callback;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "httpMethod"    # Ljava/lang/String;
    .param p6, "priority"    # I
    .param p7, "delayRequestHeadersUntilFirstFlush"    # Z
    .param p9, "trafficStatsTagSet"    # Z
    .param p10, "trafficStatsTag"    # I
    .param p11, "trafficStatsUidSet"    # Z
    .param p12, "trafficStatsUid"    # I
    .param p13, "networkHandle"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/chromium/net/BidirectionalStream$Callback;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;IZ",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;ZIZIJ)",
            "Lorg/chromium/net/ExperimentalBidirectionalStream;"
        }
    .end annotation

    .line 354
    .local p5, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p8, "requestAnnotations":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    move-object/from16 v1, p0

    const-wide/16 v2, -0x1

    cmp-long v0, p13, v2

    if-nez v0, :cond_0

    .line 355
    iget-wide v2, v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkHandle:J

    move-wide v14, v2

    .end local p13    # "networkHandle":J
    .local v2, "networkHandle":J
    goto :goto_0

    .line 354
    .end local v2    # "networkHandle":J
    .restart local p13    # "networkHandle":J
    :cond_0
    move-wide/from16 v14, p13

    .line 357
    .end local p13    # "networkHandle":J
    .local v14, "networkHandle":J
    :goto_0
    iget-object v2, v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 358
    :try_start_0
    invoke-direct {v1}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 359
    new-instance v0, Lorg/chromium/net/impl/CronetBidirectionalStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move/from16 v3, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move/from16 v13, p12

    move-object/from16 v16, v2

    move-object/from16 v2, p1

    :try_start_1
    invoke-direct/range {v0 .. v15}, Lorg/chromium/net/impl/CronetBidirectionalStream;-><init>(Lorg/chromium/net/impl/CronetUrlRequestContext;Ljava/lang/String;ILorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;Ljava/lang/String;Ljava/util/List;ZLjava/util/Collection;ZIZIJ)V

    monitor-exit v16

    return-object v0

    .line 363
    :catchall_0
    move-exception v0

    move-object/from16 v16, v2

    :goto_1
    monitor-exit v16
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_1
.end method

.method public createRequest(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;ILjava/util/Collection;ZZZZIZILorg/chromium/net/RequestFinishedInfo$Listener;IJ)Lorg/chromium/net/impl/UrlRequestBase;
    .locals 19
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/chromium/net/UrlRequest$Callback;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "priority"    # I
    .param p6, "disableCache"    # Z
    .param p7, "disableConnectionMigration"    # Z
    .param p8, "allowDirectExecutor"    # Z
    .param p9, "trafficStatsTagSet"    # Z
    .param p10, "trafficStatsTag"    # I
    .param p11, "trafficStatsUidSet"    # Z
    .param p12, "trafficStatsUid"    # I
    .param p13, "requestFinishedListener"    # Lorg/chromium/net/RequestFinishedInfo$Listener;
    .param p14, "idempotency"    # I
    .param p15, "networkHandle"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/chromium/net/UrlRequest$Callback;",
            "Ljava/util/concurrent/Executor;",
            "I",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;ZZZZIZI",
            "Lorg/chromium/net/RequestFinishedInfo$Listener;",
            "IJ)",
            "Lorg/chromium/net/impl/UrlRequestBase;"
        }
    .end annotation

    .line 335
    .local p5, "requestAnnotations":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    move-object/from16 v1, p0

    const-wide/16 v2, -0x1

    cmp-long v0, p15, v2

    if-nez v0, :cond_0

    .line 336
    iget-wide v2, v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkHandle:J

    move-wide/from16 v16, v2

    .end local p15    # "networkHandle":J
    .local v2, "networkHandle":J
    goto :goto_0

    .line 335
    .end local v2    # "networkHandle":J
    .restart local p15    # "networkHandle":J
    :cond_0
    move-wide/from16 v16, p15

    .line 338
    .end local p15    # "networkHandle":J
    .local v16, "networkHandle":J
    :goto_0
    iget-object v2, v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 339
    :try_start_0
    invoke-direct {v1}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 340
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v3, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move/from16 v13, p12

    move-object/from16 v14, p13

    move/from16 v15, p14

    move-object/from16 v18, v2

    move-object/from16 v2, p1

    :try_start_1
    invoke-direct/range {v0 .. v17}, Lorg/chromium/net/impl/CronetUrlRequest;-><init>(Lorg/chromium/net/impl/CronetUrlRequestContext;Ljava/lang/String;ILorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;Ljava/util/Collection;ZZZZIZILorg/chromium/net/RequestFinishedInfo$Listener;IJ)V

    monitor-exit v18

    return-object v0

    .line 344
    :catchall_0
    move-exception v0

    move-object/from16 v18, v2

    :goto_1
    monitor-exit v18
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_1
.end method

.method public createURLStreamHandlerFactory()Ljava/net/URLStreamHandlerFactory;
    .locals 1

    .line 665
    new-instance v0, Lorg/chromium/net/urlconnection/CronetURLStreamHandlerFactory;

    invoke-direct {v0, p0}, Lorg/chromium/net/urlconnection/CronetURLStreamHandlerFactory;-><init>(Lorg/chromium/net/ExperimentalCronetEngine;)V

    return-object v0
.end method

.method public getActiveRequestCount()I
    .locals 1

    .line 373
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mActiveRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method getCronetEngineId()I
    .locals 1

    .line 187
    iget v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mCronetEngineId:I

    return v0
.end method

.method getCronetLogger()Lorg/chromium/net/impl/CronetLogger;
    .locals 1

    .line 191
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLogger:Lorg/chromium/net/impl/CronetLogger;

    return-object v0
.end method

.method public getDownstreamThroughputKbps()I
    .locals 3

    .line 516
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_1

    .line 519
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 520
    :try_start_0
    iget v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mDownstreamThroughputKbps:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 521
    iget v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mDownstreamThroughputKbps:I

    goto :goto_0

    .line 522
    :cond_0
    nop

    :goto_0
    monitor-exit v0

    .line 520
    return v2

    .line 523
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 517
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network quality estimator must be enabled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getEffectiveConnectionType()I
    .locals 2

    .line 482
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_0

    .line 485
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 486
    :try_start_0
    iget v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mEffectiveConnectionType:I

    invoke-static {v1}, Lorg/chromium/net/impl/CronetUrlRequestContext;->convertConnectionTypeToApiValue(I)I

    move-result v1

    monitor-exit v0

    return v1

    .line 487
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 483
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network quality estimator must be enabled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getEnableTelemetryForTesting()Z
    .locals 1

    .line 195
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mEnableTelemetry:Z

    return v0
.end method

.method public getGlobalMetricsDeltas()[B
    .locals 1

    .line 477
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->getHistogramDeltas()[B

    move-result-object v0

    return-object v0
.end method

.method public getHttpRttMs()I
    .locals 3

    .line 492
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_1

    .line 495
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 496
    :try_start_0
    iget v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mHttpRttMs:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 497
    iget v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mHttpRttMs:I

    goto :goto_0

    .line 498
    :cond_0
    nop

    :goto_0
    monitor-exit v0

    .line 496
    return v2

    .line 499
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 493
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network quality estimator must be enabled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTransportRttMs()I
    .locals 3

    .line 504
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_1

    .line 507
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 508
    :try_start_0
    iget v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mTransportRttMs:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 509
    iget v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mTransportRttMs:I

    goto :goto_0

    .line 510
    :cond_0
    nop

    :goto_0
    monitor-exit v0

    .line 508
    return v2

    .line 511
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 505
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network quality estimator must be enabled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUrlRequestContextAdapter()J
    .locals 3

    .line 696
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 697
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 698
    iget-wide v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    monitor-exit v0

    return-wide v1

    .line 699
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getVersionString()Ljava/lang/String;
    .locals 3

    .line 368
    invoke-static {}, Lorg/chromium/net/impl/ImplVersion;->getCronetVersionWithLastChange()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cronet/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method hasRequestFinishedListener()Z
    .locals 2

    .line 641
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 642
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    .line 643
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isNetworkThread(Ljava/lang/Thread;)Z
    .locals 1
    .param p1, "thread"    # Ljava/lang/Thread;

    .line 842
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkThread:Ljava/lang/Thread;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public bridge synthetic newBidirectionalStreamBuilder(Ljava/lang/String;Lorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 55
    invoke-virtual {p0, p1, p2, p3}, Lorg/chromium/net/impl/CronetUrlRequestContext;->newBidirectionalStreamBuilder(Ljava/lang/String;Lorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;

    move-result-object p1

    return-object p1
.end method

.method public newBidirectionalStreamBuilder(Ljava/lang/String;Lorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/chromium/net/BidirectionalStream$Callback;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;

    .line 324
    new-instance v0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    invoke-direct {v0, p1, p2, p3, p0}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;-><init>(Ljava/lang/String;Lorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;Lorg/chromium/net/impl/CronetEngineBase;)V

    return-object v0
.end method

.method public bridge synthetic newUrlRequestBuilder(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 55
    invoke-super {p0, p1, p2, p3}, Lorg/chromium/net/impl/CronetEngineBase;->newUrlRequestBuilder(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    move-result-object p1

    return-object p1
.end method

.method onRequestDestroyed()V
    .locals 1

    .line 683
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRunningRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 684
    return-void
.end method

.method onRequestFinished()V
    .locals 1

    .line 691
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mActiveRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 692
    return-void
.end method

.method onRequestStarted()V
    .locals 1

    .line 673
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mActiveRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 674
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRunningRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 675
    return-void
.end method

.method public openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 1
    .param p1, "url"    # Ljava/net/URL;

    .line 648
    sget-object v0, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-virtual {p0, p1, v0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    return-object v0
.end method

.method public openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;
    .locals 4
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "proxy"    # Ljava/net/Proxy;

    .line 653
    invoke-virtual {p2}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-ne v0, v1, :cond_2

    .line 656
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    .line 657
    .local v0, "protocol":Ljava/lang/String;
    const-string v1, "http"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 660
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected protocol:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 658
    :cond_1
    :goto_0
    new-instance v1, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-direct {v1, p1, p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;-><init>(Ljava/net/URL;Lorg/chromium/net/CronetEngine;)V

    return-object v1

    .line 654
    .end local v0    # "protocol":Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeRequestFinishedListener(Lorg/chromium/net/RequestFinishedInfo$Listener;)V
    .locals 2
    .param p1, "listener"    # Lorg/chromium/net/RequestFinishedInfo$Listener;

    .line 635
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 636
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 637
    monitor-exit v0

    .line 638
    return-void

    .line 637
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removeRttListener(Lorg/chromium/net/NetworkQualityRttListener;)V
    .locals 6
    .param p1, "listener"    # Lorg/chromium/net/NetworkQualityRttListener;

    .line 570
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_1

    .line 573
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 574
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRttListenerList:Lorg/chromium/base/ObserverList;

    new-instance v2, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;

    invoke-direct {v2, p1}, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityRttListenerWrapper;-><init>(Lorg/chromium/net/NetworkQualityRttListener;)V

    invoke-virtual {v1, v2}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 576
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRttListenerList:Lorg/chromium/base/ObserverList;

    invoke-virtual {v1}, Lorg/chromium/base/ObserverList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 577
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 578
    :try_start_1
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 579
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    const/4 v5, 0x0

    invoke-interface {v2, v3, v4, p0, v5}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->provideRTTObservations(JLorg/chromium/net/impl/CronetUrlRequestContext;Z)V

    .line 581
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p1    # "listener":Lorg/chromium/net/NetworkQualityRttListener;
    :try_start_2
    throw v2

    .line 584
    .restart local p1    # "listener":Lorg/chromium/net/NetworkQualityRttListener;
    :cond_0
    :goto_0
    monitor-exit v0

    .line 585
    return-void

    .line 584
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 571
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network quality estimator must be enabled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeThroughputListener(Lorg/chromium/net/NetworkQualityThroughputListener;)V
    .locals 6
    .param p1, "listener"    # Lorg/chromium/net/NetworkQualityThroughputListener;

    .line 607
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityEstimatorEnabled:Z

    if-eqz v0, :cond_1

    .line 610
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkQualityLock:Ljava/lang/Object;

    monitor-enter v0

    .line 611
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mThroughputListenerList:Lorg/chromium/base/ObserverList;

    new-instance v2, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;

    invoke-direct {v2, p1}, Lorg/chromium/net/impl/VersionSafeCallbacks$NetworkQualityThroughputListenerWrapper;-><init>(Lorg/chromium/net/NetworkQualityThroughputListener;)V

    invoke-virtual {v1, v2}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 614
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mThroughputListenerList:Lorg/chromium/base/ObserverList;

    invoke-virtual {v1}, Lorg/chromium/base/ObserverList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 615
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 616
    :try_start_1
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 617
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    const/4 v5, 0x0

    invoke-interface {v2, v3, v4, p0, v5}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->provideThroughputObservations(JLorg/chromium/net/impl/CronetUrlRequestContext;Z)V

    .line 619
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p1    # "listener":Lorg/chromium/net/NetworkQualityThroughputListener;
    :try_start_2
    throw v2

    .line 622
    .restart local p1    # "listener":Lorg/chromium/net/NetworkQualityThroughputListener;
    :cond_0
    :goto_0
    monitor-exit v0

    .line 623
    return-void

    .line 622
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 608
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Network quality estimator must be enabled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method reportRequestFinished(Lorg/chromium/net/RequestFinishedInfo;Lorg/chromium/net/impl/RefCountDelegate;)V
    .locals 5
    .param p1, "requestInfo"    # Lorg/chromium/net/RequestFinishedInfo;
    .param p2, "inflightCallbackCount"    # Lorg/chromium/net/impl/RefCountDelegate;

    .line 801
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 802
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    .line 803
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mFinishedListenerMap:Ljava/util/Map;

    .line 804
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 805
    .local v1, "currentListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;>;"
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 806
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;

    .line 807
    .local v2, "listener":Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;
    new-instance v3, Lorg/chromium/net/impl/CronetUrlRequestContext$4;

    invoke-direct {v3, p0, v2, p1}, Lorg/chromium/net/impl/CronetUrlRequestContext$4;-><init>(Lorg/chromium/net/impl/CronetUrlRequestContext;Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;Lorg/chromium/net/RequestFinishedInfo;)V

    .line 813
    .local v3, "task":Ljava/lang/Runnable;
    invoke-virtual {v2}, Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    invoke-static {v4, v3, p2}, Lorg/chromium/net/impl/CronetUrlRequestContext;->postObservationTaskToExecutor(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;Lorg/chromium/net/impl/RefCountDelegate;)V

    .line 814
    .end local v2    # "listener":Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;
    .end local v3    # "task":Ljava/lang/Runnable;
    goto :goto_0

    .line 815
    :cond_1
    return-void

    .line 805
    .end local v1    # "currentListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public shutdown()V
    .locals 4

    .line 387
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mInUseStoragePath:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 388
    sget-object v0, Lorg/chromium/net/impl/CronetUrlRequestContext;->sInUseStoragePaths:Ljava/util/HashSet;

    monitor-enter v0

    .line 389
    :try_start_0
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->sInUseStoragePaths:Ljava/util/HashSet;

    iget-object v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mInUseStoragePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 390
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 392
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 393
    :try_start_1
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 394
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mRunningRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_3

    .line 399
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iget-object v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mNetworkThread:Ljava/lang/Thread;

    if-eq v1, v2, :cond_2

    .line 402
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 405
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mInitCompleted:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 408
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->stopNetLog()V

    .line 410
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 412
    :try_start_2
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->haveRequestContextAdapter()Z

    move-result v0

    if-nez v0, :cond_1

    .line 413
    monitor-exit v1

    return-void

    .line 415
    :cond_1
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v0

    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    invoke-interface {v0, v2, v3, p0}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->destroy(JLorg/chromium/net/impl/CronetUrlRequestContext;)V

    .line 417
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    .line 418
    monitor-exit v1

    .line 419
    return-void

    .line 418
    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    .line 400
    :cond_2
    :try_start_3
    new-instance v1, Ljava/lang/IllegalThreadStateException;

    const-string v2, "Cannot shutdown from network thread."

    invoke-direct {v1, v2}, Ljava/lang/IllegalThreadStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 395
    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot shutdown with running requests."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 402
    :catchall_2
    move-exception v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v1
.end method

.method public startNetLogToDisk(Ljava/lang/String;ZI)V
    .locals 9
    .param p1, "dirPath"    # Ljava/lang/String;
    .param p2, "logAll"    # Z
    .param p3, "maxSize"    # I

    .line 438
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 439
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 440
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsLogging:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    .line 441
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    .line 446
    :catchall_0
    move-exception v0

    move-object v5, p0

    move-object v6, p1

    move v7, p2

    move v8, p3

    goto :goto_0

    .line 443
    :cond_0
    :try_start_2
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object v5, p0

    move-object v6, p1

    move v7, p2

    move v8, p3

    .end local p1    # "dirPath":Ljava/lang/String;
    .end local p2    # "logAll":Z
    .end local p3    # "maxSize":I
    .local v6, "dirPath":Ljava/lang/String;
    .local v7, "logAll":Z
    .local v8, "maxSize":I
    :try_start_3
    invoke-interface/range {v2 .. v8}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->startNetLogToDisk(JLorg/chromium/net/impl/CronetUrlRequestContext;Ljava/lang/String;ZI)V

    .line 445
    const/4 p1, 0x1

    iput-boolean p1, v5, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsLogging:Z

    .line 446
    monitor-exit v1

    .line 447
    return-void

    .line 446
    .end local v6    # "dirPath":Ljava/lang/String;
    .end local v7    # "logAll":Z
    .end local v8    # "maxSize":I
    .restart local p1    # "dirPath":Ljava/lang/String;
    .restart local p2    # "logAll":Z
    .restart local p3    # "maxSize":I
    :catchall_1
    move-exception v0

    move-object v5, p0

    move-object v6, p1

    move v7, p2

    move v8, p3

    .end local p1    # "dirPath":Ljava/lang/String;
    .end local p2    # "logAll":Z
    .end local p3    # "maxSize":I
    .restart local v6    # "dirPath":Ljava/lang/String;
    .restart local v7    # "logAll":Z
    .restart local v8    # "maxSize":I
    :goto_0
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_0
.end method

.method public startNetLogToFile(Ljava/lang/String;Z)V
    .locals 8
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "logAll"    # Z

    .line 423
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 424
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 425
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsLogging:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    .line 426
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    .line 433
    :catchall_0
    move-exception v0

    move-object v5, p0

    move-object v6, p1

    move v7, p2

    goto :goto_0

    .line 428
    :cond_0
    :try_start_2
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object v5, p0

    move-object v6, p1

    move v7, p2

    .end local p1    # "fileName":Ljava/lang/String;
    .end local p2    # "logAll":Z
    .local v6, "fileName":Ljava/lang/String;
    .local v7, "logAll":Z
    :try_start_3
    invoke-interface/range {v2 .. v7}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->startNetLogToFile(JLorg/chromium/net/impl/CronetUrlRequestContext;Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 432
    const/4 p1, 0x1

    iput-boolean p1, v5, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsLogging:Z

    .line 433
    monitor-exit v1

    .line 434
    return-void

    .line 430
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Unable to start NetLog"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v6    # "fileName":Ljava/lang/String;
    .end local v7    # "logAll":Z
    throw p1

    .line 433
    .restart local p1    # "fileName":Ljava/lang/String;
    .restart local p2    # "logAll":Z
    :catchall_1
    move-exception v0

    move-object v5, p0

    move-object v6, p1

    move v7, p2

    .end local p1    # "fileName":Ljava/lang/String;
    .end local p2    # "logAll":Z
    .restart local v6    # "fileName":Ljava/lang/String;
    .restart local v7    # "logAll":Z
    :goto_0
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_0
.end method

.method public stopNetLog()V
    .locals 4

    .line 451
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 452
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->checkHaveAdapter()V

    .line 453
    iget-boolean v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsLogging:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsStoppingNetLog:Z

    if-eqz v1, :cond_0

    goto :goto_0

    .line 456
    :cond_0
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    move-result-object v1

    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mUrlRequestContextAdapter:J

    invoke-interface {v1, v2, v3, p0}, Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;->stopNetLog(JLorg/chromium/net/impl/CronetUrlRequestContext;)V

    .line 458
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsStoppingNetLog:Z

    .line 459
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 460
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mStopNetLogCompleted:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 461
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mStopNetLogCompleted:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 462
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 463
    const/4 v0, 0x0

    :try_start_1
    iput-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsStoppingNetLog:Z

    .line 464
    iput-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mIsLogging:Z

    .line 465
    monitor-exit v1

    .line 466
    return-void

    .line 465
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 454
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v0

    return-void

    .line 459
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method public stopNetLogCompleted()V
    .locals 1

    .line 470
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequestContext;->mStopNetLogCompleted:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 471
    return-void
.end method
