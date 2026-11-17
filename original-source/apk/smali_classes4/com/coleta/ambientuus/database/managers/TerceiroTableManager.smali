.class public Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;
.super Ljava/lang/Object;
.source "TerceiroTableManager.java"


# static fields
.field public static final COL_COD_PESSOA:Ljava/lang/String; = "cod_pessoa"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_PESSOA:Ljava/lang/String; = "id_pessoa"

.field public static final COL_RAZAO_SOCIAL:Ljava/lang/String; = "razao_social"

.field public static final TABLE_NAME:Ljava/lang/String; = "BF_TERCEIROS"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 26
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 29
    const-string v0, "CREATE TABLE BF_TERCEIROS (id INTEGER PRIMARY KEY AUTOINCREMENT, id_pessoa TEXT, cod_pessoa TEXT, razao_social TEXT)"

    .line 35
    .local v0, "createTable":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 63
    const-string v0, "BF_TERCEIROS"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 64
    return-void
.end method


# virtual methods
.method public getAllTerceiros()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Terceiro;",
            ">;"
        }
    .end annotation

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .local v0, "lista":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Terceiro;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT * FROM BF_TERCEIROS"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 42
    .local v1, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 43
    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 44
    .local v2, "idPessoa":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x2

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x3

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 45
    .local v3, "descricao":Ljava/lang/String;
    new-instance v4, Lcom/coleta/ambientuus/dto/Terceiro;

    invoke-direct {v4, v2, v3}, Lcom/coleta/ambientuus/dto/Terceiro;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .end local v2    # "idPessoa":Ljava/lang/String;
    .end local v3    # "descricao":Ljava/lang/String;
    goto :goto_0

    .line 48
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 49
    return-object v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Terceiro;)V
    .locals 4
    .param p1, "terceiro"    # Lcom/coleta/ambientuus/dto/Terceiro;

    .line 54
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 55
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string v1, "id_pessoa"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Terceiro;->getId_Pessoa()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const-string v1, "cod_pessoa"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Terceiro;->getCod_Pessoa()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string v1, "razao_social"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Terceiro;->getRazao_Social()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "BF_TERCEIROS"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 60
    return-void
.end method
