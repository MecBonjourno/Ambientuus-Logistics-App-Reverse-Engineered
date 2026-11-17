.class public Lcom/coleta/ambientuus/dto/Coleta;
.super Ljava/lang/Object;
.source "Coleta.java"


# instance fields
.field private cliente_ausente:Ljava/lang/String;

.field private cod_bombona:Ljava/lang/String;

.field private cod_etiqueta:Ljava/lang/String;

.field private coleta_extra:Ljava/lang/String;

.field private coleta_sem_residuo:Ljava/lang/String;

.field private data_coleta:Ljava/lang/String;

.field private data_envio:Ljava/lang/String;

.field private descVolume:Ljava/lang/String;

.field private enviado:Ljava/lang/String;

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

.field private idTipoResiduo:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_tipo_residuo"
    .end annotation
.end field

.field private idVolumeExtra:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_volume_extra"
    .end annotation
.end field

.field private id_app_coleta:Ljava/lang/Integer;

.field private id_cliente_mtr:Ljava/lang/Integer;

.field private id_coleta:Ljava/lang/String;

.field private id_coleta_aplicativo:Ljava/lang/String;

.field private id_rota:Ljava/lang/Integer;

.field private id_volume:Ljava/lang/Integer;

.field private numero_mtr:Ljava/lang/String;

.field private observacao:Ljava/lang/String;

.field private peso:Ljava/lang/String;

.field private peso_liquido:Ljava/lang/String;

