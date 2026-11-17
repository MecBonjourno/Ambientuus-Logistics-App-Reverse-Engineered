.class final Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;
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
    name = "OnWriteCompletedRunnable"
.end annotation


# instance fields
.field private mByteBuffer:Ljava/nio/ByteBuffer;

.field private final mEndOfStream:Z

.field final synthetic this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;


# direct methods
.method constructor <init>(Lorg/chromium/net/impl/CronetBidirectionalStream;Ljava/nio/ByteBuffer;Z)V
    .locals 0
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .param p3, "endOfStream"    # Z

    .line 209
    iput-object p1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    iput-object p2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 211
    iput-boolean p3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->mEndOfStream:Z

    .line 212
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 218
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 219
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 220
    const/4 v1, 0x0

    .line 221
    .local v1, "maybeOnSucceeded":Z
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fgetmNativeStreamLock(Lorg/chromium/net/impl/CronetBidirectionalStream;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    :try_start_1
    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v3}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$misDoneLocked(Lorg/chromium/net/impl/CronetBidirectionalStream;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 223
    monitor-exit v2

    return-void

    .line 225
    :cond_0
    iget-boolean v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->mEndOfStream:Z

    if-eqz v3, :cond_2

    .line 226
    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    const/16 v4, 0xa

    invoke-static {v3, v4}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fputmWriteState(Lorg/chromium/net/impl/CronetBidirectionalStream;I)V

    .line 227
    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v3}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fgetmReadState(Lorg/chromium/net/impl/CronetBidirectionalStream;)I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    move v1, v3

    .line 229
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    :try_start_2
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fgetmCallback(Lorg/chromium/net/impl/CronetBidirectionalStream;)Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;

    move-result-object v2

    iget-object v3, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    iget-object v4, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v4}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$fgetmResponseInfo(Lorg/chromium/net/impl/CronetBidirectionalStream;)Lorg/chromium/net/impl/UrlResponseInfoImpl;

    move-result-object v4

    iget-boolean v5, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->mEndOfStream:Z

    invoke-virtual {v2, v3, v4, v0, v5}, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->onWriteCompleted(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;Z)V

    .line 232
    if-eqz v1, :cond_3

    .line 233
    iget-object v2, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v2}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$mmaybeOnSucceededOnExecutor(Lorg/chromium/net/impl/CronetBidirectionalStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 237
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "maybeOnSucceeded":Z
    :cond_3
    goto :goto_1

    .line 229
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

    .line 235
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "maybeOnSucceeded":Z
    :catch_0
    move-exception v0

    .line 236
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/chromium/net/impl/CronetBidirectionalStream$OnWriteCompletedRunnable;->this$0:Lorg/chromium/net/impl/CronetBidirectionalStream;

    invoke-static {v1, v0}, Lorg/chromium/net/impl/CronetBidirectionalStream;->-$$Nest$monCallbackException(Lorg/chromium/net/impl/CronetBidirectionalStream;Ljava/lang/Exception;)V

    .line 238
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method
