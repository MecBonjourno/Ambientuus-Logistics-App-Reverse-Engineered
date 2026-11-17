.class public final Lcom/google/api/client/googleapis/batch/BatchRequest;
.super Ljava/lang/Object;
.source "BatchRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/googleapis/batch/BatchRequest$BatchInterceptor;,
        Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;
    }
.end annotation


# instance fields
.field private batchUrl:Lcom/google/api/client/http/GenericUrl;

.field private final requestFactory:Lcom/google/api/client/http/HttpRequestFactory;

.field requestInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<",
            "**>;>;"
        }
    .end annotation
.end field

.field private sleeper:Lcom/google/api/client/util/Sleeper;


# direct methods
.method public constructor <init>(Lcom/google/api/client/http/HttpTransport;Lcom/google/api/client/http/HttpRequestInitializer;)V
    .locals 2
    .param p1, "transport"    # Lcom/google/api/client/http/HttpTransport;
    .param p2, "httpRequestInitializer"    # Lcom/google/api/client/http/HttpRequestInitializer;

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Lcom/google/api/client/http/GenericUrl;

    const-string v1, "https://www.googleapis.com/batch"

    invoke-direct {v0, v1}, Lcom/google/api/client/http/GenericUrl;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->batchUrl:Lcom/google/api/client/http/GenericUrl;

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestInfos:Ljava/util/List;

    .line 109
    sget-object v0, Lcom/google/api/client/util/Sleeper;->DEFAULT:Lcom/google/api/client/util/Sleeper;

    iput-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->sleeper:Lcom/google/api/client/util/Sleeper;

    .line 135
    if-nez p2, :cond_0

    .line 136
    invoke-virtual {p1}, Lcom/google/api/client/http/HttpTransport;->createRequestFactory()Lcom/google/api/client/http/HttpRequestFactory;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Lcom/google/api/client/http/HttpTransport;->createRequestFactory(Lcom/google/api/client/http/HttpRequestInitializer;)Lcom/google/api/client/http/HttpRequestFactory;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestFactory:Lcom/google/api/client/http/HttpRequestFactory;

    .line 137
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 217
    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkState(Z)V

    .line 218
    iget-object v0, v1, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestFactory:Lcom/google/api/client/http/HttpRequestFactory;

    iget-object v3, v1, Lcom/google/api/client/googleapis/batch/BatchRequest;->batchUrl:Lcom/google/api/client/http/GenericUrl;

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/google/api/client/http/HttpRequestFactory;->buildPostRequest(Lcom/google/api/client/http/GenericUrl;Lcom/google/api/client/http/HttpContent;)Lcom/google/api/client/http/HttpRequest;

    move-result-object v3

    .line 220
    .local v3, "batchRequest":Lcom/google/api/client/http/HttpRequest;
    invoke-virtual {v3}, Lcom/google/api/client/http/HttpRequest;->getInterceptor()Lcom/google/api/client/http/HttpExecuteInterceptor;

    move-result-object v5

    .line 221
    .local v5, "originalInterceptor":Lcom/google/api/client/http/HttpExecuteInterceptor;
    new-instance v0, Lcom/google/api/client/googleapis/batch/BatchRequest$BatchInterceptor;

    invoke-direct {v0, v1, v5}, Lcom/google/api/client/googleapis/batch/BatchRequest$BatchInterceptor;-><init>(Lcom/google/api/client/googleapis/batch/BatchRequest;Lcom/google/api/client/http/HttpExecuteInterceptor;)V

    invoke-virtual {v3, v0}, Lcom/google/api/client/http/HttpRequest;->setInterceptor(Lcom/google/api/client/http/HttpExecuteInterceptor;)Lcom/google/api/client/http/HttpRequest;

    .line 222
    invoke-virtual {v3}, Lcom/google/api/client/http/HttpRequest;->getNumberOfRetries()I

    move-result v0

    .line 223
    .local v0, "retriesRemaining":I
    invoke-virtual {v3}, Lcom/google/api/client/http/HttpRequest;->getBackOffPolicy()Lcom/google/api/client/http/BackOffPolicy;

    move-result-object v6

    .line 225
    .local v6, "backOffPolicy":Lcom/google/api/client/http/BackOffPolicy;
    if-eqz v6, :cond_0

    .line 227
    invoke-interface {v6}, Lcom/google/api/client/http/BackOffPolicy;->reset()V

    .line 231
    :cond_0
    move v7, v0

    .end local v0    # "retriesRemaining":I
    .local v7, "retriesRemaining":I
    :cond_1
    if-lez v7, :cond_2

    move v0, v2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    move v8, v0

    .line 232
    .local v8, "retryAllowed":Z
    new-instance v0, Lcom/google/api/client/http/MultipartContent;

    invoke-direct {v0}, Lcom/google/api/client/http/MultipartContent;-><init>()V

    move-object v9, v0

    .line 233
    .local v9, "batchContent":Lcom/google/api/client/http/MultipartContent;
    invoke-virtual {v9}, Lcom/google/api/client/http/MultipartContent;->getMediaType()Lcom/google/api/client/http/HttpMediaType;

    move-result-object v0

    const-string v10, "mixed"

    invoke-virtual {v0, v10}, Lcom/google/api/client/http/HttpMediaType;->setSubType(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 234
    const/4 v0, 0x1

    .line 235
    .local v0, "contentId":I
    iget-object v10, v1, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestInfos:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move v11, v0

    .end local v0    # "contentId":I
    .local v11, "contentId":I
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;

    .line 236
    .local v0, "requestInfo":Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;, "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<**>;"
    new-instance v12, Lcom/google/api/client/http/MultipartContent$Part;

    new-instance v13, Lcom/google/api/client/http/HttpHeaders;

    invoke-direct {v13}, Lcom/google/api/client/http/HttpHeaders;-><init>()V

    .line 237
    invoke-virtual {v13, v4}, Lcom/google/api/client/http/HttpHeaders;->setAcceptEncoding(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    move-result-object v13

    add-int/lit8 v14, v11, 0x1

    .end local v11    # "contentId":I
    .local v14, "contentId":I
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const-string v15, "Content-ID"

    invoke-virtual {v13, v15, v11}, Lcom/google/api/client/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/http/HttpHeaders;

    move-result-object v11

    new-instance v13, Lcom/google/api/client/googleapis/batch/HttpRequestContent;

    iget-object v15, v0, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->request:Lcom/google/api/client/http/HttpRequest;

    invoke-direct {v13, v15}, Lcom/google/api/client/googleapis/batch/HttpRequestContent;-><init>(Lcom/google/api/client/http/HttpRequest;)V

    invoke-direct {v12, v11, v13}, Lcom/google/api/client/http/MultipartContent$Part;-><init>(Lcom/google/api/client/http/HttpHeaders;Lcom/google/api/client/http/HttpContent;)V

    .line 236
    invoke-virtual {v9, v12}, Lcom/google/api/client/http/MultipartContent;->addPart(Lcom/google/api/client/http/MultipartContent$Part;)Lcom/google/api/client/http/MultipartContent;

    .line 239
    .end local v0    # "requestInfo":Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;, "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<**>;"
    move v11, v14

    goto :goto_1

    .line 240
    .end local v14    # "contentId":I
    .restart local v11    # "contentId":I
    :cond_3
    invoke-virtual {v3, v9}, Lcom/google/api/client/http/HttpRequest;->setContent(Lcom/google/api/client/http/HttpContent;)Lcom/google/api/client/http/HttpRequest;

    .line 241
    invoke-virtual {v3}, Lcom/google/api/client/http/HttpRequest;->execute()Lcom/google/api/client/http/HttpResponse;

    move-result-object v10

    .line 245
    .local v10, "response":Lcom/google/api/client/http/HttpResponse;
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "--"

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v10}, Lcom/google/api/client/http/HttpResponse;->getMediaType()Lcom/google/api/client/http/HttpMediaType;

    move-result-object v12

    const-string v13, "boundary"

    invoke-virtual {v12, v13}, Lcom/google/api/client/http/HttpMediaType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 248
    .local v0, "boundary":Ljava/lang/String;
    invoke-virtual {v10}, Lcom/google/api/client/http/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v12

    .line 249
    .local v12, "contentStream":Ljava/io/InputStream;
    new-instance v13, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;

    iget-object v14, v1, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestInfos:Ljava/util/List;

    invoke-direct {v13, v12, v0, v14, v8}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;-><init>(Ljava/io/InputStream;Ljava/lang/String;Ljava/util/List;Z)V

    .line 252
    .local v13, "batchResponse":Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;
    :goto_2
    iget-boolean v14, v13, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->hasNext:Z

    if-eqz v14, :cond_4

    .line 253
    invoke-virtual {v13}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->parseNextResponse()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 256
    .end local v0    # "boundary":Ljava/lang/String;
    .end local v12    # "contentStream":Ljava/io/InputStream;
    :cond_4
    invoke-virtual {v10}, Lcom/google/api/client/http/HttpResponse;->disconnect()V

    .line 257
    nop

    .line 259
    iget-object v12, v13, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->unsuccessfulRequestInfos:Ljava/util/List;

    .line 260
    .local v12, "unsuccessfulRequestInfos":Ljava/util/List;, "Ljava/util/List<Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<**>;>;"
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 261
    iput-object v12, v1, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestInfos:Ljava/util/List;

    .line 263
    iget-boolean v0, v13, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->backOffRequired:Z

    if-eqz v0, :cond_5

    if-eqz v6, :cond_5

    .line 264
    invoke-interface {v6}, Lcom/google/api/client/http/BackOffPolicy;->getNextBackOffMillis()J

    move-result-wide v14

    .line 265
    .local v14, "backOffTime":J
    const-wide/16 v16, -0x1

    cmp-long v0, v14, v16

    if-eqz v0, :cond_5

    .line 267
    :try_start_1
    iget-object v0, v1, Lcom/google/api/client/googleapis/batch/BatchRequest;->sleeper:Lcom/google/api/client/util/Sleeper;

    invoke-interface {v0, v14, v15}, Lcom/google/api/client/util/Sleeper;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 270
    goto :goto_3

    .line 268
    :catch_0
    move-exception v0

    .line 276
    .end local v14    # "backOffTime":J
    :cond_5
    :goto_3
    nop

    .end local v9    # "batchContent":Lcom/google/api/client/http/MultipartContent;
    .end local v10    # "response":Lcom/google/api/client/http/HttpResponse;
    .end local v11    # "contentId":I
    .end local v12    # "unsuccessfulRequestInfos":Ljava/util/List;, "Ljava/util/List<Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<**>;>;"
    .end local v13    # "batchResponse":Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;
    add-int/lit8 v7, v7, -0x1

    .line 277
    if-nez v8, :cond_1

    .line 278
    :cond_6
    iget-object v0, v1, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 279
    return-void

    .line 256
    .restart local v9    # "batchContent":Lcom/google/api/client/http/MultipartContent;
    .restart local v10    # "response":Lcom/google/api/client/http/HttpResponse;
    .restart local v11    # "contentId":I
    :catchall_0
    move-exception v0

    invoke-virtual {v10}, Lcom/google/api/client/http/HttpResponse;->disconnect()V

    .line 257
    throw v0
.end method

.method public getBatchUrl()Lcom/google/api/client/http/GenericUrl;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->batchUrl:Lcom/google/api/client/http/GenericUrl;

    return-object v0
.end method

.method public getSleeper()Lcom/google/api/client/util/Sleeper;
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->sleeper:Lcom/google/api/client/util/Sleeper;

    return-object v0
.end method

.method public queue(Lcom/google/api/client/http/HttpRequest;Ljava/lang/Class;Ljava/lang/Class;Lcom/google/api/client/googleapis/batch/BatchCallback;)Lcom/google/api/client/googleapis/batch/BatchRequest;
    .locals 2
    .param p1, "httpRequest"    # Lcom/google/api/client/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "E:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/api/client/http/HttpRequest;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TE;>;",
            "Lcom/google/api/client/googleapis/batch/BatchCallback<",
            "TT;TE;>;)",
            "Lcom/google/api/client/googleapis/batch/BatchRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 189
    .local p2, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "errorClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p4, "callback":Lcom/google/api/client/googleapis/batch/BatchCallback;, "Lcom/google/api/client/googleapis/batch/BatchCallback<TT;TE;>;"
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    invoke-static {p4}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    invoke-static {p2}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    invoke-static {p3}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    iget-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestInfos:Ljava/util/List;

    new-instance v1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;

    invoke-direct {v1, p4, p2, p3, p1}, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;-><init>(Lcom/google/api/client/googleapis/batch/BatchCallback;Ljava/lang/Class;Ljava/lang/Class;Lcom/google/api/client/http/HttpRequest;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    return-object p0
.end method

.method public setBatchUrl(Lcom/google/api/client/http/GenericUrl;)Lcom/google/api/client/googleapis/batch/BatchRequest;
    .locals 0
    .param p1, "batchUrl"    # Lcom/google/api/client/http/GenericUrl;

    .line 144
    iput-object p1, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->batchUrl:Lcom/google/api/client/http/GenericUrl;

    .line 145
    return-object p0
.end method

.method public setSleeper(Lcom/google/api/client/util/Sleeper;)Lcom/google/api/client/googleapis/batch/BatchRequest;
    .locals 1
    .param p1, "sleeper"    # Lcom/google/api/client/util/Sleeper;

    .line 168
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/util/Sleeper;

    iput-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->sleeper:Lcom/google/api/client/util/Sleeper;

    .line 169
    return-object p0
.end method

.method public size()I
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchRequest;->requestInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
