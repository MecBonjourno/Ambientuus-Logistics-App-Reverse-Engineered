.class public Landroidx/camera/video/RecorderVideoCapabilities;
.super Ljava/lang/Object;
.source "RecorderVideoCapabilities.java"

# interfaces
.implements Landroidx/camera/video/VideoCapabilities;


# static fields
.field private static final TAG:Ljava/lang/String; = "RecorderVideoCapabilities"


# instance fields
.field private final mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/video/CapabilitiesByQuality;",
            ">;"
        }
    .end annotation
.end field

.field private final mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/video/CapabilitiesByQuality;",
            ">;"
        }
    .end annotation
.end field

.field private final mIsStabilizationSupported:Z

.field private final mProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

.field private final mQualitySource:I


# direct methods
.method constructor <init>(ILandroidx/camera/core/impl/CameraInfoInternal;ILandroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)V
    .locals 5
    .param p1, "videoCapabilitiesSource"    # I
    .param p2, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p3, "videoCaptureType"    # I
    .param p4, "videoEncoderInfoFinder"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;

    .line 95
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;

    .line 115
    const/4 v0, 0x1

    if-eqz p1, :cond_1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v0

    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not a supported video capabilities source: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 119
    const/4 v1, 0x2

    if-ne p3, v1, :cond_2

    .line 120
    move v0, v1

    goto :goto_2

    :cond_2
    nop

    :goto_2
    iput v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mQualitySource:I

    .line 121
    iget v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mQualitySource:I

    invoke-static {p1, p2, p4, v0}, Landroidx/camera/video/RecorderVideoCapabilities;->getEncoderProfilesProvider(ILandroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;I)Landroidx/camera/core/impl/EncoderProfilesProvider;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 125
    invoke-interface {p2}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/DynamicRange;

    .line 128
    .local v1, "dynamicRange":Landroidx/camera/core/DynamicRange;
    new-instance v2, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;

    iget-object v3, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-direct {v2, v3, v1}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/DynamicRange;)V

    .line 130
    .local v2, "constrainedProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    new-instance v3, Landroidx/camera/video/CapabilitiesByQuality;

    iget v4, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mQualitySource:I

    invoke-direct {v3, v2, v4}, Landroidx/camera/video/CapabilitiesByQuality;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;I)V

    .line 133
    .local v3, "capabilities":Landroidx/camera/video/CapabilitiesByQuality;
    invoke-virtual {v3}, Landroidx/camera/video/CapabilitiesByQuality;->getSupportedQualities()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 134
    iget-object v4, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .end local v1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local v2    # "constrainedProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    .end local v3    # "capabilities":Landroidx/camera/video/CapabilitiesByQuality;
    :cond_3
    goto :goto_3

    .line 139
    :cond_4
    invoke-interface {p2}, Landroidx/camera/core/impl/CameraInfoInternal;->isVideoStabilizationSupported()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mIsStabilizationSupported:Z

    .line 140
    return-void
.end method

.method private generateCapabilitiesForNonFullySpecifiedDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/CapabilitiesByQuality;
    .locals 3
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 285
    invoke-virtual {p0}, Landroidx/camera/video/RecorderVideoCapabilities;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v0

    invoke-static {p1, v0}, Landroidx/camera/core/impl/DynamicRanges;->canResolve(Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 286
    const/4 v0, 0x0

    return-object v0

    .line 291
    :cond_0
    new-instance v0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;

    iget-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-direct {v0, v1, p1}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/DynamicRange;)V

    .line 293
    .local v0, "constrainedProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    new-instance v1, Landroidx/camera/video/CapabilitiesByQuality;

    iget v2, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mQualitySource:I

    invoke-direct {v1, v0, v2}, Landroidx/camera/video/CapabilitiesByQuality;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;I)V

    return-object v1
.end method

.method private getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/CapabilitiesByQuality;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 254
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/CapabilitiesByQuality;

    return-object v0

    .line 259
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 260
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/CapabilitiesByQuality;

    return-object v0

    .line 262
    :cond_1
    nop

    .line 263
    invoke-direct {p0, p1}, Landroidx/camera/video/RecorderVideoCapabilities;->generateCapabilitiesForNonFullySpecifiedDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/CapabilitiesByQuality;

    move-result-object v0

    .line 264
    .local v0, "capabilities":Landroidx/camera/video/CapabilitiesByQuality;
    iget-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    return-object v0
