.class public Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
.super Ljava/lang/Object;
.source "EtiquetaTableManager.java"


# static fields
.field public static final COL_COD_ETIQUETA:Ljava/lang/String; = "cod_etiqueta"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_ETIQUETA:Ljava/lang/String; = "id_etiqueta"

.field public static final COL_ID_MANIFESTO:Ljava/lang/String; = "id_manifesto"

.field public static final COL_STATUS:Ljava/lang/String; = "status"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_etiqueta"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 29
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 32
    const-string v0, "CREATE TABLE bf_etiqueta (id INTEGER PRIMARY KEY AUTOINCREMENT, id_etiqueta INTEGER, cod_etiqueta TEXT, id_manifesto INTEGER, status TEXT) "

    .line 38
    .local v0, "createTableSQL":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 233
    const-string v0, "bf_etiqueta"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 234
    return-void
.end method

.method private insertRange(IJJ)V
    .locals 11
    .param p1, "idManifesto"    # I
    .param p2, "qtd"    # J
    .param p4, "primeiroCodigo"    # J

    .line 160
    move-wide v0, p4

    .line 161
    .local v0, "ultimoCodigo":J
    :goto_0
    add-long v2, p4, p2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    .line 162
    const-string v2, "SELECT 1 FROM bf_etiqueta WHERE CAST(cod_etiqueta AS INTEGER) = ?"

    .line 163
    .local v2, "query":Ljava/lang/String;
    iget-object v3, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v2, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 165
    .local v3, "cursor":Landroid/database/Cursor;
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-nez v6, :cond_0

    .line 166
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 167
    .local v6, "values":Landroid/content/ContentValues;
    const-string v7, "cod_etiqueta"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 168
    const-string v7, "id_manifesto"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 169
    const-string v7, "000"

    .line 170
    .local v7, "STATUS_PENDENTE":Ljava/lang/String;
    const-string v8, "status"

    invoke-virtual {v6, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-object v8, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v9, "bf_etiqueta"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10, v6}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 175
    .end local v6    # "values":Landroid/content/ContentValues;
    .end local v7    # "STATUS_PENDENTE":Ljava/lang/String;
    :cond_0
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 176
    add-long/2addr v0, v4

    .line 177
    .end local v2    # "query":Ljava/lang/String;
    .end local v3    # "cursor":Landroid/database/Cursor;
    goto :goto_0

    .line 178
    :cond_1
    return-void
.end method

.method static synthetic lambda$validateRange$0(Landroid/content/Context;J)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "finalCodigo"    # J

    .line 147
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 148
    const-string v1, "Erro"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Etiqueta "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " j\u00e1 est\u00e1 em outro manifesto."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 149
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 150
    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 151
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 147
    return-void
.end method

.method public static onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p1, "oldVersion"    # I

    .line 42
    const/16 v0, 0x8

    if-ge p1, v0, :cond_0

    .line 43
    invoke-static {p0}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 45
    :cond_0
    return-void
.end method

.method private validateRange(IJJLandroid/content/Context;)Z
    .locals 6
    .param p1, "idManifesto"    # I
    .param p2, "qtd"    # J
    .param p4, "primeiroCodigo"    # J
    .param p6, "context"    # Landroid/content/Context;

    .line 143
    move-wide v0, p4

    .line 144
    .local v0, "ultimoCodigo":J
    :goto_0
    add-long v2, p4, p2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    .line 145
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->verificarEtiquetaEmOutroManifesto(Ljava/lang/String;Ljava/lang/Integer;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 146
    move-wide v2, v0

    .line 147
    .local v2, "finalCodigo":J
    new-instance v4, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v5, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager$$ExternalSyntheticLambda0;

    invoke-direct {v5, p6, v2, v3}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;J)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 152
    const/4 v4, 0x0

    return v4

    .line 154
    .end local v2    # "finalCodigo":J
    :cond_0
    add-long/2addr v0, v4

    goto :goto_0

    .line 156
    :cond_1
    const/4 v2, 0x1

    return v2
.end method


# virtual methods
.method public buscaUltimaEtiqueta(II)Ljava/lang/Long;
    .locals 5
    .param p1, "idManifesto"    # I
    .param p2, "idColetaLogradouro"    # I

    .line 207
    const-string v0, "SELECT MAX(CAST(bf_etiqueta.cod_etiqueta AS LONG)) AS ultima FROM bf_etiqueta JOIN bf_coleta ON bf_etiqueta.cod_etiqueta = bf_coleta.cod_etiqueta WHERE bf_etiqueta.id_manifesto = ? AND bf_coleta.id_coleta_logradouro = ? "

    .line 215
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 216
    .local v1, "cursor":Landroid/database/Cursor;
    const-wide/16 v2, 0x0

    .line 217
    .local v2, "codEtiqueta":J
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 218
    const-string v4, "ultima"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 220
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 221
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    return-object v4
.end method

