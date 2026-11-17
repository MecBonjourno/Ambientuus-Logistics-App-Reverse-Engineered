.class public Lcom/coleta/ambientuus/activities/main/MainActivity;
.super Lcom/coleta/ambientuus/activities/main/BaseActivity;
.source "MainActivity.java"

# interfaces
.implements Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;


# static fields
.field private static final ARQUIVO_PREFERENCIA:Ljava/lang/String; = "ArquivoPreferencia"

.field private static final TIPO_PESAGEM:Ljava/lang/String; = "TIPO_PESAGEM"

.field private static dataColeta:Ljava/lang/String;

.field private static recebeIdFrotaVeiculo:Ljava/lang/Integer;

.field private static recebeIdMotorista:Ljava/lang/Integer;

.field private static recebeIdRota:Ljava/lang/Integer;

.field private static verificaCliques:I


# instance fields
.field private dataColetaSel:Landroid/widget/EditText;

.field private final datePickerFragment:Lcom/coleta/ambientuus/fragments/DatePickerFragment;

.field private dialog:Landroidx/appcompat/app/AlertDialog;

.field private dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

.field myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private preferences:Landroid/content/SharedPreferences;

.field private readerLauncherQRCode:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private senhaAdm:Landroid/widget/EditText;

.field private spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

.field private spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;


