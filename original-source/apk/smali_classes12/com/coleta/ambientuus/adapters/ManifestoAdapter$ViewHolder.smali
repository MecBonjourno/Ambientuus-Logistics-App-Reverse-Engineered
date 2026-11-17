.class public Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ManifestoAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/adapters/ManifestoAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field private final btnEtiquetas:Landroid/widget/ImageButton;

.field private final tvDataColeta:Landroid/widget/TextView;

.field private final tvGerador:Landroid/widget/TextView;

.field private final tvIdManifesto:Landroid/widget/TextView;

.field private final tvIdRota:Landroid/widget/TextView;

.field private final tvNumeroManifesto:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 42
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 44
    sget v0, Lcom/coleta/ambientuus/R$id;->tvIdManifesto:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvIdManifesto:Landroid/widget/TextView;

    .line 45
    sget v0, Lcom/coleta/ambientuus/R$id;->tvNumeroManifesto:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvNumeroManifesto:Landroid/widget/TextView;

    .line 46
    sget v0, Lcom/coleta/ambientuus/R$id;->tvDataColeta:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvDataColeta:Landroid/widget/TextView;

    .line 47
    sget v0, Lcom/coleta/ambientuus/R$id;->tvGerador:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvGerador:Landroid/widget/TextView;

    .line 48
    sget v0, Lcom/coleta/ambientuus/R$id;->tvIdRota:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvIdRota:Landroid/widget/TextView;

    .line 49
    sget v0, Lcom/coleta/ambientuus/R$id;->btnEtiquetas:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->btnEtiquetas:Landroid/widget/ImageButton;

    .line 50
    return-void
.end method


# virtual methods
.method public getBtnEtiquetas()Landroid/widget/ImageButton;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->btnEtiquetas:Landroid/widget/ImageButton;

    return-object v0
.end method

.method public getTvDataColeta()Landroid/widget/TextView;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvDataColeta:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTvGerador()Landroid/widget/TextView;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvGerador:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTvIdManifesto()Landroid/widget/TextView;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvIdManifesto:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTvIdRota()Landroid/widget/TextView;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvIdRota:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTvNumeroManifesto()Landroid/widget/TextView;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->tvNumeroManifesto:Landroid/widget/TextView;

    return-object v0
.end method
