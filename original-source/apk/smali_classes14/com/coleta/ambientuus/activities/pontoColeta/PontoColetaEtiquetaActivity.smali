.class public Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;
.super Lcom/coleta/ambientuus/activities/main/BaseActivity;
.source "PontoColetaEtiquetaActivity.java"


# instance fields
.field private btnIniciarPesagem:Landroid/widget/Button;

.field private btnSalvarCapaColeta:Landroid/widget/Button;

.field private databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private etiquetaTableManager:Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

.field private pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

.field private qtdEtiqueta:J

.field private qtdFinal:J

.field private qtdInicial:J

.field private readerLauncherEtiquetaFinal:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private readerLauncherEtiquetaInicial:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private textEtiquetaFinal:Lcom/google/android/material/textfield/TextInputEditText;

.field private textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

.field private tvQuantidade:Landroid/widget/TextView;

.field private valFinal:Ljava/lang/String;

.field private valInicial:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$-HINya_11YzVBrUXqtd26mYjgJw(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$prepareReader$3(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$6sdIIi-DByyqvwFiqxuxg2-5Hf4(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$initButton$8(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Eyb8Hw0cfkjRllmOkq1eefxgSpM(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$initButton$4(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Opsbx2cVVBiQStfX_MBy0MPnOvk(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$initButton$7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$XBCh7j-ZJewoX0oIajBVYrjMgVg(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Landroid/view/View;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$initEdits$0(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$Xh_xArrcQqIhaSh2TR72abd16Io(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$initButton$6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Y3bGUAjdjGRF2ahDq4jx8Rn4CwM(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Landroid/view/View;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$initEdits$1(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$q4iqett-t1L5BhnDQdDPgM-a770(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$initButton$5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$sHl2cfVxi9aGzvXj_CB6PWzJ98o(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->lambda$prepareReader$2(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetreaderLauncherEtiquetaFinal(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->readerLauncherEtiquetaFinal:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetreaderLauncherEtiquetaInicial(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->readerLauncherEtiquetaInicial:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;-><init>()V

    return-void
.end method

.method private disableButton()V
    .locals 2

    .line 233
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnIniciarPesagem:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 234
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnIniciarPesagem:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 236
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnSalvarCapaColeta:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 237
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnSalvarCapaColeta:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 238
    return-void
.end method

.method private enableButtons()V
    .locals 2

    .line 241
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnIniciarPesagem:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 242
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnIniciarPesagem:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 244
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnSalvarCapaColeta:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 245
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnSalvarCapaColeta:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 246
    return-void
.end method

.method private getEtiquetasValues()V
    .locals 2

    .line 249
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->valInicial:Ljava/lang/String;

    .line 250
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaFinal:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->valFinal:Ljava/lang/String;

    .line 251
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->valInicial:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->valInicial:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    :goto_0
    iput-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdInicial:J

    .line 252
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->valFinal:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdInicial:J

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->valFinal:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    :goto_1
    iput-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdFinal:J

    .line 254
    return-void
.end method

.method private initButton()V
    .locals 3

    .line 129
    sget v0, Lcom/coleta/ambientuus/R$id;->btnIniciarPesagem:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnIniciarPesagem:Landroid/widget/Button;

    .line 130
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnIniciarPesagem:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 152
    sget v0, Lcom/coleta/ambientuus/R$id;->btnSalvarCapaColeta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnSalvarCapaColeta:Landroid/widget/Button;

    .line 153
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->btnSalvarCapaColeta:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda4;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    sget v0, Lcom/coleta/ambientuus/R$id;->btnLerEtiquetaInicio:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 168
    .local v0, "btnLerEtiquetaInicio":Landroid/widget/Button;
    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda5;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 191
    sget v1, Lcom/coleta/ambientuus/R$id;->btnLerEtiquetaFinal:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 192
    .local v1, "btnLerEtiquetaFinal":Landroid/widget/Button;
    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda6;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->disableButton()V

    .line 216
    return-void
.end method

.method private initData()V
    .locals 5

    .line 219
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->etiquetaTableManager:Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->buscarIntervaloEtiquetas(I)Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    move-result-object v0

    .line 220
    .local v0, "etiquetaIntervalo":Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getPrimeira()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    .line 221
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getPrimeira()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 222
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getPrimeira()J

    move-result-wide v1

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getUltima()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 223
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaFinal:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getUltima()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 225
    :cond_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/material/textfield/TextInputEditText;->setEnabled(Z)V

    .line 226
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaFinal:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v1, v2}, Lcom/google/android/material/textfield/TextInputEditText;->setEnabled(Z)V

    .line 227
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->enableButtons()V

    .line 228
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->updateQuantity()V

    .line 230
    :cond_1
    return-void
.end method

.method private initEdits()V
    .locals 2

    .line 74
    sget v0, Lcom/coleta/ambientuus/R$id;->textEtiquetaInicial:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

    .line 75
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 88
    sget v0, Lcom/coleta/ambientuus/R$id;->textEtiquetaFinal:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaFinal:Lcom/google/android/material/textfield/TextInputEditText;

    .line 89
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaFinal:Lcom/google/android/material/textfield/TextInputEditText;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 94
    return-void
.end method

.method private initText()V
    .locals 1

    .line 97
    sget v0, Lcom/coleta/ambientuus/R$id;->tvQuantidade:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->tvQuantidade:Landroid/widget/TextView;

    .line 98
    return-void
.end method

.method private synthetic lambda$initButton$4(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 3
    .param p1, "tipo"    # Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    .line 135
    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->BLUETOOTH:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .local v0, "intent":Landroid/content/Intent;
    goto :goto_0

    .line 138
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 140
    .restart local v0    # "intent":Landroid/content/Intent;
    :goto_0
    const/high16 v1, 0x24000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 141
    const-string v1, "ponto"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 142
    const-string v1, "tipo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 146
    return-void
.end method

.method private synthetic lambda$initButton$5(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 131
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->verifyEtiquetaInicialFinal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->insertEtiqueta()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-static {p0, v0}, Lcom/coleta/ambientuus/utils/PesagemPreferences;->verifyPreferences(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;)V

    .line 150
    :cond_0
    return-void
.end method

.method private synthetic lambda$initButton$6(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 154
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->verifyEtiquetaInicialFinal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->insertEtiqueta()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    new-instance v0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 157
    .local v0, "pontoColetaTableManager":Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "100"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->updateStatus(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 158
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 159
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v2, 0x24000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 160
    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 162
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->finish()V

    .line 165
    .end local v0    # "pontoColetaTableManager":Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private synthetic lambda$initButton$7(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 169
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 170
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    .line 171
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 187
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 189
    return-void
.end method

.method private synthetic lambda$initButton$8(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 193
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 194
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    .line 195
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 211
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 213
    return-void
.end method

.method private synthetic lambda$initEdits$0(Landroid/view/View;Z)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .line 76
    if-nez p2, :cond_1

    .line 77
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->enableButtons()V

    .line 79
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->updateQuantity()V

    goto :goto_0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaFinal:Lcom/google/android/material/textfield/TextInputEditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 82
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->updateQuantity()V

    .line 83
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->disableButton()V

    .line 86
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic lambda$initEdits$1(Landroid/view/View;Z)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .line 90
    if-nez p2, :cond_0

    .line 91
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->updateQuantity()V

    .line 93
    :cond_0
    return-void
.end method

.method private synthetic lambda$prepareReader$2(Landroidx/activity/result/ActivityResult;)V
    .locals 3
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 104
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 105
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 106
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "Erro ao retornar codigo de Barras"

    invoke-static {v0, v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 107
    const-string v1, "codigoBarras"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "codigoBarras":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v2, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 109
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->enableButtons()V

    .line 110
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->updateQuantity()V

    .line 112
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "codigoBarras":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private synthetic lambda$prepareReader$3(Landroidx/activity/result/ActivityResult;)V
    .locals 3
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 117
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 118
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 119
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "Erro ao retornar codigo de Barras"

    invoke-static {v0, v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 120
    const-string v1, "codigoBarras"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 121
    .local v1, "codigoBarras":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaFinal:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v2, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 122
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->enableButtons()V

    .line 123
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->updateQuantity()V

    .line 125
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "codigoBarras":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private prepareReader()V
    .locals 2

    .line 101
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda7;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->readerLauncherEtiquetaInicial:Landroidx/activity/result/ActivityResultLauncher;

    .line 114
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity$$ExternalSyntheticLambda8;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->readerLauncherEtiquetaFinal:Landroidx/activity/result/ActivityResultLauncher;

    .line 126
    return-void
.end method

.method private updateQuantity()V
    .locals 6

    .line 264
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->verifyEtiquetaInicialFinal()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 265
    iget-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdFinal:J

    iget-wide v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdInicial:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdEtiqueta:J

    .line 266
    iget-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdInicial:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const-string v1, "Quantidade: "

    if-nez v0, :cond_0

    iget-wide v4, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdFinal:J

    cmp-long v0, v4, v2

    if-nez v0, :cond_0

    .line 267
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->tvQuantidade:Landroid/widget/TextView;

    const-string v2, "0"

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldSufix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 269
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->tvQuantidade:Landroid/widget/TextView;

    iget-wide v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdEtiqueta:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldSufix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    :cond_1
    :goto_0
    return-void
.end method

.method private verifyEtiquetaInicialFinal()Z
    .locals 4

    .line 275
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->getEtiquetasValues()V

    .line 276
    iget-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdFinal:J

    iget-wide v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdInicial:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 277
    const-string v0, "Erro"

    const-string v1, "A numera\u00e7\u00e3o da etiqueta final n\u00e3o pode ser menor que a inicial."

    invoke-static {p0, v0, v1}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->exibirErro(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const/4 v0, 0x0

    return v0

    .line 282
    :cond_0
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public insertEtiqueta()Z
    .locals 10

    .line 287
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->textEtiquetaInicial:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/Editable;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 288
    .local v0, "valInicial":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/16 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    :goto_0
    move-wide v7, v1

    .line 289
    .local v7, "qtdInicial":J
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->etiquetaTableManager:Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-wide v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdEtiqueta:J

    move-object v9, p0

    invoke-virtual/range {v3 .. v9}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->executeRangeInsert(IJJLandroid/content/Context;)Z

    move-result v1

    return v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "saveInstanceState"    # Landroid/os/Bundle;

    .line 57
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 58
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_ponto_coleta_capa_etiqueta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->setContentView(I)V

    .line 59
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 61
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "ponto"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/PontoColeta;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 62
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->qtdEtiqueta:J

    .line 63
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 64
    new-instance v0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->etiquetaTableManager:Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    .line 66
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->initEdits()V

    .line 67
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->initText()V

    .line 68
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->prepareReader()V

    .line 69
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->initButton()V

    .line 70
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;->initData()V

    .line 71
    return-void
.end method
