.class public Landroidx/camera/core/SessionConfig;
.super Ljava/lang/Object;
.source "SessionConfig.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/SessionConfig$Builder;,
        Landroidx/camera/core/SessionConfig$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSessionConfig.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SessionConfig.kt\nandroidx/camera/core/SessionConfig\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,396:1\n1863#2,2:397\n1557#2:400\n1628#2,3:401\n1863#2:404\n774#2:405\n865#2,2:406\n1864#2:408\n1#3:399\n*S KotlinDebug\n*F\n+ 1 SessionConfig.kt\nandroidx/camera/core/SessionConfig\n*L\n158#1:397,2\n176#1:400\n176#1:401,3\n177#1:404\n179#1:405\n179#1:406,2\n177#1:408\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0005\u0008\u0017\u0018\u00002\u00020\u0001:\u00017Bc\u0008\u0007\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u000e\u0008\u0002\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0003\u0012\u000e\u0008\u0002\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n\u0012\u000e\u0008\u0002\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u000e\u0008\u0002\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u0003\u00a2\u0006\u0004\u0008\u0010\u0010\u0011B\u001d\u0008\u0016\u0012\u0012\u0010\u0002\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00040\u0012\"\u00020\u0004\u00a2\u0006\u0004\u0008\u0010\u0010\u0013J\u0008\u0010-\u001a\u00020.H\u0002J\u0008\u0010/\u001a\u00020.H\u0002J\u0008\u00100\u001a\u00020.H\u0002J\u000c\u00101\u001a\u00020.*\u00020\u0004H\u0002J\u000c\u00102\u001a\u000203*\u00020\u0004H\u0002J&\u00104\u001a\u00020.2\u0008\u0008\u0002\u00105\u001a\u00020)2\u0012\u00106\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r0%H\u0007R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R\u0017\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017R\u0017\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019R\u0017\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u001bR\u0017\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u0017R\u0017\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001d\u0010\u0017R\u0016\u0010\u001e\u001a\u00020\u001f8WX\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010 R\u0016\u0010!\u001a\u00020\u000b8WX\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010#R6\u0010&\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r0%2\u0012\u0010$\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r0%@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\'\u0010(R\u001e\u0010*\u001a\u00020)2\u0006\u0010$\u001a\u00020)@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008+\u0010,\u00a8\u00068"
    }
    d2 = {
        "Landroidx/camera/core/SessionConfig;",
        "",
        "useCases",
        "",
        "Landroidx/camera/core/UseCase;",
        "viewPort",
        "Landroidx/camera/core/ViewPort;",
        "effects",
        "Landroidx/camera/core/CameraEffect;",
        "frameRateRange",
        "Landroid/util/Range;",
        "",
        "requiredFeatureGroup",
        "",
        "Landroidx/camera/core/featuregroup/GroupableFeature;",
        "preferredFeatureGroup",
        "<init>",
        "(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;)V",
        "",
        "([Landroidx/camera/core/UseCase;)V",
        "getViewPort",
        "()Landroidx/camera/core/ViewPort;",
        "getEffects",
        "()Ljava/util/List;",
        "getFrameRateRange",
        "()Landroid/util/Range;",
        "getRequiredFeatureGroup",
        "()Ljava/util/Set;",
        "getPreferredFeatureGroup",
        "getUseCases",
        "isLegacy",
        "",
        "()Z",
        "sessionType",
        "getSessionType",
        "()I",
        "value",
        "Landroidx/core/util/Consumer;",
        "featureSelectionListener",
        "getFeatureSelectionListener",
        "()Landroidx/core/util/Consumer;",
        "Ljava/util/concurrent/Executor;",
        "featureSelectionListenerExecutor",
        "getFeatureSelectionListenerExecutor",
        "()Ljava/util/concurrent/Executor;",
        "validateFrameRate",
        "",
        "validateFeatureGroups",
        "validateRequiredFeatures",
        "validateDefaultGroupableFeatureValues",
        "getUseCaseName",
        "",
        "setFeatureSelectionListener",
        "executor",
        "listener",
        "Builder",
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


# instance fields
.field private final effects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;"
        }
    .end annotation
