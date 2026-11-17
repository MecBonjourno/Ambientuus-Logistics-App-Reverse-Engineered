.class public final synthetic Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery$-CC;
.super Ljava/lang/Object;
.source "FeatureCombinationQuery.kt"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;->Companion:Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery$Companion;

    return-void
.end method

.method public static createSessionConfigBuilder(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p0, "$this$createSessionConfigBuilder"    # Landroidx/camera/core/impl/UseCaseConfig;
    .param p1, "resolution"    # Landroid/util/Size;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroid/util/Size;",
            "Landroidx/camera/core/DynamicRange;",
            ")",
            "Landroidx/camera/core/impl/SessionConfig$Builder;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 0
    sget-object v0, Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;->Companion:Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery$Companion;

    invoke-virtual {v0, p0, p1, p2}, Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery$Companion;->createSessionConfigBuilder(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v0

    .line 84
    return-object v0
.end method
