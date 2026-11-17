.class public final synthetic Landroidx/camera/core/impl/UseCaseConfig$-CC;
.super Ljava/lang/Object;
.source "UseCaseConfig.java"


# direct methods
.method public static $default$getCaptureOptionUnpacker(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 259
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;

    return-object v0
.end method

.method public static $default$getCaptureOptionUnpacker(Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "valueIfMissing"    # Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;

    .line 244
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;

    return-object v0
.end method

.method public static $default$getCaptureType(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 374
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_TYPE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    return-object v0
.end method

.method public static $default$getDefaultCaptureConfig(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/CaptureConfig;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 195
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_DEFAULT_CAPTURE_CONFIG:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CaptureConfig;

    return-object v0
.end method

.method public static $default$getDefaultCaptureConfig(Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/impl/CaptureConfig;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "valueIfMissing"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 182
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_DEFAULT_CAPTURE_CONFIG:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CaptureConfig;

    return-object v0
.end method

.method public static $default$getDefaultSessionConfig(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/SessionConfig;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 167
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_DEFAULT_SESSION_CONFIG:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/SessionConfig;

    return-object v0
.end method

.method public static $default$getDefaultSessionConfig(Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/SessionConfig;)Landroidx/camera/core/impl/SessionConfig;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "valueIfMissing"    # Landroidx/camera/core/impl/SessionConfig;

    .line 154
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_DEFAULT_SESSION_CONFIG:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/SessionConfig;

    return-object v0
.end method

.method public static $default$getPreviewStabilizationMode(Landroidx/camera/core/impl/UseCaseConfig;)I
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 382
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_PREVIEW_STABILIZATION_MODE:Landroidx/camera/core/impl/Config$Option;

    .line 383
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 382
    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getSessionOptionUnpacker(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 227
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SESSION_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;

    return-object v0
.end method

.method public static $default$getSessionOptionUnpacker(Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "valueIfMissing"    # Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;

    .line 212
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SESSION_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;

    return-object v0
.end method

.method public static $default$getSessionType(Landroidx/camera/core/impl/UseCaseConfig;)I
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 303
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SESSION_TYPE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getSessionType(Landroidx/camera/core/impl/UseCaseConfig;I)I
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "valueIfMissing"    # I

    .line 293
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SESSION_TYPE:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getStreamUseCase(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/StreamUseCase;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 413
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_STREAM_USE_CASE:Landroidx/camera/core/impl/Config$Option;

    sget-object v1, Landroidx/camera/core/impl/StreamUseCase;->DEFAULT:Landroidx/camera/core/impl/StreamUseCase;

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/StreamUseCase;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/StreamUseCase;

    return-object v0
.end method

.method public static $default$getSurfaceOccupancyPriority(Landroidx/camera/core/impl/UseCaseConfig;)I
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 282
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SURFACE_OCCUPANCY_PRIORITY:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getSurfaceOccupancyPriority(Landroidx/camera/core/impl/UseCaseConfig;I)I
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "valueIfMissing"    # I

    .line 271
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SURFACE_OCCUPANCY_PRIORITY:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getTakePictureManagerProvider(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/imagecapture/TakePictureManager$Provider;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 398
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TAKE_PICTURE_MANAGER_PROVIDER:Landroidx/camera/core/impl/Config$Option;

    new-instance v1, Landroidx/camera/core/impl/UseCaseConfig$1;

    invoke-direct {v1, p0}, Landroidx/camera/core/impl/UseCaseConfig$1;-><init>(Landroidx/camera/core/impl/UseCaseConfig;)V

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/TakePictureManager$Provider;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/TakePictureManager$Provider;

    return-object v0
.end method

.method public static $default$getTargetFrameRate(Landroidx/camera/core/impl/UseCaseConfig;)Landroid/util/Range;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 331
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TARGET_FRAME_RATE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public static $default$getTargetFrameRate(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Range;)Landroid/util/Range;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 321
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    .local p1, "valueIfMissing":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TARGET_FRAME_RATE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public static $default$getVideoStabilizationMode(Landroidx/camera/core/impl/UseCaseConfig;)I
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 391
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_VIDEO_STABILIZATION_MODE:Landroidx/camera/core/impl/Config$Option;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$hasTargetFrameRate(Landroidx/camera/core/impl/UseCaseConfig;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 310
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TARGET_FRAME_RATE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    return v0
.end method

.method public static $default$isHighResolutionDisabled(Landroidx/camera/core/impl/UseCaseConfig;Z)Z
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "valueIfMissing"    # Z

    .line 367
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_HIGH_RESOLUTION_DISABLED:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static $default$isStrictFrameRateRequired(Landroidx/camera/core/impl/UseCaseConfig;)Z
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;

    .line 345
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_IS_STRICT_FRAME_RATE_REQUIRED:Landroidx/camera/core/impl/Config$Option;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static $default$isZslDisabled(Landroidx/camera/core/impl/UseCaseConfig;Z)Z
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "valueIfMissing"    # Z

    .line 356
    .local p0, "this":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<TT;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method
