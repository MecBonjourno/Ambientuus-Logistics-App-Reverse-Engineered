.class Landroidx/camera/core/imagecapture/CaptureNode;
.super Ljava/lang/Object;
.source "CaptureNode.java"

# interfaces
.implements Landroidx/camera/core/processing/Node;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/imagecapture/CaptureNode$In;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Node<",
        "Landroidx/camera/core/imagecapture/CaptureNode$In;",
        "Landroidx/camera/core/imagecapture/ProcessingNode$In;",
        ">;"
    }
.end annotation


# static fields
.field static final MAX_IMAGES:I = 0x4

.field private static final TAG:Ljava/lang/String; = "CaptureNode"


# instance fields
.field mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

.field private mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

.field private mNoMetadataImageReader:Landroidx/camera/core/imagecapture/NoMetadataImageReader;

.field private mOutputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

.field mSafeCloseImageReaderForPostview:Landroidx/camera/core/SafeCloseImageReaderProxy;

.field mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

.field mSecondarySafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 94
    iput-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mNoMetadataImageReader:Landroidx/camera/core/imagecapture/NoMetadataImageReader;

    return-void
.end method

.method static synthetic access$000(Landroidx/camera/core/imagecapture/CaptureNode;)Landroidx/camera/core/imagecapture/NoMetadataImageReader;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/core/imagecapture/CaptureNode;

    .line 73
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mNoMetadataImageReader:Landroidx/camera/core/imagecapture/NoMetadataImageReader;

    return-object v0
.end method

