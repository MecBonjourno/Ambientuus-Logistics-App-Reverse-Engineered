.class final Landroidx/camera/camera2/internal/ZslControlImpl;
.super Ljava/lang/Object;
.source "ZslControlImpl.java"

# interfaces
.implements Landroidx/camera/camera2/internal/ZslControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;
    }
.end annotation


# static fields
.field static final MAX_IMAGES:I = 0x9

.field static final RING_BUFFER_CAPACITY:I = 0x3

.field private static final TAG:Ljava/lang/String; = "ZslControlImpl"


# instance fields
.field private final mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field final mImageRingBuffer:Landroidx/camera/core/internal/utils/ZslRingBuffer;

.field private mIsPrivateReprocessingSupported:Z

.field private mIsZslDisabledByFlashMode:Z

.field private mIsZslDisabledByUseCaseConfig:Z

.field private mReprocessingImageDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

.field mReprocessingImageReader:Landroidx/camera/core/SafeCloseImageReaderProxy;

.field mReprocessingImageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

.field private mShouldZslDisabledByQuirks:Z


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/concurrent/Executor;)V
    .locals 3
    .param p1, "cameraCharacteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsZslDisabledByUseCaseConfig:Z

    .line 88
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsZslDisabledByFlashMode:Z

    .line 89
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsPrivateReprocessingSupported:Z

    .line 91
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mShouldZslDisabledByQuirks:Z

    .line 101
    iput-object p1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 102
    iput-object p2, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 103
    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 104
    const/4 v2, 0x4

    invoke-static {v1, v2}, Landroidx/camera/camera2/internal/ZslUtil;->isCapabilitySupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;I)Z

    move-result v1

    iput-boolean v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsPrivateReprocessingSupported:Z

    .line 107
    const-class v1, Landroidx/camera/camera2/internal/compat/quirk/ZslDisablerQuirk;

    invoke-static {v1}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mShouldZslDisabledByQuirks:Z

    .line 109
    new-instance v0, Landroidx/camera/core/internal/utils/ZslRingBuffer;

    new-instance v1, Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda2;-><init>()V

    const/4 v2, 0x3

    invoke-direct {v0, v2, v1}, Landroidx/camera/core/internal/utils/ZslRingBuffer;-><init>(ILandroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mImageRingBuffer:Landroidx/camera/core/internal/utils/ZslRingBuffer;

    .line 112
    return-void
.end method

.method private cleanup()V
    .locals 2

    .line 264
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageReader:Landroidx/camera/core/SafeCloseImageReaderProxy;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageReader:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->clearOnImageAvailableListener()V

    .line 269
    iput-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageReader:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 271
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    if-eqz v0, :cond_1

    .line 274
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->deactivate()V

    .line 275
    iput-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    .line 280
    :cond_1
    invoke-direct {p0}, Landroidx/camera/camera2/internal/ZslControlImpl;->clearRingBuffer()V

    .line 282
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    if-eqz v0, :cond_2

    .line 284
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 285
    iput-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 287
    :cond_2
    return-void
.end method

.method private clearRingBuffer()V
    .locals 2

    .line 290
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mImageRingBuffer:Landroidx/camera/core/internal/utils/ZslRingBuffer;

    .line 291
    .local v0, "imageRingBuffer":Landroidx/camera/core/internal/utils/ZslRingBuffer;
    :goto_0
    invoke-virtual {v0}, Landroidx/camera/core/internal/utils/ZslRingBuffer;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 292
    invoke-virtual {v0}, Landroidx/camera/core/internal/utils/ZslRingBuffer;->dequeue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ImageProxy;

    .line 293
    .local v1, "imageProxy":Landroidx/camera/core/ImageProxy;
    invoke-interface {v1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 294
    .end local v1    # "imageProxy":Landroidx/camera/core/ImageProxy;
    goto :goto_0

    .line 295
    :cond_0
    return-void
.end method

.method private createReprocessingInputSizeMap(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Ljava/util/Map;
    .locals 10
    .param p1, "cameraCharacteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 299
    const/4 v0, 0x0

    .line 301
    .local v0, "map":Landroid/hardware/camera2/params/StreamConfigurationMap;
    :try_start_0
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p1, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/params/StreamConfigurationMap;
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 307
    goto :goto_0

    .line 303
    :catch_0
    move-exception v1

    .line 305
    .local v1, "e":Ljava/lang/AssertionError;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to retrieve StreamConfigurationMap, error = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 306
    invoke-virtual {v1}, Ljava/lang/AssertionError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 305
    const-string v3, "ZslControlImpl"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    .end local v1    # "e":Ljava/lang/AssertionError;
    :goto_0
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getInputFormats()[I

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 313
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 314
    .local v1, "inputSizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    invoke-virtual {v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getInputFormats()[I

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_1
    if-ge v5, v3, :cond_2

    aget v6, v2, v5

    .line 315
    .local v6, "format":I
    invoke-virtual {v0, v6}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getInputSizes(I)[Landroid/util/Size;

    move-result-object v7

    .line 316
    .local v7, "inputSizes":[Landroid/util/Size;
    if-eqz v7, :cond_1

    .line 318
    new-instance v8, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    const/4 v9, 0x1

    invoke-direct {v8, v9}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {v7, v8}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 322
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aget-object v9, v7, v4

    invoke-interface {v1, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    .end local v6    # "format":I
    .end local v7    # "inputSizes":[Landroid/util/Size;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 325
    :cond_2
    return-object v1

    .line 310
    .end local v1    # "inputSizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    :cond_3
    :goto_2
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    return-object v1
.end method

.method private isJpegValidOutputForInputFormat(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;I)Z
    .locals 7
    .param p1, "cameraCharacteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p2, "inputFormat"    # I

    .line 331
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 332
    invoke-virtual {p1, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 335
    .local v0, "map":Landroid/hardware/camera2/params/StreamConfigurationMap;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 336
    return v1

    .line 339
    :cond_0
    invoke-virtual {v0, p2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getValidOutputFormatsForInput(I)[I

    move-result-object v2

    .line 340
    .local v2, "validOutputFormats":[I
    if-nez v2, :cond_1

    .line 341
    return v1

    .line 343
    :cond_1
    array-length v3, v2

    move v4, v1

    :goto_0
    if-ge v4, v3, :cond_3

    aget v5, v2, v4

    .line 344
    .local v5, "outputFormat":I
    const/16 v6, 0x100

    if-ne v5, v6, :cond_2

    .line 345
    const/4 v1, 0x1

    return v1

    .line 343
    .end local v5    # "outputFormat":I
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 348
    :cond_3
    return v1
.end method

.method static synthetic lambda$addZslConfig$1(Landroidx/camera/core/SafeCloseImageReaderProxy;Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;)V
    .locals 0
    .param p0, "reprocessingImageReaderProxy"    # Landroidx/camera/core/SafeCloseImageReaderProxy;
    .param p1, "imageWriterHolder"    # Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    .line 205
    invoke-virtual {p0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->safeClose()V

    .line 206
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->release()V

    .line 207
    return-void
.end method


# virtual methods
.method public addZslConfig(Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 11
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 139
    invoke-direct {p0}, Landroidx/camera/camera2/internal/ZslControlImpl;->cleanup()V

    .line 145
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsZslDisabledByUseCaseConfig:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {p1, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 147
    return-void

    .line 150
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mShouldZslDisabledByQuirks:Z

    if-eqz v0, :cond_1

    .line 151
    invoke-virtual {p1, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 152
    return-void

    .line 155
    :cond_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 156
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/ZslControlImpl;->createReprocessingInputSizeMap(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Ljava/util/Map;

    move-result-object v0

    .line 160
    .local v0, "mReprocessingInputSizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    iget-boolean v2, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsPrivateReprocessingSupported:Z

    if-eqz v2, :cond_3

    .line 161
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 162
    const/16 v2, 0x22

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mCameraCharacteristicsCompat:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 163
    invoke-direct {p0, v3, v2}, Landroidx/camera/camera2/internal/ZslControlImpl;->isJpegValidOutputForInputFormat(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;I)Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_0

    .line 168
    :cond_2
    const/16 v1, 0x22

    .line 169
    .local v1, "reprocessingImageFormat":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 170
    .local v2, "resolution":Landroid/util/Size;
    new-instance v3, Landroidx/camera/core/MetadataImageReader;

    .line 171
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v4

    .line 172
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v5

    const/16 v6, 0x9

    invoke-direct {v3, v4, v5, v1, v6}, Landroidx/camera/core/MetadataImageReader;-><init>(IIII)V

    .line 177
    .local v3, "metadataImageReader":Landroidx/camera/core/MetadataImageReader;
    new-instance v4, Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-direct {v4, v3}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    .line 179
    .local v4, "reprocessingImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    new-instance v5, Landroidx/camera/core/impl/ImmediateSurface;

    .line 180
    invoke-virtual {v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v6

    invoke-static {v6}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/Surface;

    new-instance v7, Landroid/util/Size;

    .line 181
    invoke-virtual {v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getWidth()I

    move-result v8

    .line 182
    invoke-virtual {v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getHeight()I

    move-result v9

    invoke-direct {v7, v8, v9}, Landroid/util/Size;-><init>(II)V

    invoke-direct {v5, v6, v7, v1}, Landroidx/camera/core/impl/ImmediateSurface;-><init>(Landroid/view/Surface;Landroid/util/Size;I)V

    .line 184
    .local v5, "reprocessingImageDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    new-instance v6, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    iget-object v7, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v6, v7}, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;-><init>(Ljava/util/concurrent/Executor;)V

    .line 186
    .local v6, "imageWriterHolder":Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;
    iput-object v4, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageReader:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 187
    iput-object v5, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 188
    iput-object v6, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    .line 190
    new-instance v7, Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda0;

    invoke-direct {v7, p0}, Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/ZslControlImpl;)V

    .line 202
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->ioExecutor()Ljava/util/concurrent/Executor;

    move-result-object v8

    .line 190
    invoke-virtual {v4, v7, v8}, Landroidx/camera/core/SafeCloseImageReaderProxy;->setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;Ljava/util/concurrent/Executor;)V

    .line 204
    invoke-virtual {v5}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v7

    new-instance v8, Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda1;

    invoke-direct {v8, v4, v6}, Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/SafeCloseImageReaderProxy;Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;)V

    iget-object v9, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v7, v8, v9}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 208
    invoke-virtual {p1, v5}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 211
    nop

    .line 212
    invoke-virtual {v3}, Landroidx/camera/core/MetadataImageReader;->getCameraCaptureCallback()Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v7

    .line 211
    invoke-virtual {p1, v7}, Landroidx/camera/core/impl/SessionConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 213
    new-instance v7, Landroidx/camera/camera2/internal/ZslControlImpl$1;

    invoke-direct {v7, p0, v6}, Landroidx/camera/camera2/internal/ZslControlImpl$1;-><init>(Landroidx/camera/camera2/internal/ZslControlImpl;Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;)V

    invoke-virtual {p1, v7}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSessionStateCallback(Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 231
    new-instance v7, Landroid/hardware/camera2/params/InputConfiguration;

    .line 232
    invoke-virtual {v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getWidth()I

    move-result v8

    .line 233
    invoke-virtual {v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getHeight()I

    move-result v9

    .line 234
    invoke-virtual {v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getImageFormat()I

    move-result v10

    invoke-direct {v7, v8, v9, v10}, Landroid/hardware/camera2/params/InputConfiguration;-><init>(III)V

    .line 231
    invoke-virtual {p1, v7}, Landroidx/camera/core/impl/SessionConfig$Builder;->setInputConfiguration(Landroid/hardware/camera2/params/InputConfiguration;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 235
    return-void

    .line 164
    .end local v1    # "reprocessingImageFormat":I
    .end local v2    # "resolution":Landroid/util/Size;
    .end local v3    # "metadataImageReader":Landroidx/camera/core/MetadataImageReader;
    .end local v4    # "reprocessingImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v5    # "reprocessingImageDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .end local v6    # "imageWriterHolder":Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;
    :cond_3
    :goto_0
    invoke-virtual {p1, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 165
    return-void
.end method

.method public clearZslConfig()V
    .locals 0

    .line 239
    invoke-direct {p0}, Landroidx/camera/camera2/internal/ZslControlImpl;->cleanup()V

    .line 240
    return-void
.end method

.method public dequeueImageFromBuffer()Landroidx/camera/core/ImageProxy;
    .locals 4

    .line 244
    const/4 v0, 0x0

    .line 246
    .local v0, "imageProxy":Landroidx/camera/core/ImageProxy;
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mImageRingBuffer:Landroidx/camera/core/internal/utils/ZslRingBuffer;

    invoke-virtual {v1}, Landroidx/camera/core/internal/utils/ZslRingBuffer;->dequeue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ImageProxy;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 249
    goto :goto_0

    .line 247
    :catch_0
    move-exception v1

    .line 248
    .local v1, "e":Ljava/util/NoSuchElementException;
    const-string v2, "ZslControlImpl"

    const-string v3, "dequeueImageFromBuffer no such element"

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .end local v1    # "e":Ljava/util/NoSuchElementException;
    :goto_0
    return-object v0
.end method

.method public enqueueImageToImageWriter(Landroidx/camera/core/ImageProxy;)Z
    .locals 1
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 257
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageWriterHolder:Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/ZslControlImpl$ImageWriterHolder;->enqueueImageToImageWriter(Landroidx/camera/core/ImageProxy;)Z

    move-result v0

    return v0

    .line 260
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isZslDisabledByFlashMode()Z
    .locals 1

    .line 134
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsZslDisabledByFlashMode:Z

    return v0
.end method

.method public isZslDisabledByUserCaseConfig()Z
    .locals 1

    .line 124
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsZslDisabledByUseCaseConfig:Z

    return v0
.end method

.method synthetic lambda$addZslConfig$0$androidx-camera-camera2-internal-ZslControlImpl(Landroidx/camera/core/impl/ImageReaderProxy;)V
    .locals 3
    .param p1, "imageReader"    # Landroidx/camera/core/impl/ImageReaderProxy;

    .line 193
    :try_start_0
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageReaderProxy;->acquireLatestImage()Landroidx/camera/core/ImageProxy;

    move-result-object v0

    .line 194
    .local v0, "imageProxy":Landroidx/camera/core/ImageProxy;
    if-eqz v0, :cond_0

    .line 195
    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mImageRingBuffer:Landroidx/camera/core/internal/utils/ZslRingBuffer;

    invoke-virtual {v1, v0}, Landroidx/camera/core/internal/utils/ZslRingBuffer;->enqueue(Landroidx/camera/core/ImageProxy;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .end local v0    # "imageProxy":Landroidx/camera/core/ImageProxy;
    :cond_0
    goto :goto_0

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/IllegalStateException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to acquire latest image IllegalStateException = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 199
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 198
    const-string v2, "ZslControlImpl"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :goto_0
    return-void
.end method

.method public setZslDisabledByFlashMode(Z)V
    .locals 0
    .param p1, "disabled"    # Z

    .line 129
    iput-boolean p1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsZslDisabledByFlashMode:Z

    .line 130
    return-void
.end method

.method public setZslDisabledByUserCaseConfig(Z)V
    .locals 1
    .param p1, "disabled"    # Z

    .line 116
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsZslDisabledByUseCaseConfig:Z

    if-eq v0, p1, :cond_0

    if-eqz p1, :cond_0

    .line 117
    invoke-direct {p0}, Landroidx/camera/camera2/internal/ZslControlImpl;->clearRingBuffer()V

    .line 119
    :cond_0
    iput-boolean p1, p0, Landroidx/camera/camera2/internal/ZslControlImpl;->mIsZslDisabledByUseCaseConfig:Z

    .line 120
    return-void
.end method
