.class public Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;
.super Lcom/coleta/ambientuus/activities/main/BaseActivity;
.source "IniciarColetaExtraActivity.java"


# instance fields
.field private avulsa:Ljava/lang/Boolean;

.field private bluetoothConectado:Ljava/lang/Boolean;

.field private btnLerPeso:Landroid/widget/Button;

.field private databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private idClienteMTR:Ljava/lang/Integer;

.field private idTipoResiduo:Ljava/lang/Integer;

.field private mBTSocket:Landroid/bluetooth/BluetoothSocket;

.field private mDevice:Landroid/bluetooth/BluetoothDevice;

.field private mDeviceUUID:Ljava/util/UUID;

.field private mMaxChars:I

.field private pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

.field private radioPeso:Landroid/widget/RadioButton;

.field private radioQtd:Landroid/widget/RadioButton;

.field private readerLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private readerLauncherEtiqueta:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private smManterBombona:Landroidx/appcompat/widget/SwitchCompat;

.field private smManterNrMTR:Landroidx/appcompat/widget/SwitchCompat;

.field private tieBombona:Landroid/widget/AutoCompleteTextView;

.field private tieCliente:Landroid/widget/AutoCompleteTextView;

.field private tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

.field private tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

.field private tieObservacao:Lcom/google/android/material/textfield/TextInputEditText;

.field private tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

.field private tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

.field private tipoPesagem:Ljava/lang/String;