.end field

.field private featureSelectionListener:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Ljava/util/Set<",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;>;"
        }
    .end annotation
.end field

.field private featureSelectionListenerExecutor:Ljava/util/concurrent/Executor;

.field private final frameRateRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final isLegacy:Z

.field private final preferredFeatureGroup:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;"
        }
    .end annotation
.end field

.field private final requiredFeatureGroup:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;"
        }
    .end annotation
.end field

.field private final sessionType:I

.field private final useCases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation
.end field

.field private final viewPort:Landroidx/camera/core/ViewPort;


# direct methods
.method public static synthetic $r8$lambda$nHoExTCOzN2kfNQ5jRFz93oyuMM(Ljava/util/Set;)V
    .locals 0

    invoke-static {p0}, Landroidx/camera/core/SessionConfig;->featureSelectionListener$lambda$0(Ljava/util/Set;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 10
    .param p1, "useCases"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/UseCase;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "useCases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v8, 0x3e

    const/4 v9, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    .end local p1    # "useCases":Ljava/util/List;
    .local v2, "useCases":Ljava/util/List;
    invoke-direct/range {v1 .. v9}, Landroidx/camera/core/SessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroidx/camera/core/ViewPort;)V
    .locals 10
    .param p1, "useCases"    # Ljava/util/List;
    .param p2, "viewPort"    # Landroidx/camera/core/ViewPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Landroidx/camera/core/ViewPort;",
            ")V"
        }
    .end annotation

    const-string/jumbo v0, "useCases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v8, 0x3c

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    .end local p1    # "useCases":Ljava/util/List;
    .end local p2    # "viewPort":Landroidx/camera/core/ViewPort;
    .local v2, "useCases":Ljava/util/List;
    .local v3, "viewPort":Landroidx/camera/core/ViewPort;
    invoke-direct/range {v1 .. v9}, Landroidx/camera/core/SessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;)V
    .locals 10
    .param p1, "useCases"    # Ljava/util/List;
    .param p2, "viewPort"    # Landroidx/camera/core/ViewPort;
    .param p3, "effects"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Landroidx/camera/core/ViewPort;",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/CameraEffect;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "useCases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "effects"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v8, 0x38

    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    .end local p1    # "useCases":Ljava/util/List;
    .end local p2    # "viewPort":Landroidx/camera/core/ViewPort;
    .end local p3    # "effects":Ljava/util/List;
    .local v2, "useCases":Ljava/util/List;
    .local v3, "viewPort":Landroidx/camera/core/ViewPort;
    .local v4, "effects":Ljava/util/List;
    invoke-direct/range {v1 .. v9}, Landroidx/camera/core/SessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;)V
    .locals 10
    .param p1, "useCases"    # Ljava/util/List;
    .param p2, "viewPort"    # Landroidx/camera/core/ViewPort;
    .param p3, "effects"    # Ljava/util/List;
    .param p4, "frameRateRange"    # Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Landroidx/camera/core/ViewPort;",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/CameraEffect;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "useCases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "effects"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "frameRateRange"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v8, 0x30

    const/4 v9, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .end local p1    # "useCases":Ljava/util/List;
    .end local p2    # "viewPort":Landroidx/camera/core/ViewPort;
    .end local p3    # "effects":Ljava/util/List;
    .end local p4    # "frameRateRange":Landroid/util/Range;
    .local v2, "useCases":Ljava/util/List;
    .local v3, "viewPort":Landroidx/camera/core/ViewPort;
    .local v4, "effects":Ljava/util/List;
    .local v5, "frameRateRange":Landroid/util/Range;
    invoke-direct/range {v1 .. v9}, Landroidx/camera/core/SessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;)V
    .locals 10
    .param p1, "useCases"    # Ljava/util/List;
    .param p2, "viewPort"    # Landroidx/camera/core/ViewPort;
    .param p3, "effects"    # Ljava/util/List;
    .param p4, "frameRateRange"    # Landroid/util/Range;
    .param p5, "requiredFeatureGroup"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Landroidx/camera/core/ViewPort;",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/CameraEffect;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Set<",
            "+",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "useCases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "effects"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "frameRateRange"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "requiredFeatureGroup"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v8, 0x20

    const/4 v9, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .end local p1    # "useCases":Ljava/util/List;
    .end local p2    # "viewPort":Landroidx/camera/core/ViewPort;
    .end local p3    # "effects":Ljava/util/List;
    .end local p4    # "frameRateRange":Landroid/util/Range;
    .end local p5    # "requiredFeatureGroup":Ljava/util/Set;
    .local v2, "useCases":Ljava/util/List;
    .local v3, "viewPort":Landroidx/camera/core/ViewPort;
    .local v4, "effects":Ljava/util/List;
    .local v5, "frameRateRange":Landroid/util/Range;
    .local v6, "requiredFeatureGroup":Ljava/util/Set;
    invoke-direct/range {v1 .. v9}, Landroidx/camera/core/SessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;)V
    .locals 2
    .param p1, "useCases"    # Ljava/util/List;
    .param p2, "viewPort"    # Landroidx/camera/core/ViewPort;
    .param p3, "effects"    # Ljava/util/List;
    .param p4, "frameRateRange"    # Landroid/util/Range;
    .param p5, "requiredFeatureGroup"    # Ljava/util/Set;
    .param p6, "preferredFeatureGroup"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Landroidx/camera/core/ViewPort;",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/CameraEffect;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Set<",
            "+",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "useCases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "effects"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "frameRateRange"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "requiredFeatureGroup"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "preferredFeatureGroup"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p2, p0, Landroidx/camera/core/SessionConfig;->viewPort:Landroidx/camera/core/ViewPort;

    .line 90
    iput-object p3, p0, Landroidx/camera/core/SessionConfig;->effects:Ljava/util/List;

    .line 91
    iput-object p4, p0, Landroidx/camera/core/SessionConfig;->frameRateRange:Landroid/util/Range;

    .line 92
    iput-object p5, p0, Landroidx/camera/core/SessionConfig;->requiredFeatureGroup:Ljava/util/Set;

    .line 93
    iput-object p6, p0, Landroidx/camera/core/SessionConfig;->preferredFeatureGroup:Ljava/util/List;

    .line 95
    move-object v0, p1

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/SessionConfig;->useCases:Ljava/util/List;

    .line 107
    new-instance v0, Landroidx/camera/core/SessionConfig$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/camera/core/SessionConfig$$ExternalSyntheticLambda0;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/SessionConfig;->featureSelectionListener:Landroidx/core/util/Consumer;

    .line 115
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    const-string v1, "mainThreadExecutor(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Landroidx/camera/core/SessionConfig;->featureSelectionListenerExecutor:Ljava/util/concurrent/Executor;

    .line 118
    nop

    .line 119
    invoke-direct {p0}, Landroidx/camera/core/SessionConfig;->validateFrameRate()V

    .line 120
    invoke-direct {p0}, Landroidx/camera/core/SessionConfig;->validateFeatureGroups()V

    .line 121
    nop

    .line 86
    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 7

    .line 86
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_0

    .line 89
    const/4 p2, 0x0

    move-object v2, p2

    goto :goto_0

    .line 86
    :cond_0
    move-object v2, p2

    :goto_0
    and-int/lit8 p2, p7, 0x4

    if-eqz p2, :cond_1

    .line 90
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    move-object v3, p3

    goto :goto_1

    .line 86
    :cond_1
    move-object v3, p3

    :goto_1
    and-int/lit8 p2, p7, 0x8

    if-eqz p2, :cond_2

    .line 91
    sget-object p4, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    move-object v4, p4

    goto :goto_2

    .line 86
    :cond_2
    move-object v4, p4

    :goto_2
    and-int/lit8 p2, p7, 0x10

    if-eqz p2, :cond_3

    .line 92
    invoke-static {}, Lkotlin/collections/SetsKt;->emptySet()Ljava/util/Set;

    move-result-object p5

    move-object v5, p5

    goto :goto_3

    .line 86
    :cond_3
    move-object v5, p5

    :goto_3
    and-int/lit8 p2, p7, 0x20

    if-eqz p2, :cond_4

    .line 93
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p6

    move-object v6, p6

    goto :goto_4

    .line 86
    :cond_4
    move-object v6, p6

    :goto_4
    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Landroidx/camera/core/SessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;)V

    .line 94
    return-void
