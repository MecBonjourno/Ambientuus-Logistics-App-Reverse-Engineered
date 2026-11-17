.class public final Lorg/chromium/net/impl/CronetUploadDataStream;
.super Lorg/chromium/net/UploadDataSink;
.source "CronetUploadDataStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/CronetUploadDataStream$UserCallback;,
        Lorg/chromium/net/impl/CronetUploadDataStream$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "cronet"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mByteBuffer:Ljava/nio/ByteBuffer;

.field private mByteBufferLimit:J

.field private final mDataProvider:Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;

.field private mDestroyAdapterPostponed:Z

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mInWhichUserCallback:I

.field private mLength:J

.field private final mLock:Ljava/lang/Object;

.field private mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

.field private final mReadTask:Ljava/lang/Runnable;

.field private mRemainingLength:J

.field private final mRequest:Lorg/chromium/net/impl/CronetUrlRequest;

.field private mUploadDataStreamAdapter:J


# direct methods
.method static bridge synthetic -$$Nest$fgetmByteBuffer(Lorg/chromium/net/impl/CronetUploadDataStream;)Ljava/nio/ByteBuffer;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDataProvider(Lorg/chromium/net/impl/CronetUploadDataStream;)Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mDataProvider:Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmLock(Lorg/chromium/net/impl/CronetUploadDataStream;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUploadDataStreamAdapter(Lorg/chromium/net/impl/CronetUploadDataStream;)J
    .locals 2

    iget-wide v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fputmInWhichUserCallback(Lorg/chromium/net/impl/CronetUploadDataStream;I)V
    .locals 0

    iput p1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckCallingThread(Lorg/chromium/net/impl/CronetUploadDataStream;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUploadDataStream;->checkCallingThread()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckState(Lorg/chromium/net/impl/CronetUploadDataStream;I)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetUploadDataStream;->checkState(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$monError(Lorg/chromium/net/impl/CronetUploadDataStream;Ljava/lang/Throwable;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetUploadDataStream;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetTAG()Ljava/lang/String;
    .locals 1

    sget-object v0, Lorg/chromium/net/impl/CronetUploadDataStream;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 41
    const-class v0, Lorg/chromium/net/impl/CronetUploadDataStream;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/CronetUploadDataStream;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;Lorg/chromium/net/impl/CronetUrlRequest;)V
    .locals 1
    .param p1, "dataProvider"    # Lorg/chromium/net/UploadDataProvider;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "request"    # Lorg/chromium/net/impl/CronetUrlRequest;

    .line 112
    invoke-direct {p0}, Lorg/chromium/net/UploadDataSink;-><init>()V

    .line 51
    new-instance v0, Lorg/chromium/net/impl/CronetUploadDataStream$1;

    invoke-direct {v0, p0}, Lorg/chromium/net/impl/CronetUploadDataStream$1;-><init>(Lorg/chromium/net/impl/CronetUploadDataStream;)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mReadTask:Ljava/lang/Runnable;

    .line 82
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    .line 100
    const/4 v0, 0x3

    iput v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    .line 113
    iput-object p2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mExecutor:Ljava/util/concurrent/Executor;

    .line 114
    new-instance v0, Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;

    invoke-direct {v0, p1}, Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;-><init>(Lorg/chromium/net/UploadDataProvider;)V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mDataProvider:Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;

    .line 115
    iput-object p3, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRequest:Lorg/chromium/net/impl/CronetUrlRequest;

    .line 116
    return-void
.end method

.method private checkCallingThread()V
    .locals 1

    .line 161
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRequest:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetUrlRequest;->checkCallingThread()V

    .line 162
    return-void
.end method

.method private checkState(I)V
    .locals 4
    .param p1, "mode"    # I

    .line 166
    iget v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    if-ne v0, p1, :cond_0

    .line 170
    return-void

    .line 167
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    iget v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private destroyAdapter()V
    .locals 7

    .line 300
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 301
    :try_start_0
    iget v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    if-nez v1, :cond_0

    .line 303
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mDestroyAdapterPostponed:Z

    .line 304
    monitor-exit v0

    return-void

    .line 306
    :cond_0
    iget-wide v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    .line 307
    monitor-exit v0

    return-void

    .line 309
    :cond_1
    invoke-static {}, Lorg/chromium/net/impl/CronetUploadDataStreamJni;->get()Lorg/chromium/net/impl/CronetUploadDataStream$Natives;

    move-result-object v1

    iget-wide v5, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    invoke-interface {v1, v5, v6}, Lorg/chromium/net/impl/CronetUploadDataStream$Natives;->destroy(J)V

    .line 310
    iput-wide v3, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    .line 311
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    if-eqz v1, :cond_2

    .line 312
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 314
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 315
    new-instance v0, Lorg/chromium/net/impl/CronetUploadDataStream$3;

    invoke-direct {v0, p0}, Lorg/chromium/net/impl/CronetUploadDataStream$3;-><init>(Lorg/chromium/net/impl/CronetUploadDataStream;)V

    invoke-virtual {p0, v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 326
    return-void

    .line 314
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private destroyAdapterIfPostponed()V
    .locals 3

    .line 334
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 335
    :try_start_0
    iget v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    if-eqz v1, :cond_1

    .line 339
    iget-boolean v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mDestroyAdapterPostponed:Z

    if-eqz v1, :cond_0

    .line 340
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUploadDataStream;->destroyAdapter()V

    .line 342
    :cond_0
    monitor-exit v0

    .line 343
    return-void

    .line 336
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Method should not be called when read has not completed."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 342
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "exception"    # Ljava/lang/Throwable;

    .line 189
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 190
    :try_start_0
    iget v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_2

    .line 195
    iget v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    const/4 v3, 0x2

    if-ne v1, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 196
    .local v1, "sendClose":Z
    :goto_0
    iput v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    .line 197
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 198
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUploadDataStream;->destroyAdapterIfPostponed()V

    .line 199
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    if-eqz v1, :cond_1

    .line 205
    :try_start_1
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mDataProvider:Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;

    invoke-virtual {v0}, Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 208
    goto :goto_1

    .line 206
    :catch_0
    move-exception v0

    .line 207
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/chromium/net/impl/CronetUploadDataStream;->TAG:Ljava/lang/String;

    const-string v3, "Failure closing data provider"

    invoke-static {v2, v3, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 215
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRequest:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-virtual {v0, p1}, Lorg/chromium/net/impl/CronetUrlRequest;->onUploadException(Ljava/lang/Throwable;)V

    .line 216
    return-void

    .line 191
    .end local v1    # "sendClose":Z
    :cond_2
    :try_start_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "There is no read or rewind or length check in progress."

    invoke-direct {v1, v2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local p1    # "exception":Ljava/lang/Throwable;
    throw v1

    .line 199
    .restart local p1    # "exception":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method


# virtual methods
.method attachNativeAdapterToRequest(J)V
    .locals 8
    .param p1, "requestAdapter"    # J

    .line 373
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 374
    :try_start_0
    invoke-static {}, Lorg/chromium/net/impl/CronetUploadDataStreamJni;->get()Lorg/chromium/net/impl/CronetUploadDataStream$Natives;

    move-result-object v2

    iget-wide v6, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v3, p0

    move-wide v4, p1

    .end local p1    # "requestAdapter":J
    .local v4, "requestAdapter":J
    :try_start_1
    invoke-interface/range {v2 .. v7}, Lorg/chromium/net/impl/CronetUploadDataStream$Natives;->attachUploadDataToRequest(Lorg/chromium/net/impl/CronetUploadDataStream;JJ)J

    move-result-wide p1

    iput-wide p1, v3, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    .line 376
    monitor-exit v1

    .line 377
    return-void

    .line 376
    .end local v4    # "requestAdapter":J
    .restart local p1    # "requestAdapter":J
    :catchall_0
    move-exception v0

    move-object v3, p0

    move-wide v4, p1

    move-object p1, v0

    .end local p1    # "requestAdapter":J
    .restart local v4    # "requestAdapter":J
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :catchall_1
    move-exception v0

    move-object p1, v0

    goto :goto_0
.end method

.method public createUploadDataStreamForTesting()J
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 385
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 386
    :try_start_0
    invoke-static {}, Lorg/chromium/net/impl/CronetUploadDataStreamJni;->get()Lorg/chromium/net/impl/CronetUploadDataStream$Natives;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/chromium/net/impl/CronetUploadDataStream$Natives;->createAdapterForTesting(Lorg/chromium/net/impl/CronetUploadDataStream;)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    .line 388
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mDataProvider:Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;

    invoke-virtual {v0}, Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;->getLength()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    .line 389
    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    iput-wide v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRemainingLength:J

    .line 390
    invoke-static {}, Lorg/chromium/net/impl/CronetUploadDataStreamJni;->get()Lorg/chromium/net/impl/CronetUploadDataStream$Natives;

    move-result-object v4

    iget-wide v6, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    iget-wide v8, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    move-object v5, p0

    invoke-interface/range {v4 .. v9}, Lorg/chromium/net/impl/CronetUploadDataStream$Natives;->createUploadDataStreamForTesting(Lorg/chromium/net/impl/CronetUploadDataStream;JJ)J

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    .line 392
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method initializeWithRequest()V
    .locals 2

    .line 353
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 354
    const/4 v1, 0x2

    :try_start_0
    iput v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    .line 355
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 357
    :try_start_1
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRequest:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetUrlRequest;->checkCallingThread()V

    .line 358
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mDataProvider:Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;

    invoke-virtual {v0}, Lorg/chromium/net/impl/VersionSafeCallbacks$UploadDataProviderWrapper;->getLength()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    .line 359
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    iput-wide v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRemainingLength:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 362
    goto :goto_0

    .line 360
    :catchall_0
    move-exception v0

    .line 361
    .local v0, "t":Ljava/lang/Throwable;
    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->onError(Ljava/lang/Throwable;)V

    .line 363
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 364
    const/4 v0, 0x3

    :try_start_2
    iput v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    .line 365
    monitor-exit v1

    .line 366
    return-void

    .line 365
    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    .line 355
    :catchall_2
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v1
.end method

.method public onReadError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .line 252
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 253
    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetUploadDataStream;->checkState(I)V

    .line 254
    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetUploadDataStream;->onError(Ljava/lang/Throwable;)V

    .line 255
    monitor-exit v0

    .line 256
    return-void

    .line 255
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onReadSucceeded(Z)V
    .locals 11
    .param p1, "lastChunk"    # Z

    .line 221
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 222
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->checkState(I)V

    .line 223
    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBufferLimit:J

    iget-object v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_5

    .line 226
    const-wide/16 v2, 0x0

    if-eqz p1, :cond_1

    :try_start_1
    iget-wide v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    cmp-long v4, v4, v2

    if-gez v4, :cond_0

    goto :goto_0

    .line 227
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "Non-chunked upload can\'t have last chunk"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "lastChunk":Z
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 247
    .restart local p1    # "lastChunk":Z
    :catchall_0
    move-exception v0

    move v10, p1

    goto/16 :goto_2

    .line 229
    :cond_1
    :goto_0
    :try_start_2
    iget-object v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    move v9, v4

    .line 230
    .local v9, "bytesRead":I
    iget-wide v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRemainingLength:J

    int-to-long v6, v9

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRemainingLength:J

    .line 231
    iget-wide v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRemainingLength:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    cmp-long v4, v4, v2

    if-gez v4, :cond_3

    :try_start_3
    iget-wide v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    cmp-long v4, v4, v2

    if-gez v4, :cond_2

    goto :goto_1

    .line 232
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Read upload data length %d exceeds expected length %d"

    iget-wide v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    iget-wide v6, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRemainingLength:J

    sub-long/2addr v4, v6

    .line 234
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v5, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v0

    const/4 v0, 0x1

    aput-object v5, v6, v0

    .line 233
    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "lastChunk":Z
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 236
    .restart local p1    # "lastChunk":Z
    :cond_3
    :goto_1
    :try_start_4
    iget-object v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 237
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 238
    const/4 v0, 0x3

    iput v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    .line 240
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUploadDataStream;->destroyAdapterIfPostponed()V

    .line 242
    iget-wide v4, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    cmp-long v0, v4, v2

    if-nez v0, :cond_4

    .line 243
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    return-void

    .line 245
    :cond_4
    :try_start_6
    invoke-static {}, Lorg/chromium/net/impl/CronetUploadDataStreamJni;->get()Lorg/chromium/net/impl/CronetUploadDataStream$Natives;

    move-result-object v5

    iget-wide v6, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    move-object v8, p0

    move v10, p1

    .end local p1    # "lastChunk":Z
    .local v10, "lastChunk":Z
    :try_start_7
    invoke-interface/range {v5 .. v10}, Lorg/chromium/net/impl/CronetUploadDataStream$Natives;->onReadSucceeded(JLorg/chromium/net/impl/CronetUploadDataStream;IZ)V

    .line 247
    .end local v9    # "bytesRead":I
    monitor-exit v1

    .line 248
    return-void

    .line 224
    .end local v10    # "lastChunk":Z
    .restart local p1    # "lastChunk":Z
    :cond_5
    move v10, p1

    .end local p1    # "lastChunk":Z
    .restart local v10    # "lastChunk":Z
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "ByteBuffer limit changed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v10    # "lastChunk":Z
    throw p1

    .line 247
    .restart local p1    # "lastChunk":Z
    :catchall_1
    move-exception v0

    move v10, p1

    .end local p1    # "lastChunk":Z
    .restart local v10    # "lastChunk":Z
    :goto_2
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_2
.end method

.method public onRewindError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .line 275
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 276
    const/4 v1, 0x1

    :try_start_0
    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetUploadDataStream;->checkState(I)V

    .line 277
    invoke-direct {p0, p1}, Lorg/chromium/net/impl/CronetUploadDataStream;->onError(Ljava/lang/Throwable;)V

    .line 278
    monitor-exit v0

    .line 279
    return-void

    .line 278
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onRewindSucceeded()V
    .locals 5

    .line 260
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 261
    const/4 v1, 0x1

    :try_start_0
    invoke-direct {p0, v1}, Lorg/chromium/net/impl/CronetUploadDataStream;->checkState(I)V

    .line 262
    const/4 v1, 0x3

    iput v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mInWhichUserCallback:I

    .line 263
    iget-wide v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mLength:J

    iput-wide v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRemainingLength:J

    .line 265
    iget-wide v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 266
    monitor-exit v0

    return-void

    .line 268
    :cond_0
    invoke-static {}, Lorg/chromium/net/impl/CronetUploadDataStreamJni;->get()Lorg/chromium/net/impl/CronetUploadDataStream$Natives;

    move-result-object v1

    iget-wide v2, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mUploadDataStreamAdapter:J

    invoke-interface {v1, v2, v3, p0}, Lorg/chromium/net/impl/CronetUploadDataStream$Natives;->onRewindSucceeded(JLorg/chromium/net/impl/CronetUploadDataStream;)V

    .line 270
    monitor-exit v0

    .line 271
    return-void

    .line 270
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onUploadDataStreamDestroyed()V
    .locals 0

    .line 180
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetUploadDataStream;->destroyAdapter()V

    .line 181
    return-void
.end method

.method postTaskToExecutor(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "task"    # Ljava/lang/Runnable;

    .line 286
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 291
    goto :goto_0

    .line 287
    :catchall_0
    move-exception v0

    .line 290
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mRequest:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-virtual {v1, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->onUploadException(Ljava/lang/Throwable;)V

    .line 292
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method

.method readData(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 125
    iput-object p1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 126
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mByteBufferLimit:J

    .line 127
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mReadTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 128
    return-void
.end method

.method rewind()V
    .locals 1

    .line 139
    new-instance v0, Lorg/chromium/net/impl/CronetUploadDataStream$2;

    invoke-direct {v0, p0}, Lorg/chromium/net/impl/CronetUploadDataStream$2;-><init>(Lorg/chromium/net/impl/CronetUploadDataStream;)V

    .line 157
    .local v0, "task":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lorg/chromium/net/impl/CronetUploadDataStream;->postTaskToExecutor(Ljava/lang/Runnable;)V

    .line 158
    return-void
.end method

.method setOnDestroyedCallbackForTesting(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "onDestroyedCallbackForTesting"    # Ljava/lang/Runnable;

    .line 396
    iput-object p1, p0, Lorg/chromium/net/impl/CronetUploadDataStream;->mOnDestroyedCallbackForTesting:Ljava/lang/Runnable;

    .line 397
    return-void
.end method
