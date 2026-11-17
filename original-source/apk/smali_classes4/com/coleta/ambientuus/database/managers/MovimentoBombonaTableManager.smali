.class public Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
.super Ljava/lang/Object;
.source "MovimentoBombonaTableManager.java"


# static fields
.field public static final COL_COD_BARRAS:Ljava/lang/String; = "cod_barras"

.field public static final COL_DATA_ALOCACAO:Ljava/lang/String; = "data_alocacao"

.field public static final COL_DATA_BAIXA:Ljava/lang/String; = "data_baixa"

.field public static final COL_DATA_COLETA:Ljava/lang/String; = "data_coleta"

.field public static final COL_DATA_MOVTO:Ljava/lang/String; = "data_movto"

.field public static final COL_DATA_TERCEIRO:Ljava/lang/String; = "data_terceiro"

.field public static final COL_DATA_TRANSPORTE:Ljava/lang/String; = "data_transporte"

.field public static final COL_ENVIADO:Ljava/lang/String; = "enviado"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_CLIENTE:Ljava/lang/String; = "id_cliente"

.field public static final COL_ID_COLETA_CONTROLADO:Ljava/lang/String; = "id_coleta_controlado"

.field public static final COL_ID_FROTA_VEICULO:Ljava/lang/String; = "id_frota_veiculo"

.field public static final COL_ID_ROTA:Ljava/lang/String; = "id_rota"

.field public static final COL_ID_TERCEIRO:Ljava/lang/String; = "id_terceiro"

.field public static final TABLE_NAME:Ljava/lang/String; = "BF_MOVIMENTO_BOMBONAS"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 41
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 44
    const-string v0, "CREATE TABLE BF_MOVIMENTO_BOMBONAS (id INTEGER PRIMARY KEY AUTOINCREMENT, cod_barras TEXT, id_cliente INTEGER, id_terceiro INTEGER, data_alocacao TEXT, data_coleta TEXT, data_baixa TEXT, data_transporte TEXT, data_terceiro TEXT, enviado TEXT, data_movto TEXT, id_coleta_controlado TEXT, id_rota INTEGER, id_frota_veiculo INTEGER)"

    .line 60
    .local v0, "createTable":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method private static getContentValues(Lcom/coleta/ambientuus/dto/MovimentoBombona;Ljava/lang/String;)Landroid/content/ContentValues;
    .locals 3
    .param p0, "movimentoBombona"    # Lcom/coleta/ambientuus/dto/MovimentoBombona;
    .param p1, "hoje"    # Ljava/lang/String;

    .line 278
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 280
    .local v0, "cv":Landroid/content/ContentValues;
    const-string v1, "cod_barras"

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getCod_barras()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const-string v1, "enviado"

    const-string v2, "N"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string v1, "data_movto"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getTipo_movto()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v2, "TR"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    goto :goto_1

    :sswitch_1
    const-string v2, "TC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_1

    :sswitch_2
    const-string v2, "C"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :sswitch_3
    const-string v2, "B"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_1

    :sswitch_4
    const-string v2, "A"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    packed-switch v1, :pswitch_data_0

    goto :goto_2

    .line 299
    :pswitch_0
    const-string v1, "DATA_TERCEIRO"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    const-string v1, "ID_TERCEIRO"

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getId_cliente()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_2

    .line 296
    :pswitch_1
    const-string v1, "DATA_TRANSPORTE"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    goto :goto_2

    .line 293
    :pswitch_2
    const-string v1, "DATA_BAIXA"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    goto :goto_2

    .line 290
    :pswitch_3
    const-string v1, "DATA_COLETA"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    goto :goto_2

    .line 286
    :pswitch_4
    const-string v1, "DATA_ALOCACAO"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    const-string v1, "ID_CLIENTE"

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getId_cliente()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 288
    nop

    .line 304
    :goto_2
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getId_coleta_controlado()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 305
    const-string v1, "ID_COLETA_CONTROLADO"

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getId_coleta_controlado()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    :cond_1
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getId_rota()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 307
    const-string v1, "ID_ROTA"

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getId_rota()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    :cond_2
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getId_frota_veiculo()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 309
    const-string v1, "ID_FROTA_VEICULO"

    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getId_frota_veiculo()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 310
    :cond_3
    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_4
        0x42 -> :sswitch_3
        0x43 -> :sswitch_2
        0xa6f -> :sswitch_1
        0xa7e -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public deleteMovtos7days()V
    .locals 2

    .line 336
    const-string v0, "DELETE FROM BF_MOVIMENTO_BOMBONAS WHERE strftime(substr(data_movto,7,4)    ||substr(data_movto,4,2)    ||substr(data_movto,1,2))  <= strftime(\'%Y%m%d\', DATETIME(\'now\', \'-30 day\'))AND enviado = \'S\' "

    .line 342
    .local v0, "sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 343
    return-void
