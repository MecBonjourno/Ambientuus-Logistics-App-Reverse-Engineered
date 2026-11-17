.class public Lcom/coleta/ambientuus/adapters/ManifestoAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "ManifestoAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final manifestos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$sFqpwwAjF7BPCSB4t3Xcm-DjZPA(Lcom/coleta/ambientuus/adapters/ManifestoAdapter;Lcom/coleta/ambientuus/dto/Manifesto;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;->lambda$onBindViewHolder$0(Lcom/coleta/ambientuus/dto/Manifesto;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 54
    .local p1, "manifestos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;->manifestos:Ljava/util/ArrayList;

    .line 56
    iput-object p2, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;->context:Landroid/content/Context;

    .line 57
    return-void
.end method

.method private synthetic lambda$onBindViewHolder$0(Lcom/coleta/ambientuus/dto/Manifesto;Landroid/view/View;)V
    .locals 4
    .param p1, "manifesto"    # Lcom/coleta/ambientuus/dto/Manifesto;
    .param p2, "v"    # Landroid/view/View;

    .line 78
    new-instance v0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 79
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_manifesto()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->selectEtiquetaManifesto(Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v0

    .line 80
    .local v0, "etiquetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    new-instance v1, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;

    .line 81
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_manifesto()Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;-><init>(Ljava/util/List;Ljava/lang/Integer;)V

    .line 82
    .local v1, "bottomSheet":Lcom/coleta/ambientuus/fragments/EtiquetasFragment;
    iget-object v2, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;->context:Landroid/content/Context;

    check-cast v2, Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    .line 83
    .local v2, "fm":Landroidx/fragment/app/FragmentManager;
    const-string v3, "EtiquetasBottomSheet"

    invoke-virtual {v1, v2, v3}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 84
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;->manifestos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 27
    check-cast p1, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;->onBindViewHolder(Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;I)V
    .locals 4
    .param p1, "viewHolder"    # Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;
    .param p2, "position"    # I

    .line 70
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;->manifestos:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/Manifesto;

    .line 72
    .local v0, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->getTvIdManifesto()Landroid/widget/TextView;

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

    .line 73
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->getTvNumeroManifesto()Landroid/widget/TextView;

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

    .line 74
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->getTvDataColeta()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Manifesto;->getData_coleta()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->getTvGerador()Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Gerador: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Manifesto;->getGerador()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->getTvIdRota()Landroid/widget/TextView;

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

    .line 77
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;->getBtnEtiquetas()Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/adapters/ManifestoAdapter;Lcom/coleta/ambientuus/dto/Manifesto;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;
    .locals 3
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 62
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$layout;->list_manifesto_row:I

    .line 63
    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 64
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method
