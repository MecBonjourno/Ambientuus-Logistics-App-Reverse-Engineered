.class public Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;
.super Ljava/lang/Object;
.source "PontoColetaTableManager.java"


# static fields
.field public static final COL_CLIENTE_EMITE_MTR:Ljava/lang/String; = "cliente_emite_mtr"

.field public static final COL_CLIENTE_NOVO:Ljava/lang/String; = "cliente_novo"

.field public static final COL_COD_CLIENTE:Ljava/lang/String; = "cod_cliente"

.field public static final COL_COLETA_EXTRA:Ljava/lang/String; = "coleta_extra"

.field public static final COL_DESTINO:Ljava/lang/String; = "unidest_razao_social"

.field public static final COL_ENDERECO:Ljava/lang/String; = "endereco"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_CLIENTE:Ljava/lang/String; = "id_cliente"

.field public static final COL_ID_COLETA_LOGRADOURO:Ljava/lang/String; = "id_coleta_logradouro"

.field public static final COL_ID_DIA_COLETA:Ljava/lang/String; = "id_dia_coleta"

.field public static final COL_ID_MANIFESTO:Ljava/lang/String; = "id_manifesto"

.field public static final COL_NUMERO_MANIFESTO:Ljava/lang/String; = "numero_manifesto"

.field public static final COL_OBSERVACAO_MTR:Ljava/lang/String; = "observacao_mtr"

.field public static final COL_ORDEM:Ljava/lang/String; = "ordem"

.field public static final COL_PERIODICIDADE:Ljava/lang/String; = "periodicidade"

.field public static final COL_RAZAO_SOCIAL:Ljava/lang/String; = "razao_social"

.field public static final COL_STATUS:Ljava/lang/String; = "status"

.field public static final COL_TIPO_RESIDUO:Ljava/lang/String; = "tipo_residuo"

.field public static final STATUS_CLIENTE_AUSENTE:Ljava/lang/String; = "600"

.field public static final STATUS_COLETADO:Ljava/lang/String; = "200"

.field public static final STATUS_COLETA_REALIZADA:Ljava/lang/String; = "900"

.field public static final STATUS_EDITAVEL:Ljava/lang/String; = "100"

.field public static final STATUS_PENDENTE:Ljava/lang/String; = "000"

.field public static final STATUS_SEM_RESIDUO:Ljava/lang/String; = "500"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_ponto_coleta"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 44
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 47
    const-string v0, "CREATE TABLE bf_ponto_coleta (id INTEGER PRIMARY KEY AUTOINCREMENT, cod_cliente TEXT, razao_social TEXT, endereco TEXT, numero_manifesto TEXT, observacao_mtr TEXT, unidest_razao_social TEXT, coleta_extra TEXT, tipo_residuo TEXT, ordem INTEGER, periodicidade TEXT, cliente_novo TEXT, id_manifesto INTEGER, status TEXT, id_cliente INTEGER, id_coleta_logradouro INTEGER, cliente_emite_mtr TEXT, id_dia_coleta INTEGER )"

    .line 67
    .local v0, "createTableSql":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public static onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p1, "oldVersion"    # I

    .line 71
    const/16 v0, 0xb

    if-ge p1, v0, :cond_0

    .line 72
    invoke-static {p0}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 74
    :cond_0
    const/16 v0, 0xc

    if-ge p1, v0, :cond_1

    .line 75
    const-string v0, "ALTER TABLE bf_ponto_coleta ADD COLUMN cliente_novo TEXT "

    .line 76
    .local v0, "alterTableV12":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 78
    .end local v0    # "alterTableV12":Ljava/lang/String;
    :cond_1
    const/16 v0, 0xd

    if-ge p1, v0, :cond_2

    .line 79
    const-string v0, "ALTER TABLE bf_ponto_coleta ADD COLUMN id_manifesto INTEGER "

    .line 80
    .local v0, "alterTableV13":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 82
    .end local v0    # "alterTableV13":Ljava/lang/String;
    :cond_2
    const/16 v0, 0xe

    if-ge p1, v0, :cond_3

    .line 83
    const-string v0, "ALTER TABLE bf_ponto_coleta ADD COLUMN status TEXT "

    .line 84
    .local v0, "alterTableV14":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 86
    .end local v0    # "alterTableV14":Ljava/lang/String;
    :cond_3
    const/16 v0, 0xf

    if-ge p1, v0, :cond_4

    .line 87
    const-string v0, "ALTER TABLE bf_ponto_coleta ADD COLUMN id_cliente INTEGER "

    .line 88
    .local v0, "alterTableV15":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 90
    .end local v0    # "alterTableV15":Ljava/lang/String;
    :cond_4
    const/16 v0, 0x14

    if-ge p1, v0, :cond_5

    .line 91
    const-string v0, "ALTER TABLE bf_ponto_coleta ADD COLUMN id_coleta_logradouro INTEGER "

    .line 92
    .local v0, "alterTableV20":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 94
    .end local v0    # "alterTableV20":Ljava/lang/String;
    :cond_5
    const/16 v0, 0x15

    if-ge p1, v0, :cond_6

    .line 95
    const-string v0, "ALTER TABLE bf_ponto_coleta ADD COLUMN cliente_emite_mtr TEXT "

    .line 96
    .local v0, "alterTableV21":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 98
    .end local v0    # "alterTableV21":Ljava/lang/String;
    :cond_6
    const/16 v0, 0x16

    if-ge p1, v0, :cond_7

    .line 99
    const-string v0, "ALTER TABLE bf_ponto_coleta ADD COLUMN id_dia_coleta INTEGER "

    .line 100
    .local v0, "alterTableV22":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 102
    .end local v0    # "alterTableV22":Ljava/lang/String;
    :cond_7
    return-void