.method private static createImageReaderProxy(Landroidx/camera/core/ImageReaderProxyProvider;III)Landroidx/camera/core/impl/ImageReaderProxy;
    .locals 7
    .param p0, "imageReaderProxyProvider"    # Landroidx/camera/core/ImageReaderProxyProvider;
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "format"    # I

    .line 227
    if-eqz p0, :cond_0

    .line 228
    const/4 v4, 0x4

    const-wide/16 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    .end local p0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .end local p1    # "width":I
    .end local p2    # "height":I
    .end local p3    # "format":I
    .local v0, "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .local v1, "width":I
    .local v2, "height":I
    .local v3, "format":I
    invoke-interface/range {v0 .. v6}, Landroidx/camera/core/ImageReaderProxyProvider;->newInstance(IIIIJ)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object p0

    return-object p0

    .line 230
    .end local v0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .end local v1    # "width":I
    .end local v2    # "height":I
    .end local v3    # "format":I
    .restart local p0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .restart local p1    # "width":I
    .restart local p2    # "height":I
    .restart local p3    # "format":I
    :cond_0
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    .end local p0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .end local p1    # "width":I
    .end local p2    # "height":I
    .end local p3    # "format":I
    .restart local v0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .restart local v1    # "width":I
    .restart local v2    # "height":I
    .restart local v3    # "format":I
    const/4 p0, 0x4

    invoke-static {v1, v2, v3, p0}, Landroidx/camera/core/ImageReaderProxys;->createIsolatedReader(IIII)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$releaseInputResources$3(Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 0
    .param p0, "imageReader"    # Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 383
    invoke-virtual {p0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->safeClose()V

    .line 384
    return-void
.end method

.method static synthetic lambda$releaseInputResources$4(Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 0
    .param p0, "imageReaderForPostview"    # Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 389
    if-eqz p0, :cond_0

    .line 390
    invoke-virtual {p0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->safeClose()V

    .line 392
    :cond_0
    return-void
.end method

.method static synthetic lambda$releaseInputResources$5(Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 0
    .param p0, "secondaryImageReader"    # Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 398
    if-eqz p0, :cond_0

    .line 399
    invoke-virtual {p0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->safeClose()V

    .line 401
    :cond_0
    return-void
.end method

.method private matchAndPropagateImage(Landroidx/camera/core/ImageProxy;)V
    .locals 6
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 286
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 288
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mOutputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 289
    invoke-static {v1, p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->of(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    move-result-object v1

    .line 288
    invoke-virtual {v0, v1}, Landroidx/camera/core/processing/Edge;->accept(Ljava/lang/Object;)V

    .line 292
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 295
    .local v0, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    .line 296
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getOutputFormats()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v3, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    .line 297
    .local v1, "isSimultaneousCaptureEnabled":Z
    :goto_0
    if-eqz v1, :cond_1

    iget-object v4, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-eqz v4, :cond_1

    .line 298
    iget-object v4, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTakePictureRequest()Landroidx/camera/core/imagecapture/TakePictureRequest;

    move-result-object v4

    .line 300
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v5

    .line 299
    invoke-virtual {v4, v5, v3}, Landroidx/camera/core/imagecapture/TakePictureRequest;->markFormatProcessStatusInSimultaneousCapture(IZ)V

    .line 302
    :cond_1
    if-eqz v1, :cond_3

    iget-object v4, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-eqz v4, :cond_2

    iget-object v4, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 304
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTakePictureRequest()Landroidx/camera/core/imagecapture/TakePictureRequest;

    move-result-object v4

    .line 305
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/TakePictureRequest;->isFormatProcessedInSimultaneousCapture()Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_1

    :cond_2
    goto :goto_2

    :cond_3
    :goto_1
    move v2, v3

    .line 306
    .local v2, "isProcessed":Z
    :goto_2
    if-eqz v2, :cond_4

    .line 307
    const/4 v3, 0x0

    iput-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 309
    :cond_4
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onImageCaptured()V

    .line 310
    return-void
.end method

.method private propagatePostviewImage(Landroidx/camera/core/ImageProxy;)V
    .locals 2
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 313
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-nez v0, :cond_0

    .line 314
    const-string v0, "CaptureNode"

    const-string v1, "Postview image is closed due to request completed or aborted"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 316
    return-void

    .line 318
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mOutputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getPostviewEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 319
    invoke-static {v1, p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->of(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    move-result-object v1

    .line 318
    invoke-virtual {v0, v1}, Landroidx/camera/core/processing/Edge;->accept(Ljava/lang/Object;)V

    .line 320
    return-void
.end method

.method private releaseInputResources(Landroidx/camera/core/imagecapture/CaptureNode$In;Landroidx/camera/core/SafeCloseImageReaderProxy;Landroidx/camera/core/SafeCloseImageReaderProxy;Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 3
    .param p1, "inputEdge"    # Landroidx/camera/core/imagecapture/CaptureNode$In;
    .param p2, "imageReader"    # Landroidx/camera/core/SafeCloseImageReaderProxy;
    .param p3, "secondaryImageReader"    # Landroidx/camera/core/SafeCloseImageReaderProxy;
    .param p4, "imageReaderForPostview"    # Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 379
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 382
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda5;

    invoke-direct {v1, p2}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/core/SafeCloseImageReaderProxy;)V

    .line 384
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 382
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 386
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getPostviewSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 387
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getPostviewSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 388
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getPostviewSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda6;

    invoke-direct {v1, p4}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/core/SafeCloseImageReaderProxy;)V

    .line 392
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 388
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 395
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getOutputFormats()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSecondarySurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 396
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSecondarySurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 397
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSecondarySurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda7;

    invoke-direct {v1, p3}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/core/SafeCloseImageReaderProxy;)V

    .line 401
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 397
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 403
    :cond_1
    return-void
.end method

.method private setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy;)V
    .locals 2
    .param p1, "imageReaderProxy"    # Landroidx/camera/core/impl/ImageReaderProxy;

    .line 235
    new-instance v0, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    .line 258
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 235
    invoke-interface {p1, v0, v1}, Landroidx/camera/core/impl/ImageReaderProxy;->setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;Ljava/util/concurrent/Executor;)V

    .line 259
    return-void
.end method


# virtual methods
.method public getCapacity()I
    .locals 2

    .line 417
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 418
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "The ImageReader is not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 420
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getCapacity()I

    move-result v0

    return v0
.end method

.method getInputEdge()Landroidx/camera/core/imagecapture/CaptureNode$In;
    .locals 1

    .line 407
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/CaptureNode$In;

    return-object v0
.end method

.method public getSafeCloseImageReaderProxy()Landroidx/camera/core/SafeCloseImageReaderProxy;
    .locals 1

    .line 412
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/SafeCloseImageReaderProxy;

    return-object v0
.end method

.method synthetic lambda$setOnImageAvailableListener$2$androidx-camera-core-imagecapture-CaptureNode(Landroidx/camera/core/impl/ImageReaderProxy;)V
    .locals 6
    .param p1, "imageReader"    # Landroidx/camera/core/impl/ImageReaderProxy;

    .line 237
    const-string v0, "Failed to acquire latest image"

    const/4 v1, 0x2

    :try_start_0
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageReaderProxy;->acquireLatestImage()Landroidx/camera/core/ImageProxy;

    move-result-object v2

    .line 238
    .local v2, "image":Landroidx/camera/core/ImageProxy;
    if-eqz v2, :cond_0

    .line 239
    invoke-virtual {p0, v2}, Landroidx/camera/core/imagecapture/CaptureNode;->onImageProxyAvailable(Landroidx/camera/core/ImageProxy;)V

    goto :goto_0

    .line 241
    :cond_0
    iget-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-eqz v3, :cond_1

    .line 242
    iget-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 244
    invoke-virtual {v3}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getRequestId()I

    move-result v3

    new-instance v4, Landroidx/camera/core/ImageCaptureException;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v0, v5}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 243
    invoke-static {v3, v4}, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;->of(ILandroidx/camera/core/ImageCaptureException;)Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;

    move-result-object v3

    .line 242
    invoke-virtual {p0, v3}, Landroidx/camera/core/imagecapture/CaptureNode;->sendCaptureError(Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    .end local v2    # "image":Landroidx/camera/core/ImageProxy;
    :cond_1
    :goto_0
    goto :goto_1

    .line 249
    :catch_0
    move-exception v2

    .line 250
    .local v2, "e":Ljava/lang/IllegalStateException;
    iget-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-eqz v3, :cond_2

    .line 251
    iget-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 252
    invoke-virtual {v3}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getRequestId()I

    move-result v3

    new-instance v4, Landroidx/camera/core/ImageCaptureException;

    invoke-direct {v4, v1, v0, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v3, v4}, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;->of(ILandroidx/camera/core/ImageCaptureException;)Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;

    move-result-object v0

    .line 251
    invoke-virtual {p0, v0}, Landroidx/camera/core/imagecapture/CaptureNode;->sendCaptureError(Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;)V

    .line 258
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$transform$0$androidx-camera-core-imagecapture-CaptureNode(Landroidx/camera/core/imagecapture/ProcessingRequest;)V
    .locals 1
    .param p1, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 168
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/CaptureNode;->onRequestAvailable(Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    .line 169
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mNoMetadataImageReader:Landroidx/camera/core/imagecapture/NoMetadataImageReader;

    invoke-virtual {v0, p1}, Landroidx/camera/core/imagecapture/NoMetadataImageReader;->acceptProcessingRequest(Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    .line 170
    return-void
.end method

.method synthetic lambda$transform$1$androidx-camera-core-imagecapture-CaptureNode(Landroidx/camera/core/impl/ImageReaderProxy;)V
    .locals 3
    .param p1, "imageReader"    # Landroidx/camera/core/impl/ImageReaderProxy;

    .line 192
    :try_start_0
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageReaderProxy;->acquireLatestImage()Landroidx/camera/core/ImageProxy;

    move-result-object v0

    .line 193
    .local v0, "image":Landroidx/camera/core/ImageProxy;
    if-eqz v0, :cond_0

    .line 194
    invoke-direct {p0, v0}, Landroidx/camera/core/imagecapture/CaptureNode;->propagatePostviewImage(Landroidx/camera/core/ImageProxy;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    .end local v0    # "image":Landroidx/camera/core/ImageProxy;
    :cond_0
    goto :goto_0

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v1, "CaptureNode"

    const-string v2, "Failed to acquire latest image of postview"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 199
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :goto_0
    return-void
.end method

.method onImageProxyAvailable(Landroidx/camera/core/ImageProxy;)V
    .locals 3
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 264
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 265
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    const-string v1, "CaptureNode"

    if-nez v0, :cond_0

    .line 267
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discarding ImageProxy which was inadvertently acquired: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    goto :goto_0

    .line 272
    :cond_0
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/ImageInfo;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v0

    iget-object v2, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 273
    invoke-virtual {v2}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTagBundleKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 274
    .local v0, "stageId":Ljava/lang/Integer;
    if-nez v0, :cond_1

    .line 275
    const-string v2, "Discarding ImageProxy which was acquired for aborted request"

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 277
    return-void

    .line 280
    :cond_1
    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/CaptureNode;->matchAndPropagateImage(Landroidx/camera/core/ImageProxy;)V

    .line 282
    .end local v0    # "stageId":Ljava/lang/Integer;
    :goto_0
    return-void
.end method

.method onRequestAvailable(Landroidx/camera/core/imagecapture/ProcessingRequest;)V
    .locals 4
    .param p1, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 325
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 326
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getStageIds()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v3, "only one capture stage is supported."

    invoke-static {v0, v3}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 329
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/CaptureNode;->getCapacity()I

    move-result v0

    if-lez v0, :cond_1

    move v1, v2

    :cond_1
    const-string v0, "Too many acquire images. Close image to be able to process next."

    invoke-static {v1, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 333
    iput-object p1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 335
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getCaptureFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/CaptureNode$2;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/imagecapture/CaptureNode$2;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    .line 352
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 335
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 353
    return-void
.end method

.method public release()V
    .locals 4

    .line 367
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 368
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/CaptureNode$In;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 369
    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/SafeCloseImageReaderProxy;

    iget-object v2, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSecondarySafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    iget-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderForPostview:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 368
    invoke-direct {p0, v0, v1, v2, v3}, Landroidx/camera/core/imagecapture/CaptureNode;->releaseInputResources(Landroidx/camera/core/imagecapture/CaptureNode$In;Landroidx/camera/core/SafeCloseImageReaderProxy;Landroidx/camera/core/SafeCloseImageReaderProxy;Landroidx/camera/core/SafeCloseImageReaderProxy;)V

    .line 373
    return-void
.end method

.method sendCaptureError(Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;)V
    .locals 2
    .param p1, "error"    # Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;

    .line 357
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 358
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 359
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getRequestId()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;->getRequestId()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 360
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;->getImageCaptureException()Landroidx/camera/core/ImageCaptureException;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onCaptureFailure(Landroidx/camera/core/ImageCaptureException;)V

    .line 362
    :cond_0
    return-void
.end method

.method public setOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V
    .locals 2
    .param p1, "listener"    # Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;

    .line 425
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 426
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "The ImageReader is not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 428
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-virtual {v0, p1}, Landroidx/camera/core/SafeCloseImageReaderProxy;->setOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V

    .line 429
    return-void
.end method

.method public transform(Landroidx/camera/core/imagecapture/CaptureNode$In;)Landroidx/camera/core/imagecapture/ProcessingNode$In;
    .locals 19
    .param p1, "inputEdge"    # Landroidx/camera/core/imagecapture/CaptureNode$In;

    .line 98
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    const/4 v4, 0x1

    if-nez v2, :cond_0

    iget-object v2, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    if-nez v2, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-string v5, "CaptureNode does not support recreation yet."

    invoke-static {v2, v5}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 100
    iput-object v1, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    .line 101
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSize()Landroid/util/Size;

    move-result-object v2

    .line 102
    .local v2, "size":Landroid/util/Size;
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getInputFormat()I

    move-result v5

    .line 107
    .local v5, "format":I
    const/4 v6, 0x0

    .line 108
    .local v6, "secondaryWrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->isVirtualCamera()Z

    move-result v7

    xor-int/2addr v7, v4

    .line 109
    .local v7, "hasMetadata":Z
    new-instance v8, Landroidx/camera/core/imagecapture/CaptureNode$1;

    invoke-direct {v8, v0}, Landroidx/camera/core/imagecapture/CaptureNode$1;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    .line 130
    .local v8, "progressCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    const/4 v9, 0x0

    .line 131
    .local v9, "secondaryCameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getOutputFormats()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-le v10, v4, :cond_1

    move v10, v4

    goto :goto_1

    :cond_1
    const/4 v10, 0x0

    .line 132
    .local v10, "isSimultaneousCaptureEnabled":Z
    :goto_1
    if-eqz v7, :cond_3

    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getImageReaderProxyProvider()Landroidx/camera/core/ImageReaderProxyProvider;

    move-result-object v11

    if-nez v11, :cond_3

    .line 133
    const/4 v11, 0x2

    const/4 v12, 0x4

    if-eqz v10, :cond_2

    .line 134
    new-instance v13, Landroidx/camera/core/MetadataImageReader;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v14

    .line 135
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v15

    const/16 v16, 0x0

    const/16 v3, 0x100

    invoke-direct {v13, v14, v15, v3, v12}, Landroidx/camera/core/MetadataImageReader;-><init>(IIII)V

    .line 136
    .local v13, "metadataImageReader":Landroidx/camera/core/MetadataImageReader;
    new-array v3, v11, [Landroidx/camera/core/impl/CameraCaptureCallback;

    aput-object v8, v3, v16

    .line 138
    invoke-virtual {v13}, Landroidx/camera/core/MetadataImageReader;->getCameraCaptureCallback()Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v14

    aput-object v14, v3, v4

    .line 137
    invoke-static {v3}, Landroidx/camera/core/impl/CameraCaptureCallbacks;->createComboCallback([Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v3

    .line 139
    .local v3, "cameraCaptureCallbacks":Landroidx/camera/core/impl/CameraCaptureCallback;
    move-object v14, v13

    .line 141
    .local v14, "wrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    new-instance v15, Landroidx/camera/core/MetadataImageReader;

    .line 142
    move/from16 v17, v4

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v11

    move-object/from16 v18, v2

    .end local v2    # "size":Landroid/util/Size;
    .local v18, "size":Landroid/util/Size;
    const/16 v2, 0x20

    invoke-direct {v15, v4, v11, v2, v12}, Landroidx/camera/core/MetadataImageReader;-><init>(IIII)V

    .line 143
    .local v15, "secondaryMetadataImageReader":Landroidx/camera/core/MetadataImageReader;
    const/4 v2, 0x2

    new-array v2, v2, [Landroidx/camera/core/impl/CameraCaptureCallback;

    aput-object v8, v2, v16

    .line 146
    invoke-virtual {v15}, Landroidx/camera/core/MetadataImageReader;->getCameraCaptureCallback()Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v4

    aput-object v4, v2, v17

    .line 144
    invoke-static {v2}, Landroidx/camera/core/impl/CameraCaptureCallbacks;->createComboCallback([Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v9

    .line 147
    move-object v6, v15

    .line 148
    .end local v13    # "metadataImageReader":Landroidx/camera/core/MetadataImageReader;
    .end local v15    # "secondaryMetadataImageReader":Landroidx/camera/core/MetadataImageReader;
    goto :goto_2

    .line 150
    .end local v3    # "cameraCaptureCallbacks":Landroidx/camera/core/impl/CameraCaptureCallback;
    .end local v14    # "wrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    .end local v18    # "size":Landroid/util/Size;
    .restart local v2    # "size":Landroid/util/Size;
    :cond_2
    move-object/from16 v18, v2

    move/from16 v17, v4

    const/16 v16, 0x0

    .end local v2    # "size":Landroid/util/Size;
    .restart local v18    # "size":Landroid/util/Size;
    new-instance v2, Landroidx/camera/core/MetadataImageReader;

    invoke-virtual/range {v18 .. v18}, Landroid/util/Size;->getWidth()I

    move-result v3

    .line 151
    invoke-virtual/range {v18 .. v18}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4, v5, v12}, Landroidx/camera/core/MetadataImageReader;-><init>(IIII)V

    .line 152
    .local v2, "metadataImageReader":Landroidx/camera/core/MetadataImageReader;
    const/4 v3, 0x2

    new-array v3, v3, [Landroidx/camera/core/impl/CameraCaptureCallback;

    aput-object v8, v3, v16

    .line 154
    invoke-virtual {v2}, Landroidx/camera/core/MetadataImageReader;->getCameraCaptureCallback()Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v4

    aput-object v4, v3, v17

    .line 153
    invoke-static {v3}, Landroidx/camera/core/impl/CameraCaptureCallbacks;->createComboCallback([Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v3

    .line 155
    .restart local v3    # "cameraCaptureCallbacks":Landroidx/camera/core/impl/CameraCaptureCallback;
    move-object v14, v2

    .line 158
    .end local v2    # "metadataImageReader":Landroidx/camera/core/MetadataImageReader;
    .restart local v14    # "wrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    :goto_2
    new-instance v2, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    .local v2, "requestConsumer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/core/imagecapture/ProcessingRequest;>;"
    goto :goto_3

    .line 132
    .end local v3    # "cameraCaptureCallbacks":Landroidx/camera/core/impl/CameraCaptureCallback;
    .end local v14    # "wrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    .end local v18    # "size":Landroid/util/Size;
    .local v2, "size":Landroid/util/Size;
    :cond_3
    move-object/from16 v18, v2

    .line 160
    .end local v2    # "size":Landroid/util/Size;
    .restart local v18    # "size":Landroid/util/Size;
    move-object v3, v8

    .line 162
    .restart local v3    # "cameraCaptureCallbacks":Landroidx/camera/core/impl/CameraCaptureCallback;
    new-instance v2, Landroidx/camera/core/imagecapture/NoMetadataImageReader;

    .line 163
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getImageReaderProxyProvider()Landroidx/camera/core/ImageReaderProxyProvider;

    move-result-object v4

    .line 164
    invoke-virtual/range {v18 .. v18}, Landroid/util/Size;->getWidth()I

    move-result v11

    invoke-virtual/range {v18 .. v18}, Landroid/util/Size;->getHeight()I

    move-result v12

    .line 163
    invoke-static {v4, v11, v12, v5}, Landroidx/camera/core/imagecapture/CaptureNode;->createImageReaderProxy(Landroidx/camera/core/ImageReaderProxyProvider;III)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v4

    invoke-direct {v2, v4}, Landroidx/camera/core/imagecapture/NoMetadataImageReader;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    iput-object v2, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mNoMetadataImageReader:Landroidx/camera/core/imagecapture/NoMetadataImageReader;

    .line 165
    iget-object v14, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mNoMetadataImageReader:Landroidx/camera/core/imagecapture/NoMetadataImageReader;

    .line 167
    .restart local v14    # "wrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    new-instance v2, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    .line 172
    .local v2, "requestConsumer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/core/imagecapture/ProcessingRequest;>;"
    :goto_3
    invoke-virtual {v1, v3}, Landroidx/camera/core/imagecapture/CaptureNode$In;->setCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 173
    if-eqz v10, :cond_4

    if-eqz v9, :cond_4

    .line 174
    invoke-virtual {v1, v9}, Landroidx/camera/core/imagecapture/CaptureNode$In;->setSecondaryCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 176
    :cond_4
    invoke-interface {v14}, Landroidx/camera/core/impl/ImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v4

    invoke-static {v4}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/Surface;

    invoke-virtual {v1, v4}, Landroidx/camera/core/imagecapture/CaptureNode$In;->setSurface(Landroid/view/Surface;)V

    .line 177
    new-instance v4, Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-direct {v4, v14}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    iput-object v4, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 180
    invoke-direct {v0, v14}, Landroidx/camera/core/imagecapture/CaptureNode;->setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy;)V

    .line 183
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getPostviewSettings()Landroidx/camera/core/imagecapture/PostviewSettings;

    move-result-object v4

    .line 184
    .local v4, "postviewSettings":Landroidx/camera/core/imagecapture/PostviewSettings;
    if-eqz v4, :cond_5

    .line 185
    nop

    .line 186
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getImageReaderProxyProvider()Landroidx/camera/core/ImageReaderProxyProvider;

    move-result-object v11

    .line 187
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/PostviewSettings;->getResolution()Landroid/util/Size;

    move-result-object v12

    invoke-virtual {v12}, Landroid/util/Size;->getWidth()I

    move-result v12

    .line 188
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/PostviewSettings;->getResolution()Landroid/util/Size;

    move-result-object v13

    invoke-virtual {v13}, Landroid/util/Size;->getHeight()I

    move-result v13

    .line 189
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/PostviewSettings;->getInputFormat()I

    move-result v15

    .line 186
    invoke-static {v11, v12, v13, v15}, Landroidx/camera/core/imagecapture/CaptureNode;->createImageReaderProxy(Landroidx/camera/core/ImageReaderProxyProvider;III)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v11

    .line 190
    .local v11, "postviewImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    new-instance v12, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda2;

    invoke-direct {v12, v0}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    .line 199
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v13

    .line 190
    invoke-interface {v11, v12, v13}, Landroidx/camera/core/impl/ImageReaderProxy;->setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;Ljava/util/concurrent/Executor;)V

    .line 201
    new-instance v12, Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-direct {v12, v11}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    iput-object v12, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderForPostview:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 202
    invoke-interface {v11}, Landroidx/camera/core/impl/ImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v12

    .line 203
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/PostviewSettings;->getResolution()Landroid/util/Size;

    move-result-object v13

    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/PostviewSettings;->getInputFormat()I

    move-result v15

    .line 202
    invoke-virtual {v1, v12, v13, v15}, Landroidx/camera/core/imagecapture/CaptureNode$In;->setPostviewSurface(Landroid/view/Surface;Landroid/util/Size;I)V

    .line 207
    .end local v11    # "postviewImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    :cond_5
    if-eqz v10, :cond_6

    if-eqz v6, :cond_6

    .line 208
    invoke-interface {v6}, Landroidx/camera/core/impl/ImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v11

    invoke-virtual {v1, v11}, Landroidx/camera/core/imagecapture/CaptureNode$In;->setSecondarySurface(Landroid/view/Surface;)V

    .line 209
    new-instance v11, Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-direct {v11, v6}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    iput-object v11, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mSecondarySafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 211
    invoke-direct {v0, v6}, Landroidx/camera/core/imagecapture/CaptureNode;->setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy;)V

    .line 214
    :cond_6
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getRequestEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v11

    invoke-virtual {v11, v2}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 215
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getErrorEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v11

    new-instance v12, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda3;

    invoke-direct {v12, v0}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    invoke-virtual {v11, v12}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 217
    nop

    .line 218
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getInputFormat()I

    move-result v11

    .line 219
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getOutputFormats()Ljava/util/List;

    move-result-object v12

    .line 217
    invoke-static {v11, v12}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->of(ILjava/util/List;)Landroidx/camera/core/imagecapture/ProcessingNode$In;

    move-result-object v11

    iput-object v11, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mOutputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    .line 221
    iget-object v11, v0, Landroidx/camera/core/imagecapture/CaptureNode;->mOutputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    return-object v11
.end method

.method public bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 73
    check-cast p1, Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/CaptureNode;->transform(Landroidx/camera/core/imagecapture/CaptureNode$In;)Landroidx/camera/core/imagecapture/ProcessingNode$In;

    move-result-object p1

    return-object p1
.end method
