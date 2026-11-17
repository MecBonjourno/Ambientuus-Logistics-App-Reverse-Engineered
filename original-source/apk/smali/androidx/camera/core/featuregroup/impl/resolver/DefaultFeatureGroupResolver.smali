.class public final Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;
.super Ljava/lang/Object;
.source "DefaultFeatureGroupResolver.kt"

# interfaces
.implements Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDefaultFeatureGroupResolver.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DefaultFeatureGroupResolver.kt\nandroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,192:1\n1755#2,3:193\n1755#2,3:196\n1863#2,2:199\n1863#2,2:201\n774#2:203\n865#2,2:204\n*S KotlinDebug\n*F\n+ 1 DefaultFeatureGroupResolver.kt\nandroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver\n*L\n77#1:193,3\n78#1:196,3\n81#1:199,2\n89#1:201,2\n114#1:203\n114#1:204,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 \u00112\u00020\u0001:\u0001\u0011B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016J8\u0010\n\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c2\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u000f2\u000e\u0008\u0002\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000cH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;",
        "Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolver;",
        "cameraInfoInternal",
        "Landroidx/camera/core/impl/CameraInfoInternal;",
        "<init>",
        "(Landroidx/camera/core/impl/CameraInfoInternal;)V",
        "resolveFeatureGroup",
        "Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;",
        "sessionConfig",
        "Landroidx/camera/core/SessionConfig;",
        "getFeatureListResolvedByPriority",
        "orderedPreferredFeatures",
        "",
        "Landroidx/camera/core/featuregroup/GroupableFeature;",
        "index",
        "",
        "currentOptionalFeatures",
        "Companion",
        "camera-core_release"
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
.field private static final Companion:Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver$Companion;

.field private static final TAG:Ljava/lang/String; = "DefaultFeatureGroupResolver"


# instance fields
.field private final cameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;->Companion:Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver$Companion;

    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/impl/CameraInfoInternal;)V
    .locals 1
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;

    const-string v0, "cameraInfoInternal"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;->cameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    return-void
.end method

