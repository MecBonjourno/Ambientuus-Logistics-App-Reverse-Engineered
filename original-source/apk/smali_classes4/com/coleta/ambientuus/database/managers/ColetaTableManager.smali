.class public Lcom/coleta/ambientuus/database/managers/ColetaTableManager;
.super Ljava/lang/Object;
.source "ColetaTableManager.java"


# static fields
.field public static final COL_CLIENTE_AUSENTE:Ljava/lang/String; = "cliente_ausente"

.field public static final COL_COD_BOMBONA:Ljava/lang/String; = "cod_bombona"

.field public static final COL_COD_ETIQUETA:Ljava/lang/String; = "cod_etiqueta"

.field public static final COL_COLETA_EXTRA:Ljava/lang/String; = "coleta_extra"

.field public static final COL_COLETA_SEM_RESIDUO:Ljava/lang/String; = "coleta_sem_residuo"

.field public static final COL_DATA_COLETA:Ljava/lang/String; = "data_coleta"

.field public static final COL_DATA_ENVIO:Ljava/lang/String; = "data_envio"

.field public static final COL_ENVIADO:Ljava/lang/String; = "enviado"

.field public static final COL_ID_CLIENTE_EMITE_MTR:Ljava/lang/String; = "id_cliente_emite_mtr"

.field public static final COL_ID_COLETA:Ljava/lang/String; = "id_coleta"

.field public static final COL_ID_COLETA_CONTROLADO:Ljava/lang/String; = "id_coleta_controlado"

.field public static final COL_ID_COLETA_LOGRADOURO:Ljava/lang/String; = "id_coleta_logradouro"

.field public static final COL_ID_COLETA_SERVIDOR:Ljava/lang/String; = "id_coleta_servidor"

.field public static final COL_ID_DIA_COLETA:Ljava/lang/String; = "id_dia_coleta"

.field public static final COL_ID_RESIDUO:Ljava/lang/String; = "id_tipo_residuo"

.field public static final COL_ID_ROTA:Ljava/lang/String; = "id_rota"

.field public static final COL_ID_VOLUME:Ljava/lang/String; = "id_volume"

.field public static final COL_ID_VOLUME_EXTRA:Ljava/lang/String; = "id_volume_extra"

.field public static final COL_NUMERO_MTR:Ljava/lang/String; = "numero_mtr"

.field public static final COL_OBSERVACAO:Ljava/lang/String; = "observacao"

.field public static final COL_PESO:Ljava/lang/String; = "peso"

.field public static final COL_TIPO_COLETA:Ljava/lang/String; = "tipo_coleta"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_coleta"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 49
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 52
    const-string v0, "CREATE TABLE bf_coleta (id_coleta INTEGER PRIMARY KEY AUTOINCREMENT, peso TEXT, numero_mtr TEXT, data_coleta TEXT, id_rota TEXT, id_volume TEXT, cliente_ausente TEXT, coleta_sem_residuo TEXT, coleta_extra TEXT, observacao TEXT, enviado TEXT, id_cliente_emite_mtr INTEGER, tipo_coleta TEXT, cod_bombona TEXT, data_envio TEXT, id_coleta_controlado TEXT, id_coleta_servidor INTEGER, cod_etiqueta TEXT, id_tipo_residuo INTEGER, id_volume_extra INTEGER, id_coleta_logradouro INTEGER, id_dia_coleta INTEGER )"

    .line 76
    .local v0, "createTableColeta":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public static onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p1, "oldVersion"    # I

    .line 80
    const/4 v0, 0x6

    if-ge p1, v0, :cond_0

    .line 81
    const-string v0, "ALTER TABLE bf_coleta ADD COLUMN cod_etiqueta TEXT"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 83
    :cond_0
    const/16 v0, 0x12

    if-ge p1, v0, :cond_1

    .line 84
    const-string v0, "ALTER TABLE bf_coleta ADD COLUMN id_tipo_residuo INTEGER "

    .line 85
    .local v0, "alterTableV18":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 87
    .end local v0    # "alterTableV18":Ljava/lang/String;
    :cond_1
    const/16 v0, 0x13

    if-ge p1, v0, :cond_2

    .line 88
    const-string v0, "ALTER TABLE bf_coleta ADD COLUMN id_volume_extra INTEGER "

    .line 89
    .local v0, "alterTableV19":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 91
    .end local v0    # "alterTableV19":Ljava/lang/String;
    :cond_2
    const/16 v0, 0x14

    if-ge p1, v0, :cond_3

    .line 92
    const-string v0, "ALTER TABLE bf_coleta ADD COLUMN id_coleta_logradouro INTEGER "

    .line 93
    .local v0, "alterTableV20":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 95
    .end local v0    # "alterTableV20":Ljava/lang/String;
    :cond_3
    const/16 v0, 0x16

    if-ge p1, v0, :cond_4

    .line 96
    const-string v0, "ALTER TABLE bf_coleta ADD COLUMN id_dia_coleta INTEGER "

    .line 97
    .local v0, "alterTableV22":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 99
    .end local v0    # "alterTableV22":Ljava/lang/String;
    :cond_4
    return-void
