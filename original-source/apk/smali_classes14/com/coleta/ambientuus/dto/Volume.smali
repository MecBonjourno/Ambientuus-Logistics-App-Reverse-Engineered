.class public Lcom/coleta/ambientuus/dto/Volume;
.super Ljava/lang/Object;
.source "Volume.java"


# instance fields
.field private descricao:Ljava/lang/String;

.field private id_volume:Ljava/lang/String;

.field private tara:Ljava/lang/Float;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Float;)V
    .locals 0
    .param p1, "id_volume"    # Ljava/lang/String;
    .param p2, "descricao"    # Ljava/lang/String;
    .param p3, "peso_liquido"    # Ljava/lang/Float;

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Volume;->id_volume:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Volume;->descricao:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Volume;->tara:Ljava/lang/Float;

    .line 15
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 46
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 47
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 48
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/coleta/ambientuus/dto/Volume;

    .line 49
    .local v2, "volume":Lcom/coleta/ambientuus/dto/Volume;
    iget-object v3, p0, Lcom/coleta/ambientuus/dto/Volume;->id_volume:Ljava/lang/String;

    iget-object v4, v2, Lcom/coleta/ambientuus/dto/Volume;->id_volume:Ljava/lang/String;

    invoke-static {v3, v4}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/coleta/ambientuus/dto/Volume;->descricao:Ljava/lang/String;

    iget-object v4, v2, Lcom/coleta/ambientuus/dto/Volume;->descricao:Ljava/lang/String;

    .line 50
    invoke-static {v3, v4}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/coleta/ambientuus/dto/Volume;->tara:Ljava/lang/Float;

    iget-object v4, v2, Lcom/coleta/ambientuus/dto/Volume;->tara:Ljava/lang/Float;

    .line 51
    invoke-static {v3, v4}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    .line 49
    :goto_0
    return v0

    .line 47
    .end local v2    # "volume":Lcom/coleta/ambientuus/dto/Volume;
    :cond_3
    :goto_1
    return v1
.end method

.method public getDescricao()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Volume;->descricao:Ljava/lang/String;

    return-object v0
.end method

.method public getId_volume()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Volume;->id_volume:Ljava/lang/String;

    return-object v0
.end method

.method public getTara()Ljava/lang/Float;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Volume;->tara:Ljava/lang/Float;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 56
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Volume;->id_volume:Ljava/lang/String;

    iget-object v1, p0, Lcom/coleta/ambientuus/dto/Volume;->descricao:Ljava/lang/String;

    iget-object v2, p0, Lcom/coleta/ambientuus/dto/Volume;->tara:Ljava/lang/Float;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Lj$/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public setDescricao(Ljava/lang/String;)V
    .locals 0
    .param p1, "descricao"    # Ljava/lang/String;

    .line 27
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Volume;->descricao:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setId_volume(Ljava/lang/String;)V
    .locals 0
    .param p1, "id_volume"    # Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Volume;->id_volume:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setTara(Ljava/lang/Float;)V
    .locals 0
    .param p1, "peso_liquido"    # Ljava/lang/Float;

    .line 35
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Volume;->tara:Ljava/lang/Float;

    .line 36
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Volume;->descricao:Ljava/lang/String;

    return-object v0
.end method
