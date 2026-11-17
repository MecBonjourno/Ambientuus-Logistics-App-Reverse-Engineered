.class public Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "EtiquetaPontoColetaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final etiquetas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;)V"
        }
    .end annotation

    .line 20
    .local p1, "etiquetas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;->etiquetas:Ljava/util/List;

    .line 22
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 17
    check-cast p1, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;->onBindViewHolder(Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;
    .param p2, "position"    # I

    .line 45
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/Etiqueta;

    .line 46
    .local v0, "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    iget-object v1, p1, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;->tvEtiqueta:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 38
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$layout;->item_etiqueta_ponto_coleta:I

    .line 39
    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 40
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method
