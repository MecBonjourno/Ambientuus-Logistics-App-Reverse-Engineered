.class public Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "EtiquetaManifestoAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;,
        Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;",
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

.field private listener:Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;


# direct methods
.method public static synthetic $r8$lambda$jMsh22kp1w34YrQKxfrHocHEuvE(Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;Lcom/coleta/ambientuus/dto/Etiqueta;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;->lambda$onBindViewHolder$0(Lcom/coleta/ambientuus/dto/Etiqueta;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;)V
    .locals 0
    .param p2, "listener"    # Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;",
            "Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;",
            ")V"
        }
    .end annotation

    .line 25
    .local p1, "etiquetas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;->etiquetas:Ljava/util/List;

    .line 27
    iput-object p2, p0, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;->listener:Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;

    .line 28
    return-void
.end method

.method private synthetic lambda$onBindViewHolder$0(Lcom/coleta/ambientuus/dto/Etiqueta;Landroid/view/View;)V
    .locals 2
    .param p1, "etiqueta"    # Lcom/coleta/ambientuus/dto/Etiqueta;
    .param p2, "v"    # Landroid/view/View;

    .line 54
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;->listener:Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;->onClick(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 19
    check-cast p1, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;->onBindViewHolder(Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;
    .param p2, "position"    # I

    .line 52
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/Etiqueta;

    .line 53
    .local v0, "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    iget-object v1, p1, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;->tvEtiqueta:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    iget-object v1, p1, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;->tvEtiqueta:Landroid/widget/TextView;

    new-instance v2, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;Lcom/coleta/ambientuus/dto/Etiqueta;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 45
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$layout;->item_etiqueta:I

    .line 46
    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 47
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method