.end method

.method public getMovtosBombonasJson()Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
            ">;"
        }
    .end annotation

    .line 191
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 193
    .local v0, "movimentos":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    const-string v1, "SELECT cod_barras, id_cliente, data_alocacao, data_coleta, data_baixa, data_transporte, id_coleta_controlado, id_rota, data_terceiro, id_terceiro, id_frota_veiculo FROM BF_MOVIMENTO_BOMBONAS WHERE enviado = \'N\'"

    .line 208
    .local v1, "selectQuery":Ljava/lang/String;
    move-object/from16 v2, p0

    iget-object v3, v2, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 210
    .local v3, "cursor":Landroid/database/Cursor;
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_b

    .line 212
    :cond_0
    const/4 v5, 0x0

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 214
    .local v7, "codBarras":Ljava/lang/String;
    const/4 v5, 0x1

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v8, v4

    goto :goto_0

    :cond_1
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object v8, v5

    .line 215
    .local v8, "idCliente":Ljava/lang/Integer;
    :goto_0
    const/4 v5, 0x2

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_2

    move-object v9, v4

    goto :goto_1

    :cond_2
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v9, v5

    .line 216
    .local v9, "dataAlocacao":Ljava/lang/String;
    :goto_1
    const/4 v5, 0x3

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_3

    move-object v10, v4

    goto :goto_2

    :cond_3
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v10, v5

    .line 217
    .local v10, "dataColeta":Ljava/lang/String;
    :goto_2
    const/4 v5, 0x4

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_4

    move-object v11, v4

    goto :goto_3

    :cond_4
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v11, v5

    .line 218
    .local v11, "dataBaixa":Ljava/lang/String;
    :goto_3
    const/4 v5, 0x5

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_5

    move-object v12, v4

    goto :goto_4

    :cond_5
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v12, v5

    .line 219
    .local v12, "dataTransporte":Ljava/lang/String;
    :goto_4
    const/4 v5, 0x6

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_6

    move-object v13, v4

    goto :goto_5

    :cond_6
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v13, v5

    .line 220
    .local v13, "idColetaControlado":Ljava/lang/String;
    :goto_5
    const/4 v5, 0x7

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_7

    move-object v14, v4

    goto :goto_6

    :cond_7
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v14, v5

    .line 221
    .local v14, "idRota":Ljava/lang/String;
    :goto_6
    const/16 v5, 0x8

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_8

    move-object v15, v4

    goto :goto_7

    :cond_8
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v15, v5

    .line 222
    .local v15, "dataTerceiro":Ljava/lang/String;
    :goto_7
    const/16 v5, 0x9

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_9

    move-object/from16 v16, v4

    goto :goto_8

    :cond_9
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v16, v5

    .line 223
    .local v16, "idTerceiro":Ljava/lang/Integer;
    :goto_8
    const/16 v5, 0xa

    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a

    move-object/from16 v17, v4

    goto :goto_9

    :cond_a
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v17, v5

    .line 225
    .local v17, "idFrotaVeiculo":Ljava/lang/Integer;
    :goto_9
    new-instance v6, Lcom/coleta/ambientuus/dto/MovimentoBombona;

    invoke-direct/range {v6 .. v17}, Lcom/coleta/ambientuus/dto/MovimentoBombona;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 239
    .local v6, "movimento":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    .end local v6    # "movimento":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    .end local v7    # "codBarras":Ljava/lang/String;
    .end local v8    # "idCliente":Ljava/lang/Integer;
    .end local v9    # "dataAlocacao":Ljava/lang/String;
    .end local v10    # "dataColeta":Ljava/lang/String;
    .end local v11    # "dataBaixa":Ljava/lang/String;
    .end local v12    # "dataTransporte":Ljava/lang/String;
    .end local v13    # "idColetaControlado":Ljava/lang/String;
    .end local v14    # "idRota":Ljava/lang/String;
    .end local v15    # "dataTerceiro":Ljava/lang/String;
    .end local v16    # "idTerceiro":Ljava/lang/Integer;
    .end local v17    # "idFrotaVeiculo":Ljava/lang/Integer;
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 243
    :cond_b
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 244
    return-object v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/MovimentoBombona;)V
    .locals 6
    .param p1, "movimentoBombona"    # Lcom/coleta/ambientuus/dto/MovimentoBombona;

    .line 259
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd/MM/yyyy HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 260
    .local v0, "hoje":Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->getContentValues(Lcom/coleta/ambientuus/dto/MovimentoBombona;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v1

    .line 263
    .local v1, "cv":Landroid/content/ContentValues;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getCod_barras()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->validaMovtoBombona(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "BF_MOVIMENTO_BOMBONAS"

    if-nez v2, :cond_0

    .line 264
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .local v2, "resultado":J
    goto :goto_0

    .line 266
    .end local v2    # "resultado":J
    :cond_0
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 267
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getCod_barras()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    .line 266
    const-string v5, "cod_barras = ? AND enviado = \'N\'"

    invoke-virtual {v2, v3, v1, v5, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    .line 270
    .restart local v2    # "resultado":J
    :goto_0
    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-eqz v4, :cond_1

    .line 271
    new-instance v4, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v5, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {v4, v5}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 272
    .local v4, "bombonaTableManager":Lcom/coleta/ambientuus/database/managers/BombonaTableManager;
    invoke-virtual {v4, p1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->updateMovto(Lcom/coleta/ambientuus/dto/MovimentoBombona;)V

    .line 274
    .end local v4    # "bombonaTableManager":Lcom/coleta/ambientuus/database/managers/BombonaTableManager;
    :cond_1
    return-void
.end method

.method public updateDeleteColeta(Ljava/lang/String;)V
    .locals 5
    .param p1, "codBarras"    # Ljava/lang/String;

    .line 326
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 327
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string v1, "id_coleta_controlado"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 328
    const-string v1, "data_coleta"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 330
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v1

    .line 331
    .local v1, "whereArgs2":[Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "BF_MOVIMENTO_BOMBONAS"

    const-string v4, "cod_barras = ?"

    invoke-virtual {v2, v3, v0, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 332
    return-void
.end method

.method public updateMovtoEnv()V
    .locals 8

    .line 314
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    .line 315
    .local v0, "dataAtual":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd/MM/yyyy HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 316
    .local v1, "dateFormat":Ljava/text/DateFormat;
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 318
    .local v2, "hoje":Ljava/lang/String;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 319
    .local v3, "cv":Landroid/content/ContentValues;
    const-string v4, "enviado"

    const-string v5, "S"

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    const-string v4, "data_movto"

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    iget-object v4, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "enviado = \'N\'"

    const/4 v6, 0x0

    const-string v7, "BF_MOVIMENTO_BOMBONAS"

    invoke-virtual {v4, v7, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 323
    return-void
.end method

.method public validaBombona(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "bombona"    # Ljava/lang/String;
    .param p2, "tipo_movto"    # Ljava/lang/String;

    .line 74
    const-string v0, "SELECT data_transporte, data_alocacao, data_coleta, data_terceiro, data_baixa FROM BF_MOVIMENTO_BOMBONAS m WHERE m.cod_barras = ? AND m.enviado = \'S\' AND m.id = (SELECT MAX(id) FROM BF_MOVIMENTO_BOMBONAS MM  WHERE MM.cod_barras = m.cod_barras)"

    .line 86
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 87
    .local v1, "c":Landroid/database/Cursor;
    const/4 v2, 0x0

    .line 89
    .local v2, "res":Ljava/lang/String;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 90
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    .line 91
    .local v3, "carregado":Z
    invoke-interface {v1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v5

    xor-int/2addr v5, v4

    .line 92
    .local v5, "alocado":Z
    const/4 v6, 0x2

    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    xor-int/2addr v6, v4

    .line 93
    .local v6, "coletado":Z
    const/4 v7, 0x3

    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    xor-int/2addr v7, v4

    .line 94
    .local v7, "descarregado":Z
    const/4 v8, 0x4

    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v8

    xor-int/2addr v4, v8

    .line 96
    .local v4, "baixado":Z
    if-eqz v4, :cond_0

    .line 97
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->validaBombonaEnviadoN(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 99
    :cond_0
    const-string v8, "TR"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 100
    if-eqz v7, :cond_1

    const-string v2, "Bombona j\u00e1 Descarregada!"

    goto :goto_0

    .line 101
    :cond_1
    if-eqz v6, :cond_2

    const-string v2, "Bombona j\u00e1 Coletada!"

    goto :goto_0

    .line 102
    :cond_2
    if-eqz v5, :cond_3

    const-string v2, "Bombona j\u00e1 Alocada!"

    goto :goto_0

    .line 103
    :cond_3
    if-eqz v3, :cond_d

    const-string v2, "Bombona j\u00e1 Carregada!"

    goto :goto_0

    .line 104
    :cond_4
    const-string v8, "A"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 105
    if-eqz v7, :cond_5

    const-string v2, "Bombona j\u00e1 Descarregada!"

    goto :goto_0

    .line 106
    :cond_5
    if-eqz v6, :cond_6

    const-string v2, "Bombona j\u00e1 Coletada!"

    goto :goto_0

    .line 107
    :cond_6
    if-eqz v5, :cond_7

    const-string v2, "Bombona j\u00e1 Alocada!"

    goto :goto_0

    .line 108
    :cond_7
    if-nez v3, :cond_d

    const-string v2, "Bombona n\u00e3o Carregada!"

    goto :goto_0

    .line 109
    :cond_8
    const-string v8, "C"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 110
    if-eqz v7, :cond_9

    const-string v2, "Bombona j\u00e1 Descarregada!"

    goto :goto_0

    .line 111
    :cond_9
    if-eqz v6, :cond_a

    const-string v2, "Bombona j\u00e1 Coletada!"

    goto :goto_0

    .line 112
    :cond_a
    if-nez v5, :cond_d

    const-string v2, "Bombona n\u00e3o Alocada!"

    goto :goto_0

    .line 113
    :cond_b
    const-string v8, "TC"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 114
    if-eqz v7, :cond_c

    const-string v2, "Bombona j\u00e1 Descarregada!"

    goto :goto_0

    .line 115
    :cond_c
    if-nez v6, :cond_d

    const-string v2, "Bombona n\u00e3o Coletada!"

    .line 118
    .end local v3    # "carregado":Z
    .end local v4    # "baixado":Z
    .end local v5    # "alocado":Z
    .end local v6    # "coletado":Z
    .end local v7    # "descarregado":Z
    :cond_d
    :goto_0
    goto :goto_1

    .line 119
    :cond_e
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->validaBombonaEnviadoN(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 122
    :goto_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 123
    return-object v2
.end method

.method public validaBombonaEnviadoN(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "bombona"    # Ljava/lang/String;
    .param p2, "tipo_movto"    # Ljava/lang/String;

    .line 127
    const/4 v0, 0x0

    .line 129
    .local v0, "result":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT m.data_transporte, m.data_alocacao, m.data_coleta, m.data_terceiro, m.data_baixa FROM BF_MOVIMENTO_BOMBONAS m WHERE m.cod_barras = \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' AND m."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "enviado"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " = \'N\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, "queryMov":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 141
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 142
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    .line 143
    .local v3, "transporte":Z
    invoke-interface {v2, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v5

    xor-int/2addr v5, v4

    .line 144
    .local v5, "alocacao":Z
    const/4 v6, 0x2

    invoke-interface {v2, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    xor-int/2addr v6, v4

    .line 145
    .local v6, "coleta":Z
    const/4 v7, 0x3

    invoke-interface {v2, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    xor-int/2addr v7, v4

    .line 146
    .local v7, "terceiro":Z
    const/4 v8, 0x4

    invoke-interface {v2, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v8

    xor-int/2addr v4, v8

    .line 148
    .local v4, "baixa":Z
    const-string v8, "B"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    const-string v9, "Bombona j\u00e1 Baixada! Favor atualizar base."

    if-eqz v8, :cond_0

    if-eqz v4, :cond_0

    return-object v9

    .line 150
    :cond_0
    const-string v8, "TR"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    const-string v10, "Bombona j\u00e1 Alocada!"

    const-string v11, "Bombona j\u00e1 Coletada!"

    const-string v12, "Bombona j\u00e1 Descarregada!"

    if-eqz v8, :cond_5

    .line 151
    if-eqz v4, :cond_1

    return-object v9

    .line 152
    :cond_1
    if-eqz v7, :cond_2

    return-object v12

    .line 153
    :cond_2
    if-eqz v6, :cond_3

    return-object v11

    .line 154
    :cond_3
    if-eqz v5, :cond_4

    return-object v10

    .line 155
    :cond_4
    if-eqz v3, :cond_5

    const-string v8, "Bombona j\u00e1 Carregada!"

    return-object v8

    .line 158
    :cond_5
    const-string v8, "A"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 159
    if-eqz v4, :cond_6

    return-object v9

    .line 160
    :cond_6
    if-eqz v7, :cond_7

    return-object v12

    .line 161
    :cond_7
    if-eqz v6, :cond_8

    return-object v11

    .line 162
    :cond_8
    if-eqz v5, :cond_9

    return-object v10

    .line 163
    :cond_9
    if-nez v3, :cond_a

    const-string v8, "Bombona n\u00e3o Carregada!"

    return-object v8

    .line 166
    :cond_a
    const-string v8, "C"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 167
    if-eqz v4, :cond_b

    return-object v9

    .line 168
    :cond_b
    if-eqz v7, :cond_c

    return-object v12

    .line 169
    :cond_c
    if-eqz v6, :cond_d

    return-object v11

    .line 170
    :cond_d
    if-nez v5, :cond_e

    const-string v8, "Bombona n\u00e3o Alocada!"

    return-object v8

    .line 173
    :cond_e
    const-string v8, "TC"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 174
    if-eqz v4, :cond_f

    return-object v9

    .line 175
    :cond_f
    if-eqz v7, :cond_10

    return-object v12

    .line 176
    :cond_10
    if-nez v6, :cond_11

    const-string v8, "Bombona n\u00e3o Coletada!"

    return-object v8

    .line 179
    .end local v3    # "transporte":Z
    .end local v4    # "baixa":Z
    .end local v5    # "alocacao":Z
    .end local v6    # "coleta":Z
    .end local v7    # "terceiro":Z
    :cond_11
    nop

    .line 185
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 186
    return-object v0

    .line 181
    :cond_12
    new-instance v3, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v4, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {v3, v4}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 182
    .local v3, "bombonaTableManager":Lcom/coleta/ambientuus/database/managers/BombonaTableManager;
    invoke-virtual {v3, p1, p2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->verificaStatusSincronizadoBombona(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public validaMovtoBombona(Ljava/lang/String;)Z
    .locals 3
    .param p1, "bombona"    # Ljava/lang/String;

    .line 64
    const-string v0, "SELECT 1 FROM BF_MOVIMENTO_BOMBONAS WHERE cod_barras = ? AND enviado = \'N\'"

    .line 66
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 67
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 68
    .local v2, "existe":Z
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 69
    return v2
.end method
