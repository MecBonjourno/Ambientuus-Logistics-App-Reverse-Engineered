.class public final Landroidx/camera/camera2/internal/HighSpeedResolver$Companion;
.super Ljava/lang/Object;
.source "HighSpeedResolver.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/HighSpeedResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nHighSpeedResolver.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HighSpeedResolver.kt\nandroidx/camera/camera2/internal/HighSpeedResolver$Companion\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,230:1\n1557#2:231\n1628#2,3:232\n1557#2:235\n1628#2,3:236\n1755#2,3:239\n1734#2,3:242\n*S KotlinDebug\n*F\n+ 1 HighSpeedResolver.kt\nandroidx/camera/camera2/internal/HighSpeedResolver$Companion\n*L\n215#1:231\n215#1:232,3\n216#1:235\n216#1:236,3\n218#1:239,3\n222#1:242,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J(\u0010\t\u001a\u00020\n2\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c2\u0010\u0010\u000e\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u000f0\u000cH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00078\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Landroidx/camera/camera2/internal/HighSpeedResolver$Companion;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "DEFAULT_FPS",
        "Landroid/util/Range;",
        "",
        "isHighSpeedOn",
        "",
        "attachedSurfaces",
        "",
        "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
        "newUseCaseConfigs",
        "Landroidx/camera/core/impl/UseCaseConfig;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Landroidx/camera/camera2/internal/HighSpeedResolver$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final isHighSpeedOn(Ljava/util/Collection;Ljava/util/Collection;)Z
    .locals 11
    .param p1, "attachedSurfaces"    # Ljava/util/Collection;
    .param p2, "newUseCaseConfigs"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Collection<",
            "+",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)Z"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "attachedSurfaces"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "newUseCaseConfigs"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 215
    move-object v0, p1

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 231
    .local v1, "$i$f$map":I
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .local v2, "destination$iv$iv":Ljava/util/Collection;
    move-object v4, v0

    .local v4, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 232
    .local v5, "$i$f$mapTo":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 233
    .local v7, "item$iv$iv":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .local v8, "it":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    const/4 v9, 0x0

    .line 215
    .local v9, "$i$a$-map-HighSpeedResolver$Companion$isHighSpeedOn$sessionTypes$1":I
    invoke-virtual {v8}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getSessionType()I

    move-result v8

    .end local v8    # "it":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v9    # "$i$a$-map-HighSpeedResolver$Companion$isHighSpeedOn$sessionTypes$1":I
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 233
    invoke-interface {v2, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 234
    .end local v7    # "item$iv$iv":Ljava/lang/Object;
    :cond_0
    nop

    .end local v2    # "destination$iv$iv":Ljava/util/Collection;
    .end local v4    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$mapTo":I
    check-cast v2, Ljava/util/List;

    .line 231
    nop

    .end local v0    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$map":I
    check-cast v2, Ljava/util/Collection;

    .line 216
    move-object v0, p2

    check-cast v0, Ljava/lang/Iterable;

    .restart local v0    # "$this$map$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 235
    .restart local v1    # "$i$f$map":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object v3, v4

    check-cast v3, Ljava/util/Collection;

    .local v3, "destination$iv$iv":Ljava/util/Collection;
    move-object v4, v0

    .restart local v4    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 236
    .restart local v5    # "$i$f$mapTo":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 237
    .restart local v7    # "item$iv$iv":Ljava/lang/Object;
    move-object v9, v7

    check-cast v9, Landroidx/camera/core/impl/UseCaseConfig;

    .local v9, "it":Landroidx/camera/core/impl/UseCaseConfig;
    const/4 v10, 0x0

    .line 216
    .local v10, "$i$a$-map-HighSpeedResolver$Companion$isHighSpeedOn$sessionTypes$2":I
    invoke-interface {v9, v8}, Landroidx/camera/core/impl/UseCaseConfig;->getSessionType(I)I

    move-result v8

    .end local v9    # "it":Landroidx/camera/core/impl/UseCaseConfig;
    .end local v10    # "$i$a$-map-HighSpeedResolver$Companion$isHighSpeedOn$sessionTypes$2":I
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 237
    invoke-interface {v3, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 238
    .end local v7    # "item$iv$iv":Ljava/lang/Object;
    :cond_1
    nop

    .end local v3    # "destination$iv$iv":Ljava/util/Collection;
    .end local v4    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$mapTo":I
    check-cast v3, Ljava/util/List;

    .line 235
    nop

    .end local v0    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$map":I
    check-cast v3, Ljava/lang/Iterable;

    .line 215
    invoke-static {v2, v3}, Lkotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    .line 214
    nop

    .line 218
    .local v0, "sessionTypes":Ljava/util/List;
    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$any$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 239
    .local v2, "$i$f$any":I
    instance-of v3, v1, Ljava/util/Collection;

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    move-object v3, v1

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v8

    goto :goto_3

    .line 240
    :cond_2
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    .local v6, "it":I
    const/4 v7, 0x0

    .line 218
    .local v7, "$i$a$-any-HighSpeedResolver$Companion$isHighSpeedOn$hasHighSpeedSessionType$1":I
    if-ne v6, v4, :cond_4

    move v6, v4

    goto :goto_2

    :cond_4
    move v6, v8

    .line 240
    .end local v6    # "it":I
    .end local v7    # "$i$a$-any-HighSpeedResolver$Companion$isHighSpeedOn$hasHighSpeedSessionType$1":I
    :goto_2
    if-eqz v6, :cond_3

    move v1, v4

    goto :goto_3

    .line 241
    .end local v5    # "element$iv":Ljava/lang/Object;
    :cond_5
    move v1, v8

    .line 218
    .end local v1    # "$this$any$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$any":I
    :goto_3
    nop

    .line 221
    .local v1, "hasHighSpeedSessionType":Z
    if-eqz v1, :cond_b

    .line 222
    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$all$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 242
    .local v3, "$i$f$all":I
    instance-of v5, v2, Ljava/util/Collection;

    if-eqz v5, :cond_6

    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_6

    move v8, v4

    goto :goto_5

    .line 243
    :cond_6
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v7

    .local v7, "it":I
    const/4 v9, 0x0

    .line 222
    .local v9, "$i$a$-all-HighSpeedResolver$Companion$isHighSpeedOn$1":I
    if-ne v7, v4, :cond_8

    move v7, v4

    goto :goto_4

    :cond_8
    move v7, v8

    .line 243
    .end local v7    # "it":I
    .end local v9    # "$i$a$-all-HighSpeedResolver$Companion$isHighSpeedOn$1":I
    :goto_4
    if-nez v7, :cond_7

    goto :goto_5

    .line 244
    .end local v6    # "element$iv":Ljava/lang/Object;
    :cond_9
    move v8, v4

    .line 222
    .end local v2    # "$this$all$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$all":I
    :goto_5
    if-eqz v8, :cond_a

    goto :goto_6

    :cond_a
    const/4 v2, 0x0

    .line 223
    .local v2, "$i$a$-require-HighSpeedResolver$Companion$isHighSpeedOn$2":I
    nop

    .line 222
    .end local v2    # "$i$a$-require-HighSpeedResolver$Companion$isHighSpeedOn$2":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "All sessionTypes should be high-speed when any of them is high-speed"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 226
    :cond_b
    :goto_6
    return v1
.end method
