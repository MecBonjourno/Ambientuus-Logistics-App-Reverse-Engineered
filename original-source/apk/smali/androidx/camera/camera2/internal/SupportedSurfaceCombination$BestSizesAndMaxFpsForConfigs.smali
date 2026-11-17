.class abstract Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
.super Ljava/lang/Object;
.source "SupportedSurfaceCombination.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/SupportedSurfaceCombination;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BestSizesAndMaxFpsForConfigs"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 2178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static of(Ljava/util/List;Ljava/util/List;III)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    .locals 6
    .param p2, "maxFpsForBestSizes"    # I
    .param p3, "maxFpsForStreamUseCase"    # I
    .param p4, "maxFpsForAllSizes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;III)",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;"
        }
    .end annotation

    .line 2182
    .local p0, "bestSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local p1, "bestSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .end local p0    # "bestSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local p1    # "bestSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local p2    # "maxFpsForBestSizes":I
    .end local p3    # "maxFpsForStreamUseCase":I
    .end local p4    # "maxFpsForAllSizes":I
    .local v1, "bestSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v2, "bestSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v3, "maxFpsForBestSizes":I
    .local v4, "maxFpsForStreamUseCase":I
    .local v5, "maxFpsForAllSizes":I
    invoke-direct/range {v0 .. v5}, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;-><init>(Ljava/util/List;Ljava/util/List;III)V

    return-object v0
.end method


# virtual methods
.method abstract getBestSizes()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end method

.method abstract getBestSizesForStreamUseCase()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end method

.method abstract getMaxFpsForAllSizes()I
.end method

.method abstract getMaxFpsForBestSizes()I
.end method

.method abstract getMaxFpsForStreamUseCase()I
.end method
