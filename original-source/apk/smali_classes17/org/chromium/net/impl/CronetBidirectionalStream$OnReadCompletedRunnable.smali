.class final Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;
.super Ljava/lang/Object;
.source "CronetBidirectionalStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/impl/CronetBidirectionalStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "OnReadCompletedRunnable"
.end annotation


# instance fields
.field mByteBuffer:Ljava/nio/ByteBuffer;

.field mEndOfStream:Z

.field final synthetic this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;


# direct methods
.method private constructor <init>(Lorg/chromium/net/impl/CronetBidirectionalStream;)V
    .locals 0

    .line 168
    iput-object p1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/net/impl/CronetBidirectionalStream;Lorg/chromium/net/impl/CronetBidirectionalStream-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;-><init>(Lorg/chromium/net/impl/CronetBidirectionalStream;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 178
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 179
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 180
    const/4 v1, 0x0

    .line 181
    .local v1, "maybeOnSucceeded":Z
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fgetmNativeStreamLock(Lorg/chromium/net/impl/CronetBidirectionalStream;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :try_start_1
    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v3}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$misDoneLocked(Lorg/chromium/net/impl/CronetBidirectionalStream;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 183
    monitor-exit v2

    return-void

    .line 185
    :cond_0
    iget-boolean v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->mEndOfStream:Z

    if-eqz v3, :cond_2

    .line 186
    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    const/4 v4, 0x4

    invoke-static {v3, v4}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fputmReadState(Lorg/chromium/net/impl/CronetBidirectionalStream;I)V

    .line 187
    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v3}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fgetmWriteState(Lorg/chromium/net/impl/CronetBidirectionalStream;)I

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    move v1, v3

    .end local v1    # "maybeOnSucceeded":Z
    .local v3, "maybeOnSucceeded":Z
    goto :goto_1

    .line 189
    .end local v3    # "maybeOnSucceeded":Z
    .restart local v1    # "maybeOnSucceeded":Z
    :cond_2
    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    const/4 v4, 0x2

    invoke-static {v3, v4}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fputmReadState(Lorg/chromium/net/impl/CronetBidirectionalStream;I)V

    .line 191
    :goto_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 192
    :try_start_2
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fgetmCallback(Lorg/chromium/net/impl/CronetBidirectionalStream;)Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;

    move-result-object v2

    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    iget-object v4, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v4}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fgetmResponseInfo(Lorg/chromium/net/impl/CronetBidirectionalStream;)Lorg/chromium/net/impl/UrlResponseInfoImpl;

    move-result-object v4

    iget-boolean v5, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->mEndOfStream:Z

    invoke-virtual {v2, v3, v4, v0, v5}, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->onReadCompleted(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;Z)V

    .line 194
    if-eqz v1, :cond_3

    .line 195
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$mmaybeOnSucceededOnExecutor(Lorg/chromium/net/impl/CronetBidirectionalStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 199
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "maybeOnSucceeded":Z
    :cond_3
    goto :goto_2

    .line 191
    .restart local v0    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v1    # "maybeOnSucceeded":Z
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 197
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "maybeOnSucceeded":Z
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnReadCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v1, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$monCallbackException(Lorg/chromium/net/impl/CronetBidirectionalStream;Ljava/lang/Exception;)V

    .line 200
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method