.field private volumes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Volume;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$20kHHV7IQfUQRgsfBeY3IU8AtyQ(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$loadDataTipoResiduo$3(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$84FRkg2Ly0ONe1bnlVGM7VELlK8(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$initButtons$6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$DQxFXBy3-SCmTZ_CekmI-tiJEQ8(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$initReader$5(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$IeuJHj5OsRJM0Lg8v-Oq2Y8MMaI(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$initButtons$8(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$NdTCJAa1fQaPq2lZC-tpcHI2hpI(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$validarCampos$11()V

    return-void
.end method

.method public static synthetic $r8$lambda$XzpyWvwy0VE6VgE5Ee4AJXzxoN8(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$initButtons$7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Y_Rh8nF6rBpBUsFYqmyuGZNWGqQ(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Lcom/coleta/ambientuus/dto/ClienteMTR;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$loadSpinnerCliente$0(Lcom/coleta/ambientuus/dto/ClienteMTR;)V

    return-void
.end method

.method public static synthetic $r8$lambda$esjHVpe5zmGHQUjO3ida2YhM8dg(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$loadSpinnerCliente$1(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$omubdc0J1MC7rUHO9i8qRMHAfNE(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$initButtons$10(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$v7t9iXnAS5p6u4e8I3h5gZ2K2Z0(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Lcom/coleta/ambientuus/dto/TipoResiduo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$loadDataTipoResiduo$2(Lcom/coleta/ambientuus/dto/TipoResiduo;)V

    return-void
.end method

.method public static synthetic $r8$lambda$vn1l2nzIgYATeZCTRyBDj6RrBSs(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$initButtons$9(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$zaFNwjqvmCdoQoKtOl82oG9xNTM(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->lambda$initReader$4(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetreaderLauncher(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->readerLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgettiePeso(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)Lcom/google/android/material/textfield/TextInputEditText;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroid/bluetooth/BluetoothSocket;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 62
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;-><init>()V

    .line 83
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 86
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->idTipoResiduo:Ljava/lang/Integer;

    .line 87
    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->idClienteMTR:Ljava/lang/Integer;

    .line 91
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mMaxChars:I

    return-void
.end method

.method private initButtons()V
    .locals 5

    .line 223
    sget v0, Lcom/coleta/ambientuus/R$id;->btnLerMTRDC:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 224
    .local v0, "btnLerMTRDC":Landroid/widget/Button;
    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 225
    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda9;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    sget v1, Lcom/coleta/ambientuus/R$id;->btnLerPeso:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->btnLerPeso:Landroid/widget/Button;

    .line 248
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->btnLerPeso:Landroid/widget/Button;

    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda10;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 263
    sget v1, Lcom/coleta/ambientuus/R$id;->btnLimpar:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 264
    .local v1, "btnLimpar":Landroid/widget/Button;
    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda11;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda11;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    sget v2, Lcom/coleta/ambientuus/R$id;->btnFinalizar:I

    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 270
    .local v2, "btnFinalizar":Landroid/widget/Button;
    new-instance v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda12;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda12;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 275
    sget v3, Lcom/coleta/ambientuus/R$id;->btnLerEtiquetaExtra:I

    invoke-virtual {p0, v3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 276
    .local v3, "btnLerEtiquetaExtra":Landroid/widget/Button;
    new-instance v4, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 280
    return-void
.end method

.method private initFields()V
    .locals 2

    .line 114
    sget v0, Lcom/coleta/ambientuus/R$id;->tieCliente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieCliente:Landroid/widget/AutoCompleteTextView;

    .line 115
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    if-eqz v0, :cond_0

    .line 116
    sget v0, Lcom/coleta/ambientuus/R$id;->clCliente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 118
    :cond_0
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->loadSpinnerCliente()V

    .line 120
    :goto_0
    sget v0, Lcom/coleta/ambientuus/R$id;->tieNroMtrDc:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    .line 121
    sget v0, Lcom/coleta/ambientuus/R$id;->smManterNrMTR:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->smManterNrMTR:Landroidx/appcompat/widget/SwitchCompat;

    .line 122
    sget v0, Lcom/coleta/ambientuus/R$id;->tiePeso:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    .line 123
    sget v0, Lcom/coleta/ambientuus/R$id;->radio_qtd:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->radioQtd:Landroid/widget/RadioButton;

    .line 124
    sget v0, Lcom/coleta/ambientuus/R$id;->radio_peso:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->radioPeso:Landroid/widget/RadioButton;

    .line 125
    sget v0, Lcom/coleta/ambientuus/R$id;->tieBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    .line 126
    sget v0, Lcom/coleta/ambientuus/R$id;->smManterBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->smManterBombona:Landroidx/appcompat/widget/SwitchCompat;

    .line 127
    sget v0, Lcom/coleta/ambientuus/R$id;->tieObservacao:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieObservacao:Lcom/google/android/material/textfield/TextInputEditText;

    .line 128
    sget v0, Lcom/coleta/ambientuus/R$id;->tieEtiquetaExtra:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    .line 129
    sget v0, Lcom/coleta/ambientuus/R$id;->tieResiduoExtra:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 130
    return-void
.end method

.method private initReader()V
    .locals 2

    .line 197
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->readerLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 210
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->readerLauncherEtiqueta:Landroidx/activity/result/ActivityResultLauncher;

    .line 220
    return-void
.end method

.method private initTipoColeta()V
    .locals 5

    .line 190
    sget v0, Lcom/coleta/ambientuus/R$id;->tvTipoColeta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 191
    .local v0, "tvTipoColeta":Landroid/widget/TextView;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tipoPesagem:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tipoPesagem:Ljava/lang/String;

    .line 192
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 193
    .local v1, "tipoPesagemTexto":Ljava/lang/String;
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    return-void
.end method

.method private synthetic lambda$initButtons$10(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 277
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 278
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->readerLauncherEtiqueta:Landroidx/activity/result/ActivityResultLauncher;

    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 279
    return-void
.end method

.method private synthetic lambda$initButtons$6(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 226
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 227
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    .line 228
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 244
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 245
    return-void
.end method

.method private synthetic lambda$initButtons$7(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 249
    new-instance v0, Lcom/coleta/ambientuus/utils/BluetoothReader;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/utils/BluetoothReader;-><init>(Landroid/bluetooth/BluetoothSocket;)V

    .line 250
    .local v0, "reader":Lcom/coleta/ambientuus/utils/BluetoothReader;
    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/utils/BluetoothReader;->startReading(Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;)V

    .line 261
    return-void
.end method

.method private synthetic lambda$initButtons$8(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 265
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->clearFields()V

    .line 266
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->initDefaultData()V

    .line 267
    return-void
.end method

.method private synthetic lambda$initButtons$9(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 271
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->saveColeta()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 272
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->finalizeColeta(Ljava/lang/Boolean;)V

    .line 273
    :cond_0
    return-void
.end method

.method private synthetic lambda$initReader$4(Landroidx/activity/result/ActivityResult;)V
    .locals 4
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 200
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_1

    .line 201
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 202
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "Erro ao retornar codigo de Barras"

    invoke-static {v0, v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 203
    const-string v1, "codigoBarras"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "codigoBarras":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 205
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xa

    if-le v2, v3, :cond_0

    .line 206
    const/4 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 207
    :cond_0
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v2, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "codigoBarras":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private synthetic lambda$initReader$5(Landroidx/activity/result/ActivityResult;)V
    .locals 3
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 213
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 214
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 215
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "Erro ao retornar codigo de Barras"

    invoke-static {v0, v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 216
    const-string v1, "codigoBarras"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 217
    .local v1, "codigoBarras":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v2, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 219
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "codigoBarras":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private synthetic lambda$loadDataTipoResiduo$2(Lcom/coleta/ambientuus/dto/TipoResiduo;)V
    .locals 1
    .param p1, "selectedItem"    # Lcom/coleta/ambientuus/dto/TipoResiduo;

    .line 175
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId_tipo_residuo()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->idTipoResiduo:Ljava/lang/Integer;

    .line 176
    return-void
.end method

.method private synthetic lambda$loadDataTipoResiduo$3(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 8
    .param p1, "helper"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .param p2, "tipoResiduos"    # Ljava/util/List;
    .param p3, "v"    # Landroid/view/View;

    .line 167
    new-instance v4, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda11;

    invoke-direct {v4}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda11;-><init>()V

    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 173
    invoke-virtual {v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda5;

    invoke-direct {v7, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda5;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    .line 167
    const-string v3, "Selecione o Tipo de Res\u00edduo"

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "tipoResiduos":Ljava/util/List;
    .local v0, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .local v2, "tipoResiduos":Ljava/util/List;
    invoke-virtual/range {v0 .. v7}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V

    .line 178
    return-void
.end method

.method private synthetic lambda$loadSpinnerCliente$0(Lcom/coleta/ambientuus/dto/ClienteMTR;)V
    .locals 1
    .param p1, "selectedMotorista"    # Lcom/coleta/ambientuus/dto/ClienteMTR;

    .line 156
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/ClienteMTR;->getId_pessoa()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->idClienteMTR:Ljava/lang/Integer;

    .line 157
    return-void
.end method

.method private synthetic lambda$loadSpinnerCliente$1(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 8
    .param p1, "helper"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .param p2, "lables"    # Ljava/util/List;
    .param p3, "v"    # Landroid/view/View;

    .line 148
    new-instance v4, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$$ExternalSyntheticLambda1;

    invoke-direct {v4}, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$$ExternalSyntheticLambda1;-><init>()V

    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieCliente:Landroid/widget/AutoCompleteTextView;

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieCliente:Landroid/widget/AutoCompleteTextView;

    .line 154
    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda6;

    invoke-direct {v7, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda6;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    .line 148
    const-string v3, "Selecione o Cliente"

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "lables":Ljava/util/List;
    .local v0, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .local v2, "lables":Ljava/util/List;
    invoke-virtual/range {v0 .. v7}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V

    .line 159
    return-void
.end method

.method static synthetic lambda$showConfirm$12(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "acao"    # Ljava/lang/Runnable;
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 443
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 444
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 445
    return-void
.end method

.method private synthetic lambda$validarCampos$11()V
    .locals 2

    .line 392
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    const-string v1, "0,00"

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private loadDataBombona()V
    .locals 3

    .line 182
    new-instance v0, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;->getAllVolumes()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->volumes:Ljava/util/List;

    .line 183
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x109000a

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->volumes:Ljava/util/List;

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 185
    .local v0, "dataAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/coleta/ambientuus/dto/Volume;>;"
    const v1, 0x1090009

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 186
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1, v0}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 187
    return-void
.end method

.method private loadSpinnerCliente()V
    .locals 4

    .line 144
    new-instance v0, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->getAllClientesMTR()Ljava/util/List;

    move-result-object v0

    .line 146
    .local v0, "lables":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/ClienteMTR;>;"
    new-instance v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    invoke-direct {v1}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;-><init>()V

    .line 147
    .local v1, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<Lcom/coleta/ambientuus/dto/ClienteMTR;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieCliente:Landroid/widget/AutoCompleteTextView;

    new-instance v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda7;

    invoke-direct {v3, p0, v1, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda7;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Landroid/widget/AutoCompleteTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    return-void
.end method

.method private saveColeta()Z
    .locals 3

    .line 461
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->createColeta()Lcom/coleta/ambientuus/dto/Coleta;

    move-result-object v0

    .line 462
    .local v0, "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->validarCampos(Lcom/coleta/ambientuus/dto/Coleta;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 463
    const/4 v1, 0x0

    return v1

    .line 465
    :cond_0
    new-instance v1, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->insert(Lcom/coleta/ambientuus/dto/Coleta;)Ljava/lang/String;

    .line 466
    const/4 v1, 0x1

    return v1
.end method

.method private showConfirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 7
    .param p1, "titulo"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "acao"    # Ljava/lang/Runnable;

    .line 436
    new-instance v5, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda8;

    invoke-direct {v5, p3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda8;-><init>(Ljava/lang/Runnable;)V

    const/4 v6, 0x0

    const-string v3, "Ok"

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .end local p1    # "titulo":Ljava/lang/String;
    .end local p2    # "msg":Ljava/lang/String;
    .local v1, "titulo":Ljava/lang/String;
    .local v2, "msg":Ljava/lang/String;
    invoke-static/range {v0 .. v6}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->mostrarConfirmacao(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    .line 448
    return-void
.end method

.method private validarCampos(Lcom/coleta/ambientuus/dto/Coleta;)Z
    .locals 16
    .param p1, "coleta"    # Lcom/coleta/ambientuus/dto/Coleta;

    .line 375
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getNumero_mtr()Ljava/lang/String;

    move-result-object v1

    .line 376
    .local v1, "nrMTR":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v2

    .line 377
    .local v2, "peso":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getObservacao()Ljava/lang/String;

    move-result-object v3

    .line 378
    .local v3, "obs":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_volume()I

    move-result v4

    .line 379
    .local v4, "idVolume":I
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_extra()Ljava/lang/String;

    move-result-object v5

    .line 380
    .local v5, "extra":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_Etiqueta()Ljava/lang/String;

    move-result-object v6

    .line 382
    .local v6, "codEtiqueta":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    const/16 v8, 0xa

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-ne v7, v8, :cond_0

    move v7, v9

    goto :goto_0

    :cond_0
    move v7, v10

    .line 383
    .local v7, "mtrValido":Z
    :goto_0
    if-eqz v4, :cond_1

    move v8, v9

    goto :goto_1

    :cond_1
    move v8, v10

    .line 385
    .local v8, "temVolume":Z
    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 386
    const-string v9, "Informe o Peso"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showMessage(Ljava/lang/String;)V

    .line 387
    return v10

    .line 390
    :cond_2
    const-string v11, ","

    const-string v12, "."

    invoke-virtual {v2, v11, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    .line 391
    .local v11, "pesof":F
    const/high16 v12, 0x42c80000    # 100.0f

    cmpl-float v12, v11, v12

    if-lez v12, :cond_3

    .line 392
    new-instance v9, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda4;

    invoke-direct {v9, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda4;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    const-string v12, "Verifique"

    const-string v13, "Peso m\u00e1ximo permitido 100 Kg."

    invoke-direct {v0, v12, v13, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showConfirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 393
    return v10

    .line 396
    :cond_3
    const-string v12, "S"

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    const-string v13, "Verifique o tamanho do MTR/DC (10)"

    if-eqz v12, :cond_6

    .line 397
    if-nez v7, :cond_4

    .line 398
    invoke-virtual {v0, v13}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showMessage(Ljava/lang/String;)V

    .line 399
    return v10

    .line 405
    :cond_4
    if-nez v8, :cond_5

    .line 406
    const-string v9, "Selecione uma bombona"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showMessage(Ljava/lang/String;)V

    .line 407
    return v10

    .line 409
    :cond_5
    return v9

    .line 412
    :cond_6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_7

    .line 413
    const-string v9, "Informe uma etiqueta"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showMessage(Ljava/lang/String;)V

    .line 414
    return v10

    .line 416
    :cond_7
    new-instance v12, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v14, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v14}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v14

    invoke-direct {v12, v14}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 417
    .local v12, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    invoke-virtual {v12, v6}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->retornaManifestoEtiqueta(Ljava/lang/String;)Lcom/coleta/ambientuus/dto/Manifesto;

    move-result-object v14

    .line 418
    .local v14, "manifestoEtiqueta":Lcom/coleta/ambientuus/dto/Manifesto;
    if-eqz v14, :cond_8

    .line 419
    invoke-virtual {v14}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_8

    .line 420
    const-string v9, "Etiqueta informada n\u00e3o pertence a esse manifesto"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showMessage(Ljava/lang/String;)V

    .line 421
    return v10

    .line 426
    .end local v12    # "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    .end local v14    # "manifestoEtiqueta":Lcom/coleta/ambientuus/dto/Manifesto;
    :cond_8
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_9

    if-eqz v7, :cond_9

    if-eqz v8, :cond_9

    return v9

    .line 428
    :cond_9
    if-nez v7, :cond_a

    invoke-virtual {v0, v13}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showMessage(Ljava/lang/String;)V

    goto :goto_2

    .line 429
    :cond_a
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_b

    const-string v9, "Informe o peso"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showMessage(Ljava/lang/String;)V

    goto :goto_2

    .line 430
    :cond_b
    const-string v9, "Selecione uma Bombona"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->showMessage(Ljava/lang/String;)V

    .line 432
    :goto_2
    return v10
.end method


# virtual methods
.method public clearFields()V
    .locals 2

    .line 298
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->smManterNrMTR:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_0

    .line 299
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 301
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 302
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->smManterBombona:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v0

    if-nez v0, :cond_1

    .line 303
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieObservacao:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 307
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 308
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 309
    return-void
.end method

.method public createColeta()Lcom/coleta/ambientuus/dto/Coleta;
    .locals 29

    .line 312
    move-object/from16 v0, p0

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 313
    .local v1, "dataAtual":Ljava/util/Date;
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "dd/MM/yyyy HH:mm:ss"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 314
    .local v2, "dateFormat":Ljava/text/DateFormat;
    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    .line 315
    .local v6, "hoje":Ljava/lang/String;
    const-string v3, "ArquivoPreferencia"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 316
    .local v3, "preferences":Landroid/content/SharedPreferences;
    const-string v5, "id_rota"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v25

    .line 317
    .local v25, "idRota":I
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v5}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 318
    .local v5, "peso":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->getSelectedBombona()Lcom/coleta/ambientuus/dto/Volume;

    move-result-object v26

    .line 320
    .local v26, "volume":Lcom/coleta/ambientuus/dto/Volume;
    const/4 v7, 0x0

    .line 321
    .local v7, "idColetaLogradouro":Ljava/lang/Integer;
    const/4 v8, 0x0

    .line 322
    .local v8, "idDiaColeta":Ljava/lang/Integer;
    iget-object v9, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    if-eqz v9, :cond_0

    .line 323
    iget-object v9, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v9}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v9

    .line 324
    .local v9, "idClienteSelecionado":Ljava/lang/Integer;
    iget-object v10, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v10}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v7

    .line 325
    iget-object v10, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v10}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v8

    move-object/from16 v23, v7

    move-object/from16 v24, v8

    move-object v14, v9

    goto :goto_0

    .line 327
    .end local v9    # "idClienteSelecionado":Ljava/lang/Integer;
    :cond_0
    iget-object v9, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->idClienteMTR:Ljava/lang/Integer;

    move-object/from16 v23, v7

    move-object/from16 v24, v8

    move-object v14, v9

    .line 330
    .end local v7    # "idColetaLogradouro":Ljava/lang/Integer;
    .end local v8    # "idDiaColeta":Ljava/lang/Integer;
    .local v14, "idClienteSelecionado":Ljava/lang/Integer;
    .local v23, "idColetaLogradouro":Ljava/lang/Integer;
    .local v24, "idDiaColeta":Ljava/lang/Integer;
    :goto_0
    move-object v7, v3

    .end local v3    # "preferences":Landroid/content/SharedPreferences;
    .local v7, "preferences":Landroid/content/SharedPreferences;
    new-instance v3, Lcom/coleta/ambientuus/dto/Coleta;

    iget-object v8, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    .line 332
    invoke-virtual {v8}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-static {v8}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/text/Editable;

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .line 334
    move-object v9, v7

    .end local v7    # "preferences":Landroid/content/SharedPreferences;
    .local v9, "preferences":Landroid/content/SharedPreferences;
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 335
    if-nez v26, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual/range {v26 .. v26}, Lcom/coleta/ambientuus/dto/Volume;->getId_volume()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v10, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieObservacao:Lcom/google/android/material/textfield/TextInputEditText;

    .line 339
    invoke-virtual {v10}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    .line 342
    iget-object v10, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->radioQtd:Landroid/widget/RadioButton;

    invoke-virtual {v10}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, "QTD"

    goto :goto_2

    :cond_2
    const-string v10, "LT"

    :goto_2
    move-object v15, v10

    iget-object v10, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    .line 347
    invoke-virtual {v10}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v20

    .line 348
    iget-object v10, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->idTipoResiduo:Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-nez v10, :cond_3

    const/4 v10, 0x0

    goto :goto_3

    :cond_3
    iget-object v10, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->idTipoResiduo:Ljava/lang/Integer;

    :goto_3
    move-object/from16 v21, v10

    const/16 v22, 0x0

    move-object v10, v9

    .end local v9    # "preferences":Landroid/content/SharedPreferences;
    .local v10, "preferences":Landroid/content/SharedPreferences;
    const-string v9, "N"

    move-object v11, v10

    .end local v10    # "preferences":Landroid/content/SharedPreferences;
    .local v11, "preferences":Landroid/content/SharedPreferences;
    const-string v10, "N"

    move-object v13, v11

    .end local v11    # "preferences":Landroid/content/SharedPreferences;
    .local v13, "preferences":Landroid/content/SharedPreferences;
    const-string v11, "S"

    move-object/from16 v16, v13

    .end local v13    # "preferences":Landroid/content/SharedPreferences;
    .local v16, "preferences":Landroid/content/SharedPreferences;
    const-string v13, "N"

    move-object/from16 v17, v16

    .end local v16    # "preferences":Landroid/content/SharedPreferences;
    .local v17, "preferences":Landroid/content/SharedPreferences;
    const/16 v16, 0x0

    move-object/from16 v18, v17

    .end local v17    # "preferences":Landroid/content/SharedPreferences;
    .local v18, "preferences":Landroid/content/SharedPreferences;
    const/16 v17, 0x0

    move-object/from16 v19, v18

    .end local v18    # "preferences":Landroid/content/SharedPreferences;
    .local v19, "preferences":Landroid/content/SharedPreferences;
    const/16 v18, 0x0

    move-object/from16 v27, v19

    .end local v19    # "preferences":Landroid/content/SharedPreferences;
    .local v27, "preferences":Landroid/content/SharedPreferences;
    const/16 v19, 0x0

    move-object/from16 v28, v8

    move-object v8, v4

    move-object v4, v5

    move-object/from16 v5, v28

    .end local v5    # "peso":Ljava/lang/String;
    .local v4, "peso":Ljava/lang/String;
    invoke-direct/range {v3 .. v24}, Lcom/coleta/ambientuus/dto/Coleta;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 353
    .local v3, "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    return-object v3
.end method

.method public existsScale()V
    .locals 5

    .line 283
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 284
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 285
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "br.com.urano.SOCKET"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x4

    if-eqz v3, :cond_0

    .line 286
    const-string v3, "CONECTADO"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->bluetoothConectado:Ljava/lang/Boolean;

    .line 287
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mDevice:Landroid/bluetooth/BluetoothDevice;

    .line 288
    const-string v2, "br.com.urano.uuid"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mDeviceUUID:Ljava/util/UUID;

    .line 289
    const-string v2, "br.com.urano.buffersize"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mMaxChars:I

    .line 290
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->btnLerPeso:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 292
    :cond_0
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->bluetoothConectado:Ljava/lang/Boolean;

    .line 293
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->btnLerPeso:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 295
    :goto_0
    return-void
.end method

.method public finalizeColeta(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "pendente"    # Ljava/lang/Boolean;

    .line 482
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 483
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x24000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 484
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->startActivity(Landroid/content/Intent;)V

    .line 485
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->finish()V

    .line 486
    return-void
.end method

.method public getSelectedBombona()Lcom/coleta/ambientuus/dto/Volume;
    .locals 4

    .line 357
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 358
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 359
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Volume;

    .line 360
    .local v1, "vol":Lcom/coleta/ambientuus/dto/Volume;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Volume;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v3}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 361
    return-object v1

    .line 358
    .end local v1    # "vol":Lcom/coleta/ambientuus/dto/Volume;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 365
    .end local v0    # "i":I
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->volumes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Volume;

    .line 366
    .local v1, "volume":Lcom/coleta/ambientuus/dto/Volume;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Volume;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v3}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 367
    return-object v1

    .line 369
    .end local v1    # "volume":Lcom/coleta/ambientuus/dto/Volume;
    :cond_2
    goto :goto_1

    .line 370
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public initDefaultData()V
    .locals 0

    .line 140
    return-void
.end method

.method public loadDataTipoResiduo()V
    .locals 4

    .line 163
    new-instance v0, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 164
    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->getAllTipoResiduo()Ljava/util/List;

    move-result-object v0

    .line 165
    .local v0, "tipoResiduos":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/TipoResiduo;>;"
    new-instance v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    invoke-direct {v1}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;-><init>()V

    .line 166
    .local v1, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<Lcom/coleta/ambientuus/dto/TipoResiduo;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    new-instance v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, v1, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "saveInstanceState"    # Landroid/os/Bundle;

    .line 96
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 97
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_ponto_coleta_coletar_extra:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->setContentView(I)V

    .line 99
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "ponto"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/PontoColeta;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 100
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "tipo"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->tipoPesagem:Ljava/lang/String;

    .line 101
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "avulsa"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->avulsa:Ljava/lang/Boolean;

    .line 103
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->initFields()V

    .line 104
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->initDefaultData()V

    .line 105
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->loadDataBombona()V

    .line 106
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->loadDataTipoResiduo()V

    .line 107
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->initTipoColeta()V

    .line 108
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->initReader()V

    .line 109
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->initButtons()V

    .line 110
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->existsScale()V

    .line 111
    return-void
.end method

.method protected onResume()V
    .locals 3

    .line 489
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->bluetoothConectado:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 490
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    if-nez v0, :cond_0

    .line 491
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mDevice:Landroid/bluetooth/BluetoothDevice;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->mDeviceUUID:Ljava/util/UUID;

    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$3;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$3;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V

    invoke-static {p0, v0, v1, v2}, Lcom/coleta/ambientuus/utils/BluetoothConnector;->connectToDevice(Landroid/app/Activity;Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V

    .line 505
    :cond_0
    invoke-super {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onResume()V

    .line 506
    return-void
.end method

.method public showMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 453
    const-string v0, "Aten\u00e7\u00e3o"

    invoke-static {p0, v0, p1}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->exibirInformacao(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    return-void
.end method
