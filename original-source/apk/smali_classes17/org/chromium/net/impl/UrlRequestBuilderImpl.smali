.class public Lorg/chromium/net/impl/UrlRequestBuilderImpl;
.super Lorg/chromium/net/ExperimentalUrlRequest$Builder;
.source "UrlRequestBuilderImpl.java"


# static fields
.field private static final ACCEPT_ENCODING:Ljava/lang/String; = "Accept-Encoding"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAllowDirectExecutor:Z

.field private final mCallback:Lorg/chromium/net/UrlRequest$Callback;

.field private final mCronetEngine:Lorg/chromium/net/impl/CronetEngineBase;

.field private mDisableCache:Z

.field private mDisableConnectionMigration:Z

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mIdempotency:I

.field private mMethod:Ljava/lang/String;

.field private mNetworkHandle:J

.field private mPriority:I

.field private mRequestAnnotations:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mRequestFinishedListener:Lorg/chromium/net/RequestFinishedInfo$Listener;

.field private final mRequestHeaders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mTrafficStatsTag:I

.field private mTrafficStatsTagSet:Z

.field private mTrafficStatsUid:I

.field private mTrafficStatsUidSet:Z

.field private mUploadDataProvider:Lorg/chromium/net/UploadDataProvider;

.field private mUploadDataProviderExecutor:Ljava/util/concurrent/Executor;

