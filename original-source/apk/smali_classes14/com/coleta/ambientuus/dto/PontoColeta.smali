.class public Lcom/coleta/ambientuus/dto/PontoColeta;
.super Ljava/lang/Object;
.source "PontoColeta.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private atualizado:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "atualizado"
    .end annotation
.end field

.field private clienteEmiteMtr:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cliente_emite_mtr"
    .end annotation
.end field

.field private clienteNovo:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cliente_novo"
    .end annotation
.end field

.field private codCliente:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cod_cliente"
    .end annotation
.end field

.field private coletaExtra:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "coleta_extra"
    .end annotation
.end field

.field private destino:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "unidest_razao_social"
    .end annotation
.end field

.field private endereco:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "endereco"
    .end annotation
.end field

.field private id:Ljava/lang/Integer;

.field private idCliente:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_cliente"
    .end annotation
.end field

.field private idColetaLogradouro:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_coleta_logradouro"
    .end annotation
.end field

.field private idDiaColeta:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_dia_coleta"
    .end annotation
.end field

.field private idManifesto:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_manifesto"
    .end annotation
.end field

.field private numeroManifesto:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "numero_manifesto"
    .end annotation
.end field

.field private observacaoMtr:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "observacao_mtr"
    .end annotation
.end field

.field private ordem:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ordem"
    .end annotation
.end field

.field private periodicidade:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "periodicidade"
    .end annotation
.end field

.field private razaoSocial:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "razao_social"
    .end annotation
.end field

.field private status:Ljava/lang/String;

.field private tipoResiduo:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "tipo_residuo"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 118
    new-instance v0, Lcom/coleta/ambientuus/dto/PontoColeta$1;

    invoke-direct {v0}, Lcom/coleta/ambientuus/dto/PontoColeta$1;-><init>()V

    sput-object v0, Lcom/coleta/ambientuus/dto/PontoColeta;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 76
    iput-object v1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->id:Ljava/lang/Integer;

    goto :goto_0

    .line 78
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->id:Ljava/lang/Integer;

    .line 80
    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-nez v0, :cond_1

    .line 81
    iput-object v1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idCliente:Ljava/lang/Integer;

    goto :goto_1

    .line 83
    :cond_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idCliente:Ljava/lang/Integer;

    .line 85
    :goto_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->codCliente:Ljava/lang/String;

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->razaoSocial:Ljava/lang/String;

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->endereco:Ljava/lang/String;

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->numeroManifesto:Ljava/lang/String;

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->observacaoMtr:Ljava/lang/String;

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->destino:Ljava/lang/String;

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->coletaExtra:Ljava/lang/String;

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->tipoResiduo:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-nez v0, :cond_2

    .line 94
    iput-object v1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->ordem:Ljava/lang/Integer;

    goto :goto_2

    .line 96
    :cond_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->ordem:Ljava/lang/Integer;

    .line 98
    :goto_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->periodicidade:Ljava/lang/String;

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteNovo:Ljava/lang/String;

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-nez v0, :cond_3

    .line 101
    iput-object v1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idManifesto:Ljava/lang/Integer;

    goto :goto_3

    .line 103
    :cond_3
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idManifesto:Ljava/lang/Integer;

    .line 105
    :goto_3
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-nez v0, :cond_4

    .line 106
    iput-object v1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idColetaLogradouro:Ljava/lang/Integer;

    goto :goto_4

    .line 108
    :cond_4
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idColetaLogradouro:Ljava/lang/Integer;

    .line 110
    :goto_4
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteEmiteMtr:Ljava/lang/String;

    .line 111
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-nez v0, :cond_5

    .line 112
    iput-object v1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idDiaColeta:Ljava/lang/Integer;

    goto :goto_5

    .line 114
    :cond_5
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idDiaColeta:Ljava/lang/Integer;

    .line 116
    :goto_5
    return-void
.end method

