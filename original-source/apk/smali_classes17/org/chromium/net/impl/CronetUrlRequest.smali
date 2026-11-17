.class public final Lorg/chromium/net/impl/CronetUrlRequest;
.super Lorg/chromium/net/impl/UrlRequestBase;
.source "CronetUrlRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;,
        Lorg/chromium/net/impl/CronetUrlRequest$Natives;,
        Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "cronet"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mAllowDirectExecutor:Z

.field private final mCallback:Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;

.field private final mCronetEngineId:I

.field private final mDisableCache:Z

.field private final mDisableConnectionMigration:Z

.field private mException:Lorg/chromium/net/CronetException;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mFinishedReason:I

.field private final mIdempotency:I

.field private mInitialMethod:Ljava/lang/String;

.field private final mInitialUrl:Ljava/lang/String;

.field private final mLogger:Lorg/chromium/net/impl/CronetLogger;

.field private mMetrics:Lorg/chromium/net/impl/CronetMetrics;

.field private final mNetworkHandle:J

.field private mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

.field private mOnReadCompletedTask:Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;

.field private final mPriority:I

.field private mQuicConnectionMigrationAttempted:Z

.field private mQuicConnectionMigrationSuccessful:Z

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

.field private final mRequestFinishedListener:Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;

.field private final mRequestHeaders:Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

.field private mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

.field private mStarted:Z

.field private final mTrafficStatsTag:I

.field private final mTrafficStatsTagSet:Z

.field private final mTrafficStatsUid:I

.field private final mTrafficStatsUidSet:Z

.field private mUploadDataStream:Lorg/chromium/net/impl/CronetUploadDataStream;

.field private final mUrlChain:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mUrlRequestAdapter:J

.field private final mUrlRequestAdapterLock:Ljava/lang/Object;

.field private mWaitingOnRead:Z

