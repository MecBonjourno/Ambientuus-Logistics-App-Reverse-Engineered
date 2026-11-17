.class final Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;
.super Lorg/chromium/net/UploadDataProvider;
.source "UploadDataProviders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/apihelpers/UploadDataProviders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ByteBufferUploadProvider"
.end annotation


# instance fields
.field private final mUploadBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method private constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "uploadBuffer"    # Ljava/nio/ByteBuffer;

    .line 162
    invoke-direct {p0}, Lorg/chromium/net/UploadDataProvider;-><init>()V

    .line 163
    iput-object p1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    .line 164
    return-void
.end method

.method synthetic constructor <init>(Ljava/nio/ByteBuffer;Lorg/chromium/net/apihelpers/UploadDataProviders-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;-><init>(Ljava/nio/ByteBuffer;)V

    return-void
.end method


# virtual methods
.method public getLength()J
    .locals 2

    .line 168
    iget-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public read(Lorg/chromium/net/UploadDataSink;Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "uploadDataSink"    # Lorg/chromium/net/UploadDataSink;
    .param p2, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 173
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 176
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    iget-object v1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 177
    iget-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 179
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    .line 180
    .local v0, "oldLimit":I
    iget-object v1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 181
    iget-object v1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 182
    iget-object v1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 184
    .end local v0    # "oldLimit":I
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/chromium/net/UploadDataSink;->onReadSucceeded(Z)V

    .line 185
    return-void

    .line 174
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cronet passed a buffer with no bytes remaining"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public rewind(Lorg/chromium/net/UploadDataSink;)V
    .locals 2
    .param p1, "uploadDataSink"    # Lorg/chromium/net/UploadDataSink;

    .line 189
    iget-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;->mUploadBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 190
    invoke-virtual {p1}, Lorg/chromium/net/UploadDataSink;->onRewindSucceeded()V

    .line 191
    return-void
.end method
