.class public Lcom/coleta/ambientuus/database/managers/RotaTableManager;
.super Ljava/lang/Object;
.source "RotaTableManager.java"


# static fields
.field public static final COL_DESCRICAO:Ljava/lang/String; = "descricao"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_FROTA_VEICULO:Ljava/lang/String; = "id_frota_veiculo"

.field public static final COL_ID_MOTORISTA:Ljava/lang/String; = "id_motorista"

.field public static final COL_ID_ROTA:Ljava/lang/String; = "id_rota"

.field public static final COL_ORDEM:Ljava/lang/String; = "ordem"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_rota"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/RotaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 25
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 28
    const-string v0, "CREATE TABLE bf_rota (id INTEGER PRIMARY KEY AUTOINCREMENT, id_rota TEXT, descricao TEXT, id_motorista TEXT, id_frota_veiculo INTEGER, ordem TEXT)"

    .line 35
    .local v0, "createTable":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 65
    const-string v0, "bf_rota"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 66
    return-void
.end method


# virtual methods
.method public getAllRotasDia(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "Dia"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Rota;",
            ">;"
        }
    .end annotation

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .local v0, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Rota;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT  * FROM bf_rota WHERE ordem = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ORDER BY "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "descricao"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ASC "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "selectQuery":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/database/managers/RotaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 45
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 47
    :cond_0
    new-instance v3, Lcom/coleta/ambientuus/dto/Rota;

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/coleta/ambientuus/dto/Rota;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 50
    :cond_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 51
    return-object v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Rota;)V
    .locals 4
    .param p1, "rota"    # Lcom/coleta/ambientuus/dto/Rota;

    .line 55
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 56
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "id_rota"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Rota;->getId_rota()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string v1, "descricao"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Rota;->getDescricao()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const-string v1, "id_motorista"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Rota;->getId_motorista()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    const-string v1, "id_frota_veiculo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Rota;->getId_frota_veiculo()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 60
    const-string v1, "ordem"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Rota;->getOrdem()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/RotaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_rota"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 62
    return-void
.end method
