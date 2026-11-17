.class public Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "BaixaBombonaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private arrayBombonasBaixadas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 21
    .local p1, "arrayBombonasBaixadas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter;->arrayBombonasBaixadas:Ljava/util/ArrayList;

    .line 23
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter;->arrayBombonasBaixadas:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 17
    check-cast p1, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter;->onBindViewHolder(Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;
    .param p2, "position"    # I

    .line 36
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter;->arrayBombonasBaixadas:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter;->arrayBombonasBaixadas:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p1, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;->tvBombonasBaixadas:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter;->arrayBombonasBaixadas:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    :cond_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 28
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 29
    .local v0, "layoutInflater":Landroid/view/LayoutInflater;
    sget v1, Lcom/coleta/ambientuus/R$layout;->activity_baixa_bombona_row:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 30
    .local v1, "listItem":Landroid/view/View;
    new-instance v2, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;

    invoke-direct {v2, v1}, Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    .line 31
    .local v2, "viewHolder":Lcom/coleta/ambientuus/adapters/BaixaBombonaAdapter$ViewHolder;
    return-object v2
.end method
