.class public Lcom/coleta/ambientuus/ws/Repository;
.super Ljava/lang/Object;
.source "Repository.java"


# instance fields
.field private bombonasService:Lcom/coleta/ambientuus/ws/Services/BombonasService;

.field private clientesMTRService:Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;

.field private coletasService:Lcom/coleta/ambientuus/ws/Services/ColetasService;

.field private consultaEtiquetaService:Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;

.field private final db:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private manifestoService:Lcom/coleta/ambientuus/ws/Services/ManifestoService;

.field private motoristasService:Lcom/coleta/ambientuus/ws/Services/MotoristasService;

.field private movimentoBombonaService:Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;

.field private placasService:Lcom/coleta/ambientuus/ws/Services/PlacasService;

.field private pontoColetaService:Lcom/coleta/ambientuus/ws/Services/PontoColetaService;

.field private rotasService:Lcom/coleta/ambientuus/ws/Services/RotasService;

.field private telasService:Lcom/coleta/ambientuus/ws/Services/TelasService;

.field private terceirosService:Lcom/coleta/ambientuus/ws/Services/TerceirosService;

.field private tipoResiduoService:Lcom/coleta/ambientuus/ws/Services/TipoResiduoService;

.field private volumeService:Lcom/coleta/ambientuus/ws/Services/VolumeService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "modo"    # Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;
    .param p3, "idRota"    # Ljava/lang/Integer;
    .param p4, "dataColeta"    # Ljava/lang/String;
    .param p7, "activity"    # Landroid/app/Activity;
    .param p8, "etiqueta"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
            ">;",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 67
    .local p5, "coletas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .local p6, "movimentos":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p1}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 70
    sget-object v0, Lcom/coleta/ambientuus/ws/Repository$1;->$SwitchMap$com$coleta$ambientuus$domain$model$ModoSincronizacao:[I

    invoke-virtual {p2}, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 94
    :pswitch_0
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;

    invoke-direct {v0, p8}, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->consultaEtiquetaService:Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;

    goto :goto_0

    .line 89
    :pswitch_1
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/ColetasService;

    invoke-direct {v0, p1, p5, p7}, Lcom/coleta/ambientuus/ws/Services/ColetasService;-><init>(Landroid/content/Context;Ljava/util/List;Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->coletasService:Lcom/coleta/ambientuus/ws/Services/ColetasService;

    .line 90
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;

    invoke-direct {v0, p1, p6, p7}, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;-><init>(Landroid/content/Context;Ljava/util/List;Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->movimentoBombonaService:Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;

    .line 91
    goto :goto_0

    .line 84
    :pswitch_2
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/ManifestoService;

    invoke-direct {v0, p3, p4}, Lcom/coleta/ambientuus/ws/Services/ManifestoService;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->manifestoService:Lcom/coleta/ambientuus/ws/Services/ManifestoService;

    .line 85
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;

    invoke-direct {v0, p3, p4}, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->pontoColetaService:Lcom/coleta/ambientuus/ws/Services/PontoColetaService;

    .line 86
    goto :goto_0

    .line 72
    :pswitch_3
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/VolumeService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/VolumeService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->volumeService:Lcom/coleta/ambientuus/ws/Services/VolumeService;

    .line 73
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/TerceirosService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/TerceirosService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->terceirosService:Lcom/coleta/ambientuus/ws/Services/TerceirosService;

    .line 74
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/RotasService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/RotasService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->rotasService:Lcom/coleta/ambientuus/ws/Services/RotasService;

    .line 75
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/PlacasService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/PlacasService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->placasService:Lcom/coleta/ambientuus/ws/Services/PlacasService;

    .line 76
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/BombonasService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/BombonasService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->bombonasService:Lcom/coleta/ambientuus/ws/Services/BombonasService;

    .line 77
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/MotoristasService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/MotoristasService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->motoristasService:Lcom/coleta/ambientuus/ws/Services/MotoristasService;

    .line 78
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->clientesMTRService:Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;

    .line 79
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/TelasService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/TelasService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->telasService:Lcom/coleta/ambientuus/ws/Services/TelasService;

    .line 80
    new-instance v0, Lcom/coleta/ambientuus/ws/Services/TipoResiduoService;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ws/Services/TipoResiduoService;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->tipoResiduoService:Lcom/coleta/ambientuus/ws/Services/TipoResiduoService;

    .line 81
    nop

    .line 98
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public consultarEtiquetas(Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;

    .line 153
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->consultaEtiquetaService:Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;

    invoke-virtual {v0, p1}, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;->consultar(Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;)V

    .line 154
    return-void
.end method

.method public enviarColetas()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->coletasService:Lcom/coleta/ambientuus/ws/Services/ColetasService;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Services/ColetasService;->enviarColetas()V

    .line 142
    return-void
.end method

.method public enviarMovimentos()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->movimentoBombonaService:Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->enviarMovimentos()V

    .line 138
    return-void
.end method

.method public sincronizarBombonas()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->bombonasService:Lcom/coleta/ambientuus/ws/Services/BombonasService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/BombonasService;->sincronizar(Lcom/coleta/ambientuus/database/managers/BombonaTableManager;)V

    .line 122
    return-void
.end method

.method public sincronizarClientes()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->clientesMTRService:Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;->sincronizar(Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;)V

    .line 118
    return-void
.end method

.method public sincronizarManifesto()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->manifestoService:Lcom/coleta/ambientuus/ws/Services/ManifestoService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/ManifestoService;->sincronizar(Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;)V

    .line 130
    return-void
.end method

.method public sincronizarMotoristas()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->motoristasService:Lcom/coleta/ambientuus/ws/Services/MotoristasService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/MotoristasService;->sincronizar(Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;)V

    .line 126
    return-void
.end method

.method public sincronizarPlacas()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->placasService:Lcom/coleta/ambientuus/ws/Services/PlacasService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/PlacasService;->sincronizar(Lcom/coleta/ambientuus/database/managers/PlacasTableManager;)V

    .line 114
    return-void
.end method

.method public sincronizarPontosColetas(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->pontoColetaService:Lcom/coleta/ambientuus/ws/Services/PontoColetaService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1, p1}, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;->sincronizar(Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;Landroid/content/Context;)V

    .line 146
    return-void
.end method

.method public sincronizarRotas()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 109
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->rotasService:Lcom/coleta/ambientuus/ws/Services/RotasService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/RotaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/RotaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/RotasService;->sincronizar(Lcom/coleta/ambientuus/database/managers/RotaTableManager;)V

    .line 110
    return-void
.end method

.method public sincronizarTelas()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->telasService:Lcom/coleta/ambientuus/ws/Services/TelasService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/TelasTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/TelasTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/TelasService;->sincronizar(Lcom/coleta/ambientuus/database/managers/TelasTableManager;)V

    .line 134
    return-void
.end method

.method public sincronizarTerceiros()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->terceirosService:Lcom/coleta/ambientuus/ws/Services/TerceirosService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/TerceirosService;->sincronizar(Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;)V

    .line 106
    return-void
.end method

.method public sincronizarTipoResiduo()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->tipoResiduoService:Lcom/coleta/ambientuus/ws/Services/TipoResiduoService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/TipoResiduoService;->sincronizar(Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;)V

    .line 150
    return-void
.end method

.method public sincronizarVolumes()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Repository;->volumeService:Lcom/coleta/ambientuus/ws/Services/VolumeService;

    new-instance v1, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Repository;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Services/VolumeService;->sincronizar(Lcom/coleta/ambientuus/database/managers/VolumeTableManager;)V

    .line 102
    return-void
.end method
