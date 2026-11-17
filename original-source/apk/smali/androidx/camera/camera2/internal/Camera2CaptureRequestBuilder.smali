.class Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;
.super Ljava/lang/Object;
.source "Camera2CaptureRequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder$Api23Impl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2CaptureRequestBuilder"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method private static applyAeFpsRange(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 115
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v0

    .line 116
    .local v0, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v0, v1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 118
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 120
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyAeFpsRange: expectedFrameRateRange = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Camera2CaptureRequestBuilder"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method private static applyImplementationOptionToCaptureBuilder(Landroid/hardware/camera2/CaptureRequest$Builder;Landroidx/camera/core/impl/Config;)V
    .locals 7
    .param p0, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 96
    invoke-static {p1}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v0

    .line 97
    .local v0, "bundle":Landroidx/camera/camera2/interop/CaptureRequestOptions;
    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions;->listOptions()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/Config$Option;

    .line 99
    .local v2, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    invoke-virtual {v2}, Landroidx/camera/core/impl/Config$Option;->getToken()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/camera2/CaptureRequest$Key;

    .line 105
    .local v3, "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    :try_start_0
    invoke-virtual {v0, v2}, Landroidx/camera/camera2/interop/CaptureRequestOptions;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    goto :goto_1

    .line 106
    :catch_0
    move-exception v4

    .line 107
    .local v4, "e":Ljava/lang/IllegalArgumentException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CaptureRequest.Key is not supported: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Camera2CaptureRequestBuilder"

    invoke-static {v6, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .end local v2    # "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .end local v3    # "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    .end local v4    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    goto :goto_0

    .line 110
    :cond_0
    return-void
.end method

.method private static applyTemplateParamsOverrideWorkaround(Landroid/hardware/camera2/CaptureRequest$Builder;ILandroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;)V
    .locals 4
    .param p0, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "template"    # I
    .param p2, "templateParamsOverride"    # Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;

    .line 86
    invoke-virtual {p2, p1}, Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;->getOverrideParams(I)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 88
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/hardware/camera2/CaptureRequest$Key<*>;Ljava/lang/Object;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/CaptureRequest$Key;

    .line 89
    .local v2, "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 90
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/hardware/camera2/CaptureRequest$Key<*>;Ljava/lang/Object;>;"
    .end local v2    # "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    goto :goto_0

    .line 91
    :cond_0
    return-void
.end method

.method static applyVideoStabilization(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 126
    invoke-static {p0}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->getVideoStabilizationModeFromCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Ljava/lang/Integer;

    move-result-object v0

    .line 127
    .local v0, "mode":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 128
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 130
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyVideoStabilization: mode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Camera2CaptureRequestBuilder"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method public static build(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CameraDevice;Ljava/util/Map;ZLandroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;)Landroid/hardware/camera2/CaptureRequest;
    .locals 6
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;
    .param p1, "device"    # Landroid/hardware/camera2/CameraDevice;
    .param p3, "isRepeatingRequest"    # Z
    .param p4, "mTemplateParamsOverride"    # Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CaptureConfig;",
            "Landroid/hardware/camera2/CameraDevice;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Landroid/view/Surface;",
            ">;Z",
            "Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;",
            ")",
            "Landroid/hardware/camera2/CaptureRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 163
    .local p2, "configuredSurfaceMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Landroid/view/Surface;>;"
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 164
    return-object v0

    .line 167
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v1

    invoke-static {v1, p2}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->getConfiguredSurfaces(Ljava/util/List;Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    .line 169
    .local v1, "surfaceList":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 170
    return-object v0

    .line 174
    :cond_1
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v0

    .line 175
    .local v0, "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    nop

    .line 176
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v2

    const/4 v3, 0x5

    const-string v4, "Camera2CaptureRequestBuilder"

    if-ne v2, v3, :cond_2

    if-eqz v0, :cond_2

    .line 178
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v2

    instance-of v2, v2, Landroid/hardware/camera2/TotalCaptureResult;

    if-eqz v2, :cond_2

    .line 179
    const-string v2, "createReprocessCaptureRequest"

    invoke-static {v4, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    nop

    .line 181
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/TotalCaptureResult;

    .line 180
    invoke-static {p1, v2}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder$Api23Impl;->createReprocessCaptureRequest(Landroid/hardware/camera2/CameraDevice;Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    .local v2, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    goto :goto_1

    .line 183
    .end local v2    # "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :cond_2
    const-string v2, "createCaptureRequest"

    invoke-static {v4, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v2

    if-ne v2, v3, :cond_4

    .line 186
    if-eqz p3, :cond_3

    const/4 v2, 0x1

    goto :goto_0

    .line 187
    :cond_3
    const/4 v2, 0x2

    :goto_0
    nop

    .line 188
    .local v2, "templateType":I
    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    .line 189
    .local v2, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    goto :goto_1

    .line 190
    .end local v2    # "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :cond_4
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    .line 194
    .restart local v2    # "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_1
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v3

    invoke-static {v2, v3, p4}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyTemplateParamsOverrideWorkaround(Landroid/hardware/camera2/CaptureRequest$Builder;ILandroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;)V

    .line 197
    invoke-static {p0, v2}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyAeFpsRange(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 199
    invoke-static {p0, v2}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyVideoStabilization(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 201
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/impl/CaptureConfig;->OPTION_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v3, v4}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 203
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 204
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    sget-object v5, Landroidx/camera/core/impl/CaptureConfig;->OPTION_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v5}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 203
    invoke-virtual {v2, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 208
    :cond_5
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/impl/CaptureConfig;->OPTION_JPEG_QUALITY:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v3, v4}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 210
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 211
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    sget-object v5, Landroidx/camera/core/impl/CaptureConfig;->OPTION_JPEG_QUALITY:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v5}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 212
    invoke-virtual {v4}, Ljava/lang/Integer;->byteValue()B

    move-result v4

    .line 211
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    .line 210
    invoke-virtual {v2, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 218
    :cond_6
    nop

    .line 219
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    .line 218
    invoke-static {v2, v3}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyImplementationOptionToCaptureBuilder(Landroid/hardware/camera2/CaptureRequest$Builder;Landroidx/camera/core/impl/Config;)V

    .line 221
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/Surface;

    .line 222
    .local v4, "surface":Landroid/view/Surface;
    invoke-virtual {v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 223
    .end local v4    # "surface":Landroid/view/Surface;
    goto :goto_2

    .line 225
    :cond_7
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->setTag(Ljava/lang/Object;)V

    .line 227
    invoke-virtual {v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v3

    return-object v3
.end method

.method public static buildWithoutTarget(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;)Landroid/hardware/camera2/CaptureRequest;
    .locals 2
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;
    .param p1, "device"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "templateParamsOverride"    # Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 239
    if-nez p1, :cond_0

    .line 240
    const/4 v0, 0x0

    return-object v0

    .line 242
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "template type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Camera2CaptureRequestBuilder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    nop

    .line 244
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v0

    .line 243
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 246
    .local v0, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v1

    invoke-static {v0, v1, p2}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyTemplateParamsOverrideWorkaround(Landroid/hardware/camera2/CaptureRequest$Builder;ILandroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;)V

    .line 249
    invoke-static {p0, v0}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyAeFpsRange(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 251
    nop

    .line 252
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v1

    .line 251
    invoke-static {v0, v1}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyImplementationOptionToCaptureBuilder(Landroid/hardware/camera2/CaptureRequest$Builder;Landroidx/camera/core/impl/Config;)V

    .line 254
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    return-object v1
.end method

.method private static getConfiguredSurfaces(Ljava/util/List;Ljava/util/Map;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Landroid/view/Surface;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    .line 68
    .local p0, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    .local p1, "configuredSurfaceMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Landroid/view/Surface;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v0, "surfaceList":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/DeferrableSurface;

    .line 70
    .local v2, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/Surface;

    .line 72
    .local v3, "surface":Landroid/view/Surface;
    if-eqz v3, :cond_0

    .line 76
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .end local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .end local v3    # "surface":Landroid/view/Surface;
    goto :goto_0

    .line 73
    .restart local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .restart local v3    # "surface":Landroid/view/Surface;
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v4, "DeferrableSurface not in configuredSurfaceMap"

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    .end local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .end local v3    # "surface":Landroid/view/Surface;
    :cond_1
    return-object v0
.end method

.method static getVideoStabilizationModeFromCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Ljava/lang/Integer;
    .locals 3
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 136
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getPreviewStabilizationMode()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    .line 137
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getVideoStabilizationMode()I

    move-result v0

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 139
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getPreviewStabilizationMode()I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    .line 140
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 141
    :cond_1
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getVideoStabilizationMode()I

    move-result v0

    if-ne v0, v2, :cond_2

    .line 142
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 144
    :cond_2
    const/4 v0, 0x0

    return-object v0

    .line 138
    :cond_3
    :goto_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
