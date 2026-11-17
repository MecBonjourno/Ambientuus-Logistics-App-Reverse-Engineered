.class abstract Landroidx/camera/video/Recorder$RecordingRecord;
.super Ljava/lang/Object;
.source "Recorder.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/Recorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "RecordingRecord"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;,
        Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    }
.end annotation


# instance fields
.field private final mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;",
            ">;"
        }
    .end annotation
.end field

.field private final mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

.field private final mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mMediaMuxerSupplier:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;",
            ">;"
        }
    .end annotation
.end field

.field private final mMuted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroidx/core/util/Consumer<",
            "Landroid/net/Uri;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mRecordingState:Landroidx/camera/core/impl/MutableStateObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 3

    .line 3167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3169
    invoke-static {}, Landroidx/camera/core/impl/utils/CloseGuardHelper;->create()Landroidx/camera/core/impl/utils/CloseGuardHelper;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

    .line 3171
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 3173
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMediaMuxerSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    .line 3176
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    .line 3179
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v2, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;

    invoke-direct {v2}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;-><init>()V

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 3184
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMuted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 3186
    nop

    .line 3187
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/MutableStateObservable;->withInitialState(Ljava/lang/Object;)Landroidx/camera/core/impl/MutableStateObservable;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingState:Landroidx/camera/core/impl/MutableStateObservable;

    .line 3186
    return-void
.end method

.method private finalizeRecordingInternal(Landroidx/core/util/Consumer;Landroid/net/Uri;)V
    .locals 3
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/net/Uri;",
            ")V"
        }
    .end annotation

    .line 3590
    .local p1, "finalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    if-eqz p1, :cond_0

    .line 3594
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/CloseGuardHelper;->close()V

    .line 3595
    invoke-interface {p1, p2}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    .line 3596
    return-void

    .line 3591
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has already been finalized"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method static from(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recorder$RecordingRecord;
    .locals 8
    .param p0, "pendingRecording"    # Landroidx/camera/video/PendingRecording;
    .param p1, "recordingId"    # J

    .line 3191
    new-instance v0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;

    .line 3192
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 3193
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->getListenerExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 3194
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->getEventListener()Landroidx/core/util/Consumer;

    move-result-object v3

    .line 3195
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->isAudioEnabled()Z

    move-result v4

    .line 3196
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->isPersistent()Z

    move-result v5

    move-wide v6, p1

    .end local p1    # "recordingId":J
    .local v6, "recordingId":J
    invoke-direct/range {v0 .. v7}, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;-><init>(Landroidx/camera/video/OutputOptions;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;ZZJ)V

    .line 3199
    .local v0, "recordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->isAudioInitialMuted()Z

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/camera/video/Recorder$RecordingRecord;->mute(Z)V

    .line 3200
    return-object v0
.end method

