.class public abstract Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;
.super Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;
.source "InMemoryTransformCronetCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;"
    }
.end annotation


# static fields
.field private static final CONTENT_LENGTH_HEADER_NAME:Ljava/lang/String; = "Content-Length"

.field private static final MAX_ARRAY_SIZE:I = 0x7ffffff7


# instance fields
.field private final mListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<",
            "-TT;>;>;"
        }
    .end annotation
.end field

.field private mResponseBodyChannel:Ljava/nio/channels/WritableByteChannel;

.field private mResponseBodyStream:Ljava/io/ByteArrayOutputStream;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    .local p0, "this":Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;, "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<TT;>;"
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;-><init>()V

    .line 41
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mListeners:Ljava/util/Set;

    return-void
.end method

.method private static getBodyLength(Lorg/chromium/net/UrlResponseInfo;)J
    .locals 5
    .param p0, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 114
    invoke-virtual {p0}, Lorg/chromium/net/UrlResponseInfo;->getAllHeaders()Ljava/util/Map;

    move-result-object v0

    const-string v1, "Content-Length"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 115
    .local v0, "contentLengthHeader":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-wide/16 v1, -0x1

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    goto :goto_0

    .line 119
    :cond_0
    const/4 v3, 0x0

    :try_start_0
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v1

    .line 120
    :catch_0
    move-exception v3

    .line 121
    .local v3, "e":Ljava/lang/NumberFormatException;
    return-wide v1

    .line 116
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    :goto_0
    return-wide v1
.end method


# virtual methods
.method public addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<",
            "-TT;>;)",
            "Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;"
        }
    .end annotation

    .line 62
    .local p0, "this":Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;, "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<TT;>;"
    .local p1, "listener":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-TT;>;"
    iget-object v0, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 63
    return-object p0
.end method

.method protected final onBodyChunkRead(Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p2, "bodyChunk"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 85
    .local p0, "this":Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;, "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<TT;>;"
    iget-object v0, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mResponseBodyChannel:Ljava/nio/channels/WritableByteChannel;

    invoke-interface {v0, p2}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 86
    return-void
.end method

.method protected final onCanceled(Lorg/chromium/net/UrlResponseInfo;)V
    .locals 2
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 105
    .local p0, "this":Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;, "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<TT;>;"
    iget-object v0, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;

    .line 106
    .local v1, "callback":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-TT;>;"
    invoke-interface {v1, p1}, Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;->onCanceled(Lorg/chromium/net/UrlResponseInfo;)V

    .line 107
    .end local v1    # "callback":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-TT;>;"
    goto :goto_0

    .line 108
    :cond_0
    return-void
.end method

.method protected final onFailed(Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V
    .locals 2
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p2, "exception"    # Lorg/chromium/net/CronetException;

    .line 98
    .local p0, "this":Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;, "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<TT;>;"
    iget-object v0, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;

    .line 99
    .local v1, "callback":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-TT;>;"
    invoke-interface {v1, p1, p2}, Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;->onFailed(Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V

    .line 100
    .end local v1    # "callback":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-TT;>;"
    goto :goto_0

    .line 101
    :cond_0
    return-void
.end method

.method protected final onResponseStarted(Lorg/chromium/net/UrlResponseInfo;)V
    .locals 4
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 68
    .local p0, "this":Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;, "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<TT;>;"
    invoke-static {p1}, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->getBodyLength(Lorg/chromium/net/UrlResponseInfo;)J

    move-result-wide v0

    .line 69
    .local v0, "bodyLength":J
    const-wide/32 v2, 0x7ffffff7

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    .line 74
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 75
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    long-to-int v3, v0

    invoke-direct {v2, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    iput-object v2, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mResponseBodyStream:Ljava/io/ByteArrayOutputStream;

    goto :goto_0

    .line 77
    :cond_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v2, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mResponseBodyStream:Ljava/io/ByteArrayOutputStream;

    .line 79
    :goto_0
    iget-object v2, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mResponseBodyStream:Ljava/io/ByteArrayOutputStream;

    invoke-static {v2}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v2

    iput-object v2, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mResponseBodyChannel:Ljava/nio/channels/WritableByteChannel;

    .line 80
    return-void

    .line 70
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The body is too large and wouldn\'t fit in a byte array!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected final onSucceeded(Lorg/chromium/net/UrlResponseInfo;)V
    .locals 3
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 90
    .local p0, "this":Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;, "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<TT;>;"
    iget-object v0, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mResponseBodyStream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Ljava/lang/Object;

    move-result-object v0

    .line 91
    .local v0, "body":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->mListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;

    .line 92
    .local v2, "callback":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-TT;>;"
    invoke-interface {v2, p1, v0}, Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;->onSucceeded(Lorg/chromium/net/UrlResponseInfo;Ljava/lang/Object;)V

    .line 93
    .end local v2    # "callback":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-TT;>;"
    goto :goto_0

    .line 94
    :cond_0
    return-void
.end method

.method protected abstract transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/net/UrlResponseInfo;",
            "[B)TT;"
        }
    .end annotation
.end method
