.class public Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;
.super Landroid/widget/ArrayAdapter;
.source "ColetasADMAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Lcom/coleta/ambientuus/dto/Coleta;",
        ">;"
    }
.end annotation


# instance fields
.field private final mInflater:Landroid/view/LayoutInflater;

.field private final mViewResourceId:I

.field private final users:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/ArrayList;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "textViewResourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;)V"
        }
    .end annotation

    .line 23
    .local p3, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Coleta;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 24
    iput-object p3, p0, Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;->users:Ljava/util/ArrayList;

    .line 25
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 26
    iput p2, p0, Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;->mViewResourceId:I

    .line 28
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 16
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 32
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v2, v0, Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;->mViewResourceId:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 33
    .end local p2    # "convertView":Landroid/view/View;
    .local v1, "convertView":Landroid/view/View;
    iget-object v2, v0, Lcom/coleta/ambientuus/adapters/ColetasADMAdapter;->users:Ljava/util/ArrayList;

    move/from16 v3, p1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/dto/Coleta;

    .line 34
    .local v2, "user":Lcom/coleta/ambientuus/dto/Coleta;
    if-eqz v2, :cond_9

    .line 35
    sget v4, Lcom/coleta/ambientuus/R$id;->textPeso:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 36
    .local v4, "peso":Landroid/widget/TextView;
    sget v5, Lcom/coleta/ambientuus/R$id;->textNrMTR:I

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 37
    .local v5, "numeroMTR":Landroid/widget/TextView;
    sget v6, Lcom/coleta/ambientuus/R$id;->textDataHora:I

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 38
    .local v6, "data_hora":Landroid/widget/TextView;
    sget v7, Lcom/coleta/ambientuus/R$id;->textBombona:I

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 39
    .local v7, "bombonas":Landroid/widget/TextView;
    sget v8, Lcom/coleta/ambientuus/R$id;->textRecebeDadosExtra:I

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 40
    .local v8, "recebeDadosExtra":Landroid/widget/TextView;
    sget v9, Lcom/coleta/ambientuus/R$id;->textIdRota:I

    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 41
    .local v9, "idRota":Landroid/widget/TextView;
    sget v10, Lcom/coleta/ambientuus/R$id;->textEnviado:I

    invoke-virtual {v1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 42
    .local v10, "enviarSN":Landroid/widget/TextView;
    if-eqz v4, :cond_0

    .line 43
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "kg"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    :cond_0
    if-eqz v5, :cond_1

    .line 46
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getNumero_mtr()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    :cond_1
    if-eqz v6, :cond_2

    .line 49
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getData_coleta()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    :cond_2
    if-eqz v7, :cond_3

    .line 52
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getDescVolume()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    :cond_3
    const-string v11, "S"

    if-eqz v8, :cond_6

    .line 55
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getCliente_ausente()Ljava/lang/String;

    move-result-object v12

    .line 56
    .local v12, "cl_ausente":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_extra()Ljava/lang/String;

    move-result-object v13

    .line 57
    .local v13, "cl_extra":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_sem_residuo()Ljava/lang/String;

    move-result-object v14

    .line 58
    .local v14, "cl_sem_residuo":Ljava/lang/String;
    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 59
    const-string v15, "CLIENTE AUSENTE"

    invoke-virtual {v8, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 60
    :cond_4
    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 61
    const-string v15, "COLETA EXTRA"

    invoke-virtual {v8, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 62
    :cond_5
    invoke-virtual {v14, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 63
    const-string v15, "COLETA SEM RESIDUOS"

    invoke-virtual {v8, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .end local v12    # "cl_ausente":Ljava/lang/String;
    .end local v13    # "cl_extra":Ljava/lang/String;
    .end local v14    # "cl_sem_residuo":Ljava/lang/String;
    :cond_6
    :goto_0
    if-eqz v9, :cond_7

    .line 67
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "ID ROTA:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getId_rota()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    :cond_7
    if-eqz v10, :cond_9

    .line 70
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getEnviado()Ljava/lang/String;

    move-result-object v12

    .line 72
    .local v12, "foiEnviado":Ljava/lang/String;
    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 73
    const-string v11, "ENVIADO JSON"

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 75
    :cond_8
    const-string v11, "N"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 76
    const-string v11, "N\u00c3O ENVIADO JSON"

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .end local v4    # "peso":Landroid/widget/TextView;
    .end local v5    # "numeroMTR":Landroid/widget/TextView;
    .end local v6    # "data_hora":Landroid/widget/TextView;
    .end local v7    # "bombonas":Landroid/widget/TextView;
    .end local v8    # "recebeDadosExtra":Landroid/widget/TextView;
    .end local v9    # "idRota":Landroid/widget/TextView;
    .end local v10    # "enviarSN":Landroid/widget/TextView;
    .end local v12    # "foiEnviado":Ljava/lang/String;
    :cond_9
    :goto_1
    return-object v1
.end method
