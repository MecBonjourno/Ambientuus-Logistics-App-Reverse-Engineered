.class public final synthetic Landroidx/camera/core/impl/SessionProcessor$-CC;
.super Ljava/lang/Object;
.source "SessionProcessor.java"


# direct methods
.method public static $default$getAvailableCharacteristicsKeyValues(Landroidx/camera/core/impl/SessionProcessor;)Ljava/util/List;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;

    .line 174
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getExtensionAvailableStabilizationModes(Landroidx/camera/core/impl/SessionProcessor;)[I
    .locals 5
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;

    .line 199
    nop

    .line 200
    invoke-interface {p0}, Landroidx/camera/core/impl/SessionProcessor;->getAvailableCharacteristicsKeyValues()Ljava/util/List;

    move-result-object v0

    .line 201
    .local v0, "keyValues":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 202
    .local v2, "keyValue":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;"
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Landroid/hardware/camera2/CameraCharacteristics$Key;

    sget-object v4, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraCharacteristics$Key;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 204
    iget-object v1, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, [I

    return-object v1

    .line 206
    .end local v2    # "keyValue":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;"
    :cond_0
    goto :goto_0

    .line 207
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public static $default$getExtensionZoomRange(Landroidx/camera/core/impl/SessionProcessor;)Landroid/util/Range;
    .locals 5
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;

    .line 182
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1

    .line 183
    nop

    .line 184
    invoke-interface {p0}, Landroidx/camera/core/impl/SessionProcessor;->getAvailableCharacteristicsKeyValues()Ljava/util/List;

    move-result-object v0

    .line 185
    .local v0, "keyValues":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 186
    .local v2, "keyValue":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;"
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Landroid/hardware/camera2/CameraCharacteristics$Key;

    sget-object v4, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_ZOOM_RATIO_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraCharacteristics$Key;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 187
    iget-object v1, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Landroid/util/Range;

    return-object v1

    .line 189
    .end local v2    # "keyValue":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;"
    :cond_0
    goto :goto_0

    .line 191
    .end local v0    # "keyValues":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;>;>;"
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static $default$getImplementationType(Landroidx/camera/core/impl/SessionProcessor;)Landroid/util/Pair;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;

    .line 246
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getRealtimeCaptureLatency(Landroidx/camera/core/impl/SessionProcessor;)Landroid/util/Pair;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;

    .line 230
    const/4 v0, 0x0

    return-object v0
.end method

.method public static $default$getSupportedCameraOperations(Landroidx/camera/core/impl/SessionProcessor;)Ljava/util/Set;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;

    .line 169
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getSupportedPostviewSize(Landroidx/camera/core/impl/SessionProcessor;Landroid/util/Size;)Ljava/util/Map;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;
    .param p1, "captureSize"    # Landroid/util/Size;

    .line 161
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public static $default$setCaptureSessionRequestProcessor(Landroidx/camera/core/impl/SessionProcessor;Landroidx/camera/core/impl/SessionProcessor$CaptureSessionRequestProcessor;)V
    .locals 0
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;
    .param p1, "processor"    # Landroidx/camera/core/impl/SessionProcessor$CaptureSessionRequestProcessor;

    .line 261
    return-void
.end method

.method public static $default$startTrigger(Landroidx/camera/core/impl/SessionProcessor;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/TagBundle;Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;)I
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/SessionProcessor;
    .param p1, "config"    # Landroidx/camera/core/impl/Config;
    .param p2, "tagBundle"    # Landroidx/camera/core/impl/TagBundle;
    .param p3, "callback"    # Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;

    .line 153
    const/4 v0, -0x1

    return v0
.end method