.end method


# virtual methods
.method public deleteAll()V
    .locals 3

    .line 253
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "bf_ponto_coleta"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 254
    return-void
.end method

.method public insert(Lcom/coleta/ambientuus/dto/PontoColeta;)V
    .locals 4
    .param p1, "pontoColeta"    # Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 193
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 194
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "id_cliente"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 195
    const-string v1, "cod_cliente"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getCodCliente()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    const-string v1, "razao_social"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getRazaoSocial()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    const-string v1, "endereco"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getEndereco()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    const-string v1, "numero_manifesto"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    const-string v1, "observacao_mtr"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getObservacaoMtr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    const-string v1, "unidest_razao_social"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getDestino()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    const-string v1, "coleta_extra"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    const-string v1, "tipo_residuo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getTipoResiduo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    const-string v1, "ordem"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getOrdem()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 204
    const-string v1, "periodicidade"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getPeriodicidade()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    const-string v1, "cliente_novo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteNovo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    const-string v1, "id_manifesto"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 207
    const-string v1, "status"

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->verificarEtiquetaEColetaPorManifesto(Lcom/coleta/ambientuus/dto/PontoColeta;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    const-string v1, "id_coleta_logradouro"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 209
    const-string v1, "cliente_emite_mtr"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteEmiteMtr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    const-string v1, "id_dia_coleta"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 212
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_ponto_coleta"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 213
    return-void
.end method

.method public selectPontoColeta()Ljava/util/ArrayList;
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;"
        }
    .end annotation

    .line 150
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    const-string v8, "ordem, substr(endereco, instr(endereco, \'-\')+1, instr(endereco, \'-\')-1) DESC, substr( substr(endereco, instr(endereco, \',\') +1 ) , instr(substr(endereco, instr(endereco, \',\') +1 ), \',\') +1 ) ASC"

    const-string v2, "bf_ponto_coleta"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 160
    .local v1, "cursor":Landroid/database/Cursor;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 162
    .local v2, "pontoColetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/PontoColeta;>;"
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 164
    :cond_0
    new-instance v4, Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 165
    const-string v3, "id"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 166
    const-string v3, "id_cliente"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 167
    const-string v3, "cod_cliente"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 168
    const-string v3, "razao_social"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 169
    const-string v3, "endereco"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 170
    const-string v3, "numero_manifesto"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 171
    const-string v3, "observacao_mtr"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 172
    const-string v3, "unidest_razao_social"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 173
    const-string v3, "coleta_extra"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 174
    const-string v3, "tipo_residuo"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 175
    const-string v3, "ordem"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    .line 176
    const-string v3, "periodicidade"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 177
    const-string v3, "cliente_novo"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 178
    const-string v3, "id_manifesto"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    .line 179
    const-string v3, "status"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 180
    const-string v3, "id_coleta_logradouro"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    .line 181
    const-string v3, "cliente_emite_mtr"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 183
    const-string v3, "id_dia_coleta"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    const/16 v22, 0x0

    invoke-direct/range {v4 .. v23}, Lcom/coleta/ambientuus/dto/PontoColeta;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 185
    .local v4, "pontoColeta":Lcom/coleta/ambientuus/dto/PontoColeta;
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    .end local v4    # "pontoColeta":Lcom/coleta/ambientuus/dto/PontoColeta;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 188
    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 189
    return-object v2
.end method

