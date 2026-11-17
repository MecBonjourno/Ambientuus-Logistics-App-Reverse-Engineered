.class public Lcom/coleta/ambientuus/dto/Etiqueta;
.super Ljava/lang/Object;
.source "Etiqueta.java"


# instance fields
.field private cod_etiqueta:Ljava/lang/String;

.field private id_etiqueta:Ljava/lang/Integer;

.field private id_manifesto:Ljava/lang/Integer;

.field private status:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 0
    .param p1, "idEtiqueta"    # Ljava/lang/Integer;
    .param p2, "codEtiqueta"    # Ljava/lang/String;
    .param p3, "idManifesto"    # Ljava/lang/Integer;
    .param p4, "status"    # Ljava/lang/String;

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/coleta/ambientuus/dto/Etiqueta;->id_etiqueta:Ljava/lang/Integer;

    .line 11
    iput-object p2, p0, Lcom/coleta/ambientuus/dto/Etiqueta;->cod_etiqueta:Ljava/lang/String;

    .line 12
    iput-object p3, p0, Lcom/coleta/ambientuus/dto/Etiqueta;->id_manifesto:Ljava/lang/Integer;

    .line 13
    iput-object p4, p0, Lcom/coleta/ambientuus/dto/Etiqueta;->status:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public getCod_etiqueta()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Etiqueta;->cod_etiqueta:Ljava/lang/String;

    return-object v0
.end method

.method public getId_etiqueta()Ljava/lang/Integer;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Etiqueta;->id_etiqueta:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId_manifesto()Ljava/lang/Integer;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Etiqueta;->id_manifesto:Ljava/lang/Integer;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/coleta/ambientuus/dto/Etiqueta;->status:Ljava/lang/String;

    return-object v0
.end method
