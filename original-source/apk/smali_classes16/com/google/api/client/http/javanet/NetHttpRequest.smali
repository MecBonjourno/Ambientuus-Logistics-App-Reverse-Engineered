.class final Lcom/google/api/client/http/javanet/NetHttpRequest;
.super Lcom/google/api/client/http/LowLevelHttpRequest;
.source "NetHttpRequest.java"


# instance fields
.field private final connection:Ljava/net/HttpURLConnection;


# direct methods
.method constructor <init>(Ljava/net/HttpURLConnection;)V
    .locals 1
    .param p1, "connection"    # Ljava/net/HttpURLConnection;

    .line 35
    invoke-direct {p0}, Lcom/google/api/client/http/LowLevelHttpRequest;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/google/api/client/http/javanet/NetHttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 37
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 38
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 42
    iget-object v0, p0, Lcom/google/api/client/http/javanet/NetHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method public execute()Lcom/google/api/client/http/LowLevelHttpResponse;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/google/api/client/http/javanet/NetHttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 55
    .local v0, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {p0}, Lcom/google/api/client/http/javanet/NetHttpRequest;->getStreamingContent()Lcom/google/api/client/util/StreamingContent;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 56
    invoke-virtual {p0}, Lcom/google/api/client/http/javanet/NetHttpRequest;->getContentType()Ljava/lang/String;

    move-result-object v1

    .line 57
    .local v1, "contentType":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 58
    const-string v2, "Content-Type"

    invoke-virtual {p0, v2, v1}, Lcom/google/api/client/http/javanet/NetHttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    :cond_0
    invoke-virtual {p0}, Lcom/google/api/client/http/javanet/NetHttpRequest;->getContentEncoding()Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, "contentEncoding":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 62
    const-string v3, "Content-Encoding"

    invoke-virtual {p0, v3, v2}, Lcom/google/api/client/http/javanet/NetHttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    :cond_1
    invoke-virtual {p0}, Lcom/google/api/client/http/javanet/NetHttpRequest;->getContentLength()J

    move-result-wide v3

    .line 65
    .local v3, "contentLength":J
    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-ltz v7, :cond_2

    .line 66
    const-string v7, "Content-Length"

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    :cond_2
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v7

    .line 69
    .local v7, "requestMethod":Ljava/lang/String;
    const-string v8, "POST"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-nez v8, :cond_5

    const-string v8, "PUT"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    goto :goto_1

    .line 97
    :cond_3
    cmp-long v5, v3, v5

    if-nez v5, :cond_4

    move v5, v10

    goto :goto_0

    :cond_4
    move v5, v9

    :goto_0
    new-array v6, v10, [Ljava/lang/Object;

    aput-object v7, v6, v9

    const-string v8, "%s with non-zero content length is not supported"

    invoke-static {v5, v8, v6}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_5

    .line 70
    :cond_5
    :goto_1
    invoke-virtual {v0, v10}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 72
    cmp-long v5, v3, v5

    if-ltz v5, :cond_6

    const-wide/32 v5, 0x7fffffff

    cmp-long v5, v3, v5

    if-gtz v5, :cond_6

    .line 73
    long-to-int v5, v3

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    goto :goto_2

    .line 75
    :cond_6
    invoke-virtual {v0, v9}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 77
    :goto_2
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    .line 78
    .local v5, "out":Ljava/io/OutputStream;
    const/4 v6, 0x1

    .line 80
    .local v6, "threw":Z
    :try_start_0
    invoke-virtual {p0}, Lcom/google/api/client/http/javanet/NetHttpRequest;->getStreamingContent()Lcom/google/api/client/util/StreamingContent;

    move-result-object v8

    invoke-interface {v8, v5}, Lcom/google/api/client/util/StreamingContent;->writeTo(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    const/4 v6, 0x0

    .line 84
    :try_start_1
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 92
    goto :goto_3

    .line 85
    :catch_0
    move-exception v8

    .line 89
    .local v8, "exception":Ljava/io/IOException;
    if-eqz v6, :cond_7

    .line 93
    .end local v8    # "exception":Ljava/io/IOException;
    nop

    .line 94
    .end local v5    # "out":Ljava/io/OutputStream;
    .end local v6    # "threw":Z
    :goto_3
    goto :goto_5

    .line 90
    .restart local v5    # "out":Ljava/io/OutputStream;
    .restart local v6    # "threw":Z
    .restart local v8    # "exception":Ljava/io/IOException;
    :cond_7
    throw v8

    .line 83
    .end local v8    # "exception":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    .line 84
    :try_start_2
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 92
    goto :goto_4

    .line 85
    :catch_1
    move-exception v9

    .line 89
    .local v9, "exception":Ljava/io/IOException;
    if-nez v6, :cond_8

    .line 90
    throw v9

    .line 93
    .end local v9    # "exception":Ljava/io/IOException;
    :cond_8
    :goto_4
    throw v8

    .line 102
    .end local v1    # "contentType":Ljava/lang/String;
    .end local v2    # "contentEncoding":Ljava/lang/String;
    .end local v3    # "contentLength":J
    .end local v5    # "out":Ljava/io/OutputStream;
    .end local v6    # "threw":Z
    .end local v7    # "requestMethod":Ljava/lang/String;
    :cond_9
    :goto_5
    const/4 v1, 0x0

    .line 104
    .local v1, "successfulConnection":Z
    :try_start_3
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 105
    new-instance v2, Lcom/google/api/client/http/javanet/NetHttpResponse;

    invoke-direct {v2, v0}, Lcom/google/api/client/http/javanet/NetHttpResponse;-><init>(Ljava/net/HttpURLConnection;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 106
    .local v2, "response":Lcom/google/api/client/http/javanet/NetHttpResponse;
    const/4 v1, 0x1

    .line 107
    nop

    .line 109
    if-nez v1, :cond_a

    .line 110
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 107
    :cond_a
    return-object v2

    .line 109
    .end local v2    # "response":Lcom/google/api/client/http/javanet/NetHttpResponse;
    :catchall_1
    move-exception v2

    if-nez v1, :cond_b

    .line 110
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 112
    :cond_b
    throw v2
.end method

.method public setTimeout(II)V
    .locals 1
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I

    .line 47
    iget-object v0, p0, Lcom/google/api/client/http/javanet/NetHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 48
    iget-object v0, p0, Lcom/google/api/client/http/javanet/NetHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 49
    return-void
.end method
