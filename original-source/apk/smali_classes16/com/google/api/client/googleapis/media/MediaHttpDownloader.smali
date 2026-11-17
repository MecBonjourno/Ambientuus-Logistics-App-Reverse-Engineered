.class public final Lcom/google/api/client/googleapis/media/MediaHttpDownloader;
.super Ljava/lang/Object;
.source "MediaHttpDownloader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;
    }
.end annotation


# static fields
.field public static final MAXIMUM_CHUNK_SIZE:I = 0x2000000


# instance fields
.field private bytesDownloaded:J

.field private chunkSize:I

.field private directDownloadEnabled:Z

.field private downloadState:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

.field private lastBytePos:J

.field private mediaContentLength:J

.field private progressListener:Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;

.field private final requestFactory:Lcom/google/api/client/http/HttpRequestFactory;

.field private final transport:Lcom/google/api/client/http/HttpTransport;


# direct methods
.method public constructor <init>(Lcom/google/api/client/http/HttpTransport;Lcom/google/api/client/http/HttpRequestInitializer;)V
    .locals 2
    .param p1, "transport"    # Lcom/google/api/client/http/HttpTransport;
    .param p2, "httpRequestInitializer"    # Lcom/google/api/client/http/HttpRequestInitializer;

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->directDownloadEnabled:Z

    .line 102
    const/high16 v0, 0x2000000

    iput v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->chunkSize:I

    .line 111
    sget-object v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;->NOT_STARTED:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    iput-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->downloadState:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    .line 123
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->lastBytePos:J

    .line 134
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/http/HttpTransport;

    iput-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->transport:Lcom/google/api/client/http/HttpTransport;

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
    iput-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->requestFactory:Lcom/google/api/client/http/HttpRequestFactory;

    .line 137
    return-void
.end method

.method private executeCurrentRequest(JLcom/google/api/client/http/GenericUrl;Lcom/google/api/client/http/HttpHeaders;Ljava/io/OutputStream;)Lcom/google/api/client/http/HttpResponse;
    .locals 7
    .param p1, "currentRequestLastBytePos"    # J
    .param p3, "requestUrl"    # Lcom/google/api/client/http/GenericUrl;
    .param p4, "requestHeaders"    # Lcom/google/api/client/http/HttpHeaders;
    .param p5, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 229
    iget-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->requestFactory:Lcom/google/api/client/http/HttpRequestFactory;

    invoke-virtual {v0, p3}, Lcom/google/api/client/http/HttpRequestFactory;->buildGetRequest(Lcom/google/api/client/http/GenericUrl;)Lcom/google/api/client/http/HttpRequest;

    move-result-object v0

    .line 231
    .local v0, "request":Lcom/google/api/client/http/HttpRequest;
    if-eqz p4, :cond_0

    .line 232
    invoke-virtual {v0}, Lcom/google/api/client/http/HttpRequest;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v1

    invoke-virtual {v1, p4}, Lcom/google/api/client/http/HttpHeaders;->putAll(Ljava/util/Map;)V

    .line 235
    :cond_0
    iget-wide v1, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    const-wide/16 v2, -0x1

    if-nez v1, :cond_1

    cmp-long v1, p1, v2

    if-eqz v1, :cond_3

    .line 236
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 237
    .local v1, "rangeHeader":Ljava/lang/StringBuilder;
    const-string v4, "bytes="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    cmp-long v2, p1, v2

    if-eqz v2, :cond_2

    .line 239
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 241
    :cond_2
    invoke-virtual {v0}, Lcom/google/api/client/http/HttpRequest;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/api/client/http/HttpHeaders;->setRange(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    .line 244
    .end local v1    # "rangeHeader":Ljava/lang/StringBuilder;
    :cond_3
    invoke-virtual {v0}, Lcom/google/api/client/http/HttpRequest;->execute()Lcom/google/api/client/http/HttpResponse;

    move-result-object v1

    .line 246
    .local v1, "response":Lcom/google/api/client/http/HttpResponse;
    :try_start_0
    invoke-virtual {v1}, Lcom/google/api/client/http/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2, p5}, Lcom/google/api/client/util/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    invoke-virtual {v1}, Lcom/google/api/client/http/HttpResponse;->disconnect()V

    .line 249
    nop

    .line 250
    return-object v1

    .line 248
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lcom/google/api/client/http/HttpResponse;->disconnect()V

    .line 249
    throw v2