.field private tipo_coleta:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "peso"    # Ljava/lang/String;
    .param p2, "numero_mtr"    # Ljava/lang/String;
    .param p3, "data_coleta"    # Ljava/lang/String;
    .param p4, "id_rota"    # Ljava/lang/Integer;
    .param p5, "id_volume"    # Ljava/lang/Integer;
    .param p6, "cliente_ausente"    # Ljava/lang/String;
    .param p7, "coleta_sem_residuo"    # Ljava/lang/String;
    .param p8, "coleta_extra"    # Ljava/lang/String;
    .param p9, "enviado"    # Ljava/lang/String;
    .param p10, "descVolume"    # Ljava/lang/String;

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->peso:Ljava/lang/String;

    .line 99
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Coleta;->numero_mtr:Ljava/lang/String;

    .line 100
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Coleta;->data_coleta:Ljava/lang/String;

    .line 101
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_rota:Ljava/lang/Integer;

    .line 102
    iput-object p5, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_volume:Ljava/lang/Integer;

    .line 103
    iput-object p6, p0, Lcom/coleta/ambientuus/dto/Coleta;->cliente_ausente:Ljava/lang/String;

    .line 104
    iput-object p7, p0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_sem_residuo:Ljava/lang/String;

    .line 105
    iput-object p8, p0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_extra:Ljava/lang/String;

    .line 106
    iput-object p9, p0, Lcom/coleta/ambientuus/dto/Coleta;->enviado:Ljava/lang/String;

    .line 107
    iput-object p10, p0, Lcom/coleta/ambientuus/dto/Coleta;->descVolume:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 16
    .param p1, "peso"    # Ljava/lang/String;
    .param p2, "numero_mtr"    # Ljava/lang/String;
    .param p3, "data_coleta"    # Ljava/lang/String;
    .param p4, "id_rota"    # Ljava/lang/Integer;
    .param p5, "id_volume"    # Ljava/lang/Integer;
    .param p6, "cliente_ausente"    # Ljava/lang/String;
    .param p7, "coleta_sem_residuo"    # Ljava/lang/String;
    .param p8, "coleta_extra"    # Ljava/lang/String;
    .param p9, "observacao"    # Ljava/lang/String;
    .param p10, "enviado"    # Ljava/lang/String;
    .param p11, "id_cliente_mtr"    # Ljava/lang/Integer;
    .param p12, "tipo_coleta"    # Ljava/lang/String;
    .param p13, "cod_bombona"    # Ljava/lang/String;
    .param p14, "data_envio"    # Ljava/lang/String;
    .param p15, "id_coleta_aplicativo"    # Ljava/lang/String;
    .param p16, "id_app_coleta"    # Ljava/lang/Integer;
    .param p17, "cod_etiqueta"    # Ljava/lang/String;
    .param p18, "idTipoResiduo"    # Ljava/lang/Integer;
    .param p19, "idVolumeExtra"    # Ljava/lang/Integer;
    .param p20, "idColetaLogradouro"    # Ljava/lang/Integer;
    .param p21, "idDiaColeta"    # Ljava/lang/Integer;

    .line 70
    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 71
    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/Coleta;->peso:Ljava/lang/String;

    .line 72
    move-object/from16 v2, p2

    iput-object v2, v0, Lcom/coleta/ambientuus/dto/Coleta;->numero_mtr:Ljava/lang/String;

    .line 73
    move-object/from16 v3, p3

    iput-object v3, v0, Lcom/coleta/ambientuus/dto/Coleta;->data_coleta:Ljava/lang/String;

    .line 74
    move-object/from16 v4, p4

    iput-object v4, v0, Lcom/coleta/ambientuus/dto/Coleta;->id_rota:Ljava/lang/Integer;

    .line 75
    move-object/from16 v5, p5

    iput-object v5, v0, Lcom/coleta/ambientuus/dto/Coleta;->id_volume:Ljava/lang/Integer;

    .line 76
    move-object/from16 v6, p6

    iput-object v6, v0, Lcom/coleta/ambientuus/dto/Coleta;->cliente_ausente:Ljava/lang/String;

    .line 77
    move-object/from16 v7, p7

    iput-object v7, v0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_sem_residuo:Ljava/lang/String;

    .line 78
    move-object/from16 v8, p8

    iput-object v8, v0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_extra:Ljava/lang/String;

    .line 79
    move-object/from16 v9, p9

    iput-object v9, v0, Lcom/coleta/ambientuus/dto/Coleta;->observacao:Ljava/lang/String;

    .line 80
    move-object/from16 v10, p10

    iput-object v10, v0, Lcom/coleta/ambientuus/dto/Coleta;->enviado:Ljava/lang/String;

    .line 81
    move-object/from16 v11, p11

    iput-object v11, v0, Lcom/coleta/ambientuus/dto/Coleta;->id_cliente_mtr:Ljava/lang/Integer;

    .line 82
    move-object/from16 v12, p12

    iput-object v12, v0, Lcom/coleta/ambientuus/dto/Coleta;->tipo_coleta:Ljava/lang/String;

    .line 83
    move-object/from16 v13, p13

    iput-object v13, v0, Lcom/coleta/ambientuus/dto/Coleta;->cod_bombona:Ljava/lang/String;

    .line 84
    move-object/from16 v14, p14

    iput-object v14, v0, Lcom/coleta/ambientuus/dto/Coleta;->data_envio:Ljava/lang/String;

    .line 85
    move-object/from16 v15, p15

    iput-object v15, v0, Lcom/coleta/ambientuus/dto/Coleta;->id_coleta_aplicativo:Ljava/lang/String;

    .line 86
    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/Coleta;->id_app_coleta:Ljava/lang/Integer;

    .line 87
    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/Coleta;->cod_etiqueta:Ljava/lang/String;

    .line 88
    move-object/from16 v1, p18

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/Coleta;->idTipoResiduo:Ljava/lang/Integer;

    .line 89
    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/Coleta;->idVolumeExtra:Ljava/lang/Integer;

    .line 90
    move-object/from16 v1, p20

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/Coleta;->idColetaLogradouro:Ljava/lang/Integer;

    .line 91
    move-object/from16 v1, p21

    iput-object v1, v0, Lcom/coleta/ambientuus/dto/Coleta;->idDiaColeta:Ljava/lang/Integer;

    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 0
    .param p1, "id_coleta"    # Ljava/lang/String;
    .param p2, "peso"    # Ljava/lang/String;
    .param p3, "numero_mtr"    # Ljava/lang/String;
    .param p4, "data_coleta"    # Ljava/lang/String;
    .param p5, "id_volume"    # Ljava/lang/Integer;
    .param p6, "cliente_ausente"    # Ljava/lang/String;
    .param p7, "coleta_sem_residuo"    # Ljava/lang/String;
    .param p8, "coleta_extra"    # Ljava/lang/String;
    .param p9, "descVolume"    # Ljava/lang/String;
    .param p10, "peso_liquido"    # Ljava/lang/String;
    .param p11, "id_cliente_mtr"    # Ljava/lang/Integer;
    .param p12, "cod_etiqueta"    # Ljava/lang/String;

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_coleta:Ljava/lang/String;

    .line 115
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Coleta;->peso:Ljava/lang/String;

    .line 116
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Coleta;->numero_mtr:Ljava/lang/String;

    .line 117
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/Coleta;->data_coleta:Ljava/lang/String;

    .line 118
    iput-object p5, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_volume:Ljava/lang/Integer;

    .line 119
    iput-object p6, p0, Lcom/coleta/ambientuus/dto/Coleta;->cliente_ausente:Ljava/lang/String;

    .line 120
    iput-object p7, p0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_sem_residuo:Ljava/lang/String;

    .line 121
    iput-object p8, p0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_extra:Ljava/lang/String;

    .line 122
    iput-object p9, p0, Lcom/coleta/ambientuus/dto/Coleta;->descVolume:Ljava/lang/String;

    .line 123
    iput-object p10, p0, Lcom/coleta/ambientuus/dto/Coleta;->peso_liquido:Ljava/lang/String;

    .line 124
    iput-object p11, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_cliente_mtr:Ljava/lang/Integer;

    .line 125
    iput-object p12, p0, Lcom/coleta/ambientuus/dto/Coleta;->cod_etiqueta:Ljava/lang/String;

    .line 126
    return-void