.method private final getFeatureListResolvedByPriority(Landroidx/camera/core/SessionConfig;Ljava/util/List;ILjava/util/List;)Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;
    .locals 3
    .param p1, "sessionConfig"    # Landroidx/camera/core/SessionConfig;
    .param p2, "orderedPreferredFeatures"    # Ljava/util/List;
    .param p3, "index"    # I
    .param p4, "currentOptionalFeatures"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/SessionConfig;",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;I",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;)",
            "Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;"
        }
    .end annotation

    .line 144
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-lt p3, v0, :cond_1

    .line 146
    invoke-virtual {p1}, Landroidx/camera/core/SessionConfig;->getRequiredFeatureGroup()Ljava/util/Set;

    move-result-object v0

    move-object v1, p4

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v0, v1}, Lkotlin/collections/SetsKt;->plus(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    .line 149
    .local v0, "features":Ljava/util/Set;
    nop

    .line 150
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getFeatureListResolvedByPriority: features = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 151
    nop

    .line 150
    const-string v2, ", useCases = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 151
    invoke-virtual {p1}, Landroidx/camera/core/SessionConfig;->getUseCases()Ljava/util/List;

    move-result-object v2

    .line 150
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 148
    const-string v2, "DefaultFeatureGroupResolver"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    nop

    .line 155
    iget-object v1, p0, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;->cameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    .line 156
    new-instance v2, Landroidx/camera/core/featuregroup/impl/ResolvedFeatureGroup;

    invoke-direct {v2, v0}, Landroidx/camera/core/featuregroup/impl/ResolvedFeatureGroup;-><init>(Ljava/util/Set;)V

    .line 157
    nop

    .line 155
    invoke-interface {v1, v2, p1}, Landroidx/camera/core/impl/CameraInfoInternal;->isResolvedFeatureGroupSupported(Landroidx/camera/core/featuregroup/impl/ResolvedFeatureGroup;Landroidx/camera/core/SessionConfig;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 162
    new-instance v1, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$Supported;

    new-instance v2, Landroidx/camera/core/featuregroup/impl/ResolvedFeatureGroup;

    invoke-direct {v2, v0}, Landroidx/camera/core/featuregroup/impl/ResolvedFeatureGroup;-><init>(Ljava/util/Set;)V

    invoke-direct {v1, v2}, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$Supported;-><init>(Landroidx/camera/core/featuregroup/impl/ResolvedFeatureGroup;)V

    check-cast v1, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    goto :goto_0

    .line 164
    :cond_0
    sget-object v1, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$Unsupported;->INSTANCE:Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$Unsupported;

    check-cast v1, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    .line 154
    :goto_0
    return-object v1

    .line 169
    .end local v0    # "features":Ljava/util/Set;
    :cond_1
    nop

    .line 170
    nop

    .line 171
    nop

    .line 172
    add-int/lit8 v0, p3, 0x1

    .line 173
    move-object v1, p4

    check-cast v1, Ljava/util/Collection;

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 169
    invoke-direct {p0, p1, p2, v0, v1}, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;->getFeatureListResolvedByPriority(Landroidx/camera/core/SessionConfig;Ljava/util/List;ILjava/util/List;)Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    move-result-object v0

    .line 168
    nop

    .line 176
    .local v0, "resultTakingCurrentFeature":Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;
    instance-of v1, v0, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$Supported;

    if-eqz v1, :cond_2

    .line 177
    return-object v0

    .line 180
    :cond_2
    nop

    .line 181
    nop

    .line 182
    nop

    .line 183
    add-int/lit8 v1, p3, 0x1

    .line 184
    nop

    .line 180
    invoke-direct {p0, p1, p2, v1, p4}, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;->getFeatureListResolvedByPriority(Landroidx/camera/core/SessionConfig;Ljava/util/List;ILjava/util/List;)Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    move-result-object v1

    return-object v1
.end method

.method static synthetic getFeatureListResolvedByPriority$default(Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;Landroidx/camera/core/SessionConfig;Ljava/util/List;ILjava/util/List;ILjava/lang/Object;)Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;
    .locals 0

    .line 137
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_0

    .line 140
    const/4 p3, 0x0

    .line 137
    :cond_0
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_1

    .line 141
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p4

    .line 137
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;->getFeatureListResolvedByPriority(Landroidx/camera/core/SessionConfig;Ljava/util/List;ILjava/util/List;)Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public resolveFeatureGroup(Landroidx/camera/core/SessionConfig;)Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;
    .locals 16
    .param p1, "sessionConfig"    # Landroidx/camera/core/SessionConfig;

    const-string/jumbo v0, "sessionConfig"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    invoke-virtual {v2}, Landroidx/camera/core/SessionConfig;->getUseCases()Ljava/util/List;

    move-result-object v0

    .line 70
    .local v0, "useCases":Ljava/util/List;
    invoke-virtual {v2}, Landroidx/camera/core/SessionConfig;->getRequiredFeatureGroup()Ljava/util/Set;

    move-result-object v8

    .line 71
    .local v8, "requiredFeatures":Ljava/util/Set;
    invoke-virtual {v2}, Landroidx/camera/core/SessionConfig;->getPreferredFeatureGroup()Ljava/util/List;

    move-result-object v9

    .line 73
    .local v9, "orderedPreferredFeatures":Ljava/util/List;
    move-object v1, v8

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    const/4 v4, 0x0

    if-eqz v1, :cond_1

    move-object v1, v9

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v4

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    if-eqz v1, :cond_13

    .line 77
    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$any$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 193
    .local v5, "$i$f$any":I
    instance-of v6, v1, Ljava/util/Collection;

    if-eqz v6, :cond_2

    move-object v6, v1

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    move v1, v4

    goto :goto_2

    .line 194
    :cond_2
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .local v7, "element$iv":Ljava/lang/Object;
    move-object v10, v7

    check-cast v10, Landroidx/camera/core/UseCase;

    .local v10, "it":Landroidx/camera/core/UseCase;
    const/4 v11, 0x0

    .line 77
    .local v11, "$i$a$-any-DefaultFeatureGroupResolver$resolveFeatureGroup$supportsImageFeature$1":I
    instance-of v10, v10, Landroidx/camera/core/ImageCapture;

    .line 194
    .end local v10    # "it":Landroidx/camera/core/UseCase;
    .end local v11    # "$i$a$-any-DefaultFeatureGroupResolver$resolveFeatureGroup$supportsImageFeature$1":I
    if-eqz v10, :cond_3

    const/4 v1, 0x1

    goto :goto_2

    .line 195
    .end local v7    # "element$iv":Ljava/lang/Object;
    :cond_4
    move v1, v4

    .line 77
    .end local v1    # "$this$any$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$any":I
    :goto_2
    move v10, v1

    .line 78
    .local v10, "supportsImageFeature":Z
    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    .restart local v1    # "$this$any$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 196
    .restart local v5    # "$i$f$any":I
    instance-of v6, v1, Ljava/util/Collection;

    if-eqz v6, :cond_5

    move-object v6, v1

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    goto :goto_5

    .line 197
    :cond_5
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .restart local v7    # "element$iv":Ljava/lang/Object;
    move-object v11, v7

    check-cast v11, Landroidx/camera/core/UseCase;

    .local v11, "it":Landroidx/camera/core/UseCase;
    const/4 v12, 0x0

    .line 78
    .local v12, "$i$a$-any-DefaultFeatureGroupResolver$resolveFeatureGroup$supportsStreamFeature$1":I
    instance-of v13, v11, Landroidx/camera/core/Preview;

    if-nez v13, :cond_8

    invoke-static {v11}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isVideoCapture(Landroidx/camera/core/UseCase;)Z

    move-result v13

    if-eqz v13, :cond_7

    goto :goto_3

    :cond_7
    move v11, v4

    goto :goto_4

    :cond_8
    :goto_3
    const/4 v11, 0x1

    .line 197
    .end local v11    # "it":Landroidx/camera/core/UseCase;
    .end local v12    # "$i$a$-any-DefaultFeatureGroupResolver$resolveFeatureGroup$supportsStreamFeature$1":I
    :goto_4
    if-eqz v11, :cond_6

    const/4 v4, 0x1

    goto :goto_5

    .line 198
    .end local v7    # "element$iv":Ljava/lang/Object;
    :cond_9
    nop

    .line 78
    .end local v1    # "$this$any$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$any":I
    :goto_5
    move v11, v4

    .line 81
    .local v11, "supportsStreamFeature":Z
    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 199
    .local v4, "$i$f$forEach":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Landroidx/camera/core/UseCase;

    .local v7, "it":Landroidx/camera/core/UseCase;
    const/4 v12, 0x0

    .line 82
    .local v12, "$i$a$-forEach-DefaultFeatureGroupResolver$resolveFeatureGroup$2":I
    sget-object v13, Landroidx/camera/core/featuregroup/impl/UseCaseType;->Companion:Landroidx/camera/core/featuregroup/impl/UseCaseType$Companion;

    invoke-virtual {v13, v7}, Landroidx/camera/core/featuregroup/impl/UseCaseType$Companion;->getFeatureGroupUseCaseType(Landroidx/camera/core/UseCase;)Landroidx/camera/core/featuregroup/impl/UseCaseType;

    move-result-object v13

    .line 83
    .local v13, "useCaseType":Landroidx/camera/core/featuregroup/impl/UseCaseType;
    sget-object v14, Landroidx/camera/core/featuregroup/impl/UseCaseType;->UNDEFINED:Landroidx/camera/core/featuregroup/impl/UseCaseType;

    if-ne v13, v14, :cond_a

    .line 84
    new-instance v3, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$UnsupportedUseCase;

    invoke-direct {v3, v7}, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$UnsupportedUseCase;-><init>(Landroidx/camera/core/UseCase;)V

    check-cast v3, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    return-object v3

    .line 86
    :cond_a
    nop

    .line 199
    .end local v7    # "it":Landroidx/camera/core/UseCase;
    .end local v12    # "$i$a$-forEach-DefaultFeatureGroupResolver$resolveFeatureGroup$2":I
    .end local v13    # "useCaseType":Landroidx/camera/core/featuregroup/impl/UseCaseType;
    nop

    .end local v6    # "element$iv":Ljava/lang/Object;
    goto :goto_6

    .line 200
    :cond_b
    nop

    .line 89
    .end local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$forEach":I
    move-object v1, v8

    check-cast v1, Ljava/lang/Iterable;

    .restart local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 201
    .restart local v4    # "$i$f$forEach":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "element$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Landroidx/camera/core/featuregroup/GroupableFeature;

    .local v7, "feature":Landroidx/camera/core/featuregroup/GroupableFeature;
    const/4 v12, 0x0

    .line 90
    .local v12, "$i$a$-forEach-DefaultFeatureGroupResolver$resolveFeatureGroup$3":I
    nop

    .line 92
    instance-of v13, v7, Landroidx/camera/core/featuregroup/impl/feature/ImageFormatFeature;

    if-eqz v13, :cond_c

    .line 93
    if-nez v10, :cond_e

    .line 94
    new-instance v3, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$UseCaseMissing;

    .line 95
    sget-object v5, Landroidx/camera/core/featuregroup/impl/UseCaseType;->IMAGE_CAPTURE:Landroidx/camera/core/featuregroup/impl/UseCaseType;

    invoke-virtual {v5}, Landroidx/camera/core/featuregroup/impl/UseCaseType;->toString()Ljava/lang/String;

    move-result-object v5

    .line 96
    nop

    .line 94
    invoke-direct {v3, v5, v7}, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$UseCaseMissing;-><init>(Ljava/lang/String;Landroidx/camera/core/featuregroup/GroupableFeature;)V

    check-cast v3, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    return-object v3

    .line 100
    :cond_c
    instance-of v13, v7, Landroidx/camera/core/featuregroup/impl/feature/DynamicRangeFeature;

    if-nez v13, :cond_d

    .line 101
    instance-of v13, v7, Landroidx/camera/core/featuregroup/impl/feature/FpsRangeFeature;

    if-nez v13, :cond_d

    .line 102
    instance-of v13, v7, Landroidx/camera/core/featuregroup/impl/feature/VideoStabilizationFeature;

    if-eqz v13, :cond_e

    .line 103
    :cond_d
    if-nez v11, :cond_e

    .line 104
    new-instance v3, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$UseCaseMissing;

    .line 105
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v13, Landroidx/camera/core/featuregroup/impl/UseCaseType;->PREVIEW:Landroidx/camera/core/featuregroup/impl/UseCaseType;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v13, " or "

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v13, Landroidx/camera/core/featuregroup/impl/UseCaseType;->VIDEO_CAPTURE:Landroidx/camera/core/featuregroup/impl/UseCaseType;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 106
    nop

    .line 104
    invoke-direct {v3, v5, v7}, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult$UseCaseMissing;-><init>(Ljava/lang/String;Landroidx/camera/core/featuregroup/GroupableFeature;)V

    check-cast v3, Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    return-object v3

    .line 111
    :cond_e
    nop

    .line 201
    .end local v7    # "feature":Landroidx/camera/core/featuregroup/GroupableFeature;
    .end local v12    # "$i$a$-forEach-DefaultFeatureGroupResolver$resolveFeatureGroup$3":I
    nop

    .end local v6    # "element$iv":Ljava/lang/Object;
    goto :goto_7

    .line 202
    :cond_f
    nop

    .line 114
    .end local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$forEach":I
    move-object v1, v9

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 203
    .local v4, "$i$f$filter":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    check-cast v5, Ljava/util/Collection;

    .local v5, "destination$iv$iv":Ljava/util/Collection;
    move-object v6, v1

    .local v6, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 204
    .local v7, "$i$f$filterTo":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_10
    :goto_8
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_12

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .local v13, "element$iv$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Landroidx/camera/core/featuregroup/GroupableFeature;

    .local v14, "feature":Landroidx/camera/core/featuregroup/GroupableFeature;
    const/4 v15, 0x0

    .line 115
    .local v15, "$i$a$-filter-DefaultFeatureGroupResolver$resolveFeatureGroup$filteredPreferredFeatures$1":I
    nop

    .line 117
    instance-of v3, v14, Landroidx/camera/core/featuregroup/impl/feature/ImageFormatFeature;

    if-eqz v3, :cond_11

    move v3, v10

    goto :goto_9

    .line 118
    :cond_11
    const/4 v3, 0x1

    .line 119
    :goto_9
    nop

    .line 204
    .end local v14    # "feature":Landroidx/camera/core/featuregroup/GroupableFeature;
    .end local v15    # "$i$a$-filter-DefaultFeatureGroupResolver$resolveFeatureGroup$filteredPreferredFeatures$1":I
    if-eqz v3, :cond_10

    invoke-interface {v5, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 205
    .end local v13    # "element$iv$iv":Ljava/lang/Object;
    :cond_12
    nop

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v6    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$filterTo":I
    move-object v3, v5

    check-cast v3, Ljava/util/List;

    .line 203
    nop

    .line 114
    .end local v1    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$filter":I
    nop

    .line 113
    nop

    .line 122
    .local v3, "filteredPreferredFeatures":Ljava/util/List;
    nop

    .line 123
    nop

    .line 124
    nop

    .line 122
    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v7}, Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;->getFeatureListResolvedByPriority$default(Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;Landroidx/camera/core/SessionConfig;Ljava/util/List;ILjava/util/List;ILjava/lang/Object;)Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;

    move-result-object v4

    return-object v4

    .line 73
    .end local v3    # "filteredPreferredFeatures":Ljava/util/List;
    .end local v10    # "supportsImageFeature":Z
    .end local v11    # "supportsStreamFeature":Z
    :cond_13
    const/4 v1, 0x0

    .line 74
    .local v1, "$i$a$-require-DefaultFeatureGroupResolver$resolveFeatureGroup$1":I
    nop

    .line 73
    .end local v1    # "$i$a$-require-DefaultFeatureGroupResolver$resolveFeatureGroup$1":I
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Must have at least one required or preferred feature"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
