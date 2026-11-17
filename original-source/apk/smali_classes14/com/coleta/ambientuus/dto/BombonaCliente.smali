.class public Lcom/coleta/ambientuus/dto/BombonaCliente;
.super Ljava/lang/Object;
.source "BombonaCliente.java"


# instance fields
.field codCliente:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cod_cliente"
    .end annotation
.end field

.field dataColeta:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "data_coleta"
    .end annotation
.end field

.field etiquetas:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "etiquetas"
    .end annotation
.end field

.field nomeCliente:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "nome_cliente"
    .end annotation
.end field

.field numeroManifesto:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "numero_mtr"
    .end annotation
.end field

.field peso:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "peso_liquido"
    .end annotation
.end field

.field quantidade:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "quantidade"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "codCliente"    # Ljava/lang/String;
    .param p2, "nomeCliente"    # Ljava/lang/String;
    .param p3, "dataColeta"    # Ljava/lang/String;
    .param p4, "quantidade"    # Ljava/lang/String;
    .param p5, "peso"    # Ljava/lang/String;
    .param p6, "numeroManifesto"    # Ljava/lang/String;
    .param p7, "etiquetas"    # Ljava/lang/String;

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->codCliente:Ljava/lang/String;

    iput-object p2, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->nomeCliente:Ljava/lang/String;

    iput-object p3, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->dataColeta:Ljava/lang/String;

    iput-object p4, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->quantidade:Ljava/lang/String;

    iput-object p5, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->peso:Ljava/lang/String;

    iput-object p6, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->numeroManifesto:Ljava/lang/String;

    iput-object p7, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->etiquetas:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected canEqual(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 10
    instance-of v0, p1, Lcom/coleta/ambientuus/dto/BombonaCliente;

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 19
    .param p1, "o"    # Ljava/lang/Object;

    .line 10
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x1

    if-ne v1, v0, :cond_0

    return v2

    :cond_0
    instance-of v3, v1, Lcom/coleta/ambientuus/dto/BombonaCliente;

    const/4 v4, 0x0

    if-nez v3, :cond_1

    return v4

    :cond_1
    move-object v3, v1

    check-cast v3, Lcom/coleta/ambientuus/dto/BombonaCliente;

    .local v3, "other":Lcom/coleta/ambientuus/dto/BombonaCliente;
    invoke-virtual {v3, v0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->canEqual(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    return v4

    :cond_2
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getCodCliente()Ljava/lang/String;

    move-result-object v5

    .local v5, "this$codCliente":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getCodCliente()Ljava/lang/String;

    move-result-object v6

    .local v6, "other$codCliente":Ljava/lang/Object;
    if-nez v5, :cond_3

    if-eqz v6, :cond_4

    goto :goto_0

    :cond_3
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    :goto_0
    return v4

    :cond_4
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNomeCliente()Ljava/lang/String;

    move-result-object v7

    .local v7, "this$nomeCliente":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNomeCliente()Ljava/lang/String;

    move-result-object v8

    .local v8, "other$nomeCliente":Ljava/lang/Object;
    if-nez v7, :cond_5

    if-eqz v8, :cond_6

    goto :goto_1

    :cond_5
    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    :goto_1
    return v4

    :cond_6
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getDataColeta()Ljava/lang/String;

    move-result-object v9

    .local v9, "this$dataColeta":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getDataColeta()Ljava/lang/String;

    move-result-object v10

    .local v10, "other$dataColeta":Ljava/lang/Object;
    if-nez v9, :cond_7

    if-eqz v10, :cond_8

    goto :goto_2

    :cond_7
    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_8

    :goto_2
    return v4

    :cond_8
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getQuantidade()Ljava/lang/String;

    move-result-object v11

    .local v11, "this$quantidade":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getQuantidade()Ljava/lang/String;

    move-result-object v12

    .local v12, "other$quantidade":Ljava/lang/Object;
    if-nez v11, :cond_9

    if-eqz v12, :cond_a

    goto :goto_3

    :cond_9
    invoke-virtual {v11, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_a

    :goto_3
    return v4

    :cond_a
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getPeso()Ljava/lang/String;

    move-result-object v13

    .local v13, "this$peso":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getPeso()Ljava/lang/String;

    move-result-object v14

    .local v14, "other$peso":Ljava/lang/Object;
    if-nez v13, :cond_b

    if-eqz v14, :cond_c

    goto :goto_4

    :cond_b
    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_c

    :goto_4
    return v4

    :cond_c
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v15

    move/from16 v16, v2

    .local v15, "this$numeroManifesto":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v2

    .local v2, "other$numeroManifesto":Ljava/lang/Object;
    if-nez v15, :cond_d

    if-eqz v2, :cond_e

    goto :goto_5

    :cond_d
    invoke-virtual {v15, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_e

    :goto_5
    return v4

    :cond_e
    move/from16 v17, v4

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getEtiquetas()Ljava/lang/String;

    move-result-object v4

    .local v4, "this$etiquetas":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getEtiquetas()Ljava/lang/String;

    move-result-object v0

    .local v0, "other$etiquetas":Ljava/lang/Object;
    if-nez v4, :cond_f

    if-eqz v0, :cond_10

    goto :goto_6

    :cond_f
    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_10

    :goto_6
    return v17

    :cond_10
    return v16
.end method

.method public getCodCliente()Ljava/lang/String;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->codCliente:Ljava/lang/String;

    return-object v0
.end method

.method public getDataColeta()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->dataColeta:Ljava/lang/String;

    return-object v0
.end method

.method public getEtiquetas()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->etiquetas:Ljava/lang/String;

    return-object v0
.end method

.method public getNomeCliente()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->nomeCliente:Ljava/lang/String;

    return-object v0
.end method

.method public getNumeroManifesto()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->numeroManifesto:Ljava/lang/String;

    return-object v0
.end method

.method public getPeso()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->peso:Ljava/lang/String;

    return-object v0
.end method

.method public getQuantidade()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->quantidade:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 11

    .line 10
    const/16 v0, 0x3b

    .local v0, "PRIME":I
    const/4 v1, 0x1

    .local v1, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getCodCliente()Ljava/lang/String;

    move-result-object v2

    .local v2, "$codCliente":Ljava/lang/Object;
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
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNomeCliente()Ljava/lang/String;

    move-result-object v1

    .local v1, "$nomeCliente":Ljava/lang/Object;
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
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getDataColeta()Ljava/lang/String;

    move-result-object v3

    .local v3, "$dataColeta":Ljava/lang/Object;
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
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getQuantidade()Ljava/lang/String;

    move-result-object v5

    .local v5, "$quantidade":Ljava/lang/Object;
    mul-int/lit8 v7, v6, 0x3b

    if-nez v5, :cond_3

    move v8, v4

    goto :goto_3

    :cond_3
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v8

    :goto_3
    add-int/2addr v7, v8

    .end local v6    # "result":I
    .local v7, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getPeso()Ljava/lang/String;

    move-result-object v6

    .local v6, "$peso":Ljava/lang/Object;
    mul-int/lit8 v8, v7, 0x3b

    if-nez v6, :cond_4

    move v9, v4

    goto :goto_4

    :cond_4
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v9

    :goto_4
    add-int/2addr v8, v9

    .end local v7    # "result":I
    .local v8, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v7

    .local v7, "$numeroManifesto":Ljava/lang/Object;
    mul-int/lit8 v9, v8, 0x3b

    if-nez v7, :cond_5

    move v10, v4

    goto :goto_5

    :cond_5
    invoke-virtual {v7}, Ljava/lang/Object;->hashCode()I

    move-result v10

    :goto_5
    add-int/2addr v9, v10

    .end local v8    # "result":I
    .local v9, "result":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getEtiquetas()Ljava/lang/String;

    move-result-object v8

    .local v8, "$etiquetas":Ljava/lang/Object;
    mul-int/lit8 v10, v9, 0x3b

    if-nez v8, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v8}, Ljava/lang/Object;->hashCode()I

    move-result v4

    :goto_6
    add-int/2addr v10, v4

    .end local v9    # "result":I
    .local v10, "result":I
    return v10
.end method

.method public setCodCliente(Ljava/lang/String;)V
    .locals 0
    .param p1, "codCliente"    # Ljava/lang/String;

    .line 10
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->codCliente:Ljava/lang/String;

    return-void
.end method

.method public setDataColeta(Ljava/lang/String;)V
    .locals 0
    .param p1, "dataColeta"    # Ljava/lang/String;

    .line 10
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->dataColeta:Ljava/lang/String;

    return-void
.end method

.method public setEtiquetas(Ljava/lang/String;)V
    .locals 0
    .param p1, "etiquetas"    # Ljava/lang/String;

    .line 10
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->etiquetas:Ljava/lang/String;

    return-void
.end method

.method public setNomeCliente(Ljava/lang/String;)V
    .locals 0
    .param p1, "nomeCliente"    # Ljava/lang/String;

    .line 10
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->nomeCliente:Ljava/lang/String;

    return-void
.end method

.method public setNumeroManifesto(Ljava/lang/String;)V
    .locals 0
    .param p1, "numeroManifesto"    # Ljava/lang/String;

    .line 10
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->numeroManifesto:Ljava/lang/String;

    return-void
.end method

.method public setPeso(Ljava/lang/String;)V
    .locals 0
    .param p1, "peso"    # Ljava/lang/String;

    .line 10
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->peso:Ljava/lang/String;

    return-void
.end method

.method public setQuantidade(Ljava/lang/String;)V
    .locals 0
    .param p1, "quantidade"    # Ljava/lang/String;

    .line 10
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/BombonaCliente;->quantidade:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BombonaCliente(codCliente="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getCodCliente()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", nomeCliente="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNomeCliente()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", dataColeta="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getDataColeta()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", quantidade="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getQuantidade()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", peso="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getPeso()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", numeroManifesto="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", etiquetas="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getEtiquetas()Ljava/lang/String;

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
