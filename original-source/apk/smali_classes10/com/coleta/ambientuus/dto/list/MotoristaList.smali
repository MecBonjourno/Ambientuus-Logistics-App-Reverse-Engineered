.class public Lcom/coleta/ambientuus/dto/list/MotoristaList;
.super Ljava/lang/Object;
.source "MotoristaList.java"


# instance fields
.field private MOTORISTAS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Motorista;",
            ">;"
        }
    .end annotation
.end field

.field private MSG:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .param p2, "MSG"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Motorista;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 12
    .local p1, "MOTORISTAS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Motorista;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/MotoristaList;->MOTORISTAS:Ljava/util/List;

    .line 14
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/list/MotoristaList;->MSG:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public getMOTORISTAS()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Motorista;",
            ">;"
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/MotoristaList;->MOTORISTAS:Ljava/util/List;

    return-object v0
.end method

.method public getMSG()Ljava/lang/String;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/MotoristaList;->MSG:Ljava/lang/String;

    return-object v0
.end method

.method public setMOTORISTAS(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Motorista;",
            ">;)V"
        }
    .end annotation

    .line 22
    .local p1, "MOTORISTAS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Motorista;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/MotoristaList;->MOTORISTAS:Ljava/util/List;

    .line 23
    return-void
.end method

.method public setMSG(Ljava/lang/String;)V
    .locals 0
    .param p1, "MSG"    # Ljava/lang/String;

    .line 30
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/MotoristaList;->MSG:Ljava/lang/String;

    .line 31
    return-void
.end method
