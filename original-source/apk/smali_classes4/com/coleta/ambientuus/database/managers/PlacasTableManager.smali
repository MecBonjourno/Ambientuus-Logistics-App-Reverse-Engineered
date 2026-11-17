.class public Lcom/coleta/ambientuus/database/managers/PlacasTableManager;
.super Ljava/lang/Object;
.source "PlacasTableManager.java"


# static fields
.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_FROTA_VEICULO:Ljava/lang/String; = "id_frota_veiculo"

.field public static final COL_PLACA_VEICULO:Ljava/lang/String; = "placa_veiculo"

.field public static final TABLE_NAME:Ljava/lang/String; = "BF_PLACAS"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 25
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 28
    const-string v0, "CREATE TABLE BF_PLACAS (id INTEGER PRIMARY KEY AUTOINCREMENT, id_frota_veiculo INTEGER, placa_veiculo TEXT)"

    .line 33
    .local v0, "createTable":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 64
    const-string v0, "BF_PLACAS"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 65
    return-void
.end method


# virtual methods
.method public getAllPlacas()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Placas;",
            ">;"
        }
    .end annotation

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .local v0, "lista":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Placas;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT id_frota_veiculo, placa_veiculo FROM BF_PLACAS"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 44
    .local v1, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 45
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 46
    .local v2, "idFrota":I
    const/4 v3, 0x1

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 47
    .local v3, "placa":Ljava/lang/String;
    new-instance v4, Lcom/coleta/ambientuus/dto/Placas;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Lcom/coleta/ambientuus/dto/Placas;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .end local v2    # "idFrota":I
    .end local v3    # "placa":Ljava/lang/String;
    goto :goto_0

    .line 50
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 51
    return-object v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Placas;)V
    .locals 4
    .param p1, "placas"    # Lcom/coleta/ambientuus/dto/Placas;

    .line 56
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 57
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string v1, "id_frota_veiculo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Placas;->getId_frota_veiculo()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 58
    const-string v1, "placa_veiculo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Placas;->getPlaca_veiculo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "BF_PLACAS"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 61
    return-void
.end method
