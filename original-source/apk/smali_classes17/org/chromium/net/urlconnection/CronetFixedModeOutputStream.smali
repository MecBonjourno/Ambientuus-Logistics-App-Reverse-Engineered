.class final Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;
.super Lorg/chromium/net/urlconnection/CronetOutputStream;
.source "CronetFixedModeOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream$UploadDataProviderImpl;
    }
.end annotation


# static fields
.field private static sDefaultBufferLength:I


# instance fields
.field private final mBuffer:Ljava/nio/ByteBuffer;

.field private mBytesWritten:J

.field private final mConnection:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

.field private final mContentLength:J

.field private final mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

.field private final mUploadDataProvider:Lorg/chromium/net/UploadDataProvider;


# direct methods
.method static bridge synthetic -$$Nest$fgetmBuffer(Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;)Ljava/nio/ByteBuffer;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmContentLength(Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;)J
    .locals 2

    iget-wide v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mContentLength:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fgetmMessageLoop(Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;)Lorg/chromium/net/urlconnection/MessageLoop;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 30
    const/16 v0, 0x4000

    sput v0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->sDefaultBufferLength:I

    return-void
.end method

.method constructor <init>(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;JLorg/chromium/net/urlconnection/MessageLoop;)V
    .locals 6
    .param p1, "connection"    # Lorg/chromium/net/urlconnection/CronetHttpURLConnection;
    .param p2, "contentLength"    # J
    .param p4, "messageLoop"    # Lorg/chromium/net/urlconnection/MessageLoop;

    .line 59
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetOutputStream;-><init>()V

    .line 49
    new-instance v0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream$UploadDataProviderImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream$UploadDataProviderImpl;-><init>(Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream-IA;)V

    iput-object v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mUploadDataProvider:Lorg/chromium/net/UploadDataProvider;

    .line 60
    if-eqz p1, :cond_1

    .line 63
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_0

    .line 67
    iput-wide p2, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mContentLength:J

    .line 68
    iget-wide v2, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mContentLength:J

    sget v4, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->sDefaultBufferLength:I

    int-to-long v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 69
    .local v2, "bufferSize":I
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    iput-object v3, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    .line 70
    iput-object p1, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mConnection:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    .line 71
    iput-object p4, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    .line 72
    iput-wide v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    .line 73
    return-void

    .line 64
    .end local v2    # "bufferSize":I
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Content length must be larger than 0 for non-chunked upload."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method private checkNotExceedContentLength(I)V
    .locals 5
    .param p1, "numBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .line 143
    iget-wide v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iget-wide v2, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mContentLength:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 148
    return-void

    .line 144
    :cond_0
    new-instance v0, Ljava/net/ProtocolException;

    iget-wide v1, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mContentLength:J

    iget-wide v3, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    sub-long/2addr v1, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes but received "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private ensureBufferHasRemaining()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->uploadBufferInternal()V

    .line 111
    :cond_0
    return-void
.end method

.method static setDefaultBufferLengthForTesting(I)V
    .locals 0
    .param p0, "length"    # I

    .line 204
    sput p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->sDefaultBufferLength:I

    .line 205
    return-void
.end method

.method private uploadBufferInternal()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    invoke-virtual {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->checkNotClosed()V

    .line 133
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 134
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    invoke-virtual {v0}, Lorg/chromium/net/urlconnection/MessageLoop;->loop()V

    .line 135
    invoke-virtual {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->checkNoException()V

    .line 136
    return-void
.end method

.method private uploadIfComplete()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    iget-wide v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    iget-wide v2, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mContentLength:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 122
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->uploadBufferInternal()V

    .line 124
    :cond_0
    return-void
.end method


# virtual methods
.method checkReceivedEnoughContent()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    iget-wide v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    iget-wide v2, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mContentLength:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 162
    return-void

    .line 160
    :cond_0
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Content received is less than Content-Length."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getUploadDataProvider()Lorg/chromium/net/UploadDataProvider;
    .locals 1

    .line 166
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mUploadDataProvider:Lorg/chromium/net/UploadDataProvider;

    return-object v0
.end method

.method setConnected()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    return-void
.end method

.method public write(I)V
    .locals 4
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    invoke-virtual {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->checkNotClosed()V

    .line 78
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->checkNotExceedContentLength(I)V

    .line 79
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->ensureBufferHasRemaining()V

    .line 80
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    int-to-byte v1, p1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 81
    iget-wide v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    .line 82
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->uploadIfComplete()V

    .line 83
    return-void
.end method

.method public write([BII)V
    .locals 5
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 87
    invoke-virtual {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->checkNotClosed()V

    .line 88
    array-length v0, p1

    sub-int/2addr v0, p2

    if-lt v0, p3, :cond_1

    if-ltz p2, :cond_1

    if-ltz p3, :cond_1

    .line 91
    invoke-direct {p0, p3}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->checkNotExceedContentLength(I)V

    .line 92
    move v0, p3

    .line 93
    .local v0, "toSend":I
    :goto_0
    if-lez v0, :cond_0

    .line 94
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->ensureBufferHasRemaining()V

    .line 95
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 96
    .local v1, "sent":I
    iget-object v2, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    add-int v3, p2, p3

    sub-int/2addr v3, v0

    invoke-virtual {v2, p1, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 97
    sub-int/2addr v0, v1

    .line 98
    .end local v1    # "sent":I
    goto :goto_0

    .line 99
    :cond_0
    iget-wide v1, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    int-to-long v3, p3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->mBytesWritten:J

    .line 100
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;->uploadIfComplete()V

    .line 101
    return-void

    .line 89
    .end local v0    # "toSend":I
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method
