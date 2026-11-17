.class Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;
.super Ljava/lang/Object;
.source "TerceirosActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->initSearchView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    .line 339
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .line 367
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .line 341
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 6
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .line 344
    if-eqz p1, :cond_4

    .line 345
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 349
    .local v0, "bombonasFiltradas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Bombona;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->-$$Nest$fgetbombonasLista(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/dto/Bombona;

    .line 350
    .local v2, "bombona":Lcom/coleta/ambientuus/dto/Bombona;
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Bombona;->getStatus()Ljava/lang/String;

    move-result-object v3

    .line 351
    .local v3, "status":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 352
    const-string v3, "disponivel"

    .line 354
    :cond_0
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Bombona;->getCOD_BARRAS()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 355
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 356
    :cond_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 358
    .end local v2    # "bombona":Lcom/coleta/ambientuus/dto/Bombona;
    :cond_2
    goto :goto_0

    .line 359
    .end local v3    # "status":Ljava/lang/String;
    :cond_3
    new-instance v1, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/coleta/ambientuus/R$layout;->list_bombonas_row:I

    invoke-direct {v1, v2, v3, v0}, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;)V

    .line 360
    .local v1, "adapterFiltrada":Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->-$$Nest$fgetlistView(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 361
    .end local v0    # "bombonasFiltradas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Bombona;>;"
    .end local v1    # "adapterFiltrada":Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;
    goto :goto_1

    .line 362
    :cond_4
    new-instance v0, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/coleta/ambientuus/R$layout;->list_bombonas_row:I

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->-$$Nest$fgetbombonasLista(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;)V

    .line 363
    .local v0, "adapterFiltrada":Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$4;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->-$$Nest$fgetlistView(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 365
    .end local v0    # "adapterFiltrada":Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;
    :goto_1
    return-void
.end method