.field private mWaitingOnRedirect:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetmCallback(Lorg/chromium/net/impl/CronetUrlRequest;)Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mCallback:Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmException(Lorg/chromium/net/impl/CronetUrlRequest;)Lorg/chromium/net/CronetException;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mException:Lorg/chromium/net/CronetException;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmRequestFinishedListener(Lorg/chromium/net/impl/CronetUrlRequest;)Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestFinishedListener:Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmResponseInfo(Lorg/chromium/net/impl/CronetUrlRequest;)Lorg/chromium/net/impl/UrlResponseInfoImpl;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUploadDataStream(Lorg/chromium/net/impl/CronetUrlRequest;)Lorg/chromium/net/impl/CronetUploadDataStream;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUploadDataStream:Lorg/chromium/net/impl/CronetUploadDataStream;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUrlRequestAdapter(Lorg/chromium/net/impl/CronetUrlRequest;)J
    .locals 2

    iget-wide v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fgetmUrlRequestAdapterLock(Lorg/chromium/net/impl/CronetUrlRequest;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmWaitingOnRead(Lorg/chromium/net/impl/CronetUrlRequest;Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mWaitingOnRead:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmWaitingOnRedirect(Lorg/chromium/net/impl/CronetUrlRequest;Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mWaitingOnRedirect:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mdestroyRequestAdapterLocked(Lorg/chromium/net/impl/CronetUrlRequest;I)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetUrlRequest;->destroyRequestAdapterLocked(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$misDoneLocked(Lorg/chromium/net/impl/CronetUrlRequest;)Z
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->isDoneLocked()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mmaybeReportMetrics(Lorg/chromium/net/impl/CronetUrlRequest;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->maybeReportMetrics()V

    return-void
.end method

.method static bridge synthetic -$$Nest$monCallbackException(Lorg/chromium/net/impl/CronetUrlRequest;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetUrlRequest;->onCallbackException(Ljava/lang/Exception;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstartInternalLocked(Lorg/chromium/net/impl/CronetUrlRequest;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->startInternalLocked()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 53
    return-void
.end method

.method constructor <init>(Lorg/chromium/net/impl/CronetUrlRequestContext;Ljava/lang/String;ILorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;Ljava/util/Collection;ZZZZIZILorg/chromium/net/RequestFinishedInfo$Listener;IJ)V
    .locals 16
    .param p1, "requestContext"    # Lorg/chromium/net/impl/CronetUrlRequestContext;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "priority"    # I
    .param p4, "callback"    # Lorg/chromium/net/UrlRequest$Callback;
    .param p5, "executor"    # Ljava/util/concurrent/Executor;
    .param p7, "disableCache"    # Z
    .param p8, "disableConnectionMigration"    # Z
    .param p9, "allowDirectExecutor"    # Z
    .param p10, "trafficStatsTagSet"    # Z
    .param p11, "trafficStatsTag"    # I
    .param p12, "trafficStatsUidSet"    # Z
    .param p13, "trafficStatsUid"    # I
    .param p14, "requestFinishedListener"    # Lorg/chromium/net/RequestFinishedInfo$Listener;
    .param p15, "idempotency"    # I
    .param p16, "networkHandle"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/net/impl/CronetUrlRequestContext;",
            "Ljava/lang/String;",
            "I",
            "Lorg/chromium/net/UrlRequest$Callback;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;ZZZZIZI",
            "Lorg/chromium/net/RequestFinishedInfo$Listener;",
            "IJ)V"
        }
    .end annotation

    .line 157
    .local p6, "requestAnnotations":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    move-object/from16 v4, p14

    invoke-direct {v0}, Lorg/chromium/net/impl/UrlRequestBase;-><init>()V

    .line 73
    new-instance v5, Ljava/lang/Object;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object v5, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    .line 82
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlChain:Ljava/util/List;

    .line 89
    new-instance v5, Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

    invoke-direct {v5}, Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;-><init>()V

    iput-object v5, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestHeaders:Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

    .line 158
    const-string v5, "URL is required"

    invoke-static {v1, v5}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    const-string v5, "Listener is required"

    invoke-static {v2, v5}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 160
    const-string v5, "Executor is required"

    invoke-static {v3, v5}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 162
    move/from16 v5, p9

    iput-boolean v5, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mAllowDirectExecutor:Z

    .line 163
    move-object/from16 v6, p1

    iput-object v6, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 164
    invoke-virtual {v6}, Lorg/chromium/net/impl/CronetUrlRequestContext;->getCronetEngineId()I

    move-result v7

    iput v7, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mCronetEngineId:I

    .line 165
    invoke-virtual {v6}, Lorg/chromium/net/impl/CronetUrlRequestContext;->getCronetLogger()Lorg/chromium/net/impl/CronetLogger;

    move-result-object v7

    iput-object v7, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mLogger:Lorg/chromium/net/impl/CronetLogger;

    .line 166
    iput-object v1, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialUrl:Ljava/lang/String;

    .line 167
    iget-object v7, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlChain:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    invoke-static/range {p3 .. p3}, Lorg/chromium/net/impl/CronetUrlRequest;->convertRequestPriority(I)I

    move-result v7

    iput v7, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mPriority:I

    .line 169
    new-instance v7, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;

    invoke-direct {v7, v2}, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;-><init>(Lorg/chromium/net/UrlRequest$Callback;)V

    iput-object v7, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mCallback:Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;

    .line 170
    iput-object v3, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mExecutor:Ljava/util/concurrent/Executor;

    .line 171
    move-object/from16 v7, p6

    iput-object v7, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestAnnotations:Ljava/util/Collection;

    .line 172
    move/from16 v8, p7

    iput-boolean v8, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mDisableCache:Z

    .line 173
    move/from16 v9, p8

    iput-boolean v9, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mDisableConnectionMigration:Z

    .line 174
    move/from16 v10, p10

    iput-boolean v10, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mTrafficStatsTagSet:Z

    .line 175
    move/from16 v11, p11

    iput v11, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mTrafficStatsTag:I

    .line 176
    move/from16 v12, p12

    iput-boolean v12, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mTrafficStatsUidSet:Z

    .line 177
    move/from16 v13, p13

    iput v13, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mTrafficStatsUid:I

    .line 178
    if-eqz v4, :cond_0

    .line 179
    new-instance v14, Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;

    invoke-direct {v14, v4}, Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;-><init>(Lorg/chromium/net/RequestFinishedInfo$Listener;)V

    goto :goto_0

    .line 180
    :cond_0
    const/4 v14, 0x0

    :goto_0
    iput-object v14, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestFinishedListener:Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;

    .line 181
    invoke-static/range {p15 .. p15}, Lorg/chromium/net/impl/CronetUrlRequest;->convertIdempotency(I)I

    move-result v14

    iput v14, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mIdempotency:I

    .line 182
    move-wide/from16 v14, p16

    iput-wide v14, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mNetworkHandle:J

    .line 183
    return-void
.end method

.method private buildCronetTrafficInfo()Lorg/chromium/net/impl/CronetLogger$CronetTrafficInfo;
    .locals 26

    .line 870
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    if-eqz v1, :cond_6

    .line 871
    iget-object v1, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestHeaders:Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

    if-eqz v1, :cond_5

    .line 879
    iget-object v1, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    if-eqz v1, :cond_0

    .line 880
    iget-object v1, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v1}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getAllHeaders()Ljava/util/Map;

    move-result-object v1

    .line 881
    .local v1, "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v2, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v2}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getNegotiatedProtocol()Ljava/lang/String;

    move-result-object v2

    .line 882
    .local v2, "negotiatedProtocol":Ljava/lang/String;
    iget-object v3, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v3}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getHttpStatusCode()I

    move-result v3

    .line 883
    .local v3, "httpStatusCode":I
    iget-object v4, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v4}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->wasCached()Z

    move-result v4

    move-object v14, v2

    move v11, v3

    move/from16 v17, v4

    .local v4, "wasCached":Z
    goto :goto_0

    .line 885
    .end local v1    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "negotiatedProtocol":Ljava/lang/String;
    .end local v3    # "httpStatusCode":I
    .end local v4    # "wasCached":Z
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 886
    .restart local v1    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v2, ""

    .line 887
    .restart local v2    # "negotiatedProtocol":Ljava/lang/String;
    const/4 v3, 0x0

    .line 888
    .restart local v3    # "httpStatusCode":I
    const/4 v4, 0x0

    move-object v14, v2

    move v11, v3

    move/from16 v17, v4

    .line 893
    .end local v2    # "negotiatedProtocol":Ljava/lang/String;
    .end local v3    # "httpStatusCode":I
    .local v11, "httpStatusCode":I
    .local v14, "negotiatedProtocol":Ljava/lang/String;
    .local v17, "wasCached":Z
    :goto_0
    iget-object v2, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    invoke-virtual {v2}, Lorg/chromium/net/impl/CronetMetrics;->getSentByteCount()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v18

    .line 898
    .local v18, "requestTotalSizeInBytes":J
    const-wide/16 v2, 0x0

    if-eqz v17, :cond_1

    cmp-long v4, v18, v2

    if-nez v4, :cond_1

    .line 900
    const-wide/16 v4, 0x0

    .line 901
    .local v4, "requestHeaderSizeInBytes":J
    const-wide/16 v6, 0x0

    .local v6, "requestBodySizeInBytes":J
    goto :goto_1

    .line 904
    .end local v4    # "requestHeaderSizeInBytes":J
    .end local v6    # "requestBodySizeInBytes":J
    :cond_1
    iget-object v4, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestHeaders:Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

    invoke-static {v4}, Lorg/chromium/net/impl/CronetUrlRequest;->estimateHeadersSizeInBytes(Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;)J

    move-result-wide v4

    .line 905
    .restart local v4    # "requestHeaderSizeInBytes":J
    sub-long v6, v18, v4

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 908
    .restart local v6    # "requestBodySizeInBytes":J
    :goto_1
    iget-object v8, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    invoke-virtual {v8}, Lorg/chromium/net/impl/CronetMetrics;->getReceivedByteCount()Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    .line 913
    .local v20, "responseTotalSizeInBytes":J
    if-eqz v17, :cond_2

    cmp-long v8, v20, v2

    if-nez v8, :cond_2

    .line 915
    const-wide/16 v8, 0x0

    .line 916
    .local v8, "responseBodySizeInBytes":J
    const-wide/16 v12, 0x0

    move-wide v9, v8

    .local v12, "responseHeaderSizeInBytes":J
    goto :goto_2

    .line 919
    .end local v8    # "responseBodySizeInBytes":J
    .end local v12    # "responseHeaderSizeInBytes":J
    :cond_2
    invoke-static {v1}, Lorg/chromium/net/impl/CronetUrlRequest;->estimateHeadersSizeInBytes(Ljava/util/Map;)J

    move-result-wide v12

    .line 920
    .restart local v12    # "responseHeaderSizeInBytes":J
    sub-long v8, v20, v12

    invoke-static {v2, v3, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    move-wide v9, v8

    .line 924
    .local v9, "responseBodySizeInBytes":J
    :goto_2
    iget-object v8, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    invoke-virtual {v8}, Lorg/chromium/net/impl/CronetMetrics;->getRequestStart()Ljava/util/Date;

    move-result-object v8

    if-eqz v8, :cond_3

    iget-object v8, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    invoke-virtual {v8}, Lorg/chromium/net/impl/CronetMetrics;->getResponseStart()Ljava/util/Date;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 925
    iget-object v8, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    .line 926
    invoke-virtual {v8}, Lorg/chromium/net/impl/CronetMetrics;->getResponseStart()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v15

    iget-object v8, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    invoke-virtual {v8}, Lorg/chromium/net/impl/CronetMetrics;->getRequestStart()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v22

    sub-long v15, v15, v22

    .line 925
    invoke-static/range {v15 .. v16}, Lj$/time/Duration;->ofMillis(J)Lj$/time/Duration;

    move-result-object v8

    .local v8, "headersLatency":Lj$/time/Duration;
    goto :goto_3

    .line 928
    .end local v8    # "headersLatency":Lj$/time/Duration;
    :cond_3
    invoke-static {v2, v3}, Lj$/time/Duration;->ofSeconds(J)Lj$/time/Duration;

    move-result-object v8

    .line 932
    .restart local v8    # "headersLatency":Lj$/time/Duration;
    :goto_3
    iget-object v15, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    invoke-virtual {v15}, Lorg/chromium/net/impl/CronetMetrics;->getRequestStart()Ljava/util/Date;

    move-result-object v15

    if-eqz v15, :cond_4

    iget-object v15, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    invoke-virtual {v15}, Lorg/chromium/net/impl/CronetMetrics;->getRequestEnd()Ljava/util/Date;

    move-result-object v15

    if-eqz v15, :cond_4

    .line 933
    iget-object v2, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    .line 934
    invoke-virtual {v2}, Lorg/chromium/net/impl/CronetMetrics;->getRequestEnd()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    iget-object v15, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    invoke-virtual {v15}, Lorg/chromium/net/impl/CronetMetrics;->getRequestStart()Ljava/util/Date;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/Date;->getTime()J

    move-result-wide v15

    sub-long/2addr v2, v15

    .line 933
    invoke-static {v2, v3}, Lj$/time/Duration;->ofMillis(J)Lj$/time/Duration;

    move-result-object v2

    .local v2, "totalLatency":Lj$/time/Duration;
    goto :goto_4

    .line 936
    .end local v2    # "totalLatency":Lj$/time/Duration;
    :cond_4
    invoke-static {v2, v3}, Lj$/time/Duration;->ofSeconds(J)Lj$/time/Duration;

    move-result-object v2

    .line 939
    .restart local v2    # "totalLatency":Lj$/time/Duration;
    :goto_4
    move-wide v3, v4

    move-wide v5, v6

    move-wide/from16 v24, v12

    move-object v13, v2

    move-object v12, v8

    move-wide/from16 v7, v24

    .end local v2    # "totalLatency":Lj$/time/Duration;
    .end local v4    # "requestHeaderSizeInBytes":J
    .end local v6    # "requestBodySizeInBytes":J
    .end local v8    # "headersLatency":Lj$/time/Duration;
    .local v3, "requestHeaderSizeInBytes":J
    .local v5, "requestBodySizeInBytes":J
    .local v7, "responseHeaderSizeInBytes":J
    .local v12, "headersLatency":Lj$/time/Duration;
    .local v13, "totalLatency":Lj$/time/Duration;
    new-instance v2, Lorg/chromium/net/impl/CronetLogger$CronetTrafficInfo;

    iget-boolean v15, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mQuicConnectionMigrationAttempted:Z

    move-object/from16 v22, v1

    .end local v1    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .local v22, "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-boolean v1, v0, Lorg/chromium/net/impl/CronetUrlRequest;->mQuicConnectionMigrationSuccessful:Z

    move/from16 v16, v1

    invoke-direct/range {v2 .. v16}, Lorg/chromium/net/impl/CronetLogger$CronetTrafficInfo;-><init>(JJJJILj$/time/Duration;Lj$/time/Duration;Ljava/lang/String;ZZ)V

    return-object v2

    .line 871
    .end local v3    # "requestHeaderSizeInBytes":J
    .end local v5    # "requestBodySizeInBytes":J
    .end local v7    # "responseHeaderSizeInBytes":J
    .end local v9    # "responseBodySizeInBytes":J
    .end local v11    # "httpStatusCode":I
    .end local v12    # "headersLatency":Lj$/time/Duration;
    .end local v13    # "totalLatency":Lj$/time/Duration;
    .end local v14    # "negotiatedProtocol":Ljava/lang/String;
    .end local v17    # "wasCached":Z
    .end local v18    # "requestTotalSizeInBytes":J
    .end local v20    # "responseTotalSizeInBytes":J
    .end local v22    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_5
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 870
    :cond_6
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method private checkNotStarted()V
    .locals 3

    .line 486
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 487
    :try_start_0
    iget-boolean v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mStarted:Z

    if-nez v1, :cond_0

    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->isDoneLocked()Z

    move-result v1

    if-nez v1, :cond_0

    .line 490
    monitor-exit v0

    .line 491
    return-void

    .line 488
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Request is already started."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 490
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static convertIdempotency(I)I
    .locals 1
    .param p0, "idempotency"    # I

    .line 422
    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_0

    .line 430
    return v0

    .line 428
    :pswitch_0
    const/4 v0, 0x2

    return v0

    .line 426
    :pswitch_1
    const/4 v0, 0x1

    return v0

    .line 424
    :pswitch_2
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static convertRequestPriority(I)I
    .locals 1
    .param p0, "priority"    # I

    .line 405
    const/4 v0, 0x4

    packed-switch p0, :pswitch_data_0

    .line 417
    return v0

    .line 415
    :pswitch_0
    const/4 v0, 0x5

    return v0

    .line 413
    :pswitch_1
    return v0

    .line 411
    :pswitch_2
    const/4 v0, 0x3

    return v0

    .line 409
    :pswitch_3
    const/4 v0, 0x2

    return v0

    .line 407
    :pswitch_4
    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private destroyRequestAdapterLocked(I)V
    .locals 7
    .param p1, "finishedReason"    # I

    .line 500
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mException:Lorg/chromium/net/CronetException;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 501
    :cond_1
    :goto_0
    iput p1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mFinishedReason:I

    .line 502
    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-nez v0, :cond_2

    .line 503
    return-void

    .line 505
    :cond_2
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->onRequestDestroyed()V

    .line 507
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestJni;->get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    move-result-object v0

    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    const/4 v6, 0x2

    if-ne p1, v6, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    invoke-interface {v0, v2, v3, p0, v1}, Lorg/chromium/net/impl/CronetUrlRequest$Natives;->destroy(JLorg/chromium/net/impl/CronetUrlRequest;Z)V

    .line 509
    iput-wide v4, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    .line 510
    return-void
.end method

.method static estimateHeadersSizeInBytes(Ljava/util/Map;)J
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)J"
        }
    .end annotation

    .line 440
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 442
    :cond_0
    const-wide/16 v0, 0x0

    .line 443
    .local v0, "responseHeaderSizeInBytes":J
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 444
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 445
    .local v4, "key":Ljava/lang/String;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v0, v5

    .line 446
    :cond_1
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_2

    goto :goto_0

    .line 448
    :cond_2
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 449
    .local v6, "content":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v0, v7

    .line 450
    .end local v6    # "content":Ljava/lang/String;
    goto :goto_1

    .line 451
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v4    # "key":Ljava/lang/String;
    :cond_3
    goto :goto_0

    .line 452
    :cond_4
    return-wide v0
.end method

.method static estimateHeadersSizeInBytes(Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;)J
    .locals 8
    .param p0, "headers"    # Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

    .line 461
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 462
    :cond_0
    const-wide/16 v0, 0x0

    .line 463
    .local v0, "responseHeaderSizeInBytes":J
    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 464
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 465
    .local v4, "key":Ljava/lang/String;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v0, v5

    .line 466
    :cond_1
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 467
    .local v5, "value":Ljava/lang/String;
    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v0, v6

    .line 468
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 469
    :cond_3
    return-wide v0
.end method

.method private failWithException(Lorg/chromium/net/CronetException;)V
    .locals 2
    .param p1, "exception"    # Lorg/chromium/net/CronetException;

    .line 538
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 539
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->isDoneLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 540
    monitor-exit v0

    return-void

    .line 542
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mException:Lorg/chromium/net/CronetException;

    if-nez v1, :cond_1

    .line 543
    iput-object p1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mException:Lorg/chromium/net/CronetException;

    .line 544
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetUrlRequest;->destroyRequestAdapterLocked(I)V

    .line 545
    monitor-exit v0

    .line 547
    return-void

    .line 542
    :cond_1
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    .end local p1    # "exception":Lorg/chromium/net/CronetException;
    throw v1

    .line 545
    .restart local p1    # "exception":Lorg/chromium/net/CronetException;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isDoneLocked()Z
    .locals 4

    .line 342
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mStarted:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

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

.method private mapUrlRequestErrorToApiErrorCode(I)I
    .locals 3
    .param p1, "errorCode"    # I

    .line 832
    packed-switch p1, :pswitch_data_0

    .line 856
    sget-object v0, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown error code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 857
    return p1

    .line 854
    :pswitch_0
    const/16 v0, 0xb

    return v0

    .line 852
    :pswitch_1
    const/16 v0, 0xa

    return v0

    .line 850
    :pswitch_2
    const/16 v0, 0x9

    return v0

    .line 848
    :pswitch_3
    const/16 v0, 0x8

    return v0

    .line 846
    :pswitch_4
    const/4 v0, 0x7

    return v0

    .line 844
    :pswitch_5
    const/4 v0, 0x6

    return v0

    .line 842
    :pswitch_6
    const/4 v0, 0x5

    return v0

    .line 840
    :pswitch_7
    const/4 v0, 0x4

    return v0

    .line 838
    :pswitch_8
    const/4 v0, 0x3

    return v0

    .line 836
    :pswitch_9
    const/4 v0, 0x2

    return v0

    .line 834
    :pswitch_a
    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private maybeReportMetrics()V
    .locals 9

    .line 948
    new-instance v0, Lorg/chromium/net/impl/RefCountDelegate;

    new-instance v1, Lorg/chromium/net/impl/CronetUrlRequest$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lorg/chromium/net/impl/CronetUrlRequest$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;)V

    invoke-direct {v0, v1}, Lorg/chromium/net/impl/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    move-object v1, v0

    .line 951
    .local v1, "inflightCallbackCount":Lorg/chromium/net/impl/RefCountDelegate;
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 990
    invoke-virtual {v1}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 951
    return-void

    .line 953
    :cond_0
    :try_start_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v2, 0x1a

    if-lt v0, v2, :cond_1

    .line 955
    :try_start_2
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mLogger:Lorg/chromium/net/impl/CronetLogger;

    iget v2, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mCronetEngineId:I

    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->buildCronetTrafficInfo()Lorg/chromium/net/impl/CronetLogger$CronetTrafficInfo;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/chromium/net/impl/CronetLogger;->logCronetTrafficInfo(ILorg/chromium/net/impl/CronetLogger$CronetTrafficInfo;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 961
    goto :goto_0

    .line 956
    :catch_0
    move-exception v0

    .line 959
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_3
    sget-object v2, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Error while trying to log CronetTrafficInfo: "

    invoke-static {v2, v3, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 964
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_1
    :goto_0
    new-instance v2, Lorg/chromium/net/impl/RequestFinishedInfoImpl;

    iget-object v3, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialUrl:Ljava/lang/String;

    iget-object v4, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestAnnotations:Ljava/util/Collection;

    iget-object v5, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    iget v6, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mFinishedReason:I

    iget-object v7, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    iget-object v8, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mException:Lorg/chromium/net/CronetException;

    invoke-direct/range {v2 .. v8}, Lorg/chromium/net/impl/RequestFinishedInfoImpl;-><init>(Ljava/lang/String;Ljava/util/Collection;Lorg/chromium/net/RequestFinishedInfo$Metrics;ILorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V

    .line 966
    .local v2, "requestInfo":Lorg/chromium/net/RequestFinishedInfo;
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-virtual {v0, v2, v1}, Lorg/chromium/net/impl/CronetUrlRequestContext;->reportRequestFinished(Lorg/chromium/net/RequestFinishedInfo;Lorg/chromium/net/impl/RefCountDelegate;)V

    .line 967
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestFinishedListener:Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;

    if-eqz v0, :cond_2

    .line 968
    invoke-virtual {v1}, Lorg/chromium/net/impl/RefCountDelegate;->increment()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 970
    :try_start_4
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestFinishedListener:Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;

    invoke-virtual {v0}, Lorg/chromium/net/impl/VersionSafeCallbacks$RequestFinishedInfoListener;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v3, Lorg/chromium/net/impl/CronetUrlRequest$9;

    invoke-direct {v3, p0, v2, v1}, Lorg/chromium/net/impl/CronetUrlRequest$9;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;Lorg/chromium/net/RequestFinishedInfo;Lorg/chromium/net/impl/RefCountDelegate;)V

    invoke-interface {v0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_4
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 987
    goto :goto_1

    .line 983
    :catch_1
    move-exception v0

    .line 984
    .local v0, "failException":Ljava/util/concurrent/RejectedExecutionException;
    :try_start_5
    sget-object v3, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Exception posting task to executor"

    invoke-static {v3, v4, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 986
    invoke-virtual {v1}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 990
    .end local v0    # "failException":Ljava/util/concurrent/RejectedExecutionException;
    .end local v2    # "requestInfo":Lorg/chromium/net/RequestFinishedInfo;
    :cond_2
    :goto_1
    invoke-virtual {v1}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 991
    nop

    .line 992
    return-void

    .line 990
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Lorg/chromium/net/impl/RefCountDelegate;->decrement()V

    .line 991
    throw v0
.end method

.method private onCallbackException(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .line 518
    new-instance v0, Lorg/chromium/net/impl/CallbackExceptionImpl;

    const-string v1, "Exception received from UrlRequest.Callback"

    invoke-direct {v0, v1, p1}, Lorg/chromium/net/impl/CallbackExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 520
    .local v0, "requestError":Lorg/chromium/net/CallbackException;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception in CalledByNative method"

    invoke-static {v1, v2, p1}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 521
    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 522
    return-void
.end method

.method private onCanceled()V
    .locals 1

    .line 732
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequest$6;

    invoke-direct {v0, p0}, Lorg/chromium/net/impl/CronetUrlRequest$6;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;)V

    .line 743
    .local v0, "task":Ljava/lang/Runnable;
    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 744
    return-void
.end method

.method private onError(IIILjava/lang/String;J)V
    .locals 4
    .param p1, "errorCode"    # I
    .param p2, "nativeError"    # I
    .param p3, "nativeQuicError"    # I
    .param p4, "errorString"    # Ljava/lang/String;
    .param p5, "receivedByteCount"    # J

    .line 712
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    if-eqz v0, :cond_0

    .line 713
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v0, p5, p6}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->setReceivedByteCount(J)V

    .line 715
    :cond_0
    const/16 v0, 0xa

    const-string v1, "Exception in CronetUrlRequest: "

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 720
    :cond_1
    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetUrlRequest;->mapUrlRequestErrorToApiErrorCode(I)I

    move-result v0

    .line 721
    .local v0, "javaError":I
    new-instance v2, Lorg/chromium/net/impl/NetworkExceptionImpl;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0, p2}, Lorg/chromium/net/impl/NetworkExceptionImpl;-><init>(Ljava/lang/String;II)V

    invoke-direct {p0, v2}, Lorg/chromium/net/impl/CronetUrlRequest;->failWithException(Lorg/chromium/net/CronetException;)V

    goto :goto_1

    .line 717
    .end local v0    # "javaError":I
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

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 724
    :goto_1
    return-void
.end method

.method private onMetricsCollected(JJJJJJJJJJJJJZJJZZ)V
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
    .param p32, "quicConnectionMigrationAttempted"    # Z
    .param p33, "quicConnectionMigrationSuccessful"    # Z

    .line 775
    move-object/from16 v1, p0

    iget-object v2, v1, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v2

    .line 776
    :try_start_0
    iget-object v0, v1, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;

    if-nez v0, :cond_0

    .line 779
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

    iput-object v3, v1, Lorg/chromium/net/impl/CronetUrlRequest;->mMetrics:Lorg/chromium/net/impl/CronetMetrics;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 783
    move/from16 v3, p32

    :try_start_1
    iput-boolean v3, v1, Lorg/chromium/net/impl/CronetUrlRequest;->mQuicConnectionMigrationAttempted:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 784
    move/from16 v4, p33

    :try_start_2
    iput-boolean v4, v1, Lorg/chromium/net/impl/CronetUrlRequest;->mQuicConnectionMigrationSuccessful:Z

    .line 785
    monitor-exit v2

    .line 788
    return-void

    .line 785
    :catchall_0
    move-exception v0

    goto :goto_0

    .line 777
    :cond_0
    move/from16 v3, p32

    move/from16 v4, p33

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v5, "Metrics collection should only happen once."

    invoke-direct {v0, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

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
    .end local p32    # "quicConnectionMigrationAttempted":Z
    .end local p33    # "quicConnectionMigrationSuccessful":Z
    throw v0

    .line 785
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
    .restart local p32    # "quicConnectionMigrationAttempted":Z
    .restart local p33    # "quicConnectionMigrationSuccessful":Z
    :catchall_1
    move-exception v0

    move/from16 v3, p32

    :goto_0
    move/from16 v4, p33

    :goto_1
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_1
.end method

.method private onNativeAdapterDestroyed()V
    .locals 4

    .line 796
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 797
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 798
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 802
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mException:Lorg/chromium/net/CronetException;

    if-nez v1, :cond_1

    .line 803
    monitor-exit v0

    return-void

    .line 805
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 806
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequest$8;

    invoke-direct {v0, p0}, Lorg/chromium/net/impl/CronetUrlRequest$8;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;)V

    .line 818
    .local v0, "task":Ljava/lang/Runnable;
    :try_start_1
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 821
    goto :goto_0

    .line 819
    :catch_0
    move-exception v1

    .line 820
    .local v1, "e":Ljava/util/concurrent/RejectedExecutionException;
    sget-object v2, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Exception posting task to executor"

    invoke-static {v2, v3, v1}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 822
    .end local v1    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void

    .line 805
    .end local v0    # "task":Ljava/lang/Runnable;
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private onReadCompleted(Ljava/nio/ByteBuffer;IIIJ)V
    .locals 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "bytesRead"    # I
    .param p3, "initialPosition"    # I
    .param p4, "initialLimit"    # I
    .param p5, "receivedByteCount"    # J

    .line 652
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v0, p5, p6}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->setReceivedByteCount(J)V

    .line 653
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    const/4 v1, 0x0

    if-ne v0, p3, :cond_2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    if-eq v0, p4, :cond_0

    goto :goto_0

    .line 658
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;

    if-nez v0, :cond_1

    .line 659
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;

    invoke-direct {v0, p0, v1}, Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;Lorg/chromium/net/impl/CronetUrlRequest-IA;)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;

    .line 661
    :cond_1
    add-int v0, p3, p2

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 662
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;

    iput-object p1, v0, Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 663
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mOnReadCompletedTask:Lorg/chromium/net/impl/CronetUrlRequest$OnReadCompletedRunnable;

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 664
    return-void

    .line 654
    :cond_2
    :goto_0
    new-instance v0, Lorg/chromium/net/impl/CronetExceptionImpl;

    const-string v2, "ByteBuffer modified externally during read"

    invoke-direct {v0, v2, v1}, Lorg/chromium/net/impl/CronetExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 656
    return-void
.end method

.method private onRedirectReceived(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;J)V
    .locals 10
    .param p1, "newLocation"    # Ljava/lang/String;
    .param p2, "httpStatusCode"    # I
    .param p3, "httpStatusText"    # Ljava/lang/String;
    .param p4, "headers"    # [Ljava/lang/String;
    .param p5, "wasCached"    # Z
    .param p6, "negotiatedProtocol"    # Ljava/lang/String;
    .param p7, "proxyServer"    # Ljava/lang/String;
    .param p8, "receivedByteCount"    # J

    .line 570
    nop

    .line 571
    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move-object v3, p4

    move v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    move-wide/from16 v7, p8

    invoke-direct/range {v0 .. v8}, Lorg/chromium/net/impl/CronetUrlRequest;->prepareResponseInfoOnNetworkThread(ILjava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;J)Lorg/chromium/net/impl/UrlResponseInfoImpl;

    move-result-object v9

    .line 575
    .local v9, "responseInfo":Lorg/chromium/net/impl/UrlResponseInfoImpl;
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlChain:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 577
    new-instance v1, Lorg/chromium/net/impl/CronetUrlRequest$3;

    invoke-direct {v1, p0, v9, p1}, Lorg/chromium/net/impl/CronetUrlRequest$3;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;Lorg/chromium/net/impl/UrlResponseInfoImpl;Ljava/lang/String;)V

    .line 595
    .local v1, "task":Ljava/lang/Runnable;
    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetUrlRequest;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 596
    return-void
.end method

.method private onResponseStarted(ILjava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;J)V
    .locals 3
    .param p1, "httpStatusCode"    # I
    .param p2, "httpStatusText"    # Ljava/lang/String;
    .param p3, "headers"    # [Ljava/lang/String;
    .param p4, "wasCached"    # Z
    .param p5, "negotiatedProtocol"    # Ljava/lang/String;
    .param p6, "proxyServer"    # Ljava/lang/String;
    .param p7, "receivedByteCount"    # J

    .line 607
    invoke-direct/range {p0 .. p8}, Lorg/chromium/net/impl/CronetUrlRequest;->prepareResponseInfoOnNetworkThread(ILjava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;J)Lorg/chromium/net/impl/UrlResponseInfoImpl;

    move-result-object v0

    move-wide v1, p7

    move-object p7, p6

    move-object p6, p5

    move p5, p4

    move-object p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "httpStatusCode":I
    .local v1, "receivedByteCount":J
    .local p2, "httpStatusCode":I
    .local p3, "httpStatusText":Ljava/lang/String;
    .local p4, "headers":[Ljava/lang/String;
    .local p5, "wasCached":Z
    .local p6, "negotiatedProtocol":Ljava/lang/String;
    .local p7, "proxyServer":Ljava/lang/String;
    iput-object v0, p1, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    .line 609
    new-instance p8, Lorg/chromium/net/impl/CronetUrlRequest$4;

    invoke-direct {p8, p0}, Lorg/chromium/net/impl/CronetUrlRequest$4;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;)V

    .line 627
    .local p8, "task":Ljava/lang/Runnable;
    invoke-direct {p0, p8}, Lorg/chromium/net/impl/CronetUrlRequest;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 628
    return-void
.end method

.method private onStatus(Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;I)V
    .locals 1
    .param p1, "listener"    # Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;
    .param p2, "loadState"    # I

    .line 754
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequest$7;

    invoke-direct {v0, p0, p1, p2}, Lorg/chromium/net/impl/CronetUrlRequest$7;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;I)V

    .line 760
    .local v0, "task":Ljava/lang/Runnable;
    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 761
    return-void
