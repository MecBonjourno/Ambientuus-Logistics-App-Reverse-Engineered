.class public Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ListagemManifestoActivity.java"


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

.field private db:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private listagemManifesto:Landroidx/recyclerview/widget/RecyclerView;

.field private manifestos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetadapter(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Lcom/coleta/ambientuus/adapters/ManifestoAdapter;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->adapter:Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlistagemManifesto(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->listagemManifesto:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmanifestos(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->manifestos:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputadapter(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;Lcom/coleta/ambientuus/adapters/ManifestoAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->adapter:Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private createRecyclerView()V
    .locals 2

    .line 55
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->prepareRecyclerView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->adapter:Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 56
    return-void
.end method

.method private getDatabase()V
    .locals 1

    .line 41
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 42
    return-void
.end method

.method private initSearchView()V
    .locals 2

    .line 59
    sget v0, Lcom/coleta/ambientuus/R$id;->etPesquisarManifesto:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 60
    .local v0, "etPesquisarManifesto":Landroid/widget/EditText;
    new-instance v1, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;-><init>(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 89
    return-void
.end method

.method private prepareRecyclerView()Landroidx/recyclerview/widget/RecyclerView;
    .locals 2

    .line 45
    new-instance v0, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->selectManifestos()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->manifestos:Ljava/util/ArrayList;

    .line 46
    sget v0, Lcom/coleta/ambientuus/R$id;->rv_Manifesto:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->listagemManifesto:Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->listagemManifesto:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 48
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->listagemManifesto:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v1, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 49
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->listagemManifesto:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->adapter:Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 50
    new-instance v0, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->manifestos:Ljava/util/ArrayList;

    invoke-direct {v0, v1, p0}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;-><init>(Ljava/util/ArrayList;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->adapter:Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    .line 51
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->listagemManifesto:Landroidx/recyclerview/widget/RecyclerView;

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 29
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 30
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_listagem_manifesto:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->setContentView(I)V

    .line 31
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 33
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->getDatabase()V

    .line 35
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->createRecyclerView()V

    .line 37
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->initSearchView()V

    .line 38
    return-void
.end method