.end method

.method private getNextByteIndex(Ljava/lang/String;)J
    .locals 4
    .param p1, "rangeHeader"    # Ljava/lang/String;

    .line 262
    if-nez p1, :cond_0

    .line 263
    const-wide/16 v0, 0x0

    return-wide v0

    .line 265
    :cond_0
    nop

    .line 266
    const/16 v0, 0x2d

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    const/16 v1, 0x2f

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 265
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    return-wide v0
.end method

.method private setMediaContentLength(Ljava/lang/String;)V
    .locals 4
    .param p1, "rangeHeader"    # Ljava/lang/String;

    .line 325
    if-nez p1, :cond_0

    .line 326
    return-void

    .line 328
    :cond_0
    iget-wide v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->mediaContentLength:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 329
    const/16 v0, 0x2f

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->mediaContentLength:J

    .line 331
    :cond_1
    return-void
.end method

.method private updateStateAndNotifyListener(Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;)V
    .locals 1
    .param p1, "downloadState"    # Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 423
    iput-object p1, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->downloadState:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    .line 424
    iget-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->progressListener:Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;

    if-eqz v0, :cond_0

    .line 425
    iget-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->progressListener:Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;

    invoke-interface {v0, p0}, Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;->progressChanged(Lcom/google/api/client/googleapis/media/MediaHttpDownloader;)V

    .line 427
    :cond_0
    return-void
.end method