.method public buscarIntervaloEtiquetas(I)Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;
    .locals 8
    .param p1, "idManifesto"    # I

    .line 190
    const-string v0, "SELECT MIN(CAST(cod_etiqueta AS LONG)) AS primeira, MAX(CAST(cod_etiqueta AS LONG)) AS ultima FROM bf_etiqueta WHERE id_manifesto = ?"

    .line 194
    .local v0, "query":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 196
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v2, 0x0

    .line 197
    .local v2, "intervalo":Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 198
    const-string v3, "primeira"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 199
    .local v3, "primeira":J
    const-string v5, "ultima"

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    .line 200
    .local v5, "ultima":J
    new-instance v7, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-direct {v7, v3, v4, v5, v6}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;-><init>(JJ)V

    move-object v2, v7

    .line 202
    .end local v3    # "primeira":J
    .end local v5    # "ultima":J
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 203
    return-object v2
.end method

.method public deleteAllManifesto(Ljava/lang/Integer;)V
    .locals 4
    .param p1, "idManifesto"    # Ljava/lang/Integer;

    .line 229
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "bf_etiqueta"

    const-string v3, "id_manifesto = ?"

    invoke-virtual {v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 230
    return-void
.end method

.method public deleteEtiqueta(Ljava/lang/Integer;)V
    .locals 4
    .param p1, "idEtiqueta"    # Ljava/lang/Integer;

    .line 225
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "bf_etiqueta"

    const-string v3, "id = ?"

    invoke-virtual {v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 226
    return-void
.end method

.method public executeRangeInsert(IJJLandroid/content/Context;)Z
    .locals 1
    .param p1, "idManifesto"    # I
    .param p2, "qtd"    # J
    .param p4, "primeiroCodigo"    # J
    .param p6, "context"    # Landroid/content/Context;

    .line 181
    invoke-direct/range {p0 .. p6}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->validateRange(IJJLandroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    invoke-direct/range {p0 .. p5}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->insertRange(IJJ)V

    .line 183
    const/4 v0, 0x1

    return v0

    .line 185
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Etiqueta;)V
    .locals 4
    .param p1, "etiqueta"    # Lcom/coleta/ambientuus/dto/Etiqueta;

    .line 133
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 134
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "id_etiqueta"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getId_etiqueta()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 135
    const-string v1, "cod_etiqueta"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    const-string v1, "id_manifesto"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getId_manifesto()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 137
    const-string v1, "status"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_etiqueta"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 140
    return-void
.end method

.method public retornaManifestoEtiqueta(Ljava/lang/String;)Lcom/coleta/ambientuus/dto/Manifesto;
    .locals 10
    .param p1, "codEtique"    # Ljava/lang/String;

    .line 87
    const-string v0, "SELECT M.id_manifesto, M.numero_manifesto, M.data_coleta, M.gerador, M.id_rota, M.id_pessoa FROM bf_etiqueta E, bf_manifesto M WHERE E.id_manifesto = M.id_manifesto AND E.cod_etiqueta = ?"

    .line 98
    .local v0, "selectQuery":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 99
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 101
    new-instance v3, Lcom/coleta/ambientuus/dto/Manifesto;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 102
    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 103
    const/4 v2, 0x2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 104
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 105
    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 106
    const/4 v2, 0x5

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-direct/range {v3 .. v9}, Lcom/coleta/ambientuus/dto/Manifesto;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 107
    .local v3, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 108
    return-object v3

    .line 111
    .end local v3    # "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 112
    const/4 v2, 0x0

    return-object v2
.end method

.method public selectEtiquetaManifesto(Ljava/lang/Integer;)Ljava/util/ArrayList;
    .locals 8
    .param p1, "idManifesto"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;"
        }
    .end annotation

    .line 48
    const-string v0, "SELECT id, cod_etiqueta, id_manifesto, status FROM bf_etiqueta WHERE id_manifesto = ?"

    .line 54
    .local v0, "selectQuery":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .local v1, "etiquetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 57
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 59
    :cond_0
    new-instance v3, Lcom/coleta/ambientuus/dto/Etiqueta;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 60
    const/4 v5, 0x1

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 61
    const/4 v6, 0x2

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 62
    const/4 v7, 0x3

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/coleta/ambientuus/dto/Etiqueta;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V

    .line 63
    .local v3, "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .end local v3    # "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 66
    :cond_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 67
    return-object v1
.end method

.method public verificarEtiquetaEmOutroManifesto(Ljava/lang/String;Ljava/lang/Integer;)Z
    .locals 3
    .param p1, "codEtique"    # Ljava/lang/String;
    .param p2, "idManifesto"    # Ljava/lang/Integer;

    .line 71
    const-string v0, "SELECT 1 FROM bf_etiqueta WHERE cod_etiqueta = ? AND id_manifesto != ?"

    .line 74
    .local v0, "selectQuery":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {p1, v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 75
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 77
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 78
    const/4 v2, 0x1

    return v2

    .line 81
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 82
    const/4 v2, 0x0

    return v2
.end method

.method public verificarEtiquetaNoManifesto(Ljava/lang/String;Ljava/lang/Integer;)Z
    .locals 3
    .param p1, "codEtique"    # Ljava/lang/String;
    .param p2, "idManifesto"    # Ljava/lang/Integer;

    .line 117
    const-string v0, "SELECT 1 FROM bf_etiqueta WHERE cod_etiqueta = ? AND id_manifesto = ?"

    .line 120
    .local v0, "selectQuery":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {p1, v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 121
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 123
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 124
    const/4 v2, 0x1

    return v2

    .line 127
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 128
    const/4 v2, 0x0

    return v2
.end method
