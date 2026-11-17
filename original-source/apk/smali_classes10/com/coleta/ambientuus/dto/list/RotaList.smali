.class public Lcom/coleta/ambientuus/dto/list/RotaList;
.super Ljava/lang/Object;
.source "RotaList.java"


# instance fields
.field private MSG:Ljava/lang/String;

.field private ROTAS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Rota;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .param p2, "MSG"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Rota;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 11
    .local p1, "ROTAS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Rota;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/RotaList;->ROTAS:Ljava/util/List;

    .line 13
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/list/RotaList;->MSG:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public getMSG()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/RotaList;->MSG:Ljava/lang/String;

    return-object v0
.end method

.method public getROTAS()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Rota;",
            ">;"
        }
    .end annotation

    .line 17
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/RotaList;->ROTAS:Ljava/util/List;

    return-object v0
.end method

.method public setMSG(Ljava/lang/String;)V
    .locals 0
    .param p1, "MSG"    # Ljava/lang/String;

    .line 29
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/RotaList;->MSG:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setROTAS(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Rota;",
            ">;)V"
        }
    .end annotation

    .line 21
    .local p1, "ROTAS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Rota;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/RotaList;->ROTAS:Ljava/util/List;

    .line 22
    return-void
.end method
