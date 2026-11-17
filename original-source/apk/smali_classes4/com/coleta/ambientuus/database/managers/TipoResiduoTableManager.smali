.class public Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;
.super Ljava/lang/Object;
.source "TipoResiduoTableManager.java"


# static fields
.field public static final COL_COD_TIPO_RESIDUO:Ljava/lang/String; = "codigo"

.field public static final COL_DESCRICAO_TIPO_RESIDUO:Ljava/lang/String; = "descricao"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_TIPO_RESIDUO:Ljava/lang/String; = "id_tipo_residuo"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_tipo_residuo"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 22
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 25
    const-string v0, "CREATE TABLE bf_tipo_residuo (id INTEGER PRIMARY KEY AUTOINCREMENT, id_tipo_residuo INTEGER, codigo TEXT, descricao TEXT) "

    .line 30
    .local v0, "createTableSQL":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 70
    const-string v0, "bf_tipo_residuo"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 71
    return-void
.end method

.method public static onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p1, "oldVersion"    # I

    .line 56
    const/16 v0, 0x11

    if-ge p1, v0, :cond_0

    .line 57
    invoke-static {p0}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 59
    :cond_0
    return-void
.end method


# virtual methods
.method public getAllTipoResiduo()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/TipoResiduo;",
            ">;"
        }
    .end annotation

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .local v0, "tipoResiduos":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/TipoResiduo;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    const-string v8, "descricao"

    const-string v2, "bf_tipo_residuo"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 42
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 44
    :cond_0
    new-instance v2, Lcom/coleta/ambientuus/dto/TipoResiduo;

    const-string v3, "id"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 45
    const-string v4, "id_tipo_residuo"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 46
    const-string v5, "codigo"

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 47
    const-string v6, "descricao"

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/coleta/ambientuus/dto/TipoResiduo;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 51
    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 52
    return-object v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/TipoResiduo;)V
    .locals 4
    .param p1, "tipoResiduo"    # Lcom/coleta/ambientuus/dto/TipoResiduo;

    .line 62
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 63
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "id_tipo_residuo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId_tipo_residuo()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 64
    const-string v1, "codigo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getCodigo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const-string v1, "descricao"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getDescricao()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_tipo_residuo"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 67
    return-void
.end method
