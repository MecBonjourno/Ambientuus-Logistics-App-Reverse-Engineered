.class public final Lcom/google/api/client/http/HttpRequest;
.super Ljava/lang/Object;
.source "HttpRequest.java"


# static fields
.field public static final DEFAULT_NUMBER_OF_RETRIES:I = 0xa

.field public static final USER_AGENT_SUFFIX:Ljava/lang/String; = "Google-HTTP-Java-Client/1.26.0 (gzip)"

.field public static final VERSION:Ljava/lang/String; = "1.26.0"


# instance fields
.field private backOffPolicy:Lcom/google/api/client/http/BackOffPolicy;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private connectTimeout:I

.field private content:Lcom/google/api/client/http/HttpContent;

.field private contentLoggingLimit:I

.field private curlLoggingEnabled:Z

.field private encoding:Lcom/google/api/client/http/HttpEncoding;

.field private executeInterceptor:Lcom/google/api/client/http/HttpExecuteInterceptor;

.field private followRedirects:Z

.field private headers:Lcom/google/api/client/http/HttpHeaders;

.field private ioExceptionHandler:Lcom/google/api/client/http/HttpIOExceptionHandler;

.field private loggingEnabled:Z

.field private numRetries:I

.field private objectParser:Lcom/google/api/client/util/ObjectParser;

.field private readTimeout:I

.field private requestMethod:Ljava/lang/String;

.field private responseHeaders:Lcom/google/api/client/http/HttpHeaders;

.field private responseInterceptor:Lcom/google/api/client/http/HttpResponseInterceptor;

.field private retryOnExecuteIOException:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private sleeper:Lcom/google/api/client/util/Sleeper;

.field private suppressUserAgentSuffix:Z

.field private throwExceptionOnExecuteError:Z

.field private final transport:Lcom/google/api/client/http/HttpTransport;

.field private unsuccessfulResponseHandler:Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;

.field private url:Lcom/google/api/client/http/GenericUrl;


# direct methods
.method constructor <init>(Lcom/google/api/client/http/HttpTransport;Ljava/lang/String;)V
    .locals 2
    .param p1, "transport"    # Lcom/google/api/client/http/HttpTransport;
    .param p2, "requestMethod"    # Ljava/lang/String;

    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Lcom/google/api/client/http/HttpHeaders;

    invoke-direct {v0}, Lcom/google/api/client/http/HttpHeaders;-><init>()V

    iput-object v0, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    .line 102
    new-instance v0, Lcom/google/api/client/http/HttpHeaders;

    invoke-direct {v0}, Lcom/google/api/client/http/HttpHeaders;-><init>()V

    iput-object v0, p0, Lcom/google/api/client/http/HttpRequest;->responseHeaders:Lcom/google/api/client/http/HttpHeaders;

    .line 110
    const/16 v0, 0xa

    iput v0, p0, Lcom/google/api/client/http/HttpRequest;->numRetries:I

    .line 132
    const/16 v0, 0x4000

    iput v0, p0, Lcom/google/api/client/http/HttpRequest;->contentLoggingLimit:I

    .line 135
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->loggingEnabled:Z

    .line 138
    iput-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->curlLoggingEnabled:Z

    .line 153
    const/16 v1, 0x4e20

    iput v1, p0, Lcom/google/api/client/http/HttpRequest;->connectTimeout:I

    .line 159
    iput v1, p0, Lcom/google/api/client/http/HttpRequest;->readTimeout:I

    .line 185
    iput-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->followRedirects:Z

    .line 191
    iput-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->throwExceptionOnExecuteError:Z

    .line 197
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->retryOnExecuteIOException:Z

    .line 211
    sget-object v0, Lcom/google/api/client/util/Sleeper;->DEFAULT:Lcom/google/api/client/util/Sleeper;

    iput-object v0, p0, Lcom/google/api/client/http/HttpRequest;->sleeper:Lcom/google/api/client/util/Sleeper;

    .line 218
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->transport:Lcom/google/api/client/http/HttpTransport;

    .line 219
    invoke-virtual {p0, p2}, Lcom/google/api/client/http/HttpRequest;->setRequestMethod(Ljava/lang/String;)Lcom/google/api/client/http/HttpRequest;

    .line 220
    return-void
.end method


