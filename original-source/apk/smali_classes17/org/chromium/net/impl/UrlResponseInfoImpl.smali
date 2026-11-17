.class public final Lorg/chromium/net/impl/UrlResponseInfoImpl;
.super Lorg/chromium/net/UrlResponseInfo;
.source "UrlResponseInfoImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;
    }
.end annotation


# instance fields
.field private final mHeaders:Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;

.field private final mHttpStatusCode:I

.field private final mHttpStatusText:Ljava/lang/String;

.field private final mNegotiatedProtocol:Ljava/lang/String;

.field private final mProxyServer:Ljava/lang/String;

.field private final mReceivedByteCount:Ljava/util/concurrent/atomic/AtomicLong;

.field private final mResponseInfoUrlChain:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mWasCached:Z


# direct methods
.method public constructor <init>(Ljava/util/List;ILjava/lang/String;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p2, "httpStatusCode"    # I
    .param p3, "httpStatusText"    # Ljava/lang/String;
    .param p5, "wasCached"    # Z
    .param p6, "negotiatedProtocol"    # Ljava/lang/String;
    .param p7, "proxyServer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 105
    .local p1, "urlChain":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "allHeadersList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-wide/16 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v9}, Lorg/chromium/net/impl/UrlResponseInfoImpl;-><init>(Ljava/util/List;ILjava/lang/String;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;J)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/util/List;ILjava/lang/String;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;J)V
    .locals 2
    .param p2, "httpStatusCode"    # I
    .param p3, "httpStatusText"    # Ljava/lang/String;
    .param p5, "wasCached"    # Z
    .param p6, "negotiatedProtocol"    # Ljava/lang/String;
    .param p7, "proxyServer"    # Ljava/lang/String;
    .param p8, "receivedByteCount"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    .line 87
    .local p1, "urlChain":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "allHeadersList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-direct {p0}, Lorg/chromium/net/UrlResponseInfo;-><init>()V

    .line 88
    invoke-static {p1}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mResponseInfoUrlChain:Ljava/util/List;

    .line 89
    iput p2, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mHttpStatusCode:I

    .line 90
    iput-object p3, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mHttpStatusText:Ljava/lang/String;

    .line 91
    new-instance v0, Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;

    invoke-static {p4}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mHeaders:Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;

    .line 92
    iput-boolean p5, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mWasCached:Z

    .line 93
    iput-object p6, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mNegotiatedProtocol:Ljava/lang/String;

    .line 94
    iput-object p7, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mProxyServer:Ljava/lang/String;

    .line 95
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0, p8, p9}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mReceivedByteCount:Ljava/util/concurrent/atomic/AtomicLong;

    .line 96
    return-void
.end method


# virtual methods
.method public getAllHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 136
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mHeaders:Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;

    invoke-virtual {v0}, Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;->getAsMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getAllHeadersAsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mHeaders:Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;

    invoke-virtual {v0}, Lorg/chromium/net/impl/UrlResponseInfoImpl$HeaderBlockImpl;->getAsList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHttpStatusCode()I
    .locals 1

    .line 121
    iget v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mHttpStatusCode:I

    return v0
.end method

.method public getHttpStatusText()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mHttpStatusText:Ljava/lang/String;

    return-object v0
.end method

.method public getNegotiatedProtocol()Ljava/lang/String;
    .locals 1

    .line 146
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mNegotiatedProtocol:Ljava/lang/String;

    return-object v0
.end method

.method public getProxyServer()Ljava/lang/String;
    .locals 1

    .line 151
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mProxyServer:Ljava/lang/String;

    return-object v0
.end method

.method public getReceivedByteCount()J
    .locals 2

    .line 156
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mReceivedByteCount:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 2

    .line 111
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mResponseInfoUrlChain:Ljava/util/List;

    iget-object v1, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mResponseInfoUrlChain:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getUrlChain()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mResponseInfoUrlChain:Ljava/util/List;

    return-object v0
.end method

.method public setReceivedByteCount(J)V
    .locals 1
    .param p1, "currentReceivedByteCount"    # J

    .line 175
    iget-object v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mReceivedByteCount:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 176
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 13

    .line 161
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 165
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getUrl()Ljava/lang/String;

    move-result-object v2

    .line 166
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getUrlChain()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getHttpStatusCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getHttpStatusText()Ljava/lang/String;

    move-result-object v5

    .line 167
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getAllHeadersAsList()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->wasCached()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getNegotiatedProtocol()Ljava/lang/String;

    move-result-object v8

    .line 168
    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getProxyServer()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lorg/chromium/net/impl/UrlResponseInfoImpl;->getReceivedByteCount()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const/16 v11, 0xa

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v1, v11, v12

    const/4 v1, 0x1

    aput-object v2, v11, v1

    const/4 v1, 0x2

    aput-object v3, v11, v1

    const/4 v1, 0x3

    aput-object v4, v11, v1

    const/4 v1, 0x4

    aput-object v5, v11, v1

    const/4 v1, 0x5

    aput-object v6, v11, v1

    const/4 v1, 0x6

    aput-object v7, v11, v1

    const/4 v1, 0x7

    aput-object v8, v11, v1

    const/16 v1, 0x8

    aput-object v9, v11, v1

    const/16 v1, 0x9

    aput-object v10, v11, v1

    .line 161
    const-string v1, "UrlResponseInfo@[%s][%s]: urlChain = %s, httpStatus = %d %s, headers = %s, wasCached = %b, negotiatedProtocol = %s, proxyServer= %s, receivedByteCount = %d"

    invoke-static {v0, v1, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public wasCached()Z
    .locals 1

    .line 141
    iget-boolean v0, p0, Lorg/chromium/net/impl/UrlResponseInfoImpl;->mWasCached:Z

    return v0
.end method