.end method

.method private static getEncoderProfilesProvider(ILandroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;I)Landroidx/camera/core/impl/EncoderProfilesProvider;
    .locals 10
    .param p0, "videoCapabilitiesSource"    # I
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p2, "videoEncoderInfoFinder"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    .param p3, "qualitySource"    # I

    .line 195
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getEncoderProfilesProvider()Landroidx/camera/core/impl/EncoderProfilesProvider;

    move-result-object v0

    .line 197
    .local v0, "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    const/4 v1, 0x2

    if-ne p3, v1, :cond_1

    .line 199
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->isHighSpeedSupported()Z

    move-result v1

    if-nez v1, :cond_0

    .line 200
    sget-object v1, Landroidx/camera/core/impl/EncoderProfilesProvider;->EMPTY:Landroidx/camera/core/impl/EncoderProfilesProvider;

    return-object v1

    .line 205
    :cond_0
    return-object v0

    .line 208
    :cond_1
    invoke-static {v0, p3}, Landroidx/camera/video/CapabilitiesByQuality;->containsSupportedQuality(Landroidx/camera/core/impl/EncoderProfilesProvider;I)Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_2

    .line 209
    const-string v2, "RecorderVideoCapabilities"

    const-string v4, "Camera EncoderProfilesProvider doesn\'t contain any supported Quality."

    invoke-static {v2, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    const/4 v2, 0x3

    new-array v2, v2, [Landroidx/camera/video/Quality;

    const/4 v4, 0x0

    sget-object v5, Landroidx/camera/video/Quality;->FHD:Landroidx/camera/video/Quality;

    aput-object v5, v2, v4

    sget-object v4, Landroidx/camera/video/Quality;->HD:Landroidx/camera/video/Quality;

    aput-object v4, v2, v3

    sget-object v4, Landroidx/camera/video/Quality;->SD:Landroidx/camera/video/Quality;

    aput-object v4, v2, v1

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 218
    .local v1, "targetQualities":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/Quality;>;"
    new-instance v2, Landroidx/camera/video/internal/workaround/DefaultEncoderProfilesProvider;

    invoke-direct {v2, p1, v1, p2}, Landroidx/camera/video/internal/workaround/DefaultEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/List;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)V

    move-object v0, v2

    .line 222
    .end local v1    # "targetQualities":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/Quality;>;"
    :cond_2
    invoke-static {}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->getAll()Landroidx/camera/core/impl/Quirks;

    move-result-object v1

    .line 224
    .local v1, "deviceQuirks":Landroidx/camera/core/impl/Quirks;
    new-instance v2, Landroidx/camera/video/internal/workaround/QualityAddedEncoderProfilesProvider;

    invoke-direct {v2, v0, v1, p1, p2}, Landroidx/camera/video/internal/workaround/QualityAddedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)V

    move-object v5, v2

    .line 227
    .end local v0    # "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    .local v5, "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    if-ne p0, v3, :cond_3

    .line 228
    new-instance v4, Landroidx/camera/video/internal/QualityExploredEncoderProfilesProvider;

    .line 230
    invoke-static {}, Landroidx/camera/video/Quality;->getSortedQualities()Ljava/util/List;

    move-result-object v6

    sget-object v0, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    .line 231
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    .line 232
    const/16 v0, 0x22

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedResolutions(I)Ljava/util/List;

    move-result-object v8

    move-object v9, p2

    .end local p2    # "videoEncoderInfoFinder":Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    .local v9, "videoEncoderInfoFinder":Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    invoke-direct/range {v4 .. v9}, Landroidx/camera/video/internal/QualityExploredEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)V

    move-object v5, v4

    goto :goto_0

    .line 227
    .end local v9    # "videoEncoderInfoFinder":Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    .restart local p2    # "videoEncoderInfoFinder":Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    :cond_3
    move-object v9, p2

    .line 237
    .end local p2    # "videoEncoderInfoFinder":Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    .restart local v9    # "videoEncoderInfoFinder":Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;
    :goto_0
    new-instance p2, Landroidx/camera/video/internal/workaround/QualityResolutionModifiedEncoderProfilesProvider;

    invoke-direct {p2, v5, v1}, Landroidx/camera/video/internal/workaround/QualityResolutionModifiedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/impl/Quirks;)V

    .line 241
    .end local v5    # "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    .local p2, "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    invoke-static {p1}, Landroidx/camera/video/RecorderVideoCapabilities;->isHlg10SupportedByCamera(Landroidx/camera/core/impl/CameraInfoInternal;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 242
    new-instance v0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;

    invoke-direct {v0, p2, v9}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)V

    move-object p2, v0

    .line 247
    :cond_4
    new-instance v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;

    invoke-direct {v0, p2, p1, v1}, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/Quirks;)V

    .line 250
    .end local p2    # "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    .restart local v0    # "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    return-object v0
