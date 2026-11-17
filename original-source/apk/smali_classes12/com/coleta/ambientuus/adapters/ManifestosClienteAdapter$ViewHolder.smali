.class public Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ManifestosClienteAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field private final llManifestoCliente:Landroid/widget/LinearLayout;

.field private final tvIdManifesto:Landroid/widget/TextView;

.field private final tvIdRota:Landroid/widget/TextView;

.field private final tvNumeroManifesto:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 39
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 41
    sget v0, Lcom/coleta/ambientuus/R$id;->tvIdManifesto:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->tvIdManifesto:Landroid/widget/TextView;

    .line 42
    sget v0, Lcom/coleta/ambientuus/R$id;->tvNumeroManifesto:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->tvNumeroManifesto:Landroid/widget/TextView;

    .line 43
    sget v0, Lcom/coleta/ambientuus/R$id;->tvIdRota:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->tvIdRota:Landroid/widget/TextView;

    .line 44
    sget v0, Lcom/coleta/ambientuus/R$id;->llManifestoCliente:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->llManifestoCliente:Landroid/widget/LinearLayout;

    .line 45
    return-void
.end method


# virtual methods
.method public getLlManifestoCliente()Landroid/widget/LinearLayout;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->llManifestoCliente:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public getTvIdManifesto()Landroid/widget/TextView;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->tvIdManifesto:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTvIdRota()Landroid/widget/TextView;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->tvIdRota:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTvNumeroManifesto()Landroid/widget/TextView;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->tvNumeroManifesto:Landroid/widget/TextView;

    return-object v0
.end method
