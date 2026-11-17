.class public Lcom/coleta/ambientuus/activities/ListagemColetasActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ListagemColetasActivity.java"


# instance fields
.field private MTR_DC:Ljava/lang/String;

.field adapterDC:Lcom/coleta/ambientuus/adapters/ColetasAdapter;

.field adapterMTR:Lcom/coleta/ambientuus/adapters/ColetasAdapter;

.field private clienteSel:Ljava/lang/String;

.field private coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

.field private dialog:Landroidx/appcompat/app/AlertDialog;

.field private idListViewDC:I

.field private idListViewHolderMenu:I

.field private idListViewMTR:I

.field listViewDC:Landroid/widget/ListView;

.field listViewMTR:Landroid/widget/ListView;

.field myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private numeroMtrSel:Ljava/lang/String;

.field private tvNroDC:Landroid/widget/TextView;

.field private tvNroMtr:Landroid/widget/TextView;

.field private tvPesoDC:Landroid/widget/TextView;

.field private tvPesoMtr:Landroid/widget/TextView;

.field userDC:Lcom/coleta/ambientuus/dto/Coleta;

.field userListDC:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation
.end field

.field userListMTR:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation
.end field

.field userMTR:Lcom/coleta/ambientuus/dto/Coleta;


# direct methods
.method public static synthetic $r8$lambda$6cOcro7aDYc-ZYZ0xdPVZZewClU(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->lambda$onCreate$1(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method public static synthetic $r8$lambda$xVS3eyFTtS6Ql4W2gWXtgWuVIFQ(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->lambda$onCreate$0(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetdialog(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;)Landroidx/appcompat/app/AlertDialog;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private synthetic lambda$onCreate$0(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p1, "arg0"    # Landroid/widget/AdapterView;
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "arg3"    # J

    .line 112
    sget v0, Lcom/coleta/ambientuus/R$id;->textNrMTR:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->numeroMtrSel:Ljava/lang/String;

    .line 113
    sget v0, Lcom/coleta/ambientuus/R$id;->tvHdIdCliente:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->clienteSel:Ljava/lang/String;

    .line 114
    const-string v0, "MTR"

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->MTR_DC:Ljava/lang/String;

    .line 115
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->createDialogGroup()V

    .line 116
    return-void
.end method

.method private synthetic lambda$onCreate$1(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p1, "arg0"    # Landroid/widget/AdapterView;
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "arg3"    # J

    .line 151
    sget v0, Lcom/coleta/ambientuus/R$id;->textNrMTR:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->numeroMtrSel:Ljava/lang/String;

    .line 152
    sget v0, Lcom/coleta/ambientuus/R$id;->tvHdIdCliente:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->clienteSel:Ljava/lang/String;

    .line 153
    const-string v0, "DC"

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->MTR_DC:Ljava/lang/String;

    .line 154
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->createDialogGroup()V

    .line 155
    return-void
.end method

.method private parametrosDimensoes(Landroid/content/Context;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;

    .line 300
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 301
    .local v0, "displayMetricsH":Landroid/util/DisplayMetrics;
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    iget v2, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    .line 302
    .local v1, "screenHeightDpH":F
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, -0x4b

    .line 305
    .local v2, "heigthElmt":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 306
    .local v3, "displayMetricsW":Landroid/util/DisplayMetrics;
    iget v4, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v4, v4

    iget v5, v3, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v4, v5

    .line 307
    .local v4, "screenHeightDpW":F
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 310
    .local v5, "widthElmt":I
    int-to-float v6, v2

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    const/4 v8, 0x1

    invoke-static {v8, v6, v7}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v6

    float-to-int v6, v6

    .line 311
    .local v6, "heightPx":I
    int-to-float v7, v5

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    invoke-static {v8, v7, v9}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    .line 314
    .local v7, "widthPx":I
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 316
    .local v8, "params":Landroid/view/ViewGroup$LayoutParams;
    iget-object v9, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewMTR:Landroid/widget/ListView;

    invoke-virtual {v9, v8}, Landroid/widget/ListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 317
    iget-object v9, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewDC:Landroid/widget/ListView;

    invoke-virtual {v9, v8}, Landroid/widget/ListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 318
    return-void
.end method


# virtual methods
.method public createDialogGroup()V
    .locals 19

    .line 242
    move-object/from16 v0, p0

    new-instance v1, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 243
    .local v1, "dialogBuilder":Landroidx/appcompat/app/AlertDialog$Builder;
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/coleta/ambientuus/R$layout;->popup_total_peso:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 245
    .local v2, "senhaPopupView":Landroid/view/View;
    sget v3, Lcom/coleta/ambientuus/R$id;->NroMtrGroup:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 246
    .local v3, "NroMtrGroup":Landroid/widget/TextView;
    sget v4, Lcom/coleta/ambientuus/R$id;->pesoBrutoGroup:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 247
    .local v4, "pesoBrutoGroup":Landroid/widget/TextView;
    sget v5, Lcom/coleta/ambientuus/R$id;->pesoLiqGroup:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 248
    .local v5, "pesoLiqGroup":Landroid/widget/TextView;
    sget v6, Lcom/coleta/ambientuus/R$id;->contadorGroup:I

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 249
    .local v6, "contadorGroup":Landroid/widget/TextView;
    sget v7, Lcom/coleta/ambientuus/R$id;->clienteMTRGroup:I

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 250
    .local v7, "clienteMTRGroup":Landroid/widget/TextView;
    sget v8, Lcom/coleta/ambientuus/R$id;->fecharPopUpGroup:I

    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    .line 252
    .local v8, "btnOkGroup":Landroid/widget/Button;
    const/4 v9, 0x0

    .local v9, "totalPesoBruto":F
    const/4 v10, 0x0

    .line 253
    .local v10, "pesobrutoAux":F
    const/4 v11, 0x0

    .line 254
    .local v11, "totalPesoLiquido":F
    const/4 v12, 0x0

    .line 255
    .local v12, "contadorPesos":I
    new-instance v13, Ljava/text/DecimalFormat;

    const-string v14, "0.00"

    invoke-direct {v13, v14}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 256
    .local v13, "df":Ljava/text/DecimalFormat;
    const/4 v14, 0x0

    .line 259
    .local v14, "clienteSelInt":Ljava/lang/Integer;
    iget-object v15, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->clienteSel:Ljava/lang/String;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    .line 260
    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 261
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v15

    iput-object v15, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    .line 263
    new-instance v15, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v15, v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v15, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 264
    iget-object v15, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    move-object/from16 v16, v1

    .end local v1    # "dialogBuilder":Landroidx/appcompat/app/AlertDialog$Builder;
    .local v16, "dialogBuilder":Landroidx/appcompat/app/AlertDialog$Builder;
    iget-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->numeroMtrSel:Ljava/lang/String;

    invoke-virtual {v15, v1, v14}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->getListGrouped(Ljava/lang/String;Ljava/lang/Integer;)Landroid/database/Cursor;

    move-result-object v1

    .line 266
    .local v1, "data":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 268
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v15

    if-nez v15, :cond_0

    .line 269
    const-string v15, "peso_bruto"

    invoke-interface {v1, v15}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    invoke-interface {v1, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v17, v2

    .end local v2    # "senhaPopupView":Landroid/view/View;
    .local v17, "senhaPopupView":Landroid/view/View;
    const-string v2, ","

    move/from16 v18, v10

    .end local v10    # "pesobrutoAux":F
    .local v18, "pesobrutoAux":F
    const-string v10, "."

    invoke-virtual {v15, v2, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10

    .line 270
    .end local v18    # "pesobrutoAux":F
    .restart local v10    # "pesobrutoAux":F
    add-float/2addr v9, v10

    .line 271
    const-string v2, "tara"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v2

    sub-float v2, v10, v2

    add-float/2addr v11, v2

    .line 272
    add-int/lit8 v12, v12, 0x1

    .line 273
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-object/from16 v2, v17

    goto :goto_0

    .line 275
    .end local v17    # "senhaPopupView":Landroid/view/View;
    .restart local v2    # "senhaPopupView":Landroid/view/View;
    :cond_0
    move-object/from16 v17, v2

    move/from16 v18, v10

    .end local v2    # "senhaPopupView":Landroid/view/View;
    .end local v10    # "pesobrutoAux":F
    .restart local v17    # "senhaPopupView":Landroid/view/View;
    .restart local v18    # "pesobrutoAux":F
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 277
    iget-object v2, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->MTR_DC:Ljava/lang/String;

    const-string v10, "MRT"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 278
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "MTR: "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v10, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->numeroMtrSel:Ljava/lang/String;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 279
    :cond_1
    iget-object v2, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->MTR_DC:Ljava/lang/String;

    const-string v10, "DC"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 280
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "DC: "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v10, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->numeroMtrSel:Ljava/lang/String;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 283
    :cond_2
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Total Peso Bruto: "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object v10, v14

    .end local v14    # "clienteSelInt":Ljava/lang/Integer;
    .local v10, "clienteSelInt":Ljava/lang/Integer;
    float-to-double v14, v9

    invoke-virtual {v13, v14, v15}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 284
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Total Peso L\u00edquido: "

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    float-to-double v14, v11

    invoke-virtual {v13, v14, v15}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 285
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "QTD. Lan\u00e7amentos: "

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    iget-object v2, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->clienteSel:Ljava/lang/String;

    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 288
    iget-object v2, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v2}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 290
    new-instance v2, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$2;

    invoke-direct {v2, v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$2;-><init>(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;)V

    invoke-virtual {v8, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 9
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 185
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 187
    .local v0, "info":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sget v2, Lcom/coleta/ambientuus/R$id;->opcaodeletar:I

    if-ne v1, v2, :cond_5

    .line 188
    iget v1, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->idListViewHolderMenu:I

    iget v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->idListViewMTR:I

    const/4 v3, 0x3

    const/4 v4, 0x4

    const/4 v5, 0x1

    if-ne v1, v2, :cond_2

    .line 189
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListMTR:Ljava/util/ArrayList;

    iget v2, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_coleta()Ljava/lang/String;

    move-result-object v1

    .line 190
    .local v1, "id":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->deleteDataColeta(I)V

    .line 191
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListMTR:Ljava/util/ArrayList;

    iget v6, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 192
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->adapterMTR:Lcom/coleta/ambientuus/adapters/ColetasAdapter;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->notifyDataSetChanged()V

    .line 194
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->getAllColetasMTR()Landroid/database/Cursor;

    move-result-object v2

    .line 195
    .local v2, "dataMTR":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v6

    .line 197
    .local v6, "numRowsMTR":I
    iget-object v7, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v7}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->getAllColetasDC()Landroid/database/Cursor;

    move-result-object v7

    .line 198
    .local v7, "dataDC":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v8

    .line 200
    .local v8, "numRowsDC":I
    if-lt v6, v3, :cond_0

    if-lt v8, v5, :cond_0

    .line 201
    invoke-direct {p0, p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->parametrosDimensoes(Landroid/content/Context;)V

    goto :goto_0

    .line 202
    :cond_0
    if-nez v6, :cond_1

    .line 203
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvNroMtr:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 204
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvPesoMtr:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 207
    :cond_1
    :goto_0
    return v5

    .line 208
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "dataMTR":Landroid/database/Cursor;
    .end local v6    # "numRowsMTR":I
    .end local v7    # "dataDC":Landroid/database/Cursor;
    .end local v8    # "numRowsDC":I
    :cond_2
    iget v1, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->idListViewHolderMenu:I

    iget v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->idListViewDC:I

    if-ne v1, v2, :cond_5

    .line 209
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListDC:Ljava/util/ArrayList;

    iget v2, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_coleta()Ljava/lang/String;

    move-result-object v1

    .line 210
    .restart local v1    # "id":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->deleteDataColeta(I)V

    .line 211
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListDC:Ljava/util/ArrayList;

    iget v6, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 212
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->adapterDC:Lcom/coleta/ambientuus/adapters/ColetasAdapter;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/adapters/ColetasAdapter;->notifyDataSetChanged()V

    .line 214
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->getAllColetasDC()Landroid/database/Cursor;

    move-result-object v2

    .line 215
    .local v2, "dataDC":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v6

    .line 217
    .local v6, "numRowsDC":I
    iget-object v7, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v7}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->getAllColetasMTR()Landroid/database/Cursor;

    move-result-object v7

    .line 218
    .local v7, "dataMTR":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v8

    .line 220
    .local v8, "numRowsMTR":I
    if-lt v8, v3, :cond_3

    if-lt v6, v5, :cond_3

    .line 221
    invoke-direct {p0, p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->parametrosDimensoes(Landroid/content/Context;)V

    goto :goto_1

    .line 222
    :cond_3
    if-nez v6, :cond_4

    .line 223
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvNroDC:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 224
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvPesoDC:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 227
    :cond_4
    :goto_1
    return v5

    .line 231
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "dataDC":Landroid/database/Cursor;
    .end local v6    # "numRowsDC":I
    .end local v7    # "dataMTR":Landroid/database/Cursor;
    .end local v8    # "numRowsMTR":I
    :cond_5
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 43
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 66
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 67
    sget v1, Lcom/coleta/ambientuus/R$layout;->activity_listagem_coletas:I

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->setContentView(I)V

    .line 69
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 70
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v1

    sget v3, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v1, v3}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 72
    sget v1, Lcom/coleta/ambientuus/R$id;->txtConsultasNroMtrStaticoID:I

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvNroMtr:Landroid/widget/TextView;

    .line 73
    sget v1, Lcom/coleta/ambientuus/R$id;->txtConsultasDataHoraStaticoID:I

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvPesoMtr:Landroid/widget/TextView;

    .line 74
    sget v1, Lcom/coleta/ambientuus/R$id;->txtConsultasNroDCStaticoID:I

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvNroDC:Landroid/widget/TextView;

    .line 75
    sget v1, Lcom/coleta/ambientuus/R$id;->txtConsultasDCDataHoraStaticoID:I

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvPesoDC:Landroid/widget/TextView;

    .line 76
    sget v1, Lcom/coleta/ambientuus/R$id;->listView:I

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewMTR:Landroid/widget/ListView;

    .line 77
    sget v1, Lcom/coleta/ambientuus/R$id;->listViewDC:I

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewDC:Landroid/widget/ListView;

    .line 79
    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 80
    new-instance v1, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    iget-object v3, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    .line 82
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListMTR:Ljava/util/ArrayList;

    .line 84
    iget-object v1, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->getAllColetasMTR()Landroid/database/Cursor;

    move-result-object v1

    .line 85
    .local v1, "dataMTR":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    .line 86
    .local v3, "numRowsMTR":I
    const/16 v4, 0xd

    const/16 v5, 0xc

    const/16 v6, 0xb

    const/16 v7, 0xa

    const/16 v8, 0x8

    const/4 v9, 0x7

    const/4 v10, 0x6

    const/4 v11, 0x5

    const/4 v12, 0x2

    const/4 v13, 0x0

    const/4 v14, 0x3

    if-eqz v3, :cond_1

    .line 87
    const/16 v16, 0x0

    move/from16 v15, v16

    .line 88
    .local v15, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v16

    if-eqz v16, :cond_0

    .line 89
    new-instance v17, Lcom/coleta/ambientuus/dto/Coleta;

    invoke-interface {v1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 90
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 91
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 92
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 93
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    long-to-int v12, v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    .line 94
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 95
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 96
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v25

    .line 97
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    .line 98
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v27

    .line 99
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    .line 100
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v17 .. v29}, Lcom/coleta/ambientuus/dto/Coleta;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V

    move-object/from16 v12, v17

    iput-object v12, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userMTR:Lcom/coleta/ambientuus/dto/Coleta;

    .line 101
    iget-object v12, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListMTR:Ljava/util/ArrayList;

    iget-object v13, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userMTR:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v12, v15, v13}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 102
    add-int/lit8 v15, v15, 0x1

    const/4 v12, 0x2

    const/4 v13, 0x0

    goto :goto_0

    .line 104
    :cond_0
    new-instance v12, Lcom/coleta/ambientuus/adapters/ColetasAdapter;

    sget v13, Lcom/coleta/ambientuus/R$layout;->list_adapter_view:I

    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListMTR:Ljava/util/ArrayList;

    invoke-direct {v12, v0, v13, v4}, Lcom/coleta/ambientuus/adapters/ColetasAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;)V

    iput-object v12, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->adapterMTR:Lcom/coleta/ambientuus/adapters/ColetasAdapter;

    .line 105
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewMTR:Landroid/widget/ListView;

    iget-object v12, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->adapterMTR:Lcom/coleta/ambientuus/adapters/ColetasAdapter;

    invoke-virtual {v4, v12}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 106
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewMTR:Landroid/widget/ListView;

    invoke-virtual {v0, v4}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 107
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewMTR:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getId()I

    move-result v4

    iput v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->idListViewMTR:I

    .line 110
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewMTR:Landroid/widget/ListView;

    invoke-virtual {v4, v2}, Landroid/widget/ListView;->setClickable(Z)V

    .line 111
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewMTR:Landroid/widget/ListView;

    new-instance v12, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$$ExternalSyntheticLambda0;

    invoke-direct {v12, v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;)V

    invoke-virtual {v4, v12}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 117
    .end local v15    # "i":I
    goto :goto_1

    .line 118
    :cond_1
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvNroMtr:Landroid/widget/TextView;

    const/4 v12, 0x4

    invoke-virtual {v4, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 119
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvPesoMtr:Landroid/widget/TextView;

    invoke-virtual {v4, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 122
    :goto_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListDC:Ljava/util/ArrayList;

    .line 123
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v4}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->getAllColetasDC()Landroid/database/Cursor;

    move-result-object v4

    .line 124
    .local v4, "dataDC":Landroid/database/Cursor;
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v12

    .line 125
    .local v12, "numRowsDC":I
    if-eqz v12, :cond_3

    .line 126
    const/4 v13, 0x0

    .line 127
    .local v13, "i":I
    :goto_2
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v15

    if-eqz v15, :cond_2

    .line 128
    new-instance v30, Lcom/coleta/ambientuus/dto/Coleta;

    const/4 v15, 0x0

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v31

    .line 129
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v32

    .line 130
    const/4 v15, 0x2

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v33

    .line 131
    invoke-interface {v4, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v34

    .line 132
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    long-to-int v14, v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v35

    .line 133
    invoke-interface {v4, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v36

    .line 134
    invoke-interface {v4, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v37

    .line 135
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v38

    .line 136
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v39

    .line 137
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 138
    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v41

    .line 139
    const/16 v14, 0xd

    invoke-interface {v4, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v42

    invoke-direct/range {v30 .. v42}, Lcom/coleta/ambientuus/dto/Coleta;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V

    move-object/from16 v15, v30

    iput-object v15, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userDC:Lcom/coleta/ambientuus/dto/Coleta;

    .line 140
    iget-object v15, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListDC:Ljava/util/ArrayList;

    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userDC:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v15, v13, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 141
    add-int/lit8 v13, v13, 0x1

    const/16 v5, 0xc

    const/4 v14, 0x3

    goto :goto_2

    .line 143
    :cond_2
    new-instance v5, Lcom/coleta/ambientuus/adapters/ColetasAdapter;

    sget v6, Lcom/coleta/ambientuus/R$layout;->list_adapter_view:I

    iget-object v7, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->userListDC:Ljava/util/ArrayList;

    invoke-direct {v5, v0, v6, v7}, Lcom/coleta/ambientuus/adapters/ColetasAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;)V

    iput-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->adapterDC:Lcom/coleta/ambientuus/adapters/ColetasAdapter;

    .line 144
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewDC:Landroid/widget/ListView;

    iget-object v6, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->adapterDC:Lcom/coleta/ambientuus/adapters/ColetasAdapter;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 145
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewDC:Landroid/widget/ListView;

    invoke-virtual {v0, v5}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 146
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewDC:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getId()I

    move-result v5

    iput v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->idListViewDC:I

    .line 149
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewDC:Landroid/widget/ListView;

    invoke-virtual {v5, v2}, Landroid/widget/ListView;->setClickable(Z)V

    .line 150
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->listViewDC:Landroid/widget/ListView;

    new-instance v6, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$$ExternalSyntheticLambda1;

    invoke-direct {v6, v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;)V

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 156
    .end local v13    # "i":I
    goto :goto_3

    .line 157
    :cond_3
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvNroDC:Landroid/widget/TextView;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 158
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->tvPesoDC:Landroid/widget/TextView;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 161
    :goto_3
    if-nez v3, :cond_4

    if-nez v12, :cond_4

    .line 162
    const-string v5, "Banco de dados vazio."

    invoke-virtual {v0, v0, v5}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_4

    .line 163
    :cond_4
    const/4 v5, 0x3

    if-lt v3, v5, :cond_5

    if-lt v12, v2, :cond_5

    .line 164
    invoke-direct {v0, v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->parametrosDimensoes(Landroid/content/Context;)V

    .line 167
    :cond_5
    :goto_4
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v5

    new-instance v6, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$1;

    invoke-direct {v6, v0, v2}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$1;-><init>(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;Z)V

    invoke-virtual {v5, v0, v6}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 174
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .line 178
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 179
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$menu;->menu_context:I

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 180
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v0

    iput v0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->idListViewHolderMenu:I

    .line 181
    return-void
.end method

.method public showToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/String;

    .line 235
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 236
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 237
    return-void
.end method
