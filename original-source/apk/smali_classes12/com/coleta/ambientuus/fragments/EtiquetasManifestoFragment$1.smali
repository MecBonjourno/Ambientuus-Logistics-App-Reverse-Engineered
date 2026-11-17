.class Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;
.super Ljava/lang/Object;
.source "EtiquetasManifestoFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->initSearchView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;


# direct methods
.method public static synthetic $r8$lambda$jwC9MsJHWI1eMOIA0EKiU9R3x6U(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->lambda$onTextChanged$0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$l9bnZcjYKjMrs7gCgWDRglTGxLc(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->lambda$onTextChanged$1(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    .line 69
    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onTextChanged$0(Ljava/lang/String;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/String;

    .line 84
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;->onItemSelecionado(Ljava/lang/String;)V

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->dismiss()V

    .line 88
    return-void
.end method

.method private synthetic lambda$onTextChanged$1(Ljava/lang/String;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/String;

    .line 92
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetlistener(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;->onItemSelecionado(Ljava/lang/String;)V

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->dismiss()V

    .line 96
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "editable"    # Landroid/text/Editable;

    .line 104
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 71
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 6
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 75
    const/4 v0, 0x1

    if-eqz p1, :cond_2

    .line 76
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .local v1, "etiquetasFiltradas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v2}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetetiquetas(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/coleta/ambientuus/dto/Etiqueta;

    .line 79
    .local v3, "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 80
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    .end local v3    # "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    :cond_0
    goto :goto_0

    .line 83
    :cond_1
    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    new-instance v3, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    new-instance v4, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;)V

    invoke-direct {v3, v1, v4}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;-><init>(Ljava/util/List;Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;)V

    invoke-static {v2, v3}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fputadapter(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;)V

    .line 89
    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v2}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetrvEtiquetas(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v3}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetadapter(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 90
    .end local v1    # "etiquetasFiltradas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    goto :goto_1

    .line 91
    :cond_2
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    new-instance v2, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    iget-object v3, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v3}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetetiquetas(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Ljava/util/List;

    move-result-object v3

    new-instance v4, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;)V

    invoke-direct {v2, v3, v4}, Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;-><init>(Ljava/util/List;Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter$OnItemClickListener;)V

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fputadapter(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;)V

    .line 97
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v1}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetrvEtiquetas(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v1

    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-static {v2}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->-$$Nest$fgetadapter(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;)Lcom/coleta/ambientuus/adapters/EtiquetaManifestoAdapter;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 99
    :goto_1
    return-void
.end method
