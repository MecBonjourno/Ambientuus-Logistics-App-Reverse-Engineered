.class public Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "EtiquetaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final etiquetas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$KJ1bLN02X86boIZyiHcQmBszGEs(Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;ILandroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->lambda$onBindViewHolder$2(Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$p6HttWROHhYHKPD5b8UePRzBokY(Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;ILcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->lambda$onBindViewHolder$0(ILcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;)V"
        }
    .end annotation

    .line 25
    .local p1, "etiquetas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->etiquetas:Ljava/util/List;

    .line 27
    return-void
.end method

.method private synthetic lambda$onBindViewHolder$0(ILcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "position"    # I
    .param p2, "holder"    # Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .line 61
    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    .line 62
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/Etiqueta;

    .line 63
    .local v0, "etiquetaExclusao":Lcom/coleta/ambientuus/dto/Etiqueta;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    new-instance v2, Lcom/coleta/ambientuus/database/DatabaseHelper;

    iget-object v3, p2, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 64
    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 65
    .local v1, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Etiqueta;->getId_etiqueta()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->deleteEtiqueta(Ljava/lang/Integer;)V

    .line 66
    iget-object v2, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 67
    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->notifyItemRemoved(I)V

    .line 68
    iget-object v2, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p0, p1, v2}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->notifyItemRangeChanged(II)V

    .line 69
    return-void
.end method

.method static synthetic lambda$onBindViewHolder$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 72
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    .line 73
    return-void
.end method

.method private synthetic lambda$onBindViewHolder$2(Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;ILandroid/view/View;)V
    .locals 4
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;
    .param p2, "position"    # I
    .param p3, "v"    # Landroid/view/View;

    .line 56
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p1, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 57
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    const-string v1, "Deseja excluir a etiqueta?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 58
    const-string v1, "Deseja deletar a etiqueta vinculada ao Manifesto?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 59
    new-instance v1, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2, p1}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;ILcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;)V

    const/4 v2, -0x1

    const-string v3, "Sim"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 70
    new-instance v1, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$$ExternalSyntheticLambda1;-><init>()V

    const/4 v2, -0x2

    const-string v3, "N\u00e3o"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 74
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 75
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 21
    check-cast p1, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->onBindViewHolder(Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;
    .param p2, "position"    # I

    .line 52
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->etiquetas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/Etiqueta;

    .line 53
    .local v0, "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    iget-object v1, p1, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;->tvEtiqueta:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    iget-object v1, p1, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;->btnExcluir:Landroid/widget/ImageButton;

    new-instance v2, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, p1, p2}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;I)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 45
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$layout;->item_etiqueta:I

    .line 46
    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 47
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method
