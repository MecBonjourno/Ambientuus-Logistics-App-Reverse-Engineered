.class public Lcom/coleta/ambientuus/dto/list/BombonaList;
.super Ljava/lang/Object;
.source "BombonaList.java"


# instance fields
.field private BOMBONAS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Bombona;",
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
            "Lcom/coleta/ambientuus/dto/Bombona;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 12
    .local p1, "bfBombonas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Bombona;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/BombonaList;->BOMBONAS:Ljava/util/List;

    .line 14
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/list/BombonaList;->MSG:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public getBfBombonas()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Bombona;",
            ">;"
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/BombonaList;->BOMBONAS:Ljava/util/List;

    return-object v0
.end method

.method public getMSG()Ljava/lang/String;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/BombonaList;->MSG:Ljava/lang/String;

    return-object v0
.end method

.method public setBfBombonas(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Bombona;",
            ">;)V"
        }
    .end annotation

    .line 26
    .local p1, "bfBombonas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Bombona;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/BombonaList;->BOMBONAS:Ljava/util/List;

    .line 27
    return-void
.end method

.method public setMSG(Ljava/lang/String;)V
    .locals 0
    .param p1, "MSG"    # Ljava/lang/String;

    .line 30
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/BombonaList;->MSG:Ljava/lang/String;

    .line 31
    return-void
.end method
