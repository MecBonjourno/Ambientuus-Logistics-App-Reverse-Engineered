.class public Lcom/coleta/ambientuus/database/DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DatabaseHelper.java"


# static fields
.field public static final DATABASE_NAME:Ljava/lang/String; = "bf_app_ambientus.db"

.field public static final DATABASE_VERSION:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    const/16 v0, 0x16

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/coleta/ambientuus/database/DatabaseHelper;->DATABASE_VERSION:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 28
    sget-object v0, Lcom/coleta/ambientuus/database/DatabaseHelper;->DATABASE_VERSION:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const-string v1, "bf_app_ambientus.db"

    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 29
    return-void
.end method


# virtual methods
.method public deleteDataVolumeRotaMotoristaCliente()V
    .locals 1

    .line 80
    invoke-virtual {p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 82
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 84
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/RotaTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 86
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 88
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 90
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 92
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 94
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 96
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 98
    invoke-static {v0}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->deleteAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 99
    return-void
.end method

.method public getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .line 102
    invoke-virtual {p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 34
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 36
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 38
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/RotaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 40
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/MotoristaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 42
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 44
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 46
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 48
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 50
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 52
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 54
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 56
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 58
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 60
    invoke-static {p1}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 61
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .line 66
    invoke-static {p1, p2}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V

    .line 68
    invoke-static {p1, p2}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V

    .line 70
    invoke-static {p1, p2}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V

    .line 72
    invoke-static {p1, p2}, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V

    .line 74
    invoke-static {p1, p2}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V

    .line 76
    invoke-static {p1, p2}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;I)V

    .line 77
    return-void
.end method
