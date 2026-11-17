.class final Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;
.super Lorg/chromium/net/UploadDataProvider;
.source "UploadDataProviders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/apihelpers/UploadDataProviders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FileUploadProvider"
.end annotation


# instance fields
.field private volatile mChannel:Ljava/nio/channels/FileChannel;

.field private final mLock:Ljava/lang/Object;

.field private final mProvider:Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;


# direct methods
.method private constructor <init>(Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;)V
    .locals 1
    .param p1, "provider"    # Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;

    .line 102
    invoke-direct {p0}, Lorg/chromium/net/UploadDataProvider;-><init>()V

    .line 100
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mLock:Ljava/lang/Object;

    .line 103
    iput-object p1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mProvider:Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;

    .line 104
    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;Lorg/chromium/net/apihelpers/UploadDataProviders-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;-><init>(Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;)V

    return-void
.end method

.method private getChannel()Ljava/nio/channels/FileChannel;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    iget-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mChannel:Ljava/nio/channels/FileChannel;

    if-nez v0, :cond_1

    .line 141
    iget-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 142
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mChannel:Ljava/nio/channels/FileChannel;

    if-nez v1, :cond_0

    .line 143
    iget-object v1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mProvider:Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;

    invoke-interface {v1}, Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mChannel:Ljava/nio/channels/FileChannel;

    .line 145
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 147
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mChannel:Ljava/nio/channels/FileChannel;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    iget-object v0, p0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->mChannel:Ljava/nio/channels/FileChannel;

    .line 153
    .local v0, "channel":Ljava/nio/channels/FileChannel;
    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 156
    :cond_0
    return-void
.end method

.method public getLength()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method public read(Lorg/chromium/net/UploadDataSink;Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "uploadDataSink"    # Lorg/chromium/net/UploadDataSink;
    .param p2, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 116
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 117
    .local v0, "channel":Ljava/nio/channels/FileChannel;
    const/4 v1, 0x0

    .line 118
    .local v1, "bytesRead":I
    :goto_0
    if-nez v1, :cond_1

    .line 119
    invoke-virtual {v0, p2}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v2

    .line 120
    .local v2, "read":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 121
    goto :goto_1

    .line 123
    :cond_0
    add-int/2addr v1, v2

    .line 125
    .end local v2    # "read":I
    goto :goto_0

    .line 126
    :cond_1
    :goto_1
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lorg/chromium/net/UploadDataSink;->onReadSucceeded(Z)V

    .line 127
    return-void

    .line 114
    .end local v0    # "channel":Ljava/nio/channels/FileChannel;
    .end local v1    # "bytesRead":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cronet passed a buffer with no bytes remaining"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public rewind(Lorg/chromium/net/UploadDataSink;)V
    .locals 3
    .param p1, "uploadDataSink"    # Lorg/chromium/net/UploadDataSink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 132
    invoke-virtual {p1}, Lorg/chromium/net/UploadDataSink;->onRewindSucceeded()V

    .line 133
    return-void
.end method
