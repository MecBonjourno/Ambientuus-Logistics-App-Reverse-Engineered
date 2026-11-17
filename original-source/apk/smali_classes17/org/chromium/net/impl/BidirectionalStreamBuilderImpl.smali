.class public Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;
.super Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
.source "BidirectionalStreamBuilderImpl.java"


# instance fields
.field private final mCallback:Lorg/chromium/net/BidirectionalStream$Callback;

.field private final mCronetEngine:Lorg/chromium/net/impl/CronetEngineBase;

.field private mDelayRequestHeadersUntilFirstFlush:Z

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mHttpMethod:Ljava/lang/String;

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

.field private final mRequestHeaders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/Map$Entry<",
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

.field private final mUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;Lorg/chromium/net/impl/CronetEngineBase;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/chromium/net/BidirectionalStream$Callback;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "cronetEngine"    # Lorg/chromium/net/impl/CronetEngineBase;

    .line 70
    invoke-direct {p0}, Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mRequestHeaders:Ljava/util/ArrayList;

    .line 38
    const-string v0, "POST"

    iput-object v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mHttpMethod:Ljava/lang/String;

    .line 40
    const/4 v0, 0x3

    iput v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mPriority:I

    .line 52
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mNetworkHandle:J

    .line 71
    if-eqz p1, :cond_3

    .line 74
    if-eqz p2, :cond_2

    .line 77
    if-eqz p3, :cond_1

    .line 80
    if-eqz p4, :cond_0

    .line 83
    iput-object p1, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mUrl:Ljava/lang/String;

    .line 84
    iput-object p2, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    .line 85
    iput-object p3, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 86
    iput-object p4, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mCronetEngine:Lorg/chromium/net/impl/CronetEngineBase;

    .line 87
    return-void

    .line 81
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "CronetEngine is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Executor is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Callback is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "URL is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;
    .locals 2
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 100
    if-eqz p1, :cond_1

    .line 103
    if-eqz p2, :cond_0

    .line 106
    iget-object v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mRequestHeaders:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-direct {v1, p1, p2}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    return-object p0

    .line 104
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Invalid header value."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Invalid header name."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic addRequestAnnotation(Ljava/lang/Object;)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->addRequestAnnotation(Ljava/lang/Object;)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addRequestAnnotation(Ljava/lang/Object;)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 2
    .param p1, "annotation"    # Ljava/lang/Object;

    .line 126
    if-eqz p1, :cond_1

    .line 129
    iget-object v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mRequestAnnotations:Ljava/util/Collection;

    if-nez v0, :cond_0

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mRequestAnnotations:Ljava/util/Collection;

    .line 132
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mRequestAnnotations:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 133
    return-object p0

    .line 127
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Invalid metrics annotation."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic bindToNetwork(J)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->bindToNetwork(J)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bindToNetwork(J)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 0
    .param p1, "networkHandle"    # J

    .line 152
    nop

    .line 156
    iput-wide p1, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mNetworkHandle:J

    .line 157
    return-object p0
.end method

.method public bridge synthetic build()Lorg/chromium/net/BidirectionalStream;
    .locals 1

    .line 22
    invoke-virtual {p0}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->build()Lorg/chromium/net/ExperimentalBidirectionalStream;

    move-result-object v0

    return-object v0
.end method

.method public build()Lorg/chromium/net/ExperimentalBidirectionalStream;
    .locals 15

    .line 163
    iget-object v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mCronetEngine:Lorg/chromium/net/impl/CronetEngineBase;

    iget-object v1, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mUrl:Ljava/lang/String;

    iget-object v2, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    iget-object v3, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v4, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mHttpMethod:Ljava/lang/String;

    iget-object v5, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mRequestHeaders:Ljava/util/ArrayList;

    iget v6, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mPriority:I

    iget-boolean v7, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mDelayRequestHeadersUntilFirstFlush:Z

    iget-object v8, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mRequestAnnotations:Ljava/util/Collection;

    iget-boolean v9, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mTrafficStatsTagSet:Z

    iget v10, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mTrafficStatsTag:I

    iget-boolean v11, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mTrafficStatsUidSet:Z

    iget v12, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mTrafficStatsUid:I

    iget-wide v13, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mNetworkHandle:J

    invoke-virtual/range {v0 .. v14}, Lorg/chromium/net/impl/CronetEngineBase;->createBidirectionalStream(Ljava/lang/String;Lorg/chromium/net/BidirectionalStream$Callback;Ljava/util/concurrent/Executor;Ljava/lang/String;Ljava/util/List;IZLjava/util/Collection;ZIZIJ)Lorg/chromium/net/ExperimentalBidirectionalStream;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic delayRequestHeadersUntilFirstFlush(Z)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->delayRequestHeadersUntilFirstFlush(Z)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic delayRequestHeadersUntilFirstFlush(Z)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->delayRequestHeadersUntilFirstFlush(Z)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public delayRequestHeadersUntilFirstFlush(Z)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;
    .locals 0
    .param p1, "delayRequestHeadersUntilFirstFlush"    # Z

    .line 120
    iput-boolean p1, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mDelayRequestHeadersUntilFirstFlush:Z

    .line 121
    return-object p0
.end method

.method public bridge synthetic setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;
    .locals 2
    .param p1, "method"    # Ljava/lang/String;

    .line 91
    if-eqz p1, :cond_0

    .line 94
    iput-object p1, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mHttpMethod:Ljava/lang/String;

    .line 95
    return-object p0

    .line 92
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Method is required."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setPriority(I)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->setPriority(I)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setPriority(I)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->setPriority(I)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setPriority(I)Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;
    .locals 0
    .param p1, "priority"    # I

    .line 113
    iput p1, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mPriority:I

    .line 114
    return-object p0
.end method

.method public bridge synthetic setTrafficStatsTag(I)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->setTrafficStatsTag(I)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTrafficStatsTag(I)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 1
    .param p1, "tag"    # I

    .line 138
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mTrafficStatsTagSet:Z

    .line 139
    iput p1, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mTrafficStatsTag:I

    .line 140
    return-object p0
.end method

.method public bridge synthetic setTrafficStatsUid(I)Lorg/chromium/net/BidirectionalStream$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->setTrafficStatsUid(I)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTrafficStatsUid(I)Lorg/chromium/net/ExperimentalBidirectionalStream$Builder;
    .locals 1
    .param p1, "uid"    # I

    .line 145
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mTrafficStatsUidSet:Z

    .line 146
    iput p1, p0, Lorg/chromium/net/impl/BidirectionalStreamBuilderImpl;->mTrafficStatsUid:I

    .line 147
    return-object p0
.end method
