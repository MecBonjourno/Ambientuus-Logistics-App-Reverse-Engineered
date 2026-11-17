.class public Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "ManifestosClienteAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;,
        Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private listener:Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;

.field private final manifestos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$f_e80ytQK8dbKwDyypk7j6up7y4(Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;Lcom/coleta/ambientuus/dto/Manifesto;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;->lambda$onBindViewHolder$0(Lcom/coleta/ambientuus/dto/Manifesto;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;)V
    .locals 0
    .param p2, "listener"    # Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;",
            "Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;",
            ")V"
        }
    .end annotation

    .line 27
    .local p1, "manifestos":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;->manifestos:Ljava/util/List;

    .line 29
    iput-object p2, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;->listener:Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;

    .line 30
    return-void
.end method

.method private synthetic lambda$onBindViewHolder$0(Lcom/coleta/ambientuus/dto/Manifesto;Landroid/view/View;)V
    .locals 2
    .param p1, "manifesto"    # Lcom/coleta/ambientuus/dto/Manifesto;
    .param p2, "v"    # Landroid/view/View;

    .line 82
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;->listener:Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;->onClick(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;->manifestos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 18
    check-cast p1, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;->onBindViewHolder(Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;I)V
    .locals 4
    .param p1, "viewHolder"    # Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;
    .param p2, "position"    # I

    .line 76
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;->manifestos:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/Manifesto;

    .line 78
    .local v0, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->getTvIdManifesto()Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ID: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_manifesto()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->getTvNumeroManifesto()Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Manifesto: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->getTvIdRota()Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Rota: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_rota()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;->getLlManifestoCliente()Landroid/widget/LinearLayout;

    move-result-object v1

    new-instance v2, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;Lcom/coleta/ambientuus/dto/Manifesto;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;
    .locals 3
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 68
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$layout;->item_manifesto_cliente:I

    .line 69
    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 70
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method