.end method

.method private onSucceeded(J)V
    .locals 1
    .param p1, "receivedByteCount"    # J

    .line 675
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mResponseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->setReceivedByteCount(J)V

    .line 676
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequest$5;

    invoke-direct {v0, p0}, Lorg/chromium/net/impl/CronetUrlRequest$5;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;)V

    .line 695
    .local v0, "task":Ljava/lang/Runnable;
    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 696
    return-void
.end method

.method private postTaskToExecutor(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "task"    # Ljava/lang/Runnable;

    .line 388
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 401
    goto :goto_0

    .line 389
    :catch_0
    move-exception v0

    .line 390
    .local v0, "failException":Ljava/util/concurrent/RejectedExecutionException;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception posting task to executor"

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 399
    new-instance v1, Lorg/chromium/net/impl/CronetExceptionImpl;

    invoke-direct {v1, v2, v0}, Lorg/chromium/net/impl/CronetExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetUrlRequest;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 402
    .end local v0    # "failException":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void
.end method

.method private prepareResponseInfoOnNetworkThread(ILjava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;J)Lorg/chromium/net/impl/UrlResponseInfoImpl;
    .locals 11
    .param p1, "httpStatusCode"    # I
    .param p2, "httpStatusText"    # Ljava/lang/String;
    .param p3, "headers"    # [Ljava/lang/String;
    .param p4, "wasCached"    # Z
    .param p5, "negotiatedProtocol"    # Ljava/lang/String;
    .param p6, "proxyServer"    # Ljava/lang/String;
    .param p7, "receivedByteCount"    # J

    .line 475
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

    invoke-direct {v0}, Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;-><init>()V

    move-object v5, v0

    .line 476
    .local v5, "headersList":Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_0

    .line 477
    new-instance v1, Ljava/util/AbstractMap$SimpleImmutableEntry;

    aget-object v2, p3, v0

    add-int/lit8 v3, v0, 0x1

    aget-object v3, p3, v3

    invoke-direct {v1, v2, v3}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v1}, Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;->add(Ljava/lang/Object;)Z

    .line 476
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 480
    .end local v0    # "i":I
    :cond_0
    new-instance v1, Lorg/chromium/net/impl/UrlResponseInfoImpl;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlChain:Ljava/util/List;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move v3, p1

    move-object v4, p2

    move v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-wide/from16 v9, p7

    invoke-direct/range {v1 .. v10}, Lorg/chromium/net/impl/UrlResponseInfoImpl;-><init>(Ljava/util/List;ILjava/lang/String;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;J)V

    return-object v1