# virtual methods
.method public download(Lcom/google/api/client/http/GenericUrl;Lcom/google/api/client/http/HttpHeaders;Ljava/io/OutputStream;)V
    .locals 10
    .param p1, "requestUrl"    # Lcom/google/api/client/http/GenericUrl;
    .param p2, "requestHeaders"    # Lcom/google/api/client/http/HttpHeaders;
    .param p3, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    iget-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->downloadState:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    sget-object v1, Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;->NOT_STARTED:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 178
    const-string v0, "alt"

    const-string v1, "media"

    invoke-virtual {p1, v0, v1}, Lcom/google/api/client/http/GenericUrl;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    iget-boolean v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->directDownloadEnabled:Z

    if-eqz v0, :cond_1

    .line 181
    sget-object v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;->MEDIA_IN_PROGRESS:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    invoke-direct {p0, v0}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->updateStateAndNotifyListener(Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;)V

    .line 182
    iget-wide v2, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->lastBytePos:J

    .line 183
    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    .end local p1    # "requestUrl":Lcom/google/api/client/http/GenericUrl;
    .end local p2    # "requestHeaders":Lcom/google/api/client/http/HttpHeaders;
    .end local p3    # "outputStream":Ljava/io/OutputStream;
    .local v4, "requestUrl":Lcom/google/api/client/http/GenericUrl;
    .local v5, "requestHeaders":Lcom/google/api/client/http/HttpHeaders;
    .local v6, "outputStream":Ljava/io/OutputStream;
    invoke-direct/range {v1 .. v6}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->executeCurrentRequest(JLcom/google/api/client/http/GenericUrl;Lcom/google/api/client/http/HttpHeaders;Ljava/io/OutputStream;)Lcom/google/api/client/http/HttpResponse;

    move-result-object p1

    .line 185
    move-object v0, v1

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    .end local v6    # "outputStream":Ljava/io/OutputStream;
    .local v3, "requestUrl":Lcom/google/api/client/http/GenericUrl;
    .local v4, "requestHeaders":Lcom/google/api/client/http/HttpHeaders;
    .local v5, "outputStream":Ljava/io/OutputStream;
    .local p1, "response":Lcom/google/api/client/http/HttpResponse;
    invoke-virtual {p1}, Lcom/google/api/client/http/HttpResponse;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/api/client/http/HttpHeaders;->getContentLength()Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    iput-wide p2, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->mediaContentLength:J

    .line 186
    iget-wide p2, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->mediaContentLength:J

    iput-wide p2, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    .line 187
    sget-object p2, Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;->MEDIA_COMPLETE:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    invoke-direct {p0, p2}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->updateStateAndNotifyListener(Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;)V

    .line 188
    return-void

    .line 180
    .end local v3    # "requestUrl":Lcom/google/api/client/http/GenericUrl;
    .end local v4    # "requestHeaders":Lcom/google/api/client/http/HttpHeaders;
    .end local v5    # "outputStream":Ljava/io/OutputStream;
    .local p1, "requestUrl":Lcom/google/api/client/http/GenericUrl;
    .restart local p2    # "requestHeaders":Lcom/google/api/client/http/HttpHeaders;
    .restart local p3    # "outputStream":Ljava/io/OutputStream;
    :cond_1
    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .line 193
    .end local p1    # "requestUrl":Lcom/google/api/client/http/GenericUrl;
    .end local p2    # "requestHeaders":Lcom/google/api/client/http/HttpHeaders;
    .end local p3    # "outputStream":Ljava/io/OutputStream;
    .restart local v3    # "requestUrl":Lcom/google/api/client/http/GenericUrl;
    .restart local v4    # "requestHeaders":Lcom/google/api/client/http/HttpHeaders;
    .restart local v5    # "outputStream":Ljava/io/OutputStream;
    :goto_1
    iget-wide p1, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    iget p3, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->chunkSize:I

    int-to-long v1, p3

    add-long/2addr p1, v1

    const-wide/16 v1, 0x1

    sub-long/2addr p1, v1

    .line 194
    .local p1, "currentRequestLastBytePos":J
    iget-wide v1, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->lastBytePos:J

    const-wide/16 v6, -0x1

    cmp-long p3, v1, v6

    if-eqz p3, :cond_2

    .line 196
    iget-wide v1, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->lastBytePos:J

    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    move-wide v1, p1

    goto :goto_2

    .line 194
    :cond_2
    move-wide v1, p1

    .line 198
    .end local p1    # "currentRequestLastBytePos":J
    .local v1, "currentRequestLastBytePos":J
    :goto_2
    invoke-direct/range {v0 .. v5}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->executeCurrentRequest(JLcom/google/api/client/http/GenericUrl;Lcom/google/api/client/http/HttpHeaders;Ljava/io/OutputStream;)Lcom/google/api/client/http/HttpResponse;

    move-result-object p1

    .line 201
    .local p1, "response":Lcom/google/api/client/http/HttpResponse;
    invoke-virtual {p1}, Lcom/google/api/client/http/HttpResponse;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/api/client/http/HttpHeaders;->getContentRange()Ljava/lang/String;

    move-result-object p2

    .line 202
    .local p2, "contentRange":Ljava/lang/String;
    invoke-direct {p0, p2}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->getNextByteIndex(Ljava/lang/String;)J

    move-result-wide v6

    .line 203
    .local v6, "nextByteIndex":J
    invoke-direct {p0, p2}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->setMediaContentLength(Ljava/lang/String;)V

    .line 205
    iget-wide v8, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->mediaContentLength:J

    cmp-long p3, v8, v6

    if-gtz p3, :cond_3

    .line 207
    iget-wide v8, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->mediaContentLength:J

    iput-wide v8, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    .line 208
    sget-object p3, Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;->MEDIA_COMPLETE:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    invoke-direct {p0, p3}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->updateStateAndNotifyListener(Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;)V

    .line 209
    return-void

    .line 212
    :cond_3
    iput-wide v6, v0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    .line 213
    sget-object p3, Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;->MEDIA_IN_PROGRESS:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    invoke-direct {p0, p3}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->updateStateAndNotifyListener(Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;)V

    .line 214
    .end local v1    # "currentRequestLastBytePos":J
    .end local v6    # "nextByteIndex":J
    .end local p1    # "response":Lcom/google/api/client/http/HttpResponse;
    .end local p2    # "contentRange":Ljava/lang/String;
    goto :goto_1
