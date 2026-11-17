.class public Lcom/coleta/ambientuus/dto/list/VolumeList;
.super Ljava/lang/Object;
.source "VolumeList.java"


# instance fields
.field private MSG:Ljava/lang/String;

.field private VOLUMES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Volume;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .param p2, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Volume;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 16
    .local p1, "volume":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Volume;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/VolumeList;->VOLUMES:Ljava/util/List;

    .line 18
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/list/VolumeList;->MSG:Ljava/lang/String;

    .line 19
    return-void
.end method


# virtual methods
.method public getMSG()Ljava/lang/String;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/VolumeList;->MSG:Ljava/lang/String;

    return-object v0
.end method

.method public getVOLUMES()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Volume;",
            ">;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/VolumeList;->VOLUMES:Ljava/util/List;

    return-object v0
.end method

.method public setMSG(Ljava/lang/String;)V
    .locals 0
    .param p1, "mSG"    # Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/VolumeList;->MSG:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setVOLUMES(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Volume;",
            ">;)V"
        }
    .end annotation

    .line 25
    .local p1, "vOLUMES":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Volume;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/list/VolumeList;->VOLUMES:Ljava/util/List;

    .line 26
    return-void
.end method
