.class public Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;
.super Ljava/lang/Object;
.source "ClienteMTRTableManager.java"


# static fields
.field public static final COL_COD_PESSOA:Ljava/lang/String; = "cod_pessoa"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_ID_PESSOA:Ljava/lang/String; = "id_pessoa"

.field public static final COL_RAZAO_SOCIAL:Ljava/lang/String; = "razao_social"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_cliente_emite_mtr"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 24
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 28
    const-string v0, "CREATE TABLE bf_cliente_emite_mtr (id INTEGER PRIMARY KEY AUTOINCREMENT, id_pessoa TEXT, cod_pessoa TEXT, razao_social TEXT)"

    .line 33
    .local v0, "createTable":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public static deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 89
    const-string v0, "bf_cliente_emite_mtr"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 90
    return-void
.end method


# virtual methods
.method public getAllClientesMTR()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/ClienteMTR;",
            ">;"
        }
    .end annotation

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .local v0, "clientes":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/ClienteMTR;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v2, "bf_cliente_emite_mtr"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 40
    .local v1, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 41
    const-string v2, "id_pessoa"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 42
    .local v2, "idPessoa":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cod_pessoa"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 43
    const-string v4, "razao_social"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 44
    .local v3, "descricao":Ljava/lang/String;
    new-instance v4, Lcom/coleta/ambientuus/dto/ClienteMTR;

    invoke-direct {v4, v2, v3}, Lcom/coleta/ambientuus/dto/ClienteMTR;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .end local v2    # "idPessoa":Ljava/lang/String;
    .end local v3    # "descricao":Ljava/lang/String;
    goto :goto_0

    .line 47
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 48
    return-object v0
.end method

.method public getClienteMTR(Ljava/lang/Integer;)Lcom/coleta/ambientuus/dto/ClienteMTR;
    .locals 9
    .param p1, "idPessoa"    # Ljava/lang/Integer;

    .line 52
    const/4 v0, 0x0

    .line 53
    .local v0, "cliente":Lcom/coleta/ambientuus/dto/ClienteMTR;
    const-string v4, "id_pessoa = ?"

    .line 54
    .local v4, "selection":Ljava/lang/String;
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v5

    .line 55
    .local v5, "selectionArgs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v2, "bf_cliente_emite_mtr"

    const/4 v3, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 57
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 58
    new-instance v2, Lcom/coleta/ambientuus/dto/ClienteMTR;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    const/4 v7, 0x2

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x3

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v3, v6}, Lcom/coleta/ambientuus/dto/ClienteMTR;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v2

    .line 62
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 63
    return-object v0
.end method

.method public getClienteMTRCod(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 8
    .param p1, "idPessoa"    # Ljava/lang/Integer;

    .line 67
    const-string v3, "id_pessoa = ?"

    .line 68
    .local v3, "selection":Ljava/lang/String;
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v4

    .line 69
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "bf_cliente_emite_mtr"

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 70
    .local v0, "cursor":Landroid/database/Cursor;
    const-string v1, ""

    .line 72
    .local v1, "codCliente":Ljava/lang/String;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 73
    const/4 v2, 0x2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 76
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 77
    return-object v1
.end method

.method public getDb()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public insert(Lcom/coleta/ambientuus/dto/ClienteMTR;)J
    .locals 4
    .param p1, "clienteMTR"    # Lcom/coleta/ambientuus/dto/ClienteMTR;

    .line 81
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 82
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "id_pessoa"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/ClienteMTR;->getId_pessoa()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v1, "cod_pessoa"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/ClienteMTR;->getCod_pessoa()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const-string v1, "razao_social"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/ClienteMTR;->getRazao_social()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_cliente_emite_mtr"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    return-wide v1
.end method