.end method

.method private static isHlg10SupportedByCamera(Landroidx/camera/core/impl/CameraInfoInternal;)Z
    .locals 6
    .param p0, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;

    .line 271
    invoke-interface {p0}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v0

    .line 272
    .local v0, "dynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/DynamicRange;

    .line 273
    .local v2, "dynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-virtual {v2}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 274
    .local v3, "encoding":Ljava/lang/Integer;
    invoke-virtual {v2}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v4

    .line 275
    .local v4, "bitDepth":I
    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/16 v5, 0xa

    if-ne v4, v5, :cond_0

    .line 276
    const/4 v1, 0x1

    return v1

    .line 278
    .end local v2    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local v3    # "encoding":Ljava/lang/Integer;
    .end local v4    # "bitDepth":I
    :cond_0
    goto :goto_0

    .line 280
    :cond_1
    const/4 v1, 0x0

    return v1
.end method


# virtual methods
.method public findNearestHigherSupportedEncoderProfilesFor(Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 2
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 176
    invoke-direct {p0, p2}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/CapabilitiesByQuality;

    move-result-object v0

    .line 177
    .local v0, "capabilities":Landroidx/camera/video/CapabilitiesByQuality;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 178
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/camera/video/CapabilitiesByQuality;->findNearestHigherSupportedEncoderProfilesFor(Landroid/util/Size;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v1

    .line 177
    :goto_0
    return-object v1
.end method

.method public findNearestHigherSupportedQualityFor(Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/Quality;
    .locals 2
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 184
    invoke-direct {p0, p2}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/CapabilitiesByQuality;

    move-result-object v0

    .line 185
    .local v0, "capabilities":Landroidx/camera/video/CapabilitiesByQuality;
    if-nez v0, :cond_0

    sget-object v1, Landroidx/camera/video/Quality;->NONE:Landroidx/camera/video/Quality;

    goto :goto_0

    .line 186
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/camera/video/CapabilitiesByQuality;->findNearestHigherSupportedQualityFor(Landroid/util/Size;)Landroidx/camera/video/Quality;

    move-result-object v1

    .line 185
    :goto_0
    return-object v1
.end method

.method public getProfiles(Landroidx/camera/video/Quality;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 2
    .param p1, "quality"    # Landroidx/camera/video/Quality;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 168
    invoke-direct {p0, p2}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/CapabilitiesByQuality;

    move-result-object v0

    .line 169
    .local v0, "capabilities":Landroidx/camera/video/CapabilitiesByQuality;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Landroidx/camera/video/CapabilitiesByQuality;->getProfiles(Landroidx/camera/video/Quality;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getSupportedDynamicRanges()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 144
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedQualities(Landroidx/camera/core/DynamicRange;)Ljava/util/List;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            ")",
            "Ljava/util/List<",
            "Landroidx/camera/video/Quality;",
            ">;"
        }
    .end annotation

    .line 149
    invoke-direct {p0, p1}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/CapabilitiesByQuality;

    move-result-object v0

    .line 150
    .local v0, "capabilities":Landroidx/camera/video/CapabilitiesByQuality;
    if-nez v0, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroidx/camera/video/CapabilitiesByQuality;->getSupportedQualities()Ljava/util/List;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public isQualitySupported(Landroidx/camera/video/Quality;Landroidx/camera/core/DynamicRange;)Z
    .locals 2
    .param p1, "quality"    # Landroidx/camera/video/Quality;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 156
    invoke-direct {p0, p2}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/CapabilitiesByQuality;

    move-result-object v0

    .line 157
    .local v0, "capabilities":Landroidx/camera/video/CapabilitiesByQuality;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroidx/camera/video/CapabilitiesByQuality;->isQualitySupported(Landroidx/camera/video/Quality;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isStabilizationSupported()Z
    .locals 1

    .line 162
    iget-boolean v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mIsStabilizationSupported:Z

    return v0
.end method
