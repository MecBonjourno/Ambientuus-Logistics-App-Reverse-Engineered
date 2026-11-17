.class public Lcom/coleta/ambientuus/database/managers/BombonaTableManager;
.super Ljava/lang/Object;
.source "BombonaTableManager.java"


# static fields
.field public static final COL_CAPACIDADE:Ljava/lang/String; = "capacidade"

.field public static final COL_COD_BARRAS:Ljava/lang/String; = "cod_barras"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_BOMBONA:Ljava/lang/String; = "id_bombona"

.field public static final COL_ID_CLIENTE:Ljava/lang/String; = "id_cliente"

.field public static final COL_ID_TERCEIRO:Ljava/lang/String; = "id_terceiro"

.field public static final COL_ID_VOLUME:Ljava/lang/String; = "id_volume"

.field public static final COL_STATUS:Ljava/lang/String; = "status"

.field public static final TABLE_NAME:Ljava/lang/String; = "BF_BOMBONAS_CADASTRADAS"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 28
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 31
    const-string v0, "CREATE TABLE BF_BOMBONAS_CADASTRADAS (id INTEGER PRIMARY KEY AUTOINCREMENT, id_bombona INTEGER, cod_barras TEXT, id_volume INTEGER, status TEXT, id_cliente INTEGER, capacidade TEXT, id_terceiro INTEGER)"

    .line 40
    .local v0, "createTable":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 357
    const-string v0, "BF_BOMBONAS_CADASTRADAS"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 358
    return-void
.end method