.end method

.method public varargs constructor <init>([Landroidx/camera/core/UseCase;)V
    .locals 10
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    const-string/jumbo v0, "useCases"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 124
    invoke-static {p1}, Lkotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    const/16 v8, 0x3e

    const/4 v9, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v9}, Landroidx/camera/core/SessionConfig;-><init>(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method private static final featureSelectionListener$lambda$0(Ljava/util/Set;)V
    .locals 0
    .param p0, "it"    # Ljava/util/Set;

    .line 107
    return-void
.end method

.method private final getUseCaseName(Landroidx/camera/core/UseCase;)Ljava/lang/String;
    .locals 1
    .param p1, "$this$getUseCaseName"    # Landroidx/camera/core/UseCase;

    .line 226
    instance-of v0, p1, Landroidx/camera/core/Preview;

    if-eqz v0, :cond_0

    .line 227
    const-string v0, "Preview"

    goto :goto_0

    .line 228
    :cond_0
    instance-of v0, p1, Landroidx/camera/core/ImageCapture;

    if-eqz v0, :cond_1

    .line 229
    const-string v0, "ImageCapture"

    goto :goto_0

    .line 230
    :cond_1
    instance-of v0, p1, Landroidx/camera/core/ImageAnalysis;

    if-eqz v0, :cond_2

    .line 231
    const-string v0, "ImageAnalysis"

    goto :goto_0

    .line 232
    :cond_2
    invoke-static {p1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isVideoCapture(Landroidx/camera/core/UseCase;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 233
    const-string v0, "VideoCapture"

    goto :goto_0

    .line 235
    :cond_3
    const-string v0, "UseCase"

    .line 226
    :goto_0
    return-object v0
.end method

.method public static synthetic setFeatureSelectionListener$default(Landroidx/camera/core/SessionConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;ILjava/lang/Object;)V
    .locals 0

    .line 257
    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    .line 259
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Executor;

    .line 257
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/camera/core/SessionConfig;->setFeatureSelectionListener(Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: setFeatureSelectionListener"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final validateDefaultGroupableFeatureValues(Landroidx/camera/core/UseCase;)V
    .locals 6
    .param p1, "$this$validateDefaultGroupableFeatureValues"    # Landroidx/camera/core/UseCase;

    .line 188
    invoke-direct {p0, p1}, Landroidx/camera/core/SessionConfig;->getUseCaseName(Landroidx/camera/core/UseCase;)Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "useCaseName":Ljava/lang/String;
    sget-object v1, Landroidx/camera/core/featuregroup/impl/UseCaseType;->Companion:Landroidx/camera/core/featuregroup/impl/UseCaseType$Companion;

    invoke-virtual {v1, p1}, Landroidx/camera/core/featuregroup/impl/UseCaseType$Companion;->getAppConfiguredGroupableFeatureType$camera_core_release(Landroidx/camera/core/UseCase;)Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;

    move-result-object v1

    .line 191
    .local v1, "conflictingFeatureType":Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;
    if-nez v1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_2

    const/4 v2, 0x0

    .line 192
    .local v2, "$i$a$-require-SessionConfig$validateDefaultGroupableFeatureValues$1":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "A "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " value is set to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 193
    nop

    .line 192
    const-string v4, " despite using feature groups. Do not use APIs like "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 193
    nop

    .line 192
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 193
    nop

    .line 192
    const-string v4, ".Builder."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 194
    sget-object v4, Landroidx/camera/core/SessionConfig$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v1}, Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    new-instance v3, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v3}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v3

    .line 203
    :pswitch_0
    const-string/jumbo v4, "setOutputFormat"

    goto :goto_1

    .line 198
    :pswitch_1
    invoke-static {p1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isVideoCapture(Landroidx/camera/core/UseCase;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 199
    const-string/jumbo v4, "setVideoStabilizationEnabled"

    goto :goto_1

    .line 201
    :cond_1
    const-string/jumbo v4, "setPreviewStabilizationEnabled"

    goto :goto_1

    .line 196
    :pswitch_2
    const-string/jumbo v4, "setTargetFrameRateRange"

    goto :goto_1

    .line 195
    :pswitch_3
    const-string/jumbo v4, "setDynamicRange"

    .line 192
    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 205
    nop

    .line 192
    const-string v4, " while using feature groups. If "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 207
    sget-object v4, Landroidx/camera/core/SessionConfig$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v1}, Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_1

    new-instance v3, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v3}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v3

    .line 211
    :pswitch_4
    const-string v4, "JPEG_R output format"

    goto :goto_2

    .line 210
    :pswitch_5
    const-string/jumbo v4, "stabilization"

    goto :goto_2

    .line 209
    :pswitch_6
    const-string v4, "60 FPS"

    goto :goto_2

    .line 208
    :pswitch_7
    const-string v4, "HDR"

    .line 192
    :goto_2
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 213
    nop

    .line 192
    const-string v4, " is required, instead set "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 214
    sget-object v4, Landroidx/camera/core/SessionConfig$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v1}, Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_2

    new-instance v3, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v3}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v3

    .line 219
    :pswitch_8
    const-string v4, "GroupableFeature.IMAGE_ULTRA_HDR"

    goto :goto_3

    .line 218
    :pswitch_9
    const-string v4, "GroupableFeature.PREVIEW_STABILIZATION"

    goto :goto_3

    .line 216
    :pswitch_a
    const-string v4, "GroupableFeature.FPS_60"

    goto :goto_3

    .line 215
    :pswitch_b
    const-string v4, "GroupableFeature.HDR_HLG10"

    .line 192
    :goto_3
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 221
    nop

    .line 192
    const-string v4, " as either a required or preferred feature."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 221
    nop

    .line 191
    .end local v2    # "$i$a$-require-SessionConfig$validateDefaultGroupableFeatureValues$1":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 223
    :cond_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method private final validateFeatureGroups()V
    .locals 11

    .line 141
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->requiredFeatureGroup:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->preferredFeatureGroup:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    return-void

    .line 147
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/SessionConfig;->validateRequiredFeatures()V

    .line 149
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->preferredFeatureGroup:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Landroidx/camera/core/SessionConfig;->preferredFeatureGroup:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v3

    :goto_0
    if-eqz v0, :cond_7

    .line 153
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->requiredFeatureGroup:Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    iget-object v1, p0, Landroidx/camera/core/SessionConfig;->preferredFeatureGroup:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->intersect(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    .line 154
    .local v0, "duplicateFeatures":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 158
    iget-object v1, p0, Landroidx/camera/core/SessionConfig;->useCases:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 397
    .local v4, "$i$f$forEach":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Landroidx/camera/core/UseCase;

    .local v7, "useCase":Landroidx/camera/core/UseCase;
    const/4 v8, 0x0

    .line 159
    .local v8, "$i$a$-forEach-SessionConfig$validateFeatureGroups$3":I
    sget-object v9, Landroidx/camera/core/featuregroup/impl/UseCaseType;->Companion:Landroidx/camera/core/featuregroup/impl/UseCaseType$Companion;

    invoke-virtual {v9, v7}, Landroidx/camera/core/featuregroup/impl/UseCaseType$Companion;->getFeatureGroupUseCaseType(Landroidx/camera/core/UseCase;)Landroidx/camera/core/featuregroup/impl/UseCaseType;

    move-result-object v9

    sget-object v10, Landroidx/camera/core/featuregroup/impl/UseCaseType;->UNDEFINED:Landroidx/camera/core/featuregroup/impl/UseCaseType;

    if-eq v9, v10, :cond_2

    move v9, v2

    goto :goto_2

    :cond_2
    move v9, v3

    :goto_2
    if-eqz v9, :cond_3

    .line 163
    invoke-direct {p0, v7}, Landroidx/camera/core/SessionConfig;->validateDefaultGroupableFeatureValues(Landroidx/camera/core/UseCase;)V

    .line 164
    nop

    .line 397
    .end local v7    # "useCase":Landroidx/camera/core/UseCase;
    .end local v8    # "$i$a$-forEach-SessionConfig$validateFeatureGroups$3":I
    nop

    .end local v6    # "element$iv":Ljava/lang/Object;
    goto :goto_1

    .line 159
    .restart local v6    # "element$iv":Ljava/lang/Object;
    .restart local v7    # "useCase":Landroidx/camera/core/UseCase;
    .restart local v8    # "$i$a$-forEach-SessionConfig$validateFeatureGroups$3":I
    :cond_3
    const/4 v2, 0x0

    .line 160
    .local v2, "$i$a$-require-SessionConfig$validateFeatureGroups$3$1":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " is not supported with feature group"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 159
    .end local v2    # "$i$a$-require-SessionConfig$validateFeatureGroups$3$1":I
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 398
    .end local v6    # "element$iv":Ljava/lang/Object;
    .end local v7    # "useCase":Landroidx/camera/core/UseCase;
    .end local v8    # "$i$a$-forEach-SessionConfig$validateFeatureGroups$3":I
    :cond_4
    nop

    .line 166
    .end local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$forEach":I
    iget-object v1, p0, Landroidx/camera/core/SessionConfig;->effects:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 167
    return-void

    .line 399
    :cond_5
    const/4 v1, 0x0

    .line 166
    .local v1, "$i$a$-require-SessionConfig$validateFeatureGroups$4":I
    nop

    .end local v1    # "$i$a$-require-SessionConfig$validateFeatureGroups$4":I
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Effects aren\'t supported with feature group yet"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 154
    :cond_6
    const/4 v1, 0x0

    .line 155
    .local v1, "$i$a$-require-SessionConfig$validateFeatureGroups$2":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "requiredFeatures and preferredFeatures have duplicate values: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 154
    .end local v1    # "$i$a$-require-SessionConfig$validateFeatureGroups$2":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 149
    .end local v0    # "duplicateFeatures":Ljava/util/Set;
    :cond_7
    const/4 v0, 0x0

    .line 150
    .local v0, "$i$a$-require-SessionConfig$validateFeatureGroups$1":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate values in preferredFeatures("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/core/SessionConfig;->preferredFeatureGroup:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 149
    .end local v0    # "$i$a$-require-SessionConfig$validateFeatureGroups$1":I
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private final validateFrameRate()V
    .locals 3

    .line 127
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->frameRateRange:Landroid/util/Range;

    sget-object v1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    return-void

    .line 130
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->useCases:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase;

    .line 131
    .local v1, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v1}, Landroidx/camera/core/UseCase;->getAppConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v2

    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->hasTargetFrameRate()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 132
    .local v0, "$i$a$-require-SessionConfig$validateFrameRate$1":I
    nop

    .line 135
    nop

    .line 131
    .end local v0    # "$i$a$-require-SessionConfig$validateFrameRate$1":I
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "Can\'t set target frame rate on a UseCase (by Preview.Builder.setTargetFrameRate() or VideoCapture.Builder.setTargetFrameRate()) if the frame rate range has already been set in the SessionConfig."

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    .end local v1    # "useCase":Landroidx/camera/core/UseCase;
    :cond_2
    return-void
.end method

.method private final validateRequiredFeatures()V
    .locals 18

    .line 176
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/camera/core/SessionConfig;->requiredFeatureGroup:Ljava/util/Set;

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 400
    .local v2, "$i$f$map":I
    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v1, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v3, Ljava/util/Collection;

    .local v3, "destination$iv$iv":Ljava/util/Collection;
    move-object v4, v1

    .local v4, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 401
    .local v5, "$i$f$mapTo":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 402
    .local v7, "item$iv$iv":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Landroidx/camera/core/featuregroup/GroupableFeature;

    .local v8, "it":Landroidx/camera/core/featuregroup/GroupableFeature;
    const/4 v9, 0x0

    .line 176
    .local v9, "$i$a$-map-SessionConfig$validateRequiredFeatures$requiredFeatureTypes$1":I
    invoke-virtual {v8}, Landroidx/camera/core/featuregroup/GroupableFeature;->getFeatureTypeInternal$camera_core_release()Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;

    move-result-object v8

    .line 402
    .end local v8    # "it":Landroidx/camera/core/featuregroup/GroupableFeature;
    .end local v9    # "$i$a$-map-SessionConfig$validateRequiredFeatures$requiredFeatureTypes$1":I
    invoke-interface {v3, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 403
    .end local v7    # "item$iv$iv":Ljava/lang/Object;
    :cond_0
    nop

    .end local v3    # "destination$iv$iv":Ljava/util/Collection;
    .end local v4    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$mapTo":I
    check-cast v3, Ljava/util/List;

    .line 400
    nop

    .end local v1    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$map":I
    check-cast v3, Ljava/lang/Iterable;

    .line 176
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    .line 177
    .local v1, "requiredFeatureTypes":Ljava/util/List;
    move-object v2, v1

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 404
    .local v3, "$i$f$forEach":I
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;

    .local v6, "featureType":Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;
    const/4 v7, 0x0

    .line 179
    .local v7, "$i$a$-forEach-SessionConfig$validateRequiredFeatures$1":I
    iget-object v8, v0, Landroidx/camera/core/SessionConfig;->requiredFeatureGroup:Ljava/util/Set;

    check-cast v8, Ljava/lang/Iterable;

    .local v8, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 405
    .local v9, "$i$f$filter":I
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    check-cast v10, Ljava/util/Collection;

    .local v10, "destination$iv$iv":Ljava/util/Collection;
    move-object v11, v8

    .local v11, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 406
    .local v12, "$i$f$filterTo":I
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_1
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_3

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .local v14, "element$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v14

    check-cast v16, Landroidx/camera/core/featuregroup/GroupableFeature;

    .local v16, "it":Landroidx/camera/core/featuregroup/GroupableFeature;
    const/16 v17, 0x0

    .line 179
    .local v17, "$i$a$-filter-SessionConfig$validateRequiredFeatures$1$distinctFeaturesPerType$1":I
    invoke-virtual/range {v16 .. v16}, Landroidx/camera/core/featuregroup/GroupableFeature;->getFeatureTypeInternal$camera_core_release()Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;

    move-result-object v15

    if-ne v15, v6, :cond_2

    const/4 v15, 0x1

    goto :goto_3

    :cond_2
    const/4 v15, 0x0

    .line 406
    .end local v16    # "it":Landroidx/camera/core/featuregroup/GroupableFeature;
    .end local v17    # "$i$a$-filter-SessionConfig$validateRequiredFeatures$1$distinctFeaturesPerType$1":I
    :goto_3
    if-eqz v15, :cond_1

    invoke-interface {v10, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 407
    .end local v14    # "element$iv$iv":Ljava/lang/Object;
    :cond_3
    nop

    .end local v10    # "destination$iv$iv":Ljava/util/Collection;
    .end local v11    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v12    # "$i$f$filterTo":I
    check-cast v10, Ljava/util/List;

    .line 405
    nop

    .line 179
    .end local v8    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$filter":I
    nop

    .line 178
    nop

    .line 181
    .local v10, "distinctFeaturesPerType":Ljava/util/List;
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-gt v8, v9, :cond_4

    move v15, v9

    goto :goto_4

    :cond_4
    const/4 v15, 0x0

    :goto_4
    if-eqz v15, :cond_5

    .line 184
    nop

    .line 404
    .end local v6    # "featureType":Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;
    .end local v7    # "$i$a$-forEach-SessionConfig$validateRequiredFeatures$1":I
    .end local v10    # "distinctFeaturesPerType":Ljava/util/List;
    nop

    .end local v5    # "element$iv":Ljava/lang/Object;
    goto :goto_1

    .line 181
    .restart local v5    # "element$iv":Ljava/lang/Object;
    .restart local v6    # "featureType":Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;
    .restart local v7    # "$i$a$-forEach-SessionConfig$validateRequiredFeatures$1":I
    .restart local v10    # "distinctFeaturesPerType":Ljava/util/List;
    :cond_5
    const/4 v4, 0x0

    .line 182
    .local v4, "$i$a$-require-SessionConfig$validateRequiredFeatures$1$1":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "requiredFeatures has conflicting feature values: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 181
    .end local v4    # "$i$a$-require-SessionConfig$validateRequiredFeatures$1$1":I
    new-instance v8, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v8, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 408
    .end local v5    # "element$iv":Ljava/lang/Object;
    .end local v6    # "featureType":Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;
    .end local v7    # "$i$a$-forEach-SessionConfig$validateRequiredFeatures$1":I
    .end local v10    # "distinctFeaturesPerType":Ljava/util/List;
    :cond_6
    nop

    .line 185
    .end local v2    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$forEach":I
    return-void
.end method


# virtual methods
.method public final getEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->effects:Ljava/util/List;

    return-object v0
.end method

.method public final getFeatureSelectionListener()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Ljava/util/Set<",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;>;"
        }
    .end annotation

    .line 106
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->featureSelectionListener:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final getFeatureSelectionListenerExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 115
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->featureSelectionListenerExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public final getFrameRateRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 91
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->frameRateRange:Landroid/util/Range;

    return-object v0
.end method

.method public final getPreferredFeatureGroup()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->preferredFeatureGroup:Ljava/util/List;

    return-object v0
.end method

.method public final getRequiredFeatureGroup()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;"
        }
    .end annotation

    .line 92
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->requiredFeatureGroup:Ljava/util/Set;

    return-object v0
.end method

.method public getSessionType()I
    .locals 1

    .line 98
    iget v0, p0, Landroidx/camera/core/SessionConfig;->sessionType:I

    return v0
.end method

.method public final getUseCases()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation

    .line 95
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->useCases:Ljava/util/List;

    return-object v0
.end method

.method public final getViewPort()Landroidx/camera/core/ViewPort;
    .locals 1

    .line 89
    iget-object v0, p0, Landroidx/camera/core/SessionConfig;->viewPort:Landroidx/camera/core/ViewPort;

    return-object v0
.end method

.method public isLegacy()Z
    .locals 1

    .line 97
    iget-boolean v0, p0, Landroidx/camera/core/SessionConfig;->isLegacy:Z

    return v0
.end method

.method public final setFeatureSelectionListener(Landroidx/core/util/Consumer;)V
    .locals 2
    .param p1, "listener"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Ljava/util/Set<",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;>;)V"
        }
    .end annotation

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, p1, v1, v0}, Landroidx/camera/core/SessionConfig;->setFeatureSelectionListener$default(Landroidx/camera/core/SessionConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;ILjava/lang/Object;)V

    .line 264
    return-void
.end method

.method public final setFeatureSelectionListener(Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Ljava/util/Set<",
            "Landroidx/camera/core/featuregroup/GroupableFeature;",
            ">;>;)V"
        }
    .end annotation

    const-string v0, "executor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 262
    iput-object p2, p0, Landroidx/camera/core/SessionConfig;->featureSelectionListener:Landroidx/core/util/Consumer;

    .line 263
    iput-object p1, p0, Landroidx/camera/core/SessionConfig;->featureSelectionListenerExecutor:Ljava/util/concurrent/Executor;

    .line 264
    return-void
.end method