.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 16
    .param p1, "id"    # Ljava/lang/Integer;
    .param p2, "idCliente"    # Ljava/lang/Integer;
    .param p3, "codCliente"    # Ljava/lang/String;
    .param p4, "razaoSocial"    # Ljava/lang/String;
    .param p5, "endereco"    # Ljava/lang/String;
    .param p6, "numeroManifesto"    # Ljava/lang/String;
    .param p7, "observacaoMtr"    # Ljava/lang/String;
    .param p8, "destino"    # Ljava/lang/String;
    .param p9, "coletaExtra"    # Ljava/lang/String;
    .param p10, "tipoResiduo"    # Ljava/lang/String;
    .param p11, "ordem"    # Ljava/lang/Integer;
    .param p12, "periodicidade"    # Ljava/lang/String;
    .param p13, "clienteNovo"    # Ljava/lang/String;
    .param p14, "idManifesto"    # Ljava/lang/Integer;
    .param p15, "status"    # Ljava/lang/String;
    .param p16, "idColetaLogradouro"    # Ljava/lang/Integer;
    .param p17, "clienteEmiteMtr"    # Ljava/lang/String;
    .param p18, "atualizado"    # Ljava/lang/String;
    .param p19, "idDiaColeta"    # Ljava/lang/Integer;

    .line 15
    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->id:Ljava/lang/Integer;

    move-object/from16 v2, p2

    iput-object v2, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->idCliente:Ljava/lang/Integer;

    move-object/from16 v3, p3

    iput-object v3, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->codCliente:Ljava/lang/String;

    move-object/from16 v4, p4

    iput-object v4, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->razaoSocial:Ljava/lang/String;

    move-object/from16 v5, p5

    iput-object v5, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->endereco:Ljava/lang/String;

    move-object/from16 v6, p6

    iput-object v6, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->numeroManifesto:Ljava/lang/String;

    move-object/from16 v7, p7

    iput-object v7, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->observacaoMtr:Ljava/lang/String;

    move-object/from16 v8, p8

    iput-object v8, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->destino:Ljava/lang/String;

    move-object/from16 v9, p9

    iput-object v9, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->coletaExtra:Ljava/lang/String;

    move-object/from16 v10, p10

    iput-object v10, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->tipoResiduo:Ljava/lang/String;

    move-object/from16 v11, p11

    iput-object v11, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->ordem:Ljava/lang/Integer;

    move-object/from16 v12, p12

    iput-object v12, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->periodicidade:Ljava/lang/String;

    move-object/from16 v13, p13

    iput-object v13, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteNovo:Ljava/lang/String;

    move-object/from16 v14, p14

    iput-object v14, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->idManifesto:Ljava/lang/Integer;

    move-object/from16 v15, p15

    iput-object v15, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->status:Ljava/lang/String;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->idColetaLogradouro:Ljava/lang/Integer;

    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteEmiteMtr:Ljava/lang/String;

    move-object/from16 v1, p18

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->atualizado:Ljava/lang/String;

    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/PontoColeta;->idDiaColeta:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method protected canEqual(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 14
    instance-of v0, p1, Lcom/coleta/ambientuus/dto/PontoColeta;

    return v0
.end method

.method public contemTexto(Ljava/lang/String;)Z
    .locals 1
    .param p1, "texto"    # Ljava/lang/String;

    .line 187
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 188
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->codCliente:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->razaoSocial:Ljava/lang/String;

    .line 189
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->endereco:Ljava/lang/String;

    .line 190
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 188
    :goto_1
    return v0
.end method

.method public describeContents()I
    .locals 1

    .line 132
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 42
    .param p1, "o"    # Ljava/lang/Object;

    .line 14
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x1

    if-ne v1, v0, :cond_0

    return v2

    :cond_0
    instance-of v3, v1, Lcom/coleta/ambientuus/dto/PontoColeta;

    const/4 v4, 0x0

    if-nez v3, :cond_1

    return v4

    :cond_1
    move-object v3, v1

    check-cast v3, Lcom/coleta/ambientuus/dto/PontoColeta;

    .local v3, "other":Lcom/coleta/ambientuus/dto/PontoColeta;
    invoke-virtual {v3, v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->canEqual(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    return v4

    :cond_2
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v5

    .local v5, "this$id":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v6

    .local v6, "other$id":Ljava/lang/Object;
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
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v7

    .local v7, "this$idCliente":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v8

    .local v8, "other$idCliente":Ljava/lang/Object;
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
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getOrdem()Ljava/lang/Integer;

    move-result-object v9

    .local v9, "this$ordem":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getOrdem()Ljava/lang/Integer;

    move-result-object v10

    .local v10, "other$ordem":Ljava/lang/Object;
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
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v11

    .local v11, "this$idManifesto":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v12

    .local v12, "other$idManifesto":Ljava/lang/Object;
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
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v13

    .local v13, "this$idColetaLogradouro":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v14

    .local v14, "other$idColetaLogradouro":Ljava/lang/Object;
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
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v15

    move/from16 v16, v2

    .local v15, "this$idDiaColeta":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v2

    .local v2, "other$idDiaColeta":Ljava/lang/Object;
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

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getCodCliente()Ljava/lang/String;

    move-result-object v4

    .local v4, "this$codCliente":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getCodCliente()Ljava/lang/String;

    move-result-object v0

    .local v0, "other$codCliente":Ljava/lang/Object;
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
    move-object/from16 v18, v0

    .end local v0    # "other$codCliente":Ljava/lang/Object;
    .local v18, "other$codCliente":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getRazaoSocial()Ljava/lang/String;

    move-result-object v0

    .local v0, "this$razaoSocial":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getRazaoSocial()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$razaoSocial":Ljava/lang/Object;
    if-nez v0, :cond_11

    if-eqz v1, :cond_12

    goto :goto_7

    :cond_11
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_12

    :goto_7
    return v17

    :cond_12
    move-object/from16 v19, v0

    .end local v0    # "this$razaoSocial":Ljava/lang/Object;
    .local v19, "this$razaoSocial":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getEndereco()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v20, v1

    .end local v1    # "other$razaoSocial":Ljava/lang/Object;
    .local v0, "this$endereco":Ljava/lang/Object;
    .local v20, "other$razaoSocial":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getEndereco()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$endereco":Ljava/lang/Object;
    if-nez v0, :cond_13

    if-eqz v1, :cond_14

    goto :goto_8

    :cond_13
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_14

    :goto_8
    return v17

    :cond_14
    move-object/from16 v21, v0

    .end local v0    # "this$endereco":Ljava/lang/Object;
    .local v21, "this$endereco":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v22, v1

    .end local v1    # "other$endereco":Ljava/lang/Object;
    .local v0, "this$numeroManifesto":Ljava/lang/Object;
    .local v22, "other$endereco":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$numeroManifesto":Ljava/lang/Object;
    if-nez v0, :cond_15

    if-eqz v1, :cond_16

    goto :goto_9

    :cond_15
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_16

    :goto_9
    return v17

    :cond_16
    move-object/from16 v23, v0

    .end local v0    # "this$numeroManifesto":Ljava/lang/Object;
    .local v23, "this$numeroManifesto":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getObservacaoMtr()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v24, v1

    .end local v1    # "other$numeroManifesto":Ljava/lang/Object;
    .local v0, "this$observacaoMtr":Ljava/lang/Object;
    .local v24, "other$numeroManifesto":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getObservacaoMtr()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$observacaoMtr":Ljava/lang/Object;
    if-nez v0, :cond_17

    if-eqz v1, :cond_18

    goto :goto_a

    :cond_17
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_18

    :goto_a
    return v17

    :cond_18
    move-object/from16 v25, v0

    .end local v0    # "this$observacaoMtr":Ljava/lang/Object;
    .local v25, "this$observacaoMtr":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getDestino()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v26, v1

    .end local v1    # "other$observacaoMtr":Ljava/lang/Object;
    .local v0, "this$destino":Ljava/lang/Object;
    .local v26, "other$observacaoMtr":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getDestino()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$destino":Ljava/lang/Object;
    if-nez v0, :cond_19

    if-eqz v1, :cond_1a

    goto :goto_b

    :cond_19
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_1a

    :goto_b
    return v17

    :cond_1a
    move-object/from16 v27, v0

    .end local v0    # "this$destino":Ljava/lang/Object;
    .local v27, "this$destino":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v28, v1

    .end local v1    # "other$destino":Ljava/lang/Object;
    .local v0, "this$coletaExtra":Ljava/lang/Object;
    .local v28, "other$destino":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$coletaExtra":Ljava/lang/Object;
    if-nez v0, :cond_1b

    if-eqz v1, :cond_1c

    goto :goto_c

    :cond_1b
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-nez v29, :cond_1c

    :goto_c
    return v17

    :cond_1c
    move-object/from16 v29, v0

    .end local v0    # "this$coletaExtra":Ljava/lang/Object;
    .local v29, "this$coletaExtra":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getTipoResiduo()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v30, v1

    .end local v1    # "other$coletaExtra":Ljava/lang/Object;
    .local v0, "this$tipoResiduo":Ljava/lang/Object;
    .local v30, "other$coletaExtra":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getTipoResiduo()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$tipoResiduo":Ljava/lang/Object;
    if-nez v0, :cond_1d

    if-eqz v1, :cond_1e

    goto :goto_d

    :cond_1d
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-nez v31, :cond_1e

    :goto_d
    return v17

    :cond_1e
    move-object/from16 v31, v0

    .end local v0    # "this$tipoResiduo":Ljava/lang/Object;
    .local v31, "this$tipoResiduo":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getPeriodicidade()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v32, v1

    .end local v1    # "other$tipoResiduo":Ljava/lang/Object;
    .local v0, "this$periodicidade":Ljava/lang/Object;
    .local v32, "other$tipoResiduo":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getPeriodicidade()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$periodicidade":Ljava/lang/Object;
    if-nez v0, :cond_1f

    if-eqz v1, :cond_20

    goto :goto_e

    :cond_1f
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_20

    :goto_e
    return v17

    :cond_20
    move-object/from16 v33, v0

    .end local v0    # "this$periodicidade":Ljava/lang/Object;
    .local v33, "this$periodicidade":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteNovo()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v34, v1

    .end local v1    # "other$periodicidade":Ljava/lang/Object;
    .local v0, "this$clienteNovo":Ljava/lang/Object;
    .local v34, "other$periodicidade":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteNovo()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$clienteNovo":Ljava/lang/Object;
    if-nez v0, :cond_21

    if-eqz v1, :cond_22

    goto :goto_f

    :cond_21
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v35

    if-nez v35, :cond_22

    :goto_f
    return v17

    :cond_22
    move-object/from16 v35, v0

    .end local v0    # "this$clienteNovo":Ljava/lang/Object;
    .local v35, "this$clienteNovo":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v36, v1

    .end local v1    # "other$clienteNovo":Ljava/lang/Object;
    .local v0, "this$status":Ljava/lang/Object;
    .local v36, "other$clienteNovo":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$status":Ljava/lang/Object;
    if-nez v0, :cond_23

    if-eqz v1, :cond_24

    goto :goto_10

    :cond_23
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-nez v37, :cond_24

    :goto_10
    return v17

    :cond_24
    move-object/from16 v37, v0

    .end local v0    # "this$status":Ljava/lang/Object;
    .local v37, "this$status":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteEmiteMtr()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v38, v1

    .end local v1    # "other$status":Ljava/lang/Object;
    .local v0, "this$clienteEmiteMtr":Ljava/lang/Object;
    .local v38, "other$status":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteEmiteMtr()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$clienteEmiteMtr":Ljava/lang/Object;
    if-nez v0, :cond_25

    if-eqz v1, :cond_26

    goto :goto_11

    :cond_25
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_26

    :goto_11
    return v17

    :cond_26
    move-object/from16 v39, v0

    .end local v0    # "this$clienteEmiteMtr":Ljava/lang/Object;
    .local v39, "this$clienteEmiteMtr":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getAtualizado()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v40, v1

    .end local v1    # "other$clienteEmiteMtr":Ljava/lang/Object;
    .local v0, "this$atualizado":Ljava/lang/Object;
    .local v40, "other$clienteEmiteMtr":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getAtualizado()Ljava/lang/String;

    move-result-object v1

    .local v1, "other$atualizado":Ljava/lang/Object;
    if-nez v0, :cond_27

    if-eqz v1, :cond_28

    goto :goto_12

    :cond_27
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v41

    if-nez v41, :cond_28

    :goto_12
    return v17

    :cond_28
    return v16
.end method

.method public getAtualizado()Ljava/lang/String;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->atualizado:Ljava/lang/String;

    return-object v0
.end method

.method public getClienteEmiteMtr()Ljava/lang/String;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteEmiteMtr:Ljava/lang/String;

    return-object v0
.end method

.method public getClienteNovo()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteNovo:Ljava/lang/String;

    return-object v0
.end method

.method public getCodCliente()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->codCliente:Ljava/lang/String;

    return-object v0
.end method

.method public getColetaExtra()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->coletaExtra:Ljava/lang/String;

    return-object v0
.end method

.method public getDestino()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->destino:Ljava/lang/String;

    return-object v0
.end method

.method public getEndereco()Ljava/lang/String;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->endereco:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/Integer;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->id:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIdCliente()Ljava/lang/Integer;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idCliente:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIdColetaLogradouro()Ljava/lang/Integer;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idColetaLogradouro:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIdDiaColeta()Ljava/lang/Integer;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idDiaColeta:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIdManifesto()Ljava/lang/Integer;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idManifesto:Ljava/lang/Integer;

    return-object v0
.end method

.method public getNumeroManifesto()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->numeroManifesto:Ljava/lang/String;

    return-object v0
.end method

.method public getObservacaoMtr()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->observacaoMtr:Ljava/lang/String;

    return-object v0
.end method

.method public getOrdem()Ljava/lang/Integer;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->ordem:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPeriodicidade()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->periodicidade:Ljava/lang/String;

    return-object v0
.end method

.method public getRazaoSocial()Ljava/lang/String;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->razaoSocial:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->status:Ljava/lang/String;

    return-object v0
.end method

.method public getTipoResiduo()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->tipoResiduo:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 23

    .line 14
    const/16 v0, 0x3b

    .local v0, "PRIME":I
    const/4 v1, 0x1

    .local v1, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

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
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v1

    .local v1, "$idCliente":Ljava/lang/Object;
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
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getOrdem()Ljava/lang/Integer;

    move-result-object v3

    .local v3, "$ordem":Ljava/lang/Object;
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
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v5

    .local v5, "$idManifesto":Ljava/lang/Object;
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
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v6

    .local v6, "$idColetaLogradouro":Ljava/lang/Object;
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
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v7

    .local v7, "$idDiaColeta":Ljava/lang/Object;
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
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getCodCliente()Ljava/lang/String;

    move-result-object v8

    .local v8, "$codCliente":Ljava/lang/Object;
    mul-int/lit8 v10, v9, 0x3b

    if-nez v8, :cond_6

    move v11, v4

    goto :goto_6

    :cond_6
    invoke-virtual {v8}, Ljava/lang/Object;->hashCode()I

    move-result v11

    :goto_6
    add-int/2addr v10, v11

    .end local v9    # "result":I
    .local v10, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getRazaoSocial()Ljava/lang/String;

    move-result-object v9

    .local v9, "$razaoSocial":Ljava/lang/Object;
    mul-int/lit8 v11, v10, 0x3b

    if-nez v9, :cond_7

    move v12, v4

    goto :goto_7

    :cond_7
    invoke-virtual {v9}, Ljava/lang/Object;->hashCode()I

    move-result v12

    :goto_7
    add-int/2addr v11, v12

    .end local v10    # "result":I
    .local v11, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getEndereco()Ljava/lang/String;

    move-result-object v10

    .local v10, "$endereco":Ljava/lang/Object;
    mul-int/lit8 v12, v11, 0x3b

    if-nez v10, :cond_8

    move v13, v4

    goto :goto_8

    :cond_8
    invoke-virtual {v10}, Ljava/lang/Object;->hashCode()I

    move-result v13

    :goto_8
    add-int/2addr v12, v13

    .end local v11    # "result":I
    .local v12, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v11

    .local v11, "$numeroManifesto":Ljava/lang/Object;
    mul-int/lit8 v13, v12, 0x3b

    if-nez v11, :cond_9

    move v14, v4

    goto :goto_9

    :cond_9
    invoke-virtual {v11}, Ljava/lang/Object;->hashCode()I

    move-result v14

    :goto_9
    add-int/2addr v13, v14

    .end local v12    # "result":I
    .local v13, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getObservacaoMtr()Ljava/lang/String;

    move-result-object v12

    .local v12, "$observacaoMtr":Ljava/lang/Object;
    mul-int/lit8 v14, v13, 0x3b

    if-nez v12, :cond_a

    move v15, v4

    goto :goto_a

    :cond_a
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    move-result v15

    :goto_a
    add-int/2addr v14, v15

    .end local v13    # "result":I
    .local v14, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getDestino()Ljava/lang/String;

    move-result-object v13

    .local v13, "$destino":Ljava/lang/Object;
    mul-int/lit8 v15, v14, 0x3b

    if-nez v13, :cond_b

    move/from16 v16, v4

    goto :goto_b

    :cond_b
    invoke-virtual {v13}, Ljava/lang/Object;->hashCode()I

    move-result v16

    :goto_b
    add-int v15, v15, v16

    .end local v14    # "result":I
    .local v15, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v14

    .local v14, "$coletaExtra":Ljava/lang/Object;
    mul-int/lit8 v16, v15, 0x3b

    if-nez v14, :cond_c

    move/from16 v17, v4

    goto :goto_c

    :cond_c
    invoke-virtual {v14}, Ljava/lang/Object;->hashCode()I

    move-result v17

    :goto_c
    add-int v16, v16, v17

    .end local v15    # "result":I
    .local v16, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getTipoResiduo()Ljava/lang/String;

    move-result-object v15

    .local v15, "$tipoResiduo":Ljava/lang/Object;
    mul-int/lit8 v17, v16, 0x3b

    if-nez v15, :cond_d

    move/from16 v18, v4

    goto :goto_d

    :cond_d
    invoke-virtual {v15}, Ljava/lang/Object;->hashCode()I

    move-result v18

    :goto_d
    add-int v17, v17, v18

    .end local v16    # "result":I
    .local v17, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getPeriodicidade()Ljava/lang/String;

    move-result-object v16

    .local v16, "$periodicidade":Ljava/lang/Object;
    mul-int/lit8 v18, v17, 0x3b

    if-nez v16, :cond_e

    move/from16 v19, v4

    goto :goto_e

    :cond_e
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->hashCode()I

    move-result v19

    :goto_e
    add-int v18, v18, v19

    .end local v17    # "result":I
    .local v18, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteNovo()Ljava/lang/String;

    move-result-object v17

    .local v17, "$clienteNovo":Ljava/lang/Object;
    mul-int/lit8 v19, v18, 0x3b

    if-nez v17, :cond_f

    move/from16 v20, v4

    goto :goto_f

    :cond_f
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->hashCode()I

    move-result v20

    :goto_f
    add-int v19, v19, v20

    .end local v18    # "result":I
    .local v19, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v18

    .local v18, "$status":Ljava/lang/Object;
    mul-int/lit8 v20, v19, 0x3b

    if-nez v18, :cond_10

    move/from16 v21, v4

    goto :goto_10

    :cond_10
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->hashCode()I

    move-result v21

    :goto_10
    add-int v20, v20, v21

    .end local v19    # "result":I
    .local v20, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteEmiteMtr()Ljava/lang/String;

    move-result-object v19

    .local v19, "$clienteEmiteMtr":Ljava/lang/Object;
    mul-int/lit8 v21, v20, 0x3b

    if-nez v19, :cond_11

    move/from16 v22, v4

    goto :goto_11

    :cond_11
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->hashCode()I

    move-result v22

    :goto_11
    add-int v21, v21, v22

    .end local v20    # "result":I
    .local v21, "result":I
    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getAtualizado()Ljava/lang/String;

    move-result-object v20

    .local v20, "$atualizado":Ljava/lang/Object;
    mul-int/lit8 v22, v21, 0x3b

    if-nez v20, :cond_12

    goto :goto_12

    :cond_12
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->hashCode()I

    move-result v4

    :goto_12
    add-int v22, v22, v4

    .end local v21    # "result":I
    .local v22, "result":I
    return v22
.end method

.method public setAtualizado(Ljava/lang/String;)V
    .locals 0
    .param p1, "atualizado"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->atualizado:Ljava/lang/String;

    return-void
.end method

.method public setClienteEmiteMtr(Ljava/lang/String;)V
    .locals 0
    .param p1, "clienteEmiteMtr"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteEmiteMtr:Ljava/lang/String;

    return-void
.end method

.method public setClienteNovo(Ljava/lang/String;)V
    .locals 0
    .param p1, "clienteNovo"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteNovo:Ljava/lang/String;

    return-void
.end method

.method public setCodCliente(Ljava/lang/String;)V
    .locals 0
    .param p1, "codCliente"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->codCliente:Ljava/lang/String;

    return-void
.end method

.method public setColetaExtra(Ljava/lang/String;)V
    .locals 0
    .param p1, "coletaExtra"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->coletaExtra:Ljava/lang/String;

    return-void
.end method

.method public setDestino(Ljava/lang/String;)V
    .locals 0
    .param p1, "destino"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->destino:Ljava/lang/String;

    return-void
.end method

.method public setEndereco(Ljava/lang/String;)V
    .locals 0
    .param p1, "endereco"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->endereco:Ljava/lang/String;

    return-void
.end method

.method public setId(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Integer;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->id:Ljava/lang/Integer;

    return-void
.end method

.method public setIdCliente(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idCliente"    # Ljava/lang/Integer;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idCliente:Ljava/lang/Integer;

    return-void
.end method

.method public setIdColetaLogradouro(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idColetaLogradouro"    # Ljava/lang/Integer;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idColetaLogradouro:Ljava/lang/Integer;

    return-void
.end method

.method public setIdDiaColeta(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idDiaColeta"    # Ljava/lang/Integer;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idDiaColeta:Ljava/lang/Integer;

    return-void
.end method

.method public setIdManifesto(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idManifesto"    # Ljava/lang/Integer;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idManifesto:Ljava/lang/Integer;

    return-void
.end method

.method public setNumeroManifesto(Ljava/lang/String;)V
    .locals 0
    .param p1, "numeroManifesto"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->numeroManifesto:Ljava/lang/String;

    return-void
.end method

.method public setObservacaoMtr(Ljava/lang/String;)V
    .locals 0
    .param p1, "observacaoMtr"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->observacaoMtr:Ljava/lang/String;

    return-void
.end method

.method public setOrdem(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "ordem"    # Ljava/lang/Integer;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->ordem:Ljava/lang/Integer;

    return-void
.end method

.method public setPeriodicidade(Ljava/lang/String;)V
    .locals 0
    .param p1, "periodicidade"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->periodicidade:Ljava/lang/String;

    return-void
.end method

.method public setRazaoSocial(Ljava/lang/String;)V
    .locals 0
    .param p1, "razaoSocial"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->razaoSocial:Ljava/lang/String;

    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->status:Ljava/lang/String;

    return-void
.end method

.method public setTipoResiduo(Ljava/lang/String;)V
    .locals 0
    .param p1, "tipoResiduo"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->tipoResiduo:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PontoColeta(id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", idCliente="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", codCliente="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getCodCliente()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", razaoSocial="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getRazaoSocial()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", endereco="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getEndereco()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", numeroManifesto="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", observacaoMtr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getObservacaoMtr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", destino="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getDestino()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", coletaExtra="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", tipoResiduo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getTipoResiduo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ordem="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getOrdem()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", periodicidade="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getPeriodicidade()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", clienteNovo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteNovo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", idManifesto="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", idColetaLogradouro="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", clienteEmiteMtr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteEmiteMtr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", atualizado="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getAtualizado()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", idDiaColeta="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

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

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "i"    # I

    .line 137
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->id:Ljava/lang/Integer;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    .line 138
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_0

    .line 140
    :cond_0
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 141
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->id:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 143
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idCliente:Ljava/lang/Integer;

    if-nez v0, :cond_1

    .line 144
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_1

    .line 146
    :cond_1
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 147
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idCliente:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 149
    :goto_1
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->codCliente:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 150
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->razaoSocial:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->endereco:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 152
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->numeroManifesto:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->observacaoMtr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 154
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->destino:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->coletaExtra:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->tipoResiduo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->ordem:Ljava/lang/Integer;

    if-nez v0, :cond_2

    .line 158
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_2

    .line 160
    :cond_2
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 161
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->ordem:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 163
    :goto_2
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->periodicidade:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 164
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteNovo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 165
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idManifesto:Ljava/lang/Integer;

    if-nez v0, :cond_3

    .line 166
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_3

    .line 168
    :cond_3
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 169
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idManifesto:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 171
    :goto_3
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idColetaLogradouro:Ljava/lang/Integer;

    if-nez v0, :cond_4

    .line 172
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_4

    .line 174
    :cond_4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 175
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idColetaLogradouro:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 177
    :goto_4
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->clienteEmiteMtr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 178
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idDiaColeta:Ljava/lang/Integer;

    if-nez v0, :cond_5

    .line 179
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_5

    .line 181
    :cond_5
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 182
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/PontoColeta;->idDiaColeta:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 184
    :goto_5
    return-void
.end method