# virtual methods
.method public getAllBombonas()Landroid/database/Cursor;
    .locals 3

    .line 112
    const-string v0, "SELECT B.id_bombona, \n                    B.cod_barras, \n                     ifnull((select case when bmc.data_baixa is not null then \n                     \'DISPONIVEL\' \n                    when bmc.data_transporte is not null \n                     and bmc.data_alocacao is null \n                     and bmc.data_coleta is null \n                     and bmc.data_terceiro is null \n                     and bmc.data_baixa is null then \n                     \'CARREGADO\' \n                    when bmc.data_alocacao is not null \n                     and bmc.data_coleta is null \n                     and bmc.data_terceiro is null \n                     and bmc.data_baixa is null then \n                     \'EM CLIENTE\' \n                    when bmc.data_coleta is not null \n                     and bmc.data_terceiro is null \n                     and bmc.data_baixa is null then \n                     \'COLETADO\' \n                    when bmc.data_terceiro is not null \n                     and bmc.data_baixa is null then \n                     \'DESCARREGADO\' \n                   end  status \n                 from BF_MOVIMENTO_BOMBONAS bmc \n                where bmc.cod_barras = B.cod_barras \n                  and bmc.id = (select max(m.id) \n                                  from BF_MOVIMENTO_BOMBONAS m \n                                 where m.cod_barras = B.cod_barras)),B.status) STATUS, \n                  B.id_cliente,               \n                  B.capacidade               \n                FROM BF_BOMBONAS_CADASTRADAS B"

    .line 143
    .local v0, "selectQuery":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method public getClienteBombona(Ljava/lang/String;)Landroid/database/Cursor;
    .locals 3
    .param p1, "codBarras"    # Ljava/lang/String;

    .line 288
    const-string v0, "SELECT B.id_cliente , IFNULL((SELECT CASE WHEN bmc.data_transporte IS NOT NULL                      AND bmc.data_alocacao IS NULL                      AND bmc.data_coleta IS NULL                      AND bmc.data_terceiro IS NULL                      AND bmc.data_baixa IS NULL THEN \'CARREGADO\'                  WHEN bmc.data_alocacao IS NOT NULL                      AND bmc.data_coleta IS NULL                      AND bmc.data_baixa IS NULL THEN \'EM CLIENTE\'                  WHEN bmc.data_alocacao IS NOT NULL                      AND bmc.data_coleta IS NOT NULL                      AND bmc.data_baixa IS NULL THEN \'COLETADO\'                  WHEN bmc.data_terceiro IS NOT NULL                      AND bmc.data_baixa IS NULL THEN \'DESCARREGADO\'                  WHEN bmc.data_baixa IS NOT NULL THEN \'DISPONIVEL\'                  END status FROM BF_MOVIMENTO_BOMBONAS bmc WHERE bmc.cod_barras = B.cod_barras AND bmc.id = (SELECT MAX(m.id)             FROM BF_MOVIMENTO_BOMBONAS m             WHERE m.cod_barras = B.cod_barras)), B.status) STATUS, IFNULL((SELECT cmr.razao_social         FROM BF_MOVIMENTO_BOMBONAS bmc              , BF_BOMBONAS_CADASTRADAS cmr         WHERE bmc.cod_barras = B.cod_barras           AND bmc.id_cliente = cmr.id_pessoa           AND bmc.id = (SELECT MAX(m.id)                                                      FROM BF_MOVIMENTO_BOMBONAS m                                                      WHERE m.cod_barras = B.cod_barras)), C.razao_social) RAZAO_SOCIAL, IFNULL((SELECT t.razao_social         FROM BF_MOVIMENTO_BOMBONAS bmc              , BF_TERCEIROS t         WHERE bmc.cod_barras = B.cod_barras           AND bmc.id_terceiro = t.id_pessoa           AND bmc.id = (SELECT MAX(m.id)                                                      FROM BF_MOVIMENTO_BOMBONAS m                                                      WHERE m.cod_barras = B.cod_barras)), T.razao_social) RAZAO_SOCIAL_TERCEIRO FROM BF_BOMBONAS_CADASTRADAS B LEFT OUTER JOIN bf_cliente_emite_mtr C ON B.id_cliente = C.id_pessoa LEFT OUTER JOIN BF_TERCEIROS T ON B.id_terceiro = T.id_pessoa WHERE B.cod_barras = ?"

    .line 330
    .local v0, "selectQuery":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method public getInfoBombona(Ljava/lang/String;)Landroid/database/Cursor;
    .locals 3
    .param p1, "cod_barras"    # Ljava/lang/String;

    .line 147
    const-string v0, "SELECT    IFNULL((SELECT bmc.id_cliente           FROM BF_MOVIMENTO_BOMBONAS bmc            WHERE bmc.cod_barras = b.cod_barras             AND bmc.id = (                 SELECT MAX(m.id)                  FROM BF_MOVIMENTO_BOMBONAS m                  WHERE m.cod_barras = b.cod_barras           )), B.id_cliente) AS ID_CLIENTE,    IFNULL((SELECT cmr.cod_pessoa || \' - \' || cmr.razao_social           FROM BF_MOVIMENTO_BOMBONAS bmc, bf_cliente_emite_mtr cmr            WHERE bmc.cod_barras = b.cod_barras             AND bmc.id_cliente = cmr.id_pessoa             AND bmc.id = (                 SELECT MAX(m.id)                  FROM BF_MOVIMENTO_BOMBONAS m                  WHERE m.cod_barras = b.cod_barras           )),            C.cod_pessoa || \' - \' || C.razao_social) AS RAZAO_SOCIAL,    B.id_volume,    V.descricao,    V.tara FROM BF_BOMBONAS_CADASTRADAS B LEFT JOIN bf_cliente_emite_mtr C ON B.id_cliente = C.id_pessoa LEFT JOIN bf_volume V ON B.id_volume = V.id_volume WHERE B.cod_barras = ?"

    .line 179
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Bombona;)J
    .locals 4
    .param p1, "bombona"    # Lcom/coleta/ambientuus/dto/Bombona;

    .line 334
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 335
    .local v0, "cv":Landroid/content/ContentValues;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Bombona;->getID_BOMBONA()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "id_bombona"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 336
    const-string v1, "cod_barras"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Bombona;->getCOD_BARRAS()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Bombona;->getID_VOLUME()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "id_volume"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 338
    const-string v1, "status"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Bombona;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Bombona;->getID_Cliente()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "id_cliente"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 340
    const-string v1, "capacidade"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Bombona;->getCapacidade()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Bombona;->getId_terceiro()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "id_terceiro"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 342
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "BF_BOMBONAS_CADASTRADAS"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    return-wide v1
.end method

