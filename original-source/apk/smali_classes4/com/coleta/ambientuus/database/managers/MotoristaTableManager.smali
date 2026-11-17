.class public Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;
.super Ljava/lang/Object;
.source "MotoristaTableManager.java"


# static fields
.field private static final COL_ID:Ljava/lang/String; = "id"

.field private static final COL_ID_MOTORISTA:Ljava/lang/String; = "id_motorista"

.field private static final COL_NOME:Ljava/lang/String; = "nome"

.field private static final TABLE_NAME:Ljava/lang/String; = "bf_motorista"


# instance fields
.field private db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 22
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 25
    const-string v0, "CREATE TABLE bf_motorista (id INTEGER PRIMARY KEY AUTOINCREMENT, id_motorista TEXT, nome TEXT)"

    .line 29
    .local v0, "createTableMotoristas":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 30
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 56
    const-string v0, "bf_motorista"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 57
    return-void
.end method


# virtual methods
.method public getAllMotoristas()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Motorista;",
            ">;"
        }
    .end annotation

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .local v0, "motoristas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Motorista;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v2, "bf_motorista"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 36
    .local v1, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 37
    const-string v2, "id_motorista"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 38
    .local v2, "id":Ljava/lang/String;
    const-string v3, "nome"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 39
    .local v3, "nome":Ljava/lang/String;
    new-instance v4, Lcom/coleta/ambientuus/dto/Motorista;

    invoke-direct {v4, v2, v3}, Lcom/coleta/ambientuus/dto/Motorista;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .end local v2    # "id":Ljava/lang/String;
    .end local v3    # "nome":Ljava/lang/String;
    goto :goto_0

    .line 42
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 43
    return-object v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Motorista;)V
    .locals 4
    .param p1, "motorista"    # Lcom/coleta/ambientuus/dto/Motorista;

    .line 48
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 49
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "id_motorista"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Motorista;->getId_motorista()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    const-string v1, "nome"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Motorista;->getNome()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_motorista"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 53
    return-void
.end method