.method public selectPontoColetaPendente()Ljava/util/ArrayList;
    .locals 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;"
        }
    .end annotation

    .line 105
    const-string v3, "status NOT IN (?, ?, ?, ?)"

    .line 106
    .local v3, "selection":Ljava/lang/String;
    const-string v0, "200"

    const-string v1, "900"

    const-string v2, "500"

    const-string v4, "600"

    filled-new-array {v2, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v4

    .line 107
    .local v4, "selectionArgs":[Ljava/lang/String;
    move-object/from16 v8, p0

    iget-object v0, v8, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    const-string v7, "ordem, substr(endereco, instr(endereco, \'-\')+1, instr(endereco, \'-\')-1) DESC, substr( substr(endereco, instr(endereco, \',\') +1 ) , instr(substr(endereco, instr(endereco, \',\') +1 ), \',\') +1 ) ASC"

    const-string v1, "bf_ponto_coleta"

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 117
    .local v0, "cursor":Landroid/database/Cursor;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .local v1, "pontoColetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/PontoColeta;>;"
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 121
    :cond_0
    new-instance v9, Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 122
    const-string v2, "id"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 123
    const-string v2, "id_cliente"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 124
    const-string v2, "cod_cliente"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 125
    const-string v2, "razao_social"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 126
    const-string v2, "endereco"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 127
    const-string v2, "numero_manifesto"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 128
    const-string v2, "observacao_mtr"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 129
    const-string v2, "unidest_razao_social"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 130
    const-string v2, "coleta_extra"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 131
    const-string v2, "tipo_residuo"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 132
    const-string v2, "ordem"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    .line 133
    const-string v2, "periodicidade"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 134
    const-string v2, "cliente_novo"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 135
    const-string v2, "id_manifesto"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    .line 136
    const-string v2, "status"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 137
    const-string v2, "id_coleta_logradouro"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    .line 138
    const-string v2, "cliente_emite_mtr"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    .line 140
    const-string v2, "id_dia_coleta"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const/16 v27, 0x0

    invoke-direct/range {v9 .. v28}, Lcom/coleta/ambientuus/dto/PontoColeta;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 142
    .local v9, "pontoColeta":Lcom/coleta/ambientuus/dto/PontoColeta;
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    .end local v9    # "pontoColeta":Lcom/coleta/ambientuus/dto/PontoColeta;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 145
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 146
    return-object v1
.end method

.method public updateStatus(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 5
    .param p1, "id"    # Ljava/lang/Integer;
    .param p2, "STATUS"    # Ljava/lang/String;

    .line 216
    const-string v0, "id = ?"

    .line 217
    .local v0, "selection":Ljava/lang/String;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 218
    .local v1, "values":Landroid/content/ContentValues;
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    .line 219
    .local v2, "selectionArgs":[Ljava/lang/String;
    const-string v3, "status"

    invoke-virtual {v1, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    iget-object v3, p0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v4, "bf_ponto_coleta"

    invoke-virtual {v3, v4, v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 222
    return-void
.end method

.method public verificarEtiquetaEColetaPorManifesto(Lcom/coleta/ambientuus/dto/PontoColeta;)Ljava/lang/String;
    .locals 7
    .param p1, "pontoColeta"    # Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 225
    const-string v0, "000"

    .line 226
    .local v0, "retorno":Ljava/lang/String;
    const-string v1, "N"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getAtualizado()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 227
    new-instance v1, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 228
    .local v1, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->selectEtiquetaManifesto(Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v2

    .line 229
    .local v2, "etiquetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    new-instance v3, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    iget-object v4, p0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {v3, v4}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 230
    .local v3, "coletaTableManager":Lcom/coleta/ambientuus/database/managers/ColetaTableManager;
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 231
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/coleta/ambientuus/dto/Etiqueta;

    .line 232
    .local v5, "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    invoke-virtual {v5}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->existeColetaEtiqueta(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 233
    const-string v0, "100"

    .line 234
    goto :goto_1

    .line 236
    :cond_0
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->existeColetaDia(Ljava/lang/Integer;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 237
    const-string v0, "200"

    .line 240
    .end local v5    # "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    :cond_1
    goto :goto_0

    :cond_2
    :goto_1
    goto :goto_2

    .line 242
    :cond_3
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->existeColetaDia(Ljava/lang/Integer;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 243
    const-string v0, "200"

    .line 246
    .end local v1    # "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    .end local v2    # "etiquetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    .end local v3    # "coletaTableManager":Lcom/coleta/ambientuus/database/managers/ColetaTableManager;
    :cond_4
    :goto_2
    goto :goto_3

    .line 247
    :cond_5
    const-string v0, "900"

    .line 249
    :goto_3
    return-object v0
.end method