.method static synthetic lambda$initializeRecording$1(Landroidx/camera/video/OutputOptions;Landroid/os/ParcelFileDescriptor;ILandroidx/core/util/Consumer;)Landroid/media/MediaMuxer;
    .locals 8
    .param p0, "outputOptions"    # Landroidx/camera/video/OutputOptions;
    .param p1, "dupedParcelFileDescriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "muxerOutputFormat"    # I
    .param p3, "outputUriCreatedCallback"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3244
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 3245
    .local v0, "outputUri":Landroid/net/Uri;
    instance-of v1, p0, Landroidx/camera/video/FileOutputOptions;

    const-string v2, "Failed to create folder for "

    const-string v3, "Recorder"

    if-eqz v1, :cond_1

    .line 3246
    move-object v1, p0

    check-cast v1, Landroidx/camera/video/FileOutputOptions;

    .line 3247
    .local v1, "fileOutputOptions":Landroidx/camera/video/FileOutputOptions;
    invoke-virtual {v1}, Landroidx/camera/video/FileOutputOptions;->getFile()Ljava/io/File;

    move-result-object v4

    .line 3248
    .local v4, "file":Ljava/io/File;
    invoke-static {v4}, Landroidx/camera/video/internal/utils/OutputUtil;->createParentFolder(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 3249
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 3250
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3249
    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 3252
    :cond_0
    new-instance v2, Landroid/media/MediaMuxer;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p2}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 3253
    .local v2, "mediaMuxer":Landroid/media/MediaMuxer;
    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 3254
    .end local v1    # "fileOutputOptions":Landroidx/camera/video/FileOutputOptions;
    .end local v4    # "file":Ljava/io/File;
    goto/16 :goto_1

    .end local v2    # "mediaMuxer":Landroid/media/MediaMuxer;
    :cond_1
    instance-of v1, p0, Landroidx/camera/video/FileDescriptorOutputOptions;

    const/16 v4, 0x1a

    if-eqz v1, :cond_3

    .line 3255
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v4, :cond_2

    .line 3258
    nop

    .line 3259
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    .line 3258
    invoke-static {v1, p2}, Landroidx/camera/video/internal/compat/Api26Impl;->createMediaMuxer(Ljava/io/FileDescriptor;I)Landroid/media/MediaMuxer;

    move-result-object v2

    .restart local v2    # "mediaMuxer":Landroid/media/MediaMuxer;
    goto/16 :goto_1

    .line 3262
    .end local v2    # "mediaMuxer":Landroid/media/MediaMuxer;
    :cond_2
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MediaMuxer doesn\'t accept FileDescriptor as output destination."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 3266
    :cond_3
    instance-of v1, p0, Landroidx/camera/video/MediaStoreOutputOptions;

    if-eqz v1, :cond_9

    .line 3267
    move-object v1, p0

    check-cast v1, Landroidx/camera/video/MediaStoreOutputOptions;

    .line 3270
    .local v1, "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    new-instance v5, Landroid/content/ContentValues;

    .line 3271
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .line 3272
    .local v5, "contentValues":Landroid/content/ContentValues;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1d

    if-lt v6, v7, :cond_4

    .line 3274
    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v7, "is_pending"

    invoke-virtual {v5, v7, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 3277
    :cond_4
    :try_start_0
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    .line 3278
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getCollectionUri()Landroid/net/Uri;

    move-result-object v7

    .line 3277
    invoke-virtual {v6, v7, v5}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v6

    .line 3282
    nop

    .line 3283
    if-eqz v0, :cond_8

    .line 3287
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v6, v4, :cond_7

    .line 3288
    nop

    .line 3289
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .line 3288
    const-string v6, "_data"

    invoke-static {v4, v0, v6}, Landroidx/camera/video/internal/utils/OutputUtil;->getAbsolutePathFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 3291
    .local v4, "path":Ljava/lang/String;
    if-eqz v4, :cond_6

    .line 3295
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Landroidx/camera/video/internal/utils/OutputUtil;->createParentFolder(Ljava/io/File;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 3296
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 3298
    :cond_5
    new-instance v2, Landroid/media/MediaMuxer;

    invoke-direct {v2, v4, p2}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 3299
    .end local v4    # "path":Ljava/lang/String;
    .restart local v2    # "mediaMuxer":Landroid/media/MediaMuxer;
    goto :goto_0

    .line 3292
    .end local v2    # "mediaMuxer":Landroid/media/MediaMuxer;
    .restart local v4    # "path":Ljava/lang/String;
    :cond_6
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to get path from uri "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3300
    .end local v4    # "path":Ljava/lang/String;
    :cond_7
    nop

    .line 3301
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 3302
    const-string/jumbo v3, "rw"

    invoke-virtual {v2, v0, v3}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    .line 3303
    .local v2, "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    nop

    .line 3304
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    .line 3303
    invoke-static {v3, p2}, Landroidx/camera/video/internal/compat/Api26Impl;->createMediaMuxer(Ljava/io/FileDescriptor;I)Landroid/media/MediaMuxer;

    move-result-object v3

    .line 3306
    .local v3, "mediaMuxer":Landroid/media/MediaMuxer;
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    move-object v2, v3

    .line 3308
    .end local v1    # "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    .end local v3    # "mediaMuxer":Landroid/media/MediaMuxer;
    .end local v5    # "contentValues":Landroid/content/ContentValues;
    .local v2, "mediaMuxer":Landroid/media/MediaMuxer;
    :goto_0
    nop

    .line 3313
    :goto_1
    invoke-interface {p3, v0}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    .line 3314
    return-object v2

    .line 3284
    .end local v2    # "mediaMuxer":Landroid/media/MediaMuxer;
    .restart local v1    # "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    .restart local v5    # "contentValues":Landroid/content/ContentValues;
    :cond_8
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Unable to create MediaStore entry."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3279
    :catch_0
    move-exception v2

    .line 3280
    .local v2, "e":Ljava/lang/RuntimeException;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to create MediaStore entry by "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 3309
    .end local v1    # "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    .end local v2    # "e":Ljava/lang/RuntimeException;
    .end local v5    # "contentValues":Landroid/content/ContentValues;
    :cond_9
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid output options type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 3311
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method static synthetic lambda$initializeRecording$2(Landroidx/camera/video/MediaStoreOutputOptions;Landroid/net/Uri;)V
    .locals 3
    .param p0, "mediaStoreOutputOptions"    # Landroidx/camera/video/MediaStoreOutputOptions;
    .param p1, "outputUri"    # Landroid/net/Uri;

    .line 3361
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3362
    return-void

    .line 3364
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 3365
    .local v0, "contentValues":Landroid/content/ContentValues;
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "is_pending"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 3366
    invoke-virtual {p0}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 3368
    return-void
.end method

.method static synthetic lambda$initializeRecording$3(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 4
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "uri"    # Landroid/net/Uri;

    .line 3384
    const/4 v0, 0x1

    const/4 v1, 0x0

    const-string v2, "Recorder"

    if-nez p1, :cond_0

    .line 3385
    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v1

    const-string v1, "File scanning operation failed [path: %s]"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 3388
    :cond_0
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v1

    aput-object p1, v3, v0

    const-string v0, "File scan completed successfully [path: %s, URI: %s]"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3392
    :goto_0
    return-void
.end method

.method static synthetic lambda$initializeRecording$4(Landroidx/camera/video/MediaStoreOutputOptions;Landroid/content/Context;Landroid/net/Uri;)V
    .locals 4
    .param p0, "mediaStoreOutputOptions"    # Landroidx/camera/video/MediaStoreOutputOptions;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "outputUri"    # Landroid/net/Uri;

    .line 3373
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p2, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3374
    return-void

    .line 3376
    :cond_0
    nop

    .line 3377
    invoke-virtual {p0}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 3376
    const-string v1, "_data"

    invoke-static {v0, p2, v1}, Landroidx/camera/video/internal/utils/OutputUtil;->getAbsolutePathFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3379
    .local v0, "filePath":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 3382
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda4;-><init>()V

    const/4 v3, 0x0

    invoke-static {p1, v1, v3, v2}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    goto :goto_0

    .line 3394
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Skipping media scanner scan. Unable to retrieve file path from URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Recorder"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3398
    :goto_0
    return-void
.end method

.method static synthetic lambda$initializeRecording$5(Landroid/os/ParcelFileDescriptor;Landroid/net/Uri;)V
    .locals 3
    .param p0, "dupedParcelFileDescriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p1, "ignored"    # Landroid/net/Uri;

    .line 3404
    :try_start_0
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3409
    goto :goto_0

    .line 3405
    :catch_0
    move-exception v0

    .line 3408
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "Recorder"

    const-string v2, "Failed to close dup\'d ParcelFileDescriptor"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3410
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method static synthetic lambda$new$0(Landroid/net/Uri;)V
    .locals 0
    .param p0, "ignored"    # Landroid/net/Uri;

    .line 3182
    return-void
.end method

.method private updateRecordingState(Landroidx/camera/video/VideoRecordEvent;)V
    .locals 2
    .param p1, "event"    # Landroidx/camera/video/VideoRecordEvent;

    .line 3455
    instance-of v0, p1, Landroidx/camera/video/VideoRecordEvent$Start;

    if-nez v0, :cond_2

    instance-of v0, p1, Landroidx/camera/video/VideoRecordEvent$Resume;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 3458
    :cond_0
    instance-of v0, p1, Landroidx/camera/video/VideoRecordEvent$Pause;

    if-nez v0, :cond_1

    instance-of v0, p1, Landroidx/camera/video/VideoRecordEvent$Finalize;

    if-eqz v0, :cond_3

    .line 3460
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingState:Landroidx/camera/core/impl/MutableStateObservable;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    goto :goto_1

    .line 3457
    :cond_2
    :goto_0
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingState:Landroidx/camera/core/impl/MutableStateObservable;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 3462
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 3571
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecording(Landroid/net/Uri;)V

    .line 3572
    return-void
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 3578
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/CloseGuardHelper;->warnIfOpen()V

    .line 3579
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/util/Consumer;

    .line 3580
    .local v0, "finalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    if-eqz v0, :cond_0

    .line 3581
    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-direct {p0, v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecordingInternal(Landroidx/core/util/Consumer;Landroid/net/Uri;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3584
    .end local v0    # "finalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 3585
    nop

    .line 3586
    return-void

    .line 3584
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 3585
    throw v0
.end method

.method finalizeRecording(Landroid/net/Uri;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .line 3543
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3544
    return-void

    .line 3546
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/util/Consumer;

    invoke-direct {p0, v0, p1}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecordingInternal(Landroidx/core/util/Consumer;Landroid/net/Uri;)V

    .line 3547
    return-void
.end method

.method abstract getCallbackExecutor()Ljava/util/concurrent/Executor;
.end method

.method abstract getEventListener()Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;"
        }
    .end annotation
.end method

.method abstract getOutputOptions()Landroidx/camera/video/OutputOptions;
.end method

.method abstract getRecordingId()J
.end method

.method getRecordingState()Landroidx/camera/core/impl/StateObservable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/StateObservable<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 3467
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingState:Landroidx/camera/core/impl/MutableStateObservable;

    return-object v0
.end method

.method abstract hasAudioEnabled()Z
.end method

.method initializeRecording(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3223
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_7

    .line 3226
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    .line 3229
    .local v0, "outputOptions":Landroidx/camera/video/OutputOptions;
    instance-of v1, v0, Landroidx/camera/video/FileDescriptorOutputOptions;

    if-eqz v1, :cond_0

    .line 3232
    move-object v1, v0

    check-cast v1, Landroidx/camera/video/FileDescriptorOutputOptions;

    .line 3234
    invoke-virtual {v1}, Landroidx/camera/video/FileDescriptorOutputOptions;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->dup()Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    .local v1, "dupedParcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    goto :goto_0

    .line 3236
    .end local v1    # "dupedParcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    :cond_0
    const/4 v1, 0x0

    .line 3239
    .restart local v1    # "dupedParcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    :goto_0
    iget-object v2, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

    const-string v3, "finalizeRecording"

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/utils/CloseGuardHelper;->open(Ljava/lang/String;)V

    .line 3241
    new-instance v2, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/OutputOptions;Landroid/os/ParcelFileDescriptor;)V

    .line 3316
    .local v2, "mediaMuxerSupplier":Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;
    iget-object v3, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMediaMuxerSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3318
    const/4 v3, 0x0

    .line 3319
    .local v3, "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 3320
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1f

    if-lt v4, v5, :cond_1

    .line 3324
    new-instance v4, Landroidx/camera/video/Recorder$RecordingRecord$1;

    invoke-direct {v4, p0, p1}, Landroidx/camera/video/Recorder$RecordingRecord$1;-><init>(Landroidx/camera/video/Recorder$RecordingRecord;Landroid/content/Context;)V

    .line 3335
    .local v4, "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    iget-object v5, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3336
    .end local v4    # "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    goto :goto_1

    .line 3340
    :cond_1
    new-instance v4, Landroidx/camera/video/Recorder$RecordingRecord$2;

    invoke-direct {v4, p0}, Landroidx/camera/video/Recorder$RecordingRecord$2;-><init>(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 3350
    .restart local v4    # "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    iget-object v5, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3354
    .end local v4    # "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    :cond_2
    :goto_1
    instance-of v4, v0, Landroidx/camera/video/MediaStoreOutputOptions;

    if-eqz v4, :cond_4

    .line 3355
    move-object v4, v0

    check-cast v4, Landroidx/camera/video/MediaStoreOutputOptions;

    .line 3359
    .local v4, "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1d

    if-lt v5, v6, :cond_3

    .line 3360
    new-instance v5, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda1;

    invoke-direct {v5, v4}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/MediaStoreOutputOptions;)V

    move-object v3, v5

    .end local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    .local v5, "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    goto :goto_2

    .line 3372
    .end local v5    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    .restart local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    :cond_3
    new-instance v5, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda2;

    invoke-direct {v5, v4, p1}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/MediaStoreOutputOptions;Landroid/content/Context;)V

    move-object v3, v5

    .end local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    .restart local v5    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    goto :goto_2

    .line 3400
    .end local v4    # "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    .end local v5    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    .restart local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    :cond_4
    instance-of v4, v0, Landroidx/camera/video/FileDescriptorOutputOptions;

    if-eqz v4, :cond_5

    .line 3401
    new-instance v4, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda3;

    invoke-direct {v4, v1}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda3;-><init>(Landroid/os/ParcelFileDescriptor;)V

    move-object v3, v4

    goto :goto_3

    .line 3400
    :cond_5
    :goto_2
    nop

    .line 3413
    :goto_3
    if-eqz v3, :cond_6

    .line 3414
    iget-object v4, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3416
    :cond_6
    return-void

    .line 3224
    .end local v0    # "outputOptions":Landroidx/camera/video/OutputOptions;
    .end local v1    # "dupedParcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    .end local v2    # "mediaMuxerSupplier":Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;
    .end local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    :cond_7
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has already been initialized"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method isMuted()Z
    .locals 1

    .line 3554
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMuted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method abstract isPersistent()Z
.end method

.method synthetic lambda$updateVideoRecordEvent$6$androidx-camera-video-Recorder$RecordingRecord(Landroidx/camera/video/VideoRecordEvent;)V
    .locals 1
    .param p1, "event"    # Landroidx/camera/video/VideoRecordEvent;

    .line 3447
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getEventListener()Landroidx/core/util/Consumer;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method mute(Z)V
    .locals 1
    .param p1, "muted"    # Z

    .line 3550
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMuted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 3551
    return-void
.end method

.method performOneTimeAudioSourceCreation(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;)Landroidx/camera/video/internal/audio/AudioSource;
    .locals 4
    .param p1, "settings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p2, "audioSourceExecutor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioSourceAccessException;
        }
    .end annotation

    .line 3483
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3488
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;

    .line 3489
    .local v0, "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    if-eqz v0, :cond_0

    .line 3494
    invoke-interface {v0, p1, p2}, Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;->get(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;)Landroidx/camera/video/internal/audio/AudioSource;

    move-result-object v1

    return-object v1

    .line 3490
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "One-time audio source creation has already occurred for recording "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 3484
    .end local v0    # "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Recording does not have audio enabled. Unable to create audio source for recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method performOneTimeMediaMuxerCreation(ILandroidx/core/util/Consumer;)Landroid/media/MediaMuxer;
    .locals 5
    .param p1, "muxerOutputFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroidx/core/util/Consumer<",
            "Landroid/net/Uri;",
            ">;)",
            "Landroid/media/MediaMuxer;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3516
    .local p2, "outputUriCreatedCallback":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3519
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMediaMuxerSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;

    .line 3520
    .local v0, "mediaMuxerSupplier":Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;
    if-eqz v0, :cond_0

    .line 3526
    :try_start_0
    invoke-interface {v0, p1, p2}, Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;->get(ILandroidx/core/util/Consumer;)Landroid/media/MediaMuxer;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 3527
    :catch_0
    move-exception v1

    .line 3528
    .local v1, "e":Ljava/lang/RuntimeException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to create MediaMuxer by "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 3521
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "One-time media muxer creation has already occurred for recording "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 3517
    .end local v0    # "mediaMuxerSupplier":Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has not been initialized"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V
    .locals 1
    .param p1, "event"    # Landroidx/camera/video/VideoRecordEvent;

    .line 3420
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;Z)V

    .line 3421
    return-void
.end method

.method updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;Z)V
    .locals 7
    .param p1, "event"    # Landroidx/camera/video/VideoRecordEvent;
    .param p2, "printLog"    # Z

    .line 3427
    invoke-virtual {p1}, Landroidx/camera/video/VideoRecordEvent;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3432
    const-string v0, "Recorder"

    if-eqz p2, :cond_1

    .line 3433
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sending VideoRecordEvent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3434
    .local v1, "message":Ljava/lang/String;
    instance-of v2, p1, Landroidx/camera/video/VideoRecordEvent$Finalize;

    if-eqz v2, :cond_0

    .line 3435
    move-object v2, p1

    check-cast v2, Landroidx/camera/video/VideoRecordEvent$Finalize;

    .line 3436
    .local v2, "finalizeEvent":Landroidx/camera/video/VideoRecordEvent$Finalize;
    invoke-virtual {v2}, Landroidx/camera/video/VideoRecordEvent$Finalize;->hasError()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3437
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3439
    invoke-virtual {v2}, Landroidx/camera/video/VideoRecordEvent$Finalize;->getError()I

    move-result v4

    .line 3438
    invoke-static {v4}, Landroidx/camera/video/VideoRecordEvent$Finalize;->errorToString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v4, v5, v6

    .line 3437
    const-string v4, " [error: %s]"

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3442
    .end local v2    # "finalizeEvent":Landroidx/camera/video/VideoRecordEvent$Finalize;
    :cond_0
    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3444
    .end local v1    # "message":Ljava/lang/String;
    :cond_1
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder$RecordingRecord;->updateRecordingState(Landroidx/camera/video/VideoRecordEvent;)V

    .line 3445
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getEventListener()Landroidx/core/util/Consumer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 3447
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, p1}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/camera/video/VideoRecordEvent;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3450
    goto :goto_0

    .line 3448
    :catch_0
    move-exception v1

    .line 3449
    .local v1, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v2, "The callback executor is invalid."

    invoke-static {v0, v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3452
    .end local v1    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :cond_2
    :goto_0
    return-void

    .line 3428
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempted to update event listener with event from incorrect recording [Recording: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 3429
    invoke-virtual {p1}, Landroidx/camera/video/VideoRecordEvent;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Expected: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 3430
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
