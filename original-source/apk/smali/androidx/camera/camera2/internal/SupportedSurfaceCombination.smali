.class public final Landroidx/camera/camera2/internal/SupportedSurfaceCombination;
.super Ljava/lang/Object;
.source "SupportedSurfaceCombination.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;,
        Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;,
        Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;,
        Landroidx/camera/camera2/internal/SupportedSurfaceCombination$Api23Impl;
    }
.end annotation


# static fields
.field private static final FRAME_RATE_UNLIMITED:I = 0x7fffffff

.field private static final TAG:Ljava/lang/String; = "SupportedSurfaceCombination"


# instance fields
.field private final mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

.field private final mCameraId:Ljava/lang/String;

.field private final mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

.field private final mConcurrentSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

.field private final mDynamicRangeResolver:Landroidx/camera/camera2/internal/DynamicRangeResolver;

.field private final mExtraSupportedSurfaceCombinationsContainer:Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;

.field private final mFcqSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mFeatureCombinationQuery:Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;

.field private final mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mHardwareLevel:I

.field private final mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

.field private final mHighSpeedSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private mIsBurstCaptureSupported:Z

.field private final mIsConcurrentCameraModeSupported:Z

.field private mIsManualSensorSupported:Z

.field private final mIsPreviewStabilizationSupported:Z

.field private mIsRawSupported:Z

.field private final mIsStreamUseCaseSupported:Z

.field private mIsUltraHighResolutionSensorSupported:Z

.field private final mPreviewStabilizationSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

.field private final mSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mSurfaceCombinations10Bit:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mSurfaceCombinationsStreamUseCase:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mSurfaceCombinationsUltraHdr:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

.field mSurfaceSizeDefinitionFormats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mTargetAspectRatio:Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

