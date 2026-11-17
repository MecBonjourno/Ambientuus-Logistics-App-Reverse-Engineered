.class public Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;
.source "EtiquetasManifestoFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;
    }
.end annotation


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

.field private etiquetas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;"
        }
    .end annotation
.end field

.field private listener:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

.field private rvEtiquetas:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public static synthetic $r8$lambda$K0dkrAWokBdW5UfebyB5iQdGt2s(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->lambda$onCreateView$0(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetadapter(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetetiquetas(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->etiquetas:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->listener:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetrvEtiquetas(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->rvEtiquetas:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputadapter(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    return-void
.end method

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

    .line 40
    .local p1, "etiquetas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->etiquetas:Ljava/util/List;

    .line 42
    return-void
.end method

.method private initSearchView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 68
    sget v0, Lcom/coleta/ambientuus/R$id;->etPesquisarEtiquetaMTR:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 69
    .local v0, "etPesquisarEtiqueta":Landroid/widget/EditText;
    new-instance v1, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 106
    return-void
.end method

.method private synthetic lambda$onCreateView$0(Ljava/lang/String;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/String;

    .line 54
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->listener:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->listener:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    invoke-interface {v0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;->onItemSelecionado(Ljava/lang/String;)V

    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->dismiss()V

    .line 58
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 49
    sget v0, Lcom/coleta/ambientuus/R$layout;->fragment_etiquetas_manifestos_bottom_sheet:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 51
    .local v0, "view":Landroid/view/View;
    sget v1, Lcom/coleta/ambientuus/R$id;->rvEtiquetasManifesto:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->rvEtiquetas:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->rvEtiquetas:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 53
    new-instance v1, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->etiquetas:Ljava/util/List;

    new-instance v3, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)V

    invoke-direct {v1, v2, v3}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;-><init>(Ljava/util/List;Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;)V

    iput-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    .line 59
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->rvEtiquetas:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 61
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->initSearchView(Landroid/view/View;)V

    .line 63
    return-object v0
.end method

.method public setOnItemSelecionadoListener(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    .line 36
    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->listener:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    .line 37
    return-void
.end method
