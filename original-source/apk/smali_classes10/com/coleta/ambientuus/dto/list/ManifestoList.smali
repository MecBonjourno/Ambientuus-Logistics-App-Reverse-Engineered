.class public Lcom/coleta/ambientuus/dto/list/ManifestoList;
.super Ljava/lang/Object;
.source "ManifestoList.java"


# instance fields
.field private manifestos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
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
.method public getManifestos()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;"
        }
    .end annotation

    .line 11
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/list/ManifestoList;->manifestos:Ljava/util/List;

    return-object v0
.end method
