.class public Landroidx/camera/core/imagecapture/ProcessingNode;
.super Ljava/lang/Object;
.source "ProcessingNode.java"

# interfaces
.implements Landroidx/camera/core/processing/Node;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/imagecapture/ProcessingNode$In;,
        Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Node<",
        "Landroidx/camera/core/imagecapture/ProcessingNode$In;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ProcessingNode"


# instance fields
.field private mBitmap2JpegBytes:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;>;"
        }
    .end annotation
.end field

.field private mBitmapEffect:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field final mBlockingExecutor:Ljava/util/concurrent/Executor;

.field private final mCameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

.field mDngImage2Disk:Landroidx/camera/core/imagecapture/DngImage2Disk;

.field private final mHasIncorrectJpegMetadataQuirk:Z

.field private mImage2Bitmap:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mImage2JpegBytes:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/Image2JpegBytes$In;",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;>;"
        }
    .end annotation
.end field

.field final mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

.field private mInput2Packet:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;>;"
        }
    .end annotation
.end field

.field private mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

.field private mJpegBytes2CroppedBitmap:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private mJpegBytes2Disk:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;",
            "Landroidx/camera/core/ImageCapture$OutputFileResults;",
            ">;"
        }
    .end annotation
.end field

.field private mJpegBytes2Image:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;>;"
        }
    .end annotation
.end field

.field private mJpegImage2Result:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final mQuirks:Landroidx/camera/core/impl/Quirks;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCharacteristics;)V
    .locals 2
    .param p1, "blockingExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "cameraCharacteristics"    # Landroid/hardware/camera2/CameraCharacteristics;

    .line 98
    nop

    .line 99
    invoke-static {}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->getAll()Landroidx/camera/core/impl/Quirks;

    move-result-object v0

    .line 98
    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v1, v0}, Landroidx/camera/core/imagecapture/ProcessingNode;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCharacteristics;Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/impl/Quirks;)V

    .line 100
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCharacteristics;Landroidx/camera/core/processing/InternalImageProcessor;)V
    .locals 1
    .param p1, "blockingExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "cameraCharacteristics"    # Landroid/hardware/camera2/CameraCharacteristics;
    .param p3, "imageProcessor"    # Landroidx/camera/core/processing/InternalImageProcessor;

    .line 112
    invoke-static {}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->getAll()Landroidx/camera/core/impl/Quirks;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/camera/core/imagecapture/ProcessingNode;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCharacteristics;Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/impl/Quirks;)V

    .line 113
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCharacteristics;Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/impl/Quirks;)V
    .locals 2
    .param p1, "blockingExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "cameraCharacteristics"    # Landroid/hardware/camera2/CameraCharacteristics;
    .param p3, "imageProcessor"    # Landroidx/camera/core/processing/InternalImageProcessor;
    .param p4, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    const-class v0, Landroidx/camera/core/internal/compat/quirk/LowMemoryQuirk;

    invoke-static {v0}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 125
    .local v0, "isLowMemoryDevice":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 126
    invoke-static {p1}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBlockingExecutor:Ljava/util/concurrent/Executor;

    goto :goto_1

    .line 128
    :cond_1
    iput-object p1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBlockingExecutor:Ljava/util/concurrent/Executor;

    .line 130
    :goto_1
    iput-object p3, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    .line 131
    iput-object p2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mCameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    .line 132
    iput-object p4, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mQuirks:Landroidx/camera/core/impl/Quirks;

    .line 133
    const-class v1, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    invoke-virtual {p4, v1}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v1

    iput-boolean v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mHasIncorrectJpegMetadataQuirk:Z

    .line 134
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Quirks;Landroid/hardware/camera2/CameraCharacteristics;)V
    .locals 1
    .param p1, "blockingExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "quirks"    # Landroidx/camera/core/impl/Quirks;
    .param p3, "cameraCharacteristics"    # Landroid/hardware/camera2/CameraCharacteristics;

    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, p1, p3, v0, p2}, Landroidx/camera/core/imagecapture/ProcessingNode;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCharacteristics;Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/impl/Quirks;)V

    .line 107
    return-void
.end method

