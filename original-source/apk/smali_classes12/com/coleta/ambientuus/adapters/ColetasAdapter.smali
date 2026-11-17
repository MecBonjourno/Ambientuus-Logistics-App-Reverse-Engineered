.class public Lcom/coleta/ambientuus/adapters/ColetasAdapter;
.super Landroid/widget/ArrayAdapter;
.source "ColetasAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Lcom/coleta/ambientuus/dto/Coleta;",
        ">;"
    }
.end annotation


# instance fields
.field private coletas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;

.field private mViewResourceId:I


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

    .line 31
    .local p3, "coletas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Coleta;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 32
    iput-object p3, p0, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->coletas:Ljava/util/ArrayList;

    .line 33
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 34
    iput p2, p0, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->mViewResourceId:I

    .line 36
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 17
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 40
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v2, v0, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->mViewResourceId:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 41
    .end local p2    # "convertView":Landroid/view/View;
    .local v1, "convertView":Landroid/view/View;
    iget-object v2, v0, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->coletas:Ljava/util/ArrayList;

    move/from16 v3, p1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/dto/Coleta;

    .line 42
    .local v2, "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    if-eqz v2, :cond_10

    .line 43
    sget v4, Lcom/coleta/ambientuus/R$id;->textPeso:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 44
    .local v4, "peso":Landroid/widget/TextView;
    sget v5, Lcom/coleta/ambientuus/R$id;->textPesoLiquido:I

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 45
    .local v5, "pesoLquido":Landroid/widget/TextView;
    sget v6, Lcom/coleta/ambientuus/R$id;->textNrMTR:I

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 46
    .local v6, "numeroMTR":Landroid/widget/TextView;
    sget v7, Lcom/coleta/ambientuus/R$id;->textCliente:I

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 47
    .local v7, "codCliente":Landroid/widget/TextView;
    sget v8, Lcom/coleta/ambientuus/R$id;->textDataHora:I

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 48
    .local v8, "data_hora":Landroid/widget/TextView;
    sget v9, Lcom/coleta/ambientuus/R$id;->textBombona:I

    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 49
    .local v9, "bombonas":Landroid/widget/TextView;
    sget v10, Lcom/coleta/ambientuus/R$id;->textRecebeDadosExtra:I

    invoke-virtual {v1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 50
    .local v10, "recebeDadosExtra":Landroid/widget/TextView;
    sget v11, Lcom/coleta/ambientuus/R$id;->textEtiqueta:I

    invoke-virtual {v1, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 51
    .local v11, "Etiqueta":Landroid/widget/TextView;
    sget v12, Lcom/coleta/ambientuus/R$id;->tvHdIdCliente:I

    invoke-virtual {v1, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 53
    .local v12, "IdHdCliente":Landroid/widget/TextView;
    if-eqz v4, :cond_0

    .line 54
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 56
    const-string v13, "0,00"

    invoke-virtual {v4, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    :cond_0
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getId_volume()I

    move-result v13

    const-string v14, "Peso L\u00edquido: 0,00"

    if-eqz v13, :cond_4

    .line 61
    if-eqz v4, :cond_3

    if-eqz v5, :cond_3

    .line 62
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_2

    .line 63
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v13

    const-string v14, ","

    const-string v15, "."

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v13

    .line 64
    .local v13, "f1":F
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso_liquido()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_1

    .line 65
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso_liquido()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v14

    .line 66
    .local v14, "f2":F
    new-instance v15, Ljava/text/DecimalFormat;

    const-string v0, "0.00"

    invoke-direct {v15, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 67
    .local v15, "df":Ljava/text/DecimalFormat;
    sub-float v0, v13, v14

    .line 68
    .local v0, "resultado":F
    move-object/from16 p2, v2

    .end local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .local p2, "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Peso L\u00edquido: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v16, v4

    .end local v4    # "peso":Landroid/widget/TextView;
    .local v16, "peso":Landroid/widget/TextView;
    float-to-double v3, v0

    invoke-virtual {v15, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 64
    .end local v0    # "resultado":F
    .end local v14    # "f2":F
    .end local v15    # "df":Ljava/text/DecimalFormat;
    .end local v16    # "peso":Landroid/widget/TextView;
    .end local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local v4    # "peso":Landroid/widget/TextView;
    :cond_1
    move-object/from16 p2, v2

    move-object/from16 v16, v4

    .line 70
    .end local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .end local v4    # "peso":Landroid/widget/TextView;
    .end local v13    # "f1":F
    .restart local v16    # "peso":Landroid/widget/TextView;
    .restart local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    :goto_0
    goto :goto_1

    .line 71
    .end local v16    # "peso":Landroid/widget/TextView;
    .end local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local v4    # "peso":Landroid/widget/TextView;
    :cond_2
    move-object/from16 p2, v2

    move-object/from16 v16, v4

    .end local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .end local v4    # "peso":Landroid/widget/TextView;
    .restart local v16    # "peso":Landroid/widget/TextView;
    .restart local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    invoke-virtual {v5, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 61
    .end local v16    # "peso":Landroid/widget/TextView;
    .end local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local v4    # "peso":Landroid/widget/TextView;
    :cond_3
    move-object/from16 p2, v2

    move-object/from16 v16, v4

    .end local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .end local v4    # "peso":Landroid/widget/TextView;
    .restart local v16    # "peso":Landroid/widget/TextView;
    .restart local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    goto :goto_1

    .line 75
    .end local v16    # "peso":Landroid/widget/TextView;
    .end local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local v4    # "peso":Landroid/widget/TextView;
    :cond_4
    move-object/from16 p2, v2

    move-object/from16 v16, v4

    .end local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .end local v4    # "peso":Landroid/widget/TextView;
    .restart local v16    # "peso":Landroid/widget/TextView;
    .restart local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    invoke-virtual {v5, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    :goto_1
    if-eqz v6, :cond_5

    .line 79
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getNumero_mtr()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    :cond_5
    if-eqz v8, :cond_6

    .line 82
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getData_coleta()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    :cond_6
    if-eqz v9, :cond_7

    .line 85
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getDescVolume()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getDescVolume()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7

    .line 87
    const-string v0, "SEM BOMBONA"

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    :cond_7
    if-eqz v7, :cond_9

    .line 91
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getId_cliente_mtr()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 92
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual/range {p0 .. p0}, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 93
    .local v0, "databaseHelper":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v2, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 94
    .local v2, "clienteMTRTableManager":Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getId_cliente_mtr()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->getClienteMTRCod(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v3

    .line 95
    .local v3, "clienteMTRCod":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_8

    move-object v4, v3

    goto :goto_2

    :cond_8
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getId_cliente_mtr()Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 96
    .end local v3    # "clienteMTRCod":Ljava/lang/String;
    .local v4, "clienteMTRCod":Ljava/lang/String;
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Cliente "

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 97
    .local v3, "codClienteText":Ljava/lang/String;
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getId_cliente_mtr()Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .end local v0    # "databaseHelper":Lcom/coleta/ambientuus/database/DatabaseHelper;
    .end local v2    # "clienteMTRTableManager":Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;
    .end local v3    # "codClienteText":Ljava/lang/String;
    .end local v4    # "clienteMTRCod":Ljava/lang/String;
    :cond_9
    const/16 v0, 0x8

    if-eqz v10, :cond_d

    .line 102
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getCliente_ausente()Ljava/lang/String;

    move-result-object v2

    .line 103
    .local v2, "cl_ausente":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_extra()Ljava/lang/String;

    move-result-object v3

    .line 104
    .local v3, "cl_extra":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_sem_residuo()Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, "cl_sem_residuo":Ljava/lang/String;
    const-string v13, "N"

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    invoke-virtual {v4, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 106
    const-string v13, "#C9FFCE"

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v1, v13}, Landroid/view/View;->setBackgroundColor(I)V

    .line 107
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3

    .line 108
    :cond_a
    const-string v13, "S"

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b

    .line 109
    const-string v13, "CLIENTE AUSENTE"

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    const-string v13, "#FF665A"

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v1, v13}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_3

    .line 111
    :cond_b
    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c

    .line 112
    const-string v13, "COLETA EXTRA"

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    const-string v13, "#66D170"

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v1, v13}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_3

    .line 114
    :cond_c
    invoke-virtual {v4, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 115
    const-string v13, "COLETA SEM RESIDUOS"

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    const-string v13, "#FFF587"

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v1, v13}, Landroid/view/View;->setBackgroundColor(I)V

    .line 119
    .end local v2    # "cl_ausente":Ljava/lang/String;
    .end local v3    # "cl_extra":Ljava/lang/String;
    .end local v4    # "cl_sem_residuo":Ljava/lang/String;
    :cond_d
    :goto_3
    invoke-virtual/range {p2 .. p2}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_Etiqueta()Ljava/lang/String;

    move-result-object v2

    .line 120
    .local v2, "etiqueta":Ljava/lang/String;
    if-nez v2, :cond_e

    .line 121
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_4

    .line 122
    :cond_e
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_f

    .line 123
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 125
    :cond_f
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Etiqueta: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 126
    .end local v2    # "etiqueta":Ljava/lang/String;
    .local v0, "etiqueta":Ljava/lang/String;
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 42
    .end local v0    # "etiqueta":Ljava/lang/String;
    .end local v5    # "pesoLquido":Landroid/widget/TextView;
    .end local v6    # "numeroMTR":Landroid/widget/TextView;
    .end local v7    # "codCliente":Landroid/widget/TextView;
    .end local v8    # "data_hora":Landroid/widget/TextView;
    .end local v9    # "bombonas":Landroid/widget/TextView;
    .end local v10    # "recebeDadosExtra":Landroid/widget/TextView;
    .end local v11    # "Etiqueta":Landroid/widget/TextView;
    .end local v12    # "IdHdCliente":Landroid/widget/TextView;
    .end local v16    # "peso":Landroid/widget/TextView;
    .end local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .local v2, "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    :cond_10
    move-object/from16 p2, v2

    .line 128
    .end local v2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    .restart local p2    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    :goto_5
    return-object v1
.end method
