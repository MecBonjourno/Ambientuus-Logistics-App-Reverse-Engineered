.class public Lcom/coleta/ambientuus/dto/Manifesto;
.super Ljava/lang/Object;
.source "Manifesto.java"


# instance fields
.field private data_coleta:Ljava/lang/String;

.field private gerador:Ljava/lang/String;

.field private id_manifesto:Ljava/lang/Integer;

.field private id_pessoa:Ljava/lang/Integer;

.field private id_rota:Ljava/lang/Integer;

.field private numero_manifesto:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id_manifesto"    # Ljava/lang/Integer;
    .param p2, "numero_manifesto"    # Ljava/lang/String;
    .param p3, "data_coleta"    # Ljava/lang/String;
    .param p4, "gerador"    # Ljava/lang/String;
    .param p5, "id_rota"    # Ljava/lang/Integer;
    .param p6, "id_pessoa"    # Ljava/lang/Integer;

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Manifesto;->id_manifesto:Ljava/lang/Integer;

    .line 19
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Manifesto;->numero_manifesto:Ljava/lang/String;

    .line 20
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Manifesto;->data_coleta:Ljava/lang/String;

    .line 21
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/Manifesto;->gerador:Ljava/lang/String;

    .line 22
    iput-object p5, p0, Lcom/coleta/ambientuus/dto/Manifesto;->id_rota:Ljava/lang/Integer;

    .line 23
    iput-object p6, p0, Lcom/coleta/ambientuus/dto/Manifesto;->id_pessoa:Ljava/lang/Integer;

    .line 24
    return-void
.end method


# virtual methods
.method public contemTexto(Ljava/lang/String;)Z
    .locals 1
    .param p1, "texto"    # Ljava/lang/String;

    .line 48
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 49
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->id_manifesto:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->numero_manifesto:Ljava/lang/String;

    .line 50
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->data_coleta:Ljava/lang/String;

    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->gerador:Ljava/lang/String;

    .line 52
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->id_rota:Ljava/lang/Integer;

    .line 53
    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 49
    :goto_1
    return v0
.end method

.method public getData_coleta()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->data_coleta:Ljava/lang/String;

    return-object v0
.end method

.method public getGerador()Ljava/lang/String;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->gerador:Ljava/lang/String;

    return-object v0
.end method

.method public getId_manifesto()Ljava/lang/Integer;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->id_manifesto:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_pessoa()Ljava/lang/Integer;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->id_pessoa:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_rota()Ljava/lang/Integer;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->id_rota:Ljava/lang/Integer;

    return-object v0
.end method

.method public getNumero_manifesto()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Manifesto;->numero_manifesto:Ljava/lang/String;

    return-object v0
.end method
