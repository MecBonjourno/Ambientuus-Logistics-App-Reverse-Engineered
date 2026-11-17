.class public Lcom/coleta/ambientuus/activities/TerceirosActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "TerceirosActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;
    }
.end annotation


# static fields
.field private static final ARQUIVO_PREFERENCIA:Ljava/lang/String; = "ArquivoPreferencia"


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/TerceirosAdapter;

.field private btnTerceirosDigitarBombona:Landroid/widget/Button;

.field private btnTerceirosLerBombona:Landroid/widget/Button;

.field private spinnerTerceirosBombona:Landroid/widget/TextView;

.field private spinnerTerceirosBombonaSel:Ljava/lang/Integer;


# direct methods
.method public static synthetic $r8$lambda$3S55MY_KYAFqDuOM2F97b2Rl5NE(Lcom/coleta/ambientuus/activities/TerceirosActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->lambda$onCreate$0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$9ugsQeVv69tj3YTUpwo-zNsubh8(Lcom/coleta/ambientuus/activities/TerceirosActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->lambda$loadSpinnerCliente$2(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$lX4iwqoY1PjC7gdU0X8XNZXHoI8(Lcom/coleta/ambientuus/activities/TerceirosActivity;Lcom/coleta/ambientuus/dto/Terceiro;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->lambda$loadSpinnerCliente$1(Lcom/coleta/ambientuus/dto/Terceiro;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetspinnerTerceirosBombona(Lcom/coleta/ambientuus/activities/TerceirosActivity;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombona:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetspinnerTerceirosBombonaSel(Lcom/coleta/ambientuus/activities/TerceirosActivity;)Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombonaSel:Ljava/lang/Integer;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputspinnerTerceirosBombonaSel(Lcom/coleta/ambientuus/activities/TerceirosActivity;Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombonaSel:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private synthetic lambda$loadSpinnerCliente$1(Lcom/coleta/ambientuus/dto/Terceiro;)V
    .locals 1
    .param p1, "selectedTerceiro"    # Lcom/coleta/ambientuus/dto/Terceiro;

    .line 234
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Terceiro;->getId_Pessoa()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombonaSel:Ljava/lang/Integer;

    .line 235
    return-void
.end method

.method private synthetic lambda$loadSpinnerCliente$2(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 8
    .param p1, "helper"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .param p2, "labels"    # Ljava/util/List;
    .param p3, "v"    # Landroid/view/View;

    .line 226
    new-instance v4, Lcom/coleta/ambientuus/activities/TerceirosActivity$$ExternalSyntheticLambda2;

    invoke-direct {v4}, Lcom/coleta/ambientuus/activities/TerceirosActivity$$ExternalSyntheticLambda2;-><init>()V

    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombona:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombona:Landroid/widget/TextView;

    .line 232
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/coleta/ambientuus/activities/TerceirosActivity$$ExternalSyntheticLambda3;

    invoke-direct {v7, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;)V

    .line 226
    const-string v3, "Selecione o Terceiro"

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "labels":Ljava/util/List;
    .local v0, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .local v2, "labels":Ljava/util/List;
    invoke-virtual/range {v0 .. v7}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V

    .line 237
    return-void
.end method

.method private synthetic lambda$onCreate$0(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 116
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->digitarBombona()V

    return-void
.end method

.method private loadSpinnerCliente()V
    .locals 5

    .line 221
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 222
    .local v0, "db":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;->getAllTerceiros()Ljava/util/List;

    move-result-object v1

    .line 224
    .local v1, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Terceiro;>;"
    new-instance v2, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    invoke-direct {v2}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;-><init>()V

    .line 225
    .local v2, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<Lcom/coleta/ambientuus/dto/Terceiro;>;"
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombona:Landroid/widget/TextView;

    new-instance v4, Lcom/coleta/ambientuus/activities/TerceirosActivity$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, v2, v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    return-void
.end method

.method private preparaRecyclerView()Landroidx/recyclerview/widget/RecyclerView;
    .locals 4

    .line 202
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 204
    .local v0, "myDb":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->selectBombonasAlocadasTerceiros()Ljava/util/ArrayList;

    move-result-object v1

    .line 205
    .local v1, "arrayBombonasTerceiro":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget v2, Lcom/coleta/ambientuus/R$id;->rvBombonasTerceiros:I

    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    .line 206
    .local v2, "listagemCodigo":Landroidx/recyclerview/widget/RecyclerView;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 207
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v3, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 208
    new-instance v3, Lcom/coleta/ambientuus/adapters/TerceirosAdapter;

    invoke-direct {v3, v1}, Lcom/coleta/ambientuus/adapters/TerceirosAdapter;-><init>(Ljava/util/ArrayList;)V

    iput-object v3, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->adapter:Lcom/coleta/ambientuus/adapters/TerceirosAdapter;

    .line 209
    return-object v2
.end method


# virtual methods
.method public digitarBombona()V
    .locals 6

    .line 128
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 130
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 131
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const-string v2, "C\u00f3digo de Barras Bombona"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 132
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 133
    .local v2, "input":Landroid/widget/EditText;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 134
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 135
    new-instance v4, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;

    invoke-direct {v4, p0, v0, v2}, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;Landroid/view/inputmethod/InputMethodManager;Landroid/widget/EditText;)V

    const-string v5, "OK"

    invoke-virtual {v1, v5, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 142
    new-instance v4, Lcom/coleta/ambientuus/activities/TerceirosActivity$4;

    invoke-direct {v4, p0, v0, v2}, Lcom/coleta/ambientuus/activities/TerceirosActivity$4;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;Landroid/view/inputmethod/InputMethodManager;Landroid/widget/EditText;)V

    const-string v5, "Cancelar"

    invoke-virtual {v1, v5, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 149
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 150
    invoke-virtual {v2}, Landroid/widget/EditText;->requestFocus()Z

    .line 151
    const/4 v4, 0x2

    invoke-virtual {v0, v4, v3}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 152
    return-void
.end method

.method public habilitaRecycleView()V
    .locals 2

    .line 213
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->preparaRecyclerView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->adapter:Lcom/coleta/ambientuus/adapters/TerceirosAdapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 214
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 62
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_terceiros:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->setContentView(I)V

    .line 64
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 65
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v2, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 67
    sget v0, Lcom/coleta/ambientuus/R$id;->btnTerceirosLerBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->btnTerceirosLerBombona:Landroid/widget/Button;

    .line 68
    sget v0, Lcom/coleta/ambientuus/R$id;->btnTerceirosDigitarBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->btnTerceirosDigitarBombona:Landroid/widget/Button;

    .line 70
    sget v0, Lcom/coleta/ambientuus/R$id;->spinnerTerceirosBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombona:Landroid/widget/TextView;

    .line 71
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->loadSpinnerCliente()V

    .line 73
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 74
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 75
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombona:Landroid/widget/TextView;

    const-string v3, "ClienteSelectinado"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    const-string v2, "IdPessoaClienteSelecionado"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombonaSel:Ljava/lang/Integer;

    .line 77
    const-string v4, "lido"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 78
    new-instance v4, Landroid/content/Intent;

    const-class v5, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-direct {v4, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 79
    .local v4, "intent":Landroid/content/Intent;
    const-string v5, "ORIGEM"

    const-string v6, "TC"

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 80
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombona:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 81
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombonaSel:Ljava/lang/Integer;

    invoke-virtual {v4, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 82
    invoke-virtual {p0, v4}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->startActivity(Landroid/content/Intent;)V

    .line 85
    .end local v4    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->habilitaRecycleView()V

    .line 87
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->btnTerceirosLerBombona:Landroid/widget/Button;

    new-instance v3, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->btnTerceirosDigitarBombona:Landroid/widget/Button;

    new-instance v3, Lcom/coleta/ambientuus/activities/TerceirosActivity$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v2

    new-instance v3, Lcom/coleta/ambientuus/activities/TerceirosActivity$2;

    invoke-direct {v3, p0, v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity$2;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;Z)V

    invoke-virtual {v2, p0, v3}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 124
    return-void
.end method

.method public refazRecycleView()V
    .locals 3

    .line 217
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->preparaRecyclerView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->adapter:Lcom/coleta/ambientuus/adapters/TerceirosAdapter;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 218
    return-void
.end method

.method public verificaBombona(Ljava/lang/String;Landroid/content/DialogInterface;)V
    .locals 14
    .param p1, "codBarras"    # Ljava/lang/String;
    .param p2, "dialog"    # Landroid/content/DialogInterface;

    .line 155
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 156
    .local v0, "myDb":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1, p1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->validaCadastroBombona(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 157
    .local v1, "erroCad":Ljava/lang/String;
    const-string v2, ""

    .line 158
    .local v2, "erroMensagem":Ljava/lang/String;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombonaSel:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eqz v3, :cond_2

    .line 159
    if-nez v1, :cond_1

    .line 160
    new-instance v3, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    const-string v4, "TC"

    invoke-virtual {v3, p1, v4}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->validaBombona(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 161
    .local v3, "validaBombona":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 162
    const-string v4, "ArquivoPreferencia"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 163
    .local v4, "preferences":Landroid/content/SharedPreferences;
    const-string v6, "id_rota"

    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 164
    .local v6, "spinner_id_rota":I
    const-string v7, "id_frota_veiculo"

    invoke-interface {v4, v7, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 165
    .local v5, "spinner_id_frota_veiculo":I
    new-instance v7, Lcom/coleta/ambientuus/dto/MovimentoBombona;

    iget-object v9, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity;->spinnerTerceirosBombonaSel:Ljava/lang/Integer;

    .line 169
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    .line 170
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const-string v10, "TC"

    const/4 v11, 0x0

    move-object v8, p1

    invoke-direct/range {v7 .. v13}, Lcom/coleta/ambientuus/dto/MovimentoBombona;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 171
    .local v7, "movimentoBombona":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    new-instance v8, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 172
    .local v8, "movimentoBombonaTableManager":Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
    invoke-virtual {v8, v7}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->insert(Lcom/coleta/ambientuus/dto/MovimentoBombona;)V

    .line 173
    const-string v9, "Bombona Alocada em Terceiro!"

    const/4 v10, 0x1

    invoke-static {p0, v9, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v9

    .line 174
    .local v9, "toast":Landroid/widget/Toast;
    invoke-virtual {v9}, Landroid/widget/Toast;->show()V

    .line 175
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->refazRecycleView()V

    .line 176
    .end local v4    # "preferences":Landroid/content/SharedPreferences;
    .end local v5    # "spinner_id_frota_veiculo":I
    .end local v6    # "spinner_id_rota":I
    .end local v7    # "movimentoBombona":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    .end local v8    # "movimentoBombonaTableManager":Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
    .end local v9    # "toast":Landroid/widget/Toast;
    goto :goto_0

    .line 177
    :cond_0
    move-object v2, v3

    .line 179
    .end local v3    # "validaBombona":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 180
    :cond_1
    move-object v2, v1

    goto :goto_1

    .line 183
    :cond_2
    const-string v2, "Selecione um cliente para destinar a Bombona"

    .line 185
    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 186
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 187
    .local v3, "alertDialog":Landroid/app/AlertDialog;
    const-string v4, "Erro"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 188
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 189
    new-instance v4, Lcom/coleta/ambientuus/activities/TerceirosActivity$5;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$5;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;)V

    const/4 v5, -0x3

    const-string v6, "OK"

    invoke-virtual {v3, v5, v6, v4}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 195
    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 196
    .end local v3    # "alertDialog":Landroid/app/AlertDialog;
    goto :goto_2

    .line 197
    :cond_3
    invoke-interface/range {p2 .. p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 199
    :goto_2
    return-void
.end method
