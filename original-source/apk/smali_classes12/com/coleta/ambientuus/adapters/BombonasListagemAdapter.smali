.class public Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;
.super Landroid/widget/ArrayAdapter;
.source "BombonasListagemAdapter.java"

# interfaces
.implements Landroid/widget/Filterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Lcom/coleta/ambientuus/dto/Bombona;",
        ">;",
        "Landroid/widget/Filterable;"
    }
.end annotation


# instance fields
.field private bombonas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Bombona;",
            ">;"
        }
    .end annotation
.end field

.field private layoutInflater:Landroid/view/LayoutInflater;

.field private myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private resourceID:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/ArrayList;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resource"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Bombona;",
            ">;)V"
        }
    .end annotation

    .line 28
    .local p3, "bombonas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Bombona;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 29
    iput-object p3, p0, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;->bombonas:Ljava/util/ArrayList;

    .line 30
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    .line 31
    iput p2, p0, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;->resourceID:I

    .line 32
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "pos"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 35
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;->resourceID:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 36
    iget-object v0, p0, Lcom/coleta/ambientuus/adapters/BombonasListagemAdapter;->bombonas:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/Bombona;

    .line 38
    .local v0, "bombona":Lcom/coleta/ambientuus/dto/Bombona;
    if-eqz v0, :cond_4

    .line 39
    sget v1, Lcom/coleta/ambientuus/R$id;->tv_CodBarrasBombona_LR:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 40
    .local v1, "tv_CodBarrasBombona_LR":Landroid/widget/TextView;
    sget v2, Lcom/coleta/ambientuus/R$id;->tv_StatusBombona:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 41
    .local v2, "tv_StatusBombonas":Landroid/widget/TextView;
    sget v3, Lcom/coleta/ambientuus/R$id;->tv_Capacidade_LR:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 44
    .local v3, "tv_Capacidade_LR":Landroid/widget/TextView;
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Bombona;->getCOD_BARRAS()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    .line 45
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Bombona;->getCOD_BARRAS()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Bombona;->getCapacidade()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Bombona;->getStatus()Ljava/lang/String;

    move-result-object v4

    .line 49
    .local v4, "Status":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 50
    const-string v4, "DISPONIVEL"

    .line 52
    :cond_0
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    const-string v5, "DISPONIVEL"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 54
    const-string v5, "#537d4f"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    :cond_1
    const-string v5, "EM CLIENTE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 57
    const-string v5, "#f0b354"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    :cond_2
    const-string v5, "COLETADO"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 60
    const-string v5, "#3e9cca"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    :cond_3
    const-string v5, "EM TERCEIRO"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 63
    const-string v5, "#d74920"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    .end local v1    # "tv_CodBarrasBombona_LR":Landroid/widget/TextView;
    .end local v2    # "tv_StatusBombonas":Landroid/widget/TextView;
    .end local v3    # "tv_Capacidade_LR":Landroid/widget/TextView;
    .end local v4    # "Status":Ljava/lang/String;
    :cond_4
    return-object p2
.end method