# virtual methods
.method public execute()Lcom/google/api/client/http/HttpResponse;
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 844
    move-object/from16 v1, p0

    const/4 v0, 0x0

    .line 845
    .local v0, "retryRequest":Z
    iget v2, v1, Lcom/google/api/client/http/HttpRequest;->numRetries:I

    if-ltz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v2}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 846
    iget v2, v1, Lcom/google/api/client/http/HttpRequest;->numRetries:I

    .line 847
    .local v2, "retriesRemaining":I
    iget-object v5, v1, Lcom/google/api/client/http/HttpRequest;->backOffPolicy:Lcom/google/api/client/http/BackOffPolicy;

    if-eqz v5, :cond_1

    .line 849
    iget-object v5, v1, Lcom/google/api/client/http/HttpRequest;->backOffPolicy:Lcom/google/api/client/http/BackOffPolicy;

    invoke-interface {v5}, Lcom/google/api/client/http/BackOffPolicy;->reset()V

    .line 851
    :cond_1
    const/4 v5, 0x0

    .line 854
    .local v5, "response":Lcom/google/api/client/http/HttpResponse;
    iget-object v6, v1, Lcom/google/api/client/http/HttpRequest;->requestMethod:Ljava/lang/String;

    invoke-static {v6}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 855
    iget-object v6, v1, Lcom/google/api/client/http/HttpRequest;->url:Lcom/google/api/client/http/GenericUrl;

    invoke-static {v6}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 859
    :goto_1
    if-eqz v5, :cond_2

    .line 860
    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->ignore()V

    .line 863
    :cond_2
    const/4 v5, 0x0

    .line 864
    const/4 v6, 0x0

    .line 867
    .local v6, "executeException":Ljava/io/IOException;
    iget-object v7, v1, Lcom/google/api/client/http/HttpRequest;->executeInterceptor:Lcom/google/api/client/http/HttpExecuteInterceptor;

    if-eqz v7, :cond_3

    .line 868
    iget-object v7, v1, Lcom/google/api/client/http/HttpRequest;->executeInterceptor:Lcom/google/api/client/http/HttpExecuteInterceptor;

    invoke-interface {v7, v1}, Lcom/google/api/client/http/HttpExecuteInterceptor;->intercept(Lcom/google/api/client/http/HttpRequest;)V

    .line 871
    :cond_3
    iget-object v7, v1, Lcom/google/api/client/http/HttpRequest;->url:Lcom/google/api/client/http/GenericUrl;

    invoke-virtual {v7}, Lcom/google/api/client/http/GenericUrl;->build()Ljava/lang/String;

    move-result-object v7

    .line 872
    .local v7, "urlString":Ljava/lang/String;
    iget-object v8, v1, Lcom/google/api/client/http/HttpRequest;->transport:Lcom/google/api/client/http/HttpTransport;

    iget-object v9, v1, Lcom/google/api/client/http/HttpRequest;->requestMethod:Ljava/lang/String;

    invoke-virtual {v8, v9, v7}, Lcom/google/api/client/http/HttpTransport;->buildRequest(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/LowLevelHttpRequest;

    move-result-object v8

    .line 873
    .local v8, "lowLevelHttpRequest":Lcom/google/api/client/http/LowLevelHttpRequest;
    sget-object v9, Lcom/google/api/client/http/HttpTransport;->LOGGER:Ljava/util/logging/Logger;

    .line 874
    .local v9, "logger":Ljava/util/logging/Logger;
    iget-boolean v10, v1, Lcom/google/api/client/http/HttpRequest;->loggingEnabled:Z

    if-eqz v10, :cond_4

    sget-object v10, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v10

    if-eqz v10, :cond_4

    const/4 v10, 0x1

    goto :goto_2

    :cond_4
    const/4 v10, 0x0

    .line 875
    .local v10, "loggable":Z
    :goto_2
    const/4 v11, 0x0

    .line 876
    .local v11, "logbuf":Ljava/lang/StringBuilder;
    const/4 v12, 0x0

    .line 878
    .local v12, "curlbuf":Ljava/lang/StringBuilder;
    if-eqz v10, :cond_5

    .line 879
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object v11, v13

    .line 880
    const-string v13, "-------------- REQUEST  --------------"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Lcom/google/api/client/util/StringUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 881
    iget-object v13, v1, Lcom/google/api/client/http/HttpRequest;->requestMethod:Ljava/lang/String;

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 882
    const/16 v14, 0x20

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Lcom/google/api/client/util/StringUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 885
    iget-boolean v13, v1, Lcom/google/api/client/http/HttpRequest;->curlLoggingEnabled:Z

    if-eqz v13, :cond_5

    .line 886
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "curl -v --compressed"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v12, v13

    .line 887
    iget-object v13, v1, Lcom/google/api/client/http/HttpRequest;->requestMethod:Ljava/lang/String;

    const-string v14, "GET"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 888
    const-string v13, " -X "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v1, Lcom/google/api/client/http/HttpRequest;->requestMethod:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 893
    :cond_5
    iget-object v13, v1, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-virtual {v13}, Lcom/google/api/client/http/HttpHeaders;->getUserAgent()Ljava/lang/String;

    move-result-object v13

    .line 894
    .local v13, "originalUserAgent":Ljava/lang/String;
    iget-boolean v14, v1, Lcom/google/api/client/http/HttpRequest;->suppressUserAgentSuffix:Z

    if-nez v14, :cond_7

    .line 895
    const-string v14, "Google-HTTP-Java-Client/1.26.0 (gzip)"

    if-nez v13, :cond_6

    .line 896
    iget-object v15, v1, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-virtual {v15, v14}, Lcom/google/api/client/http/HttpHeaders;->setUserAgent(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    goto :goto_3

    .line 898
    :cond_6
    iget-object v15, v1, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Lcom/google/api/client/http/HttpHeaders;->setUserAgent(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 902
    :cond_7
    :goto_3
    iget-object v3, v1, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-static {v3, v11, v12, v9, v8}, Lcom/google/api/client/http/HttpHeaders;->serializeHeaders(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/util/logging/Logger;Lcom/google/api/client/http/LowLevelHttpRequest;)V

    .line 903
    iget-boolean v3, v1, Lcom/google/api/client/http/HttpRequest;->suppressUserAgentSuffix:Z

    if-nez v3, :cond_8

    .line 905
    iget-object v3, v1, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-virtual {v3, v13}, Lcom/google/api/client/http/HttpHeaders;->setUserAgent(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 909
    :cond_8
    iget-object v3, v1, Lcom/google/api/client/http/HttpRequest;->content:Lcom/google/api/client/http/HttpContent;

    .line 910
    .local v3, "streamingContent":Lcom/google/api/client/util/StreamingContent;
    if-eqz v3, :cond_a

    iget-object v4, v1, Lcom/google/api/client/http/HttpRequest;->content:Lcom/google/api/client/http/HttpContent;

    invoke-interface {v4}, Lcom/google/api/client/http/HttpContent;->retrySupported()Z

    move-result v4

    if-eqz v4, :cond_9

    goto :goto_4

    :cond_9
    const/4 v4, 0x0

    goto :goto_5

    :cond_a
    :goto_4
    const/4 v4, 0x1

    .line 911
    .local v4, "contentRetrySupported":Z
    :goto_5
    const-wide/16 v16, -0x1

    const-string v14, "\'"

    if-eqz v3, :cond_14

    .line 914
    iget-object v15, v1, Lcom/google/api/client/http/HttpRequest;->content:Lcom/google/api/client/http/HttpContent;

    invoke-interface {v15}, Lcom/google/api/client/http/HttpContent;->getType()Ljava/lang/String;

    move-result-object v15

    .line 916
    .local v15, "contentType":Ljava/lang/String;
    if-eqz v10, :cond_b

    .line 917
    move/from16 v18, v0

    .end local v0    # "retryRequest":Z
    .local v18, "retryRequest":Z
    new-instance v0, Lcom/google/api/client/util/LoggingStreamingContent;

    move/from16 v19, v2

    .end local v2    # "retriesRemaining":I
    .local v19, "retriesRemaining":I
    sget-object v2, Lcom/google/api/client/http/HttpTransport;->LOGGER:Ljava/util/logging/Logger;

    move/from16 v20, v4

    .end local v4    # "contentRetrySupported":Z
    .local v20, "contentRetrySupported":Z
    sget-object v4, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    move-object/from16 v21, v5

    .end local v5    # "response":Lcom/google/api/client/http/HttpResponse;
    .local v21, "response":Lcom/google/api/client/http/HttpResponse;
    iget v5, v1, Lcom/google/api/client/http/HttpRequest;->contentLoggingLimit:I

    invoke-direct {v0, v3, v2, v4, v5}, Lcom/google/api/client/util/LoggingStreamingContent;-><init>(Lcom/google/api/client/util/StreamingContent;Ljava/util/logging/Logger;Ljava/util/logging/Level;I)V

    move-object v3, v0

    goto :goto_6

    .line 916
    .end local v18    # "retryRequest":Z
    .end local v19    # "retriesRemaining":I
    .end local v20    # "contentRetrySupported":Z
    .end local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    .restart local v0    # "retryRequest":Z
    .restart local v2    # "retriesRemaining":I
    .restart local v4    # "contentRetrySupported":Z
    .restart local v5    # "response":Lcom/google/api/client/http/HttpResponse;
    :cond_b
    move/from16 v18, v0

    move/from16 v19, v2

    move/from16 v20, v4

    move-object/from16 v21, v5

    .line 921
    .end local v0    # "retryRequest":Z
    .end local v2    # "retriesRemaining":I
    .end local v4    # "contentRetrySupported":Z
    .end local v5    # "response":Lcom/google/api/client/http/HttpResponse;
    .restart local v18    # "retryRequest":Z
    .restart local v19    # "retriesRemaining":I
    .restart local v20    # "contentRetrySupported":Z
    .restart local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    :goto_6
    iget-object v0, v1, Lcom/google/api/client/http/HttpRequest;->encoding:Lcom/google/api/client/http/HttpEncoding;

    if-nez v0, :cond_c

    .line 922
    const/4 v0, 0x0

    .line 923
    .local v0, "contentEncoding":Ljava/lang/String;
    iget-object v2, v1, Lcom/google/api/client/http/HttpRequest;->content:Lcom/google/api/client/http/HttpContent;

    invoke-interface {v2}, Lcom/google/api/client/http/HttpContent;->getLength()J

    move-result-wide v4

    .local v4, "contentLength":J
    goto :goto_8

    .line 925
    .end local v0    # "contentEncoding":Ljava/lang/String;
    .end local v4    # "contentLength":J
    :cond_c
    iget-object v0, v1, Lcom/google/api/client/http/HttpRequest;->encoding:Lcom/google/api/client/http/HttpEncoding;

    invoke-interface {v0}, Lcom/google/api/client/http/HttpEncoding;->getName()Ljava/lang/String;

    move-result-object v0

    .line 926
    .restart local v0    # "contentEncoding":Ljava/lang/String;
    new-instance v2, Lcom/google/api/client/http/HttpEncodingStreamingContent;

    iget-object v4, v1, Lcom/google/api/client/http/HttpRequest;->encoding:Lcom/google/api/client/http/HttpEncoding;

    invoke-direct {v2, v3, v4}, Lcom/google/api/client/http/HttpEncodingStreamingContent;-><init>(Lcom/google/api/client/util/StreamingContent;Lcom/google/api/client/http/HttpEncoding;)V

    .line 927
    .end local v3    # "streamingContent":Lcom/google/api/client/util/StreamingContent;
    .local v2, "streamingContent":Lcom/google/api/client/util/StreamingContent;
    if-eqz v20, :cond_d

    invoke-static {v2}, Lcom/google/api/client/util/IOUtils;->computeLength(Lcom/google/api/client/util/StreamingContent;)J

    move-result-wide v3

    goto :goto_7

    :cond_d
    move-wide/from16 v3, v16

    :goto_7
    move-wide v4, v3

    move-object v3, v2

    .line 930
    .end local v2    # "streamingContent":Lcom/google/api/client/util/StreamingContent;
    .restart local v3    # "streamingContent":Lcom/google/api/client/util/StreamingContent;
    .restart local v4    # "contentLength":J
    :goto_8
    if-eqz v10, :cond_11

    .line 931
    const-string v2, " -H \'"

    if-eqz v15, :cond_e

    .line 932
    move-object/from16 v22, v6

    .end local v6    # "executeException":Ljava/io/IOException;
    .local v22, "executeException":Ljava/io/IOException;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v23, v10

    .end local v10    # "loggable":Z
    .local v23, "loggable":Z
    const-string v10, "Content-Type: "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 933
    .local v6, "header":Ljava/lang/String;
    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v24, v13

    .end local v13    # "originalUserAgent":Ljava/lang/String;
    .local v24, "originalUserAgent":Ljava/lang/String;
    sget-object v13, Lcom/google/api/client/util/StringUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 934
    if-eqz v12, :cond_f

    .line 935
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 931
    .end local v22    # "executeException":Ljava/io/IOException;
    .end local v23    # "loggable":Z
    .end local v24    # "originalUserAgent":Ljava/lang/String;
    .local v6, "executeException":Ljava/io/IOException;
    .restart local v10    # "loggable":Z
    .restart local v13    # "originalUserAgent":Ljava/lang/String;
    :cond_e
    move-object/from16 v22, v6

    move/from16 v23, v10

    move-object/from16 v24, v13

    .line 938
    .end local v6    # "executeException":Ljava/io/IOException;
    .end local v10    # "loggable":Z
    .end local v13    # "originalUserAgent":Ljava/lang/String;
    .restart local v22    # "executeException":Ljava/io/IOException;
    .restart local v23    # "loggable":Z
    .restart local v24    # "originalUserAgent":Ljava/lang/String;
    :cond_f
    :goto_9
    if-eqz v0, :cond_10

    .line 939
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Content-Encoding: "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 940
    .local v6, "header":Ljava/lang/String;
    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v13, Lcom/google/api/client/util/StringUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 941
    if-eqz v12, :cond_10

    .line 942
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    .end local v6    # "header":Ljava/lang/String;
    :cond_10
    const-wide/16 v25, 0x0

    cmp-long v2, v4, v25

    if-ltz v2, :cond_12

    .line 946
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Content-Length: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 947
    .local v2, "header":Ljava/lang/String;
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v10, Lcom/google/api/client/util/StringUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 930
    .end local v2    # "header":Ljava/lang/String;
    .end local v22    # "executeException":Ljava/io/IOException;
    .end local v23    # "loggable":Z
    .end local v24    # "originalUserAgent":Ljava/lang/String;
    .local v6, "executeException":Ljava/io/IOException;
    .restart local v10    # "loggable":Z
    .restart local v13    # "originalUserAgent":Ljava/lang/String;
    :cond_11
    move-object/from16 v22, v6

    move/from16 v23, v10

    move-object/from16 v24, v13

    .line 951
    .end local v6    # "executeException":Ljava/io/IOException;
    .end local v10    # "loggable":Z
    .end local v13    # "originalUserAgent":Ljava/lang/String;
    .restart local v22    # "executeException":Ljava/io/IOException;
    .restart local v23    # "loggable":Z
    .restart local v24    # "originalUserAgent":Ljava/lang/String;
    :cond_12
    :goto_a
    if-eqz v12, :cond_13

    .line 952
    const-string v2, " -d \'@-\'"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 955
    :cond_13
    invoke-virtual {v8, v15}, Lcom/google/api/client/http/LowLevelHttpRequest;->setContentType(Ljava/lang/String;)V

    .line 956
    invoke-virtual {v8, v0}, Lcom/google/api/client/http/LowLevelHttpRequest;->setContentEncoding(Ljava/lang/String;)V

    .line 957
    invoke-virtual {v8, v4, v5}, Lcom/google/api/client/http/LowLevelHttpRequest;->setContentLength(J)V

    .line 958
    invoke-virtual {v8, v3}, Lcom/google/api/client/http/LowLevelHttpRequest;->setStreamingContent(Lcom/google/api/client/util/StreamingContent;)V

    goto :goto_b

    .line 911
    .end local v15    # "contentType":Ljava/lang/String;
    .end local v18    # "retryRequest":Z
    .end local v19    # "retriesRemaining":I
    .end local v20    # "contentRetrySupported":Z
    .end local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    .end local v22    # "executeException":Ljava/io/IOException;
    .end local v23    # "loggable":Z
    .end local v24    # "originalUserAgent":Ljava/lang/String;
    .local v0, "retryRequest":Z
    .local v2, "retriesRemaining":I
    .local v4, "contentRetrySupported":Z
    .restart local v5    # "response":Lcom/google/api/client/http/HttpResponse;
    .restart local v6    # "executeException":Ljava/io/IOException;
    .restart local v10    # "loggable":Z
    .restart local v13    # "originalUserAgent":Ljava/lang/String;
    :cond_14
    move/from16 v18, v0

    move/from16 v19, v2

    move/from16 v20, v4

    move-object/from16 v21, v5

    move-object/from16 v22, v6

    move/from16 v23, v10

    move-object/from16 v24, v13

    .line 961
    .end local v0    # "retryRequest":Z
    .end local v2    # "retriesRemaining":I
    .end local v4    # "contentRetrySupported":Z
    .end local v5    # "response":Lcom/google/api/client/http/HttpResponse;
    .end local v6    # "executeException":Ljava/io/IOException;
    .end local v10    # "loggable":Z
    .end local v13    # "originalUserAgent":Ljava/lang/String;
    .restart local v18    # "retryRequest":Z
    .restart local v19    # "retriesRemaining":I
    .restart local v20    # "contentRetrySupported":Z
    .restart local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    .restart local v22    # "executeException":Ljava/io/IOException;
    .restart local v23    # "loggable":Z
    .restart local v24    # "originalUserAgent":Ljava/lang/String;
    :goto_b
    if-eqz v23, :cond_16

    .line 962
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/util/logging/Logger;->config(Ljava/lang/String;)V

    .line 963
    if-eqz v12, :cond_16

    .line 964
    const-string v0, " -- \'"

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 965
    const-string v0, "\'\"\'\"\'"

    invoke-virtual {v7, v14, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 966
    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 967
    if-eqz v3, :cond_15

    .line 968
    const-string v0, " << $$$"

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 970
    :cond_15
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/util/logging/Logger;->config(Ljava/lang/String;)V

    .line 976
    :cond_16
    if-eqz v20, :cond_17

    if-lez v19, :cond_17

    const/4 v0, 0x1

    goto :goto_c

    :cond_17
    const/4 v0, 0x0

    :goto_c
    move v2, v0

    .line 979
    .end local v18    # "retryRequest":Z
    .local v2, "retryRequest":Z
    iget v0, v1, Lcom/google/api/client/http/HttpRequest;->connectTimeout:I

    iget v4, v1, Lcom/google/api/client/http/HttpRequest;->readTimeout:I

    invoke-virtual {v8, v0, v4}, Lcom/google/api/client/http/LowLevelHttpRequest;->setTimeout(II)V

    .line 981
    :try_start_0
    invoke-virtual {v8}, Lcom/google/api/client/http/LowLevelHttpRequest;->execute()Lcom/google/api/client/http/LowLevelHttpResponse;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-object v4, v0

    .line 983
    .local v4, "lowLevelHttpResponse":Lcom/google/api/client/http/LowLevelHttpResponse;
    const/4 v5, 0x0

    .line 985
    .local v5, "responseConstructed":Z
    :try_start_1
    new-instance v0, Lcom/google/api/client/http/HttpResponse;

    invoke-direct {v0, v1, v4}, Lcom/google/api/client/http/HttpResponse;-><init>(Lcom/google/api/client/http/HttpRequest;Lcom/google/api/client/http/LowLevelHttpResponse;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v6, v0

    .line 986
    .end local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    .local v6, "response":Lcom/google/api/client/http/HttpResponse;
    const/4 v0, 0x1

    .line 988
    .end local v5    # "responseConstructed":Z
    .local v0, "responseConstructed":Z
    if-nez v0, :cond_19

    .line 989
    :try_start_2
    invoke-virtual {v4}, Lcom/google/api/client/http/LowLevelHttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 990
    .local v5, "lowLevelContent":Ljava/io/InputStream;
    if-eqz v5, :cond_18

    .line 991
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 993
    .end local v5    # "lowLevelContent":Ljava/io/InputStream;
    :cond_18
    goto :goto_d

    .line 995
    .end local v0    # "responseConstructed":Z
    .end local v4    # "lowLevelHttpResponse":Lcom/google/api/client/http/LowLevelHttpResponse;
    :catch_0
    move-exception v0

    move-object v5, v6

    goto :goto_e

    .line 1005
    :cond_19
    :goto_d
    move-object v5, v6

    move-object/from16 v6, v22

    goto :goto_10

    .line 988
    .end local v6    # "response":Lcom/google/api/client/http/HttpResponse;
    .restart local v4    # "lowLevelHttpResponse":Lcom/google/api/client/http/LowLevelHttpResponse;
    .local v5, "responseConstructed":Z
    .restart local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    :catchall_0
    move-exception v0

    if-nez v5, :cond_1a

    .line 989
    :try_start_3
    invoke-virtual {v4}, Lcom/google/api/client/http/LowLevelHttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v6

    .line 990
    .local v6, "lowLevelContent":Ljava/io/InputStream;
    if-eqz v6, :cond_1a

    .line 991
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 994
    .end local v6    # "lowLevelContent":Ljava/io/InputStream;
    :cond_1a
    nop

    .end local v2    # "retryRequest":Z
    .end local v3    # "streamingContent":Lcom/google/api/client/util/StreamingContent;
    .end local v7    # "urlString":Ljava/lang/String;
    .end local v8    # "lowLevelHttpRequest":Lcom/google/api/client/http/LowLevelHttpRequest;
    .end local v9    # "logger":Ljava/util/logging/Logger;
    .end local v11    # "logbuf":Ljava/lang/StringBuilder;
    .end local v12    # "curlbuf":Ljava/lang/StringBuilder;
    .end local v19    # "retriesRemaining":I
    .end local v20    # "contentRetrySupported":Z
    .end local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    .end local v22    # "executeException":Ljava/io/IOException;
    .end local v23    # "loggable":Z
    .end local v24    # "originalUserAgent":Ljava/lang/String;
    throw v0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 995
    .end local v4    # "lowLevelHttpResponse":Lcom/google/api/client/http/LowLevelHttpResponse;
    .end local v5    # "responseConstructed":Z
    .restart local v2    # "retryRequest":Z
    .restart local v3    # "streamingContent":Lcom/google/api/client/util/StreamingContent;
    .restart local v7    # "urlString":Ljava/lang/String;
    .restart local v8    # "lowLevelHttpRequest":Lcom/google/api/client/http/LowLevelHttpRequest;
    .restart local v9    # "logger":Ljava/util/logging/Logger;
    .restart local v11    # "logbuf":Ljava/lang/StringBuilder;
    .restart local v12    # "curlbuf":Ljava/lang/StringBuilder;
    .restart local v19    # "retriesRemaining":I
    .restart local v20    # "contentRetrySupported":Z
    .restart local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    .restart local v22    # "executeException":Ljava/io/IOException;
    .restart local v23    # "loggable":Z
    .restart local v24    # "originalUserAgent":Ljava/lang/String;
    :catch_1
    move-exception v0

    move-object/from16 v5, v21

    .line 996
    .end local v21    # "response":Lcom/google/api/client/http/HttpResponse;
    .local v0, "e":Ljava/io/IOException;
    .local v5, "response":Lcom/google/api/client/http/HttpResponse;
    :goto_e
    iget-boolean v4, v1, Lcom/google/api/client/http/HttpRequest;->retryOnExecuteIOException:Z

    if-nez v4, :cond_1c

    iget-object v4, v1, Lcom/google/api/client/http/HttpRequest;->ioExceptionHandler:Lcom/google/api/client/http/HttpIOExceptionHandler;

    if-eqz v4, :cond_1b

    iget-object v4, v1, Lcom/google/api/client/http/HttpRequest;->ioExceptionHandler:Lcom/google/api/client/http/HttpIOExceptionHandler;

    .line 997
    invoke-interface {v4, v1, v2}, Lcom/google/api/client/http/HttpIOExceptionHandler;->handleIOException(Lcom/google/api/client/http/HttpRequest;Z)Z

    move-result v4

    if-eqz v4, :cond_1b

    goto :goto_f

    .line 998
    :cond_1b
    throw v0

    .line 1001
    :cond_1c
    :goto_f
    move-object v6, v0

    .line 1002
    .end local v22    # "executeException":Ljava/io/IOException;
    .local v6, "executeException":Ljava/io/IOException;
    if-eqz v23, :cond_1d

    .line 1003
    sget-object v4, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v10, "exception thrown while executing request"

    invoke-virtual {v9, v4, v10, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1009
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1d
    :goto_10
    const/4 v4, 0x0

    .line 1011
    .local v4, "responseProcessed":Z
    if-eqz v5, :cond_23

    :try_start_4
    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->isSuccessStatusCode()Z

    move-result v0

    if-nez v0, :cond_23

    .line 1012
    const/4 v0, 0x0

    .line 1013
    .local v0, "errorHandled":Z
    iget-object v10, v1, Lcom/google/api/client/http/HttpRequest;->unsuccessfulResponseHandler:Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;

    if-eqz v10, :cond_1e

    .line 1017
    iget-object v10, v1, Lcom/google/api/client/http/HttpRequest;->unsuccessfulResponseHandler:Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;

    invoke-interface {v10, v1, v5, v2}, Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;->handleResponse(Lcom/google/api/client/http/HttpRequest;Lcom/google/api/client/http/HttpResponse;Z)Z

    move-result v10

    move v0, v10

    goto :goto_11

    .line 1013
    :cond_1e
    move v10, v0

    .line 1019
    .end local v0    # "errorHandled":Z
    .local v10, "errorHandled":Z
    :goto_11
    if-nez v10, :cond_20

    .line 1020
    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->getStatusCode()I

    move-result v0

    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v13

    invoke-virtual {v1, v0, v13}, Lcom/google/api/client/http/HttpRequest;->handleRedirect(ILcom/google/api/client/http/HttpHeaders;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 1022
    const/4 v10, 0x1

    goto :goto_13

    .line 1023
    :cond_1f
    if-eqz v2, :cond_20

    iget-object v0, v1, Lcom/google/api/client/http/HttpRequest;->backOffPolicy:Lcom/google/api/client/http/BackOffPolicy;

    if-eqz v0, :cond_20

    iget-object v0, v1, Lcom/google/api/client/http/HttpRequest;->backOffPolicy:Lcom/google/api/client/http/BackOffPolicy;

    .line 1024
    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->getStatusCode()I

    move-result v13

    invoke-interface {v0, v13}, Lcom/google/api/client/http/BackOffPolicy;->isBackOffRequired(I)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 1027
    iget-object v0, v1, Lcom/google/api/client/http/HttpRequest;->backOffPolicy:Lcom/google/api/client/http/BackOffPolicy;

    invoke-interface {v0}, Lcom/google/api/client/http/BackOffPolicy;->getNextBackOffMillis()J

    move-result-wide v13
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1028
    .local v13, "backOffTime":J
    cmp-long v0, v13, v16

    if-eqz v0, :cond_20

    .line 1030
    :try_start_5
    iget-object v0, v1, Lcom/google/api/client/http/HttpRequest;->sleeper:Lcom/google/api/client/util/Sleeper;

    invoke-interface {v0, v13, v14}, Lcom/google/api/client/util/Sleeper;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1033
    goto :goto_12

    .line 1031
    :catch_2
    move-exception v0

    .line 1034
    :goto_12
    const/4 v10, 0x1

    .line 1040
    .end local v13    # "backOffTime":J
    :cond_20
    :goto_13
    and-int/2addr v2, v10

    .line 1042
    if-eqz v2, :cond_21

    .line 1043
    :try_start_6
    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->ignore()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 1045
    .end local v10    # "errorHandled":Z
    :cond_21
    goto :goto_15

    .line 1055
    :catchall_1
    move-exception v0

    if-eqz v5, :cond_22

    if-nez v4, :cond_22

    .line 1056
    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->disconnect()V

    .line 1058
    :cond_22
    throw v0

    .line 1047
    :cond_23
    if-nez v5, :cond_24

    const/4 v0, 0x1

    goto :goto_14

    :cond_24
    const/4 v0, 0x0

    :goto_14
    and-int/2addr v0, v2

    move v2, v0

    .line 1051
    :goto_15
    add-int/lit8 v10, v19, -0x1

    .line 1053
    .end local v19    # "retriesRemaining":I
    .local v10, "retriesRemaining":I
    const/4 v0, 0x1

    .line 1055
    .end local v4    # "responseProcessed":Z
    .local v0, "responseProcessed":Z
    if-eqz v5, :cond_25

    if-nez v0, :cond_25

    .line 1056
    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->disconnect()V

    .line 1059
    .end local v0    # "responseProcessed":Z
    .end local v3    # "streamingContent":Lcom/google/api/client/util/StreamingContent;
    .end local v7    # "urlString":Ljava/lang/String;
    .end local v8    # "lowLevelHttpRequest":Lcom/google/api/client/http/LowLevelHttpRequest;
    .end local v9    # "logger":Ljava/util/logging/Logger;
    .end local v11    # "logbuf":Ljava/lang/StringBuilder;
    .end local v12    # "curlbuf":Ljava/lang/StringBuilder;
    .end local v20    # "contentRetrySupported":Z
    .end local v23    # "loggable":Z
    .end local v24    # "originalUserAgent":Ljava/lang/String;
    :cond_25
    if-nez v2, :cond_2a

    .line 1061
    if-eqz v5, :cond_29

    .line 1066
    iget-object v0, v1, Lcom/google/api/client/http/HttpRequest;->responseInterceptor:Lcom/google/api/client/http/HttpResponseInterceptor;

    if-eqz v0, :cond_26

    .line 1067
    iget-object v0, v1, Lcom/google/api/client/http/HttpRequest;->responseInterceptor:Lcom/google/api/client/http/HttpResponseInterceptor;

    invoke-interface {v0, v5}, Lcom/google/api/client/http/HttpResponseInterceptor;->interceptResponse(Lcom/google/api/client/http/HttpResponse;)V

    .line 1070
    :cond_26
    iget-boolean v0, v1, Lcom/google/api/client/http/HttpRequest;->throwExceptionOnExecuteError:Z

    if-eqz v0, :cond_28

    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->isSuccessStatusCode()Z

    move-result v0

    if-eqz v0, :cond_27

    goto :goto_16

    .line 1072
    :cond_27
    :try_start_7
    new-instance v0, Lcom/google/api/client/http/HttpResponseException;

    invoke-direct {v0, v5}, Lcom/google/api/client/http/HttpResponseException;-><init>(Lcom/google/api/client/http/HttpResponse;)V

    .end local v2    # "retryRequest":Z
    .end local v5    # "response":Lcom/google/api/client/http/HttpResponse;
    .end local v6    # "executeException":Ljava/io/IOException;
    .end local v10    # "retriesRemaining":I
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 1074
    .restart local v2    # "retryRequest":Z
    .restart local v5    # "response":Lcom/google/api/client/http/HttpResponse;
    .restart local v6    # "executeException":Ljava/io/IOException;
    .restart local v10    # "retriesRemaining":I
    :catchall_2
    move-exception v0

    invoke-virtual {v5}, Lcom/google/api/client/http/HttpResponse;->disconnect()V

    .line 1075
    throw v0

    .line 1077
    :cond_28
    :goto_16
    return-object v5

    .line 1063
    :cond_29
    throw v6

    .line 1059
    :cond_2a
    move v0, v2

    move v2, v10

    goto/16 :goto_1
.end method

.method public executeAsync()Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future<",
            "Lcom/google/api/client/http/HttpResponse;",
            ">;"
        }
    .end annotation

    .line 1110
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/api/client/http/HttpRequest;->executeAsync(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public executeAsync(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/google/api/client/http/HttpResponse;",
            ">;"
        }
    .end annotation

    .line 1090
    new-instance v0, Ljava/util/concurrent/FutureTask;

    new-instance v1, Lcom/google/api/client/http/HttpRequest$1;

    invoke-direct {v1, p0}, Lcom/google/api/client/http/HttpRequest$1;-><init>(Lcom/google/api/client/http/HttpRequest;)V

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 1096
    .local v0, "future":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Lcom/google/api/client/http/HttpResponse;>;"
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 1097
    return-object v0
.end method

.method public getBackOffPolicy()Lcom/google/api/client/http/BackOffPolicy;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 320
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->backOffPolicy:Lcom/google/api/client/http/BackOffPolicy;

    return-object v0
.end method

.method public getConnectTimeout()I
    .locals 1

    .line 451
    iget v0, p0, Lcom/google/api/client/http/HttpRequest;->connectTimeout:I

    return v0
.end method

.method public getContent()Lcom/google/api/client/http/HttpContent;
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->content:Lcom/google/api/client/http/HttpContent;

    return-object v0
.end method

.method public getContentLoggingLimit()I
    .locals 1

    .line 362
    iget v0, p0, Lcom/google/api/client/http/HttpRequest;->contentLoggingLimit:I

    return v0
.end method

.method public getEncoding()Lcom/google/api/client/http/HttpEncoding;
    .locals 1

    .line 295
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->encoding:Lcom/google/api/client/http/HttpEncoding;

    return-object v0
.end method

.method public getFollowRedirects()Z
    .locals 1

    .line 700
    iget-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->followRedirects:Z

    return v0
.end method

.method public getHeaders()Lcom/google/api/client/http/HttpHeaders;
    .locals 1

    .line 502
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    return-object v0
.end method

.method public getIOExceptionHandler()Lcom/google/api/client/http/HttpIOExceptionHandler;
    .locals 1

    .line 605
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->ioExceptionHandler:Lcom/google/api/client/http/HttpIOExceptionHandler;

    return-object v0
.end method

.method public getInterceptor()Lcom/google/api/client/http/HttpExecuteInterceptor;
    .locals 1

    .line 563
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->executeInterceptor:Lcom/google/api/client/http/HttpExecuteInterceptor;

    return-object v0
.end method

.method public getNumberOfRetries()I
    .locals 1

    .line 649
    iget v0, p0, Lcom/google/api/client/http/HttpRequest;->numRetries:I

    return v0
.end method

.method public final getParser()Lcom/google/api/client/util/ObjectParser;
    .locals 1

    .line 691
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->objectParser:Lcom/google/api/client/util/ObjectParser;

    return-object v0
.end method

.method public getReadTimeout()I
    .locals 1

    .line 481
    iget v0, p0, Lcom/google/api/client/http/HttpRequest;->readTimeout:I

    return v0
.end method

.method public getRequestMethod()Ljava/lang/String;
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->requestMethod:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseHeaders()Lcom/google/api/client/http/HttpHeaders;
    .locals 1

    .line 525
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->responseHeaders:Lcom/google/api/client/http/HttpHeaders;

    return-object v0
.end method

.method public getResponseInterceptor()Lcom/google/api/client/http/HttpResponseInterceptor;
    .locals 1

    .line 626
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->responseInterceptor:Lcom/google/api/client/http/HttpResponseInterceptor;

    return-object v0
.end method

.method public getRetryOnExecuteIOException()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 754
    iget-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->retryOnExecuteIOException:Z

    return v0
.end method

.method public getSleeper()Lcom/google/api/client/util/Sleeper;
    .locals 1

    .line 1162
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->sleeper:Lcom/google/api/client/util/Sleeper;

    return-object v0
.end method

.method public getSuppressUserAgentSuffix()Z
    .locals 1

    .line 783
    iget-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->suppressUserAgentSuffix:Z

    return v0
.end method

.method public getThrowExceptionOnExecuteError()Z
    .locals 1

    .line 724
    iget-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->throwExceptionOnExecuteError:Z

    return v0
.end method

.method public getTransport()Lcom/google/api/client/http/HttpTransport;
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->transport:Lcom/google/api/client/http/HttpTransport;

    return-object v0
.end method

.method public getUnsuccessfulResponseHandler()Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;
    .locals 1

    .line 583
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->unsuccessfulResponseHandler:Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;

    return-object v0
.end method

.method public getUrl()Lcom/google/api/client/http/GenericUrl;
    .locals 1

    .line 257
    iget-object v0, p0, Lcom/google/api/client/http/HttpRequest;->url:Lcom/google/api/client/http/GenericUrl;

    return-object v0
.end method

.method public handleRedirect(ILcom/google/api/client/http/HttpHeaders;)Z
    .locals 4
    .param p1, "statusCode"    # I
    .param p2, "responseHeaders"    # Lcom/google/api/client/http/HttpHeaders;

    .line 1133
    invoke-virtual {p2}, Lcom/google/api/client/http/HttpHeaders;->getLocation()Ljava/lang/String;

    move-result-object v0

    .line 1134
    .local v0, "redirectLocation":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/api/client/http/HttpRequest;->getFollowRedirects()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/google/api/client/http/HttpStatusCodes;->isRedirect(I)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 1137
    new-instance v1, Lcom/google/api/client/http/GenericUrl;

    iget-object v2, p0, Lcom/google/api/client/http/HttpRequest;->url:Lcom/google/api/client/http/GenericUrl;

    invoke-virtual {v2, v0}, Lcom/google/api/client/http/GenericUrl;->toURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/api/client/http/GenericUrl;-><init>(Ljava/net/URL;)V

    invoke-virtual {p0, v1}, Lcom/google/api/client/http/HttpRequest;->setUrl(Lcom/google/api/client/http/GenericUrl;)Lcom/google/api/client/http/HttpRequest;

    .line 1139
    const/16 v1, 0x12f

    const/4 v2, 0x0

    if-ne p1, v1, :cond_0

    .line 1140
    const-string v1, "GET"

    invoke-virtual {p0, v1}, Lcom/google/api/client/http/HttpRequest;->setRequestMethod(Ljava/lang/String;)Lcom/google/api/client/http/HttpRequest;

    .line 1142
    invoke-virtual {p0, v2}, Lcom/google/api/client/http/HttpRequest;->setContent(Lcom/google/api/client/http/HttpContent;)Lcom/google/api/client/http/HttpRequest;

    .line 1145
    :cond_0
    iget-object v1, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpHeaders;->setAuthorization(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 1146
    iget-object v1, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpHeaders;->setIfMatch(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 1147
    iget-object v1, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpHeaders;->setIfNoneMatch(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 1148
    iget-object v1, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpHeaders;->setIfModifiedSince(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 1149
    iget-object v1, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpHeaders;->setIfUnmodifiedSince(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 1150
    iget-object v1, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpHeaders;->setIfRange(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 1151
    const/4 v1, 0x1

    return v1

    .line 1153
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public isCurlLoggingEnabled()Z
    .locals 1

    .line 427
    iget-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->curlLoggingEnabled:Z

    return v0
.end method

.method public isLoggingEnabled()Z
    .locals 1

    .line 404
    iget-boolean v0, p0, Lcom/google/api/client/http/HttpRequest;->loggingEnabled:Z

    return v0
.end method

.method public setBackOffPolicy(Lcom/google/api/client/http/BackOffPolicy;)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "backOffPolicy"    # Lcom/google/api/client/http/BackOffPolicy;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 335
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->backOffPolicy:Lcom/google/api/client/http/BackOffPolicy;

    .line 336
    return-object p0
.end method

.method public setConnectTimeout(I)Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .param p1, "connectTimeout"    # I

    .line 465
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 466
    iput p1, p0, Lcom/google/api/client/http/HttpRequest;->connectTimeout:I

    .line 467
    return-object p0
.end method

.method public setContent(Lcom/google/api/client/http/HttpContent;)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "content"    # Lcom/google/api/client/http/HttpContent;

    .line 285
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->content:Lcom/google/api/client/http/HttpContent;

    .line 286
    return-object p0
.end method

.method public setContentLoggingLimit(I)Lcom/google/api/client/http/HttpRequest;
    .locals 2
    .param p1, "contentLoggingLimit"    # I

    .line 388
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "The content logging limit must be non-negative."

    invoke-static {v0, v1}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 390
    iput p1, p0, Lcom/google/api/client/http/HttpRequest;->contentLoggingLimit:I

    .line 391
    return-object p0
.end method

.method public setCurlLoggingEnabled(Z)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "curlLoggingEnabled"    # Z

    .line 440
    iput-boolean p1, p0, Lcom/google/api/client/http/HttpRequest;->curlLoggingEnabled:Z

    .line 441
    return-object p0
.end method

.method public setEncoding(Lcom/google/api/client/http/HttpEncoding;)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "encoding"    # Lcom/google/api/client/http/HttpEncoding;

    .line 304
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->encoding:Lcom/google/api/client/http/HttpEncoding;

    .line 305
    return-object p0
.end method

.method public setFollowRedirects(Z)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "followRedirects"    # Z

    .line 713
    iput-boolean p1, p0, Lcom/google/api/client/http/HttpRequest;->followRedirects:Z

    .line 714
    return-object p0
.end method

.method public setHeaders(Lcom/google/api/client/http/HttpHeaders;)Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .param p1, "headers"    # Lcom/google/api/client/http/HttpHeaders;

    .line 515
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/http/HttpHeaders;

    iput-object v0, p0, Lcom/google/api/client/http/HttpRequest;->headers:Lcom/google/api/client/http/HttpHeaders;

    .line 516
    return-object p0
.end method

.method public setIOExceptionHandler(Lcom/google/api/client/http/HttpIOExceptionHandler;)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "ioExceptionHandler"    # Lcom/google/api/client/http/HttpIOExceptionHandler;

    .line 616
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->ioExceptionHandler:Lcom/google/api/client/http/HttpIOExceptionHandler;

    .line 617
    return-object p0
.end method

.method public setInterceptor(Lcom/google/api/client/http/HttpExecuteInterceptor;)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "interceptor"    # Lcom/google/api/client/http/HttpExecuteInterceptor;

    .line 573
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->executeInterceptor:Lcom/google/api/client/http/HttpExecuteInterceptor;

    .line 574
    return-object p0
.end method

.method public setLoggingEnabled(Z)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "loggingEnabled"    # Z

    .line 417
    iput-boolean p1, p0, Lcom/google/api/client/http/HttpRequest;->loggingEnabled:Z

    .line 418
    return-object p0
.end method

.method public setNumberOfRetries(I)Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .param p1, "numRetries"    # I

    .line 665
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 666
    iput p1, p0, Lcom/google/api/client/http/HttpRequest;->numRetries:I

    .line 667
    return-object p0
.end method

.method public setParser(Lcom/google/api/client/util/ObjectParser;)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "parser"    # Lcom/google/api/client/util/ObjectParser;

    .line 681
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->objectParser:Lcom/google/api/client/util/ObjectParser;

    .line 682
    return-object p0
.end method

.method public setReadTimeout(I)Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .param p1, "readTimeout"    # I

    .line 491
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 492
    iput p1, p0, Lcom/google/api/client/http/HttpRequest;->readTimeout:I

    .line 493
    return-object p0
.end method

.method public setRequestMethod(Ljava/lang/String;)Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .param p1, "requestMethod"    # Ljava/lang/String;

    .line 246
    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/google/api/client/http/HttpMediaType;->matchesToken(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 247
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->requestMethod:Ljava/lang/String;

    .line 248
    return-object p0
.end method

.method public setResponseHeaders(Lcom/google/api/client/http/HttpHeaders;)Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .param p1, "responseHeaders"    # Lcom/google/api/client/http/HttpHeaders;

    .line 552
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/http/HttpHeaders;

    iput-object v0, p0, Lcom/google/api/client/http/HttpRequest;->responseHeaders:Lcom/google/api/client/http/HttpHeaders;

    .line 553
    return-object p0
.end method

.method public setResponseInterceptor(Lcom/google/api/client/http/HttpResponseInterceptor;)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "responseInterceptor"    # Lcom/google/api/client/http/HttpResponseInterceptor;

    .line 635
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->responseInterceptor:Lcom/google/api/client/http/HttpResponseInterceptor;

    .line 636
    return-object p0
.end method

.method public setRetryOnExecuteIOException(Z)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "retryOnExecuteIOException"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 773
    iput-boolean p1, p0, Lcom/google/api/client/http/HttpRequest;->retryOnExecuteIOException:Z

    .line 774
    return-object p0
.end method

.method public setSleeper(Lcom/google/api/client/util/Sleeper;)Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .param p1, "sleeper"    # Lcom/google/api/client/util/Sleeper;

    .line 1171
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/util/Sleeper;

    iput-object v0, p0, Lcom/google/api/client/http/HttpRequest;->sleeper:Lcom/google/api/client/util/Sleeper;

    .line 1172
    return-object p0
.end method

.method public setSuppressUserAgentSuffix(Z)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "suppressUserAgentSuffix"    # Z

    .line 796
    iput-boolean p1, p0, Lcom/google/api/client/http/HttpRequest;->suppressUserAgentSuffix:Z

    .line 797
    return-object p0
.end method

.method public setThrowExceptionOnExecuteError(Z)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "throwExceptionOnExecuteError"    # Z

    .line 738
    iput-boolean p1, p0, Lcom/google/api/client/http/HttpRequest;->throwExceptionOnExecuteError:Z

    .line 739
    return-object p0
.end method

.method public setUnsuccessfulResponseHandler(Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;)Lcom/google/api/client/http/HttpRequest;
    .locals 0
    .param p1, "unsuccessfulResponseHandler"    # Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;

    .line 593
    iput-object p1, p0, Lcom/google/api/client/http/HttpRequest;->unsuccessfulResponseHandler:Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;

    .line 594
    return-object p0
.end method

.method public setUrl(Lcom/google/api/client/http/GenericUrl;)Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .param p1, "url"    # Lcom/google/api/client/http/GenericUrl;

    .line 266
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/http/GenericUrl;

    iput-object v0, p0, Lcom/google/api/client/http/HttpRequest;->url:Lcom/google/api/client/http/GenericUrl;

    .line 267
    return-object p0
.end method
