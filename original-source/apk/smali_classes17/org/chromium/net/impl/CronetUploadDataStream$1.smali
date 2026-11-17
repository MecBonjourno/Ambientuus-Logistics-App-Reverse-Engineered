.class Lorg/chromium/net/impl/CronetUploadDataStream$1;
.super Ljava/lang/Object;
.source "CronetUploadDataStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/impl/CronetUploadDataStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lorg/chromium/net/impl/CronetUploadDataStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    const-class v0, Lorg/chromium/net/impl/CronetUploadDataStream;

    return-void
.end method

.method constructor <init>(Lorg/chromium/net/impl/CronetUploadDataStream;)V
    .locals 0
    .param p1, "this$0"    # Lorg/chromium/net/impl/CronetUploadDataStream;

    .line 51
    iput-object p1, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 54
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$fgetmLock(Lorg/chromium/net/impl/CronetUploadDataStream;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 55
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-static {v1}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$fgetmUploadDataStreamAdapter(Lorg/chromium/net/impl/CronetUploadDataStream;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 56
    monitor-exit v0

    return-void

    .line 58
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    const/4 v2, 0x3

    invoke-static {v1, v2}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$mcheckState(Lorg/chromium/net/impl/CronetUploadDataStream;I)V

    .line 59
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-static {v1}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$fgetmByteBuffer(Lorg/chromium/net/impl/CronetUploadDataStream;)Ljava/nio/ByteBuffer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 62
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$fputmInWhichUserCallback(Lorg/chromium/net/impl/CronetUploadDataStream;I)V

    .line 63
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    :try_start_1
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$mcheckCallingThread(Lorg/chromium/net/impl/CronetUploadDataStream;)V

    .line 66
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$fgetmByteBuffer(Lorg/chromium/net/impl/CronetUploadDataStream;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-nez v0, :cond_1

    .line 67
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$fgetmDataProvider(Lorg/chromium/net/impl/CronetUploadDataStream;)Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;

    move-result-object v0

    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    iget-object v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-static {v2}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$fgetmByteBuffer(Lorg/chromium/net/impl/CronetUploadDataStream;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;->read(Lorg/chromium/net/UploadDataSink;Ljava/nio/ByteBuffer;)V

    .line 70
    goto :goto_0

    .line 66
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 68
    :catch_0
    move-exception v0

    .line 69
    .local v0, "exception":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream$1;->this$0:Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-static {v1, v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->-$$Nest$monError(Lorg/chromium/net/impl/CronetUploadDataStream;Ljava/lang/Throwable;)V

    .line 71
    .end local v0    # "exception":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 60
    :cond_2
    :try_start_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Unexpected readData call. Buffer is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 63
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