.end method


# virtual methods
.method public deleteAll()V
    .locals 3

    .line 369
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "bf_coleta"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 370
    return-void
.end method

.method public deleteAllColetasManifesto(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 4
    .param p1, "codManifesto"    # Ljava/lang/String;
    .param p2, "idCliente"    # Ljava/lang/Integer;

    .line 373
    const-string v0, "numero_mtr = ? and id_cliente_emite_mtr = ? "

    .line 374
    .local v0, "where":Ljava/lang/String;
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {p1, v1}, [Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, "whereArgs":[Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "bf_coleta"

    invoke-virtual {v2, v3, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 376
    return-void
.end method

.method public deleteDataColeta(I)V
    .locals 7
    .param p1, "id"    # I

    .line 347
    const-string v0, ""

    .line 349
    .local v0, "codBarras":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT COD_BOMBONA  FROM bf_coleta WHERE id_coleta=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 353
    .local v1, "select":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 354
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 356
    :cond_0
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 357
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 359
    :cond_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 361
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    .line 362
    .local v3, "whereArgs":[Ljava/lang/String;
    iget-object v4, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "bf_coleta"

    const-string v6, "id_coleta = ?"

    invoke-virtual {v4, v5, v6, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 364
    new-instance v4, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    iget-object v5, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {v4, v5}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 365
    .local v4, "movimentoBombonaTableManager":Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
    invoke-virtual {v4, v0}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->updateDeleteColeta(Ljava/lang/String;)V

    .line 366
    return-void
.end method

.method public deleteOldColeta()V
    .locals 4

    .line 341
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "strftime(substr(data_coleta,7,4)    ||substr(data_coleta,4,2)     ||substr(data_coleta,1,2))  <= strftime(\'%Y%m%d\', DATETIME(\'now\', \'-30 day\'))"

    const/4 v2, 0x0

    const-string v3, "bf_coleta"

    invoke-virtual {v0, v3, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 344
    return-void
.end method

.method public emptyInsert(Landroid/content/ContentValues;Lcom/coleta/ambientuus/dto/PontoColeta;)V
    .locals 10
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "pontoColeta"    # Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 380
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    .line 382
    .local v0, "dataAtual":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd/MM/yyyy HH:mm:ss"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 384
    .local v1, "dateFormat":Ljava/text/DateFormat;
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 386
    .local v2, "hoje":Ljava/lang/String;
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMddHHmmss"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 387
    .local v3, "dateFormatColetaContr":Ljava/text/DateFormat;
    invoke-virtual {v3, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 389
    .local v4, "dataContr":Ljava/lang/String;
    iget-object v5, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v6, "SELECT 1 FROM bf_coleta"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 390
    .local v5, "contador":Landroid/database/Cursor;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 391
    .local v6, "VAL_ID_COLETA_CONTROLADO":Ljava/lang/String;
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 393
    const-string v8, "peso"

    const-string v9, "0"

    invoke-virtual {p1, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    const-string v8, "numero_mtr"

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    const-string v8, "data_coleta"

    invoke-virtual {p1, v8, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "id_volume"

    invoke-virtual {p1, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 397
    const-string v8, "coleta_extra"

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    const-string v8, "enviado"

    const-string v9, "N"

    invoke-virtual {p1, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    const-string v8, "tipo_coleta"

    const-string v9, "QTD"

    invoke-virtual {p1, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    const-string v8, "id_coleta_controlado"

    invoke-virtual {p1, v8, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    const-string v8, "id_cliente_emite_mtr"

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p1, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 403
    const-string v8, "id_coleta_logradouro"

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p1, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 404
    const-string v8, "id_dia_coleta"

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p1, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 406
    iget-object v8, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v9, "bf_coleta"

    invoke-virtual {v8, v9, v7, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 407
    return-void
.end method

.method public existeColetaDia(Ljava/lang/Integer;)Z
    .locals 8
    .param p1, "idDiaColeta"    # Ljava/lang/Integer;

    .line 449
    const-string v3, "id_dia_coleta = ? and enviado = \'N\'"

    .line 450
    .local v3, "selection":Ljava/lang/String;
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v4

    .line 451
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "bf_coleta"

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 458
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 460
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 461
    const/4 v1, 0x1

    return v1

    .line 464
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 465
    const/4 v1, 0x0

    return v1
.end method

.method public existeColetaEtiqueta(Ljava/lang/String;)Z
    .locals 8
    .param p1, "codEtiqueta"    # Ljava/lang/String;

    .line 428
    const-string v3, "cod_etiqueta = ?"

    .line 429
    .local v3, "selection":Ljava/lang/String;
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v4

    .line 430
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "bf_coleta"

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 437
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 439
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 440
    const/4 v1, 0x1

    return v1

    .line 443
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 444
    const/4 v1, 0x0

    return v1
.end method

.method public getAllColetasAdm()Landroid/database/Cursor;
    .locals 3

    .line 161
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "SELECT  bf_coleta.peso,bf_coleta.numero_mtr,bf_coleta.data_coleta,bf_coleta.id_rota,bf_coleta.id_volume,bf_coleta.cliente_ausente,bf_coleta.coleta_sem_residuo,bf_coleta.coleta_extra,bf_coleta.observacao,bf_coleta.enviado,bf_volume.id_volume,bf_volume.descricao,bf_coleta.id_cliente_emite_mtr FROM bf_coleta LEFT JOIN bf_volume ON bf_coleta.id_volume = bf_volume.id_volume  ORDER BY DATA_COLETA DESC"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 180
    .local v0, "data":Landroid/database/Cursor;
    return-object v0
.end method

.method public getAllColetasDC()Landroid/database/Cursor;
    .locals 4

    .line 212
    const-string v0, "N"

    .line 214
    .local v0, "envia":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SELECT  bf_coleta.id_coleta,bf_coleta.peso,bf_coleta.numero_mtr,bf_coleta.data_coleta,bf_coleta.id_rota,bf_coleta.id_volume,bf_coleta.cliente_ausente,bf_coleta.coleta_sem_residuo,bf_coleta.coleta_extra,bf_volume.id_volume,bf_volume.descricao,bf_volume.tara,bf_coleta.id_cliente_emite_mtr,bf_coleta.cod_etiqueta FROM bf_coleta LEFT JOIN bf_volume ON bf_coleta.id_volume = bf_volume.id_volume WHERE enviado = \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "bf_coleta"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "numero_mtr"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " LIKE \'DC%\' ORDER BY DATA_COLETA DESC"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 236
    .local v1, "data":Landroid/database/Cursor;
    return-object v1
.end method

.method public getAllColetasJson()Ljava/util/List;
    .locals 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation

    .line 102
    const-string v10, "N"

    .line 103
    .local v10, "envia":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .local v0, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT  peso , numero_mtr , data_coleta , id_rota , id_volume , cliente_ausente , coleta_sem_residuo , coleta_extra , observacao , id_cliente_emite_mtr , tipo_coleta, cod_bombona, id_coleta_controlado, cod_etiqueta, id_tipo_residuo, id_volume_extra, id_coleta_logradouro, id_dia_coleta FROM bf_coleta WHERE enviado=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 126
    .local v1, "selectQuery":Ljava/lang/String;
    move-object/from16 v2, p0

    iget-object v3, v2, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 128
    .local v3, "cursor":Landroid/database/Cursor;
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 130
    :goto_0
    move-object v4, v0

    .end local v0    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .local v4, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    new-instance v0, Lcom/coleta/ambientuus/dto/Coleta;

    const/4 v5, 0x0

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 131
    const/4 v6, 0x1

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 132
    const/4 v7, 0x2

    invoke-interface {v3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 133
    const/4 v8, 0x3

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 134
    const/4 v9, 0x4

    invoke-interface {v3, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 135
    const/4 v11, 0x5

    invoke-interface {v3, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 136
    const/4 v12, 0x6

    invoke-interface {v3, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 137
    const/4 v13, 0x7

    invoke-interface {v3, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 138
    const/16 v14, 0x8

    invoke-interface {v3, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 140
    const/16 v15, 0x9

    invoke-interface {v3, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    .line 141
    move-object/from16 v16, v0

    const/16 v0, 0xa

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 142
    move-object/from16 v17, v0

    const/16 v0, 0xb

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 144
    move-object/from16 v18, v0

    const/16 v0, 0xc

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 146
    move-object/from16 v19, v0

    const/16 v0, 0xd

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 147
    move-object/from16 v20, v0

    const/16 v0, 0xe

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 148
    move-object/from16 v21, v0

    const/16 v0, 0xf

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 149
    move-object/from16 v22, v0

    const/16 v0, 0x10

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 150
    move-object/from16 v23, v0

    const/16 v0, 0x11

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object/from16 v24, v1

    move-object v1, v5

    move-object v5, v9

    move-object v9, v14

    .end local v1    # "selectQuery":Ljava/lang/String;
    .local v24, "selectQuery":Ljava/lang/String;
    const/4 v14, 0x0

    move-object/from16 v25, v4

    move-object v4, v8

    move-object v8, v13

    move-object/from16 v13, v18

    move-object/from16 v18, v21

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    .end local v4    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .local v25, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    const/16 v16, 0x0

    move-object v2, v6

    move-object v6, v11

    move-object v11, v15

    move-object/from16 v15, v19

    move-object/from16 v19, v22

    move-object/from16 v26, v25

    move-object/from16 v22, v3

    move-object v3, v7

    move-object v7, v12

    move-object/from16 v12, v17

    move-object/from16 v17, v20

    move-object/from16 v20, v23

    .end local v3    # "cursor":Landroid/database/Cursor;
    .end local v25    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .local v22, "cursor":Landroid/database/Cursor;
    .local v26, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    invoke-direct/range {v0 .. v21}, Lcom/coleta/ambientuus/dto/Coleta;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 130
    move-object/from16 v4, v26

    .end local v26    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .restart local v4    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    move-object/from16 v2, p0

    move-object v0, v4

    move-object/from16 v3, v22

    move-object/from16 v1, v24

    goto/16 :goto_0

    .line 128
    .end local v4    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .end local v22    # "cursor":Landroid/database/Cursor;
    .end local v24    # "selectQuery":Ljava/lang/String;
    .restart local v0    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .restart local v1    # "selectQuery":Ljava/lang/String;
    .restart local v3    # "cursor":Landroid/database/Cursor;
    :cond_1
    move-object v4, v0

    move-object/from16 v24, v1

    move-object/from16 v22, v3

    .line 155
    .end local v0    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .end local v1    # "selectQuery":Ljava/lang/String;
    .end local v3    # "cursor":Landroid/database/Cursor;
    .restart local v4    # "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    .restart local v22    # "cursor":Landroid/database/Cursor;
    .restart local v24    # "selectQuery":Ljava/lang/String;
    :goto_1
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 156
    return-object v4
.end method

.method public getAllColetasMTR()Landroid/database/Cursor;
    .locals 4

    .line 184
    const-string v0, "N"

    .line 186
    .local v0, "envia":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SELECT  bf_coleta.id_coleta,bf_coleta.peso,bf_coleta.numero_mtr,bf_coleta.data_coleta,bf_coleta.id_rota,bf_coleta.id_volume,bf_coleta.cliente_ausente,bf_coleta.coleta_sem_residuo,bf_coleta.coleta_extra,bf_volume.id_volume,bf_volume.descricao,bf_volume.tara,bf_coleta.id_cliente_emite_mtr,bf_coleta.cod_etiqueta FROM bf_coleta LEFT JOIN bf_volume ON bf_coleta.id_volume = bf_volume.id_volume WHERE enviado = \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "bf_coleta"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "numero_mtr"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " NOT LIKE \'DC%\' ORDER BY DATA_COLETA DESC"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 208
    .local v1, "data":Landroid/database/Cursor;
    return-object v1
.end method

.method public getListGrouped(Ljava/lang/String;Ljava/lang/Integer;)Landroid/database/Cursor;
    .locals 3
    .param p1, "NroMtr"    # Ljava/lang/String;
    .param p2, "cliente"    # Ljava/lang/Integer;

    .line 242
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT bf_coleta.peso as peso_bruto   ,bf_volume.tara as tara FROM bf_coleta  LEFT JOIN  bf_volume ON bf_coleta.id_volume = bf_volume.id_volume WHERE numero_mtr= \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "id_cliente_emite_mtr"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "= \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 260
    .local v0, "select":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 263
    .local v1, "data":Landroid/database/Cursor;
    return-object v1
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Coleta;)Ljava/lang/String;
    .locals 11
    .param p1, "coleta"    # Lcom/coleta/ambientuus/dto/Coleta;

    .line 268
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    .line 270
    .local v0, "dataAtual":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyyMMddHHmmss"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 271
    .local v1, "dateFormatColetaContr":Ljava/text/DateFormat;
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 273
    .local v2, "dataContr":Ljava/lang/String;
    iget-object v3, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v4, "SELECT 1 FROM bf_coleta"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 275
    .local v3, "contador":Landroid/database/Cursor;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 277
    .local v4, "VAL_ID_COLETA_CONTROLADO":Ljava/lang/String;
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 279
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 280
    .local v6, "values":Landroid/content/ContentValues;
    const-string v7, "peso"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const-string v7, "numero_mtr"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getNumero_mtr()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string v7, "data_coleta"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getData_coleta()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_rota()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const-string v8, "id_rota"

    invoke-virtual {v6, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 284
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_volume()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const-string v8, "id_volume"

    invoke-virtual {v6, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 285
    const-string v7, "cliente_ausente"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getCliente_ausente()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    const-string v7, "coleta_sem_residuo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_sem_residuo()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    const-string v7, "coleta_extra"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_extra()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    const-string v7, "observacao"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getObservacao()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    const-string v7, "enviado"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getEnviado()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    const-string v7, "id_cliente_emite_mtr"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_cliente_mtr()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 291
    const-string v7, "tipo_coleta"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getTipo_coleta()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    const-string v7, "cod_bombona"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_bombona()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    const-string v7, "data_envio"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getData_envio()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    const-string v7, "id_coleta_controlado"

    invoke-virtual {v6, v7, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    const-string v7, "id_coleta_servidor"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_app_coleta()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 296
    const-string v7, "cod_etiqueta"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_Etiqueta()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    const-string v7, "id_tipo_residuo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getIdTipoResiduo()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 298
    const-string v7, "id_volume_extra"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getIdVolumeExtra()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 299
    const-string v7, "id_coleta_logradouro"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 300
    const-string v7, "id_dia_coleta"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 302
    iget-object v7, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v8, "bf_coleta"

    invoke-virtual {v7, v8, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v7

    .line 304
    .local v7, "result":J
    const-wide/16 v9, -0x1

    cmp-long v5, v7, v9

    if-nez v5, :cond_0

    .line 305
    const-string v5, "NULL"

    return-object v5

    .line 307
    :cond_0
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_coleta_aplicativo()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public insertClienteAusente(Lcom/coleta/ambientuus/dto/PontoColeta;I)V
    .locals 3
    .param p1, "pontoColeta"    # Lcom/coleta/ambientuus/dto/PontoColeta;
    .param p2, "idRota"    # I

    .line 420
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 421
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "cliente_ausente"

    const-string v2, "S"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    const-string v1, "coleta_sem_residuo"

    const-string v2, "N"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    const-string v1, "id_rota"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 424
    invoke-virtual {p0, v0, p1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->emptyInsert(Landroid/content/ContentValues;Lcom/coleta/ambientuus/dto/PontoColeta;)V

    .line 425
    return-void
.end method

.method public insertSemResiduo(Lcom/coleta/ambientuus/dto/PontoColeta;I)V
    .locals 3
    .param p1, "pontoColeta"    # Lcom/coleta/ambientuus/dto/PontoColeta;
    .param p2, "idRota"    # I

    .line 411
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 412
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "coleta_sem_residuo"

    const-string v2, "S"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    const-string v1, "cliente_ausente"

    const-string v2, "N"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    const-string v1, "id_rota"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 415
    invoke-virtual {p0, v0, p1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->emptyInsert(Landroid/content/ContentValues;Lcom/coleta/ambientuus/dto/PontoColeta;)V

    .line 416
    return-void
.end method

.method public updateListJson()Z
    .locals 10

    .line 323
    const-string v0, "N"

    .line 324
    .local v0, "envia":Ljava/lang/String;
    const-string v1, "S"

    .line 325
    .local v1, "retornoenvio":Ljava/lang/String;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 326
    .local v2, "cv":Landroid/content/ContentValues;
    const-string v3, "enviado"

    invoke-virtual {v2, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    .line 329
    .local v3, "dataAtual":Ljava/util/Date;
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "dd/MM/yyyy HH:mm:ss"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 330
    .local v4, "dateFormat":Ljava/text/DateFormat;
    invoke-virtual {v4, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    .line 332
    .local v5, "hoje":Ljava/lang/String;
    const-string v6, "data_envio"

    invoke-virtual {v2, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    iget-object v6, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "enviado=\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' AND "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "id_coleta_servidor"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " IS NOT NULL"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    const-string v9, "bf_coleta"

    invoke-virtual {v6, v9, v2, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    int-to-long v6, v6

    .line 337
    .local v6, "result":J
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-eqz v8, :cond_0

    const/4 v8, 0x1

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    :goto_0
    return v8
.end method

.method public updateReturnColeta(Lcom/coleta/ambientuus/dto/Coleta;)V
    .locals 5
    .param p1, "coleta"    # Lcom/coleta/ambientuus/dto/Coleta;

    .line 312
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 314
    .local v0, "cv":Landroid/content/ContentValues;
    const-string v1, "id_coleta_servidor"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_app_coleta()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 316
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "id_coleta_controlado = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 318
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_coleta_aplicativo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 316
    const-string v3, "bf_coleta"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v0, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 320
    return-void
.end method
