.class public Lcom/coleta/ambientuus/dto/Telas;
.super Ljava/lang/Object;
.source "Telas.java"


# instance fields
.field private final ALOCAR_BOMBONA:Ljava/lang/String;

.field private final CARREGAR_VEICULO:Ljava/lang/String;

.field private final COLETAR_BLUETOOTH:Ljava/lang/String;

.field private final COLETAR_MANUAL:Ljava/lang/String;

.field private final CONSULTAR_BOMBONAS:Ljava/lang/String;

.field private final CONSULTAR_COLETAS:Ljava/lang/String;

.field private final CONSULTAR_MANIFESTOS:Ljava/lang/String;

.field private final DESCARREGAR_VEICULO:Ljava/lang/String;

.field private final LIBERAR_BOMBONA:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "carregarVeiculo"    # Ljava/lang/String;
    .param p2, "alocarBombona"    # Ljava/lang/String;
    .param p3, "coletarBluetooth"    # Ljava/lang/String;
    .param p4, "coletarManual"    # Ljava/lang/String;
    .param p5, "descarregarVeiculo"    # Ljava/lang/String;
    .param p6, "liberarBombona"    # Ljava/lang/String;
    .param p7, "consultarBombonas"    # Ljava/lang/String;
    .param p8, "consultarColetas"    # Ljava/lang/String;
    .param p9, "consultarManifestos"    # Ljava/lang/String;

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Telas;->CARREGAR_VEICULO:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Telas;->ALOCAR_BOMBONA:Ljava/lang/String;

    .line 17
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Telas;->COLETAR_BLUETOOTH:Ljava/lang/String;

    .line 18
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/Telas;->COLETAR_MANUAL:Ljava/lang/String;

    .line 19
    iput-object p5, p0, Lcom/coleta/ambientuus/dto/Telas;->DESCARREGAR_VEICULO:Ljava/lang/String;

    .line 20
    iput-object p6, p0, Lcom/coleta/ambientuus/dto/Telas;->LIBERAR_BOMBONA:Ljava/lang/String;

    .line 21
    iput-object p7, p0, Lcom/coleta/ambientuus/dto/Telas;->CONSULTAR_BOMBONAS:Ljava/lang/String;

    .line 22
    iput-object p8, p0, Lcom/coleta/ambientuus/dto/Telas;->CONSULTAR_COLETAS:Ljava/lang/String;

    .line 23
    iput-object p9, p0, Lcom/coleta/ambientuus/dto/Telas;->CONSULTAR_MANIFESTOS:Ljava/lang/String;

    .line 24
    return-void
.end method


# virtual methods
.method public getALOCAR_BOMBONA()Ljava/lang/String;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->ALOCAR_BOMBONA:Ljava/lang/String;

    return-object v0
.end method

.method public getCARREGAR_VEICULO()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->CARREGAR_VEICULO:Ljava/lang/String;

    return-object v0
.end method

.method public getCOLETAR_BLUETOOTH()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->COLETAR_BLUETOOTH:Ljava/lang/String;

    return-object v0
.end method

.method public getCOLETAR_MANUAL()Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->COLETAR_MANUAL:Ljava/lang/String;

    return-object v0
.end method

.method public getCONSULTAR_BOMBONAS()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->CONSULTAR_BOMBONAS:Ljava/lang/String;

    return-object v0
.end method

.method public getCONSULTAR_COLETAS()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->CONSULTAR_COLETAS:Ljava/lang/String;

    return-object v0
.end method

.method public getCONSULTAR_MANIFESTOS()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->CONSULTAR_MANIFESTOS:Ljava/lang/String;

    return-object v0
.end method

.method public getDESCARREGAR_VEICULO()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->DESCARREGAR_VEICULO:Ljava/lang/String;

    return-object v0
.end method

.method public getLIBERAR_BOMBONA()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Telas;->LIBERAR_BOMBONA:Ljava/lang/String;

    return-object v0
.end method
