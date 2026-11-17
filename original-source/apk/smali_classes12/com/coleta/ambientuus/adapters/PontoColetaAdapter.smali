.class public Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "PontoColetaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;,
        Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private onItemSelectListener:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;

.field private final pontoColetas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;"
        }
    .end annotation
.end field

.field private posicaoSelecionada:I


# direct methods
.method public static synthetic $r8$lambda$RaPB_og0g5_ItddCe8z-ynXCK60(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;ILcom/coleta/ambientuus/dto/PontoColeta;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->lambda$onBindViewHolder$0(ILcom/coleta/ambientuus/dto/PontoColeta;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;)V"
        }
    .end annotation

    .line 36
    .local p1, "pontoColetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/PontoColeta;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 32
    const/4 v0, -0x1

    iput v0, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->posicaoSelecionada:I

    .line 37
    iput-object p1, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->pontoColetas:Ljava/util/ArrayList;

    .line 38
    return-void
.end method

.method private getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;
    .locals 5
    .param p1, "base"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;

    .line 81
    new-instance v0, Landroid/text/SpannableString;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 82
    .local v0, "spannable":Landroid/text/SpannableString;
    new-instance v1, Landroid/text/style/StyleSpan;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 85
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 82
    const/4 v3, 0x0

    const/16 v4, 0x21

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 88
    return-object v0
.end method

.method private synthetic lambda$onBindViewHolder$0(ILcom/coleta/ambientuus/dto/PontoColeta;Landroid/view/View;)V
    .locals 2
    .param p1, "posicao"    # I
    .param p2, "pontoColeta"    # Lcom/coleta/ambientuus/dto/PontoColeta;
    .param p3, "v"    # Landroid/view/View;

    .line 118
    iget v0, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->posicaoSelecionada:I

    .line 119
    .local v0, "previousSelected":I
    iput p1, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->posicaoSelecionada:I

    .line 121
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->notifyItemChanged(I)V

    .line 122
    iget v1, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->posicaoSelecionada:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->notifyItemChanged(I)V

    .line 124
    iget-object v1, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->onItemSelectListener:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;

    if-eqz v1, :cond_0

    .line 125
    iget-object v1, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->onItemSelectListener:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;

    invoke-interface {v1, p2}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;->onItemSelected(Lcom/coleta/ambientuus/dto/PontoColeta;)V

    .line 127
    :cond_0
    return-void
.end method


