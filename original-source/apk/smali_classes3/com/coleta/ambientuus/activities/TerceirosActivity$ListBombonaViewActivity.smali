.class public Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "TerceirosActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/TerceirosActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ListBombonaViewActivity"
.end annotation


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;

.field private bombonaSel:Ljava/lang/String;

.field private bombonas:Lcom/coleta/ambientuus/dto/Bombona;

.field private bombonasLista:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Bombona;",
            ">;"
        }
    .end annotation
.end field

.field private btnLerBombonaListagem:Landroid/widget/Button;

.field private codigoBarrasBombonaLida:Ljava/lang/String;

.field private db:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private dialog:Landroidx/appcompat/app/AlertDialog;

.field private dialogBuilder:Landroidx/appcompat/app/AlertDialog$Builder;

.field private listView:Landroid/widget/ListView;

.field private myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;


# direct methods
.method static bridge synthetic -$$Nest$fgetbombonasLista(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonasLista:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdialog(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)Landroidx/appcompat/app/AlertDialog;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlistView(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)Landroid/widget/ListView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->listView:Landroid/widget/ListView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputbombonaSel(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonaSel:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 240
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private initSearchView()V
    .locals 2

    .line 338
    sget v0, Lcom/coleta/ambientuus/R$id;->etPesquisarBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 339
    .local v0, "editText":Landroid/widget/EditText;
    new-instance v1, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 369
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->codigoBarrasBombonaLida:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 370
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->codigoBarrasBombonaLida:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 372
    :cond_0
    return-void
.end method


# virtual methods
.method public createDialogGroup()V
    .locals 12

    .line 376
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->dialogBuilder:Landroidx/appcompat/app/AlertDialog$Builder;

    .line 377
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$layout;->popup_cliente_bombona:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 379
    .local v0, "bombonaPopupView":Landroid/view/View;
    sget v1, Lcom/coleta/ambientuus/R$id;->BombonaGroup:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 380
    .local v1, "BombonaGroup":Landroid/widget/TextView;
    sget v2, Lcom/coleta/ambientuus/R$id;->clienteBombonaGroup:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 381
    .local v2, "clienteBombonaGroup":Landroid/widget/TextView;
    sget v3, Lcom/coleta/ambientuus/R$id;->terceiroBombonaGroup:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 382
    .local v3, "terceiroBombonaGroup":Landroid/widget/TextView;
    sget v4, Lcom/coleta/ambientuus/R$id;->fecharPopUpGroupBombona:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 384
    .local v4, "btnOkGroup":Landroid/widget/Button;
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->dialogBuilder:Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {v5, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 385
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->dialogBuilder:Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {v5}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v5

    iput-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    .line 387
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bombona: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonaSel:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    new-instance v5, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v5, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 390
    new-instance v5, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v6, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v6}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v6, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonaSel:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->getClienteBombona(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 395
    .local v5, "data":Landroid/database/Cursor;
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    .line 397
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v6

    if-nez v6, :cond_4

    .line 398
    const-string v6, "STATUS"

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 399
    .local v6, "status":Ljava/lang/String;
    const-string v7, " "

    const-string v8, ""

    if-eqz v6, :cond_3

    if-eq v6, v8, :cond_3

    .line 400
    const-string v9, "DISPONIVEL"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 401
    const-string v9, "RAZAO_SOCIAL"

    invoke-interface {v5, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v5, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 402
    .local v9, "cliente":Ljava/lang/String;
    const-string v10, "RAZAO_SOCIAL_TERCEIRO"

    invoke-interface {v5, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v5, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 403
    .local v10, "terceiro":Ljava/lang/String;
    if-eqz v9, :cond_0

    .line 404
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Cliente: "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 406
    :cond_0
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 408
    :goto_1
    if-eqz v10, :cond_1

    .line 409
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Descarregado em: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 411
    :cond_1
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 414
    .end local v9    # "cliente":Ljava/lang/String;
    .end local v10    # "terceiro":Ljava/lang/String;
    :cond_2
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 415
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 418
    :cond_3
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 419
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 421
    :goto_2
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 423
    .end local v6    # "status":Ljava/lang/String;
    :cond_4
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 424
    iget-object v6, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v6}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 426
    new-instance v6, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$5;

    invoke-direct {v6, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$5;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 432
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 256
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 257
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_listagem_bombonas:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->setContentView(I)V

    .line 258
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 259
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v2, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 261
    sget v0, Lcom/coleta/ambientuus/R$id;->btnLerBombonaListagem:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->btnLerBombonaListagem:Landroid/widget/Button;

    .line 263
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->btnLerBombonaListagem:Landroid/widget/Button;

    new-instance v2, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$1;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$1;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 285
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 286
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 287
    const-string v2, "codigoBarrasBombona"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->codigoBarrasBombonaLida:Ljava/lang/String;

    .line 290
    :cond_0
    new-instance v2, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 291
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonasLista:Ljava/util/ArrayList;

    .line 292
    new-instance v2, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->getAllBombonas()Landroid/database/Cursor;

    move-result-object v2

    .line 294
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v3

    .line 296
    .local v3, "i":I
    if-nez v3, :cond_1

    .line 297
    const-string v4, "Banco de Dados Vazio"

    invoke-static {p0, v4, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 298
    .local v4, "toast":Landroid/widget/Toast;
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 299
    .end local v4    # "toast":Landroid/widget/Toast;
    goto :goto_1

    .line 300
    :cond_1
    const/4 v4, 0x0

    .line 301
    .local v4, "j":I
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 302
    new-instance v6, Lcom/coleta/ambientuus/dto/Bombona;

    const/4 v5, 0x0

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 303
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 304
    const/4 v5, 0x2

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 305
    const/4 v5, 0x3

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 306
    const/4 v5, 0x4

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-direct/range {v6 .. v11}, Lcom/coleta/ambientuus/dto/Bombona;-><init>(ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    iput-object v6, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonas:Lcom/coleta/ambientuus/dto/Bombona;

    .line 308
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonasLista:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonas:Lcom/coleta/ambientuus/dto/Bombona;

    invoke-virtual {v5, v4, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 309
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 312
    :cond_2
    new-instance v5, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;

    sget v6, Lcom/coleta/ambientuus/R$layout;->list_bombonas_row:I

    iget-object v7, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->bombonasLista:Ljava/util/ArrayList;

    invoke-direct {v5, p0, v6, v7}, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;)V

    iput-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->adapter:Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;

    .line 313
    sget v5, Lcom/coleta/ambientuus/R$id;->rv_Bombonas:I

    invoke-virtual {p0, v5}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ListView;

    iput-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->listView:Landroid/widget/ListView;

    .line 314
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->listView:Landroid/widget/ListView;

    iget-object v6, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->adapter:Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 315
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->listView:Landroid/widget/ListView;

    invoke-virtual {p0, v5}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 317
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->listView:Landroid/widget/ListView;

    invoke-virtual {v5, v1}, Landroid/widget/ListView;->setClickable(Z)V

    .line 318
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->listView:Landroid/widget/ListView;

    new-instance v6, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$2;

    invoke-direct {v6, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$2;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)V

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 326
    .end local v4    # "j":I
    :goto_1
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->initSearchView()V

    .line 328
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v4

    new-instance v5, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$3;

    invoke-direct {v5, p0, v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$3;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;Z)V

    invoke-virtual {v4, p0, v5}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 335
    return-void
.end method
