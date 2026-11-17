.class public Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;
.super Ljava/lang/Object;
.source "ManifestoTableManager.java"


# static fields
.field public static final COL_DATA_COLETA:Ljava/lang/String; = "data_coleta"

.field public static final COL_GERADOR:Ljava/lang/String; = "gerador"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_MANIFESTO:Ljava/lang/String; = "id_manifesto"

.field public static final COL_ID_PESSOA:Ljava/lang/String; = "id_pessoa"

.field public static final COL_ID_ROTA:Ljava/lang/String; = "id_rota"

.field public static final COL_NUMERO_MANIFESTO:Ljava/lang/String; = "numero_manifesto"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_manifesto"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 24
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 27
    const-string v0, "CREATE TABLE bf_manifesto (id INTEGER PRIMARY KEY AUTOINCREMENT, id_manifesto INTEGER, numero_manifesto TEXT, data_coleta TEXT, gerador TEXT, id_rota INTEGER, id_pessoa INTEGER )"

    .line 35
    .local v0, "createTableSQL":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public static onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p1, "oldVersion"    # I

    .line 39
    const/4 v0, 0x6

    if-ge p1, v0, :cond_0

    .line 40
    invoke-static {p0}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    .line 42
    :cond_0
    const/16 v0, 0xa

    if-ge p1, v0, :cond_1

    .line 43
    const-string v0, "ALTER TABLE bf_manifesto ADD COLUMN id_pessoa INTEGER "

    .line 44
    .local v0, "alterTableV8":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 47
    .end local v0    # "alterTableV8":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public deleteAll()V
    .locals 3

    .line 131
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "bf_manifesto"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 132
    return-void
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Manifesto;)V
    .locals 4
    .param p1, "manifesto"    # Lcom/coleta/ambientuus/dto/Manifesto;

    .line 119
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 120
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "id_manifesto"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_manifesto()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 121
    const-string v1, "numero_manifesto"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const-string v1, "data_coleta"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getData_coleta()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    const-string v1, "gerador"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getGerador()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    const-string v1, "id_rota"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_rota()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 125
    const-string v1, "id_pessoa"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_pessoa()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 127
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_manifesto"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 128
    return-void
.end method

.method public selectManifestoCod(Ljava/lang/String;)Lcom/coleta/ambientuus/dto/Manifesto;
    .locals 13
    .param p1, "codManifesto"    # Ljava/lang/String;

    .line 99
    const/4 v0, 0x0

    .line 100
    .local v0, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    const-string v4, "numero_manifesto = ?"

    .line 101
    .local v4, "selection":Ljava/lang/String;
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v5

    .line 102
    .local v5, "selectionArgs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v2, "bf_manifesto"

    const/4 v3, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 104
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 105
    new-instance v6, Lcom/coleta/ambientuus/dto/Manifesto;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 106
    const/4 v2, 0x2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 107
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 108
    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 109
    const/4 v2, 0x5

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 110
    const/4 v2, 0x6

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-direct/range {v6 .. v12}, Lcom/coleta/ambientuus/dto/Manifesto;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    move-object v0, v6

    .line 114
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 115
    return-object v0
.end method

.method public selectManifestos()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;"
        }
    .end annotation

    .line 50
    const-string v0, "SELECT id_manifesto, numero_manifesto, data_coleta, gerador, id_rota, id_pessoa FROM bf_manifesto"

    .line 57
    .local v0, "selectQuery":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v1, "manifestos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 60
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 62
    :cond_0
    new-instance v4, Lcom/coleta/ambientuus/dto/Manifesto;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 63
    const/4 v3, 0x1

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 64
    const/4 v3, 0x2

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 65
    const/4 v3, 0x3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 66
    const/4 v3, 0x4

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 67
    const/4 v3, 0x5

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct/range {v4 .. v10}, Lcom/coleta/ambientuus/dto/Manifesto;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 69
    .local v4, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .end local v4    # "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 72
    :cond_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 73
    return-object v1
.end method

.method public selectManifestosCliente(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 12
    .param p1, "idPessoa"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;"
        }
    .end annotation

    .line 77
    const-string v3, "id_pessoa = ?"

    .line 78
    .local v3, "selection":Ljava/lang/String;
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v4

    .line 79
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "bf_manifesto"

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 80
    .local v0, "cursor":Landroid/database/Cursor;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v1, "manifestos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 84
    :cond_0
    new-instance v5, Lcom/coleta/ambientuus/dto/Manifesto;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 85
    const/4 v2, 0x2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 86
    const/4 v2, 0x3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 87
    const/4 v2, 0x4

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 88
    const/4 v2, 0x5

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 89
    const/4 v2, 0x6

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct/range {v5 .. v11}, Lcom/coleta/ambientuus/dto/Manifesto;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 91
    .local v5, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .end local v5    # "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 94
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 95
    return-object v1
.end method