.method private cropAndMaybeApplyEffect(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/processing/Packet;
    .locals 3
    .param p2, "jpegQuality"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;I)",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 364
    .local p1, "jpegPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v0

    invoke-static {v0}, Landroidx/camera/core/internal/utils/ImageUtil;->isJpegFormats(I)Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 365
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2CroppedBitmap:Landroidx/camera/core/processing/Operation;

    invoke-interface {v0, p1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/Packet;

    .line 366
    .local v0, "bitmapPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroid/graphics/Bitmap;>;"
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    if-eqz v1, :cond_0

    .line 368
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    invoke-interface {v1, v0}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroidx/camera/core/processing/Packet;

    .line 370
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmap2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 371
    invoke-static {v0, p2}, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;->of(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;

    move-result-object v2

    .line 370
    invoke-interface {v1, v2}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/Packet;

    return-object v1
.end method

.method static synthetic lambda$processInputPacket$4(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageProxy;)V
    .locals 0
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "result"    # Landroidx/camera/core/ImageProxy;

    .line 199
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onFinalResult(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method

.method static synthetic lambda$processInputPacket$5(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCapture$OutputFileResults;)V
    .locals 0
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "result"    # Landroidx/camera/core/ImageCapture$OutputFileResults;

    .line 206
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onFinalResult(Landroidx/camera/core/ImageCapture$OutputFileResults;)V

    return-void
.end method

.method static synthetic lambda$processPostviewInputPacket$6(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .line 233
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onPostviewBitmapAvailable(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic lambda$sendError$7(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V
    .locals 0
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "e"    # Landroidx/camera/core/ImageCaptureException;

    .line 380
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onProcessFailure(Landroidx/camera/core/ImageCaptureException;)V

    .line 381
    return-void
.end method

.method private saveJpegToDisk(Landroidx/camera/core/processing/Packet;Landroidx/camera/core/ImageCapture$OutputFileOptions;I)Landroidx/camera/core/ImageCapture$OutputFileResults;
    .locals 3
    .param p2, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .param p3, "jpegQuality"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;",
            "Landroidx/camera/core/ImageCapture$OutputFileOptions;",
            "I)",
            "Landroidx/camera/core/ImageCapture$OutputFileResults;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 321
    .local p1, "originalImage":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImage2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 322
    invoke-static {p1, p3}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->of(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/imagecapture/Image2JpegBytes$In;

    move-result-object v1

    .line 321
    invoke-interface {v0, v1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/Packet;

    .line 323
    .local v0, "jpegBytes":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->hasCropping()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    if-eqz v1, :cond_1

    .line 324
    :cond_0
    invoke-direct {p0, v0, p3}, Landroidx/camera/core/imagecapture/ProcessingNode;->cropAndMaybeApplyEffect(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/processing/Packet;

    move-result-object v0

    .line 326
    :cond_1
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2Disk:Landroidx/camera/core/processing/Operation;

    .line 327
    invoke-static {p2}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-static {v0, v2}, Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;->of(Landroidx/camera/core/processing/Packet;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;

    move-result-object v2

    .line 326
    invoke-interface {v1, v2}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ImageCapture$OutputFileResults;

    return-object v1
.end method

.method private saveRawToDisk(Landroidx/camera/core/processing/Packet;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroidx/camera/core/ImageCapture$OutputFileResults;
    .locals 4
    .param p2, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;",
            "Landroidx/camera/core/ImageCapture$OutputFileOptions;",
            ")",
            "Landroidx/camera/core/ImageCapture$OutputFileResults;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 298
    .local p1, "originalImage":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mDngImage2Disk:Landroidx/camera/core/imagecapture/DngImage2Disk;

    if-nez v0, :cond_2

    .line 299
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mCameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 303
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 307
    new-instance v0, Landroidx/camera/core/imagecapture/DngImage2Disk;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mCameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    .line 308
    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCharacteristics;

    .line 309
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v2

    invoke-interface {v2}, Landroidx/camera/core/impl/CameraCaptureResult;->getCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/CaptureResult;

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/imagecapture/DngImage2Disk;-><init>(Landroid/hardware/camera2/CameraCharacteristics;Landroid/hardware/camera2/CaptureResult;)V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mDngImage2Disk:Landroidx/camera/core/imagecapture/DngImage2Disk;

    goto :goto_0

    .line 304
    :cond_0
    new-instance v0, Landroidx/camera/core/ImageCaptureException;

    const-string v3, "CameraCaptureResult is null, DngCreator cannot be created"

    invoke-direct {v0, v2, v3, v1}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 300
    :cond_1
    new-instance v0, Landroidx/camera/core/ImageCaptureException;

    const-string v3, "CameraCharacteristics is null, DngCreator cannot be created"

    invoke-direct {v0, v2, v3, v1}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 311
    :cond_2
    :goto_0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mDngImage2Disk:Landroidx/camera/core/imagecapture/DngImage2Disk;

    .line 312
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ImageProxy;

    .line 313
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v2

    .line 314
    invoke-static {p2}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 311
    invoke-static {v1, v2, v3}, Landroidx/camera/core/imagecapture/DngImage2Disk$In;->of(Landroidx/camera/core/ImageProxy;ILandroidx/camera/core/ImageCapture$OutputFileOptions;)Landroidx/camera/core/imagecapture/DngImage2Disk$In;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/imagecapture/DngImage2Disk;->apply(Landroidx/camera/core/imagecapture/DngImage2Disk$In;)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object v0

    return-object v0
.end method

.method private sendError(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V
    .locals 2
    .param p1, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p2, "e"    # Landroidx/camera/core/ImageCaptureException;

    .line 379
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1, p2}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 382
    return-void
.end method


# virtual methods
.method injectProcessingInput2Packet(Landroidx/camera/core/processing/Operation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;>;)V"
        }
    .end annotation

    .line 442
    .local p1, "input2Packet":Landroidx/camera/core/processing/Operation;, "Landroidx/camera/core/processing/Operation<Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;>;"
    iput-object p1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    .line 443
    return-void
.end method

.method synthetic lambda$transform$0$androidx-camera-core-imagecapture-ProcessingNode(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 0
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 147
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->processInputPacket(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V

    return-void
.end method

.method synthetic lambda$transform$1$androidx-camera-core-imagecapture-ProcessingNode(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 2
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 142
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->isAborted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getImageProxy()Landroidx/camera/core/ImageProxy;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->close()V

    .line 145
    return-void

    .line 147
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBlockingExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/core/imagecapture/ProcessingNode;Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 148
    return-void
.end method

.method synthetic lambda$transform$2$androidx-camera-core-imagecapture-ProcessingNode(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 0
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 158
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->processPostviewInputPacket(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V

    return-void
.end method

.method synthetic lambda$transform$3$androidx-camera-core-imagecapture-ProcessingNode(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 2
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 151
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->isAborted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    const-string v0, "ProcessingNode"

    const-string v1, "The postview image is closed due to request aborted"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getImageProxy()Landroidx/camera/core/ImageProxy;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->close()V

    .line 156
    return-void

    .line 158
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBlockingExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/imagecapture/ProcessingNode;Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 159
    return-void
.end method

.method processInMemoryCapture(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/ImageProxy;
    .locals 9
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 333
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    .line 334
    .local v0, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    invoke-interface {v1, p1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/Packet;

    .line 337
    .local v1, "image":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    iget-object v2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {v2}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getOutputFormats()Ljava/util/List;

    move-result-object v2

    .line 338
    .local v2, "outputFormats":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    invoke-static {v3}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 339
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 341
    .local v5, "format":I
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v6

    const/16 v7, 0x23

    if-eq v6, v7, :cond_0

    iget-object v6, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    if-nez v6, :cond_0

    iget-boolean v6, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mHasIncorrectJpegMetadataQuirk:Z

    if-eqz v6, :cond_2

    :cond_0
    const/16 v6, 0x100

    if-ne v5, v6, :cond_2

    .line 343
    iget-object v6, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImage2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 344
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getJpegQuality()I

    move-result v7

    invoke-static {v1, v7}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->of(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/imagecapture/Image2JpegBytes$In;

    move-result-object v7

    .line 343
    invoke-interface {v6, v7}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/processing/Packet;

    .line 345
    .local v6, "jpegBytes":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    iget-object v7, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    if-eqz v7, :cond_1

    .line 346
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getJpegQuality()I

    move-result v7

    invoke-direct {p0, v6, v7}, Landroidx/camera/core/imagecapture/ProcessingNode;->cropAndMaybeApplyEffect(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/processing/Packet;

    move-result-object v6

    .line 348
    :cond_1
    iget-object v7, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2Image:Landroidx/camera/core/processing/Operation;

    invoke-interface {v7, v6}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v1, v7

    check-cast v1, Landroidx/camera/core/processing/Packet;

    .line 350
    .end local v6    # "jpegBytes":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    :cond_2
    iget-object v6, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegImage2Result:Landroidx/camera/core/processing/Operation;

    invoke-interface {v6, v1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/ImageProxy;

    .line 351
    .local v6, "imageProxy":Landroidx/camera/core/ImageProxy;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    if-le v7, v4, :cond_3

    move v3, v4

    .line 352
    .local v3, "isSimultaneousCaptureEnabled":Z
    :cond_3
    if-eqz v3, :cond_4

    .line 353
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTakePictureRequest()Landroidx/camera/core/imagecapture/TakePictureRequest;

    move-result-object v7

    .line 354
    invoke-interface {v6}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v8

    invoke-virtual {v7, v8, v4}, Landroidx/camera/core/imagecapture/TakePictureRequest;->markFormatProcessStatusInSimultaneousCapture(IZ)V

    .line 356
    :cond_4
    return-object v6
.end method

.method processInputPacket(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 7
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 192
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    .line 196
    .local v0, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {v2}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getOutputFormats()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v1

    .line 197
    .local v2, "isSimultaneousCaptureEnabled":Z
    :goto_0
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->isInMemoryCapture()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 198
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->processInMemoryCapture(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/ImageProxy;

    move-result-object v3

    .line 199
    .local v3, "result":Landroidx/camera/core/ImageProxy;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v4

    new-instance v5, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda4;

    invoke-direct {v5, v0, v3}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageProxy;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 200
    .end local v3    # "result":Landroidx/camera/core/ImageProxy;
    goto :goto_3

    .line 201
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->processOnDiskCapture(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object v4

    .line 202
    .local v4, "result":Landroidx/camera/core/ImageCapture$OutputFileResults;
    if-eqz v2, :cond_3

    .line 203
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTakePictureRequest()Landroidx/camera/core/imagecapture/TakePictureRequest;

    move-result-object v5

    .line 204
    invoke-virtual {v5}, Landroidx/camera/core/imagecapture/TakePictureRequest;->isFormatProcessedInSimultaneousCapture()Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_1

    :cond_2
    move v3, v1

    goto :goto_2

    :cond_3
    :goto_1
    nop

    .line 205
    .local v3, "isProcessed":Z
    :goto_2
    if-eqz v3, :cond_4

    .line 206
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v5

    new-instance v6, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda5;

    invoke-direct {v6, v0, v4}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCapture$OutputFileResults;)V

    invoke-interface {v5, v6}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Landroidx/camera/core/ImageCaptureException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 214
    .end local v2    # "isSimultaneousCaptureEnabled":Z
    .end local v3    # "isProcessed":Z
    .end local v4    # "result":Landroidx/camera/core/ImageCapture$OutputFileResults;
    :catch_0
    move-exception v2

    .line 216
    .local v2, "e":Ljava/lang/RuntimeException;
    new-instance v3, Landroidx/camera/core/ImageCaptureException;

    const-string v4, "Processing failed."

    invoke-direct {v3, v1, v4, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v0, v3}, Landroidx/camera/core/imagecapture/ProcessingNode;->sendError(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V

    goto :goto_4

    .line 211
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v2

    .line 212
    .local v2, "e":Ljava/lang/OutOfMemoryError;
    new-instance v3, Landroidx/camera/core/ImageCaptureException;

    const-string v4, "Processing failed due to low memory."

    invoke-direct {v3, v1, v4, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v0, v3}, Landroidx/camera/core/imagecapture/ProcessingNode;->sendError(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V

    .end local v2    # "e":Ljava/lang/OutOfMemoryError;
    goto :goto_3

    .line 209
    :catch_2
    move-exception v1

    .line 210
    .local v1, "e":Landroidx/camera/core/ImageCaptureException;
    invoke-direct {p0, v0, v1}, Landroidx/camera/core/imagecapture/ProcessingNode;->sendError(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V

    .line 217
    .end local v1    # "e":Landroidx/camera/core/ImageCaptureException;
    :cond_4
    :goto_3
    nop

    .line 218
    :goto_4
    return-void
.end method

.method processOnDiskCapture(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/ImageCapture$OutputFileResults;
    .locals 9
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 243
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getOutputFormats()Ljava/util/List;

    move-result-object v0

    .line 244
    .local v0, "outputFormats":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 245
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 246
    .local v3, "format":I
    invoke-static {v3}, Landroidx/camera/core/internal/utils/ImageUtil;->isJpegFormats(I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 247
    invoke-static {v3}, Landroidx/camera/core/internal/utils/ImageUtil;->isRawFormats(I)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    move v4, v1

    goto :goto_1

    :cond_1
    :goto_0
    move v4, v2

    .line 249
    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-array v6, v2, [Ljava/lang/Object;

    aput-object v5, v6, v1

    .line 248
    const-string v5, "On-disk capture only support JPEG and JPEG/R and RAW output formats. Output format: %s"

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 246
    invoke-static {v4, v5}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 250
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v4

    .line 251
    .local v4, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v5

    if-eqz v5, :cond_2

    move v5, v2

    goto :goto_2

    :cond_2
    move v5, v1

    :goto_2
    const-string v6, "OutputFileOptions cannot be empty"

    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 253
    iget-object v5, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    invoke-interface {v5, p1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/processing/Packet;

    .line 254
    .local v5, "originalImage":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    if-le v6, v2, :cond_3

    move v6, v2

    goto :goto_3

    :cond_3
    move v6, v1

    .line 255
    .local v6, "isSimultaneousCaptureEnabled":Z
    :goto_3
    if-eqz v6, :cond_5

    .line 258
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 259
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getSecondaryOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v7

    if-eqz v7, :cond_4

    move v1, v2

    goto :goto_4

    :cond_4
    nop

    .line 258
    :goto_4
    const-string v7, "The number of OutputFileOptions for simultaneous capture should be at least two"

    invoke-static {v1, v7}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 262
    const/4 v1, 0x0

    .line 263
    .local v1, "outputFileResults":Landroidx/camera/core/ImageCapture$OutputFileResults;
    invoke-virtual {v5}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 272
    nop

    .line 273
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getSecondaryOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v7

    invoke-static {v7}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 274
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getJpegQuality()I

    move-result v8

    .line 272
    invoke-direct {p0, v5, v7, v8}, Landroidx/camera/core/imagecapture/ProcessingNode;->saveJpegToDisk(Landroidx/camera/core/processing/Packet;Landroidx/camera/core/ImageCapture$OutputFileOptions;I)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object v1

    .line 275
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTakePictureRequest()Landroidx/camera/core/imagecapture/TakePictureRequest;

    move-result-object v7

    .line 276
    const/16 v8, 0x100

    invoke-virtual {v7, v8, v2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->markFormatProcessStatusInSimultaneousCapture(IZ)V

    .line 277
    return-object v1

    .line 265
    :pswitch_0
    nop

    .line 266
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v7

    invoke-static {v7}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 265
    invoke-direct {p0, v5, v7}, Landroidx/camera/core/imagecapture/ProcessingNode;->saveRawToDisk(Landroidx/camera/core/processing/Packet;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object v1

    .line 267
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTakePictureRequest()Landroidx/camera/core/imagecapture/TakePictureRequest;

    move-result-object v7

    .line 268
    const/16 v8, 0x20

    invoke-virtual {v7, v8, v2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->markFormatProcessStatusInSimultaneousCapture(IZ)V

    .line 269
    return-object v1

    .line 280
    .end local v1    # "outputFileResults":Landroidx/camera/core/ImageCapture$OutputFileResults;
    :cond_5
    packed-switch v3, :pswitch_data_1

    .line 286
    nop

    .line 287
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 288
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getJpegQuality()I

    move-result v2

    .line 286
    invoke-direct {p0, v5, v1, v2}, Landroidx/camera/core/imagecapture/ProcessingNode;->saveJpegToDisk(Landroidx/camera/core/processing/Packet;Landroidx/camera/core/ImageCapture$OutputFileOptions;I)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object v1

    return-object v1

    .line 282
    :pswitch_1
    nop

    .line 283
    invoke-virtual {v4}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 282
    invoke-direct {p0, v5, v1}, Landroidx/camera/core/imagecapture/ProcessingNode;->saveRawToDisk(Landroidx/camera/core/processing/Packet;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x20
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x20
        :pswitch_1
    .end packed-switch
.end method

.method processPostviewInputPacket(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 8
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 222
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    .line 224
    .local v0, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    invoke-interface {v1, p1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/Packet;

    .line 225
    .local v1, "image":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v2

    .line 226
    .local v2, "imageFormat":I
    const/16 v3, 0x23

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v2, v3, :cond_1

    const/16 v3, 0x100

    if-eq v2, v3, :cond_1

    const/16 v3, 0x1005

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    move v3, v4

    goto :goto_1

    :cond_1
    :goto_0
    move v3, v5

    :goto_1
    const-string v6, "Postview only supports to convert YUV, JPEG and JPEG_R format image to the postview output bitmap. Image format: %s"

    .line 231
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v7, v5, v4

    .line 228
    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 226
    invoke-static {v3, v4}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 232
    iget-object v3, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImage2Bitmap:Landroidx/camera/core/processing/Operation;

    invoke-interface {v3, v1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Bitmap;

    .line 233
    .local v3, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v4

    new-instance v5, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda6;

    invoke-direct {v5, v0, v3}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroid/graphics/Bitmap;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    .end local v1    # "image":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    .end local v2    # "imageFormat":I
    .end local v3    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_2

    .line 234
    :catch_0
    move-exception v1

    .line 235
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getImageProxy()Landroidx/camera/core/ImageProxy;

    move-result-object v2

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy;->close()V

    .line 236
    const-string v2, "ProcessingNode"

    const-string/jumbo v3, "process postview input packet failed."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 238
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method

.method public release()V
    .locals 0

    .line 185
    return-void
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

    .line 68
    check-cast p1, Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->transform(Landroidx/camera/core/imagecapture/ProcessingNode$In;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public transform(Landroidx/camera/core/imagecapture/ProcessingNode$In;)Ljava/lang/Void;
    .locals 2
    .param p1, "inputEdge"    # Landroidx/camera/core/imagecapture/ProcessingNode$In;

    .line 138
    iput-object p1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    .line 140
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/imagecapture/ProcessingNode;)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 149
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getPostviewEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/imagecapture/ProcessingNode;)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 162
    new-instance v0, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    .line 163
    new-instance v0, Landroidx/camera/core/imagecapture/Image2JpegBytes;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mQuirks:Landroidx/camera/core/impl/Quirks;

    invoke-direct {v0, v1}, Landroidx/camera/core/imagecapture/Image2JpegBytes;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImage2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 164
    new-instance v0, Landroidx/camera/core/imagecapture/JpegBytes2CroppedBitmap;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/JpegBytes2CroppedBitmap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2CroppedBitmap:Landroidx/camera/core/processing/Operation;

    .line 165
    new-instance v0, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmap2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 166
    new-instance v0, Landroidx/camera/core/imagecapture/JpegBytes2Disk;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2Disk:Landroidx/camera/core/processing/Operation;

    .line 167
    new-instance v0, Landroidx/camera/core/imagecapture/JpegImage2Result;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/JpegImage2Result;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegImage2Result:Landroidx/camera/core/processing/Operation;

    .line 168
    new-instance v0, Landroidx/camera/core/imagecapture/Image2Bitmap;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/Image2Bitmap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImage2Bitmap:Landroidx/camera/core/processing/Operation;

    .line 169
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getInputFormat()I

    move-result v0

    const/16 v1, 0x23

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mHasIncorrectJpegMetadataQuirk:Z

    if-eqz v0, :cond_1

    .line 174
    :cond_0
    new-instance v0, Landroidx/camera/core/imagecapture/JpegBytes2Image;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/JpegBytes2Image;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2Image:Landroidx/camera/core/processing/Operation;

    .line 176
    :cond_1
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    if-eqz v0, :cond_2

    .line 177
    new-instance v0, Landroidx/camera/core/imagecapture/BitmapEffect;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    invoke-direct {v0, v1}, Landroidx/camera/core/imagecapture/BitmapEffect;-><init>(Landroidx/camera/core/processing/InternalImageProcessor;)V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    .line 180
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method
