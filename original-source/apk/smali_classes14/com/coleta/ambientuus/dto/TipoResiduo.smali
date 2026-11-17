.class public Lcom/coleta/ambientuus/dto/TipoResiduo;
.super Ljava/lang/Object;
.source "TipoResiduo.java"


# instance fields
.field private codigo:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "codigo"
    .end annotation
.end field

.field private descricao:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "descricao"
    .end annotation
.end field

.field private id:Ljava/lang/Integer;

.field private id_tipo_residuo:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_tipo_residuo"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Integer;
    .param p2, "id_tipo_residuo"    # Ljava/lang/Integer;
    .param p3, "codigo"    # Ljava/lang/String;
    .param p4, "descricao"    # Ljava/lang/String;

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->id:Ljava/lang/Integer;

    iput-object p2, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->id_tipo_residuo:Ljava/lang/Integer;

    iput-object p3, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->codigo:Ljava/lang/String;

    iput-object p4, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->descricao:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected canEqual(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 9
    instance-of v0, p1, Lcom/coleta/ambientuus/dto/TipoResiduo;

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 12
    .param p1, "o"    # Ljava/lang/Object;

    .line 9
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/coleta/ambientuus/dto/TipoResiduo;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/coleta/ambientuus/dto/TipoResiduo;

    .local v1, "other":Lcom/coleta/ambientuus/dto/TipoResiduo;
    invoke-virtual {v1, p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->canEqual(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId()Ljava/lang/Integer;

    move-result-object v3

    .local v3, "this$id":Ljava/lang/Object;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId()Ljava/lang/Integer;

    move-result-object v4

    .local v4, "other$id":Ljava/lang/Object;
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
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId_tipo_residuo()Ljava/lang/Integer;

    move-result-object v5

    .local v5, "this$id_tipo_residuo":Ljava/lang/Object;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId_tipo_residuo()Ljava/lang/Integer;

    move-result-object v6

    .local v6, "other$id_tipo_residuo":Ljava/lang/Object;
    if-nez v5, :cond_5

    if-eqz v6, :cond_6

    goto :goto_1

    :cond_5
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    :goto_1
    return v2

    :cond_6
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getCodigo()Ljava/lang/String;

    move-result-object v7

    .local v7, "this$codigo":Ljava/lang/Object;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getCodigo()Ljava/lang/String;

    move-result-object v8

    .local v8, "other$codigo":Ljava/lang/Object;
    if-nez v7, :cond_7

    if-eqz v8, :cond_8

    goto :goto_2

    :cond_7
    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8

    :goto_2
    return v2

    :cond_8
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getDescricao()Ljava/lang/String;

    move-result-object v9

    .local v9, "this$descricao":Ljava/lang/Object;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getDescricao()Ljava/lang/String;

    move-result-object v10

    .local v10, "other$descricao":Ljava/lang/Object;
    if-nez v9, :cond_9

    if-eqz v10, :cond_a

    goto :goto_3

    :cond_9
    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a

    :goto_3
    return v2

    :cond_a
    return v0
.end method

.method public getCodigo()Ljava/lang/String;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->codigo:Ljava/lang/String;

    return-object v0
.end method

.method public getDescricao()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->descricao:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/Integer;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->id:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_tipo_residuo()Ljava/lang/Integer;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->id_tipo_residuo:Ljava/lang/Integer;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .line 9
    const/16 v0, 0x3b

    .local v0, "PRIME":I
    const/4 v1, 0x1

    .local v1, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId()Ljava/lang/Integer;

    move-result-object v2

    .local v2, "$id":Ljava/lang/Object;
    mul-int/lit8 v3, v1, 0x3b

    const/16 v4, 0x2b

    if-nez v2, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v5

    :goto_0
    add-int/2addr v3, v5

    .end local v1    # "result":I
    .local v3, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId_tipo_residuo()Ljava/lang/Integer;

    move-result-object v1

    .local v1, "$id_tipo_residuo":Ljava/lang/Object;
    mul-int/lit8 v5, v3, 0x3b

    if-nez v1, :cond_1

    move v6, v4

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v6

    :goto_1
    add-int/2addr v5, v6

    .end local v3    # "result":I
    .local v5, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getCodigo()Ljava/lang/String;

    move-result-object v3

    .local v3, "$codigo":Ljava/lang/Object;
    mul-int/lit8 v6, v5, 0x3b

    if-nez v3, :cond_2

    move v7, v4

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v7

    :goto_2
    add-int/2addr v6, v7

    .end local v5    # "result":I
    .local v6, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getDescricao()Ljava/lang/String;

    move-result-object v5

    .local v5, "$descricao":Ljava/lang/Object;
    mul-int/lit8 v7, v6, 0x3b

    if-nez v5, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v4

    :goto_3
    add-int/2addr v7, v4

    .end local v6    # "result":I
    .local v7, "result":I
    return v7
.end method

.method public setCodigo(Ljava/lang/String;)V
    .locals 0
    .param p1, "codigo"    # Ljava/lang/String;

    .line 9
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->codigo:Ljava/lang/String;

    return-void
.end method

.method public setDescricao(Ljava/lang/String;)V
    .locals 0
    .param p1, "descricao"    # Ljava/lang/String;

    .line 9
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->descricao:Ljava/lang/String;

    return-void
.end method

.method public setId(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Integer;

    .line 9
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->id:Ljava/lang/Integer;

    return-void
.end method

.method public setId_tipo_residuo(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id_tipo_residuo"    # Ljava/lang/Integer;

    .line 9
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/TipoResiduo;->id_tipo_residuo:Ljava/lang/Integer;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TipoResiduo(id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", id_tipo_residuo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId_tipo_residuo()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", codigo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getCodigo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", descricao="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getDescricao()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
