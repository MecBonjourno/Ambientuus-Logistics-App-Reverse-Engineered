.class public Lcom/coleta/ambientuus/dto/Rota;
.super Ljava/lang/Object;
.source "Rota.java"


# instance fields
.field private descricao:Ljava/lang/String;

.field private id_frota_veiculo:Ljava/lang/Integer;

.field private id_motorista:Ljava/lang/String;

.field private id_rota:Ljava/lang/String;

.field private ordem:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "id_rota"    # Ljava/lang/String;
    .param p2, "descricao"    # Ljava/lang/String;
    .param p3, "id_motorista"    # Ljava/lang/String;

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Rota;->id_rota:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Rota;->descricao:Ljava/lang/String;

    .line 22
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Rota;->id_motorista:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 0
    .param p1, "id_rota"    # Ljava/lang/String;
    .param p2, "descricao"    # Ljava/lang/String;
    .param p3, "id_motorista"    # Ljava/lang/String;
    .param p4, "id_frota_veiculo"    # Ljava/lang/Integer;
    .param p5, "ordem"    # Ljava/lang/String;

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Rota;->id_rota:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Rota;->descricao:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Rota;->id_motorista:Ljava/lang/String;

    .line 15
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/Rota;->id_frota_veiculo:Ljava/lang/Integer;

    .line 16
    iput-object p5, p0, Lcom/coleta/ambientuus/dto/Rota;->ordem:Ljava/lang/String;

    .line 17
    return-void
.end method


# virtual methods
.method public getDescricao()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Rota;->descricao:Ljava/lang/String;

    return-object v0
.end method

.method public getId_frota_veiculo()Ljava/lang/Integer;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Rota;->id_frota_veiculo:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_motorista()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Rota;->id_motorista:Ljava/lang/String;

    return-object v0
.end method

.method public getId_rota()Ljava/lang/String;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Rota;->id_rota:Ljava/lang/String;

    return-object v0
.end method

.method public getOrdem()Ljava/lang/String;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Rota;->ordem:Ljava/lang/String;

    return-object v0
.end method

.method public setDescricao(Ljava/lang/String;)V
    .locals 0
    .param p1, "descricao"    # Ljava/lang/String;

    .line 38
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Rota;->descricao:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public setId_frota_veiculo(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id_frota_veiculo"    # Ljava/lang/Integer;

    .line 54
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Rota;->id_frota_veiculo:Ljava/lang/Integer;

    .line 55
    return-void
.end method

.method public setId_motorista(Ljava/lang/String;)V
    .locals 0
    .param p1, "id_motorista"    # Ljava/lang/String;

    .line 46
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Rota;->id_motorista:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setId_rota(Ljava/lang/String;)V
    .locals 0
    .param p1, "id_rota"    # Ljava/lang/String;

    .line 30
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Rota;->id_rota:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public setOrdem(Ljava/lang/String;)V
    .locals 0
    .param p1, "ordem"    # Ljava/lang/String;

    .line 62
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Rota;->ordem:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Rota;->descricao:Ljava/lang/String;

    return-object v0
.end method
