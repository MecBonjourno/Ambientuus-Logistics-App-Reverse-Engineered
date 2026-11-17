.class public Lcom/coleta/ambientuus/dto/Bombona;
.super Ljava/lang/Object;
.source "Bombona.java"


# instance fields
.field private final capacidade:Ljava/lang/String;

.field private cod_barras:Ljava/lang/String;

.field private id_bombona:I

.field private id_cliente:I

.field private id_terceiro:I

.field private id_volume:I

.field private status:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;ILjava/lang/String;ILjava/lang/String;I)V
    .locals 0
    .param p1, "ID_BOMBONA"    # I
    .param p2, "COD_BARRAS"    # Ljava/lang/String;
    .param p3, "ID_VOLUME"    # I
    .param p4, "STATUS"    # Ljava/lang/String;
    .param p5, "ID_CLIENTE"    # I
    .param p6, "CAPACIDADE"    # Ljava/lang/String;
    .param p7, "ID_TERCEIRO"    # I

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_bombona:I

    .line 15
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Bombona;->cod_barras:Ljava/lang/String;

    .line 16
    iput p3, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_volume:I

    .line 17
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/Bombona;->status:Ljava/lang/String;

    .line 18
    iput p5, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_cliente:I

    .line 19
    iput-object p6, p0, Lcom/coleta/ambientuus/dto/Bombona;->capacidade:Ljava/lang/String;

    .line 20
    iput p7, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_terceiro:I

    .line 21
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p1, "ID_BOMBONA"    # I
    .param p2, "COD_BARRAS"    # Ljava/lang/String;
    .param p3, "STATUS"    # Ljava/lang/String;
    .param p4, "ID_CLIENTE"    # I
    .param p5, "CAPACIDADE"    # Ljava/lang/String;

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput p1, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_bombona:I

    .line 26
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Bombona;->cod_barras:Ljava/lang/String;

    .line 27
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Bombona;->status:Ljava/lang/String;

    .line 28
    iput p4, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_cliente:I

    .line 29
    iput-object p5, p0, Lcom/coleta/ambientuus/dto/Bombona;->capacidade:Ljava/lang/String;

    .line 30
    return-void
.end method


# virtual methods
.method public getCOD_BARRAS()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Bombona;->cod_barras:Ljava/lang/String;

    return-object v0
.end method

.method public getCapacidade()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Bombona;->capacidade:Ljava/lang/String;

    return-object v0
.end method

.method public getID_BOMBONA()I
    .locals 1

    .line 33
    iget v0, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_bombona:I

    return v0
.end method

.method public getID_Cliente()I
    .locals 1

    .line 49
    iget v0, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_cliente:I

    return v0
.end method

.method public getID_VOLUME()I
    .locals 1

    .line 41
    iget v0, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_volume:I

    return v0
.end method

.method public getId_terceiro()I
    .locals 1

    .line 57
    iget v0, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_terceiro:I

    return v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Bombona;->status:Ljava/lang/String;

    return-object v0
.end method

.method public setCOD_BARRAS(Ljava/lang/String;)V
    .locals 0
    .param p1, "COD_BARRAS"    # Ljava/lang/String;

    .line 65
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Bombona;->cod_barras:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setID_BOMBONA(I)V
    .locals 0
    .param p1, "ID_BOMBONA"    # I

    .line 61
    iput p1, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_bombona:I

    .line 62
    return-void
.end method

.method public setID_VOLUME(I)V
    .locals 0
    .param p1, "ID_VOLUME"    # I

    .line 69
    iput p1, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_volume:I

    .line 70
    return-void
.end method

.method public setId_cliente(I)V
    .locals 0
    .param p1, "ID_CLIENTE"    # I

    .line 77
    iput p1, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_cliente:I

    .line 78
    return-void
.end method

.method public setId_terceiro(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "ID_TERCEIRO"    # Ljava/lang/Integer;

    .line 81
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/coleta/ambientuus/dto/Bombona;->id_terceiro:I

    .line 82
    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "STATUS"    # Ljava/lang/String;

    .line 73
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Bombona;->status:Ljava/lang/String;

    .line 74
    return-void
.end method