.field private final mUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    const-class v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;Lorg/chromium/net/impl/CronetEngineBase;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/chromium/net/UrlRequest$Callback;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "cronetEngine"    # Lorg/chromium/net/impl/CronetEngineBase;

    .line 82
    invoke-direct {p0}, Lorg/chromium/net/ExperimentalUrlRequest$Builder;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestHeaders:Ljava/util/ArrayList;

    .line 49
    const/4 v0, 0x3

    iput v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mPriority:I

    .line 63
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mNetworkHandle:J

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mIdempotency:I

    .line 83
    if-eqz p1, :cond_3

    .line 86
    if-eqz p2, :cond_2

    .line 89
    if-eqz p3, :cond_1

    .line 92
    if-eqz p4, :cond_0

    .line 95
    iput-object p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mUrl:Ljava/lang/String;

    .line 96
    iput-object p2, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mCallback:Lorg/chromium/net/UrlRequest$Callback;

    .line 97
    iput-object p3, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 98
    iput-object p4, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mCronetEngine:Lorg/chromium/net/impl/CronetEngineBase;

    .line 99
    return-void

    .line 93
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "CronetEngine is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Executor is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Callback is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "URL is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 3
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 112
    if-eqz p1, :cond_2

    .line 115
    if-eqz p2, :cond_1

    .line 118
    const-string v0, "Accept-Encoding"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    sget-object v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    const-string v2, "It\'s not necessary to set Accept-Encoding on requests - cronet will do this automatically for you, and setting it yourself has no effect. See https://crbug.com/581399 for details."

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 123
    return-object p0

    .line 125
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestHeaders:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    return-object p0

    .line 116
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Invalid header value."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Invalid header name."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic addRequestAnnotation(Ljava/lang/Object;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->addRequestAnnotation(Ljava/lang/Object;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addRequestAnnotation(Ljava/lang/Object;)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->addRequestAnnotation(Ljava/lang/Object;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public addRequestAnnotation(Ljava/lang/Object;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 2
    .param p1, "annotation"    # Ljava/lang/Object;

    .line 178
    if-eqz p1, :cond_1

    .line 181
    iget-object v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestAnnotations:Ljava/util/Collection;

    if-nez v0, :cond_0

    .line 182
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestAnnotations:Ljava/util/Collection;

    .line 184
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestAnnotations:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 185
    return-object p0

    .line 179
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Invalid metrics annotation."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic allowDirectExecutor()Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->allowDirectExecutor()Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic allowDirectExecutor()Lorg/chromium/net/UrlRequest$Builder;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->allowDirectExecutor()Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object v0

    return-object v0
.end method

.method public allowDirectExecutor()Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 1

    .line 172
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mAllowDirectExecutor:Z

    .line 173
    return-object p0
.end method

.method public bridge synthetic bindToNetwork(J)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->bindToNetwork(J)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bindToNetwork(J)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 0
    .param p1, "networkHandle"    # J

    .line 210
    nop

    .line 214
    iput-wide p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mNetworkHandle:J

    .line 215
    return-object p0
.end method

.method public bridge synthetic build()Lorg/chromium/net/ExperimentalUrlRequest;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->build()Lorg/chromium/net/impl/UrlRequestBase;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lorg/chromium/net/UrlRequest;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->build()Lorg/chromium/net/impl/UrlRequestBase;

    move-result-object v0

    return-object v0
.end method

.method public build()Lorg/chromium/net/impl/UrlRequestBase;
    .locals 20

    .line 221
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mCronetEngine:Lorg/chromium/net/impl/CronetEngineBase;

    iget-object v2, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mUrl:Ljava/lang/String;

    iget-object v3, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mCallback:Lorg/chromium/net/UrlRequest$Callback;

    iget-object v4, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mExecutor:Ljava/util/concurrent/Executor;

    iget v5, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mPriority:I

    iget-object v6, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestAnnotations:Ljava/util/Collection;

    iget-boolean v7, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mDisableCache:Z

    iget-boolean v8, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mDisableConnectionMigration:Z

    iget-boolean v9, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mAllowDirectExecutor:Z

    iget-boolean v10, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mTrafficStatsTagSet:Z

    iget v11, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mTrafficStatsTag:I

    iget-boolean v12, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mTrafficStatsUidSet:Z

    iget v13, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mTrafficStatsUid:I

    iget-object v14, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestFinishedListener:Lorg/chromium/net/RequestFinishedInfo$Listener;

    iget v15, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mIdempotency:I

    move-object/from16 v16, v1

    move-object/from16 v17, v2

    iget-wide v1, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mNetworkHandle:J

    move-wide/from16 v18, v1

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move-wide/from16 v16, v18

    invoke-virtual/range {v1 .. v17}, Lorg/chromium/net/impl/CronetEngineBase;->createRequest(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;ILjava/util/Collection;ZZZZIZILorg/chromium/net/RequestFinishedInfo$Listener;IJ)Lorg/chromium/net/impl/UrlRequestBase;

    move-result-object v1

    .line 225
    .local v1, "request":Lorg/chromium/net/impl/UrlRequestBase;
    iget-object v2, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mMethod:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 226
    iget-object v2, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mMethod:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/chromium/net/impl/UrlRequestBase;->setHttpMethod(Ljava/lang/String;)V

    .line 228
    :cond_0
    iget-object v2, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestHeaders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;

    .line 229
    .local v3, "header":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v5, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lorg/chromium/net/impl/UrlRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    .end local v3    # "header":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0

    .line 231
    :cond_1
    iget-object v2, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mUploadDataProvider:Lorg/chromium/net/UploadDataProvider;

    if-eqz v2, :cond_2

    .line 232
    iget-object v2, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mUploadDataProvider:Lorg/chromium/net/UploadDataProvider;

    iget-object v3, v0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mUploadDataProviderExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v1, v2, v3}, Lorg/chromium/net/impl/UrlRequestBase;->setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)V

    .line 234
    :cond_2
    return-object v1
.end method

.method public bridge synthetic disableCache()Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->disableCache()Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic disableCache()Lorg/chromium/net/UrlRequest$Builder;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->disableCache()Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object v0

    return-object v0
.end method

.method public disableCache()Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 1

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mDisableCache:Z

    .line 132
    return-object p0
.end method

.method public bridge synthetic disableConnectionMigration()Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->disableConnectionMigration()Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object v0

    return-object v0
.end method

.method public disableConnectionMigration()Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 1

    .line 137
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mDisableConnectionMigration:Z

    .line 138
    return-object p0
.end method

.method public setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 2
    .param p1, "method"    # Ljava/lang/String;

    .line 103
    if-eqz p1, :cond_0

    .line 106
    iput-object p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mMethod:Ljava/lang/String;

    .line 107
    return-object p0

    .line 104
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Method is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setIdempotency(I)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setIdempotency(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setIdempotency(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 0
    .param p1, "idempotency"    # I

    .line 149
    iput p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mIdempotency:I

    .line 150
    return-object p0
.end method

.method public bridge synthetic setPriority(I)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setPriority(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setPriority(I)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setPriority(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setPriority(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 0
    .param p1, "priority"    # I

    .line 143
    iput p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mPriority:I

    .line 144
    return-object p0
.end method

.method public bridge synthetic setRequestFinishedListener(Lorg/chromium/net/RequestFinishedInfo$Listener;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setRequestFinishedListener(Lorg/chromium/net/RequestFinishedInfo$Listener;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setRequestFinishedListener(Lorg/chromium/net/RequestFinishedInfo$Listener;)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setRequestFinishedListener(Lorg/chromium/net/RequestFinishedInfo$Listener;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setRequestFinishedListener(Lorg/chromium/net/RequestFinishedInfo$Listener;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 0
    .param p1, "listener"    # Lorg/chromium/net/RequestFinishedInfo$Listener;

    .line 204
    iput-object p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mRequestFinishedListener:Lorg/chromium/net/RequestFinishedInfo$Listener;

    .line 205
    return-object p0
.end method

.method public bridge synthetic setTrafficStatsTag(I)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setTrafficStatsTag(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setTrafficStatsTag(I)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setTrafficStatsTag(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setTrafficStatsTag(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 1
    .param p1, "tag"    # I

    .line 190
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mTrafficStatsTagSet:Z

    .line 191
    iput p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mTrafficStatsTag:I

    .line 192
    return-object p0
.end method

.method public bridge synthetic setTrafficStatsUid(I)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setTrafficStatsUid(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setTrafficStatsUid(I)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setTrafficStatsUid(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setTrafficStatsUid(I)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 1
    .param p1, "uid"    # I

    .line 197
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mTrafficStatsUidSet:Z

    .line 198
    iput p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mTrafficStatsUid:I

    .line 199
    return-object p0
.end method

.method public bridge synthetic setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)Lorg/chromium/net/UrlRequest$Builder;
    .locals 0

    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)Lorg/chromium/net/impl/UrlRequestBuilderImpl;
    .locals 2
    .param p1, "uploadDataProvider"    # Lorg/chromium/net/UploadDataProvider;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 156
    if-eqz p1, :cond_2

    .line 159
    if-eqz p2, :cond_1

    .line 162
    iget-object v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mMethod:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 163
    const-string v0, "POST"

    iput-object v0, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mMethod:Ljava/lang/String;

    .line 165
    :cond_0
    iput-object p1, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mUploadDataProvider:Lorg/chromium/net/UploadDataProvider;

    .line 166
    iput-object p2, p0, Lorg/chromium/net/impl/UrlRequestBuilderImpl;->mUploadDataProviderExecutor:Ljava/util/concurrent/Executor;

    .line 167
    return-object p0

    .line 160
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Invalid UploadDataProvider Executor."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Invalid UploadDataProvider."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
