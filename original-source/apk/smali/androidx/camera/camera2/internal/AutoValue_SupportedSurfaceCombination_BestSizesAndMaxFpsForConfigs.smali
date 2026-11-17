.class final Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;
.super Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
.source "AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs.java"


# instance fields
.field private final bestSizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private final bestSizesForStreamUseCase:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private final maxFpsForAllSizes:I

.field private final maxFpsForBestSizes:I

.field private final maxFpsForStreamUseCase:I


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;III)V
    .locals 0
    .param p3, "maxFpsForBestSizes"    # I
    .param p4, "maxFpsForStreamUseCase"    # I
    .param p5, "maxFpsForAllSizes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;III)V"
        }
    .end annotation

    .line 27
    .local p1, "bestSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local p2, "bestSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;-><init>()V

    .line 28
    iput-object p1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizes:Ljava/util/List;

    .line 29
    iput-object p2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizesForStreamUseCase:Ljava/util/List;

    .line 30
    iput p3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForBestSizes:I

    .line 31
    iput p4, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForStreamUseCase:I

    .line 32
    iput p5, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForAllSizes:I

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 73
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 74
    return v0

    .line 76
    :cond_0
    instance-of v1, p1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    .line 77
    move-object v1, p1

    check-cast v1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;

    .line 78
    .local v1, "that":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizes:Ljava/util/List;

    if-nez v3, :cond_1

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getBestSizes()Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_3

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizes:Ljava/util/List;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getBestSizes()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :goto_0
    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizesForStreamUseCase:Ljava/util/List;

    if-nez v3, :cond_2

    .line 79
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getBestSizesForStreamUseCase()Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_3

    goto :goto_1

    :cond_2
    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizesForStreamUseCase:Ljava/util/List;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getBestSizesForStreamUseCase()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :goto_1
    iget v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForBestSizes:I

    .line 80
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getMaxFpsForBestSizes()I

    move-result v4

    if-ne v3, v4, :cond_3

    iget v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForStreamUseCase:I

    .line 81
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getMaxFpsForStreamUseCase()I

    move-result v4

    if-ne v3, v4, :cond_3

    iget v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForAllSizes:I

    .line 82
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;->getMaxFpsForAllSizes()I

    move-result v4

    if-ne v3, v4, :cond_3

    goto :goto_2

    :cond_3
    move v0, v2

    .line 78
    :goto_2
    return v0

    .line 84
    .end local v1    # "that":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$BestSizesAndMaxFpsForConfigs;
    :cond_4
    return v2
.end method

.method getBestSizes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizes:Ljava/util/List;

    return-object v0
.end method

.method getBestSizesForStreamUseCase()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizesForStreamUseCase:Ljava/util/List;

    return-object v0
.end method

.method getMaxFpsForAllSizes()I
    .locals 1

    .line 57
    iget v0, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForAllSizes:I

    return v0
.end method

.method getMaxFpsForBestSizes()I
    .locals 1

    .line 47
    iget v0, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForBestSizes:I

    return v0
.end method

.method getMaxFpsForStreamUseCase()I
    .locals 1

    .line 52
    iget v0, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForStreamUseCase:I

    return v0
.end method

.method public hashCode()I
    .locals 4

    .line 89
    const/4 v0, 0x1

    .line 90
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 91
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizes:Ljava/util/List;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    :goto_0
    xor-int/2addr v0, v2

    .line 92
    mul-int/2addr v0, v1

    .line 93
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizesForStreamUseCase:Ljava/util/List;

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizesForStreamUseCase:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v3

    :goto_1
    xor-int/2addr v0, v3

    .line 94
    mul-int/2addr v0, v1

    .line 95
    iget v2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForBestSizes:I

    xor-int/2addr v0, v2

    .line 96
    mul-int/2addr v0, v1

    .line 97
    iget v2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForStreamUseCase:I

    xor-int/2addr v0, v2

    .line 98
    mul-int/2addr v0, v1

    .line 99
    iget v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForAllSizes:I

    xor-int/2addr v0, v1

    .line 100
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BestSizesAndMaxFpsForConfigs{bestSizes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizes:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bestSizesForStreamUseCase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->bestSizesForStreamUseCase:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxFpsForBestSizes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForBestSizes:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxFpsForStreamUseCase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForStreamUseCase:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxFpsForAllSizes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs;->maxFpsForAllSizes:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
