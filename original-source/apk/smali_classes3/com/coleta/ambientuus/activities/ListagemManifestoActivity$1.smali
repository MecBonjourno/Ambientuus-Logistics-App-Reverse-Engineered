.class Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;
.super Ljava/lang/Object;
.source "ListagemManifestoActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->initSearchView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    .line 60
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "editable"    # Landroid/text/Editable;

    .line 87
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 62
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 66
    const/4 v0, 0x1

    if-eqz p1, :cond_2

    .line 67
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v1, "manifestosFiltrados":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->-$$Nest$fgetmanifestos(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/coleta/ambientuus/dto/Manifesto;

    .line 70
    .local v3, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/coleta/ambientuus/dto/Manifesto;->contemTexto(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 71
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .end local v3    # "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    :cond_0
    goto :goto_0

    .line 74
    :cond_1
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    new-instance v3, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    iget-object v4, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-direct {v3, v1, v4}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;-><init>(Ljava/util/ArrayList;Landroid/content/Context;)V

    invoke-static {v2, v3}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->-$$Nest$fputadapter(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;Lcom/coleta/ambientuus/adapters/ManifestoAdapter;)V

    .line 76
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->-$$Nest$fgetlistagemManifesto(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->-$$Nest$fgetadapter(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 77
    .end local v1    # "manifestosFiltrados":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    goto :goto_1

    .line 78
    :cond_2
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    new-instance v2, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->-$$Nest$fgetmanifestos(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-direct {v2, v3, v4}, Lcom/coleta/ambientuus/adapters/ManifestoAdapter;-><init>(Ljava/util/ArrayList;Landroid/content/Context;)V

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->-$$Nest$fputadapter(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;Lcom/coleta/ambientuus/adapters/ManifestoAdapter;)V

    .line 80
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->-$$Nest$fgetlistagemManifesto(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v1

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;->-$$Nest$fgetadapter(Lcom/coleta/ambientuus/activities/ListagemManifestoActivity;)Lcom/coleta/ambientuus/adapters/ManifestoAdapter;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 82
    :goto_1
    return-void
.end method
