.class public Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;
.source "ManifestosClienteFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;
    }
.end annotation


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

.field private listener:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

.field private manifestos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;"
        }
    .end annotation
.end field

.field private rvManifestosCliente:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public static synthetic $r8$lambda$SVwjcbBOc_qiSW6-84bUTfjvqTA(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->lambda$onCreateView$0(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetadapter(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->adapter:Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->listener:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmanifestos(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->manifestos:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetrvManifestosCliente(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->rvManifestosCliente:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputadapter(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->adapter:Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;)V"
        }
    .end annotation

    .line 43
    .local p1, "manifestos":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->manifestos:Ljava/util/List;

    .line 45
    return-void
.end method

.method private initSearchView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 70
    sget v0, Lcom/coleta/ambientuus/R$id;->etPesquisarMTRsClientes:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 71
    .local v0, "etPesquisarManifesto":Landroid/widget/EditText;
    new-instance v1, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;-><init>(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 109
    return-void
.end method

.method private synthetic lambda$onCreateView$0(Ljava/lang/String;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/String;

    .line 57
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->listener:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->listener:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    invoke-interface {v0, p1}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;->onItemSelecionado(Ljava/lang/String;)V

    .line 60
    :cond_0
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->dismiss()V

    .line 61
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 52
    sget v0, Lcom/coleta/ambientuus/R$layout;->fragment_manifestos_cliente_bottom_sheet:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 54
    .local v0, "view":Landroid/view/View;
    sget v1, Lcom/coleta/ambientuus/R$id;->rvManifestosCliente:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->rvManifestosCliente:Landroidx/recyclerview/widget/RecyclerView;

    .line 55
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->rvManifestosCliente:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 56
    new-instance v1, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->manifestos:Ljava/util/List;

    new-instance v3, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)V

    invoke-direct {v1, v2, v3}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;-><init>(Ljava/util/List;Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;)V

    iput-object v1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->adapter:Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    .line 62
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->rvManifestosCliente:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->adapter:Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 64
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->initSearchView(Landroid/view/View;)V

    .line 66
    return-object v0
.end method

.method public setOnItemSelecionadoListener(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    .line 40
    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->listener:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    .line 41
    return-void
.end method
