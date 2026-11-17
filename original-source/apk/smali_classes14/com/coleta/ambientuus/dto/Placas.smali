.class public Lcom/coleta/ambientuus/dto/Placas;
.super Ljava/lang/Object;
.source "Placas.java"


# instance fields
.field private id_frota_veiculo:Ljava/lang/Integer;

.field private placa_veiculo:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 0
    .param p1, "id_frota_veiculo"    # Ljava/lang/Integer;
    .param p2, "placa_veiculo"    # Ljava/lang/String;

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Placas;->id_frota_veiculo:Ljava/lang/Integer;

    .line 12
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Placas;->placa_veiculo:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .line 38
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 39
    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 40
    :cond_1
    move-object v0, p1

    check-cast v0, Lcom/coleta/ambientuus/dto/Placas;

    .line 41
    .local v0, "placas":Lcom/coleta/ambientuus/dto/Placas;
    iget-object v1, p0, Lcom/coleta/ambientuus/dto/Placas;->id_frota_veiculo:Ljava/lang/Integer;

    iget-object v2, v0, Lcom/coleta/ambientuus/dto/Placas;->id_frota_veiculo:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 39
    .end local v0    # "placas":Lcom/coleta/ambientuus/dto/Placas;
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public getId_frota_veiculo()Ljava/lang/Integer;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Placas;->id_frota_veiculo:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPlaca_veiculo()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Placas;->placa_veiculo:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 46
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Placas;->id_frota_veiculo:Ljava/lang/Integer;

    iget-object v1, p0, Lcom/coleta/ambientuus/dto/Placas;->placa_veiculo:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Lj$/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public setId_frota_veiculo(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id_frota_veiculo"    # Ljava/lang/Integer;

    .line 20
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Placas;->id_frota_veiculo:Ljava/lang/Integer;

    .line 21
    return-void
.end method

.method public setPlaca_veiculo(Ljava/lang/String;)V
    .locals 0
    .param p1, "placa_veiculo"    # Ljava/lang/String;

    .line 28
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Placas;->placa_veiculo:Ljava/lang/String;

    .line 29
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Placas;->placa_veiculo:Ljava/lang/String;

    return-object v0
.end method