.method public selectBombonasAlocadas()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 223
    const-string v0, "SELECT  COUNT(BC.id), BC.capacidade, CM.razao_social FROM BF_BOMBONAS_CADASTRADAS BC, BF_MOVIMENTO_BOMBONAS MB, bf_cliente_emite_mtr CM WHERE MB.cod_barras = BC.cod_barras AND MB.data_alocacao IS NOT NULL AND MB.enviado = \'N\' AND MB.id_cliente = + id_pessoa GROUP BY BC.capacidade, CM.id_pessoa"

    .line 233
    .local v0, "selectQuery":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 234
    .local v1, "arrayBombonas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 236
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 238
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x2

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " de "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 239
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 241
    :cond_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 242
    return-object v1
.end method

.method public selectBombonasAlocadasTerceiros()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 246
    const-string v0, "SELECT COUNT(BC.id), BC.capacidade, T.razao_social FROM BF_BOMBONAS_CADASTRADAS BC, BF_MOVIMENTO_BOMBONAS MB, BF_TERCEIROS T WHERE MB.cod_barras = BC.cod_barras AND MB.data_terceiro IS NOT NULL AND MB.enviado = \'N\' AND MB.id_terceiro = T.id_pessoa GROUP BY BC.capacidade"

    .line 258
    .local v0, "query":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 259
    .local v1, "lista":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 261
    .local v2, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 262
    const/4 v3, 0x1

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 263
    .local v3, "capacidade":Ljava/lang/String;
    const/4 v4, 0x2

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 264
    .local v4, "razaoSocial":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 265
    .local v5, "quantidade":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " de "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 266
    .end local v3    # "capacidade":Ljava/lang/String;
    .end local v4    # "razaoSocial":Ljava/lang/String;
    .end local v5    # "quantidade":I
    goto :goto_0

    .line 268
    :cond_0
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 269
    return-object v1
.end method

.method public selectBombonasBaixadas()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 203
    const-string v0, "SELECT  COUNT(BC.id), BC.capacidade FROM BF_BOMBONAS_CADASTRADAS BC, BF_MOVIMENTO_BOMBONAS MB WHERE MB.cod_barras = BC.cod_barras AND MB.data_baixa IS NOT NULL AND MB.enviado = \'N\' GROUP BY BC.capacidade"

    .line 210
    .local v0, "selectQuery":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .local v1, "arrayBombonas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 213
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 215
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " de "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 218
    :cond_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 219
    return-object v1
.end method

.method public selectBombonasCarregadas()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 183
    const-string v0, "SELECT  COUNT(BC.id), BC.capacidade FROM BF_BOMBONAS_CADASTRADAS BC, BF_MOVIMENTO_BOMBONAS MB WHERE MB.cod_barras = BC.cod_barras AND MB.data_transporte IS NOT NULL AND MB.enviado = \'N\' GROUP BY BC.capacidade"

    .line 190
    .local v0, "selectQuery":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 191
    .local v1, "arrayBombonas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 193
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 195
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " de "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 198
    :cond_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 199
    return-object v1
.end method

