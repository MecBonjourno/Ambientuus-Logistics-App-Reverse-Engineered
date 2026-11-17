.class public Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;
.super Ljava/lang/Object;
.source "MovimentoBombonaList.java"


# instance fields
.field private BOMBONAS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
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
.method public setBOMBONAS(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
            ">;)V"
        }
    .end annotation

    .line 11
    .local p1, "BOMBONAS":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;->BOMBONAS:Ljava/util/List;

    .line 12
    return-void
.end method
