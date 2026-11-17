.class public Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "CarregarBombonaActivity.java"


# static fields
.field private static final ARQUIVO_PREFERENCIA:Ljava/lang/String; = "ArquivoPreferencia"


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/CarregarBombonaAdapter;

.field private btnDigitarBombona:Landroid/widget/Button;

.field private btnLerBombona:Landroid/widget/Button;


# direct methods
.method public static synthetic $r8$lambda$d30nDR7CeiwX6pKcDqJ4gNb_sfg(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->lambda$onCreate$0(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private synthetic lambda$onCreate$0(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 85
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->digitarBombona()V

    return-void
.end method

.method private preparaRecyclerView()Landroidx/recyclerview/widget/RecyclerView;
    .locals 4

    .line 170
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 172
    .local v0, "myDb":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->selectBombonasCarregadas()Ljava/util/ArrayList;

    move-result-object v1

    .line 173
    .local v1, "arrayBombonasLidas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget v2, Lcom/coleta/ambientuus/R$id;->rvBombonasCarregadas:I

    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    .line 174
    .local v2, "listagemCodigo":Landroidx/recyclerview/widget/RecyclerView;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 175
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v3, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 176
    new-instance v3, Lcom/coleta/ambientuus/adapters/CarregarBombonaAdapter;

    invoke-direct {v3, v1}, Lcom/coleta/ambientuus/adapters/CarregarBombonaAdapter;-><init>(Ljava/util/ArrayList;)V

    iput-object v3, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->adapter:Lcom/coleta/ambientuus/adapters/CarregarBombonaAdapter;

    .line 177
    return-object v2
.end method


# virtual methods
.method public digitarBombona()V
    .locals 6

    .line 97
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 99
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 100
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const-string v2, "C\u00f3digo de Barras Bombona"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 101
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 102
    .local v2, "input":Landroid/widget/EditText;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 103
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 104
    new-instance v4, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$3;

    invoke-direct {v4, p0, v0, v2}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$3;-><init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;Landroid/view/inputmethod/InputMethodManager;Landroid/widget/EditText;)V

    const-string v5, "OK"

    invoke-virtual {v1, v5, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 111
    new-instance v4, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$4;

    invoke-direct {v4, p0, v0, v2}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$4;-><init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;Landroid/view/inputmethod/InputMethodManager;Landroid/widget/EditText;)V

    const-string v5, "Cancelar"

    invoke-virtual {v1, v5, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 119
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 120
    invoke-virtual {v2}, Landroid/widget/EditText;->requestFocus()Z

    .line 121
    const/4 v4, 0x2

    invoke-virtual {v0, v4, v3}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 122
    return-void
.end method

.method public habilitaRecycleView()V
    .locals 2

    .line 181
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->preparaRecyclerView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->adapter:Lcom/coleta/ambientuus/adapters/CarregarBombonaAdapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 182
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 46
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 47
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_carregar_bombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->setContentView(I)V

    .line 48
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 49
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v2, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 50
    sget v0, Lcom/coleta/ambientuus/R$id;->btnLerCarregarBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->btnLerBombona:Landroid/widget/Button;

    .line 51
    sget v0, Lcom/coleta/ambientuus/R$id;->btnDigitarCarregarBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->btnDigitarBombona:Landroid/widget/Button;

    .line 53
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 55
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 56
    const-string v2, "lido"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 57
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 58
    .local v2, "intent":Landroid/content/Intent;
    const-string v3, "ORIGEM"

    const-string v4, "TR"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .line 62
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->habilitaRecycleView()V

    .line 64
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->btnLerBombona:Landroid/widget/Button;

    new-instance v3, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;-><init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->btnDigitarBombona:Landroid/widget/Button;

    new-instance v3, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v2

    new-instance v3, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$2;

    invoke-direct {v3, p0, v1}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$2;-><init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;Z)V

    invoke-virtual {v2, p0, v3}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 94
    return-void
.end method

.method public refazRecycleView()V
    .locals 3

    .line 185
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->preparaRecyclerView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->adapter:Lcom/coleta/ambientuus/adapters/CarregarBombonaAdapter;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 186
    return-void
.end method

.method public verificaBombona(Ljava/lang/String;Landroid/content/DialogInterface;)V
    .locals 14
    .param p1, "codBarras"    # Ljava/lang/String;
    .param p2, "dialog"    # Landroid/content/DialogInterface;

    .line 125
    move-object v1, p1

    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    move-object v7, v0

    .line 126
    .local v7, "myDb":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    invoke-virtual {v7}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, p1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->validaCadastroBombona(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 127
    .local v8, "erroCad":Ljava/lang/String;
    const-string v9, ""

    .line 128
    .local v9, "erroMensagem":Ljava/lang/String;
    if-nez v8, :cond_1

    .line 129
    new-instance v0, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    invoke-virtual {v7}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    const-string v2, "TR"

    invoke-virtual {v0, p1, v2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->validaBombona(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 130
    .local v10, "validaBombona":Ljava/lang/String;
    if-nez v10, :cond_0

    .line 131
    const-string v0, "ArquivoPreferencia"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 132
    .local v11, "preferences":Landroid/content/SharedPreferences;
    const-string v0, "id_rota"

    invoke-interface {v11, v0, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    .line 133
    .local v12, "spinner_id_rota":I
    const-string v0, "id_frota_veiculo"

    invoke-interface {v11, v0, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v13

    .line 135
    .local v13, "spinner_id_frota_veiculo":I
    new-instance v0, Lcom/coleta/ambientuus/dto/MovimentoBombona;

    .line 136
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 139
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    .line 140
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v3, "TR"

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/coleta/ambientuus/dto/MovimentoBombona;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 141
    .local v0, "movimentoBombona":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    invoke-virtual {v7}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 142
    .local v1, "movimentoBombonaTableManager":Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->insert(Lcom/coleta/ambientuus/dto/MovimentoBombona;)V

    .line 144
    const-string v2, "Bombona Carregada!"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 145
    .local v2, "toast":Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 146
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->refazRecycleView()V

    .line 147
    .end local v0    # "movimentoBombona":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    .end local v1    # "movimentoBombonaTableManager":Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
    .end local v2    # "toast":Landroid/widget/Toast;
    .end local v11    # "preferences":Landroid/content/SharedPreferences;
    .end local v12    # "spinner_id_rota":I
    .end local v13    # "spinner_id_frota_veiculo":I
    goto :goto_0

    .line 148
    :cond_0
    move-object v9, v10

    .line 150
    .end local v10    # "validaBombona":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 151
    :cond_1
    move-object v9, v8

    .line 153
    :goto_1
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 154
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 155
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    const-string v1, "Erro"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 156
    invoke-virtual {v0, v9}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 157
    new-instance v1, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$5;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$5;-><init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;)V

    const/4 v2, -0x3

    const-string v3, "OK"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 163
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 164
    .end local v0    # "alertDialog":Landroid/app/AlertDialog;
    goto :goto_2

    .line 165
    :cond_2
    invoke-interface/range {p2 .. p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 167
    :goto_2
    return-void
.end method
