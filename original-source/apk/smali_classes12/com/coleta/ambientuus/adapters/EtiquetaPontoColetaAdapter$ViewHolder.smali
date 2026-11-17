.class public Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "EtiquetaPontoColetaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field tvEtiqueta:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "itemView"    # Landroid/view/View;

    .line 29
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 30
    sget v0, Lcom/coleta/ambientuus/R$id;->tvEtiquetaPontoColeta:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;->tvEtiqueta:Landroid/widget/TextView;

    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;->context:Landroid/content/Context;

    .line 32
    return-void
.end method
