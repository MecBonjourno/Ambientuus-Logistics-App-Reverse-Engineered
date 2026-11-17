.class public Lcom/coleta/ambientuus/dto/list/PontoColetaList;
.super Ljava/lang/Object;
.source "PontoColetaList.java"


# instance fields
.field private pontosColeta:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pontos"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected canEqual(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 11
    instance-of v0, p1, Lcom/coleta/ambientuus/dto/list/PontoColetaList;

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .line 11
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/coleta/ambientuus/dto/list/PontoColetaList;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/coleta/ambientuus/dto/list/PontoColetaList;

    .local v1, "other":Lcom/coleta/ambientuus/dto/list/PontoColetaList;
    invoke-virtual {v1, p0}, Lcom/coleta/ambientuus/dto/list/PontoColetaList;->canEqual(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/list/PontoColetaList;->getPontosColeta()Ljava/util/List;

    move-result-object v3

    .local v3, "this$pontosColeta":Ljava/lang/Object;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/list/PontoColetaList;->getPontosColeta()Ljava/util/List;

    move-result-object v4

    .local v4, "other$pontosColeta":Ljava/lang/Object;
    if-nez v3, :cond_3

    if-eqz v4, :cond_4

    goto :goto_0

    :cond_3
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    :goto_0
    return v2

    :cond_4
    return v0
.end method

.method public getPontosColeta()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;"
        }
    .end annotation

    .line 14
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/PontoColetaList;->pontosColeta:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 11
    const/16 v0, 0x3b

    .local v0, "PRIME":I
    const/4 v1, 0x1

    .local v1, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/list/PontoColetaList;->getPontosColeta()Ljava/util/List;

    move-result-object v2

    .local v2, "$pontosColeta":Ljava/lang/Object;
    mul-int/lit8 v3, v1, 0x3b

    if-nez v2, :cond_0

    const/16 v4, 0x2b

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v4

    :goto_0
    add-int/2addr v3, v4

    .end local v1    # "result":I
    .local v3, "result":I
    return v3
.end method

.method public setPontosColeta(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;)V"
        }
    .end annotation

    .line 11
    .local p1, "pontosColeta":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/PontoColeta;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/PontoColetaList;->pontosColeta:Ljava/util/List;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PontoColetaList(pontosColeta="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/list/PontoColetaList;->getPontosColeta()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
