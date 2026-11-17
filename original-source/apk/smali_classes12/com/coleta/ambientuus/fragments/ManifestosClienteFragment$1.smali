.class Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;
.super Ljava/lang/Object;
.source "ManifestosClienteFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->initSearchView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;


# direct methods
.method public static synthetic $r8$lambda$7nrniOfoDj-mbViZXvXhjAbw-YM(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->lambda$onTextChanged$1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$N7RLNu9b9M-pw0LUPONhf5k_mvA(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->lambda$onTextChanged$0(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    .line 71
    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onTextChanged$0(Ljava/lang/String;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/String;

    .line 87
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;->onItemSelecionado(Ljava/lang/String;)V

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->dismiss()V

    .line 91
    return-void
.end method

.method private synthetic lambda$onTextChanged$1(Ljava/lang/String;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/String;

    .line 95
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;->onItemSelecionado(Ljava/lang/String;)V

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->dismiss()V

    .line 99
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "editable"    # Landroid/text/Editable;

    .line 107
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 74
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 78
    const/4 v0, 0x1

    if-eqz p1, :cond_2

    .line 79
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .local v1, "manifestosFiltrados":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v2}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetmanifestos(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/coleta/ambientuus/dto/Manifesto;

    .line 82
    .local v3, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/coleta/ambientuus/dto/Manifesto;->contemTexto(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 83
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .end local v3    # "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    :cond_0
    goto :goto_0

    .line 86
    :cond_1
    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    new-instance v3, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    new-instance v4, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;)V

    invoke-direct {v3, v1, v4}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;-><init>(Ljava/util/List;Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;)V

    invoke-static {v2, v3}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fputadapter(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;)V

    .line 92
    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v2}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetrvManifestosCliente(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v3}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetadapter(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 93
    .end local v1    # "manifestosFiltrados":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    goto :goto_1

    .line 94
    :cond_2
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    new-instance v2, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    iget-object v3, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v3}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetmanifestos(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Ljava/util/List;

    move-result-object v3

    new-instance v4, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;)V

    invoke-direct {v2, v3, v4}, Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;-><init>(Ljava/util/List;Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter$OnItemClickListener;)V

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fputadapter(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;)V

    .line 100
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v1}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetrvManifestosCliente(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v1

    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-static {v2}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->-$$Nest$fgetadapter(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;)Lcom/coleta/ambientuus/adapters/ManifestosClienteAdapter;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 102
    :goto_1
    return-void
.end method