.end method

.method private startInternalLocked()V
    .locals 3

    .line 279
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestJni;->get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    move-result-object v0

    iget-wide v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    invoke-interface {v0, v1, v2, p0}, Lorg/chromium/net/impl/CronetUrlRequest$Natives;->start(JLorg/chromium/net/impl/CronetUrlRequest;)V

    .line 280
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 194
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->checkNotStarted()V

    .line 195
    const-string v0, "Invalid header name."

    invoke-static {p1, v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 196
    const-string v0, "Invalid header value."

    invoke-static {p2, v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 197
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestHeaders:Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

    new-instance v1, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-direct {v1, p1, p2}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;->add(Ljava/lang/Object;)Z

    .line 198
    return-void
.end method

.method public cancel()V
    .locals 2

    .line 325
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 326
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->isDoneLocked()Z

    move-result v1

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mStarted:Z

    if-nez v1, :cond_0

    goto :goto_0

    .line 329
    :cond_0
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetUrlRequest;->destroyRequestAdapterLocked(I)V

    .line 330
    monitor-exit v0

    .line 331
    return-void

    .line 327
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    .line 330
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method checkCallingThread()V
    .locals 2

    .line 826
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mAllowDirectExecutor:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/impl/CronetUrlRequestContext;->isNetworkThread(Ljava/lang/Thread;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 827
    :cond_0
    new-instance v0, Lorg/chromium/net/InlineExecutionProhibitedException;

    invoke-direct {v0}, Lorg/chromium/net/InlineExecutionProhibitedException;-><init>()V

    throw v0

    .line 829
    :cond_1
    :goto_0
    return-void
.end method

.method public followRedirect()V
    .locals 4

    .line 284
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 285
    :try_start_0
    iget-boolean v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mWaitingOnRedirect:Z

    if-eqz v1, :cond_1

    .line 288
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mWaitingOnRedirect:Z

    .line 290
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->isDoneLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 291
    monitor-exit v0

    return-void

    .line 294
    :cond_0
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestJni;->get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    move-result-object v1

    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    invoke-interface {v1, v2, v3, p0}, Lorg/chromium/net/impl/CronetUrlRequest$Natives;->followDeferredRedirect(JLorg/chromium/net/impl/CronetUrlRequest;)V

    .line 296
    monitor-exit v0

    .line 297
    return-void

    .line 286
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No redirect to follow."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 296
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getStatus(Lorg/chromium/net/UrlRequest$StatusListener;)V
    .locals 6
    .param p1, "unsafeListener"    # Lorg/chromium/net/UrlRequest$StatusListener;

    .line 347
    new-instance v0, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;

    invoke-direct {v0, p1}, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;-><init>(Lorg/chromium/net/UrlRequest$StatusListener;)V

    .line 349
    .local v0, "listener":Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v1

    .line 350
    :try_start_0
    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 351
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestJni;->get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    invoke-interface {v2, v3, v4, p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest$Natives;->getStatus(JLorg/chromium/net/impl/CronetUrlRequest;Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;)V

    .line 353
    monitor-exit v1

    return-void

    .line 355
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 356
    new-instance v1, Lorg/chromium/net/impl/CronetUrlRequest$2;

    invoke-direct {v1, p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest$2;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;)V

    .line 362
    .local v1, "task":Ljava/lang/Runnable;
    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetUrlRequest;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 363
    return-void

    .line 355
    .end local v1    # "task":Ljava/lang/Runnable;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public getUrlRequestAdapterForTesting()J
    .locals 3

    .line 377
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 378
    :try_start_0
    iget-wide v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    monitor-exit v0

    return-wide v1

    .line 379
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isDone()Z
    .locals 2

    .line 335
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 336
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->isDoneLocked()Z

    move-result v1

    monitor-exit v0

    return v1

    .line 337
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method synthetic lambda$maybeReportMetrics$0$org-chromium-net-impl-CronetUrlRequest()V
    .locals 1

    .line 949
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->onRequestFinished()V

    return-void
.end method

.method onUploadException(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .line 528
    new-instance v0, Lorg/chromium/net/impl/CallbackExceptionImpl;

    const-string v1, "Exception received from UploadDataProvider"

    invoke-direct {v0, v1, p1}, Lorg/chromium/net/impl/CallbackExceptionImpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 530
    .local v0, "uploadError":Lorg/chromium/net/CallbackException;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception in upload method"

    invoke-static {v1, v2, p1}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 531
    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->failWithException(Lorg/chromium/net/CronetException;)V

    .line 532
    return-void
.end method

.method public read(Ljava/nio/ByteBuffer;)V
    .locals 9
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 301
    invoke-static {p1}, Lorg/chromium/net/impl/Preconditions;->checkHasRemaining(Ljava/nio/ByteBuffer;)V

    .line 302
    invoke-static {p1}, Lorg/chromium/net/impl/Preconditions;->checkDirect(Ljava/nio/ByteBuffer;)V

    .line 303
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v1

    .line 304
    :try_start_0
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mWaitingOnRead:Z

    if-eqz v0, :cond_2

    .line 307
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mWaitingOnRead:Z

    .line 309
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->isDoneLocked()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    .line 310
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    .line 320
    :catchall_0
    move-exception v0

    move-object v5, p0

    move-object v6, p1

    goto :goto_0

    .line 313
    :cond_0
    :try_start_2
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestJni;->get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    move-result-object v2

    iget-wide v3, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    .line 314
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 313
    move-object v5, p0

    move-object v6, p1

    .end local p1    # "buffer":Ljava/nio/ByteBuffer;
    .local v6, "buffer":Ljava/nio/ByteBuffer;
    :try_start_3
    invoke-interface/range {v2 .. v8}, Lorg/chromium/net/impl/CronetUrlRequest$Natives;->readData(JLorg/chromium/net/impl/CronetUrlRequest;Ljava/nio/ByteBuffer;II)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 320
    monitor-exit v1

    .line 321
    return-void

    .line 317
    :cond_1
    const/4 p1, 0x1

    iput-boolean p1, v5, Lorg/chromium/net/impl/CronetUrlRequest;->mWaitingOnRead:Z

    .line 318
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unable to call native read"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v6    # "buffer":Ljava/nio/ByteBuffer;
    throw p1

    .line 305
    .restart local p1    # "buffer":Ljava/nio/ByteBuffer;
    :cond_2
    move-object v5, p0

    move-object v6, p1

    .end local p1    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v6    # "buffer":Ljava/nio/ByteBuffer;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unexpected read attempt."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v6    # "buffer":Ljava/nio/ByteBuffer;
    throw p1

    .line 320
    .restart local p1    # "buffer":Ljava/nio/ByteBuffer;
    :catchall_1
    move-exception v0

    move-object v5, p0

    move-object v6, p1

    .end local p1    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v6    # "buffer":Ljava/nio/ByteBuffer;
    :goto_0
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_0
.end method

.method public setHttpMethod(Ljava/lang/String;)V
    .locals 1
    .param p1, "method"    # Ljava/lang/String;

    .line 187
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUrlRequest;->checkNotStarted()V

    .line 188
    const-string v0, "Method is required."

    invoke-static {p1, v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 189
    iput-object p1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialMethod:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setOnDestroyedCallbackForTesting(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "onDestroyedCallbackForTesting"    # Ljava/lang/Runnable;

    .line 366
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v0

    .line 367
    :try_start_0
    iput-object p1, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    .line 368
    monitor-exit v0

    .line 369
    return-void

    .line 368
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setOnDestroyedUploadCallbackForTesting(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "onDestroyedUploadCallbackForTesting"    # Ljava/lang/Runnable;

    .line 373
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUploadDataStream:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-virtual {v0, p1}, Lorg/chromium/net/impl/CronetUploadDataStream;->setOnDestroyedCallbackForTesting(Ljava/lang/Runnable;)V

    .line 374
    return-void
.end method

.method public setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "uploadDataProvider"    # Lorg/chromium/net/UploadDataProvider;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 202
    const-string v0, "Invalid UploadDataProvider."

    invoke-static {p1, v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 203
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialMethod:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 204
    const-string v0, "POST"

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialMethod:Ljava/lang/String;

    .line 206
    :cond_0
    new-instance v0, Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-direct {v0, p1, p2, p0}, Lorg/chromium/net/impl/CronetUploadDataStream;-><init>(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;Lorg/chromium/net/impl/CronetUrlRequest;)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest;->mUploadDataStream:Lorg/chromium/net/impl/CronetUploadDataStream;

    .line 207
    return-void
.end method

.method public start()V
    .locals 20

    .line 211
    move-object/from16 v3, p0

    iget-object v1, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapterLock:Ljava/lang/Object;

    monitor-enter v1

    .line 212
    :try_start_0
    invoke-direct {v3}, Lorg/chromium/net/impl/CronetUrlRequest;->checkNotStarted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 215
    const/4 v2, 0x1

    :try_start_1
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestJni;->get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    move-result-object v0

    iget-object v4, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 216
    invoke-virtual {v4}, Lorg/chromium/net/impl/CronetUrlRequestContext;->getUrlRequestContextAdapter()J

    move-result-wide v5

    iget-object v7, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialUrl:Ljava/lang/String;

    iget v8, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mPriority:I

    iget-boolean v9, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mDisableCache:Z

    iget-boolean v10, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mDisableConnectionMigration:Z

    iget-boolean v11, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mTrafficStatsTagSet:Z

    iget v12, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mTrafficStatsTag:I

    iget-boolean v13, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mTrafficStatsUidSet:Z

    iget v14, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mTrafficStatsUid:I

    iget v15, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mIdempotency:I
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v4, v0

    move-object/from16 v18, v1

    :try_start_2
    iget-wide v0, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mNetworkHandle:J
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 215
    move-object/from16 v16, v4

    move-object v4, v3

    move-object/from16 v3, v16

    move-wide/from16 v16, v0

    :try_start_3
    invoke-interface/range {v3 .. v17}, Lorg/chromium/net/impl/CronetUrlRequest$Natives;->createRequestAdapter(Lorg/chromium/net/impl/CronetUrlRequest;JLjava/lang/String;IZZZIZIIJ)J

    move-result-wide v0
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v3, v4

    :try_start_4
    iput-wide v0, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    .line 220
    iget-object v0, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetUrlRequestContext;->onRequestStarted()V

    .line 221
    iget-object v0, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialMethod:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 222
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestJni;->get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    move-result-object v0

    iget-wide v4, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    iget-object v1, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialMethod:Ljava/lang/String;

    invoke-interface {v0, v4, v5, v3, v1}, Lorg/chromium/net/impl/CronetUrlRequest$Natives;->setHttpMethod(JLorg/chromium/net/impl/CronetUrlRequest;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 224
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    iget-object v1, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mInitialMethod:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid http method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 229
    .local v0, "hasContentType":Z
    iget-object v1, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestHeaders:Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;

    invoke-virtual {v1}, Lorg/chromium/net/impl/CronetUrlRequest$HeadersList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    move-object v7, v1

    .line 230
    .local v7, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v4, "Content-Type"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 231
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 232
    const/4 v0, 0x1

    move v8, v0

    goto :goto_2

    .line 234
    :cond_2
    move v8, v0

    .end local v0    # "hasContentType":Z
    .local v8, "hasContentType":Z
    :goto_2
    invoke-static {}, Lorg/chromium/net/impl/CronetUrlRequestJni;->get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move v4, v2

    :try_start_5
    iget-wide v1, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mUrlRequestAdapter:J

    .line 235
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 234
    move-object/from16 v19, v9

    move v9, v4

    move-object v4, v5

    move-object/from16 v5, v19

    :try_start_6
    invoke-interface/range {v0 .. v5}, Lorg/chromium/net/impl/CronetUrlRequest$Natives;->addRequestHeader(JLorg/chromium/net/impl/CronetUrlRequest;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 239
    .end local v7    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    move v0, v8

    move v2, v9

    goto :goto_1

    .line 236
    .restart local v7    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 237
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid header "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 261
    .end local v7    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "hasContentType":Z
    :catch_0
    move-exception v0

    move v9, v4

    goto :goto_4

    .line 240
    .restart local v0    # "hasContentType":Z
    :cond_4
    move v9, v2

    iget-object v1, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mUploadDataStream:Lorg/chromium/net/impl/CronetUploadDataStream;

    if-eqz v1, :cond_6

    .line 241
    if-eqz v0, :cond_5

    .line 245
    iput-boolean v9, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mStarted:Z

    .line 246
    iget-object v1, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mUploadDataStream:Lorg/chromium/net/impl/CronetUploadDataStream;

    new-instance v2, Lorg/chromium/net/impl/CronetUrlRequest$1;

    invoke-direct {v2, v3}, Lorg/chromium/net/impl/CronetUrlRequest$1;-><init>(Lorg/chromium/net/impl/CronetUrlRequest;)V

    invoke-virtual {v1, v2}, Lorg/chromium/net/impl/CronetUploadDataStream;->postTaskToExecutor(Ljava/lang/Runnable;)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 259
    :try_start_7
    monitor-exit v18
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    return-void

    .line 242
    :cond_5
    :try_start_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Requests with upload data must have a Content-Type."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 267
    .end local v0    # "hasContentType":Z
    :cond_6
    nop

    .line 268
    :try_start_9
    iput-boolean v9, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mStarted:Z

    .line 269
    invoke-direct {v3}, Lorg/chromium/net/impl/CronetUrlRequest;->startInternalLocked()V

    .line 270
    monitor-exit v18

    .line 271
    return-void

    .line 261
    :catch_1
    move-exception v0

    goto :goto_4

    .line 270
    :catchall_0
    move-exception v0

    move-object v3, v4

    goto :goto_5

    .line 261
    :catch_2
    move-exception v0

    move v9, v2

    move-object v3, v4

    goto :goto_4

    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v0

    move-object/from16 v18, v1

    :goto_3
    move v9, v2

    .line 264
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_4
    invoke-direct {v3, v9}, Lorg/chromium/net/impl/CronetUrlRequest;->destroyRequestAdapterLocked(I)V

    .line 265
    iget-object v1, v3, Lorg/chromium/net/impl/CronetUrlRequest;->mRequestContext:Lorg/chromium/net/impl/CronetUrlRequestContext;

    invoke-virtual {v1}, Lorg/chromium/net/impl/CronetUrlRequestContext;->onRequestFinished()V

    .line 266
    throw v0

    .line 270
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catchall_1
    move-exception v0

    move-object/from16 v18, v1

    :goto_5
    monitor-exit v18
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_5
.end method