.end method


# virtual methods
.method public getCliente_ausente()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->cliente_ausente:Ljava/lang/String;

    return-object v0
.end method

.method public getCod_Etiqueta()Ljava/lang/String;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->cod_etiqueta:Ljava/lang/String;

    return-object v0
.end method

.method public getCod_bombona()Ljava/lang/String;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->cod_bombona:Ljava/lang/String;

    return-object v0
.end method

.method public getColeta_extra()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_extra:Ljava/lang/String;

    return-object v0
.end method

.method public getColeta_sem_residuo()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_sem_residuo:Ljava/lang/String;

    return-object v0
.end method

.method public getData_coleta()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->data_coleta:Ljava/lang/String;

    return-object v0
.end method

.method public getData_envio()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->data_envio:Ljava/lang/String;

    return-object v0
.end method

.method public getDescVolume()Ljava/lang/String;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->descVolume:Ljava/lang/String;

    return-object v0
.end method

.method public getEnviado()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->enviado:Ljava/lang/String;

    return-object v0
.end method

.method public getIdColetaLogradouro()Ljava/lang/Integer;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->idColetaLogradouro:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIdDiaColeta()Ljava/lang/Integer;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->idDiaColeta:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIdTipoResiduo()Ljava/lang/Integer;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->idTipoResiduo:Ljava/lang/Integer;

    return-object v0
.end method

.method public getIdVolumeExtra()Ljava/lang/Integer;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->idVolumeExtra:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_app_coleta()Ljava/lang/Integer;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_app_coleta:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_cliente_mtr()Ljava/lang/Integer;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_cliente_mtr:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_coleta()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_coleta:Ljava/lang/String;

    return-object v0
.end method

.method public getId_coleta_aplicativo()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_coleta_aplicativo:Ljava/lang/String;

    return-object v0
.end method

.method public getId_rota()I
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_rota:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getId_volume()I
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_volume:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getNumero_mtr()Ljava/lang/String;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->numero_mtr:Ljava/lang/String;

    return-object v0
.end method

.method public getObservacao()Ljava/lang/String;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->observacao:Ljava/lang/String;

    return-object v0
.end method

.method public getPeso()Ljava/lang/String;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->peso:Ljava/lang/String;

    return-object v0
.end method

.method public getPeso_liquido()Ljava/lang/String;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->peso_liquido:Ljava/lang/String;

    return-object v0
.end method

.method public getTipo_coleta()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Coleta;->tipo_coleta:Ljava/lang/String;

    return-object v0
.end method

.method public setCliente_ausente(Ljava/lang/String;)V
    .locals 0
    .param p1, "cliente_ausente"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->cliente_ausente:Ljava/lang/String;

    return-void
.end method

