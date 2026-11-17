.class public Lcom/coleta/ambientuus/adapters/TerceirosAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "TerceirosAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/adapters/TerceirosAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field public rlBombonasTerceiros:Landroid/widget/RelativeLayout;

.field public tvBombonasTerceiros:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "itemView"    # Landroid/view/View;

    .line 50
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 51
    sget v0, Lcom/coleta/ambientuus/R$id;->tvBombonasTerceiros:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/TerceirosAdapter$ViewHolder;->tvBombonasTerceiros:Landroid/widget/TextView;

    .line 52
    sget v0, Lcom/coleta/ambientuus/R$id;->rlBombonasTerceiros:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/TerceirosAdapter$ViewHolder;->rlBombonasTerceiros:Landroid/widget/RelativeLayout;

    .line 53
    return-void
.end method