# virtual methods
.method public displayBottomRightBadge(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;Lcom/coleta/ambientuus/dto/PontoColeta;)V
    .locals 5
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;
    .param p2, "pontoColeta"    # Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 171
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgetfundoColetaExtra(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v1

    const-string v2, "S"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x0

    const/16 v4, 0x8

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v4

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 172
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgeticoneColetaExtra(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v3

    goto :goto_1

    :cond_1
    move v1, v4

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 173
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvExtra(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v3

    goto :goto_2

    :cond_2
    move v1, v4

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 175
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgetfundoColetaNova(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteNovo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    move v1, v3

    goto :goto_3

    :cond_3
    move v1, v4

    :goto_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 176
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgeticoneColetaNova(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteNovo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    move v1, v3

    goto :goto_4

    :cond_4
    move v1, v4

    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 177
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvNovo(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteNovo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_5

    :cond_5
    move v3, v4

    :goto_5
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 178
    return-void
.end method

.method public getItemCount()I
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->pontoColetas:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 29
    check-cast p1, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->onBindViewHolder(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;I)V
    .locals 5
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;
    .param p2, "position"    # I

    .line 101
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->pontoColetas:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 102
    .local v0, "pontoColeta":Lcom/coleta/ambientuus/dto/PontoColeta;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->getAdapterPosition()I

    move-result v1

    .line 104
    .local v1, "posicao":I
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->setStatusBackground(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0, p1, v0}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->setTextsData(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;Lcom/coleta/ambientuus/dto/PontoColeta;)V

    .line 106
    invoke-virtual {p0, p1, v0}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->displayBottomRightBadge(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;Lcom/coleta/ambientuus/dto/PontoColeta;)V

    .line 108
    iget-object v2, p1, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroidx/cardview/widget/CardView;

    .line 109
    .local v2, "item":Landroidx/cardview/widget/CardView;
    iget v3, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->posicaoSelecionada:I

    if-ne v1, v3, :cond_0

    .line 110
    iget-object v3, p1, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->itemView:Landroid/view/View;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/view/View;->setSelected(Z)V

    .line 111
    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual {v2, v3}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    goto :goto_0

    .line 113
    :cond_0
    iget-object v3, p1, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->itemView:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setSelected(Z)V

    .line 114
    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual {v2, v3}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 117
    :goto_0
    iget-object v3, p1, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->itemView:Landroid/view/View;

    new-instance v4, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, v1, v0}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;ILcom/coleta/ambientuus/dto/PontoColeta;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 94
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$layout;->item_ponto_coleta:I

    .line 95
    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 96
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method

.method public setOnItemSelectListener(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;)V
    .locals 0
    .param p1, "onItemSelectListener"    # Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;

    .line 33
    iput-object p1, p0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->onItemSelectListener:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;

    return-void
.end method

.method public setStatusBackground(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;Ljava/lang/String;)V
    .locals 9
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;
    .param p2, "status"    # Ljava/lang/String;

    .line 182
    iget-object v0, p1, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroidx/cardview/widget/CardView;

    .line 183
    .local v0, "item":Landroidx/cardview/widget/CardView;
    const-string v1, "#DFF6EC"

    .line 184
    .local v1, "corFundoPendente":Ljava/lang/String;
    const-string v2, "#0a8a71"

    .line 186
    .local v2, "corTextPendente":Ljava/lang/String;
    const-string v3, "#FFF9E5"

    .line 187
    .local v3, "corFundoEditavel":Ljava/lang/String;
    const-string v4, "#B07C00"

    .line 189
    .local v4, "corTextEditavel":Ljava/lang/String;
    const-string v5, "#F0F0F0"

    .line 190
    .local v5, "corFundoColetado":Ljava/lang/String;
    const-string v6, "#6E6E6E"

    .line 192
    .local v6, "corTextColetado":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v7, "100"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v7, 0x1

    goto :goto_1

    :sswitch_1
    const-string v7, "000"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v7, 0x0

    goto :goto_1

    :goto_0
    const/4 v7, -0x1

    :goto_1
    packed-switch v7, :pswitch_data_0

    .line 216
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v0, v7}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 217
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvNomeCliente(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 218
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvEndereco(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 219
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvMtr(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 220
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvDestinador(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 221
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvResiduo(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 222
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvPeriodicidade(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 223
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvVolumesLabel(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 224
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvVolumes(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_2

    .line 205
    :pswitch_0
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v0, v7}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 206
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvNomeCliente(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 207
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvEndereco(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 208
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvMtr(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 209
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvDestinador(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 210
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvResiduo(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 211
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvPeriodicidade(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 212
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvVolumesLabel(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvVolumes(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 214
    goto :goto_2

    .line 194
    :pswitch_1
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v0, v7}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 195
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvNomeCliente(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvEndereco(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 197
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvMtr(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 198
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvDestinador(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 199
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvResiduo(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 200
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvPeriodicidade(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 201
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvVolumesLabel(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 202
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvVolumes(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 203
    nop

    .line 226
    :goto_2
    return-void

    :sswitch_data_0
    .sparse-switch
        0xba30 -> :sswitch_1
        0xbdf1 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setTextsData(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;Lcom/coleta/ambientuus/dto/PontoColeta;)V
    .locals 5
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;
    .param p2, "pontoColeta"    # Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 138
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvNomeCliente(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getCodCliente()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getRazaoSocial()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 138
    const-string v2, "Cliente: "

    invoke-direct {p0, v2, v1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvEndereco(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    .line 141
    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getEndereco()Ljava/lang/String;

    move-result-object v1

    .line 140
    const-string v2, "Endere\u00e7o: "

    invoke-direct {p0, v2, v1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    const-string v0, "N"

    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteEmiteMtr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 143
    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "numeroManifesto":Ljava/lang/String;
    const-string v1, "DC"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 145
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvMtr(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, "MTR: "

    invoke-direct {p0, v2, v0}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 148
    :cond_0
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvMtr(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v2

    .line 149
    const-string v3, ""

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 148
    const-string v3, "DC: "

    invoke-direct {p0, v3, v1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .end local v0    # "numeroManifesto":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 151
    :cond_1
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvMtr(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "Cliente MTR"

    invoke-static {v1}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextBold(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    :goto_1
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvDestinador(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    .line 154
    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getDestino()Ljava/lang/String;

    move-result-object v1

    .line 153
    const-string v2, "Destinador: "

    invoke-direct {p0, v2, v1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvPeriodicidade(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    .line 157
    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getPeriodicidade()Ljava/lang/String;

    move-result-object v1

    .line 156
    const-string v2, "Periodicidade: "

    invoke-direct {p0, v2, v1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getTipoResiduo()Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, "tipoResiduo":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ","

    const-string v4, "\n"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 161
    .local v2, "volumes":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 163
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvResiduo(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    const-string v3, "Res\u00edduo: "

    invoke-direct {p0, v3, v0}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    invoke-static {p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;->-$$Nest$fgettvVolumes(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    return-void
.end method
