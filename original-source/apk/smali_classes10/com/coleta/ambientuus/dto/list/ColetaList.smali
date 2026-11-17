.class public Lcom/coleta/ambientuus/dto/list/ColetaList;
.super Ljava/lang/Object;
.source "ColetaList.java"


# instance fields
.field private COLETAS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCOLETAS()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation

    .line 11
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/ColetaList;->COLETAS:Ljava/util/List;

    return-object v0
.end method

.method public setCOLETA(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;)V"
        }
    .end annotation

    .line 14
    .local p1, "COLETAS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/ColetaList;->COLETAS:Ljava/util/List;

    .line 15
    return-void
.end method