# direct methods
.method public static synthetic $r8$lambda$7WVnYQSm27MjzmBft0qkFqjiW0o(Lcom/coleta/ambientuus/activities/main/MainActivity;Landroid/view/View;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$initItem$2(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$AhxABXjBaMiMQaoJrzrsiovOII0(Lcom/coleta/ambientuus/activities/main/MainActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$initButtons$6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$BngE8QXKNQMxJoZAOCPo55AOxxE(Lcom/coleta/ambientuus/activities/main/MainActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$initButtons$5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Pxm636QUZ-wjJvxccVn2bffwQvs(Lcom/coleta/ambientuus/activities/main/MainActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$prepareReader$3(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$RM2HgEU5E36BnzTXLzYmpN9B0yw(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$sincronizarApp$11()V

    return-void
.end method

.method public static synthetic $r8$lambda$S4hV48mBBKgXCQHiA2tDg6QpfvQ(Lcom/coleta/ambientuus/activities/main/MainActivity;Lcom/coleta/ambientuus/dto/Rota;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$loadSpinnerDataRota$13(Lcom/coleta/ambientuus/dto/Rota;)V

    return-void
.end method

.method public static synthetic $r8$lambda$T6kiztRqkkTbqT_6aOYR20Ts3xY(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$sincronizarApp$10()V

    return-void
.end method

.method public static synthetic $r8$lambda$U9akYiuFJ-eKZmDKcFgB6-MJc3c(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$getTelasDisponiveis$1()V

    return-void
.end method

.method public static synthetic $r8$lambda$W-CMdxAo_H-Pwnbiau7oKDYvDyw(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$getDataBackground$9()V

    return-void
.end method

.method public static synthetic $r8$lambda$iAwiuf4FnYgw8k6D9caoGslr8X8(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$sincronizarApp$12()V

    return-void
.end method

.method public static synthetic $r8$lambda$jZckv4_7SuLGFIo9w0fqqn7FwjA(Lcom/coleta/ambientuus/activities/main/MainActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$initButtons$7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$pTRjayCtWWhW9yPpUVsefCVKxFw(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$getTelasDisponiveis$0()V

    return-void
.end method

.method public static synthetic $r8$lambda$rEBEh4MkBDLFqCkg-Pr-1H0vOdM(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$getDataBackground$8()V

    return-void
.end method

.method public static synthetic $r8$lambda$vr5wGSwiCGY9fiztit-XBQy7M3E(Lcom/coleta/ambientuus/activities/main/MainActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$loadSpinnerDataRota$14(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$xB3xBJ-o87DL1-2Y3DaEvddNiVQ(Lcom/coleta/ambientuus/activities/main/MainActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$loadSpinnerDataPlaca$16(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetdataColetaSel(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColetaSel:Landroid/widget/EditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdialog(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroidx/appcompat/app/AlertDialog;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetreaderLauncherQRCode(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->readerLauncherQRCode:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsenhaAdm(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->senhaAdm:Landroid/widget/EditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcreatePopupEtiquetaCliente(Lcom/coleta/ambientuus/activities/main/MainActivity;Lcom/coleta/ambientuus/dto/BombonaCliente;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->createPopupEtiquetaCliente(Lcom/coleta/ambientuus/dto/BombonaCliente;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mloadSpinnerDataPlaca(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->loadSpinnerDataPlaca()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mloadSpinnerDataRota(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->loadSpinnerDataRota()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputdataColeta(Ljava/lang/String;)V
    .locals 0

    sput-object p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 85
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    .line 86
    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdFrotaVeiculo:Ljava/lang/Integer;

    .line 87
    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdMotorista:Ljava/lang/Integer;

    .line 88
    const/4 v1, 0x0

    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    .line 89
    sput v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->verificaCliques:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 78
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;-><init>()V

    .line 95
    new-instance v0, Lcom/coleta/ambientuus/fragments/DatePickerFragment;

    invoke-direct {v0}, Lcom/coleta/ambientuus/fragments/DatePickerFragment;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->datePickerFragment:Lcom/coleta/ambientuus/fragments/DatePickerFragment;

    return-void
.end method

.method private createPopupEtiquetaCliente(Lcom/coleta/ambientuus/dto/BombonaCliente;)V
    .locals 7
    .param p1, "bombonaCliente"    # Lcom/coleta/ambientuus/dto/BombonaCliente;

    .line 329
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 330
    .local v0, "builder":Landroidx/appcompat/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/coleta/ambientuus/R$layout;->popup_etiqueta_cliente:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 332
    .local v1, "popupView":Landroid/view/View;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getCodCliente()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNomeCliente()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 334
    .local v2, "nomeCliente":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v3

    const-string v4, "DC"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_0

    const-string v3, ""

    goto :goto_0

    :cond_0
    const-string v3, "Manifesto: "

    .line 336
    .local v3, "tipoDoc":Ljava/lang/String;
    :goto_0
    sget v4, Lcom/coleta/ambientuus/R$id;->tvPopupEtiquetaCliente:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 337
    const-string v5, "Cliente: "

    invoke-static {v5, v2}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 338
    sget v4, Lcom/coleta/ambientuus/R$id;->tvPopupEtiquetaData:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 339
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getDataColeta()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Data coleta: "

    invoke-static {v6, v5}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 340
    sget v4, Lcom/coleta/ambientuus/R$id;->tvPopupEtiquetaQuantidade:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 341
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getQuantidade()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Quantidade: "

    invoke-static {v6, v5}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 342
    sget v4, Lcom/coleta/ambientuus/R$id;->tvPopupEtiquetaPeso:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 343
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getPeso()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Peso L\u00edquido: "

    invoke-static {v6, v5}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 344
    sget v4, Lcom/coleta/ambientuus/R$id;->tvPopupEtiquetaManifesto:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 345
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 346
    sget v4, Lcom/coleta/ambientuus/R$id;->tvPopupEtiquetaEtiquetas:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 347
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/BombonaCliente;->getEtiquetas()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Etiquetas: "

    invoke-static {v6, v5}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 349
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 350
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v4

    .line 351
    .local v4, "dialog":Landroidx/appcompat/app/AlertDialog;
    invoke-virtual {v4}, Landroidx/appcompat/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-static {v5}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/Window;

    .line 352
    const v6, 0x106000d

    invoke-virtual {v5, v6}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 353
    invoke-virtual {v4}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 355
    sget v5, Lcom/coleta/ambientuus/R$id;->fecharPopUpEtiquetaCliente:I

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    new-instance v6, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda6;

    invoke-direct {v6, v4}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda6;-><init>(Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    return-void
.end method

.method private getRepository()Lcom/coleta/ambientuus/ws/Repository;
    .locals 9

    .line 558
    new-instance v0, Lcom/coleta/ambientuus/ws/Repository;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->COMPLETO:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v8}, Lcom/coleta/ambientuus/ws/Repository;-><init>(Landroid/content/Context;Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;)V

    return-object v0
.end method

.method private getTelasDisponiveis()V
    .locals 2

    .line 122
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->isOnline()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 124
    .local v0, "executor":Ljava/util/concurrent/ExecutorService;
    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda8;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 144
    .end local v0    # "executor":Ljava/util/concurrent/ExecutorService;
    :cond_0
    return-void
.end method

.method private googleLogin()V
    .locals 3

    .line 491
    const-string v0, "googleSign"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "isLoggedIn"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 492
    .local v0, "isLoggedIn":Z
    if-nez v0, :cond_0

    .line 493
    new-instance v1, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;-><init>(Landroid/content/Context;)V

    .line 494
    .local v1, "googleSignInHelper":Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;
    new-instance v2, Lcom/coleta/ambientuus/activities/main/MainActivity$4;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$4;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->setCallback(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;)V

    .line 527
    invoke-virtual {v1, p0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->signIn(Landroid/app/Activity;)V

    .line 529
    .end local v1    # "googleSignInHelper":Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;
    :cond_0
    return-void
.end method

.method private initButtons()V
    .locals 2

    .line 361
    sget v0, Lcom/coleta/ambientuus/R$id;->btnMostraDatePicker:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda12;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 364
    const/4 v0, 0x0

    sput v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->verificaCliques:I

    .line 365
    sget v0, Lcom/coleta/ambientuus/R$id;->btnMenuColetasID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda13;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 399
    sget v0, Lcom/coleta/ambientuus/R$id;->btnLeituraQRCode:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda14;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 420
    return-void
.end method

.method private initItem()V
    .locals 3

    .line 147
    const-string v0, ""

    sget v1, Lcom/coleta/ambientuus/R$id;->tieDtColeta:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColetaSel:Landroid/widget/EditText;

    .line 148
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColetaSel:Landroid/widget/EditText;

    new-instance v2, Lcom/coleta/ambientuus/activities/main/MainActivity$1;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$1;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 238
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColetaSel:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 240
    const/4 v1, 0x0

    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sput-object v2, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    .line 241
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sput-object v2, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdMotorista:Ljava/lang/Integer;

    .line 242
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v2, v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 243
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdFrotaVeiculo:Ljava/lang/Integer;

    .line 244
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v1, v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 245
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->loadSpinnerDataRota()V

    .line 247
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->loadSpinnerDataPlaca()V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 250
    goto :goto_0

    .line 248
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Ljava/text/ParseException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 252
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColetaSel:Landroid/widget/EditText;

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda9;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 256
    return-void
.end method

.method static synthetic lambda$createPopupEtiquetaCliente$4(Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V
    .locals 0
    .param p0, "dialog"    # Landroidx/appcompat/app/AlertDialog;
    .param p1, "v"    # Landroid/view/View;

    .line 356
    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    .line 357
    return-void
.end method

.method private synthetic lambda$getDataBackground$8()V
    .locals 1

    .line 453
    const-string v0, "Erro na sincroniza\u00e7\u00e3o"

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 454
    return-void
.end method

.method private synthetic lambda$getDataBackground$9()V
    .locals 9

    .line 427
    :try_start_0
    new-instance v0, Lcom/coleta/ambientuus/ws/Repository;

    .line 428
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->POR_ROTA:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    sget-object v3, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    sget-object v4, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v8}, Lcom/coleta/ambientuus/ws/Repository;-><init>(Landroid/content/Context;Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;)V

    .line 438
    .local v0, "repo":Lcom/coleta/ambientuus/ws/Repository;
    sget-object v1, Lcom/coleta/ambientuus/domain/model/SyncState;->LOADING:Lcom/coleta/ambientuus/domain/model/SyncState;

    invoke-static {v1}, Lcom/coleta/ambientuus/utils/SyncStatus;->setStatus(Lcom/coleta/ambientuus/domain/model/SyncState;)V

    .line 446
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarManifesto()V

    .line 448
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarPontosColetas(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 456
    .end local v0    # "repo":Lcom/coleta/ambientuus/ws/Repository;
    goto :goto_0

    .line 450
    :catch_0
    move-exception v0

    .line 451
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 452
    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda7;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 455
    sget-object v1, Lcom/coleta/ambientuus/domain/model/SyncState;->ERROR:Lcom/coleta/ambientuus/domain/model/SyncState;

    invoke-static {v1}, Lcom/coleta/ambientuus/utils/SyncStatus;->setStatus(Lcom/coleta/ambientuus/domain/model/SyncState;)V

    .line 457
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method private synthetic lambda$getTelasDisponiveis$0()V
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->dismissProgress()V

    .line 139
    const-string v0, "Erro na sincroniza\u00e7\u00e3o"

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method private synthetic lambda$getTelasDisponiveis$1()V
    .locals 9

    .line 126
    :try_start_0
    new-instance v0, Lcom/coleta/ambientuus/ws/Repository;

    sget-object v2, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->COMPLETO:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    :try_start_1
    invoke-direct/range {v0 .. v8}, Lcom/coleta/ambientuus/ws/Repository;-><init>(Landroid/content/Context;Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;)V

    .line 134
    .local v0, "repo":Lcom/coleta/ambientuus/ws/Repository;
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarTelas()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 141
    .end local v0    # "repo":Lcom/coleta/ambientuus/ws/Repository;
    goto :goto_1

    .line 135
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v1, p0

    .line 136
    .local v0, "e":Ljava/io/IOException;
    :goto_0
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 137
    new-instance v2, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/main/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 142
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    return-void
.end method

.method private synthetic lambda$initButtons$5(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 362
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->datePickerFragment:Lcom/coleta/ambientuus/fragments/DatePickerFragment;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-string v2, "datePicker"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/fragments/DatePickerFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 363
    return-void
.end method

.method private synthetic lambda$initButtons$6(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 366
    sget-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdMotorista:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    sget-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    .line 367
    sget v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->verificaCliques:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->verificaCliques:I

    .line 368
    sget v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->verificaCliques:I

    const/4 v2, 0x7

    if-lt v0, v2, :cond_0

    .line 369
    sput v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->verificaCliques:I

    .line 370
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->createDialogSenha()V

    .line 373
    :cond_0
    sget-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdMotorista:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_1

    .line 374
    const-string v0, "Selecione um Motorista!"

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 375
    :cond_1
    sget-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_2

    .line 376
    const-string v0, "Selecione uma rota!"

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 377
    :cond_2
    sget-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdFrotaVeiculo:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_3

    .line 378
    const-string v0, "Selecione uma placa!"

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 381
    :cond_3
    sput v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->verificaCliques:I

    .line 383
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 384
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdMotorista:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "recebeIdMotorista"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 385
    sget-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "recebeIdRota"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 386
    sget-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdFrotaVeiculo:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "recebeIdFrotaVeiculo"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 387
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "spinnerRotas"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 388
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "spinnerPlaca"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 389
    const-string v1, "dataColeta"

    sget-object v2, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 390
    sget-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "id_rota"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 391
    sget-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdFrotaVeiculo:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "id_frota_veiculo"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 392
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 394
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 395
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 396
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getDataBackground()V

    .line 398
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void
.end method

.method private synthetic lambda$initButtons$7(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 400
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 401
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$3;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$3;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    .line 402
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 418
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 419
    return-void
.end method

.method private synthetic lambda$initItem$2(Landroid/view/View;Z)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .line 253
    if-eqz p2, :cond_0

    .line 254
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->datePickerFragment:Lcom/coleta/ambientuus/fragments/DatePickerFragment;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-string v2, "datePicker"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/fragments/DatePickerFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 255
    :cond_0
    return-void
.end method

.method static synthetic lambda$loadSpinnerDataPlaca$15(Lcom/coleta/ambientuus/dto/Placas;)V
    .locals 1
    .param p0, "selectedPlaca"    # Lcom/coleta/ambientuus/dto/Placas;

    .line 662
    invoke-virtual {p0}, Lcom/coleta/ambientuus/dto/Placas;->getId_frota_veiculo()Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdFrotaVeiculo:Ljava/lang/Integer;

    .line 663
    return-void
.end method

.method private synthetic lambda$loadSpinnerDataPlaca$16(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;Z)V
    .locals 8
    .param p1, "helper"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .param p2, "labelPlaca"    # Ljava/util/List;
    .param p3, "view"    # Landroid/view/View;
    .param p4, "hasFocus"    # Z

    .line 653
    if-eqz p4, :cond_0

    .line 654
    new-instance v4, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v4}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda4;-><init>()V

    iget-object v5, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 660
    invoke-virtual {v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v7}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda5;-><init>()V

    .line 654
    const-string v3, "Selecione a Placa"

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "labelPlaca":Ljava/util/List;
    .local v0, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .local v2, "labelPlaca":Ljava/util/List;
    invoke-virtual/range {v0 .. v7}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V

    goto :goto_0

    .line 653
    .end local v0    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local v2    # "labelPlaca":Ljava/util/List;
    .restart local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .restart local p2    # "labelPlaca":Ljava/util/List;
    :cond_0
    move-object v0, p1

    move-object v2, p2

    .line 665
    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "labelPlaca":Ljava/util/List;
    .restart local v0    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .restart local v2    # "labelPlaca":Ljava/util/List;
    :goto_0
    return-void
.end method

.method private synthetic lambda$loadSpinnerDataRota$13(Lcom/coleta/ambientuus/dto/Rota;)V
    .locals 1
    .param p1, "selectedRota"    # Lcom/coleta/ambientuus/dto/Rota;

    .line 635
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Rota;->getId_rota()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    .line 636
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/Rota;->getId_motorista()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdMotorista:Ljava/lang/Integer;

    .line 637
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->loadSpinnerDataPlaca()V

    .line 638
    return-void
.end method

.method private synthetic lambda$loadSpinnerDataRota$14(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;Z)V
    .locals 8
    .param p1, "helper"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .param p2, "labels"    # Ljava/util/List;
    .param p3, "view"    # Landroid/view/View;
    .param p4, "hasFocus"    # Z

    .line 626
    if-eqz p4, :cond_0

    .line 627
    new-instance v4, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda10;

    invoke-direct {v4}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda10;-><init>()V

    iget-object v5, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 633
    invoke-virtual {v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda11;

    invoke-direct {v7, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda11;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    .line 627
    const-string v3, "Selecione a Rota"

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "labels":Ljava/util/List;
    .local v0, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .local v2, "labels":Ljava/util/List;
    invoke-virtual/range {v0 .. v7}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V

    goto :goto_0

    .line 626
    .end local v0    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local v2    # "labels":Ljava/util/List;
    .restart local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .restart local p2    # "labels":Ljava/util/List;
    :cond_0
    move-object v0, p1

    move-object v2, p2

    .line 640
    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "labels":Ljava/util/List;
    .restart local v0    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .restart local v2    # "labels":Ljava/util/List;
    :goto_0
    return-void
.end method

.method private synthetic lambda$prepareReader$3(Landroidx/activity/result/ActivityResult;)V
    .locals 2
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 288
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 289
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 290
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "Erro ao retornar codigo de Barras"

    invoke-static {v0, v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 291
    const-string v1, "codigoBarras"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 292
    .local v1, "codigoBarras":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->searchQRCodeEtiqueta(Ljava/lang/String;)V

    .line 294
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "codigoBarras":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private synthetic lambda$sincronizarApp$10()V
    .locals 1

    .line 593
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->dismissProgress()V

    .line 594
    const-string v0, "Sincroniza\u00e7\u00e3o finalizada com sucesso!"

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 595
    return-void
.end method

.method private synthetic lambda$sincronizarApp$11()V
    .locals 1

    .line 600
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->dismissProgress()V

    .line 601
    const-string v0, "Erro na sincroniza\u00e7\u00e3o"

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 602
    return-void
.end method

.method private synthetic lambda$sincronizarApp$12()V
    .locals 2

    .line 580
    :try_start_0
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getRepository()Lcom/coleta/ambientuus/ws/Repository;

    move-result-object v0

    .line 582
    .local v0, "repo":Lcom/coleta/ambientuus/ws/Repository;
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarVolumes()V

    .line 583
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarTerceiros()V

    .line 584
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarRotas()V

    .line 585
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarPlacas()V

    .line 586
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarBombonas()V

    .line 588
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarClientes()V

    .line 589
    invoke-virtual {v0}, Lcom/coleta/ambientuus/ws/Repository;->sincronizarTipoResiduo()V

    .line 592
    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda18;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda18;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 603
    .end local v0    # "repo":Lcom/coleta/ambientuus/ws/Repository;
    goto :goto_0

    .line 597
    :catch_0
    move-exception v0

    .line 598
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 599
    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 604
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method private loadPreferences()V
    .locals 6

    .line 261
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->setDataAtual()Ljava/lang/String;

    move-result-object v0

    .line 262
    .local v0, "dataHoje":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColetaSel:Landroid/widget/EditText;

    sget-object v2, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 263
    const-string v1, "ArquivoPreferencia"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    .line 264
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "dataColeta"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 265
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    .line 266
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColetaSel:Landroid/widget/EditText;

    sget-object v3, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 269
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "recebeIdRota"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 270
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    const-string v5, "recebeIdMotorista"

    invoke-interface {v1, v5, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdMotorista:Ljava/lang/Integer;

    .line 271
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    .line 272
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "recebeIdFrotaVeiculo"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdFrotaVeiculo:Ljava/lang/Integer;

    .line 273
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "spinnerRotas"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->preferences:Landroid/content/SharedPreferences;

    const-string v3, "spinnerPlaca"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    :cond_0
    return-void
.end method

.method private loadSpinnerDataPlaca()V
    .locals 4

    .line 648
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 649
    new-instance v0, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/PlacasTableManager;->getAllPlacas()Ljava/util/List;

    move-result-object v0

    .line 651
    .local v0, "labelPlaca":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Placas;>;"
    new-instance v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    invoke-direct {v1}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;-><init>()V

    .line 652
    .local v1, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<Lcom/coleta/ambientuus/dto/Placas;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    new-instance v3, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda16;

    invoke-direct {v3, p0, v1, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda16;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 666
    return-void
.end method

.method private loadSpinnerDataRota()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 612
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 614
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd/MM/yyyy"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 616
    .local v0, "formatter":Ljava/text/SimpleDateFormat;
    sget-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 617
    .local v1, "date":Ljava/util/Date;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 618
    .local v2, "c":Ljava/util/Calendar;
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 619
    const/4 v3, 0x7

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    .line 620
    .local v3, "dayOfWeek":I
    new-instance v4, Lcom/coleta/ambientuus/database/managers/RotaTableManager;

    iget-object v5, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v5}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/coleta/ambientuus/database/managers/RotaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/coleta/ambientuus/database/managers/RotaTableManager;->getAllRotasDia(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 621
    .local v4, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Rota;>;"
    new-instance v5, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    invoke-direct {v5}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;-><init>()V

    .line 625
    .local v5, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<Lcom/coleta/ambientuus/dto/Rota;>;"
    iget-object v6, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    new-instance v7, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda17;

    invoke-direct {v7, p0, v5, v4}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda17;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;)V

    invoke-virtual {v6, v7}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 642
    return-void
.end method

.method private prepareReader()V
    .locals 2

    .line 285
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda15;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->readerLauncherQRCode:Landroidx/activity/result/ActivityResultLauncher;

    .line 296
    return-void
.end method

.method private searchQRCodeEtiqueta(Ljava/lang/String;)V
    .locals 9
    .param p1, "codBarras"    # Ljava/lang/String;

    .line 300
    new-instance v0, Lcom/coleta/ambientuus/ws/Repository;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->CONSULTA:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    sget-object v3, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    sget-object v4, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v8, p1

    .end local p1    # "codBarras":Ljava/lang/String;
    .local v8, "codBarras":Ljava/lang/String;
    invoke-direct/range {v0 .. v8}, Lcom/coleta/ambientuus/ws/Repository;-><init>(Landroid/content/Context;Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;)V

    .line 309
    .local v0, "repo":Lcom/coleta/ambientuus/ws/Repository;
    new-instance p1, Lcom/coleta/ambientuus/activities/main/MainActivity$2;

    invoke-direct {p1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$2;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v0, p1}, Lcom/coleta/ambientuus/ws/Repository;->consultarEtiquetas(Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;)V

    .line 327
    return-void
.end method


# virtual methods
.method public createDialogSenha()V
    .locals 5

    .line 703
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 704
    .local v0, "dialogBuilder":Landroidx/appcompat/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/coleta/ambientuus/R$layout;->popup:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 705
    .local v1, "senhaPopupView":Landroid/view/View;
    sget v2, Lcom/coleta/ambientuus/R$id;->textSenhaAdm:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->senhaAdm:Landroid/widget/EditText;

    .line 706
    sget v2, Lcom/coleta/ambientuus/R$id;->buttonCancelarLogin:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 707
    .local v2, "cancelarSenha":Landroid/widget/Button;
    sget v3, Lcom/coleta/ambientuus/R$id;->buttonConfirmarLogin:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 709
    .local v3, "confirmaSenha":Landroid/widget/Button;
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 710
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    .line 711
    iget-object v4, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v4}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 713
    new-instance v4, Lcom/coleta/ambientuus/activities/main/MainActivity$5;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$5;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 720
    new-instance v4, Lcom/coleta/ambientuus/activities/main/MainActivity$6;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$6;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 732
    return-void
.end method

.method public getDataBackground()V
    .locals 2

    .line 423
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->isOnline()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 424
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 425
    .local v0, "executor":Ljava/util/concurrent/ExecutorService;
    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 459
    .end local v0    # "executor":Ljava/util/concurrent/ExecutorService;
    :cond_0
    return-void
.end method

.method public isOnline()Z
    .locals 3

    .line 550
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 551
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 552
    .local v1, "activeNetwork":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 100
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 101
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_main:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->setContentView(I)V

    .line 102
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 103
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v2, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 104
    invoke-static {v1}, Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V

    .line 105
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 107
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getTelasDisponiveis()V

    .line 108
    sget v0, Lcom/coleta/ambientuus/R$id;->spinnerStaticRotas:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 109
    sget v0, Lcom/coleta/ambientuus/R$id;->spinnerStaticPlaca:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 111
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->initItem()V

    .line 112
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->loadPreferences()V

    .line 113
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->loadSpinnerDataPlaca()V

    .line 114
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->prepareReader()V

    .line 115
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->initButtons()V

    .line 117
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->googleLogin()V

    .line 118
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .line 534
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 535
    .local v0, "inflater":Landroid/view/MenuInflater;
    sget v1, Lcom/coleta/ambientuus/R$menu;->menu_main:I

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 536
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    return v1
.end method

.method public onDateSelected(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "year"    # Ljava/lang/String;
    .param p2, "month"    # Ljava/lang/String;
    .param p3, "day"    # Ljava/lang/String;

    .line 736
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 737
    .local v0, "data":Ljava/lang/String;
    sput-object v0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColeta:Ljava/lang/String;

    .line 738
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdRota:Ljava/lang/Integer;

    .line 739
    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdMotorista:Ljava/lang/Integer;

    .line 740
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerRotas:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    const-string v3, ""

    invoke-virtual {v2, v3}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 741
    sput-object v1, Lcom/coleta/ambientuus/activities/main/MainActivity;->recebeIdFrotaVeiculo:Ljava/lang/Integer;

    .line 742
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->spinnerPlaca:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v1, v3}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 743
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dataColetaSel:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 744
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 543
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sget v1, Lcom/coleta/ambientuus/R$id;->menuSincronizacao:I

    if-ne v0, v1, :cond_0

    .line 544
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->sincronizarApp()V

    .line 546
    :cond_0
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public setDataAtual()Ljava/lang/String;
    .locals 4

    .line 669
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    .line 670
    .local v0, "dataAtual":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd/MM/yyyy"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 671
    .local v1, "dateFormat":Ljava/text/DateFormat;
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public showToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/String;

    .line 696
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 697
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 698
    return-void
.end method

.method public sincronizarApp()V
    .locals 3

    .line 570
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->isOnline()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 571
    new-instance v0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    invoke-direct {v0}, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    .line 572
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    const-string v1, "Buscando dados"

    const-string v2, "Por favor aguarde...."

    invoke-virtual {v0, p0, v1, v2}, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->showProgress(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 574
    invoke-static {p0}, Lcom/coleta/ambientuus/utils/PesagemPreferences;->deleteTipoPesagem(Landroid/content/Context;)V

    .line 575
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->deleteDataVolumeRotaMotoristaCliente()V

    .line 577
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 578
    .local v0, "executor":Ljava/util/concurrent/ExecutorService;
    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 605
    .end local v0    # "executor":Ljava/util/concurrent/ExecutorService;
    goto :goto_0

    .line 606
    :cond_0
    const-string v0, "Sem conex\u00e3o com a internet para fazer a sincroniza\u00e7\u00e3o, tente mais tarde!"

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 608
    :goto_0
    return-void
.end method
