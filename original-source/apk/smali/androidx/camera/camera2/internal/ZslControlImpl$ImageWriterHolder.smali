.class Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;
.super Ljava/lang/Object;
.source "ZslControlImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/ZslControlImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ImageWriterHolder"
.end annotation


# instance fields
.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mImageWriter:Landroid/media/ImageWriter;

.field private final mIsOpened:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 362
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 359
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mIsOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 363
    iput-object p1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mExecutor:Ljava/util/concurrent/Executor;

    .line 364
    return-void
.end method

.method static synthetic lambda$enqueueImageToImageWriter$0(Landroidx/camera/core/ImageProxy;Landroid/media/ImageWriter;)V
    .locals 0
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "writer"    # Landroid/media/ImageWriter;

    .line 410
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->close()V

    return-void
.end method


# virtual methods
.method public deactivate()V
    .locals 2

    .line 427
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mIsOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 428
    return-void
.end method

.method public enqueueImageToImageWriter(Landroidx/camera/core/ImageProxy;)Z
    .locals 5
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 400
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImage()Landroid/media/Image;

    move-result-object v0

    .line 401
    .local v0, "image":Landroid/media/Image;
    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mIsOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mImageWriter:Landroid/media/ImageWriter;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 403
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mImageWriter:Landroid/media/ImageWriter;

    invoke-static {v1, v0}, Landroidx/camera/core/internal/compat/ImageWriterCompat;->queueInputImage(Landroid/media/ImageWriter;Landroid/media/Image;)V

    .line 409
    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mImageWriter:Landroid/media/ImageWriter;

    new-instance v3, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder$$ExternalSyntheticLambda0;

    invoke-direct {v3, p1}, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/ImageProxy;)V

    iget-object v4, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v1, v3, v4}, Landroidx/camera/core/internal/compat/ImageWriterCompat;->setOnImageReleasedListener(Landroid/media/ImageWriter;Landroid/media/ImageWriter$OnImageReleasedListener;Ljava/util/concurrent/Executor;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    nop

    .line 416
    const/4 v1, 0x1

    return v1

    .line 411
    :catch_0
    move-exception v1

    .line 412
    .local v1, "e":Ljava/lang/IllegalStateException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "enqueueImageToImageWriter throws IllegalStateException = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 413
    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 412
    const-string v4, "ZslControlImpl"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    return v2

    .line 418
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :cond_0
    return v2
.end method

.method public onImageWriterCreated(Landroid/media/ImageWriter;)V
    .locals 2
    .param p1, "imageWriter"    # Landroid/media/ImageWriter;

    .line 381
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mIsOpened:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 382
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mImageWriter:Landroid/media/ImageWriter;

    if-eqz v0, :cond_0

    .line 383
    const-string v0, "ZslControlImpl"

    const-string v1, "ImageWriter already existed in the ImageWriter holder. Closing the previous one."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mImageWriter:Landroid/media/ImageWriter;

    invoke-virtual {v0}, Landroid/media/ImageWriter;->close()V

    .line 387
    :cond_0
    iput-object p1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mImageWriter:Landroid/media/ImageWriter;

    .line 389
    :cond_1
    return-void
.end method

.method public release()V
    .locals 1

    .line 435
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->deactivate()V

    .line 436
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mImageWriter:Landroid/media/ImageWriter;

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->mImageWriter:Landroid/media/ImageWriter;

    invoke-virtual {v0}, Landroid/media/ImageWriter;->close()V

    .line 439
    :cond_0
    return-void
.end method
