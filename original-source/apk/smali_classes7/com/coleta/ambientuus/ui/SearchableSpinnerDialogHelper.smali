.class public Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
.super Ljava/lang/Object;
.source "SearchableSpinnerDialogHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    .local p0, "this":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$showDialog$0(Landroid/widget/ArrayAdapter;Landroid/widget/TextView;Ljava/util/function/Function;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;Landroid/app/Dialog;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p0, "adapter"    # Landroid/widget/ArrayAdapter;
    .param p1, "targetView"    # Landroid/widget/TextView;
    .param p2, "itemToString"    # Ljava/util/function/Function;
    .param p3, "listener"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;
    .param p4, "dialog"    # Landroid/app/Dialog;
    .param p5, "parent"    # Landroid/widget/AdapterView;
    .param p6, "view"    # Landroid/view/View;
    .param p7, "position"    # I
    .param p8, "id"    # J

    .line 128
    invoke-virtual {p0, p7}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    .line 129
    .local v0, "selected":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_1

    .line 130
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_0

    .line 131
    invoke-interface {p2, v0}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    :cond_0
    invoke-interface {p3, v0}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;->onItemSelected(Ljava/lang/Object;)V

    .line 135
    :cond_1
    invoke-virtual {p4}, Landroid/app/Dialog;->dismiss()V

    .line 136
    return-void
.end method


# virtual methods
.method public showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V
    .locals 18
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "title"    # Ljava/lang/String;
    .param p5, "targetView"    # Landroid/widget/TextView;
    .param p6, "InitValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/lang/String;",
            "Ljava/util/function/Function<",
            "TT;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/widget/TextView;",
            "Ljava/lang/String;",
            "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener<",
            "TT;>;)V"
        }
    .end annotation

    .line 45
    .local p0, "this":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<TT;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p4, "itemToString":Ljava/util/function/Function;, "Ljava/util/function/Function<TT;Ljava/lang/String;>;"
    .local p7, "listener":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener<TT;>;"
    move-object/from16 v2, p1

    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    move-object v8, v0

    .line 47
    .local v8, "dialog":Landroid/app/Dialog;
    sget v0, Lcom/coleta/ambientuus/R$layout;->dialog_searchable_spinner:I

    invoke-virtual {v8, v0}, Landroid/app/Dialog;->setContentView(I)V

    .line 49
    const-string v0, "window"

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/view/WindowManager;

    .line 50
    .local v9, "wm":Landroid/view/WindowManager;
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    move-object v10, v0

    .line 51
    .local v10, "metrics":Landroid/util/DisplayMetrics;
    invoke-interface {v9}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 52
    iget v11, v10, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 53
    .local v11, "screenWidth":I
    int-to-double v0, v11

    const-wide v3, 0x3fe999999999999aL    # 0.8

    mul-double/2addr v0, v3

    double-to-int v12, v0

    .line 54
    .local v12, "dialogWidth":I
    iget v13, v10, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 55
    .local v13, "screenHeight":I
    int-to-double v0, v13

    mul-double/2addr v0, v3

    double-to-int v14, v0

    .line 56
    .local v14, "dialogHeight":I
    invoke-virtual {v8}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/Window;

    invoke-virtual {v0, v12, v14}, Landroid/view/Window;->setLayout(II)V

    .line 58
    invoke-virtual {v8}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 60
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    sget v0, Lcom/coleta/ambientuus/R$id;->tvTituloSpinner:I

    invoke-virtual {v8, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 62
    .local v0, "dialogTitleTextView":Landroid/widget/TextView;
    move-object/from16 v15, p3

    invoke-virtual {v0, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .end local v0    # "dialogTitleTextView":Landroid/widget/TextView;
    goto :goto_0

    .line 64
    :cond_0
    move-object/from16 v15, p3

    sget v0, Lcom/coleta/ambientuus/R$id;->tvTituloSpinner:I

    invoke-virtual {v8, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 65
    .restart local v0    # "dialogTitleTextView":Landroid/widget/TextView;
    const-string v1, "Selecione"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .end local v0    # "dialogTitleTextView":Landroid/widget/TextView;
    :goto_0
    invoke-virtual {v8}, Landroid/app/Dialog;->show()V

    .line 70
    sget v0, Lcom/coleta/ambientuus/R$id;->etPesquisarDialog:I

    invoke-virtual {v8, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 71
    .local v0, "etPesquisarDialog":Landroid/widget/EditText;
    sget v1, Lcom/coleta/ambientuus/R$id;->listViewDialog:I

    invoke-virtual {v8, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 74
    .local v1, "listViewDialog":Landroid/widget/ListView;
    move-object v3, v0

    .end local v0    # "etPesquisarDialog":Landroid/widget/EditText;
    .local v3, "etPesquisarDialog":Landroid/widget/EditText;
    new-instance v0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;

    move-object v4, v3

    .end local v3    # "etPesquisarDialog":Landroid/widget/EditText;
    .local v4, "etPesquisarDialog":Landroid/widget/EditText;
    const v3, 0x1090003

    move-object/from16 v5, p1

    move-object/from16 v6, p4

    move-object/from16 v7, p6

    move-object/from16 v16, v8

    move-object/from16 v17, v9

    move-object v9, v1

    move-object v8, v4

    move-object/from16 v1, p0

    move-object/from16 v4, p2

    .end local v1    # "listViewDialog":Landroid/widget/ListView;
    .end local v4    # "etPesquisarDialog":Landroid/widget/EditText;
    .local v8, "etPesquisarDialog":Landroid/widget/EditText;
    .local v9, "listViewDialog":Landroid/widget/ListView;
    .local v16, "dialog":Landroid/app/Dialog;
    .local v17, "wm":Landroid/view/WindowManager;
    invoke-direct/range {v0 .. v7}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;-><init>(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Landroid/content/Context;ILjava/util/List;Landroid/content/Context;Ljava/util/function/Function;Ljava/lang/String;)V

    move-object v2, v0

    .line 115
    .local v2, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<TT;>;"
    invoke-virtual {v9, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 118
    new-instance v0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;

    move-object/from16 v7, p0

    invoke-direct {v0, v7, v2}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;-><init>(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Landroid/widget/ArrayAdapter;)V

    invoke-virtual {v8, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 127
    new-instance v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;

    move-object/from16 v4, p4

    move-object/from16 v3, p5

    move-object/from16 v5, p7

    move-object/from16 v6, v16

    .end local v16    # "dialog":Landroid/app/Dialog;
    .local v6, "dialog":Landroid/app/Dialog;
    invoke-direct/range {v1 .. v6}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;-><init>(Landroid/widget/ArrayAdapter;Landroid/widget/TextView;Ljava/util/function/Function;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;Landroid/app/Dialog;)V

    .end local v6    # "dialog":Landroid/app/Dialog;
    .restart local v16    # "dialog":Landroid/app/Dialog;
    invoke-virtual {v9, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 137
    return-void
.end method
