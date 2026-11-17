.class public Lcom/coleta/ambientuus/database/managers/TelasTableManager;
.super Ljava/lang/Object;
.source "TelasTableManager.java"


# static fields
.field public static final COL_ALOCAR_BOMBONA:Ljava/lang/String; = "ALOCAR_BOMBONA"

.field public static final COL_CARREGAR_VEICULO:Ljava/lang/String; = "CARREGAR_VEICULO"

.field public static final COL_COLETAR_BLUETOOTH:Ljava/lang/String; = "COLETAR_BLUETOOTH"

.field public static final COL_COLETAR_MANUAL:Ljava/lang/String; = "COLETAR_MANUAL"

.field public static final COL_CONSULTAR_BOMBONAS:Ljava/lang/String; = "CONSULTAR_BOMBONAS"

.field public static final COL_CONSULTAR_COLETAS:Ljava/lang/String; = "CONSULTAR_COLETAS"

.field public static final COL_CONSULTAR_MANIFESTOS:Ljava/lang/String; = "CONSULTAR_MANIFESTOS"

.field public static final COL_DESCARREGAR_VEICULO:Ljava/lang/String; = "DESCARREGAR_VEICULO"

.field public static final COL_ID:Ljava/lang/String; = "id"

.field public static final COL_LIBERAR_BOMBONA:Ljava/lang/String; = "LIBERAR_BOMBONA"

.field public static final TABLE_NAME:Ljava/lang/String; = "bf_telas"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 25
    return-void
.end method

.method public static createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 28
    const-string v0, "CREATE TABLE bf_telas (id INTEGER PRIMARY KEY AUTOINCREMENT, CARREGAR_VEICULO TEXT, ALOCAR_BOMBONA TEXT, COLETAR_BLUETOOTH TEXT, COLETAR_MANUAL TEXT, DESCARREGAR_VEICULO TEXT, LIBERAR_BOMBONA TEXT, CONSULTAR_BOMBONAS TEXT, CONSULTAR_COLETAS TEXT, CONSULTAR_MANIFESTOS TEXT) "

    .line 39
    .local v0, "createTableSQL":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public static onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V
    .locals 1
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p1, "oldVersion"    # I

    .line 43
    const/4 v0, 0x7

    if-ge p1, v0, :cond_0

    .line 44
    invoke-static {p0}, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 46
    :cond_0
    return-void
.end method


# virtual methods
.method public deleteAll()V
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "bf_telas"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 94
    return-void
.end method

.method public insert(Lcom/coleta/ambientuus/dto/Telas;)V
    .locals 4
    .param p1, "telas"    # Lcom/coleta/ambientuus/dto/Telas;

    .line 78
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 79
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "CARREGAR_VEICULO"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getCARREGAR_VEICULO()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    const-string v1, "ALOCAR_BOMBONA"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getALOCAR_BOMBONA()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const-string v1, "COLETAR_BLUETOOTH"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getCOLETAR_BLUETOOTH()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v1, "COLETAR_MANUAL"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getCOLETAR_MANUAL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v1, "DESCARREGAR_VEICULO"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getDESCARREGAR_VEICULO()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const-string v1, "LIBERAR_BOMBONA"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getLIBERAR_BOMBONA()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    const-string v1, "CONSULTAR_BOMBONAS"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getCONSULTAR_BOMBONAS()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const-string v1, "CONSULTAR_COLETAS"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getCONSULTAR_COLETAS()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const-string v1, "CONSULTAR_MANIFESTOS"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Telas;->getCONSULTAR_MANIFESTOS()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bf_telas"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 90
    return-void
.end method

.method public selectTelas()Lcom/coleta/ambientuus/dto/Telas;
    .locals 14

    .line 49
    const-string v0, "SELECT CARREGAR_VEICULO, ALOCAR_BOMBONA, COLETAR_BLUETOOTH, COLETAR_MANUAL, DESCARREGAR_VEICULO, LIBERAR_BOMBONA, CONSULTAR_BOMBONAS, CONSULTAR_COLETAS, CONSULTAR_MANIFESTOS FROM bf_telas"

    .line 60
    .local v0, "selectQuery":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 61
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v2, 0x0

    .line 62
    .local v2, "telas":Lcom/coleta/ambientuus/dto/Telas;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 63
    new-instance v4, Lcom/coleta/ambientuus/dto/Telas;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 64
    const/4 v3, 0x1

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 65
    const/4 v3, 0x2

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 66
    const/4 v3, 0x3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 67
    const/4 v3, 0x4

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 68
    const/4 v3, 0x5

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 69
    const/4 v3, 0x6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 70
    const/4 v3, 0x7

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 71
    const/16 v3, 0x8

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-direct/range {v4 .. v13}, Lcom/coleta/ambientuus/dto/Telas;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v4

    .line 74
    :cond_0
    return-object v2
.end method
