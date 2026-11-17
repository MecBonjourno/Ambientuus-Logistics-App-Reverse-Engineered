.class public Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "EtiquetaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field btnExcluir:Landroid/widget/ImageButton;

.field context:Landroid/content/Context;

.field tvEtiqueta:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "itemView"    # Landroid/view/View;

    .line 35
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 36
    sget v0, Lcom/coleta/ambientuus/R$id;->tvEtiqueta:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;->tvEtiqueta:Landroid/widget/TextView;

    .line 37
    sget v0, Lcom/coleta/ambientuus/R$id;->btnExcluir:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;->btnExcluir:Landroid/widget/ImageButton;

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;->context:Landroid/content/Context;

    .line 39
    return-void
.end method
