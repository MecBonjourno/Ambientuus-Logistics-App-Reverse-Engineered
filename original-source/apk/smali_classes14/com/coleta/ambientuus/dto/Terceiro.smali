.class public Lcom/coleta/ambientuus/dto/Terceiro;
.super Ljava/lang/Object;
.source "Terceiro.java"


# instance fields
.field private cod_pessoa:Ljava/lang/String;

.field private id_pessoa:Ljava/lang/String;

.field private razao_social:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "id_pessoa"    # Ljava/lang/String;
    .param p2, "razao_social"    # Ljava/lang/String;

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Terceiro;->id_pessoa:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Terceiro;->razao_social:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 47
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 48
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 49
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/coleta/ambientuus/dto/Terceiro;

    .line 50
    .local v2, "that":Lcom/coleta/ambientuus/dto/Terceiro;
    iget-object v3, p0, Lcom/coleta/ambientuus/dto/Terceiro;->id_pessoa:Ljava/lang/String;

    iget-object v4, v2, Lcom/coleta/ambientuus/dto/Terceiro;->id_pessoa:Ljava/lang/String;

    invoke-static {v3, v4}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/coleta/ambientuus/dto/Terceiro;->razao_social:Ljava/lang/String;

    iget-object v4, v2, Lcom/coleta/ambientuus/dto/Terceiro;->razao_social:Ljava/lang/String;

    .line 51
    invoke-static {v3, v4}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    .line 50
    :goto_0
    return v0

    .line 48
    .end local v2    # "that":Lcom/coleta/ambientuus/dto/Terceiro;
    :cond_3
    :goto_1
    return v1
.end method

.method public getCod_Pessoa()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Terceiro;->cod_pessoa:Ljava/lang/String;

    return-object v0
.end method

.method public getId_Pessoa()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Terceiro;->id_pessoa:Ljava/lang/String;

    return-object v0
.end method

.method public getRazao_Social()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Terceiro;->razao_social:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 56
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Terceiro;->id_pessoa:Ljava/lang/String;

    iget-object v1, p0, Lcom/coleta/ambientuus/dto/Terceiro;->razao_social:Ljava/lang/String;

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

.method public setCod_Pessoa(Ljava/lang/String;)V
    .locals 0
    .param p1, "cod_pessoa"    # Ljava/lang/String;

    .line 29
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Terceiro;->cod_pessoa:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setId_Pessoa(Ljava/lang/String;)V
    .locals 0
    .param p1, "id_pessoa"    # Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Terceiro;->id_pessoa:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setRazao_Social(Ljava/lang/String;)V
    .locals 0
    .param p1, "razao_social"    # Ljava/lang/String;

    .line 37
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Terceiro;->razao_social:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Terceiro;->razao_social:Ljava/lang/String;

    return-object v0
.end method