.method public setCod_Etiqueta(Ljava/lang/String;)V
    .locals 0
    .param p1, "cod_etiqueta"    # Ljava/lang/String;

    .line 141
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->cod_etiqueta:Ljava/lang/String;

    .line 142
    return-void
.end method

.method public setCod_bombona(Ljava/lang/String;)V
    .locals 0
    .param p1, "cod_bombona"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->cod_bombona:Ljava/lang/String;

    return-void
.end method

.method public setColeta_extra(Ljava/lang/String;)V
    .locals 0
    .param p1, "coleta_extra"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_extra:Ljava/lang/String;

    return-void
.end method

.method public setColeta_sem_residuo(Ljava/lang/String;)V
    .locals 0
    .param p1, "coleta_sem_residuo"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->coleta_sem_residuo:Ljava/lang/String;

    return-void
.end method

.method public setData_coleta(Ljava/lang/String;)V
    .locals 0
    .param p1, "data_coleta"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->data_coleta:Ljava/lang/String;

    return-void
.end method

.method public setData_envio(Ljava/lang/String;)V
    .locals 0
    .param p1, "data_envio"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->data_envio:Ljava/lang/String;

    return-void
.end method

.method public setDescVolume(Ljava/lang/String;)V
    .locals 0
    .param p1, "descVolume"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->descVolume:Ljava/lang/String;

    return-void
.end method

.method public setEnviado(Ljava/lang/String;)V
    .locals 0
    .param p1, "enviado"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->enviado:Ljava/lang/String;

    return-void
.end method

.method public setIdColetaLogradouro(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idColetaLogradouro"    # Ljava/lang/Integer;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->idColetaLogradouro:Ljava/lang/Integer;

    return-void
.end method

.method public setIdDiaColeta(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idDiaColeta"    # Ljava/lang/Integer;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->idDiaColeta:Ljava/lang/Integer;

    return-void
.end method

.method public setIdTipoResiduo(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idTipoResiduo"    # Ljava/lang/Integer;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->idTipoResiduo:Ljava/lang/Integer;

    return-void
.end method

.method public setIdVolumeExtra(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "idVolumeExtra"    # Ljava/lang/Integer;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->idVolumeExtra:Ljava/lang/Integer;

    return-void
.end method

.method public setId_app_coleta(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id_app_coleta"    # Ljava/lang/Integer;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_app_coleta:Ljava/lang/Integer;

    return-void
.end method

.method public setId_cliente_mtr(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id_cliente_mtr"    # Ljava/lang/Integer;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_cliente_mtr:Ljava/lang/Integer;

    return-void
.end method

.method public setId_coleta(Ljava/lang/String;)V
    .locals 0
    .param p1, "id_coleta"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_coleta:Ljava/lang/String;

    return-void
.end method

.method public setId_coleta_aplicativo(Ljava/lang/String;)V
    .locals 0
    .param p1, "id_coleta_aplicativo"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_coleta_aplicativo:Ljava/lang/String;

    return-void
.end method

.method public setId_rota(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id_rota"    # Ljava/lang/Integer;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_rota:Ljava/lang/Integer;

    return-void
.end method

.method public setId_volume(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id_volume"    # Ljava/lang/Integer;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->id_volume:Ljava/lang/Integer;

    return-void
.end method

.method public setNumero_mtr(Ljava/lang/String;)V
    .locals 0
    .param p1, "numero_mtr"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->numero_mtr:Ljava/lang/String;

    return-void
.end method

.method public setObservacao(Ljava/lang/String;)V
    .locals 0
    .param p1, "observacao"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->observacao:Ljava/lang/String;

    return-void
.end method

.method public setPeso(Ljava/lang/String;)V
    .locals 0
    .param p1, "peso"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->peso:Ljava/lang/String;

    return-void
.end method

.method public setPeso_liquido(Ljava/lang/String;)V
    .locals 0
    .param p1, "peso_liquido"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->peso_liquido:Ljava/lang/String;

    return-void
.end method

.method public setTipo_coleta(Ljava/lang/String;)V
    .locals 0
    .param p1, "tipo_coleta"    # Ljava/lang/String;

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Coleta;->tipo_coleta:Ljava/lang/String;

    return-void
.end method