.method public selectCapacidadeBombonas(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 4
    .param p1, "codBarras"    # Ljava/lang/String;

    .line 274
    const-string v0, "SELECT id_volume FROM BF_BOMBONAS_CADASTRADAS WHERE cod_barras = ?"

    .line 276
    .local v0, "query":Ljava/lang/String;
    const/4 v1, 0x0

    .line 278
    .local v1, "capacidade":Ljava/lang/Integer;
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 279
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 280
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 283
    :cond_0
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 284
    return-object v1
.end method

.method public updateMovto(Lcom/coleta/ambientuus/dto/MovimentoBombona;)V
    .locals 5
    .param p1, "movimentoBombona"    # Lcom/coleta/ambientuus/dto/MovimentoBombona;

    .line 346
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 347
    .local v0, "statusUpdate":Landroid/content/ContentValues;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getTipo_movto()Ljava/lang/String;

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

    const/4 v1, 0x4

    goto :goto_1

    :sswitch_1
    const-string v2, "TC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

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

    const/4 v1, 0x3

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
    const-string v2, "STATUS"

    packed-switch v1, :pswitch_data_0

    goto :goto_2

    .line 352
    :pswitch_0
    const-string v1, "CARREGADO"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 351
    :pswitch_1
    const-string v1, "DISPONIVEL"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 350
    :pswitch_2
    const-string v1, "DESCARREGADO"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 349
    :pswitch_3
    const-string v1, "COLETADO"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 348
    :pswitch_4
    const-string v1, "EM CLIENTE"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    :goto_2
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/MovimentoBombona;->getCod_barras()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "BF_BOMBONAS_CADASTRADAS"

    const-string v4, "cod_barras = ?"

    invoke-virtual {v1, v3, v0, v4, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 355
    return-void

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

.method public validaCadastroBombona(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "codBarras"    # Ljava/lang/String;

    .line 44
    const-string v0, "SELECT 1 FROM BF_BOMBONAS_CADASTRADAS WHERE COD_BARRAS = ?"

    .line 45
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 46
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    .line 47
    .local v2, "existe":Z
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 48
    if-eqz v2, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    const-string v3, "Bombona informada n\u00e3o existe no cadastro"

    :goto_0
    return-object v3
.end method

.method verificaStatusSincronizadoBombona(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "bombona"    # Ljava/lang/String;
    .param p2, "tipo_movto"    # Ljava/lang/String;

    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT B.status FROM BF_BOMBONAS_CADASTRADAS B WHERE B.cod_barras = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 57
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x0

    .line 58
    .local v3, "status":Ljava/lang/String;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    .line 59
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 62
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 64
    const-string v4, ""

    .line 65
    .local v4, "movimento":Ljava/lang/String;
    const-string v6, "DESCARREGADO"

    const-string v7, "COLETADO"

    const-string v8, "EM CLIENTE"

    if-eqz v3, :cond_2

    .line 66
    const-string v4, "Bombona j\u00e1 "

    .line 67
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    :cond_1
    goto :goto_0

    :sswitch_0
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x3

    goto :goto_1

    :sswitch_1
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x2

    goto :goto_1

    :sswitch_2
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x1

    goto :goto_1

    :sswitch_3
    const-string v9, "CARREGADA"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    goto :goto_1

    :goto_0
    const/4 v5, -0x1

    :goto_1
    packed-switch v5, :pswitch_data_0

    goto :goto_2

    .line 71
    :pswitch_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "Descarregada!"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 70
    :pswitch_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "Coletada!"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 69
    :pswitch_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "Alocada!"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 68
    :pswitch_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "Carregada!"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 75
    :cond_2
    :goto_2
    const-string v5, "B"

    invoke-virtual {p2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    const-string v10, "Bombona j\u00e1 Baixada!"

    const-string v11, "DISPONIVEL"

    if-eqz v9, :cond_4

    if-eqz v3, :cond_3

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 76
    :cond_3
    return-object v10

    .line 78
    :cond_4
    const-string v9, "TR"

    invoke-virtual {p2, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_6

    if-eqz v3, :cond_5

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 79
    :cond_5
    const-string v2, "Bombona n\u00e3o Carregada!"

    return-object v2

    .line 81
    :cond_6
    invoke-virtual {p2, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    const-string v12, "CARREGADO"

    if-eqz v9, :cond_a

    .line 82
    if-eqz v3, :cond_9

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    goto :goto_3

    .line 83
    :cond_7
    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    const-string v2, "Bombona j\u00e1 Carregada!"

    return-object v2

    .line 84
    :cond_8
    return-object v4

    .line 82
    :cond_9
    :goto_3
    return-object v2

    .line 87
    :cond_a
    const-string v9, "A"

    invoke-virtual {p2, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 88
    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    return-object v2

    .line 89
    :cond_b
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    const-string v2, "Bombona j\u00e1 Alocada!"

    return-object v2

    .line 90
    :cond_c
    return-object v4

    .line 93
    :cond_d
    const-string v9, "C"

    invoke-virtual {p2, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_10

    .line 94
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    return-object v2

    .line 95
    :cond_e
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    const-string v2, "Bombona j\u00e1 Coletada!"

    return-object v2

    .line 96
    :cond_f
    return-object v4

    .line 99
    :cond_10
    const-string v8, "TC"

    invoke-virtual {p2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_13

    .line 100
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    return-object v2

    .line 101
    :cond_11
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    const-string v2, "Bombona j\u00e1 Descarregada!"

    return-object v2

    .line 102
    :cond_12
    return-object v4

    .line 105
    :cond_13
    invoke-virtual {p2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_14

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 106
    return-object v10

    .line 108
    :cond_14
    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        -0x505097c2 -> :sswitch_3
        -0x3562719e -> :sswitch_2
        0x89ed81d -> :sswitch_1
        0x1053309a -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