.field private final mUltraHighSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Landroidx/camera/camera2/internal/CamcorderProfileHelper;Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraId"    # Ljava/lang/String;
    .param p3, "cameraManagerCompat"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .param p4, "camcorderProfileHelper"    # Landroidx/camera/camera2/internal/CamcorderProfileHelper;
    .param p5, "featureCombinationQuery"    # Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mUltraHighSurfaceCombinations:Ljava/util/List;

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mConcurrentSurfaceCombinations:Ljava/util/List;

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mPreviewStabilizationSurfaceCombinations:Ljava/util/List;

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedSurfaceCombinations:Ljava/util/List;

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFcqSurfaceCombinations:Ljava/util/List;

    .line 132
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations10Bit:Ljava/util/List;

    .line 135
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsUltraHdr:Ljava/util/List;

    .line 136
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsStreamUseCase:Ljava/util/List;

    .line 143
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsRawSupported:Z

    .line 144
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsBurstCaptureSupported:Z

    .line 147
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsUltraHighResolutionSensorSupported:Z

    .line 148
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsManualSensorSupported:Z

    .line 152
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinitionFormats:Ljava/util/List;

    .line 155
    new-instance v1, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mTargetAspectRatio:Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

    .line 156
    new-instance v1, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    .line 171
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    .line 172
    invoke-static {p4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    .line 173
    new-instance v1, Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mExtraSupportedSurfaceCombinationsContainer:Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;

    .line 175
    invoke-static {p1}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getInstance(Landroid/content/Context;)Landroidx/camera/camera2/internal/DisplayInfoManager;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 178
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-virtual {p3, v1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 179
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 181
    .local v1, "keyValue":Ljava/lang/Integer;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_0

    .line 182
    :cond_0
    const/4 v2, 0x2

    :goto_0
    iput v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHardwareLevel:I
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    .end local v1    # "keyValue":Ljava/lang/Integer;
    nop

    .line 187
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 188
    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 190
    .local v1, "availableCapabilities":[I
    if-eqz v1, :cond_5

    .line 191
    array-length v2, v1

    :goto_1
    if-ge v0, v2, :cond_5

    aget v3, v1, v0

    .line 192
    .local v3, "capability":I
    const/4 v4, 0x3

    const/4 v5, 0x1

    if-ne v3, v4, :cond_1

    .line 193
    iput-boolean v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsRawSupported:Z

    goto :goto_2

    .line 194
    :cond_1
    const/4 v4, 0x6

    if-ne v3, v4, :cond_2

    .line 196
    iput-boolean v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsBurstCaptureSupported:Z

    goto :goto_2

    .line 197
    :cond_2
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1f

    if-lt v4, v6, :cond_3

    const/16 v4, 0x10

    if-ne v3, v4, :cond_3

    .line 200
    iput-boolean v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsUltraHighResolutionSensorSupported:Z

    goto :goto_2

    .line 201
    :cond_3
    if-ne v3, v5, :cond_4

    .line 203
    iput-boolean v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsManualSensorSupported:Z

    .line 191
    .end local v3    # "capability":I
    :cond_4
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 208
    :cond_5
    new-instance v0, Landroidx/camera/camera2/internal/DynamicRangeResolver;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-direct {v0, v2}, Landroidx/camera/camera2/internal/DynamicRangeResolver;-><init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDynamicRangeResolver:Landroidx/camera/camera2/internal/DynamicRangeResolver;

    .line 209
    new-instance v0, Landroidx/camera/camera2/internal/HighSpeedResolver;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-direct {v0, v2}, Landroidx/camera/camera2/internal/HighSpeedResolver;-><init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    .line 210
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateSupportedCombinationList()V

    .line 212
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsUltraHighResolutionSensorSupported:Z

    if-eqz v0, :cond_6

    .line 213
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateUltraHighSupportedCombinationList()V

    .line 216
    :cond_6
    nop

    .line 217
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v2, "android.hardware.camera.concurrent"

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsConcurrentCameraModeSupported:Z

    .line 218
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsConcurrentCameraModeSupported:Z

    if-eqz v0, :cond_7

    .line 219
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateConcurrentSupportedCombinationList()V

    .line 222
    :cond_7
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDynamicRangeResolver:Landroidx/camera/camera2/internal/DynamicRangeResolver;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->is10BitDynamicRangeSupported()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 223
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generate10BitSupportedCombinationList()V

    .line 226
    :cond_8
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isStreamUseCaseSupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsStreamUseCaseSupported:Z

    .line 227
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsStreamUseCaseSupported:Z

    if-eqz v0, :cond_9

    .line 228
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateStreamUseCaseSupportedCombinationList()V

    .line 231
    :cond_9
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0}, Landroidx/camera/camera2/internal/VideoStabilizationUtil;->isPreviewStabilizationSupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsPreviewStabilizationSupported:Z

    .line 233
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsPreviewStabilizationSupported:Z

    if-eqz v0, :cond_a

    .line 234
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generatePreviewStabilizationSupportedCombinationList()V

    .line 237
    :cond_a
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateSurfaceSizeDefinition()V

    .line 238
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->checkCustomization()V

    .line 240
    iput-object p5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureCombinationQuery:Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;

    .line 241
    return-void

    .line 183
    .end local v1    # "availableCapabilities":[I
    :catch_0
    move-exception v0

    .line 184
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    invoke-static {v0}, Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;->createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;

    move-result-object v1

    throw v1
.end method

.method private checkCustomization()V
    .locals 0

    .line 1959
    return-void
.end method

.method private static compareIntersectingRanges(Landroid/util/Range;Landroid/util/Range;Landroid/util/Range;)Landroid/util/Range;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 504
    .local p0, "targetFps":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p1, "storedRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p2, "newRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {p1, p0}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v0

    int-to-double v0, v0

    .line 505
    .local v0, "storedIntersectionSize":D
    invoke-virtual {p2, p0}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v2

    invoke-static {v2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v2

    int-to-double v2, v2

    .line 507
    .local v2, "newIntersectionSize":D
    invoke-static {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v4

    int-to-double v4, v4

    div-double v4, v2, v4

    .line 508
    .local v4, "newRangeRatio":D
    invoke-static {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v6

    int-to-double v6, v6

    div-double v6, v0, v6

    .line 510
    .local v6, "storedRangeRatio":D
    cmpl-double v8, v2, v0

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    if-lez v8, :cond_1

    .line 513
    cmpl-double v8, v4, v9

    if-gez v8, :cond_0

    cmpl-double v8, v4, v6

    if-ltz v8, :cond_4

    .line 514
    :cond_0
    return-object p2

    .line 516
    :cond_1
    cmpl-double v8, v2, v0

    if-nez v8, :cond_3

    .line 519
    cmpl-double v8, v4, v6

    if-lez v8, :cond_2

    .line 520
    return-object p2

    .line 521
    :cond_2
    cmpl-double v8, v4, v6

    if-nez v8, :cond_4

    .line 522
    invoke-virtual {p2}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-le v8, v9, :cond_4

    .line 524
    return-object p2

    .line 527
    :cond_3
    cmpg-double v8, v6, v9

    if-gez v8, :cond_4

    cmpl-double v8, v4, v6

    if-lez v8, :cond_4

    .line 531
    return-object p2

    .line 533
    :cond_4
    return-object p1
.end method

.method private createFeatureComboSessionConfig(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;)Landroidx/camera/core/impl/SessionConfig;
    .locals 10
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/core/impl/SessionConfig;"
        }
    .end annotation

    .line 294
    .local p2, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local p3, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .local p4, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p5, "useCasePriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v0

    .line 296
    .local v0, "fpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    new-instance v1, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;

    invoke-direct {v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;-><init>()V

    .line 298
    .local v1, "validatingBuilder":Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 299
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/SurfaceConfig;

    .line 300
    .local v3, "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    nop

    .line 301
    invoke-virtual {v3}, Landroidx/camera/core/impl/SurfaceConfig;->getImageFormat()I

    move-result v4

    invoke-virtual {p0, v4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v4

    .line 300
    invoke-virtual {v3, v4}, Landroidx/camera/core/impl/SurfaceConfig;->getResolution(Landroidx/camera/core/impl/SurfaceSizeDefinition;)Landroid/util/Size;

    move-result-object v4

    .line 305
    .local v4, "resolution":Landroid/util/Size;
    invoke-interface {p5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/UseCaseConfig;

    .line 307
    .local v5, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    nop

    .line 309
    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/DynamicRange;

    invoke-static {v6}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/DynamicRange;

    .line 308
    invoke-static {v5, v4, v6}, Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery$-CC;->createSessionConfigBuilder(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v6

    .line 311
    .local v6, "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    nop

    .line 312
    sget-object v7, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v7, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 313
    sget-object v7, Landroidx/camera/core/featuregroup/impl/feature/FpsRangeFeature;->DEFAULT_FPS_RANGE:Landroid/util/Range;

    goto :goto_1

    :cond_0
    move-object v7, v0

    .line 311
    :goto_1
    invoke-virtual {v6, v7}, Landroidx/camera/core/impl/SessionConfig$Builder;->setExpectedFrameRateRange(Landroid/util/Range;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 315
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isPreviewStabilizationOn()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 316
    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Landroidx/camera/core/impl/SessionConfig$Builder;->setPreviewStabilization(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 319
    :cond_1
    invoke-virtual {v6}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->add(Landroidx/camera/core/impl/SessionConfig;)V

    .line 321
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->isValid()Z

    move-result v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cannot create a combined SessionConfig for feature combo after adding "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " with "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " due to ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 324
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->getInvalidReason()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]; surfaceConfigList = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", featureSettings = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", newUseCaseConfigs = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 321
    invoke-static {v7, v8}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 298
    .end local v3    # "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    .end local v4    # "resolution":Landroid/util/Size;
    .end local v5    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v6    # "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 329
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v2

    return-object v2
.end method

.method private createFeatureSettings(IZLjava/util/Map;ZZZZZLandroid/util/Range;Z)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .locals 11
    .param p1, "cameraMode"    # I
    .param p2, "hasVideoCapture"    # Z
    .param p4, "isPreviewStabilizationOn"    # Z
    .param p5, "isUltraHdrOn"    # Z
    .param p6, "isHighSpeedOn"    # Z
    .param p7, "isFeatureComboInvocation"    # Z
    .param p8, "requiresFeatureComboQuery"    # Z
    .param p10, "isStrictFrameRateRequired"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;ZZZZZ",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;Z)",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;"
        }
    .end annotation

    .line 1346
    .local p3, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    .local p9, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static {p3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRequiredMaxBitDepth(Ljava/util/Map;)I

    move-result v2

    .line 1348
    .local v2, "requiredMaxBitDepth":I
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v3, 0x2

    if-eqz p1, :cond_1

    if-nez p5, :cond_0

    goto :goto_0

    .line 1349
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    iget-object v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    .line 1352
    invoke-static {p1}, Landroidx/camera/core/impl/CameraMode;->toLabelString(I)Ljava/lang/String;

    move-result-object v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v5, v3, v1

    aput-object v6, v3, v0

    .line 1349
    const-string v0, "Camera device id is %s. Ultra HDR is not currently supported in %s camera mode."

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1355
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    const/16 v4, 0xa

    if-eq v2, v4, :cond_2

    goto :goto_1

    .line 1357
    :cond_2
    new-instance v4, Ljava/lang/IllegalArgumentException;

    iget-object v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    .line 1360
    invoke-static {p1}, Landroidx/camera/core/impl/CameraMode;->toLabelString(I)Ljava/lang/String;

    move-result-object v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v5, v3, v1

    aput-object v6, v3, v0

    .line 1357
    const-string v0, "Camera device id is %s. 10 bit dynamic range is not currently supported in %s camera mode."

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1363
    :cond_3
    :goto_1
    if-eqz p1, :cond_5

    if-nez p7, :cond_4

    goto :goto_2

    .line 1364
    :cond_4
    new-instance v4, Ljava/lang/IllegalArgumentException;

    iget-object v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    .line 1367
    invoke-static {p1}, Landroidx/camera/core/impl/CameraMode;->toLabelString(I)Ljava/lang/String;

    move-result-object v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v5, v3, v1

    aput-object v6, v3, v0

    .line 1364
    const-string v0, "Camera device id is %s. Feature combination query is not currently supported in %s camera mode."

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1370
    :cond_5
    :goto_2
    if-eqz p6, :cond_7

    if-nez p7, :cond_6

    goto :goto_3

    .line 1371
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "High-speed session is not supported with feature combination"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1375
    :cond_7
    :goto_3
    if-eqz p6, :cond_9

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/HighSpeedResolver;->isHighSpeedSupported()Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_4

    .line 1376
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "High-speed session is not supported on this device."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1381
    :cond_9
    :goto_4
    if-eqz p7, :cond_a

    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    move-object/from16 v1, p9

    if-ne v1, v0, :cond_b

    .line 1382
    if-eqz p8, :cond_b

    .line 1383
    sget-object v0, Landroidx/camera/core/featuregroup/impl/feature/FpsRangeFeature;->DEFAULT_FPS_RANGE:Landroid/util/Range;

    move-object v8, v0

    .end local p9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v0, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    goto :goto_5

    .line 1381
    .end local v0    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .restart local p9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_a
    move-object/from16 v1, p9

    .line 1387
    :cond_b
    move-object v8, v1

    .end local p9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v8, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :goto_5
    move v0, p1

    move v1, p2

    move v3, p4

    move/from16 v4, p5

    move/from16 v5, p6

    move/from16 v6, p7

    move/from16 v7, p8

    move/from16 v9, p10

    invoke-static/range {v0 .. v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->of(IZIZZZZZLandroid/util/Range;Z)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    move-result-object v10

    return-object v10
.end method

.method private findBestSizesAndFps(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/Map;IZ)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .locals 29
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .param p8, "maxSupportedFps"    # I
    .param p9, "findMaxFpsForAllSizes"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;IZ)",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;"
        }
    .end annotation

    .line 1160
    .local p2, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p4, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p5, "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .local p6, "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local p7, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v0

    .line 1162
    .local v0, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .line 1163
    .local v1, "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const v2, 0x7fffffff

    .line 1164
    .local v2, "savedConfigMaxFps":I
    const/4 v3, 0x0

    .line 1165
    .local v3, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const v4, 0x7fffffff

    .line 1166
    .local v4, "savedConfigMaxFpsForStreamUseCase":I
    const v5, 0x7fffffff

    .line 1168
    .local v5, "maxFpsForAllSizes":I
    const/4 v6, 0x0

    .line 1169
    .local v6, "supportedSizesFound":Z
    const/4 v7, 0x0

    .line 1172
    .local v7, "supportedSizesForStreamUseCaseFound":Z
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_10

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v14, v9

    check-cast v14, Ljava/util/List;

    .line 1173
    .local v14, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    .line 1175
    .local v18, "surfaceConfigIndexToAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    new-instance v19, Ljava/util/HashMap;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashMap;-><init>()V

    .line 1179
    .local v19, "surfaceConfigIndexToUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    nop

    .line 1180
    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object/from16 v15, p3

    move-object/from16 v16, p4

    move/from16 v17, p8

    invoke-direct/range {v11 .. v19}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getSurfaceConfigListAndFpsCeiling(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILjava/util/Map;Ljava/util/Map;)Landroid/util/Pair;

    move-result-object v9

    .line 1185
    move-object/from16 v11, v18

    move-object/from16 v12, v19

    .end local v18    # "surfaceConfigIndexToAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v19    # "surfaceConfigIndexToUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v9, "resultPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;Ljava/lang/Integer;>;"
    .local v11, "surfaceConfigIndexToAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v12, "surfaceConfigIndexToUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    iget-object v13, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v13, Ljava/util/List;

    .line 1186
    .local v13, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    iget-object v15, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v15, Ljava/lang/Integer;

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 1187
    .local v15, "currentConfigFrameRateCeiling":I
    move/from16 v10, p8

    invoke-static {v10, v0, v15}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->isConfigFrameRateAcceptable(ILandroid/util/Range;I)Z

    move-result v17

    .line 1190
    .local v17, "isConfigFrameRateAcceptable":Z
    new-instance v24, Ljava/util/HashMap;

    invoke-direct/range {v24 .. v24}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v18, v24

    .line 1191
    .local v18, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    const/16 v19, 0x0

    move-object/from16 v27, v1

    move/from16 v1, v19

    .local v1, "index":I
    .local v27, "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_1
    move-object/from16 v19, v3

    .end local v3    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v19, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 1192
    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/SurfaceConfig;

    .line 1193
    .local v3, "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    sget-object v20, Landroidx/camera/core/DynamicRange;->UNSPECIFIED:Landroidx/camera/core/DynamicRange;

    .line 1195
    .local v20, "dynamicRange":Landroidx/camera/core/DynamicRange;
    move/from16 v21, v1

    .end local v1    # "index":I
    .local v21, "index":I
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v11, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1196
    nop

    .line 1198
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1197
    invoke-interface {v11, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 1196
    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 1198
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v20

    move/from16 v28, v6

    move-object/from16 v1, v20

    move-object/from16 v6, p7

    goto :goto_2

    .line 1199
    :cond_0
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v12, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1200
    nop

    .line 1201
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v12, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1200
    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move/from16 v28, v6

    move-object/from16 v6, p7

    .end local v6    # "supportedSizesFound":Z
    .local v28, "supportedSizesFound":Z
    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Landroidx/camera/core/DynamicRange;

    move-object/from16 v1, v20

    goto :goto_2

    .line 1199
    .end local v28    # "supportedSizesFound":Z
    .restart local v6    # "supportedSizesFound":Z
    :cond_1
    move/from16 v28, v6

    move-object/from16 v6, p7

    .end local v6    # "supportedSizesFound":Z
    .restart local v28    # "supportedSizesFound":Z
    move-object/from16 v1, v20

    .line 1204
    .end local v20    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .local v1, "dynamicRange":Landroidx/camera/core/DynamicRange;
    :goto_2
    move-object/from16 v6, v18

    .end local v18    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .local v6, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1191
    .end local v1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local v3    # "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    add-int/lit8 v1, v21, 0x1

    move-object/from16 v3, v19

    move/from16 v6, v28

    .end local v21    # "index":I
    .local v1, "index":I
    goto :goto_1

    .end local v28    # "supportedSizesFound":Z
    .local v6, "supportedSizesFound":Z
    .restart local v18    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    :cond_2
    move/from16 v21, v1

    move/from16 v28, v6

    move-object/from16 v6, v18

    .line 1207
    .end local v1    # "index":I
    .end local v18    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .local v6, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .restart local v28    # "supportedSizesFound":Z
    new-instance v1, Lkotlin/UnsafeLazyImpl;

    new-instance v20, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$$ExternalSyntheticLambda1;

    move-object/from16 v21, p0

    move-object/from16 v22, p1

    move-object/from16 v25, p3

    move-object/from16 v26, p4

    move-object/from16 v24, v6

    move-object/from16 v23, v13

    .end local v6    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .end local v13    # "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local v23, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local v24, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    invoke-direct/range {v20 .. v26}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/SupportedSurfaceCombination;Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;)V

    move-object/from16 v13, v20

    move-object/from16 v3, v23

    .end local v23    # "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .end local v24    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .local v3, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .restart local v6    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    invoke-direct {v1, v13}, Lkotlin/UnsafeLazyImpl;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 1212
    .local v1, "isSupported":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    if-eqz p9, :cond_4

    invoke-interface {v1}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 1213
    const v13, 0x7fffffff

    if-ne v5, v13, :cond_3

    .line 1214
    move v5, v15

    goto :goto_3

    .line 1215
    :cond_3
    if-ge v5, v15, :cond_4

    .line 1216
    move v5, v15

    .line 1224
    :cond_4
    :goto_3
    if-nez v28, :cond_8

    invoke-interface {v1}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-eqz v13, :cond_8

    .line 1227
    const v13, 0x7fffffff

    if-ne v2, v13, :cond_5

    .line 1228
    move v2, v15

    .line 1229
    move-object v13, v14

    .end local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v13, "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_4

    .line 1230
    .end local v13    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_5
    if-ge v2, v15, :cond_6

    .line 1232
    move v2, v15

    .line 1233
    move-object v13, v14

    .end local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v13    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_4

    .line 1230
    .end local v13    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_6
    move-object/from16 v13, v27

    .line 1236
    .end local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v13    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_4
    if-eqz v17, :cond_9

    .line 1237
    move v2, v15

    .line 1238
    move-object v13, v14

    .line 1239
    const/16 v18, 0x1

    .line 1242
    .end local v28    # "supportedSizesFound":Z
    .local v18, "supportedSizesFound":Z
    if-eqz v7, :cond_7

    if-nez p9, :cond_7

    .line 1243
    move v3, v2

    move v6, v5

    move-object v1, v13

    move/from16 v28, v18

    move-object/from16 v2, p1

    move v5, v4

    move-object/from16 v4, v19

    goto/16 :goto_8

    .line 1252
    :cond_7
    move/from16 v28, v18

    goto :goto_5

    .end local v13    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v18    # "supportedSizesFound":Z
    .restart local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v28    # "supportedSizesFound":Z
    :cond_8
    move-object/from16 v13, v27

    .end local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v13    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_9
    :goto_5
    if-eqz p6, :cond_e

    if-nez v7, :cond_e

    .line 1254
    move-object/from16 v18, v1

    move/from16 v20, v2

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .end local v1    # "isSupported":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    .end local v2    # "savedConfigMaxFps":I
    .local v18, "isSupported":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    .local v20, "savedConfigMaxFps":I
    invoke-virtual {v1, v2, v3, v11, v12}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getOrderedSupportedStreamUseCaseSurfaceConfigList(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Ljava/util/List;

    move-result-object v21

    if-eqz v21, :cond_f

    .line 1257
    const v1, 0x7fffffff

    if-ne v4, v1, :cond_a

    .line 1258
    move v4, v15

    .line 1259
    move-object v1, v14

    .end local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v1, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_6

    .line 1260
    .end local v1    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_a
    if-ge v4, v15, :cond_b

    .line 1261
    move v4, v15

    .line 1262
    move-object v1, v14

    .end local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v1    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_6

    .line 1260
    .end local v1    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_b
    move-object/from16 v1, v19

    .line 1265
    .end local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v1    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_6
    if-eqz v17, :cond_d

    .line 1266
    move v4, v15

    .line 1267
    move-object v1, v14

    .line 1268
    const/4 v7, 0x1

    .line 1270
    if-eqz v28, :cond_c

    if-nez p9, :cond_c

    .line 1271
    move v6, v5

    move/from16 v3, v20

    move v5, v4

    move-object v4, v1

    move-object v1, v13

    goto :goto_8

    .line 1275
    .end local v3    # "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .end local v6    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .end local v9    # "resultPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;Ljava/lang/Integer;>;"
    .end local v11    # "surfaceConfigIndexToAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v12    # "surfaceConfigIndexToUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .end local v14    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v15    # "currentConfigFrameRateCeiling":I
    .end local v17    # "isConfigFrameRateAcceptable":Z
    .end local v18    # "isSupported":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    :cond_c
    move-object v3, v1

    goto :goto_7

    .line 1265
    .restart local v3    # "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .restart local v6    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .restart local v9    # "resultPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;Ljava/lang/Integer;>;"
    .restart local v11    # "surfaceConfigIndexToAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v12    # "surfaceConfigIndexToUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v14    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v15    # "currentConfigFrameRateCeiling":I
    .restart local v17    # "isConfigFrameRateAcceptable":Z
    .restart local v18    # "isSupported":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    :cond_d
    move-object v3, v1

    goto :goto_7

    .line 1252
    .end local v18    # "isSupported":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    .end local v20    # "savedConfigMaxFps":I
    .local v1, "isSupported":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    .restart local v2    # "savedConfigMaxFps":I
    .restart local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_e
    move-object/from16 v18, v1

    move/from16 v20, v2

    move-object/from16 v2, p1

    .line 1275
    .end local v1    # "isSupported":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    .end local v2    # "savedConfigMaxFps":I
    .end local v3    # "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .end local v6    # "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .end local v9    # "resultPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;Ljava/lang/Integer;>;"
    .end local v11    # "surfaceConfigIndexToAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v12    # "surfaceConfigIndexToUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .end local v14    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v15    # "currentConfigFrameRateCeiling":I
    .end local v17    # "isConfigFrameRateAcceptable":Z
    .restart local v20    # "savedConfigMaxFps":I
    :cond_f
    move-object/from16 v3, v19

    .end local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v3, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_7
    move-object v1, v13

    move/from16 v2, v20

    move/from16 v6, v28

    goto/16 :goto_0

    .line 1172
    .end local v13    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v20    # "savedConfigMaxFps":I
    .end local v28    # "supportedSizesFound":Z
    .local v1, "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v2    # "savedConfigMaxFps":I
    .local v6, "supportedSizesFound":Z
    :cond_10
    move/from16 v10, p8

    move-object/from16 v27, v1

    move/from16 v20, v2

    move-object/from16 v19, v3

    move/from16 v28, v6

    move-object/from16 v2, p1

    .end local v1    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v2    # "savedConfigMaxFps":I
    .end local v3    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v6    # "supportedSizesFound":Z
    .restart local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v20    # "savedConfigMaxFps":I
    .restart local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v28    # "supportedSizesFound":Z
    move v6, v5

    move/from16 v3, v20

    move v5, v4

    move-object/from16 v4, v19

    .line 1279
    .end local v19    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v20    # "savedConfigMaxFps":I
    .end local v27    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v1    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v3, "savedConfigMaxFps":I
    .local v4, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v5, "savedConfigMaxFpsForStreamUseCase":I
    .local v6, "maxFpsForAllSizes":I
    :goto_8
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isFeatureComboInvocation()Z

    move-result v8

    if-eqz v8, :cond_12

    sget-object v8, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    .line 1280
    invoke-virtual {v8, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_12

    const v13, 0x7fffffff

    if-eq v3, v13, :cond_11

    .line 1282
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ge v3, v8, :cond_12

    .line 1283
    :cond_11
    const/4 v8, 0x0

    const v13, 0x7fffffff

    invoke-static {v8, v8, v13, v13, v13}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->of(Ljava/util/List;Ljava/util/List;III)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;

    move-result-object v8

    return-object v8

    .line 1287
    :cond_12
    invoke-static {v1, v4, v3, v5, v6}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->of(Ljava/util/List;Ljava/util/List;III)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;

    move-result-object v8

    return-object v8
.end method

.method private generate10BitSupportedCombinationList()V
    .locals 2

    .line 1915
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations10Bit:Ljava/util/List;

    .line 1916
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->get10BitSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1915
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1917
    return-void
.end method

.method private generateConcurrentSupportedCombinationList()V
    .locals 2

    .line 1910
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mConcurrentSurfaceCombinations:Ljava/util/List;

    .line 1911
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->getConcurrentSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1910
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1912
    return-void
.end method

.method private generateFcqSurfaceCombinations()V
    .locals 2

    .line 1954
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFcqSurfaceCombinations:Ljava/util/List;

    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->generateQueryableFcqCombinations()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1955
    return-void
.end method

.method private generateHighSpeedSupportedCombinationList()V
    .locals 3

    .line 1939
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/HighSpeedResolver;->isHighSpeedSupported()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1940
    return-void

    .line 1942
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedSurfaceCombinations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1944
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/HighSpeedResolver;->getMaxSize()Landroid/util/Size;

    move-result-object v0

    .line 1945
    .local v0, "maxSize":Landroid/util/Size;
    if-eqz v0, :cond_1

    .line 1946
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedSurfaceCombinations:Ljava/util/List;

    .line 1948
    const/16 v2, 0x22

    invoke-virtual {p0, v2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v2

    .line 1947
    invoke-static {v0, v2}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->generateHighSpeedSupportedCombinationList(Landroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;)Ljava/util/List;

    move-result-object v2

    .line 1946
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1951
    :cond_1
    return-void
.end method

.method private generatePreviewStabilizationSupportedCombinationList()V
    .locals 2

    .line 1932
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 1933
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mPreviewStabilizationSurfaceCombinations:Ljava/util/List;

    .line 1934
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->getPreviewStabilizationSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1933
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1936
    :cond_0
    return-void
.end method

.method private generateStreamUseCaseSupportedCombinationList()V
    .locals 2

    .line 1925
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 1926
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsStreamUseCase:Ljava/util/List;

    .line 1927
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->getStreamUseCaseSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1926
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1929
    :cond_0
    return-void
.end method

.method private generateSupportedCombinationList()V
    .locals 4

    .line 1897
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    iget v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHardwareLevel:I

    iget-boolean v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsRawSupported:Z

    iget-boolean v3, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsBurstCaptureSupported:Z

    .line 1898
    invoke-static {v1, v2, v3}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->generateSupportedCombinationList(IZZ)Ljava/util/List;

    move-result-object v1

    .line 1897
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1901
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mExtraSupportedSurfaceCombinationsContainer:Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;->get(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1902
    return-void
.end method

.method private generateSurfaceSizeDefinition()V
    .locals 10

    .line 1965
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getPreviewSize()Landroid/util/Size;

    move-result-object v3

    .line 1966
    .local v3, "previewSize":Landroid/util/Size;
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRecordSize()Landroid/util/Size;

    move-result-object v5

    .line 1967
    .local v5, "recordSize":Landroid/util/Size;
    sget-object v1, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_VGA:Landroid/util/Size;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    invoke-static/range {v1 .. v9}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->create(Landroid/util/Size;Ljava/util/Map;Landroid/util/Size;Ljava/util/Map;Landroid/util/Size;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1976
    return-void
.end method

.method private generateUltraHdrSupportedCombinationList()V
    .locals 2

    .line 1920
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsUltraHdr:Ljava/util/List;

    .line 1921
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->getUltraHdrSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1920
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1922
    return-void
.end method

.method private generateUltraHighSupportedCombinationList()V
    .locals 2

    .line 1905
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mUltraHighSurfaceCombinations:Ljava/util/List;

    .line 1906
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->getUltraHighResolutionSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1905
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1907
    return-void
.end method

.method private getAllPossibleSizeArrangements(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;)",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 1768
    .local p1, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    const/4 v0, 0x1

    .line 1770
    .local v0, "totalArrangementsCount":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 1771
    .local v2, "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    mul-int/2addr v0, v3

    .line 1772
    .end local v2    # "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 1777
    :cond_0
    if-eqz v0, :cond_5

    .line 1781
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1784
    .local v1, "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v0, :cond_1

    .line 1785
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1786
    .local v3, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1784
    .end local v3    # "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1797
    .end local v2    # "i":I
    :cond_1
    move v2, v0

    .line 1798
    .local v2, "currentRunCount":I
    const/4 v3, 0x0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    div-int v3, v2, v3

    .line 1800
    .local v3, "nextRunCount":I
    const/4 v4, 0x0

    .local v4, "currentIndex":I
    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 1801
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 1802
    .local v5, "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    if-ge v6, v0, :cond_2

    .line 1803
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 1805
    .local v7, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    rem-int v8, v6, v2

    div-int/2addr v8, v3

    .line 1806
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/util/Size;

    .line 1805
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1802
    .end local v7    # "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1809
    .end local v6    # "i":I
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v4, v6, :cond_3

    .line 1810
    move v2, v3

    .line 1811
    add-int/lit8 v6, v4, 0x1

    .line 1812
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    div-int v3, v2, v6

    .line 1800
    .end local v5    # "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1816
    .end local v4    # "currentIndex":I
    :cond_4
    return-object v1

    .line 1778
    .end local v1    # "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v2    # "currentRunCount":I
    .end local v3    # "nextRunCount":I
    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Failed to find supported resolutions."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getAndValidateIsStrictFpsRequired(ZLjava/lang/Boolean;)Z
    .locals 2
    .param p1, "newIsStrictFpsRequired"    # Z
    .param p2, "storedIsStrictFpsRequired"    # Ljava/lang/Boolean;

    .line 698
    if-eqz p2, :cond_1

    .line 699
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-ne v0, p1, :cond_0

    goto :goto_0

    .line 703
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "All isStrictFpsRequired should be the same"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 705
    :cond_1
    :goto_0
    return p1
.end method

.method private getCheckingMethod(Ljava/util/Collection;Landroid/util/Range;ZZZ)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;
    .locals 3
    .param p3, "isPreviewStabilizationOn"    # Z
    .param p4, "isUltraHdrOn"    # Z
    .param p5, "isFeatureComboInvocation"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;ZZZ)",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;"
        }
    .end annotation

    .line 1120
    .local p1, "dynamicRanges":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/DynamicRange;>;"
    .local p2, "fps":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-nez p5, :cond_0

    .line 1121
    sget-object v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;->WITHOUT_FEATURE_COMBO:Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;

    return-object v0

    .line 1126
    :cond_0
    const/4 v0, 0x0

    .line 1128
    .local v0, "count":I
    sget-object v1, Landroidx/camera/core/DynamicRange;->HLG_10_BIT:Landroidx/camera/core/DynamicRange;

    invoke-interface {p1, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1129
    add-int/lit8 v0, v0, 0x1

    .line 1131
    :cond_1
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x3c

    if-ne v1, v2, :cond_2

    .line 1132
    add-int/lit8 v0, v0, 0x1

    .line 1134
    :cond_2
    if-eqz p3, :cond_3

    .line 1135
    add-int/lit8 v0, v0, 0x1

    .line 1137
    :cond_3
    if-eqz p4, :cond_4

    .line 1138
    add-int/lit8 v0, v0, 0x1

    .line 1141
    :cond_4
    const/4 v1, 0x1

    if-le v0, v1, :cond_5

    .line 1142
    sget-object v1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;->WITH_FEATURE_COMBO:Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;

    return-object v1

    .line 1143
    :cond_5
    if-ne v0, v1, :cond_6

    .line 1144
    sget-object v1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;->WITHOUT_FEATURE_COMBO_FIRST_AND_THEN_WITH_IT:Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;

    return-object v1

    .line 1146
    :cond_6
    sget-object v1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;->WITHOUT_FEATURE_COMBO:Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;

    return-object v1
.end method

.method private getClosestSupportedDeviceFrameRate(Landroid/util/Range;I[Landroid/util/Range;)Landroid/util/Range;
    .locals 8
    .param p2, "maxFps"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;I[",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 575
    .local p1, "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p3, "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v0, p1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 576
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    return-object v0

    .line 579
    :cond_0
    if-nez p3, :cond_1

    .line 580
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    return-object v0

    .line 587
    :cond_1
    new-instance v0, Landroid/util/Range;

    .line 588
    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 589
    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 592
    .end local p1    # "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v0, "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object p1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    .line 593
    .local p1, "bestRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .line 596
    .local v1, "currentIntersectSize":I
    array-length v2, p3

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_9

    aget-object v4, p3, v3

    .line 598
    .local v4, "potentialRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static {v4}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Range;

    invoke-virtual {v5}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-lt p2, v5, :cond_8

    .line 599
    sget-object v5, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {p1, v5}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 600
    move-object p1, v4

    .line 603
    :cond_2
    invoke-virtual {v4, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 604
    move-object p1, v4

    .line 605
    goto :goto_3

    .line 610
    :cond_3
    :try_start_0
    invoke-virtual {v4, v0}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v5

    .line 611
    .local v5, "newIntersection":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static {v5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v6

    .line 613
    .local v6, "newIntersectSize":I
    if-nez v1, :cond_4

    .line 614
    move-object p1, v4

    .line 615
    move v1, v6

    goto :goto_1

    .line 616
    :cond_4
    if-lt v6, v1, :cond_5

    .line 619
    invoke-static {v0, p1, v4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->compareIntersectingRanges(Landroid/util/Range;Landroid/util/Range;Landroid/util/Range;)Landroid/util/Range;

    move-result-object v7

    move-object p1, v7

    .line 621
    invoke-virtual {v0, p1}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v7

    invoke-static {v7}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v7
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v7

    .line 641
    .end local v5    # "newIntersection":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v6    # "newIntersectSize":I
    :cond_5
    :goto_1
    goto :goto_2

    .line 623
    :catch_0
    move-exception v5

    .line 625
    .local v5, "e":Ljava/lang/IllegalArgumentException;
    if-nez v1, :cond_8

    .line 626
    invoke-static {v4, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I

    move-result v6

    .line 627
    invoke-static {p1, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I

    move-result v7

    if-ge v6, v7, :cond_6

    .line 628
    move-object p1, v4

    goto :goto_2

    .line 629
    :cond_6
    invoke-static {v4, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I

    move-result v6

    .line 630
    invoke-static {p1, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I

    move-result v7

    if-ne v6, v7, :cond_8

    .line 631
    invoke-virtual {v4}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-le v6, v7, :cond_7

    .line 633
    move-object p1, v4

    goto :goto_2

    .line 634
    :cond_7
    invoke-static {v4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v6

    invoke-static {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v7

    if-ge v6, v7, :cond_8

    .line 637
    move-object p1, v4

    .line 596
    .end local v4    # "potentialRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    :cond_8
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 645
    :cond_9
    :goto_3
    return-object p1
.end method

.method private getMaxFrameRate(ILandroid/util/Size;Z)I
    .locals 1
    .param p1, "imageFormat"    # I
    .param p2, "size"    # Landroid/util/Size;
    .param p3, "isHighSpeedOn"    # Z

    .line 445
    if-eqz p3, :cond_1

    const/16 v0, 0x22

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 447
    if-eqz p3, :cond_2

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/HighSpeedResolver;->getMaxFrameRate(Landroid/util/Size;)I

    move-result v0

    goto :goto_2

    .line 448
    :cond_2
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-direct {p0, v0, p1, p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxFrameRate(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;ILandroid/util/Size;)I

    move-result v0

    .line 447
    :goto_2
    return v0
.end method

.method private getMaxFrameRate(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;ILandroid/util/Size;)I
    .locals 6
    .param p1, "characteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p2, "imageFormat"    # I
    .param p3, "size"    # Landroid/util/Size;

    .line 453
    nop

    .line 454
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 453
    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    .line 455
    invoke-virtual {v0, p2, p3}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getOutputMinFrameDuration(ILandroid/util/Size;)J

    move-result-wide v0

    .line 456
    .local v0, "minFrameDuration":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    .line 457
    iget-boolean v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsManualSensorSupported:Z

    if-eqz v2, :cond_0

    .line 458
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "minFrameDuration: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is invalid for imageFormat = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "SupportedSurfaceCombination"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 460
    const/4 v2, 0x0

    return v2

    .line 464
    :cond_0
    const v2, 0x7fffffff

    return v2

    .line 467
    :cond_1
    const-wide v2, 0x41cdcd6500000000L    # 1.0E9

    long-to-double v4, v0

    div-double/2addr v2, v4

    double-to-int v2, v2

    return v2
.end method

.method private getMaxOutputSizeByFormat(Landroid/hardware/camera2/params/StreamConfigurationMap;IZLandroid/util/Rational;)Landroid/util/Size;
    .locals 6
    .param p1, "map"    # Landroid/hardware/camera2/params/StreamConfigurationMap;
    .param p2, "imageFormat"    # I
    .param p3, "highResolutionIncluded"    # Z
    .param p4, "aspectRatio"    # Landroid/util/Rational;

    .line 1829
    invoke-static {p1, p2, p4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getOutputSizes(Landroid/hardware/camera2/params/StreamConfigurationMap;ILandroid/util/Rational;)[Landroid/util/Size;

    move-result-object v0

    .line 1831
    .local v0, "outputSizes":[Landroid/util/Size;
    if-eqz v0, :cond_2

    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_0

    .line 1835
    :cond_0
    new-instance v1, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    .line 1836
    .local v1, "compareSizesByArea":Landroidx/camera/core/impl/utils/CompareSizesByArea;
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 1839
    .local v2, "maxSize":Landroid/util/Size;
    sget-object v3, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_ZERO:Landroid/util/Size;

    .line 1840
    .local v3, "maxHighResolutionSize":Landroid/util/Size;
    if-eqz p3, :cond_1

    .line 1841
    invoke-static {p1, p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$Api23Impl;->getHighResolutionOutputSizes(Landroid/hardware/camera2/params/StreamConfigurationMap;I)[Landroid/util/Size;

    move-result-object v4

    .line 1844
    .local v4, "highResolutionOutputSizes":[Landroid/util/Size;
    if-eqz v4, :cond_1

    array-length v5, v4

    if-lez v5, :cond_1

    .line 1845
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v5

    move-object v3, v5

    check-cast v3, Landroid/util/Size;

    .line 1850
    .end local v4    # "highResolutionOutputSizes":[Landroid/util/Size;
    :cond_1
    const/4 v4, 0x2

    new-array v4, v4, [Landroid/util/Size;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    aput-object v3, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Size;

    return-object v4

    .line 1832
    .end local v1    # "compareSizesByArea":Landroidx/camera/core/impl/utils/CompareSizesByArea;
    .end local v2    # "maxSize":Landroid/util/Size;
    .end local v3    # "maxHighResolutionSize":Landroid/util/Size;
    :cond_2
    :goto_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private getMaxSupportedFpsFromAttachedSurfaces(Ljava/util/List;Z)I
    .locals 5
    .param p2, "isHighSpeedOn"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;Z)I"
        }
    .end annotation

    .line 1494
    .local p1, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    const v0, 0x7fffffff

    .line 1496
    .local v0, "existingSurfaceFrameRateCeiling":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 1498
    .local v2, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    nop

    .line 1500
    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImageFormat()I

    move-result v3

    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getSize()Landroid/util/Size;

    move-result-object v4

    .line 1498
    invoke-direct {p0, v0, v3, v4, p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedMaximumFps(IILandroid/util/Size;Z)I

    move-result v0

    .line 1502
    .end local v2    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 1504
    :cond_0
    return v0
.end method

.method private static getOutputSizes(Landroid/hardware/camera2/params/StreamConfigurationMap;ILandroid/util/Rational;)[Landroid/util/Size;
    .locals 8
    .param p0, "map"    # Landroid/hardware/camera2/params/StreamConfigurationMap;
    .param p1, "imageFormat"    # I
    .param p2, "aspectRatio"    # Landroid/util/Rational;

    .line 1856
    const/4 v0, 0x0

    .line 1860
    .local v0, "outputSizes":[Landroid/util/Size;
    const/16 v1, 0x22

    if-ne p1, v1, :cond_0

    .line 1866
    :try_start_0
    const-class v1, Landroid/graphics/SurfaceTexture;

    invoke-virtual {p0, v1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v1

    move-object v0, v1

    .end local v0    # "outputSizes":[Landroid/util/Size;
    .local v1, "outputSizes":[Landroid/util/Size;
    goto :goto_0

    .line 1868
    .end local v1    # "outputSizes":[Landroid/util/Size;
    .restart local v0    # "outputSizes":[Landroid/util/Size;
    :cond_0
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v1

    .line 1872
    :goto_0
    goto :goto_1

    .line 1870
    :catchall_0
    move-exception v1

    .line 1874
    :goto_1
    const/4 v1, 0x0

    if-eqz v0, :cond_6

    array-length v2, v0

    if-nez v2, :cond_1

    goto :goto_3

    .line 1878
    :cond_1
    if-eqz p2, :cond_5

    .line 1879
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1880
    .local v2, "filteredSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    array-length v3, v0

    const/4 v4, 0x0

    move v5, v4

    :goto_2
    if-ge v5, v3, :cond_3

    aget-object v6, v0, v5

    .line 1881
    .local v6, "size":Landroid/util/Size;
    invoke-static {v6, p2}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1882
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1880
    .end local v6    # "size":Landroid/util/Size;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1886
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1887
    return-object v1

    .line 1890
    :cond_4
    new-array v1, v4, [Landroid/util/Size;

    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, [Landroid/util/Size;

    .line 1893
    .end local v2    # "filteredSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_5
    return-object v0

    .line 1875
    :cond_6
    :goto_3
    return-object v1
.end method

.method private static getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 479
    .local p0, "firstRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p1, "secondRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    nop

    .line 480
    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 481
    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 479
    :goto_0
    const-string v1, "Ranges must not intersect"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 483
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 484
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    return v0

    .line 486
    :cond_1
    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private static getRangeLength(Landroid/util/Range;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 471
    .local p0, "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private getRecordSize()Landroid/util/Size;
    .locals 2

    .line 2083
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 2084
    .local v0, "cameraId":I
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRecordSizeFromCamcorderProfile(I)Landroid/util/Size;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2085
    .local v1, "recordSize":Landroid/util/Size;
    if-eqz v1, :cond_0

    .line 2086
    return-object v1

    .line 2090
    .end local v0    # "cameraId":I
    .end local v1    # "recordSize":Landroid/util/Size;
    :cond_0
    goto :goto_0

    .line 2088
    :catch_0
    move-exception v0

    .line 2092
    :goto_0
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRecordSizeFromStreamConfigurationMap()Landroid/util/Size;

    move-result-object v0

    .line 2093
    .local v0, "recordSize":Landroid/util/Size;
    if-eqz v0, :cond_1

    .line 2094
    return-object v0

    .line 2097
    :cond_1
    sget-object v1, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_480P:Landroid/util/Size;

    return-object v1
.end method

.method private getRecordSizeFromCamcorderProfile(I)Landroid/util/Size;
    .locals 6
    .param p1, "cameraId"    # I

    .line 2141
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 2152
    .local v0, "qualities":[I
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, v0, v2

    .line 2153
    .local v3, "quality":I
    iget-object v4, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    invoke-interface {v4, p1, v3}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->hasProfile(II)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2154
    iget-object v4, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    invoke-interface {v4, p1, v3}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v4

    .line 2155
    .local v4, "profile":Landroid/media/CamcorderProfile;
    if-eqz v4, :cond_0

    .line 2156
    new-instance v1, Landroid/util/Size;

    iget v2, v4, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget v5, v4, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-direct {v1, v2, v5}, Landroid/util/Size;-><init>(II)V

    return-object v1

    .line 2152
    .end local v3    # "quality":I
    .end local v4    # "profile":Landroid/media/CamcorderProfile;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2161
    :cond_1
    const/4 v1, 0x0

    return-object v1

    :array_0
    .array-data 4
        0x1
        0xd
        0xa
        0x8
        0xc
        0x6
        0x5
        0x4
    .end array-data
.end method

.method private getRecordSizeFromStreamConfigurationMap()Landroid/util/Size;
    .locals 8

    .line 2109
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 2110
    .local v0, "mapCompat":Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;
    const/4 v1, 0x0

    .line 2114
    .local v1, "videoSizeArr":[Landroid/util/Size;
    :try_start_0
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->toStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v2

    const-class v3, Landroid/media/MediaRecorder;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v2

    .line 2117
    goto :goto_0

    .line 2115
    :catchall_0
    move-exception v2

    .line 2119
    :goto_0
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2120
    return-object v2

    .line 2123
    :cond_0
    new-instance v3, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {v1, v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 2125
    array-length v3, v1

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_2

    aget-object v5, v1, v4

    .line 2126
    .local v5, "size":Landroid/util/Size;
    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v6

    sget-object v7, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_1080P:Landroid/util/Size;

    invoke-virtual {v7}, Landroid/util/Size;->getWidth()I

    move-result v7

    if-gt v6, v7, :cond_1

    .line 2127
    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v6

    sget-object v7, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_1080P:Landroid/util/Size;

    invoke-virtual {v7}, Landroid/util/Size;->getHeight()I

    move-result v7

    if-gt v6, v7, :cond_1

    .line 2128
    return-object v5

    .line 2125
    .end local v5    # "size":Landroid/util/Size;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2132
    :cond_2
    return-object v2
.end method

.method private static getRequiredMaxBitDepth(Ljava/util/Map;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;)I"
        }
    .end annotation

    .line 1722
    .local p0, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/DynamicRange;

    .line 1723
    .local v1, "dynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-virtual {v1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 1724
    return v3

    .line 1726
    .end local v1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    :cond_0
    goto :goto_0

    .line 1728
    :cond_1
    const/16 v0, 0x8

    return v0
.end method

.method private getSurfaceCombinationsByFeatureSettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;)Ljava/util/List;
    .locals 3
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            ")",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation

    .line 368
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 369
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    .line 372
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 374
    .local v0, "supportedSurfaceCombinations":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceCombination;>;"
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->requiresFeatureComboQuery()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 375
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFcqSurfaceCombinations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 376
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateFcqSurfaceCombinations()V

    .line 378
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFcqSurfaceCombinations:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_1

    .line 379
    :cond_2
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isUltraHdrOn()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 381
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsUltraHdr:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 382
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateUltraHdrSupportedCombinationList()V

    .line 385
    :cond_3
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v1

    if-nez v1, :cond_9

    .line 386
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsUltraHdr:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 388
    :cond_4
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 389
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedSurfaceCombinations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 390
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateHighSpeedSupportedCombinationList()V

    .line 392
    :cond_5
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedSurfaceCombinations:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 393
    :cond_6
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getRequiredMaxBitDepth()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_8

    .line 394
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 403
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isPreviewStabilizationOn()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 404
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mPreviewStabilizationSurfaceCombinations:Ljava/util/List;

    goto :goto_0

    .line 399
    :pswitch_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mUltraHighSurfaceCombinations:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 400
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 401
    goto :goto_1

    .line 396
    :pswitch_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mConcurrentSurfaceCombinations:Ljava/util/List;

    .line 397
    goto :goto_1

    .line 404
    :cond_7
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    .line 403
    :goto_0
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 405
    goto :goto_1

    .line 407
    :cond_8
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getRequiredMaxBitDepth()I

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_9

    .line 409
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v1

    if-nez v1, :cond_9

    .line 410
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations10Bit:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 414
    :cond_9
    :goto_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getSurfaceConfigListAndFpsCeiling(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILjava/util/Map;Ljava/util/Map;)Landroid/util/Pair;
    .locals 16
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .param p6, "currentConfigFrameRateCeiling"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1615
    .local p2, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local p4, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p5, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p7, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p8, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    move-object/from16 v2, p8

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1616
    .local v3, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 1617
    .local v5, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v5}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getSurfaceConfig()Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1618
    if-eqz v1, :cond_0

    .line 1619
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1622
    .end local v5    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    :cond_0
    goto :goto_0

    .line 1625
    :cond_1
    const/4 v4, 0x0

    move v5, v4

    move/from16 v4, p6

    .end local p6    # "currentConfigFrameRateCeiling":I
    .local v4, "currentConfigFrameRateCeiling":I
    .local v5, "i":I
    :goto_1
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_4

    .line 1626
    move-object/from16 v6, p3

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v9, v7

    check-cast v9, Landroid/util/Size;

    .line 1627
    .local v9, "size":Landroid/util/Size;
    nop

    .line 1628
    move-object/from16 v7, p5

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    move-object/from16 v14, p4

    invoke-interface {v14, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v15, v8

    check-cast v15, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1629
    .local v15, "newUseCase":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v15}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v8

    .line 1630
    .local v8, "imageFormat":I
    invoke-interface {v15}, Landroidx/camera/core/impl/UseCaseConfig;->getStreamUseCase()Landroidx/camera/core/impl/StreamUseCase;

    move-result-object v13

    .line 1633
    .local v13, "streamUseCase":Landroidx/camera/core/impl/StreamUseCase;
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->requiresFeatureComboQuery()Z

    move-result v10

    if-eqz v10, :cond_2

    sget-object v10, Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;->FEATURE_COMBINATION_TABLE:Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;

    move-object v12, v10

    goto :goto_2

    .line 1634
    :cond_2
    sget-object v10, Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;->CAPTURE_SESSION_TABLES:Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;

    move-object v12, v10

    :goto_2
    nop

    .line 1635
    .local v12, "configSource":Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;
    nop

    .line 1638
    invoke-virtual {v0, v8}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v10

    .line 1639
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v11

    .line 1635
    invoke-static/range {v8 .. v13}, Landroidx/camera/core/impl/SurfaceConfig;->transformSurfaceConfig(ILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;ILandroidx/camera/core/impl/SurfaceConfig$ConfigSource;Landroidx/camera/core/impl/StreamUseCase;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v10

    .line 1642
    .local v10, "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1643
    if-eqz v2, :cond_3

    .line 1644
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v2, v11, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1648
    :cond_3
    nop

    .line 1650
    invoke-interface {v15}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v11

    .line 1651
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v1

    .line 1648
    invoke-direct {v0, v4, v11, v9, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedMaximumFps(IILandroid/util/Size;Z)I

    move-result v4

    .line 1625
    .end local v8    # "imageFormat":I
    .end local v9    # "size":Landroid/util/Size;
    .end local v10    # "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    .end local v12    # "configSource":Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;
    .end local v13    # "streamUseCase":Landroidx/camera/core/impl/StreamUseCase;
    .end local v15    # "newUseCase":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v1, p7

    goto :goto_1

    :cond_4
    move-object/from16 v6, p3

    move-object/from16 v14, p4

    move-object/from16 v7, p5

    .line 1653
    .end local v5    # "i":I
    new-instance v1, Landroid/util/Pair;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v1, v3, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method private getTargetFpsRange(Ljava/util/List;Ljava/util/List;Ljava/util/List;Z)Landroid/util/Range;
    .locals 5
    .param p4, "isStrictFpsRequired"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;Z)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1457
    .local p1, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p2, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p3, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    .line 1459
    .local v0, "targetFrameRateForConfig":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 1461
    .local v2, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    nop

    .line 1462
    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getTargetFrameRate()Landroid/util/Range;

    move-result-object v3

    .line 1461
    invoke-direct {p0, v3, v0, p4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedTargetFrameRate(Landroid/util/Range;Landroid/util/Range;Z)Landroid/util/Range;

    move-result-object v0

    .line 1464
    .end local v2    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 1467
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 1468
    .local v2, "index":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    sget-object v4, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    .line 1469
    invoke-interface {v3, v4}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetFrameRate(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v3

    .line 1468
    invoke-static {v3}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Range;

    .line 1470
    .local v3, "newTargetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-direct {p0, v3, v0, p4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedTargetFrameRate(Landroid/util/Range;Landroid/util/Range;Z)Landroid/util/Range;

    move-result-object v0

    .line 1472
    .end local v2    # "index":Ljava/lang/Integer;
    .end local v3    # "newTargetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    goto :goto_1

    .line 1474
    :cond_1
    return-object v0
.end method

.method private getUpdatedMaximumFps(IILandroid/util/Size;Z)I
    .locals 1
    .param p1, "currentMaxFps"    # I
    .param p2, "imageFormat"    # I
    .param p3, "size"    # Landroid/util/Size;
    .param p4, "isHighSpeedOn"    # Z

    .line 716
    invoke-direct {p0, p2, p3, p4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxFrameRate(ILandroid/util/Size;Z)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method private getUpdatedTargetFrameRate(Landroid/util/Range;Landroid/util/Range;Z)Landroid/util/Range;
    .locals 2
    .param p3, "isStrictFpsRequired"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;Z)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 667
    .local p1, "newTargetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p2, "storedTargetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v0, p2}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    .line 668
    invoke-virtual {v0, p1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 669
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    return-object v0

    .line 670
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v0, p2}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 671
    return-object p1

    .line 672
    :cond_1
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v0, p1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 673
    return-object p2

    .line 675
    :cond_2
    if-eqz p3, :cond_4

    .line 679
    if-ne p1, p2, :cond_3

    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    const-string v1, "All targetFrameRate should be the same if strict fps is required"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 683
    return-object p1

    .line 687
    :cond_4
    :try_start_0
    invoke-virtual {p2, p1}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 688
    :catch_0
    move-exception v0

    .line 690
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    return-object p2
.end method

.method private static getUseCasesPriorityOrder(Ljava/util/List;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1733
    .local p0, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1741
    .local v0, "priorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1743
    .local v1, "priorityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1744
    .local v3, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v3, v4}, Landroidx/camera/core/impl/UseCaseConfig;->getSurfaceOccupancyPriority(I)I

    move-result v4

    .line 1745
    .local v4, "priority":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1746
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1748
    .end local v3    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v4    # "priority":I
    :cond_0
    goto :goto_0

    .line 1750
    :cond_1
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1753
    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 1755
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1756
    .local v3, "priorityValue":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1757
    .local v6, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v6, v4}, Landroidx/camera/core/impl/UseCaseConfig;->getSurfaceOccupancyPriority(I)I

    move-result v7

    if-ne v3, v7, :cond_2

    .line 1758
    invoke-interface {p0, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1760
    .end local v6    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    :cond_2
    goto :goto_2

    .line 1761
    .end local v3    # "priorityValue":I
    :cond_3
    goto :goto_1

    .line 1763
    :cond_4
    return-object v0
.end method

.method private static isConfigFrameRateAcceptable(ILandroid/util/Range;I)Z
    .locals 2
    .param p0, "maxSupportedFps"    # I
    .param p2, "currentConfigFrameRateCeiling"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;I)Z"
        }
    .end annotation

    .line 1293
    .local p1, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    .line 1294
    .local v0, "isConfigFrameRateAcceptable":Z
    sget-object v1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v1, p1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1301
    if-ge p2, p0, :cond_0

    .line 1302
    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge p2, v1, :cond_0

    .line 1307
    const/4 v0, 0x0

    .line 1310
    :cond_0
    return v0
.end method

.method private isStrictFpsRequired(Ljava/util/List;Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)Z"
        }
    .end annotation

    .line 1479
    .local p1, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p2, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    const/4 v0, 0x0

    .line 1480
    .local v0, "isStrictFpsRequired":Ljava/lang/Boolean;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 1481
    .local v2, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    nop

    .line 1482
    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->isStrictFrameRateRequired()Z

    move-result v3

    .line 1481
    invoke-direct {p0, v3, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getAndValidateIsStrictFpsRequired(ZLjava/lang/Boolean;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 1483
    .end local v2    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 1485
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1486
    .local v2, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    nop

    .line 1487
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->isStrictFrameRateRequired()Z

    move-result v3

    .line 1486
    invoke-direct {p0, v3, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getAndValidateIsStrictFpsRequired(ZLjava/lang/Boolean;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 1488
    .end local v2    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    goto :goto_1

    .line 1489
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    return v1
.end method

.method private static isUltraHdrOn(Ljava/util/List;Ljava/util/Map;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;)Z"
        }
    .end annotation

    .line 1315
    .local p0, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p1, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    const/16 v3, 0x1005

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 1316
    .local v1, "surfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImageFormat()I

    move-result v4

    if-ne v4, v3, :cond_0

    .line 1317
    return v2

    .line 1319
    .end local v1    # "surfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    :cond_0
    goto :goto_0

    .line 1321
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1322
    .local v1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v4

    if-ne v4, v3, :cond_2

    .line 1323
    return v2

    .line 1325
    .end local v1    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    :cond_2
    goto :goto_1

    .line 1327
    :cond_3
    const/4 v0, 0x0

    return v0
.end method

.method private isUseCasesCombinationSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;)Z
    .locals 12
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;)Z"
        }
    .end annotation

    .line 1418
    .local p2, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v3, v0

    .line 1421
    .local v3, "surfaceConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 1422
    .local v1, "attachedSurface":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getSurfaceConfig()Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1423
    .end local v1    # "attachedSurface":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 1427
    :cond_0
    new-instance v0, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v0}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    .line 1428
    .local v0, "compareSizesByArea":Landroidx/camera/core/impl/utils/CompareSizesByArea;
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1429
    .local v2, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {p3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 1430
    .local v4, "supportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-eqz v4, :cond_1

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v5, 0x1

    goto :goto_2

    :cond_1
    const/4 v5, 0x0

    :goto_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No available output size is found for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 1432
    invoke-static {v4, v0}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Landroid/util/Size;

    .line 1433
    .local v7, "minSize":Landroid/util/Size;
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v6

    .line 1434
    .local v6, "imageFormat":I
    nop

    .line 1438
    invoke-virtual {p0, v6}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v8

    .line 1439
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v9

    sget-object v10, Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;->CAPTURE_SESSION_TABLES:Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;

    .line 1442
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->getStreamUseCase()Landroidx/camera/core/impl/StreamUseCase;

    move-result-object v11

    .line 1435
    invoke-static/range {v6 .. v11}, Landroidx/camera/core/impl/SurfaceConfig;->transformSurfaceConfig(ILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;ILandroidx/camera/core/impl/SurfaceConfig$ConfigSource;Landroidx/camera/core/impl/StreamUseCase;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v5

    .line 1434
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1443
    .end local v2    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v4    # "supportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v6    # "imageFormat":I
    .end local v7    # "minSize":Landroid/util/Size;
    goto :goto_1

    .line 1448
    :cond_2
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v4

    .line 1449
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    .line 1448
    move-object v1, p0

    move-object v2, p1

    .end local p1    # "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .local v2, "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    invoke-virtual/range {v1 .. v6}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->checkSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;)Z

    move-result p1

    return p1
.end method

.method private populateReducedSizeListAndUniqueMaxFpsMap(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Landroid/util/Range;Landroid/util/Size;ILandroidx/camera/core/impl/StreamUseCase;ZLjava/util/Map;Ljava/util/List;)V
    .locals 6
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .param p3, "size"    # Landroid/util/Size;
    .param p4, "imageFormat"    # I
    .param p5, "streamUseCase"    # Landroidx/camera/core/impl/StreamUseCase;
    .param p6, "forceUniqueMaxFpsFiltering"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Size;",
            "I",
            "Landroidx/camera/core/impl/StreamUseCase;",
            "Z",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)V"
        }
    .end annotation

    .line 1543
    .local p2, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p7, "configSizeToUniqueMaxFpsMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;Ljava/util/Set<Ljava/lang/Integer;>;>;"
    .local p8, "reducedSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    nop

    .line 1544
    invoke-virtual {p0, p4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v2

    .line 1545
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v3

    .line 1546
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->requiresFeatureComboQuery()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;->FEATURE_COMBINATION_TABLE:Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;

    move-object v4, v0

    goto :goto_0

    .line 1547
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;->CAPTURE_SESSION_TABLES:Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;

    move-object v4, v0

    .line 1543
    :goto_0
    move-object v1, p3

    move v0, p4

    move-object v5, p5

    .end local p3    # "size":Landroid/util/Size;
    .end local p4    # "imageFormat":I
    .end local p5    # "streamUseCase":Landroidx/camera/core/impl/StreamUseCase;
    .local v0, "imageFormat":I
    .local v1, "size":Landroid/util/Size;
    .local v5, "streamUseCase":Landroidx/camera/core/impl/StreamUseCase;
    invoke-static/range {v0 .. v5}, Landroidx/camera/core/impl/SurfaceConfig;->transformSurfaceConfig(ILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;ILandroidx/camera/core/impl/SurfaceConfig$ConfigSource;Landroidx/camera/core/impl/StreamUseCase;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object p3

    .line 1548
    invoke-virtual {p3}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigSize()Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    move-result-object p3

    .line 1550
    .local p3, "configSize":Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    const p4, 0x7fffffff

    .line 1552
    .local p4, "maxFrameRate":I
    sget-object p5, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {p5, p2}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_1

    if-eqz p6, :cond_2

    .line 1553
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result p5

    invoke-direct {p0, v0, v1, p5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxFrameRate(ILandroid/util/Size;Z)I

    move-result p4

    .line 1559
    :cond_2
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isFeatureComboInvocation()Z

    move-result p5

    if-eqz p5, :cond_4

    sget-object p5, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->NOT_SUPPORT:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    if-eq p3, p5, :cond_3

    sget-object p5, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    .line 1561
    invoke-virtual {p5, p2}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-nez p5, :cond_4

    .line 1562
    invoke-virtual {p2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object p5

    check-cast p5, Ljava/lang/Integer;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p5

    if-ge p4, p5, :cond_4

    .line 1564
    :cond_3
    return-void

    .line 1567
    :cond_4
    invoke-interface {p7, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/util/Set;

    .line 1569
    .local p5, "uniqueMaxFrameRates":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    if-nez p5, :cond_5

    .line 1570
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    move-object p5, v2

    .line 1571
    invoke-interface {p7, p3, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1601
    :cond_5
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p5, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 1602
    invoke-interface {p8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1603
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p5, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1605
    :cond_6
    return-void
.end method

.method private refreshPreviewSize()V
    .locals 10

    .line 2059
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->refresh()V

    .line 2060
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    if-nez v0, :cond_0

    .line 2061
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateSurfaceSizeDefinition()V

    goto :goto_0

    .line 2063
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getPreviewSize()Landroid/util/Size;

    move-result-object v3

    .line 2064
    .local v3, "previewSize":Landroid/util/Size;
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2065
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getAnalysisSize()Landroid/util/Size;

    move-result-object v1

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2066
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS720pSizeMap()Ljava/util/Map;

    move-result-object v2

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2068
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS1440pSizeMap()Ljava/util/Map;

    move-result-object v4

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2069
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getRecordSize()Landroid/util/Size;

    move-result-object v5

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2070
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximumSizeMap()Ljava/util/Map;

    move-result-object v6

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2071
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximum4x3SizeMap()Ljava/util/Map;

    move-result-object v7

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2072
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximum16x9SizeMap()Ljava/util/Map;

    move-result-object v8

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2073
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getUltraMaximumSizeMap()Ljava/util/Map;

    move-result-object v9

    .line 2064
    invoke-static/range {v1 .. v9}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->create(Landroid/util/Size;Ljava/util/Map;Landroid/util/Size;Ljava/util/Map;Landroid/util/Size;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 2075
    .end local v3    # "previewSize":Landroid/util/Size;
    :goto_0
    return-void
.end method

.method private resolveSpecsByCheckingMethod(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Z)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;
    .locals 13
    .param p1, "checkingMethod"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;
    .param p2, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .param p8, "findMaxSupportedFrameRate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;Z)",
            "Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;"
        }
    .end annotation

    .line 859
    .local p3, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p4, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local p5, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p6, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p7, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "resolveSpecsByCheckingMethod: checkingMethod = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SupportedSurfaceCombination"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 861
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 903
    move-object v2, p0

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p8

    invoke-direct/range {v2 .. v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->resolveSpecsBySettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Z)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;

    move-result-object v0

    return-object v0

    .line 879
    :pswitch_0
    move-object v2, p0

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p8

    :try_start_0
    invoke-direct/range {v2 .. v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->resolveSpecsBySettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Z)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 883
    :catch_0
    move-exception v0

    .line 884
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v2, "Failed to find a supported combination without feature combo, trying again with feature combo"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 887
    nop

    .line 888
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v3

    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->hasVideoCapture()Z

    move-result v4

    .line 889
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isPreviewStabilizationOn()Z

    move-result v6

    .line 890
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isUltraHdrOn()Z

    move-result v7

    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v8

    .line 891
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isFeatureComboInvocation()Z

    move-result v9

    .line 893
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v11

    .line 894
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isStrictFpsRequired()Z

    move-result v12

    .line 887
    const/4 v10, 0x1

    move-object v2, p0

    move-object/from16 v5, p7

    invoke-direct/range {v2 .. v12}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->createFeatureSettings(IZLjava/util/Map;ZZZZZLandroid/util/Range;Z)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    move-result-object v3

    .line 896
    .local v3, "fcqFeatureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p8

    invoke-direct/range {v2 .. v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->resolveSpecsBySettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Z)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;

    move-result-object v1

    return-object v1

    .line 863
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v3    # "fcqFeatureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    :pswitch_1
    nop

    .line 864
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v3

    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->hasVideoCapture()Z

    move-result v4

    .line 865
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isPreviewStabilizationOn()Z

    move-result v6

    .line 866
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isUltraHdrOn()Z

    move-result v7

    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v8

    .line 867
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isFeatureComboInvocation()Z

    move-result v9

    .line 869
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v11

    .line 870
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isStrictFpsRequired()Z

    move-result v12

    .line 863
    const/4 v10, 0x1

    move-object v2, p0

    move-object/from16 v5, p7

    invoke-direct/range {v2 .. v12}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->createFeatureSettings(IZLjava/util/Map;ZZZZZLandroid/util/Range;Z)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    move-result-object v3

    .line 872
    .restart local v3    # "fcqFeatureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p8

    invoke-direct/range {v2 .. v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->resolveSpecsBySettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Z)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private resolveSpecsBySettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Z)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;
    .locals 26
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .param p7, "findMaxSupportedFrameRate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;Z)",
            "Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;"
        }
    .end annotation

    .line 928
    .local p2, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local p4, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p5, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p6, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "resolveSpecsBySettings: featureSettings = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v10, "SupportedSurfaceCombination"

    invoke-static {v10, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 932
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->requiresFeatureComboQuery()Z

    move-result v4

    const-string v11, "No supported surface combination is found for camera device - Id : "

    if-nez v4, :cond_1

    invoke-direct/range {p0 .. p3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->isUseCasesCombinationSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 934
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".  May be attempting to bind too many use cases. Existing surfaces: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". New configs: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". GroupableFeature settings: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 944
    :cond_1
    :goto_0
    nop

    .line 945
    move-object/from16 v12, p3

    move/from16 v9, p7

    invoke-virtual {v0, v12, v1, v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->filterSupportedSizes(Ljava/util/Map;Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Z)Ljava/util/Map;

    move-result-object v13

    .line 948
    .local v13, "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v14, v4

    .line 951
    .local v14, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 952
    .local v5, "index":Ljava/lang/Integer;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/UseCaseConfig;

    .line 953
    .local v6, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v13, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 955
    .local v7, "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-nez v7, :cond_2

    .line 956
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v7

    .line 958
    :cond_2
    nop

    .line 959
    invoke-interface {v6}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v8

    .line 958
    invoke-virtual {v0, v7, v8}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->applyResolutionSelectionOrderRelatedWorkarounds(Ljava/util/List;I)Ljava/util/List;

    move-result-object v7

    .line 960
    invoke-interface {v14, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 961
    .end local v5    # "index":Ljava/lang/Integer;
    .end local v6    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v7    # "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_1

    .line 965
    :cond_3
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    invoke-virtual {v4, v14}, Landroidx/camera/camera2/internal/HighSpeedResolver;->getSizeArrangements(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    move-object v5, v4

    goto :goto_2

    .line 966
    :cond_4
    invoke-direct {v0, v14}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getAllPossibleSizeArrangements(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    move-object v5, v4

    :goto_2
    move-object v15, v5

    .line 969
    .local v15, "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 970
    .local v4, "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 977
    .local v5, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 979
    .local v7, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 982
    .local v8, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-static {v2, v3}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->containsZslUseCase(Ljava/util/List;Ljava/util/List;)Z

    move-result v16

    .line 984
    .local v16, "containsZsl":Z
    const/4 v6, 0x0

    .line 985
    .local v6, "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    nop

    .line 986
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v1

    .line 985
    invoke-direct {v0, v2, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxSupportedFpsFromAttachedSurfaces(Ljava/util/List;Z)I

    move-result v1

    .line 988
    .local v1, "maxSupportedFps":I
    move/from16 v17, v1

    .end local v1    # "maxSupportedFps":I
    .local v17, "maxSupportedFps":I
    iget-boolean v1, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsStreamUseCaseSupported:Z

    if-eqz v1, :cond_7

    if-nez v16, :cond_7

    .line 990
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    move-object/from16 v19, v6

    .end local v6    # "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local v19, "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    :goto_3
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 991
    .local v1, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    move-object v12, v4

    move/from16 v6, v17

    move-object v4, v3

    move-object/from16 v17, v13

    move-object v3, v1

    move-object v13, v5

    move-object/from16 v1, p1

    move-object/from16 v5, p5

    .end local v1    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v4    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v5    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v3, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v6, "maxSupportedFps":I
    .local v12, "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v13, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v17, "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-direct/range {v0 .. v8}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getSurfaceConfigListAndFpsCeiling(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILjava/util/Map;Ljava/util/Map;)Landroid/util/Pair;

    move-result-object v9

    move-object v4, v3

    move-object v2, v7

    move-object v3, v8

    move v8, v6

    .end local v6    # "maxSupportedFps":I
    .end local v7    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v2, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v3, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v4, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v8, "maxSupportedFps":I
    iget-object v5, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    .line 997
    .local v5, "surfaceConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    nop

    .line 998
    invoke-virtual {v0, v1, v5, v2, v3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getOrderedSupportedStreamUseCaseSurfaceConfigList(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Ljava/util/List;

    move-result-object v19

    .line 1002
    if-eqz v19, :cond_5

    .line 1003
    move-object/from16 v6, v19

    goto :goto_4

    .line 1005
    :cond_5
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 1006
    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 1007
    .end local v4    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v5    # "surfaceConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    move/from16 v9, p7

    move-object v7, v2

    move-object v4, v12

    move-object v5, v13

    move-object/from16 v13, v17

    move-object/from16 v2, p2

    move-object/from16 v12, p3

    move/from16 v17, v8

    move-object v8, v3

    move-object/from16 v3, p4

    goto :goto_3

    .line 990
    .end local v2    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v3    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .end local v12    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v4, "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v5, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v7    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v8, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v13, "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local v17, "maxSupportedFps":I
    :cond_6
    move-object/from16 v1, p1

    move-object v12, v4

    move-object v2, v7

    move-object v3, v8

    move/from16 v8, v17

    move-object/from16 v17, v13

    move-object v13, v5

    .end local v4    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v5    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v7    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v2    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v3    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v8, "maxSupportedFps":I
    .restart local v12    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v13, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v17, "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    move-object/from16 v6, v19

    .line 1008
    .end local v19    # "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local v6, "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    :goto_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "orderedSurfaceConfigListForStreamUseCase = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v10, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 988
    .end local v2    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v3    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .end local v12    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v4    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v5    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v7    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v8, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v13, "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local v17, "maxSupportedFps":I
    :cond_7
    move-object/from16 v1, p1

    move-object v12, v4

    move-object v2, v7

    move-object v3, v8

    move/from16 v8, v17

    move-object/from16 v17, v13

    move-object v13, v5

    .line 1012
    .end local v4    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v5    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v7    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v2    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v3    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v8, "maxSupportedFps":I
    .restart local v12    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v13, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v17, "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    :goto_5
    move-object/from16 v4, p5

    move-object/from16 v7, p6

    move/from16 v9, p7

    move-object/from16 v19, v11

    move-object/from16 v18, v14

    move-object v5, v15

    move-object v15, v2

    move-object v14, v3

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    .end local v2    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v3    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v5, "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .local v14, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v15, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v18, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-direct/range {v0 .. v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->findBestSizesAndFps(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/Map;IZ)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;

    move-result-object v11

    .line 1018
    .local v11, "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "resolveSpecsBySettings: bestSizesAndFps = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v10, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1020
    invoke-virtual {v11}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getBestSizes()Ljava/util/List;

    move-result-object v1

    .line 1021
    .local v1, "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-virtual {v11}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getMaxFpsForBestSizes()I

    move-result v4

    .line 1022
    .local v4, "savedConfigMaxFps":I
    invoke-virtual {v11}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getBestSizesForStreamUseCase()Ljava/util/List;

    move-result-object v7

    .line 1023
    .local v7, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-virtual {v11}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getMaxFpsForStreamUseCase()I

    move-result v9

    .line 1024
    .local v9, "savedConfigMaxFpsForStreamUseCase":I
    invoke-virtual {v11}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getMaxFpsForAllSizes()I

    move-result v10

    .line 1027
    .local v10, "savedMaxFpsForAllSizes":I
    if-eqz v1, :cond_13

    .line 1028
    sget-object v19, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    .line 1029
    .local v19, "targetFrameRateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move-object/from16 v20, v5

    .end local v5    # "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .local v20, "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    sget-object v5, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    move/from16 v21, v8

    .end local v8    # "maxSupportedFps":I
    .local v21, "maxSupportedFps":I
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_b

    .line 1030
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 1031
    iget-object v5, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    invoke-virtual {v5, v1}, Landroidx/camera/camera2/internal/HighSpeedResolver;->getFrameRateRangesFor(Ljava/util/List;)[Landroid/util/Range;

    move-result-object v5

    goto :goto_6

    .line 1032
    :cond_8
    iget-object v5, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v8, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v5, v8}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Landroid/util/Range;

    :goto_6
    nop

    .line 1033
    .local v5, "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    nop

    .line 1034
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v8

    .line 1033
    invoke-direct {v0, v8, v4, v5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getClosestSupportedDeviceFrameRate(Landroid/util/Range;I[Landroid/util/Range;)Landroid/util/Range;

    move-result-object v8

    .line 1037
    .end local v19    # "targetFrameRateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v8, "targetFrameRateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isFeatureComboInvocation()Z

    move-result v19

    if-nez v19, :cond_a

    .line 1038
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isStrictFpsRequired()Z

    move-result v19

    if-eqz v19, :cond_9

    goto :goto_7

    :cond_9
    move/from16 v24, v10

    move-object/from16 v23, v11

    goto :goto_8

    .line 1039
    :cond_a
    :goto_7
    nop

    .line 1040
    move-object/from16 v22, v5

    .end local v5    # "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v22, "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v5

    invoke-virtual {v8, v5}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v5

    move-object/from16 v23, v11

    .end local v11    # "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .local v23, "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v24, v10

    .end local v10    # "savedMaxFpsForAllSizes":I
    .local v24, "savedMaxFpsForAllSizes":I
    const-string v10, "Target FPS range "

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 1041
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " is not supported. Max FPS supported by the calculated best combination: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ". Calculated best FPS range for device: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ". Device supported FPS ranges: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 1046
    invoke-static/range {v22 .. v22}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1039
    invoke-static {v5, v10}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 1048
    .end local v22    # "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    :goto_8
    goto :goto_9

    .line 1049
    .end local v8    # "targetFrameRateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v23    # "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .end local v24    # "savedMaxFpsForAllSizes":I
    .restart local v10    # "savedMaxFpsForAllSizes":I
    .restart local v11    # "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .restart local v19    # "targetFrameRateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_b
    move/from16 v24, v10

    move-object/from16 v23, v11

    .end local v10    # "savedMaxFpsForAllSizes":I
    .end local v11    # "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .restart local v23    # "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .restart local v24    # "savedMaxFpsForAllSizes":I
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 1053
    iget-object v5, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    invoke-virtual {v5, v1}, Landroidx/camera/camera2/internal/HighSpeedResolver;->getFrameRateRangesFor(Ljava/util/List;)[Landroid/util/Range;

    move-result-object v5

    .line 1055
    .restart local v5    # "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v8, Landroidx/camera/camera2/internal/HighSpeedResolver;->DEFAULT_FPS:Landroid/util/Range;

    invoke-direct {v0, v8, v4, v5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getClosestSupportedDeviceFrameRate(Landroid/util/Range;I[Landroid/util/Range;)Landroid/util/Range;

    move-result-object v19

    move-object/from16 v8, v19

    goto :goto_9

    .line 1049
    .end local v5    # "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_c
    move-object/from16 v8, v19

    .line 1059
    .end local v19    # "targetFrameRateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .restart local v8    # "targetFrameRateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :goto_9
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_f

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1060
    .local v10, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    nop

    .line 1061
    invoke-interface {v3, v10}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    move-object/from16 v19, v5

    move-object/from16 v5, p5

    invoke-interface {v5, v11}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v11

    .line 1060
    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/util/Size;

    .line 1062
    .local v11, "resolutionForUseCase":Landroid/util/Size;
    invoke-static {v11}, Landroidx/camera/core/impl/StreamSpec;->builder(Landroid/util/Size;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 1064
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v22

    if-eqz v22, :cond_d

    const/16 v22, 0x1

    move-object/from16 v25, v11

    move/from16 v11, v22

    goto :goto_b

    .line 1065
    :cond_d
    const/16 v22, 0x0

    move-object/from16 v25, v11

    move/from16 v11, v22

    .line 1063
    .end local v11    # "resolutionForUseCase":Landroid/util/Size;
    .local v25, "resolutionForUseCase":Landroid/util/Size;
    :goto_b
    invoke-virtual {v5, v11}, Landroidx/camera/core/impl/StreamSpec$Builder;->setSessionType(I)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 1067
    move-object/from16 v11, p6

    invoke-interface {v11, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroidx/camera/core/DynamicRange;

    .line 1066
    invoke-static/range {v22 .. v22}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v11, v22

    check-cast v11, Landroidx/camera/core/DynamicRange;

    invoke-virtual {v5, v11}, Landroidx/camera/core/impl/StreamSpec$Builder;->setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 1069
    invoke-static {v10}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getStreamSpecImplementationOptions(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v11

    .line 1068
    invoke-virtual {v5, v11}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 1071
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->hasVideoCapture()Z

    move-result v11

    invoke-virtual {v5, v11}, Landroidx/camera/core/impl/StreamSpec$Builder;->setZslDisabled(Z)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 1072
    .local v5, "streamSpecBuilder":Landroidx/camera/core/impl/StreamSpec$Builder;
    sget-object v11, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v11, v8}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_e

    .line 1073
    invoke-virtual {v5, v8}, Landroidx/camera/core/impl/StreamSpec$Builder;->setExpectedFrameRateRange(Landroid/util/Range;)Landroidx/camera/core/impl/StreamSpec$Builder;

    .line 1075
    :cond_e
    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v11

    invoke-interface {v13, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1076
    .end local v5    # "streamSpecBuilder":Landroidx/camera/core/impl/StreamSpec$Builder;
    .end local v10    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v25    # "resolutionForUseCase":Landroid/util/Size;
    move-object/from16 v5, v19

    goto :goto_a

    .line 1077
    .end local v8    # "targetFrameRateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_f
    nop

    .line 1087
    if-eqz v6, :cond_12

    if-ne v4, v9, :cond_12

    .line 1089
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-ne v5, v8, :cond_12

    .line 1090
    const/4 v5, 0x0

    .line 1091
    .local v5, "hasDifferenceSavedSizes":Z
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_c
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    if-ge v8, v10, :cond_11

    .line 1092
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/util/Size;

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_10

    .line 1093
    const/4 v5, 0x1

    .line 1094
    goto :goto_d

    .line 1091
    :cond_10
    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    .line 1097
    .end local v8    # "i":I
    :cond_11
    :goto_d
    if-nez v5, :cond_12

    .line 1098
    iget-object v8, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 1099
    invoke-static {v8, v2, v13, v12}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->populateStreamUseCaseStreamSpecOptionWithInteropOverride(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Z

    move-result v8

    .line 1102
    .local v8, "hasStreamUseCaseOverride":Z
    if-nez v8, :cond_12

    .line 1103
    nop

    .line 1104
    invoke-static {v13, v12, v15, v14, v6}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)V

    .line 1112
    .end local v5    # "hasDifferenceSavedSizes":Z
    .end local v8    # "hasStreamUseCaseOverride":Z
    :cond_12
    new-instance v5, Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;

    move/from16 v8, v24

    .end local v24    # "savedMaxFpsForAllSizes":I
    .local v8, "savedMaxFpsForAllSizes":I
    invoke-direct {v5, v13, v12, v8}, Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;-><init>(Ljava/util/Map;Ljava/util/Map;I)V

    return-object v5

    .line 1078
    .end local v20    # "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v21    # "maxSupportedFps":I
    .end local v23    # "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .local v5, "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .local v8, "maxSupportedFps":I
    .local v10, "savedMaxFpsForAllSizes":I
    .local v11, "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    :cond_13
    move-object/from16 v20, v5

    move/from16 v21, v8

    move v8, v10

    move-object/from16 v23, v11

    .end local v5    # "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v10    # "savedMaxFpsForAllSizes":I
    .end local v11    # "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .local v8, "savedMaxFpsForAllSizes":I
    .restart local v20    # "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .restart local v21    # "maxSupportedFps":I
    .restart local v23    # "bestSizesAndFps":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v11, v19

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " and Hardware level: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHardwareLevel:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ". May be the specified resolution is too large and not supported. Existing surfaces: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " New configs: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v5, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private updateMaximumSizeByFormat(Ljava/util/Map;ILandroid/util/Rational;)V
    .locals 3
    .param p2, "format"    # I
    .param p3, "aspectRatio"    # Landroid/util/Rational;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;I",
            "Landroid/util/Rational;",
            ")V"
        }
    .end annotation

    .line 2031
    .local p1, "sizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 2032
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->toStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    .line 2033
    .local v0, "originalMap":Landroid/hardware/camera2/params/StreamConfigurationMap;
    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1, p3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxOutputSizeByFormat(Landroid/hardware/camera2/params/StreamConfigurationMap;IZLandroid/util/Rational;)Landroid/util/Size;

    move-result-object v1

    .line 2034
    .local v1, "maxOutputSize":Landroid/util/Size;
    if-eqz v1, :cond_0

    .line 2035
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2037
    :cond_0
    return-void
.end method

.method private updateS720pOrS1440pSizeByFormat(Ljava/util/Map;Landroid/util/Size;I)V
    .locals 5
    .param p2, "targetSize"    # Landroid/util/Size;
    .param p3, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            "I)V"
        }
    .end annotation

    .line 2014
    .local p1, "sizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsConcurrentCameraModeSupported:Z

    if-nez v0, :cond_0

    .line 2015
    return-void

    .line 2018
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 2019
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->toStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    .line 2020
    .local v0, "originalMap":Landroid/hardware/camera2/params/StreamConfigurationMap;
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, p3, v2, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxOutputSizeByFormat(Landroid/hardware/camera2/params/StreamConfigurationMap;IZLandroid/util/Rational;)Landroid/util/Size;

    move-result-object v1

    .line 2021
    .local v1, "maxOutputSize":Landroid/util/Size;
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    if-nez v1, :cond_1

    move-object v2, p2

    goto :goto_0

    .line 2022
    :cond_1
    const/4 v4, 0x2

    new-array v4, v4, [Landroid/util/Size;

    aput-object p2, v4, v2

    const/4 v2, 0x1

    aput-object v1, v4, v2

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    new-instance v4, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v4}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    invoke-static {v2, v4}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 2021
    :goto_0
    invoke-interface {p1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2024
    return-void
.end method

.method private updateUltraMaximumSizeByFormat(Ljava/util/Map;I)V
    .locals 4
    .param p2, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;I)V"
        }
    .end annotation

    .line 2044
    .local p1, "sizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_2

    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsUltraHighResolutionSensorSupported:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 2048
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP_MAXIMUM_RESOLUTION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 2051
    .local v0, "maximumResolutionMap":Landroid/hardware/camera2/params/StreamConfigurationMap;
    if-nez v0, :cond_1

    .line 2052
    return-void

    .line 2055
    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, v0, p2, v2, v3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxOutputSizeByFormat(Landroid/hardware/camera2/params/StreamConfigurationMap;IZLandroid/util/Rational;)Landroid/util/Size;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2056
    return-void

    .line 2045
    .end local v0    # "maximumResolutionMap":Landroid/hardware/camera2/params/StreamConfigurationMap;
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method applyResolutionSelectionOrderRelatedWorkarounds(Ljava/util/List;I)Ljava/util/List;
    .locals 7
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 1672
    .local p1, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mTargetAspectRatio:Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;->get(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)I

    move-result v0

    .line 1675
    .local v0, "targetAspectRatio":I
    packed-switch v0, :pswitch_data_0

    .line 1692
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Undefined targetAspectRatio: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 1689
    :pswitch_0
    const/4 v1, 0x0

    .line 1690
    .local v1, "ratio":Landroid/util/Rational;
    goto :goto_1

    .line 1683
    .end local v1    # "ratio":Landroid/util/Rational;
    :pswitch_1
    const/16 v1, 0x100

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v2

    .line 1684
    invoke-virtual {v2, v1}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximumSize(I)Landroid/util/Size;

    move-result-object v1

    .line 1685
    .local v1, "maxJpegSize":Landroid/util/Size;
    if-nez v1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Landroid/util/Rational;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    .line 1686
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Rational;-><init>(II)V

    :goto_0
    nop

    .line 1687
    .local v2, "ratio":Landroid/util/Rational;
    move-object v1, v2

    goto :goto_1

    .line 1680
    .end local v1    # "maxJpegSize":Landroid/util/Size;
    .end local v2    # "ratio":Landroid/util/Rational;
    :pswitch_2
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    .line 1681
    .local v1, "ratio":Landroid/util/Rational;
    goto :goto_1

    .line 1677
    .end local v1    # "ratio":Landroid/util/Rational;
    :pswitch_3
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    .line 1678
    .restart local v1    # "ratio":Landroid/util/Rational;
    nop

    .line 1697
    :goto_1
    if-nez v1, :cond_1

    .line 1698
    move-object v2, p1

    .local v2, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_4

    .line 1700
    .end local v2    # "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1701
    .local v2, "aspectRatioMatchedSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1703
    .local v3, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Size;

    .line 1704
    .local v5, "size":Landroid/util/Size;
    invoke-static {v5, v1}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1705
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1707
    :cond_2
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1709
    .end local v5    # "size":Landroid/util/Size;
    :goto_3
    goto :goto_2

    .line 1710
    :cond_3
    const/4 v4, 0x0

    invoke-interface {v3, v4, v2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    move-object v2, v3

    .line 1714
    .end local v3    # "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v2, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_4
    iget-object v3, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    .line 1715
    invoke-static {p2}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigType(I)Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    move-result-object v4

    .line 1714
    invoke-virtual {v3, v4, v2}, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;->insertOrPrioritize(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    return-object v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method checkSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;)Z
    .locals 5
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .line 260
    .local p2, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local p3, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .local p4, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p5, "useCasePriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .line 262
    .local v0, "isSupported":Z
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getSurfaceCombinationsByFeatureSettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SurfaceCombination;

    .line 264
    .local v2, "surfaceCombination":Landroidx/camera/core/impl/SurfaceCombination;
    invoke-virtual {v2, p2}, Landroidx/camera/core/impl/SurfaceCombination;->getOrderedSupportedSurfaceConfigList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    move v0, v3

    .line 267
    if-eqz v0, :cond_1

    .line 268
    goto :goto_2

    .line 270
    .end local v2    # "surfaceCombination":Landroidx/camera/core/impl/SurfaceCombination;
    :cond_1
    goto :goto_0

    .line 272
    :cond_2
    :goto_2
    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->requiresFeatureComboQuery()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 273
    invoke-direct/range {p0 .. p5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->createFeatureComboSessionConfig(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;)Landroidx/camera/core/impl/SessionConfig;

    move-result-object v1

    .line 276
    move-object v2, p5

    move-object p5, p4

    move-object p4, p3

    move-object p3, p2

    move-object p2, p1

    move-object p1, p0

    .end local p1    # "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .local v1, "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    .local v2, "useCasePriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .local p3, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local p4, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .local p5, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    iget-object v3, p1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureCombinationQuery:Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;

    invoke-interface {v3, v1}, Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;->isSupported(Landroidx/camera/core/impl/SessionConfig;)Z

    move-result v0

    .line 279
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/DeferrableSurface;

    .line 280
    .local v4, "surface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-virtual {v4}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 281
    .end local v4    # "surface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_3

    .line 272
    .end local v1    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    .end local v2    # "useCasePriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local p1    # "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .local p2, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local p3, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .local p4, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p5, "useCasePriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_3
    move-object v2, p5

    move-object p5, p4

    move-object p4, p3

    move-object p3, p2

    move-object p2, p1

    move-object p1, p0

    .line 284
    .end local p1    # "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .restart local v2    # "useCasePriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .local p3, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local p4, "dynamicRangesBySurfaceConfig":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig;Landroidx/camera/core/DynamicRange;>;"
    .local p5, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :cond_4
    return v0
.end method

.method filterSupportedSizes(Ljava/util/Map;Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Z)Ljava/util/Map;
    .locals 13
    .param p2, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .param p3, "forceUniqueMaxFpsFiltering"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Z)",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 1519
    .local p1, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1521
    .local v0, "filteredUseCaseConfigToSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1522
    .local v2, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v12, v3

    .line 1523
    .local v12, "reducedSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 1525
    .local v11, "configSizeUniqueMaxFpsMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;Ljava/util/Set<Ljava/lang/Integer;>;>;"
    nop

    .line 1526
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 1525
    invoke-static {v3}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Landroid/util/Size;

    .line 1527
    .local v7, "size":Landroid/util/Size;
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v8

    .line 1528
    .local v8, "imageFormat":I
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->getStreamUseCase()Landroidx/camera/core/impl/StreamUseCase;

    move-result-object v9

    .line 1529
    .local v9, "streamUseCase":Landroidx/camera/core/impl/StreamUseCase;
    nop

    .line 1530
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getTargetFpsRange()Landroid/util/Range;

    move-result-object v6

    .line 1529
    move-object v4, p0

    move-object v5, p2

    move/from16 v10, p3

    invoke-direct/range {v4 .. v12}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->populateReducedSizeListAndUniqueMaxFpsMap(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Landroid/util/Range;Landroid/util/Size;ILandroidx/camera/core/impl/StreamUseCase;ZLjava/util/Map;Ljava/util/List;)V

    .line 1532
    .end local v7    # "size":Landroid/util/Size;
    .end local v8    # "imageFormat":I
    .end local v9    # "streamUseCase":Landroidx/camera/core/impl/StreamUseCase;
    goto :goto_1

    .line 1533
    :cond_0
    invoke-interface {v0, v2, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1534
    .end local v2    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v11    # "configSizeUniqueMaxFpsMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;Ljava/util/Set<Ljava/lang/Integer;>;>;"
    .end local v12    # "reducedSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 1535
    :cond_1
    return-object v0
.end method

.method getOrderedSupportedStreamUseCaseSurfaceConfigList(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Ljava/util/List;
    .locals 7
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;"
        }
    .end annotation

    .line 338
    .local p2, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local p3, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p4, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-static {p1}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->shouldUseStreamUseCase(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 339
    return-object v1

    .line 342
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsStreamUseCase:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SurfaceCombination;

    .line 343
    .local v2, "surfaceCombination":Landroidx/camera/core/impl/SurfaceCombination;
    nop

    .line 344
    invoke-virtual {v2, p2}, Landroidx/camera/core/impl/SurfaceCombination;->getOrderedSupportedSurfaceConfigList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 345
    .local v3, "orderedSurfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    if-eqz v3, :cond_1

    .line 346
    invoke-static {p3, p4, v3}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->areCaptureTypesEligible(Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)Z

    move-result v4

    .line 349
    .local v4, "captureTypesEligible":Z
    new-instance v5, Lkotlin/UnsafeLazyImpl;

    new-instance v6, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$$ExternalSyntheticLambda0;

    invoke-direct {v6, p0, v3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/SupportedSurfaceCombination;Ljava/util/List;)V

    invoke-direct {v5, v6}, Lkotlin/UnsafeLazyImpl;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 353
    .local v5, "streamUseCasesAvailableForSurfaceConfigs":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    if-eqz v4, :cond_1

    invoke-interface {v5}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 355
    return-object v3

    .line 358
    .end local v2    # "surfaceCombination":Landroidx/camera/core/impl/SurfaceCombination;
    .end local v3    # "orderedSurfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .end local v4    # "captureTypesEligible":Z
    .end local v5    # "streamUseCasesAvailableForSurfaceConfigs":Lkotlin/Lazy;, "Lkotlin/Lazy<Ljava/lang/Boolean;>;"
    :cond_1
    goto :goto_0

    .line 359
    :cond_2
    return-object v1
.end method

.method getSuggestedStreamSpecifications(ILjava/util/List;Ljava/util/Map;ZZZZ)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;
    .locals 17
    .param p1, "cameraMode"    # I
    .param p4, "isPreviewStabilizationOn"    # Z
    .param p5, "hasVideoCapture"    # Z
    .param p6, "isFeatureComboInvocation"    # Z
    .param p7, "findMaxSupportedFrameRate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;ZZZZ)",
            "Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;"
        }
    .end annotation

    .line 755
    .local p2, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    move-object/from16 v0, p0

    move-object/from16 v11, p2

    invoke-direct {v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->refreshPreviewSize()V

    .line 757
    nop

    .line 758
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 757
    invoke-static {v11, v1}, Landroidx/camera/camera2/internal/HighSpeedResolver;->isHighSpeedOn(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v6

    .line 761
    .local v6, "isHighSpeedOn":Z
    if-eqz v6, :cond_0

    .line 762
    iget-object v1, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHighSpeedResolver:Landroidx/camera/camera2/internal/HighSpeedResolver;

    move-object/from16 v2, p3

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/HighSpeedResolver;->filterCommonSupportedSizes(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    move-object v12, v1

    .end local p3    # "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local v1, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    goto :goto_0

    .line 761
    .end local v1    # "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .restart local p3    # "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    :cond_0
    move-object/from16 v2, p3

    move-object v12, v2

    .line 766
    .end local p3    # "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local v12, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    :goto_0
    new-instance v5, Ljava/util/ArrayList;

    .line 767
    invoke-interface {v12}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v5, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v13, v5

    .line 770
    .local v13, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-static {v13}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUseCasesPriorityOrder(Ljava/util/List;)Ljava/util/List;

    move-result-object v14

    .line 771
    .local v14, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v1, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDynamicRangeResolver:Landroidx/camera/camera2/internal/DynamicRangeResolver;

    .line 772
    invoke-virtual {v1, v11, v13, v14}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->resolveAndValidateDynamicRanges(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ljava/util/Map;

    move-result-object v3

    .line 775
    .local v3, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "resolvedDynamicRanges = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SupportedSurfaceCombination"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 777
    invoke-static {v11, v12}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->isUltraHdrOn(Ljava/util/List;Ljava/util/Map;)Z

    move-result v4

    .line 782
    .local v4, "isUltraHdrOn":Z
    if-eqz p7, :cond_1

    .line 785
    const/4 v1, 0x0

    .line 786
    .local v1, "isStrictFpsRequired":Z
    sget-object v2, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    move v10, v1

    move-object v9, v2

    .local v2, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    goto :goto_1

    .line 788
    .end local v1    # "isStrictFpsRequired":Z
    .end local v2    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_1
    invoke-direct {v0, v11, v13}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->isStrictFpsRequired(Ljava/util/List;Ljava/util/List;)Z

    move-result v1

    .line 789
    .restart local v1    # "isStrictFpsRequired":Z
    invoke-direct {v0, v11, v13, v14, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getTargetFpsRange(Ljava/util/List;Ljava/util/List;Ljava/util/List;Z)Landroid/util/Range;

    move-result-object v2

    move v10, v1

    move-object v9, v2

    .line 794
    .end local v1    # "isStrictFpsRequired":Z
    .local v9, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v10, "isStrictFpsRequired":Z
    :goto_1
    if-eqz p4, :cond_3

    iget-boolean v1, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsPreviewStabilizationSupported:Z

    if-nez v1, :cond_3

    .line 798
    if-nez p6, :cond_2

    goto :goto_2

    .line 799
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Preview stabilization is not supported by the camera."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 804
    :cond_3
    :goto_2
    const/4 v8, 0x0

    move/from16 v1, p1

    move/from16 v2, p5

    move/from16 v7, p6

    move v5, v4

    move/from16 v4, p4

    .end local v4    # "isUltraHdrOn":Z
    .local v5, "isUltraHdrOn":Z
    invoke-direct/range {v0 .. v10}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->createFeatureSettings(IZLjava/util/Map;ZZZZZLandroid/util/Range;Z)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    move-result-object v8

    .line 809
    move-object v7, v3

    move v4, v5

    move-object v2, v9

    move v9, v6

    .line 810
    .end local v3    # "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    .end local v5    # "isUltraHdrOn":Z
    .end local v6    # "isHighSpeedOn":Z
    .restart local v2    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .restart local v4    # "isUltraHdrOn":Z
    .local v7, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    .local v8, "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .local v9, "isHighSpeedOn":Z
    invoke-interface {v7}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    .line 809
    move-object/from16 v0, p0

    move/from16 v3, p4

    move/from16 v5, p6

    invoke-direct/range {v0 .. v5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getCheckingMethod(Ljava/util/Collection;Landroid/util/Range;ZZZ)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;

    move-result-object v1

    .line 813
    move-object/from16 v16, v2

    move v15, v4

    .end local v2    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v4    # "isUltraHdrOn":Z
    .local v1, "checkingMethod":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;
    .local v15, "isUltraHdrOn":Z
    .local v16, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move-object v2, v8

    move-object v3, v11

    move-object v4, v12

    move-object v5, v13

    move-object v6, v14

    move/from16 v8, p7

    .end local v8    # "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .end local v12    # "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v13    # "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .end local v14    # "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v2, "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .local v4, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local v5, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v6, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-direct/range {v0 .. v8}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->resolveSpecsByCheckingMethod(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$CheckingMethod;Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Z)Landroidx/camera/core/impl/SurfaceStreamSpecQueryResult;

    move-result-object v11

    return-object v11
.end method

.method getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;
    .locals 2
    .param p1, "format"    # I

    .line 1983
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinitionFormats:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1984
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS720pSizeMap()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_720P:Landroid/util/Size;

    invoke-direct {p0, v0, v1, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateS720pOrS1440pSizeByFormat(Ljava/util/Map;Landroid/util/Size;I)V

    .line 1986
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS1440pSizeMap()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_1440P:Landroid/util/Size;

    invoke-direct {p0, v0, v1, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateS720pOrS1440pSizeByFormat(Ljava/util/Map;Landroid/util/Size;I)V

    .line 1988
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximumSizeMap()Ljava/util/Map;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateMaximumSizeByFormat(Ljava/util/Map;ILandroid/util/Rational;)V

    .line 1989
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximum4x3SizeMap()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-direct {p0, v0, p1, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateMaximumSizeByFormat(Ljava/util/Map;ILandroid/util/Rational;)V

    .line 1991
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximum16x9SizeMap()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-direct {p0, v0, p1, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateMaximumSizeByFormat(Ljava/util/Map;ILandroid/util/Rational;)V

    .line 1993
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getUltraMaximumSizeMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateUltraMaximumSizeByFormat(Ljava/util/Map;I)V

    .line 1994
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinitionFormats:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1996
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    return-object v0
.end method

.method synthetic lambda$findBestSizesAndFps$1$androidx-camera-camera2-internal-SupportedSurfaceCombination(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .param p2, "surfaceConfigList"    # Ljava/util/List;
    .param p3, "dynamicRangesBySurfaceConfig"    # Ljava/util/Map;
    .param p4, "newUseCaseConfigs"    # Ljava/util/List;
    .param p5, "useCasesPriorityOrder"    # Ljava/util/List;

    .line 1208
    invoke-virtual/range {p0 .. p5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->checkSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$getOrderedSupportedStreamUseCaseSurfaceConfigList$0$androidx-camera-camera2-internal-SupportedSurfaceCombination(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "orderedSurfaceConfigList"    # Ljava/util/List;

    .line 350
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0, p1}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->areStreamUseCasesAvailableForSurfaceConfigs(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/List;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method transformSurfaceConfig(IILandroid/util/Size;Landroidx/camera/core/impl/StreamUseCase;)Landroidx/camera/core/impl/SurfaceConfig;
    .locals 6
    .param p1, "cameraMode"    # I
    .param p2, "imageFormat"    # I
    .param p3, "size"    # Landroid/util/Size;
    .param p4, "streamUseCase"    # Landroidx/camera/core/impl/StreamUseCase;

    .line 434
    nop

    .line 437
    invoke-virtual {p0, p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v2

    sget-object v4, Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;->CAPTURE_SESSION_TABLES:Landroidx/camera/core/impl/SurfaceConfig$ConfigSource;

    .line 434
    move v3, p1

    move v0, p2

    move-object v1, p3

    move-object v5, p4

    .end local p1    # "cameraMode":I
    .end local p2    # "imageFormat":I
    .end local p3    # "size":Landroid/util/Size;
    .end local p4    # "streamUseCase":Landroidx/camera/core/impl/StreamUseCase;
    .local v0, "imageFormat":I
    .local v1, "size":Landroid/util/Size;
    .local v3, "cameraMode":I
    .local v5, "streamUseCase":Landroidx/camera/core/impl/StreamUseCase;
    invoke-static/range {v0 .. v5}, Landroidx/camera/core/impl/SurfaceConfig;->transformSurfaceConfig(ILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;ILandroidx/camera/core/impl/SurfaceConfig$ConfigSource;Landroidx/camera/core/impl/StreamUseCase;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object p1

    return-object p1
.end method
