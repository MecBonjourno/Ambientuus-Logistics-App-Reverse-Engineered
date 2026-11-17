.class public final Landroidx/camera/camera2/internal/StreamUseCaseUtil;
.super Ljava/lang/Object;
.source "StreamUseCaseUtil.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u009c\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010$\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J<\u0010\u000e\u001a\u00020\u000f2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u00112\u0010\u0010\u0013\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00140\u00112\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00080\u0016H\u0007J\u0014\u0010\u0018\u001a\u00020\u00192\n\u0010\u001a\u001a\u0006\u0012\u0002\u0008\u00030\u0014H\u0007J\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0007J\u0010\u0010\u001f\u001a\u00020\u001c2\u0006\u0010 \u001a\u00020!H\u0007JJ\u0010\"\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\u000c\u0010#\u001a\u0008\u0012\u0004\u0012\u00020%0$2\u0016\u0010&\u001a\u0012\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0014\u0012\u0004\u0012\u00020\'0\u00162\u0012\u0010(\u001a\u000e\u0012\u0004\u0012\u00020%\u0012\u0004\u0012\u00020\'0\u0016H\u0007J\u001e\u0010)\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\u000c\u0010*\u001a\u0008\u0012\u0004\u0012\u00020+0$H\u0007J&\u0010,\u001a\u00020\u001c2\u0006\u0010-\u001a\u00020\u000c2\u0006\u0010.\u001a\u00020\u00082\u000c\u0010/\u001a\u0008\u0012\u0004\u0012\u00020\u000c00H\u0002JD\u00101\u001a\u00020\u001c2\u0014\u00102\u001a\u0010\u0012\u0004\u0012\u000203\u0012\u0006\u0012\u0004\u0018\u00010%0\n2\u0016\u00104\u001a\u0012\u0012\u0004\u0012\u000203\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00140\n2\u000c\u00105\u001a\u0008\u0012\u0004\u0012\u00020+00H\u0007Jn\u00106\u001a\u00020\u000f2\u0016\u0010&\u001a\u0012\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0014\u0012\u0004\u0012\u00020\'0\u00162\u0012\u0010(\u001a\u000e\u0012\u0004\u0012\u00020%\u0012\u0004\u0012\u00020\'0\u00162\u0012\u00102\u001a\u000e\u0012\u0004\u0012\u000203\u0012\u0004\u0012\u00020%0\n2\u0016\u00104\u001a\u0012\u0012\u0004\u0012\u000203\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00140\n2\u000c\u00105\u001a\u0008\u0012\u0004\u0012\u00020+00H\u0007J!\u00107\u001a\u0004\u0018\u0001082\u0006\u00109\u001a\u0002082\u0008\u0010.\u001a\u0004\u0018\u00010\u0008H\u0002\u00a2\u0006\u0002\u0010:J(\u0010;\u001a\u00020\u001c2\u000c\u0010#\u001a\u0008\u0012\u0004\u0012\u00020%002\u0010\u0010<\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u001400H\u0007J\u0018\u0010=\u001a\u00020\u001c2\u0006\u0010>\u001a\u0002082\u0006\u0010-\u001a\u00020\u000cH\u0002J$\u0010?\u001a\u00020\u001c2\u000c\u0010@\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000b2\u000c\u0010A\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000bH\u0002J\u0008\u0010B\u001a\u00020\u000fH\u0002J6\u0010C\u001a\u00020\u001c2\u000c\u0010#\u001a\u0008\u0012\u0004\u0012\u00020%002\u0010\u0010<\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0014002\u000c\u0010D\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000bH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00078\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R \u0010\t\u001a\u0014\u0012\u0004\u0012\u00020\u0008\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000c0\u000b0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R \u0010\r\u001a\u0014\u0012\u0004\u0012\u00020\u0008\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000c0\u000b0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006E"
    }
    d2 = {
        "Landroidx/camera/camera2/internal/StreamUseCaseUtil;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "STREAM_USE_CASE_STREAM_SPEC_OPTION",
        "Landroidx/camera/core/impl/Config$Option;",
        "",
        "STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP",
        "",
        "",
        "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
        "STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP",
        "populateSurfaceToStreamUseCaseMapping",
        "",
        "sessionConfigs",
        "",
        "Landroidx/camera/core/impl/SessionConfig;",
        "useCaseConfigs",
        "Landroidx/camera/core/impl/UseCaseConfig;",
        "streamUseCaseMap",
        "",
        "Landroidx/camera/core/impl/DeferrableSurface;",
        "getStreamSpecImplementationOptions",
        "Landroidx/camera/camera2/impl/Camera2ImplConfig;",
        "useCaseConfig",
        "isStreamUseCaseSupported",
        "",
        "characteristicsCompat",
        "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
        "shouldUseStreamUseCase",
        "featureSettings",
        "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
        "populateStreamUseCaseStreamSpecOptionWithInteropOverride",
        "attachedSurfaces",
        "",
        "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
        "suggestedStreamSpecMap",
        "Landroidx/camera/core/impl/StreamSpec;",
        "attachedSurfaceStreamSpecMap",
        "areStreamUseCasesAvailableForSurfaceConfigs",
        "surfaceConfigs",
        "Landroidx/camera/core/impl/SurfaceConfig;",
        "isEligibleCaptureType",
        "captureType",
        "streamUseCase",
        "streamSharingTypes",
        "",
        "areCaptureTypesEligible",
        "surfaceConfigIndexAttachedSurfaceInfoMap",
        "",
        "surfaceConfigIndexUseCaseConfigMap",
        "surfaceConfigsWithStreamUseCase",
        "populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs",
        "getUpdatedImplementationOptionsWithUseCaseStreamSpecOption",
        "Landroidx/camera/core/impl/Config;",
        "oldImplementationOptions",
        "(Landroidx/camera/core/impl/Config;Ljava/lang/Long;)Landroidx/camera/core/impl/Config;",
        "containsZslUseCase",
        "newUseCaseConfigs",
        "isZslUseCase",
        "config",
        "areStreamUseCasesAvailable",
        "availableStreamUseCasesSet",
        "streamUseCases",
        "throwInvalidCamera2InteropOverrideException",
        "isValidCamera2InteropOverride",
        "availableStreamUseCases",
        "camera-camera2_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

.field public static final STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "StreamUseCaseUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 13

    new-instance v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;-><init>()V

    sput-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    .line 55
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v1, "camera2.streamSpec.streamUseCase"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    const-string v1, "create(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 58
    invoke-static {}, Lkotlin/collections/MapsKt;->createMapBuilder()Ljava/util/Map;

    move-result-object v0

    move-object v1, v0

    .local v1, "$this$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP_u24lambda_u240":Ljava/util/Map;
    const/4 v2, 0x0

    .line 59
    .local v2, "$i$a$-buildMap-StreamUseCaseUtil$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP$1":I
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const-wide/16 v4, 0x3

    .line 81
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 59
    const-wide/16 v5, 0x4

    .line 61
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 59
    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/16 v10, 0x21

    if-lt v3, v10, :cond_0

    .line 60
    nop

    .line 61
    nop

    .line 63
    new-array v3, v6, [Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    sget-object v11, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->PREVIEW:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v11, v3, v9

    .line 64
    sget-object v11, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->METERING_REPEATING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v11, v3, v8

    .line 63
    nop

    .line 65
    sget-object v11, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->IMAGE_ANALYSIS:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v11, v3, v7

    .line 63
    nop

    .line 62
    invoke-static {v3}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    .line 60
    invoke-interface {v1, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    nop

    .line 69
    const-wide/16 v11, 0x1

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 71
    new-array v11, v6, [Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    sget-object v12, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->PREVIEW:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v12, v11, v9

    .line 72
    sget-object v12, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->METERING_REPEATING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v12, v11, v8

    .line 71
    nop

    .line 73
    sget-object v12, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->IMAGE_ANALYSIS:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v12, v11, v7

    .line 71
    nop

    .line 70
    invoke-static {v11}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v11

    .line 68
    invoke-interface {v1, v3, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    nop

    .line 77
    const-wide/16 v11, 0x2

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 78
    sget-object v11, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->IMAGE_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-static {v11}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v11

    .line 76
    invoke-interface {v1, v3, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    nop

    .line 81
    nop

    .line 82
    sget-object v3, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->VIDEO_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-static {v3}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    .line 80
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    :cond_0
    nop

    .line 58
    .end local v1    # "$this$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP_u24lambda_u240":Ljava/util/Map;
    .end local v2    # "$i$a$-buildMap-StreamUseCaseUtil$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP$1":I
    invoke-static {v0}, Lkotlin/collections/MapsKt;->build(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    .line 89
    invoke-static {}, Lkotlin/collections/MapsKt;->createMapBuilder()Ljava/util/Map;

    move-result-object v0

    move-object v1, v0

    .local v1, "$this$STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP_u24lambda_u241":Ljava/util/Map;
    const/4 v2, 0x0

    .line 90
    .local v2, "$i$a$-buildMap-StreamUseCaseUtil$STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP$1":I
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v10, :cond_1

    .line 91
    nop

    .line 92
    nop

    .line 93
    new-array v3, v6, [Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    sget-object v6, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->PREVIEW:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v6, v3, v9

    sget-object v6, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->IMAGE_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v6, v3, v8

    sget-object v6, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->VIDEO_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v6, v3, v7

    invoke-static {v3}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    .line 91
    invoke-interface {v1, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    nop

    .line 96
    nop

    .line 97
    new-array v3, v7, [Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    sget-object v5, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->PREVIEW:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v5, v3, v9

    sget-object v5, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->VIDEO_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    aput-object v5, v3, v8

    invoke-static {v3}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    .line 95
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    :cond_1
    nop

    .line 89
    .end local v1    # "$this$STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP_u24lambda_u241":Ljava/util/Map;
    .end local v2    # "$i$a$-buildMap-StreamUseCaseUtil$STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP$1":I
    invoke-static {v0}, Lkotlin/collections/MapsKt;->build(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final areCaptureTypesEligible(Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)Z
    .locals 11
    .param p0, "surfaceConfigIndexAttachedSurfaceInfoMap"    # Ljava/util/Map;
    .param p1, "surfaceConfigIndexUseCaseConfigMap"    # Ljava/util/Map;
    .param p2, "surfaceConfigsWithStreamUseCase"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "+",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "+",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;)Z"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string/jumbo v0, "surfaceConfigIndexAttachedSurfaceInfoMap"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "surfaceConfigIndexUseCaseConfigMap"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "surfaceConfigsWithStreamUseCase"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 402
    const/4 v0, 0x0

    .local v0, "i":I
    move-object v1, p2

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    :goto_0
    const/4 v2, 0x1

    if-ge v0, v1, :cond_5

    .line 404
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/SurfaceConfig;

    invoke-virtual {v3}, Landroidx/camera/core/impl/SurfaceConfig;->getStreamUseCase()Landroidx/camera/core/impl/StreamUseCase;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/StreamUseCase;->getValue()J

    move-result-wide v3

    .line 405
    .local v3, "streamUseCase":J
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p0, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    const-string v6, "getCaptureTypes(...)"

    const/4 v7, 0x0

    if-eqz v5, :cond_1

    .line 406
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 407
    .local v5, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    nop

    .line 408
    sget-object v8, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    .line 409
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v5}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getCaptureTypes()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-ne v9, v2, :cond_0

    .line 410
    invoke-virtual {v5}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getCaptureTypes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    goto :goto_1

    .line 411
    :cond_0
    sget-object v2, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->STREAM_SHARING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 409
    :goto_1
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 412
    nop

    .line 413
    invoke-virtual {v5}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getCaptureTypes()Ljava/util/List;

    move-result-object v9

    invoke-static {v9, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 408
    invoke-direct {v8, v2, v3, v4, v9}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isEligibleCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;JLjava/util/List;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 416
    return v7

    .line 418
    .end local v5    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    :cond_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 419
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfig;

    .line 420
    .local v2, "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    nop

    .line 421
    sget-object v5, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    .line 422
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v8

    const-string v9, "getCaptureType(...)"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 423
    nop

    .line 424
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v9

    sget-object v10, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->STREAM_SHARING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    if-ne v9, v10, :cond_2

    .line 425
    move-object v9, v2

    check-cast v9, Landroidx/camera/core/streamsharing/StreamSharingConfig;

    invoke-virtual {v9}, Landroidx/camera/core/streamsharing/StreamSharingConfig;->getCaptureTypes()Ljava/util/List;

    move-result-object v9

    invoke-static {v9, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_2

    .line 426
    :cond_2
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v9

    .line 421
    :goto_2
    invoke-direct {v5, v8, v3, v4, v9}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isEligibleCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;JLjava/util/List;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 429
    return v7

    .line 402
    .end local v2    # "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    .end local v3    # "streamUseCase":J
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 432
    .restart local v3    # "streamUseCase":J
    :cond_4
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "SurfaceConfig does not map to any use case"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 435
    .end local v0    # "i":I
    .end local v3    # "streamUseCase":J
    :cond_5
    return v2
.end method

.method private final areStreamUseCasesAvailable(Ljava/util/Set;Ljava/util/Set;)Z
    .locals 4
    .param p1, "availableStreamUseCasesSet"    # Ljava/util/Set;
    .param p2, "streamUseCases"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    .line 556
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    .line 557
    .local v1, "streamUseCase":J
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 558
    const/4 v0, 0x0

    return v0

    .line 561
    .end local v1    # "streamUseCase":J
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public static final areStreamUseCasesAvailableForSurfaceConfigs(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/List;)Z
    .locals 9
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p1, "surfaceConfigs"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;)Z"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "characteristicsCompat"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "surfaceConfigs"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 325
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 326
    return v2

    .line 329
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_STREAM_USE_CASES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    .line 328
    nop

    .line 330
    .local v0, "availableStreamUseCases":[J
    if-eqz v0, :cond_6

    array-length v1, v0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    move v1, v3

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    if-eqz v1, :cond_2

    goto :goto_2

    .line 333
    :cond_2
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    check-cast v1, Ljava/util/Set;

    .line 334
    .local v1, "availableStreamUseCaseSet":Ljava/util/Set;
    array-length v4, v0

    move v5, v2

    :goto_1
    if-ge v5, v4, :cond_3

    aget-wide v6, v0, v5

    .line 335
    .local v6, "availableStreamUseCase":J
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v1, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 334
    .end local v6    # "availableStreamUseCase":J
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 337
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/SurfaceConfig;

    .line 338
    .local v5, "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    invoke-virtual {v5}, Landroidx/camera/core/impl/SurfaceConfig;->getStreamUseCase()Landroidx/camera/core/impl/StreamUseCase;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/camera/core/impl/StreamUseCase;->getValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 339
    return v2

    .line 342
    .end local v5    # "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    :cond_5
    return v3

    .line 331
    .end local v1    # "availableStreamUseCaseSet":Ljava/util/Set;
    :cond_6
    :goto_2
    return v2
.end method

.method public static final containsZslUseCase(Ljava/util/List;Ljava/util/List;)Z
    .locals 8
    .param p0, "attachedSurfaces"    # Ljava/util/List;
    .param p1, "newUseCaseConfigs"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)Z"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "attachedSurfaces"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "newUseCaseConfigs"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 521
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 522
    .local v1, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getCaptureTypes()Ljava/util/List;

    move-result-object v4

    const-string v5, "getCaptureTypes(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 523
    .local v4, "captureTypes":Ljava/util/List;
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 524
    .local v3, "captureType":Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    sget-object v5, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v6

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {v5, v6, v3}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isZslUseCase(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 525
    return v2

    .line 528
    .end local v1    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v3    # "captureType":Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    .end local v4    # "captureTypes":Ljava/util/List;
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseConfig;

    .line 529
    .local v1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    sget-object v4, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    move-object v5, v1

    check-cast v5, Landroidx/camera/core/impl/Config;

    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v6

    const-string v7, "getCaptureType(...)"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v4, v5, v6}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isZslUseCase(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 530
    return v2

    .line 533
    .end local v1    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    :cond_3
    return v3
.end method

.method public static final getStreamSpecImplementationOptions(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/camera2/impl/Camera2ImplConfig;
    .locals 3
    .param p0, "useCaseConfig"    # Landroidx/camera/core/impl/UseCaseConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Landroidx/camera/camera2/impl/Camera2ImplConfig;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string/jumbo v0, "useCaseConfig"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 187
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    const-string v1, "create(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 188
    .local v0, "optionsBundle":Landroidx/camera/core/impl/MutableOptionsBundle;
    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 189
    nop

    .line 190
    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 191
    sget-object v2, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    .line 189
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 194
    :cond_0
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 195
    nop

    .line 196
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    .line 197
    sget-object v2, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    .line 195
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 200
    :cond_1
    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 201
    nop

    .line 202
    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    .line 203
    sget-object v2, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    .line 201
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 206
    :cond_2
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 207
    nop

    .line 208
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    .line 209
    sget-object v2, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    .line 207
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 212
    :cond_3
    new-instance v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-object v2, v0

    check-cast v2, Landroidx/camera/core/impl/Config;

    invoke-direct {v1, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig;-><init>(Landroidx/camera/core/impl/Config;)V

    return-object v1
.end method

.method private final getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;Ljava/lang/Long;)Landroidx/camera/core/impl/Config;
    .locals 3
    .param p1, "oldImplementationOptions"    # Landroidx/camera/core/impl/Config;
    .param p2, "streamUseCase"    # Ljava/lang/Long;

    .line 502
    nop

    .line 503
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 504
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    .line 505
    nop

    .line 504
    invoke-static {v0, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 508
    const/4 v0, 0x0

    return-object v0

    .line 510
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/impl/MutableOptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    const-string v1, "from(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 511
    .local v0, "optionsBundle":Landroidx/camera/core/impl/MutableOptionsBundle;
    sget-object v1, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1, p2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 512
    new-instance v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-object v2, v0

    check-cast v2, Landroidx/camera/core/impl/Config;

    invoke-direct {v1, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig;-><init>(Landroidx/camera/core/impl/Config;)V

    check-cast v1, Landroidx/camera/core/impl/Config;

    return-object v1
.end method

.method private final isEligibleCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;JLjava/util/List;)Z
    .locals 6
    .param p1, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    .param p2, "streamUseCase"    # J
    .param p4, "streamSharingTypes"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            "J",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            ">;)Z"
        }
    .end annotation

    .line 355
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 356
    return v2

    .line 358
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->STREAM_SHARING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_5

    .line 359
    nop

    .line 360
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;

    .line 361
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 360
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 364
    return v2

    .line 367
    :cond_1
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/util/Set;

    .line 366
    nop

    .line 368
    .local v0, "captureTypes":Ljava/util/Set;
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v4

    if-eq v3, v4, :cond_2

    .line 369
    return v2

    .line 371
    :cond_2
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 372
    .local v4, "childType":Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 373
    return v2

    .line 376
    .end local v4    # "childType":Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    :cond_4
    move v2, v1

    .end local v0    # "captureTypes":Ljava/util/Set;
    goto :goto_0

    .line 378
    :cond_5
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 379
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move v2, v1

    goto :goto_0

    :cond_6
    nop

    .line 358
    :goto_0
    return v2
.end method

.method public static final isStreamUseCaseSupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 4
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "characteristicsCompat"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 220
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 221
    return v2

    .line 224
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_STREAM_USE_CASES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    .line 223
    nop

    .line 225
    .local v0, "availableStreamUseCases":[J
    if-eqz v0, :cond_2

    array-length v1, v0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    move v1, v3

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    if-nez v1, :cond_2

    move v2, v3

    :cond_2
    return v2
.end method

.method private final isValidCamera2InteropOverride(Ljava/util/List;Ljava/util/List;Ljava/util/Set;)Z
    .locals 10
    .param p1, "attachedSurfaces"    # Ljava/util/List;
    .param p2, "newUseCaseConfigs"    # Ljava/util/List;
    .param p3, "availableStreamUseCases"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    .line 580
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    .line 581
    .local v0, "streamUseCases":Ljava/util/Set;
    const/4 v1, 0x0

    .line 582
    .local v1, "hasNonDefaultStreamUseCase":Z
    const/4 v2, 0x0

    .line 583
    .local v2, "hasDefaultOrNullStreamUseCase":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const-wide/16 v5, 0x0

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 584
    .local v3, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    nop

    .line 585
    invoke-virtual {v3}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 587
    const/4 v2, 0x1

    .line 588
    goto :goto_0

    .line 591
    :cond_0
    invoke-virtual {v3}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 592
    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 591
    invoke-interface {v4, v7}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    .line 590
    nop

    .line 594
    .local v7, "streamUseCaseOverride":J
    cmp-long v4, v7, v5

    if-nez v4, :cond_1

    .line 595
    const/4 v2, 0x1

    .line 596
    goto :goto_0

    .line 598
    :cond_1
    const/4 v1, 0x1

    .line 599
    nop

    .line 601
    .end local v3    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v7    # "streamUseCaseOverride":J
    :cond_2
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/UseCaseConfig;

    .line 602
    .local v4, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 603
    const/4 v2, 0x1

    .line 604
    if-eqz v1, :cond_3

    .line 605
    invoke-direct {p0}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->throwInvalidCamera2InteropOverrideException()V

    goto :goto_1

    .line 609
    :cond_4
    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    .line 608
    nop

    .line 610
    .restart local v7    # "streamUseCaseOverride":J
    cmp-long v9, v7, v5

    if-nez v9, :cond_5

    .line 611
    const/4 v2, 0x1

    .line 612
    if-eqz v1, :cond_3

    .line 613
    invoke-direct {p0}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->throwInvalidCamera2InteropOverrideException()V

    goto :goto_1

    .line 616
    :cond_5
    const/4 v1, 0x1

    .line 617
    if-eqz v2, :cond_6

    .line 618
    invoke-direct {p0}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->throwInvalidCamera2InteropOverrideException()V

    .line 620
    :cond_6
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v0, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 624
    .end local v4    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    .end local v7    # "streamUseCaseOverride":J
    :cond_7
    if-nez v2, :cond_8

    .line 625
    invoke-direct {p0, p3, v0}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->areStreamUseCasesAvailable(Ljava/util/Set;Ljava/util/Set;)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v3, 0x1

    goto :goto_2

    :cond_8
    const/4 v3, 0x0

    .line 624
    :goto_2
    return v3
.end method

.method private final isZslUseCase(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Z
    .locals 4
    .param p1, "config"    # Landroidx/camera/core/impl/Config;
    .param p2, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 538
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {p1, v0, v2}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 539
    return v1

    .line 542
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 543
    return v1

    .line 546
    :cond_1
    sget-object v0, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 545
    nop

    .line 547
    .local v0, "captureMode":I
    invoke-static {p2, v0}, Landroidx/camera/camera2/internal/TemplateTypeUtil;->getSessionConfigTemplateType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;I)I

    move-result v2

    .line 548
    nop

    .line 547
    const/4 v3, 0x5

    if-ne v2, v3, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public static final populateStreamUseCaseStreamSpecOptionWithInteropOverride(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Z
    .locals 11
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p1, "attachedSurfaces"    # Ljava/util/List;
    .param p2, "suggestedStreamSpecMap"    # Ljava/util/Map;
    .param p3, "attachedSurfaceStreamSpecMap"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;)Z"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "characteristicsCompat"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "attachedSurfaces"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "suggestedStreamSpecMap"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "attachedSurfaceStreamSpecMap"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 259
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 260
    return v2

    .line 263
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    check-cast v0, Ljava/util/List;

    .line 262
    nop

    .line 265
    .local v0, "newUseCaseConfigs":Ljava/util/List;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 266
    .local v3, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v3}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 269
    .end local v3    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    .line 270
    .local v3, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/StreamSpec;

    invoke-virtual {v4}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 273
    .end local v3    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    :cond_2
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_STREAM_USE_CASES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    .line 272
    nop

    .line 274
    .local v1, "availableStreamUseCases":[J
    if-eqz v1, :cond_b

    array-length v3, v1

    const/4 v4, 0x1

    if-nez v3, :cond_3

    move v3, v4

    goto :goto_2

    :cond_3
    move v3, v2

    :goto_2
    if-eqz v3, :cond_4

    goto/16 :goto_6

    .line 277
    :cond_4
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    check-cast v3, Ljava/util/Set;

    .line 278
    .local v3, "availableStreamUseCaseSet":Ljava/util/Set;
    array-length v5, v1

    move v6, v2

    :goto_3
    if-ge v6, v5, :cond_5

    aget-wide v7, v1, v6

    .line 279
    .local v7, "availableStreamUseCase":J
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 278
    .end local v7    # "availableStreamUseCase":J
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 281
    :cond_5
    nop

    .line 282
    sget-object v5, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    .line 283
    nop

    .line 284
    nop

    .line 285
    nop

    .line 282
    invoke-direct {v5, p1, v0, v3}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isValidCamera2InteropOverride(Ljava/util/List;Ljava/util/List;Ljava/util/Set;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 288
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 289
    .local v5, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v5}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v6

    .line 294
    .local v6, "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    nop

    .line 290
    sget-object v7, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    .line 291
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 292
    sget-object v8, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v6, v8}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    .line 290
    invoke-direct {v7, v6, v8}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;Ljava/lang/Long;)Landroidx/camera/core/impl/Config;

    move-result-object v7

    .line 294
    if-eqz v7, :cond_6

    .line 290
    nop

    .line 294
    nop

    .local v7, "it":Landroidx/camera/core/impl/Config;
    const/4 v8, 0x0

    .line 295
    .local v8, "$i$a$-also-StreamUseCaseUtil$populateStreamUseCaseStreamSpecOptionWithInteropOverride$1":I
    nop

    .line 296
    invoke-virtual {v5, v7}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->toStreamSpec(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;

    move-result-object v9

    invoke-interface {p3, v5, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    nop

    .line 294
    .end local v7    # "it":Landroidx/camera/core/impl/Config;
    .end local v8    # "$i$a$-also-StreamUseCaseUtil$populateStreamUseCaseStreamSpecOptionWithInteropOverride$1":I
    goto :goto_4

    .end local v5    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v6    # "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    :cond_6
    goto :goto_4

    .line 299
    :cond_7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/UseCaseConfig;

    .line 300
    .local v5, "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    invoke-interface {p2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/StreamSpec;

    .line 301
    .local v6, "oldStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v6}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v7

    .line 306
    .local v7, "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    nop

    .line 302
    sget-object v8, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    .line 303
    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 304
    sget-object v9, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v7, v9}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    .line 302
    invoke-direct {v8, v7, v9}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;Ljava/lang/Long;)Landroidx/camera/core/impl/Config;

    move-result-object v8

    .line 306
    if-eqz v8, :cond_8

    .line 302
    nop

    .line 306
    nop

    .local v8, "it":Landroidx/camera/core/impl/Config;
    const/4 v9, 0x0

    .line 307
    .local v9, "$i$a$-also-StreamUseCaseUtil$populateStreamUseCaseStreamSpecOptionWithInteropOverride$2":I
    nop

    .line 308
    invoke-virtual {v6}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v10

    invoke-virtual {v10, v8}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v10

    invoke-interface {p2, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    nop

    .line 306
    .end local v8    # "it":Landroidx/camera/core/impl/Config;
    .end local v9    # "$i$a$-also-StreamUseCaseUtil$populateStreamUseCaseStreamSpecOptionWithInteropOverride$2":I
    goto :goto_5

    .end local v5    # "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    .end local v6    # "oldStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    .end local v7    # "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    :cond_8
    goto :goto_5

    .line 311
    :cond_9
    return v4

    .line 313
    :cond_a
    return v2

    .line 275
    .end local v3    # "availableStreamUseCaseSet":Ljava/util/Set;
    :cond_b
    :goto_6
    return v2
.end method

.method public static final populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)V
    .locals 10
    .param p0, "suggestedStreamSpecMap"    # Ljava/util/Map;
    .param p1, "attachedSurfaceStreamSpecMap"    # Ljava/util/Map;
    .param p2, "surfaceConfigIndexAttachedSurfaceInfoMap"    # Ljava/util/Map;
    .param p3, "surfaceConfigIndexUseCaseConfigMap"    # Ljava/util/Map;
    .param p4, "surfaceConfigsWithStreamUseCase"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "+",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "+",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string/jumbo v0, "suggestedStreamSpecMap"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "attachedSurfaceStreamSpecMap"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "surfaceConfigIndexAttachedSurfaceInfoMap"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "surfaceConfigIndexUseCaseConfigMap"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "surfaceConfigsWithStreamUseCase"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 458
    const/4 v0, 0x0

    .local v0, "i":I
    move-object v1, p4

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_3

    .line 459
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SurfaceConfig;

    invoke-virtual {v2}, Landroidx/camera/core/impl/SurfaceConfig;->getStreamUseCase()Landroidx/camera/core/impl/StreamUseCase;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/impl/StreamUseCase;->getValue()J

    move-result-wide v2

    .line 460
    .local v2, "streamUseCase":J
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 461
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 462
    .local v4, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v4}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    .line 464
    .local v5, "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    sget-object v6, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    .line 465
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 466
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 464
    invoke-direct {v6, v5, v7}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;Ljava/lang/Long;)Landroidx/camera/core/impl/Config;

    move-result-object v6

    .line 463
    nop

    .line 468
    .local v6, "newImplementationOptions":Landroidx/camera/core/impl/Config;
    if-eqz v6, :cond_1

    .line 469
    nop

    .line 470
    invoke-virtual {v4, v6}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->toStreamSpec(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;

    move-result-object v7

    invoke-interface {p1, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 472
    .end local v4    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v5    # "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v6    # "newImplementationOptions":Landroidx/camera/core/impl/Config;
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 473
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v4, Landroidx/camera/core/impl/UseCaseConfig;

    .line 474
    .local v4, "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/StreamSpec;

    .line 475
    .local v5, "oldStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v6

    .line 477
    .local v6, "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    sget-object v7, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->INSTANCE:Landroidx/camera/camera2/internal/StreamUseCaseUtil;

    .line 478
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 479
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    .line 477
    invoke-direct {v7, v6, v8}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;Ljava/lang/Long;)Landroidx/camera/core/impl/Config;

    move-result-object v7

    .line 476
    nop

    .line 481
    .local v7, "newImplementationOptions":Landroidx/camera/core/impl/Config;
    if-eqz v7, :cond_1

    .line 483
    nop

    .line 484
    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v8

    .line 485
    invoke-virtual {v8, v7}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v8

    .line 486
    invoke-virtual {v8}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v8

    const-string v9, "build(...)"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 482
    nop

    .line 487
    .local v8, "newStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-interface {p0, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    .end local v2    # "streamUseCase":J
    .end local v4    # "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;
    .end local v5    # "oldStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    .end local v6    # "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v7    # "newImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v8    # "newStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 490
    .restart local v2    # "streamUseCase":J
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    const-string v4, "SurfaceConfig does not map to any use case"

    invoke-direct {v1, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 493
    .end local v0    # "i":I
    .end local v2    # "streamUseCase":J
    :cond_3
    return-void
.end method

.method public static final populateSurfaceToStreamUseCaseMapping(Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Map;)V
    .locals 11
    .param p0, "sessionConfigs"    # Ljava/util/Collection;
    .param p1, "useCaseConfigs"    # Ljava/util/Collection;
    .param p2, "streamUseCaseMap"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/SessionConfig;",
            ">;",
            "Ljava/util/Collection<",
            "+",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string/jumbo v0, "sessionConfigs"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "useCaseConfigs"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "streamUseCaseMap"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 115
    const/4 v0, 0x0

    .line 116
    .local v0, "position":I
    const/4 v1, 0x0

    .line 117
    .local v1, "hasStreamUseCase":Z
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 118
    .local v2, "useCaseConfigArrayList":Ljava/util/ArrayList;
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const-string v5, "StreamUseCaseUtil"

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/SessionConfig;

    .line 119
    .local v4, "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    nop

    .line 120
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v8

    .line 121
    sget-object v9, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 120
    invoke-interface {v8, v9}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 122
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-eq v8, v7, :cond_1

    .line 125
    nop

    .line 126
    sget-object v3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 127
    nop

    .line 129
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-array v8, v7, [Ljava/lang/Object;

    aput-object v3, v8, v6

    .line 126
    invoke-static {v8, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v3

    const-string v6, "SessionConfig has stream use case but also contains %d surfaces, abort populateSurfaceToStreamUseCaseMapping()."

    invoke-static {v6, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "format(...)"

    invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 124
    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    return-void

    .line 134
    :cond_1
    nop

    .line 135
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v8

    .line 136
    sget-object v9, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 135
    invoke-interface {v8, v9}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 139
    const/4 v1, 0x1

    .line 140
    nop

    .line 144
    .end local v4    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    :cond_2
    if-eqz v1, :cond_5

    .line 145
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/SessionConfig;

    .line 146
    .restart local v4    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    nop

    .line 147
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/camera/core/impl/UseCaseConfig;

    invoke-interface {v8}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v8

    sget-object v9, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->METERING_REPEATING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    const-string v10, "getSurfaces(...)"

    if-ne v8, v9, :cond_3

    .line 153
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v8

    invoke-static {v8, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    .line 154
    xor-int/2addr v8, v7

    .line 152
    const-string v9, "MeteringRepeating should contain a surface"

    invoke-static {v8, v9}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 156
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .line 157
    const-wide/16 v9, 0x1

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {p2, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 159
    :cond_3
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v8

    .line 160
    sget-object v9, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 159
    invoke-interface {v8, v9}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 163
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v8

    invoke-static {v8, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_4

    .line 164
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .line 165
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v9

    .line 166
    sget-object v10, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 165
    invoke-interface {v9, v10}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p2, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    :cond_4
    :goto_1
    nop

    .end local v4    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 174
    :cond_5
    nop

    .line 175
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "populateSurfaceToStreamUseCaseMapping() - streamUseCaseMap = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 173
    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    return-void
.end method

.method public static final shouldUseStreamUseCase(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;)Z
    .locals 2
    .param p0, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "featureSettings"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 233
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v0

    if-nez v0, :cond_0

    .line 234
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getRequiredMaxBitDepth()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 235
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->isHighSpeedOn()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 233
    :goto_0
    return v0
.end method

.method private final throwInvalidCamera2InteropOverrideException()V
    .locals 2

    .line 565
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 566
    nop

    .line 565
    const-string v1, "Either all use cases must have non-default stream use case assigned or none should have it"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
