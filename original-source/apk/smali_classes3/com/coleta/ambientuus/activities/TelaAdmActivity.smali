.class public Lcom/coleta/ambientuus/activities/TelaAdmActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "TelaAdmActivity.java"


# instance fields
.field adapter:Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;

.field listView:Landroid/widget/ListView;

.field myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field user:Lcom/coleta/ambientuus/dto/Coleta;

.field userList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 18
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 30
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 31
    sget v1, Lcom/coleta/ambientuus/R$layout;->activity_tela_adm:I

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->setContentView(I)V

    .line 33
    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 34
    new-instance v1, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    iget-object v2, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 36
    .local v1, "coletaTableManager":Lcom/coleta/ambientuus/database/managers/ColetaTableManager;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->userList:Ljava/util/ArrayList;

    .line 37
    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->getAllColetasAdm()Landroid/database/Cursor;

    move-result-object v2

    .line 38
    .local v2, "data":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v3

    .line 39
    .local v3, "numRows":I
    const/4 v4, 0x1

    if-nez v3, :cond_0

    goto :goto_1

    .line 42
    :cond_0
    const/4 v5, 0x0

    .line 43
    .local v5, "i":I
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 44
    new-instance v7, Lcom/coleta/ambientuus/dto/Coleta;

    const/4 v6, 0x0

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 45
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 46
    const/4 v6, 0x2

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 47
    const/4 v6, 0x3

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    long-to-int v6, v11

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 48
    const/4 v6, 0x4

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    long-to-int v6, v12

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 49
    const/4 v6, 0x5

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 50
    const/4 v6, 0x6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 51
    const/4 v6, 0x7

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 52
    const/16 v6, 0x9

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 53
    const/16 v6, 0xb

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v7 .. v17}, Lcom/coleta/ambientuus/dto/Coleta;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v7, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->user:Lcom/coleta/ambientuus/dto/Coleta;

    .line 55
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->userList:Ljava/util/ArrayList;

    iget-object v7, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->user:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v6, v5, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 56
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 58
    :cond_1
    new-instance v6, Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;

    sget v7, Lcom/coleta/ambientuus/R$layout;->list_adapter_view_adm:I

    iget-object v8, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->userList:Ljava/util/ArrayList;

    invoke-direct {v6, v0, v7, v8}, Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;)V

    iput-object v6, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->adapter:Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;

    .line 59
    sget v6, Lcom/coleta/ambientuus/R$id;->listviewADM:I

    invoke-virtual {v0, v6}, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ListView;

    iput-object v6, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->listView:Landroid/widget/ListView;

    .line 60
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->listView:Landroid/widget/ListView;

    iget-object v7, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->adapter:Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;

    invoke-virtual {v6, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 61
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->listView:Landroid/widget/ListView;

    invoke-virtual {v0, v6}, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 63
    .end local v5    # "i":I
    :goto_1
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v5

    new-instance v6, Lcom/coleta/ambientuus/activities/TelaAdmActivity$1;

    invoke-direct {v6, v0, v4}, Lcom/coleta/ambientuus/activities/TelaAdmActivity$1;-><init>(Lcom/coleta/ambientuus/activities/TelaAdmActivity;Z)V

    invoke-virtual {v5, v0, v6}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 70
    return-void
.end method
