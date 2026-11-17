.class public final synthetic Landroidx/camera/core/internal/StreamSpecsCalculator$-CC;
.super Ljava/lang/Object;
.source "StreamSpecsCalculator.kt"


# direct methods
.method public static $default$setCameraDeviceSurfaceManager(Landroidx/camera/core/internal/StreamSpecsCalculator;Landroidx/camera/core/impl/CameraDeviceSurfaceManager;)V
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/internal/StreamSpecsCalculator;
    .param p1, "cameraDeviceSurfaceManager"    # Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    .line 0
    const-string v0, "cameraDeviceSurfaceManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Landroidx/camera/core/internal/StreamSpecsCalculator;->Companion:Landroidx/camera/core/internal/StreamSpecsCalculator$Companion;

    return-void
.end method

.method public static synthetic calculateSuggestedStreamSpecs$default(Landroidx/camera/core/internal/StreamSpecsCalculator;ILandroidx/camera/core/impl/CameraInfoInternal;Ljava/util/List;Ljava/util/List;Landroidx/camera/core/impl/CameraConfig;ILandroid/util/Range;ZZILjava/lang/Object;)Landroidx/camera/core/internal/StreamSpecQueryResult;
    .locals 12

    .line 59
    move/from16 v0, p10

    if-nez p11, :cond_6

    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_0

    .line 63
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    move-object v6, v1

    goto :goto_0

    .line 59
    :cond_0
    move-object/from16 v6, p4

    :goto_0
    and-int/lit8 v1, v0, 0x10

    if-eqz v1, :cond_1

    .line 64
    invoke-static {}, Landroidx/camera/core/impl/CameraConfigs;->defaultConfig()Landroidx/camera/core/impl/CameraConfig;

    move-result-object v1

    move-object v7, v1

    goto :goto_1

    .line 59
    :cond_1
    move-object/from16 v7, p5

    :goto_1
    and-int/lit8 v1, v0, 0x20

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 65
    move v8, v2

    goto :goto_2

    .line 59
    :cond_2
    move/from16 v8, p6

    :goto_2
    and-int/lit8 v1, v0, 0x40

    if-eqz v1, :cond_3

    .line 66
    sget-object v1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    move-object v9, v1

    goto :goto_3

    .line 59
    :cond_3
    move-object/from16 v9, p7

    :goto_3
    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_4

    .line 67
    move v10, v2

    goto :goto_4

    .line 59
    :cond_4
    move/from16 v10, p8

    :goto_4
    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_5

    .line 68
    move v11, v2

    goto :goto_5

    .line 59
    :cond_5
    move/from16 v11, p9

    :goto_5
    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-interface/range {v2 .. v11}, Landroidx/camera/core/internal/StreamSpecsCalculator;->calculateSuggestedStreamSpecs(ILandroidx/camera/core/impl/CameraInfoInternal;Ljava/util/List;Ljava/util/List;Landroidx/camera/core/impl/CameraConfig;ILandroid/util/Range;ZZ)Landroidx/camera/core/internal/StreamSpecQueryResult;

    move-result-object p0

    return-object p0

    :cond_6
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: calculateSuggestedStreamSpecs"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
