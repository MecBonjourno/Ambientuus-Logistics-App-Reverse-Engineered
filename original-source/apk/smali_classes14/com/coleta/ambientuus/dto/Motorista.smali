.class public Lcom/coleta/ambientuus/dto/Motorista;
.super Ljava/lang/Object;
.source "Motorista.java"


# instance fields
.field private id_motorista:Ljava/lang/String;

.field private nome:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "id_motorista"    # Ljava/lang/String;
    .param p2, "nome"    # Ljava/lang/String;

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Motorista;->id_motorista:Ljava/lang/String;

    .line 9
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Motorista;->nome:Ljava/lang/String;

    .line 10
    return-void
.end method


# virtual methods
.method public getId_motorista()Ljava/lang/String;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Motorista;->id_motorista:Ljava/lang/String;

    return-object v0
.end method

.method public getNome()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Motorista;->nome:Ljava/lang/String;

    return-object v0
.end method

.method public setId_motorista(Ljava/lang/String;)V
    .locals 0
    .param p1, "id_motorista"    # Ljava/lang/String;

    .line 17
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Motorista;->id_motorista:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public setNome(Ljava/lang/String;)V
    .locals 0
    .param p1, "nome"    # Ljava/lang/String;

    .line 25
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Motorista;->nome:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Motorista;->nome:Ljava/lang/String;

    return-object v0
.end method
