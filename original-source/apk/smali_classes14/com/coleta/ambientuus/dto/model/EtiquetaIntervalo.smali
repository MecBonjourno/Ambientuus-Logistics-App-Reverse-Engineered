.class public Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;
.super Ljava/lang/Object;
.source "EtiquetaIntervalo.java"


# instance fields
.field public final primeira:J

.field public final ultima:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0
    .param p1, "primeira"    # J
    .param p3, "ultima"    # J

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->primeira:J

    iput-wide p3, p0, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->ultima:J

    return-void
.end method


# virtual methods
.method public getPrimeira()J
    .locals 2

    .line 9
    iget-wide v0, p0, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->primeira:J

    return-wide v0
.end method

.method public getUltima()J
    .locals 2

    .line 10
    iget-wide v0, p0, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->ultima:J

    return-wide v0
.end method
