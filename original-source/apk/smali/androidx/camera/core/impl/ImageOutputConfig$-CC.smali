.class public final synthetic Landroidx/camera/core/impl/ImageOutputConfig$-CC;
.super Ljava/lang/Object;
.source "ImageOutputConfig.java"


# direct methods
.method public static $default$getAppTargetRotation(Landroidx/camera/core/impl/ImageOutputConfig;I)I
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .param p1, "valueIfMissing"    # I

    .line 161
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_APP_TARGET_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getCustomOrderedResolutions(Landroidx/camera/core/impl/ImageOutputConfig;)Ljava/util/List;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 332
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_CUSTOM_ORDERED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static $default$getCustomOrderedResolutions(Landroidx/camera/core/impl/ImageOutputConfig;Ljava/util/List;)Ljava/util/List;
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 318
    .local p1, "valueIfMissing":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_CUSTOM_ORDERED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 319
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-eqz v0, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public static $default$getDefaultResolution(Landroidx/camera/core/impl/ImageOutputConfig;)Landroid/util/Size;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 230
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_DEFAULT_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    return-object v0
.end method

.method public static $default$getDefaultResolution(Landroidx/camera/core/impl/ImageOutputConfig;Landroid/util/Size;)Landroid/util/Size;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .param p1, "valueIfMissing"    # Landroid/util/Size;

    .line 220
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_DEFAULT_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    return-object v0
.end method

.method public static $default$getMaxResolution(Landroidx/camera/core/impl/ImageOutputConfig;)Landroid/util/Size;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 253
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_MAX_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    return-object v0
.end method

.method public static $default$getMaxResolution(Landroidx/camera/core/impl/ImageOutputConfig;Landroid/util/Size;)Landroid/util/Size;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .param p1, "valueIfMissing"    # Landroid/util/Size;

    .line 242
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_MAX_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    return-object v0
.end method

.method public static $default$getMirrorMode(Landroidx/camera/core/impl/ImageOutputConfig;I)I
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .param p1, "valueIfMissing"    # I

    .line 199
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_MIRROR_MODE:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getResolutionSelector(Landroidx/camera/core/impl/ImageOutputConfig;)Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 291
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/resolutionselector/ResolutionSelector;

    return-object v0
.end method

.method public static $default$getResolutionSelector(Landroidx/camera/core/impl/ImageOutputConfig;Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .param p1, "valueIfMissing"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 281
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/resolutionselector/ResolutionSelector;

    return-object v0
.end method

.method public static $default$getSupportedResolutions(Landroidx/camera/core/impl/ImageOutputConfig;)Ljava/util/List;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 305
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_SUPPORTED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public static $default$getSupportedResolutions(Landroidx/camera/core/impl/ImageOutputConfig;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 269
    .local p1, "valueIfMissing":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_SUPPORTED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public static $default$getTargetAspectRatio(Landroidx/camera/core/impl/ImageOutputConfig;)I
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 133
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ASPECT_RATIO:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getTargetResolution(Landroidx/camera/core/impl/ImageOutputConfig;)Landroid/util/Size;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 209
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    return-object v0
.end method

.method public static $default$getTargetResolution(Landroidx/camera/core/impl/ImageOutputConfig;Landroid/util/Size;)Landroid/util/Size;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .param p1, "valueIfMissing"    # Landroid/util/Size;

    .line 187
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    return-object v0
.end method

.method public static $default$getTargetRotation(Landroidx/camera/core/impl/ImageOutputConfig;)I
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 176
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$getTargetRotation(Landroidx/camera/core/impl/ImageOutputConfig;I)I
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .param p1, "valueIfMissing"    # I

    .line 149
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static $default$hasTargetAspectRatio(Landroidx/camera/core/impl/ImageOutputConfig;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 122
    sget-object v0, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ASPECT_RATIO:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    return v0
.end method

.method static constructor <clinit>()V
    .locals 1

    sget v0, Landroidx/camera/core/impl/ImageOutputConfig;->INVALID_ROTATION:I

    return-void
.end method

.method public static validateConfig(Landroidx/camera/core/impl/ImageOutputConfig;)V
    .locals 5
    .param p0, "config"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 344
    invoke-interface {p0}, Landroidx/camera/core/impl/ImageOutputConfig;->hasTargetAspectRatio()Z

    move-result v0

    .line 345
    .local v0, "hasTargetAspectRatio":Z
    const/4 v1, 0x0

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetResolution(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 349
    .local v2, "hasTargetResolution":Z
    :goto_0
    if-eqz v0, :cond_2

    if-nez v2, :cond_1

    goto :goto_1

    .line 350
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v3, "Cannot use both setTargetResolution and setTargetAspectRatio on the same config."

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 355
    :cond_2
    :goto_1
    invoke-interface {p0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v1

    .line 357
    .local v1, "resolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    if-eqz v1, :cond_4

    .line 360
    if-nez v0, :cond_3

    if-nez v2, :cond_3

    goto :goto_2

    .line 361
    :cond_3
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Cannot use setTargetResolution or setTargetAspectRatio with setResolutionSelector on the same config."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 366
    :cond_4
    :goto_2
    return-void
.end method
