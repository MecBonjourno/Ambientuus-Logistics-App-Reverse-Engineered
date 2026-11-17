.class public Lcom/coleta/ambientuus/database/managers/VolumeTableManager;
.super Ljava/lang/Object;
.source "VolumeTableManager.java"


# static fields
.field public static final COL_DESCRICAO:Ljava/lang/String; = "descricao"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_VOLUME:Ljava/lang/String; = "id_volume"

.field public static final COL_TARA:Ljava/lang/String; = "tara"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_volume"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 22
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 25
    const-string v0, "CREATE TABLE bf_volume (id INTEGER PRIMARY KEY AUTOINCREMENT, id_volume TEXT, descricao TEXT, tara REAL)"

    .line 30
    .local v0, "createTableSQL":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 58
    const-string v0, "bf_volume"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 59
    return-void
.end method


# virtual methods
.method public getAllVolumes()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Volume;",
            ">;"
        }
    .end annotation

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .local v0, "volumes":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Volume;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v2, "bf_volume"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 37
    .local v1, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 38
    const-string v2, "id_volume"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 39
    .local v2, "idVolume":Ljava/lang/String;
    const-string v3, "descricao"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 40
    .local v3, "descricao":Ljava/lang/String;
    new-instance v4, Lcom/coleta/ambientuus/dto/Volume;

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-direct {v4, v2, v3, v5}, Lcom/coleta/ambientuus/dto/Volume;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Float;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .end local v2    # "idVolume":Ljava/lang/String;
    .end local v3    # "descricao":Ljava/lang/String;
    goto :goto_0

    .line 43
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 44
    return-object v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Volume;)V
    .locals 4
    .param p1, "volume"    # Lcom/coleta/ambientuus/dto/Volume;

    .line 49
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 50
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "id_volume"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Volume;->getId_volume()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    const-string v1, "descricao"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Volume;->getDescricao()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    const-string v1, "tara"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Volume;->getTara()Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    .line 54
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_volume"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 55
    return-void
.end method
