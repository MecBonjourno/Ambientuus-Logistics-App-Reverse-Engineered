.class public Lcom/coleta/ambientuus/dto/MovimentoBombona;
.super Ljava/lang/Object;
.source "MovimentoBombona.java"


# instance fields
.field private cod_barras:Ljava/lang/String;

.field private data_alocacao:Ljava/lang/String;

.field private data_baixa:Ljava/lang/String;

.field private data_coleta:Ljava/lang/String;

.field private data_terceiro:Ljava/lang/String;

.field private data_transporte:Ljava/lang/String;

.field private id_cliente:Ljava/lang/Integer;

.field private id_coleta_controlado:Ljava/lang/String;

.field private id_frota_veiculo:Ljava/lang/Integer;

.field private id_rota:Ljava/lang/String;

.field private id_terceiro:Ljava/lang/Integer;

.field private tipo_movto:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0
    .param p1, "cod_barras"    # Ljava/lang/String;
    .param p2, "id_cliente"    # Ljava/lang/Integer;
    .param p3, "tipo_movto"    # Ljava/lang/String;
    .param p4, "id_coleta_controlado"    # Ljava/lang/String;
    .param p5, "id_rota"    # Ljava/lang/String;
    .param p6, "id_frota_veiculo"    # Ljava/lang/Integer;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->cod_barras:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_cliente:Ljava/lang/Integer;

    .line 38
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_coleta_controlado:Ljava/lang/String;

    .line 39
    iput-object p5, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_rota:Ljava/lang/String;

    .line 40
    iput-object p6, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_frota_veiculo:Ljava/lang/Integer;

    .line 41
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->tipo_movto:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0
    .param p1, "cod_barras"    # Ljava/lang/String;
    .param p2, "id_cliente"    # Ljava/lang/Integer;
    .param p3, "data_alocacao"    # Ljava/lang/String;
    .param p4, "data_coleta"    # Ljava/lang/String;
    .param p5, "data_baixa"    # Ljava/lang/String;
    .param p6, "data_transporte"    # Ljava/lang/String;
    .param p7, "id_coleta_controlado"    # Ljava/lang/String;
    .param p8, "id_rota"    # Ljava/lang/String;
    .param p9, "data_terceiro"    # Ljava/lang/String;
    .param p10, "id_terceiro"    # Ljava/lang/Integer;
    .param p11, "id_frota_veiculo"    # Ljava/lang/Integer;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->cod_barras:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_cliente:Ljava/lang/Integer;

    .line 23
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_alocacao:Ljava/lang/String;

    .line 24
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_coleta:Ljava/lang/String;

    .line 25
    iput-object p5, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_baixa:Ljava/lang/String;

    .line 26
    iput-object p6, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_transporte:Ljava/lang/String;

    .line 27
    iput-object p7, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_coleta_controlado:Ljava/lang/String;

    .line 28
    iput-object p8, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_rota:Ljava/lang/String;

    .line 29
    iput-object p9, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_terceiro:Ljava/lang/String;

    .line 30
    iput-object p10, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_terceiro:Ljava/lang/Integer;

    .line 31
    iput-object p11, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_frota_veiculo:Ljava/lang/Integer;

    .line 32
    return-void
.end method


# virtual methods
.method public getCod_barras()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->cod_barras:Ljava/lang/String;

    return-object v0
.end method

.method public getData_alocacao()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_alocacao:Ljava/lang/String;

    return-object v0
.end method

.method public getData_baixa()Ljava/lang/String;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_baixa:Ljava/lang/String;

    return-object v0
.end method

.method public getData_coleta()Ljava/lang/String;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_coleta:Ljava/lang/String;

    return-object v0
.end method

.method public getData_terceiro()Ljava/lang/String;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_terceiro:Ljava/lang/String;

    return-object v0
.end method

.method public getData_transporte()Ljava/lang/String;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->data_transporte:Ljava/lang/String;

    return-object v0
.end method

.method public getId_cliente()Ljava/lang/Integer;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_cliente:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_coleta_controlado()Ljava/lang/String;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_coleta_controlado:Ljava/lang/String;

    return-object v0
.end method

.method public getId_frota_veiculo()Ljava/lang/Integer;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_frota_veiculo:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_rota()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_rota:Ljava/lang/String;

    return-object v0
.end method

.method public getId_terceiro()Ljava/lang/Integer;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->id_terceiro:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTipo_movto()Ljava/lang/String;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/MovimentoBombona;->tipo_movto:Ljava/lang/String;

    return-object v0
.end method
