.class final Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;
.super Ljava/lang/Object;
.source "BatchUnparsedResponse.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse$FakeLowLevelHttpResponse;,
        Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse$FakeLowLevelHttpRequest;,
        Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse$FakeResponseHttpTransport;
    }
.end annotation


# instance fields
.field backOffRequired:Z

.field private final boundary:Ljava/lang/String;

.field private contentId:I

.field hasNext:Z

.field private final inputStream:Ljava/io/InputStream;

.field private final requestInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<",
            "**>;>;"
        }
    .end annotation
.end field

.field private final retryAllowed:Z

.field unsuccessfulRequestInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<",
            "**>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Ljava/util/List;Z)V
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "boundary"    # Ljava/lang/String;
    .param p4, "retryAllowed"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<",
            "**>;>;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    .local p3, "requestInfos":Ljava/util/List;, "Ljava/util/List<Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<**>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->hasNext:Z

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->unsuccessfulRequestInfos:Ljava/util/List;

    .line 67
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->contentId:I

    .line 83
    iput-object p2, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->boundary:Ljava/lang/String;

    .line 84
    iput-object p3, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->requestInfos:Ljava/util/List;

    .line 85
    iput-boolean p4, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->retryAllowed:Z

    .line 86
    iput-object p1, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->inputStream:Ljava/io/InputStream;

    .line 88
    invoke-direct {p0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->readLine()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->checkForFinalBoundary(Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method private checkForFinalBoundary(Ljava/lang/String;)V
    .locals 2
    .param p1, "boundaryLine"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 309
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->boundary:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "--"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 310
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->hasNext:Z

    .line 311
    iget-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 313
    :cond_0
    return-void
.end method

.method private getFakeResponse(ILjava/io/InputStream;Ljava/util/List;Ljava/util/List;)Lcom/google/api/client/http/HttpResponse;
    .locals 3
    .param p1, "statusCode"    # I
    .param p2, "partContent"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/io/InputStream;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/client/http/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 242
    .local p3, "headerNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "headerValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse$FakeResponseHttpTransport;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse$FakeResponseHttpTransport;-><init>(ILjava/io/InputStream;Ljava/util/List;Ljava/util/List;)V

    .line 243
    invoke-virtual {v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse$FakeResponseHttpTransport;->createRequestFactory()Lcom/google/api/client/http/HttpRequestFactory;

    move-result-object v0

    new-instance v1, Lcom/google/api/client/http/GenericUrl;

    const-string v2, "http://google.com/"

    invoke-direct {v1, v2}, Lcom/google/api/client/http/GenericUrl;-><init>(Ljava/lang/String;)V

    .line 244
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/google/api/client/http/HttpRequestFactory;->buildPostRequest(Lcom/google/api/client/http/GenericUrl;Lcom/google/api/client/http/HttpContent;)Lcom/google/api/client/http/HttpRequest;

    move-result-object v0

    .line 245
    .local v0, "request":Lcom/google/api/client/http/HttpRequest;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/api/client/http/HttpRequest;->setLoggingEnabled(Z)Lcom/google/api/client/http/HttpRequest;

    .line 246
    invoke-virtual {v0, v1}, Lcom/google/api/client/http/HttpRequest;->setThrowExceptionOnExecuteError(Z)Lcom/google/api/client/http/HttpRequest;

    .line 247
    invoke-virtual {v0}, Lcom/google/api/client/http/HttpRequest;->execute()Lcom/google/api/client/http/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method private getParsedDataClass(Ljava/lang/Class;Lcom/google/api/client/http/HttpResponse;Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;)Ljava/lang/Object;
    .locals 3
    .param p2, "response"    # Lcom/google/api/client/http/HttpResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            "E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TA;>;",
            "Lcom/google/api/client/http/HttpResponse;",
            "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<",
            "TT;TE;>;)TA;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 231
    .local p1, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<TA;>;"
    .local p3, "requestInfo":Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;, "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<TT;TE;>;"
    const-class v0, Ljava/lang/Void;

    if-ne p1, v0, :cond_0

    .line 232
    const/4 v0, 0x0

    return-object v0

    .line 234
    :cond_0
    iget-object v0, p3, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->request:Lcom/google/api/client/http/HttpRequest;

    invoke-virtual {v0}, Lcom/google/api/client/http/HttpRequest;->getParser()Lcom/google/api/client/util/ObjectParser;

    move-result-object v0

    .line 235
    invoke-virtual {p2}, Lcom/google/api/client/http/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {p2}, Lcom/google/api/client/http/HttpResponse;->getContentCharset()Ljava/nio/charset/Charset;

    move-result-object v2

    .line 234
    invoke-interface {v0, v1, v2, p1}, Lcom/google/api/client/util/ObjectParser;->parseAndClose(Ljava/io/InputStream;Ljava/nio/charset/Charset;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private parseAndCallback(Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;ILcom/google/api/client/http/HttpResponse;)V
    .locals 12
    .param p2, "statusCode"    # I
    .param p3, "response"    # Lcom/google/api/client/http/HttpResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "E:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<",
            "TT;TE;>;I",
            "Lcom/google/api/client/http/HttpResponse;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 181
    .local p1, "requestInfo":Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;, "Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo<TT;TE;>;"
    iget-object v0, p1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->callback:Lcom/google/api/client/googleapis/batch/BatchCallback;

    .line 183
    .local v0, "callback":Lcom/google/api/client/googleapis/batch/BatchCallback;, "Lcom/google/api/client/googleapis/batch/BatchCallback<TT;TE;>;"
    invoke-virtual {p3}, Lcom/google/api/client/http/HttpResponse;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v1

    .line 184
    .local v1, "responseHeaders":Lcom/google/api/client/http/HttpHeaders;
    iget-object v2, p1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->request:Lcom/google/api/client/http/HttpRequest;

    .line 185
    invoke-virtual {v2}, Lcom/google/api/client/http/HttpRequest;->getUnsuccessfulResponseHandler()Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;

    move-result-object v2

    .line 186
    .local v2, "unsuccessfulResponseHandler":Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;
    iget-object v3, p1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->request:Lcom/google/api/client/http/HttpRequest;

    invoke-virtual {v3}, Lcom/google/api/client/http/HttpRequest;->getBackOffPolicy()Lcom/google/api/client/http/BackOffPolicy;

    move-result-object v3

    .line 189
    .local v3, "backOffPolicy":Lcom/google/api/client/http/BackOffPolicy;
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->backOffRequired:Z

    .line 191
    invoke-static {p2}, Lcom/google/api/client/http/HttpStatusCodes;->isSuccess(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 192
    if-nez v0, :cond_0

    .line 194
    return-void

    .line 196
    :cond_0
    iget-object v4, p1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->dataClass:Ljava/lang/Class;

    invoke-direct {p0, v4, p3, p1}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->getParsedDataClass(Ljava/lang/Class;Lcom/google/api/client/http/HttpResponse;Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;)Ljava/lang/Object;

    move-result-object v4

    .line 197
    .local v4, "parsed":Ljava/lang/Object;, "TT;"
    invoke-interface {v0, v4, v1}, Lcom/google/api/client/googleapis/batch/BatchCallback;->onSuccess(Ljava/lang/Object;Lcom/google/api/client/http/HttpHeaders;)V

    .line 198
    .end local v4    # "parsed":Ljava/lang/Object;, "TT;"
    goto :goto_1

    .line 199
    :cond_1
    iget-object v5, p1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->request:Lcom/google/api/client/http/HttpRequest;

    invoke-virtual {v5}, Lcom/google/api/client/http/HttpRequest;->getContent()Lcom/google/api/client/http/HttpContent;

    move-result-object v5

    .line 200
    .local v5, "content":Lcom/google/api/client/http/HttpContent;
    iget-boolean v6, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->retryAllowed:Z

    const/4 v7, 0x1

    if-eqz v6, :cond_3

    if-eqz v5, :cond_2

    invoke-interface {v5}, Lcom/google/api/client/http/HttpContent;->retrySupported()Z

    move-result v6

    if-eqz v6, :cond_3

    :cond_2
    move v4, v7

    .line 201
    .local v4, "retrySupported":Z
    :cond_3
    const/4 v6, 0x0

    .line 202
    .local v6, "errorHandled":Z
    const/4 v8, 0x0

    .line 203
    .local v8, "redirectRequest":Z
    if-eqz v2, :cond_4

    .line 204
    iget-object v9, p1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->request:Lcom/google/api/client/http/HttpRequest;

    invoke-interface {v2, v9, p3, v4}, Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;->handleResponse(Lcom/google/api/client/http/HttpRequest;Lcom/google/api/client/http/HttpResponse;Z)Z

    move-result v6

    .line 207
    :cond_4
    if-nez v6, :cond_6

    .line 208
    iget-object v9, p1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->request:Lcom/google/api/client/http/HttpRequest;

    invoke-virtual {p3}, Lcom/google/api/client/http/HttpResponse;->getStatusCode()I

    move-result v10

    invoke-virtual {p3}, Lcom/google/api/client/http/HttpResponse;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/google/api/client/http/HttpRequest;->handleRedirect(ILcom/google/api/client/http/HttpHeaders;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 209
    const/4 v8, 0x1

    goto :goto_0

    .line 210
    :cond_5
    if-eqz v4, :cond_6

    if-eqz v3, :cond_6

    .line 211
    invoke-virtual {p3}, Lcom/google/api/client/http/HttpResponse;->getStatusCode()I

    move-result v9

    invoke-interface {v3, v9}, Lcom/google/api/client/http/BackOffPolicy;->isBackOffRequired(I)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 212
    iput-boolean v7, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->backOffRequired:Z

    .line 215
    :cond_6
    :goto_0
    if-eqz v4, :cond_8

    if-nez v6, :cond_7

    iget-boolean v7, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->backOffRequired:Z

    if-nez v7, :cond_7

    if-eqz v8, :cond_8

    .line 216
    :cond_7
    iget-object v7, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->unsuccessfulRequestInfos:Ljava/util/List;

    invoke-interface {v7, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 218
    :cond_8
    if-nez v0, :cond_9

    .line 220
    return-void

    .line 222
    :cond_9
    iget-object v7, p1, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;->errorClass:Ljava/lang/Class;

    invoke-direct {p0, v7, p3, p1}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->getParsedDataClass(Ljava/lang/Class;Lcom/google/api/client/http/HttpResponse;Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;)Ljava/lang/Object;

    move-result-object v7

    .line 223
    .local v7, "parsed":Ljava/lang/Object;, "TE;"
    invoke-interface {v0, v7, v1}, Lcom/google/api/client/googleapis/batch/BatchCallback;->onFailure(Ljava/lang/Object;Lcom/google/api/client/http/HttpHeaders;)V

    .line 226
    .end local v4    # "retrySupported":Z
    .end local v5    # "content":Lcom/google/api/client/http/HttpContent;
    .end local v6    # "errorHandled":Z
    .end local v7    # "parsed":Ljava/lang/Object;, "TE;"
    .end local v8    # "redirectRequest":Z
    :goto_1
    return-void
.end method

.method private readLine()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 280
    invoke-direct {p0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->readRawLine()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->trimCrlf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private readRawLine()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 256
    iget-object v0, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 257
    .local v0, "b":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 258
    const/4 v1, 0x0

    return-object v1

    .line 260
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .local v2, "buffer":Ljava/lang/StringBuilder;
    :goto_0
    if-eq v0, v1, :cond_2

    .line 262
    int-to-char v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 263
    const/16 v3, 0xa

    if-ne v0, v3, :cond_1

    .line 264
    goto :goto_1

    .line 261
    :cond_1
    iget-object v3, p0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v0

    goto :goto_0

    .line 267
    :cond_2
    :goto_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static trimCrlf([B)Ljava/io/InputStream;
    .locals 3
    .param p0, "bytes"    # [B

    .line 294
    array-length v0, p0

    .line 295
    .local v0, "length":I
    if-lez v0, :cond_0

    add-int/lit8 v1, v0, -0x1

    aget-byte v1, p0, v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    .line 296
    add-int/lit8 v0, v0, -0x1

    .line 298
    :cond_0
    if-lez v0, :cond_1

    add-int/lit8 v1, v0, -0x1

    aget-byte v1, p0, v1

    const/16 v2, 0xd

    if-ne v1, v2, :cond_1

    .line 299
    add-int/lit8 v0, v0, -0x1

    .line 301
    :cond_1
    new-instance v1, Ljava/io/ByteArrayInputStream;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    return-object v1
.end method

.method private static trimCrlf(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "input"    # Ljava/lang/String;

    .line 284
    const-string v0, "\r\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 285
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 286
    :cond_0
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 287
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 289
    :cond_1
    return-object p0
.end method


# virtual methods
.method parseNextResponse()V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->contentId:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, v0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->contentId:I

    .line 103
    :goto_0
    invoke-direct {v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->readLine()Ljava/lang/String;

    move-result-object v1

    move-object v3, v1

    .local v3, "line":Ljava/lang/String;
    const-string v4, ""

    if-eqz v1, :cond_0

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 108
    :cond_0
    invoke-direct {v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "statusLine":Ljava/lang/String;
    const-string v5, " "

    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 110
    .local v5, "statusParts":[Ljava/lang/String;
    aget-object v6, v5, v2

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 115
    .local v6, "statusCode":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .local v7, "headerNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .local v8, "headerValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-wide/16 v9, -0x1

    .line 118
    .local v9, "contentLength":J
    :goto_1
    invoke-direct {v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->readLine()Ljava/lang/String;

    move-result-object v11

    move-object v3, v11

    if-eqz v11, :cond_2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 119
    const-string v11, ": "

    const/4 v12, 0x2

    invoke-virtual {v3, v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v11

    .line 120
    .local v11, "headerParts":[Ljava/lang/String;
    const/4 v12, 0x0

    aget-object v12, v11, v12

    .line 121
    .local v12, "headerName":Ljava/lang/String;
    aget-object v13, v11, v2

    .line 122
    .local v13, "headerValue":Ljava/lang/String;
    invoke-interface {v7, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    invoke-interface {v8, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    const-string v14, "Content-Length"

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 125
    invoke-static {v13}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    .line 127
    .end local v11    # "headerParts":[Ljava/lang/String;
    .end local v12    # "headerName":Ljava/lang/String;
    .end local v13    # "headerValue":Ljava/lang/String;
    :cond_1
    goto :goto_1

    .line 130
    :cond_2
    const-wide/16 v11, -0x1

    cmp-long v4, v9, v11

    if-nez v4, :cond_4

    .line 132
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 133
    .local v4, "buffer":Ljava/io/ByteArrayOutputStream;
    :goto_2
    invoke-direct {v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->readRawLine()Ljava/lang/String;

    move-result-object v13

    move-object v3, v13

    if-eqz v13, :cond_3

    iget-object v13, v0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->boundary:Ljava/lang/String;

    invoke-virtual {v3, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_3

    .line 135
    const-string v13, "ISO-8859-1"

    invoke-virtual {v3, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v13

    invoke-virtual {v4, v13}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_2

    .line 139
    :cond_3
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    invoke-static {v13}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->trimCrlf([B)Ljava/io/InputStream;

    move-result-object v13

    .line 142
    .local v13, "body":Ljava/io/InputStream;
    invoke-static {v3}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->trimCrlf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 143
    .end local v4    # "buffer":Ljava/io/ByteArrayOutputStream;
    goto :goto_3

    .line 144
    .end local v13    # "body":Ljava/io/InputStream;
    :cond_4
    new-instance v4, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse$1;

    iget-object v13, v0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->inputStream:Ljava/io/InputStream;

    invoke-static {v13, v9, v10}, Lcom/google/api/client/util/ByteStreams;->limit(Ljava/io/InputStream;J)Ljava/io/InputStream;

    move-result-object v13

    invoke-direct {v4, v0, v13}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse$1;-><init>(Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;Ljava/io/InputStream;)V

    move-object v13, v4

    .line 152
    .restart local v13    # "body":Ljava/io/InputStream;
    :goto_3
    nop

    .line 153
    invoke-direct {v0, v6, v13, v7, v8}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->getFakeResponse(ILjava/io/InputStream;Ljava/util/List;Ljava/util/List;)Lcom/google/api/client/http/HttpResponse;

    move-result-object v4

    .line 155
    .local v4, "response":Lcom/google/api/client/http/HttpResponse;
    iget-object v14, v0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->requestInfos:Ljava/util/List;

    iget v15, v0, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->contentId:I

    sub-int/2addr v15, v2

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;

    invoke-direct {v0, v2, v6, v4}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->parseAndCallback(Lcom/google/api/client/googleapis/batch/BatchRequest$RequestInfo;ILcom/google/api/client/http/HttpResponse;)V

    .line 158
    :cond_5
    :goto_4
    invoke-virtual {v13, v9, v10}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v2, v14, v16

    if-gtz v2, :cond_5

    invoke-virtual {v13}, Ljava/io/InputStream;->read()I

    move-result v2

    const/4 v14, -0x1

    if-eq v2, v14, :cond_6

    goto :goto_4

    .line 161
    :cond_6
    cmp-long v2, v9, v11

    if-eqz v2, :cond_7

    .line 162
    invoke-direct {v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 167
    :cond_7
    :goto_5
    if-eqz v3, :cond_8

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_8

    .line 168
    invoke-direct {v0}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->readLine()Ljava/lang/String;

    move-result-object v3

    goto :goto_5

    .line 171
    :cond_8
    invoke-direct {v0, v3}, Lcom/google/api/client/googleapis/batch/BatchUnparsedResponse;->checkForFinalBoundary(Ljava/lang/String;)V

    .line 172
    return-void
.end method
