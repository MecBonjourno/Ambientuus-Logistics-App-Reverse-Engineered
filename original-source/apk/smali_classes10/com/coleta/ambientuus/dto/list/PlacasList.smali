.class public Lcom/coleta/ambientuus/dto/list/PlacasList;
.super Ljava/lang/Object;
.source "PlacasList.java"


# instance fields
.field private MSG:Ljava/lang/String;

.field private PLACAS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Placas;",
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
            "Lcom/coleta/ambientuus/dto/Placas;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 13
    .local p1, "PLACAS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Placas;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/PlacasList;->PLACAS:Ljava/util/List;

    .line 15
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/list/PlacasList;->MSG:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public getMSG()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/PlacasList;->MSG:Ljava/lang/String;

    return-object v0
.end method

.method public getPLACAS()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Placas;",
            ">;"
        }
    .end annotation

    .line 19
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/PlacasList;->PLACAS:Ljava/util/List;

    return-object v0
.end method

.method public setMSG(Ljava/lang/String;)V
    .locals 0
    .param p1, "MSG"    # Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/PlacasList;->MSG:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setPLACAS(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Placas;",
            ">;)V"
        }
    .end annotation

    .line 23
    .local p1, "PLACAS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Placas;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/PlacasList;->PLACAS:Ljava/util/List;

    .line 24
    return-void
.end method