.end method

.method public download(Lcom/google/api/client/http/GenericUrl;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "requestUrl"    # Lcom/google/api/client/http/GenericUrl;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->download(Lcom/google/api/client/http/GenericUrl;Lcom/google/api/client/http/HttpHeaders;Ljava/io/OutputStream;)V

    .line 156
    return-void
.end method

.method public getChunkSize()I
    .locals 1

    .line 394
    iget v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->chunkSize:I

    return v0
.end method

.method public getDownloadState()Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;
    .locals 1

    .line 435
    iget-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->downloadState:Lcom/google/api/client/googleapis/media/MediaHttpDownloader$DownloadState;

    return-object v0
.end method

.method public getLastBytePosition()J
    .locals 2

    .line 414
    iget-wide v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->lastBytePos:J

    return-wide v0
.end method

.method public getNumBytesDownloaded()J
    .locals 2

    .line 403
    iget-wide v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    return-wide v0
.end method

.method public getProgress()D
    .locals 4

    .line 445
    iget-wide v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->mediaContentLength:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    long-to-double v0, v0

    iget-wide v2, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->mediaContentLength:J

    long-to-double v2, v2

    div-double/2addr v0, v2

    :goto_0
    return-wide v0
.end method

.method public getProgressListener()Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;
    .locals 1

    .line 367
    iget-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->progressListener:Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;

    return-object v0
.end method

.method public getTransport()Lcom/google/api/client/http/HttpTransport;
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->transport:Lcom/google/api/client/http/HttpTransport;

    return-object v0
.end method

.method public isDirectDownloadEnabled()Z
    .locals 1

    .line 340
    iget-boolean v0, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->directDownloadEnabled:Z

    return v0
.end method

.method public setBytesDownloaded(J)Lcom/google/api/client/googleapis/media/MediaHttpDownloader;
    .locals 2
    .param p1, "bytesDownloaded"    # J

    .line 285
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 286
    iput-wide p1, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->bytesDownloaded:J

    .line 287
    return-object p0
.end method

.method public setChunkSize(I)Lcom/google/api/client/googleapis/media/MediaHttpDownloader;
    .locals 1
    .param p1, "chunkSize"    # I

    .line 384
    if-lez p1, :cond_0

    const/high16 v0, 0x2000000

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 385
    iput p1, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->chunkSize:I

    .line 386
    return-object p0
.end method

.method public setContentRange(JI)Lcom/google/api/client/googleapis/media/MediaHttpDownloader;
    .locals 2
    .param p1, "firstBytePos"    # J
    .param p3, "lastBytePos"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 314
    int-to-long v0, p3

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->setContentRange(JJ)Lcom/google/api/client/googleapis/media/MediaHttpDownloader;

    move-result-object v0

    return-object v0
.end method

.method public setContentRange(JJ)Lcom/google/api/client/googleapis/media/MediaHttpDownloader;
    .locals 1
    .param p1, "firstBytePos"    # J
    .param p3, "lastBytePos"    # J

    .line 303
    cmp-long v0, p3, p1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 304
    invoke-virtual {p0, p1, p2}, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->setBytesDownloaded(J)Lcom/google/api/client/googleapis/media/MediaHttpDownloader;

    .line 305
    iput-wide p3, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->lastBytePos:J

    .line 306
    return-object p0
.end method

.method public setDirectDownloadEnabled(Z)Lcom/google/api/client/googleapis/media/MediaHttpDownloader;
    .locals 0
    .param p1, "directDownloadEnabled"    # Z

    .line 350
    iput-boolean p1, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->directDownloadEnabled:Z

    .line 351
    return-object p0
.end method

.method public setProgressListener(Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;)Lcom/google/api/client/googleapis/media/MediaHttpDownloader;
    .locals 0
    .param p1, "progressListener"    # Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;

    .line 359
    iput-object p1, p0, Lcom/google/api/client/googleapis/media/MediaHttpDownloader;->progressListener:Lcom/google/api/client/googleapis/media/MediaHttpDownloaderProgressListener;

    .line 360
    return-object p0
.end method
