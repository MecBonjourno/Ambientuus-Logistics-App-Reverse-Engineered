.class public Lcom/coleta/ambientuus/dto/list/TerceiroList;
.super Ljava/lang/Object;
.source "TerceiroList.java"


# instance fields
.field private MSG:Ljava/lang/String;

.field private TERCEIROS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Terceiro;",
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
            "Lcom/coleta/ambientuus/dto/Terceiro;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 11
    .local p1, "TERCEIROS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Terceiro;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/TerceiroList;->TERCEIROS:Ljava/util/List;

    .line 13
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/list/TerceiroList;->MSG:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public getMSG()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/TerceiroList;->MSG:Ljava/lang/String;

    return-object v0
.end method

.method public getTERCEIROS()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Terceiro;",
            ">;"
        }
    .end annotation

    .line 17
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/TerceiroList;->TERCEIROS:Ljava/util/List;

    return-object v0
.end method

.method public setMSG(Ljava/lang/String;)V
    .locals 0
    .param p1, "MSG"    # Ljava/lang/String;

    .line 29
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/TerceiroList;->MSG:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setTERCEIROS(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Terceiro;",
            ">;)V"
        }
    .end annotation

    .line 21
    .local p1, "TERCEIROS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Terceiro;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/TerceiroList;->TERCEIROS:Ljava/util/List;

    .line 22
    return-void
.end method
