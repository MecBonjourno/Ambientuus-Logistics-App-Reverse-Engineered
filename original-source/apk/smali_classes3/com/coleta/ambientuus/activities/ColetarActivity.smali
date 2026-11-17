.class public Lcom/coleta/ambientuus/activities/ColetarActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ColetarActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;
.implements Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;,
        Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;,
        Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;
    }
.end annotation


# static fields
.field private static final ARQUIVO_PREFERENCIA:Ljava/lang/String; = "ArquivoPreferencia"

.field private static final TAG:Ljava/lang/String; = "BlueTest5-MainActivity"


# instance fields
.field private bStop:Z

.field private bluetoothConectado:Z

.field btnAdd:Landroid/widget/Button;

.field private btnLimparCamposColeta:Landroid/widget/Button;

.field private capacidadeBombona:Ljava/lang/Integer;

.field private chbClienteAusente:Landroid/widget/CheckBox;

.field private chbColetaExtra:Landroid/widget/CheckBox;

.field private chbColetaSemResiduo:Landroid/widget/CheckBox;

.field private coleta:Lcom/coleta/ambientuus/dto/Coleta;

.field etNrMTR:Landroid/widget/EditText;

.field private etObservacao:Landroid/widget/EditText;

.field etPeso:Landroid/widget/EditText;

.field private leitorBombonaLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private leitorEtiquetaLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private leitorMTRLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private letras:Ljava/lang/String;

.field llConteudo:Landroidx/constraintlayout/widget/ConstraintLayout;

.field private mBTSocket:Landroid/bluetooth/BluetoothSocket;

.field private mBtnSendReq:Landroid/widget/Button;

.field private mDevice:Landroid/bluetooth/BluetoothDevice;

.field private mDeviceUUID:Ljava/util/UUID;

.field private mIsBluetoothConnected:Z

.field private mIsUserInitiatedDisconnect:Z

.field private mMaxChars:I

.field private mReadThread:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

.field private mostrarHoraData:Landroid/widget/TextView;

.field myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private progressDialog:Landroid/app/ProgressDialog;

.field private recebeIdClienteMTR:Ljava/lang/Integer;

.field private recebeIdVolume:Ljava/lang/Integer;

.field private resChbClAusente:Ljava/lang/String;

.field private resChbColExtra:Ljava/lang/String;

.field private resChbColSemResiduo:Ljava/lang/String;

.field private scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

.field setaIdRotaStatico:I

.field private spinnerSelectCl:Landroid/widget/TextView;

.field private spinnerVolume:Landroid/widget/Spinner;

.field private swManterBombona:Landroid/widget/Switch;

.field private swManterEtiqueta:Landroid/widget/Switch;

.field private swManterMTR:Landroid/widget/Switch;

.field private swQtdLitro:Landroid/widget/Switch;

.field private tvCodBarrasBombonaLer:Landroid/widget/EditText;

.field private tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

.field private tvRecPeso:Landroid/widget/TextView;

.field private twCodBombona:Landroid/text/TextWatcher;

.field private twCodEtiqueta:Landroid/text/TextWatcher;

.field private var1:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$-i06DJ6m6knivObBvptCV1c_Kc8(Lcom/coleta/ambientuus/activities/ColetarActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$processarColeta$15()V

    return-void
.end method

.method public static synthetic $r8$lambda$0fYT7Nfwhx5PncmU9EVH9bKHMrw(Lcom/coleta/ambientuus/activities/ColetarActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$9(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$5EUwQ8IqWw1_8axxEht7Sddoz4U(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$CW_jky8GhBemSFuhptH_VuEoAzY(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;Lcom/coleta/ambientuus/dto/ClienteMTR;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$loadSpinnerCliente$12(Landroid/view/View;Lcom/coleta/ambientuus/dto/ClienteMTR;)V

    return-void
.end method

.method public static synthetic $r8$lambda$F1X7ghyR0U7Qctkyu6udc8SpQaE(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$prepareReader$1(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$H1mZYJFgwFncgs0yaxtmHnqET4k(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$QL_RemS3HpwpsldBdNUgUDnK5is(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$SudJDFs08YQ0GyBnujYdAZ_IMDo(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$prepareReader$2(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$d1_O80Rgp-vfp3qgQKtTJfxUvys(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$8(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$gY1pbPeZbgw7Mz29zoSPIxhRJRk(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$loadSpinnerCliente$13(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$jXRmq3823LyWfMNKoQchp0gYXTA(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$10(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$jaQsZc_MTUhfGzpFe6NAp7VmI8U(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$lZK_NvqbTXt1iabwlM_a0dh8G1w(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$11(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$nsXh4cR0Pqc6IZ-FBEKRTNEAQ2M(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$prepareReader$0(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$piAnV3G2zVqfHuo3Hvv1xszxnXk(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$initButtons$4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$tFyJdQYYB55IYCSyBjN00Gca76Q(Lcom/coleta/ambientuus/activities/ColetarActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->lambda$openManifestosCliente$14(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetbStop(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bStop:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetbluetoothConectado(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetbtnLimparCamposColeta(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->btnLimparCamposColeta:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetleitorBombonaLauncher(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->leitorBombonaLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetleitorEtiquetaLauncher(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->leitorEtiquetaLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetleitorMTRLauncher(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->leitorMTRLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/bluetooth/BluetoothSocket;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDevice(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/bluetooth/BluetoothDevice;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mDevice:Landroid/bluetooth/BluetoothDevice;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDeviceUUID(Lcom/coleta/ambientuus/activities/ColetarActivity;)Ljava/util/UUID;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mDeviceUUID:Ljava/util/UUID;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mIsBluetoothConnected:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmIsUserInitiatedDisconnect(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mIsUserInitiatedDisconnect:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmMaxChars(Lcom/coleta/ambientuus/activities/ColetarActivity;)I
    .locals 0

    iget p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mMaxChars:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmReadThread(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mReadThread:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetprogressDialog(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/app/ProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->progressDialog:Landroid/app/ProgressDialog;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetspinnerVolume(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/Spinner;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgettvCodBarrasBombonaLer(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasBombonaLer:Landroid/widget/EditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgettvRecPeso(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvRecPeso:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputbStop(Lcom/coleta/ambientuus/activities/ColetarActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bStop:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmBTSocket(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/bluetooth/BluetoothSocket;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/ColetarActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mIsBluetoothConnected:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmReadThread(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mReadThread:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputprogressDialog(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/app/ProgressDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->progressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static bridge synthetic -$$Nest$mmsg(Lcom/coleta/ambientuus/activities/ColetarActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->msg(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$monBombonaSelect(Lcom/coleta/ambientuus/activities/ColetarActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->onBombonaSelect(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$monEtiquetaSelect(Lcom/coleta/ambientuus/activities/ColetarActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->onEtiquetaSelect(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 83
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 100
    const-string v0, "N"

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 101
    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 102
    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    .line 114
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mMaxChars:I

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mReadThread:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    .line 118
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mIsUserInitiatedDisconnect:Z

    .line 119
    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    .line 120
    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mIsBluetoothConnected:Z

    .line 125
    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bStop:Z

    return-void
.end method

.method private initFields()V
    .locals 2

    .line 327
    new-instance v0, Lcom/coleta/ambientuus/activities/ColetarActivity$2;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$2;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->twCodBombona:Landroid/text/TextWatcher;

    .line 352
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasBombonaLer:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->twCodBombona:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 353
    new-instance v0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$3;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->twCodEtiqueta:Landroid/text/TextWatcher;

    .line 378
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->twCodEtiqueta:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 379
    return-void
.end method

.method private isCodigoBarraValido(Ljava/lang/String;)Z
    .locals 1
    .param p1, "codBarra"    # Ljava/lang/String;

    .line 706
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private synthetic lambda$initButtons$10(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .line 484
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 486
    .local v0, "nroManifesto":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, "Aten\u00e7\u00e3o"

    if-nez v1, :cond_1

    .line 487
    new-instance v1, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;

    new-instance v3, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 488
    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->selectManifestoCod(Ljava/lang/String;)Lcom/coleta/ambientuus/dto/Manifesto;

    move-result-object v1

    .line 490
    .local v1, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    if-eqz v1, :cond_0

    .line 491
    new-instance v2, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    new-instance v3, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 492
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_manifesto()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->selectEtiquetaManifesto(Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v2

    .line 493
    .local v2, "etiquetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    new-instance v3, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;

    invoke-direct {v3, v2}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;-><init>(Ljava/util/List;)V

    .line 494
    .local v3, "bottomSheet":Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;
    new-instance v4, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda10;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda10;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v3, v4}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->setOnItemSelecionadoListener(Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment$OnItemSelecionadoListener;)V

    .line 499
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v4

    .line 500
    .local v4, "fm":Landroidx/fragment/app/FragmentManager;
    const-string v5, "EtiquetasManifestoBottomSheet"

    invoke-virtual {v3, v4, v5}, Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 501
    .end local v2    # "etiquetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    .end local v3    # "bottomSheet":Lcom/coleta/ambientuus/fragments/EtiquetasManifestoFragment;
    .end local v4    # "fm":Landroidx/fragment/app/FragmentManager;
    goto :goto_0

    .line 502
    :cond_0
    const-string v3, "Manifesto informado n\u00e3o encontrado na base do aplicativo"

    invoke-direct {p0, v2, v3}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarAlerta(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    .end local v1    # "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    :goto_0
    goto :goto_1

    .line 505
    :cond_1
    const-string v1, "Informe o N\u00famero de MTR antes de selecionar as etiquetas!"

    invoke-direct {p0, v2, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarAlerta(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    :goto_1
    return-void
.end method

.method private synthetic lambda$initButtons$11(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 510
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->openManifestosCliente(Ljava/util/ArrayList;)V

    .line 511
    return-void
.end method

.method private synthetic lambda$initButtons$3(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 383
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 384
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$4;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$4;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    .line 385
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 412
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 413
    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    if-eqz v0, :cond_0

    .line 414
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->llConteudo:Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setVisibility(I)V

    .line 415
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->setVisibility(I)V

    .line 417
    :cond_0
    return-void
.end method

.method private synthetic lambda$initButtons$4(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 419
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->processarColeta()V

    return-void
.end method

.method private synthetic lambda$initButtons$5(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 422
    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    if-eqz v0, :cond_0

    .line 423
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bStop:Z

    .line 424
    new-instance v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mReadThread:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    .line 426
    :cond_0
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->clearDataTotal()V

    .line 427
    return-void
.end method

.method private synthetic lambda$initButtons$6(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 430
    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    if-eqz v0, :cond_0

    .line 431
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bStop:Z

    .line 432
    new-instance v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mReadThread:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    .line 434
    :cond_0
    return-void
.end method

.method private synthetic lambda$initButtons$7(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 437
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 438
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$5;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$5;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    .line 439
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 457
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 458
    return-void
.end method

.method private synthetic lambda$initButtons$8(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 461
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 462
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$6;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$6;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    .line 463
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 480
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 481
    return-void
.end method

.method private synthetic lambda$initButtons$9(Ljava/lang/String;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/String;

    .line 496
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 498
    return-void
.end method

.method private synthetic lambda$loadSpinnerCliente$12(Landroid/view/View;Lcom/coleta/ambientuus/dto/ClienteMTR;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "selectedMotorista"    # Lcom/coleta/ambientuus/dto/ClienteMTR;

    .line 788
    invoke-virtual {p2}, Lcom/coleta/ambientuus/dto/ClienteMTR;->getId_pessoa()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    .line 789
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 790
    new-instance v0, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;

    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    .line 791
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->selectManifestosCliente(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 793
    .local v0, "manifestos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 794
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    .line 795
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->openManifestosCliente(Ljava/util/ArrayList;)V

    goto :goto_0

    .line 797
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Manifesto;

    .line 798
    .local v1, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 801
    .end local v1    # "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic lambda$loadSpinnerCliente$13(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 8
    .param p1, "helper"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .param p2, "lables"    # Ljava/util/List;
    .param p3, "v"    # Landroid/view/View;

    .line 780
    new-instance v4, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda12;

    invoke-direct {v4}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda12;-><init>()V

    iget-object v5, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    .line 786
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda13;

    invoke-direct {v7, p0, p3}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda13;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V

    .line 780
    const-string v3, "Selecione o Cliente"

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "lables":Ljava/util/List;
    .local v0, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .local v2, "lables":Ljava/util/List;
    invoke-virtual/range {v0 .. v7}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V

    .line 803
    return-void
.end method

.method static synthetic lambda$mostrarAlerta$16(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 1269
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$mostrarAlerta$17(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "acao"    # Ljava/lang/Runnable;
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 1278
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 1279
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1280
    return-void
.end method

.method private synthetic lambda$openManifestosCliente$14(Ljava/lang/String;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/String;

    .line 816
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 817
    return-void
.end method

.method private synthetic lambda$prepareReader$0(Landroidx/activity/result/ActivityResult;)V
    .locals 4
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 255
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0x7b

    if-ne v0, v1, :cond_0

    .line 256
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 257
    .local v0, "data":Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 258
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "valorDoLeitor"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 259
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 260
    .local v1, "retornoLeitor":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 261
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 262
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    .line 263
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    const-string v3, "Selecione"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "retornoLeitor":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private synthetic lambda$prepareReader$1(Landroidx/activity/result/ActivityResult;)V
    .locals 4
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 273
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0x7b

    if-ne v0, v1, :cond_2

    .line 274
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 275
    .local v0, "data":Landroid/content/Intent;
    if-eqz v0, :cond_2

    .line 276
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasBombonaLer:Landroid/widget/EditText;

    const-string v2, "codigoBarrasBombona"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 277
    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 278
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->onBombonaSelect(Ljava/lang/String;)V

    .line 279
    new-instance v1, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->selectCapacidadeBombonas(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->capacidadeBombona:Ljava/lang/Integer;

    .line 281
    :cond_0
    const-string v1, "idVolumeBombona"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 282
    .local v1, "idVolumeBombona":Ljava/lang/Integer;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterBombona:Landroid/widget/Switch;

    invoke-virtual {v2}, Landroid/widget/Switch;->isChecked()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->capacidadeBombona:Ljava/lang/Integer;

    if-eqz v2, :cond_1

    .line 284
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->capacidadeBombona:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->setSpinnerVolumeID(Ljava/lang/String;)V

    goto :goto_0

    .line 285
    :cond_1
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterBombona:Landroid/widget/Switch;

    invoke-virtual {v2}, Landroid/widget/Switch;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eqz v2, :cond_2

    .line 287
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->setSpinnerVolumeID(Ljava/lang/String;)V

    .line 291
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "idVolumeBombona":Ljava/lang/Integer;
    :cond_2
    :goto_0
    return-void
.end method

.method private synthetic lambda$prepareReader$2(Landroidx/activity/result/ActivityResult;)V
    .locals 3
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 298
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0x7c

    if-ne v0, v1, :cond_0

    .line 299
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 300
    .local v0, "data":Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 301
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "codigoBarrasEtiqueta"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 302
    .local v1, "retornoLeitor":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 305
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "retornoLeitor":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private synthetic lambda$processarColeta$15()V
    .locals 2

    .line 1168
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etPeso:Landroid/widget/EditText;

    const-string v1, "0,00"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private loadSpinnerCliente()V
    .locals 4

    .line 776
    new-instance v0, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->getAllClientesMTR()Ljava/util/List;

    move-result-object v0

    .line 778
    .local v0, "lables":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/ClienteMTR;>;"
    new-instance v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    invoke-direct {v1}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;-><init>()V

    .line 779
    .local v1, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<Lcom/coleta/ambientuus/dto/ClienteMTR;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    new-instance v3, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda9;

    invoke-direct {v3, p0, v1, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda9;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 804
    return-void
.end method

.method private loadSpinnerDataVolume()V
    .locals 5

    .line 751
    new-instance v0, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;->getAllVolumes()Ljava/util/List;

    move-result-object v0

    .line 752
    .local v0, "volumes":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Volume;>;"
    new-instance v1, Lcom/coleta/ambientuus/dto/Volume;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const-string v3, "0"

    const-string v4, "SELECIONE A BOMBONA"

    invoke-direct {v1, v3, v4, v2}, Lcom/coleta/ambientuus/dto/Volume;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Float;)V

    const/4 v2, 0x0

    invoke-interface {v0, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 754
    new-instance v1, Landroid/widget/ArrayAdapter;

    const v2, 0x1090008

    invoke-direct {v1, p0, v2, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 756
    .local v1, "dataAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/coleta/ambientuus/dto/Volume;>;"
    const v2, 0x1090009

    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 758
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 759
    return-void
.end method

.method private mostrarAlerta(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "titulo"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .line 1266
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1267
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1268
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1269
    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda0;-><init>()V

    const/4 v2, -0x3

    const-string v3, "OK"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1270
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1271
    return-void
.end method

.method private mostrarAlerta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 4
    .param p1, "titulo"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "acao"    # Ljava/lang/Runnable;

    .line 1274
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1275
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1276
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1277
    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda11;

    invoke-direct {v1, p3}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda11;-><init>(Ljava/lang/Runnable;)V

    const/4 v2, -0x3

    const-string v3, "OK"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1281
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1282
    return-void
.end method

.method private mostrarToast(Ljava/lang/String;)V
    .locals 0
    .param p1, "mensagem"    # Ljava/lang/String;

    .line 1285
    invoke-virtual {p0, p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1286
    return-void
.end method

.method private msg(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 949
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 950
    return-void
.end method

.method private onBombonaSelect(Ljava/lang/String;)V
    .locals 11
    .param p1, "codBombonaSel"    # Ljava/lang/String;

    .line 1073
    new-instance v0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0, p1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->getInfoBombona(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1075
    .local v0, "info":Landroid/database/Cursor;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    const-string v2, "Selecione"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1076
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1077
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 1078
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setClickable(Z)V

    .line 1079
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v1, v3}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 1080
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v1, v3}, Landroid/widget/Spinner;->setClickable(Z)V

    .line 1081
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_3

    .line 1083
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v1

    check-cast v1, Landroid/widget/ArrayAdapter;

    .line 1085
    .local v1, "dataAdapterVol":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/coleta/ambientuus/dto/Volume;>;"
    const/4 v4, 0x0

    .line 1086
    .local v4, "idCliente":Ljava/lang/String;
    const/4 v5, 0x0

    .line 1087
    .local v5, "nomeCliente":Ljava/lang/String;
    const/4 v6, 0x0

    .line 1088
    .local v6, "idVolume":Ljava/lang/String;
    const/4 v7, 0x0

    .line 1090
    .local v7, "descVolume":Ljava/lang/String;
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1091
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 1092
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 1094
    const/4 v8, 0x2

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1095
    const/4 v8, 0x3

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 1097
    :cond_0
    if-eqz v4, :cond_1

    const-string v3, "0"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1098
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1099
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 1100
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setClickable(Z)V

    .line 1102
    :cond_1
    if-eqz v7, :cond_3

    .line 1103
    new-instance v3, Lcom/coleta/ambientuus/dto/Volume;

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-direct {v3, v6, v7, v8}, Lcom/coleta/ambientuus/dto/Volume;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Float;)V

    .line 1104
    .local v3, "volumeBombona":Lcom/coleta/ambientuus/dto/Volume;
    invoke-virtual {v1, v3}, Landroid/widget/ArrayAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v8

    .line 1105
    .local v8, "pos":I
    if-ltz v8, :cond_2

    .line 1106
    iget-object v9, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v9, v8}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1107
    iget-object v9, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v9, v2}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 1108
    iget-object v9, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v9, v2}, Landroid/widget/Spinner;->setClickable(Z)V

    goto :goto_1

    .line 1110
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Volume n\u00e3o encontrado no adapter: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/Volume;->getDescricao()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "SPINNER_VOLUME"

    invoke-static {v10, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1111
    iget-object v9, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v9, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1115
    .end local v1    # "dataAdapterVol":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/coleta/ambientuus/dto/Volume;>;"
    .end local v3    # "volumeBombona":Lcom/coleta/ambientuus/dto/Volume;
    .end local v4    # "idCliente":Ljava/lang/String;
    .end local v5    # "nomeCliente":Ljava/lang/String;
    .end local v6    # "idVolume":Ljava/lang/String;
    .end local v7    # "descVolume":Ljava/lang/String;
    .end local v8    # "pos":I
    :cond_3
    :goto_1
    return-void
.end method

.method private onEtiquetaSelect(Ljava/lang/String;)V
    .locals 6
    .param p1, "etiqueta"    # Ljava/lang/String;

    .line 1118
    new-instance v0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1119
    .local v0, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1120
    .local v1, "clienteMTRTableManager":Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;
    invoke-virtual {v0, p1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->retornaManifestoEtiqueta(Ljava/lang/String;)Lcom/coleta/ambientuus/dto/Manifesto;

    move-result-object v2

    .line 1122
    .local v2, "manifesto":Lcom/coleta/ambientuus/dto/Manifesto;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1123
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    .line 1124
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    const-string v4, "Selecione"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1126
    if-eqz v2, :cond_0

    .line 1127
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1129
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_pessoa()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->getClienteMTR(Ljava/lang/Integer;)Lcom/coleta/ambientuus/dto/ClienteMTR;

    move-result-object v3

    .line 1130
    .local v3, "cliente":Lcom/coleta/ambientuus/dto/ClienteMTR;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/ClienteMTR;->getRazao_social()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1131
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Manifesto;->getId_pessoa()Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    .line 1132
    iget-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/ClienteMTR;->getRazao_social()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1135
    .end local v3    # "cliente":Lcom/coleta/ambientuus/dto/ClienteMTR;
    :cond_0
    return-void
.end method

.method private processaComCodigoBarra(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/String;
    .locals 11
    .param p1, "idRotaPref"    # Ljava/lang/String;
    .param p2, "idFrotaVeiculoPref"    # Ljava/lang/Integer;

    .line 711
    new-instance v0, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_bombona()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->validaCadastroBombona(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 712
    .local v0, "erroCad":Ljava/lang/String;
    if-eqz v0, :cond_0

    return-object v0

    .line 714
    :cond_0
    new-instance v1, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_bombona()Ljava/lang/String;

    move-result-object v2

    const-string v3, "C"

    invoke-virtual {v1, v2, v3}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->validaBombona(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 715
    .local v1, "erroValida":Ljava/lang/String;
    if-eqz v1, :cond_1

    return-object v1

    .line 717
    :cond_1
    new-instance v2, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v2, v3}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->insert(Lcom/coleta/ambientuus/dto/Coleta;)Ljava/lang/String;

    move-result-object v8

    .line 719
    .local v8, "idColeta":Ljava/lang/String;
    const-string v2, "NULL"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 720
    new-instance v4, Lcom/coleta/ambientuus/dto/MovimentoBombona;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_bombona()Ljava/lang/String;

    move-result-object v5

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 721
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getId_cliente_mtr()Ljava/lang/Integer;

    move-result-object v6

    const-string v7, "C"

    move-object v9, p1

    move-object v10, p2

    .end local p1    # "idRotaPref":Ljava/lang/String;
    .end local p2    # "idFrotaVeiculoPref":Ljava/lang/Integer;
    .local v9, "idRotaPref":Ljava/lang/String;
    .local v10, "idFrotaVeiculoPref":Ljava/lang/Integer;
    invoke-direct/range {v4 .. v10}, Lcom/coleta/ambientuus/dto/MovimentoBombona;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 726
    .local v4, "movimentoBombona":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    new-instance p1, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    iget-object p2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 727
    .local p1, "movimentoBombonaTableManager":Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
    invoke-virtual {p1, v4}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->insert(Lcom/coleta/ambientuus/dto/MovimentoBombona;)V

    goto :goto_0

    .line 719
    .end local v4    # "movimentoBombona":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    .end local v9    # "idRotaPref":Ljava/lang/String;
    .end local v10    # "idFrotaVeiculoPref":Ljava/lang/Integer;
    .local p1, "idRotaPref":Ljava/lang/String;
    .restart local p2    # "idFrotaVeiculoPref":Ljava/lang/Integer;
    :cond_2
    move-object v9, p1

    move-object v10, p2

    .line 730
    .end local p1    # "idRotaPref":Ljava/lang/String;
    .end local p2    # "idFrotaVeiculoPref":Ljava/lang/Integer;
    .restart local v9    # "idRotaPref":Ljava/lang/String;
    .restart local v10    # "idFrotaVeiculoPref":Ljava/lang/Integer;
    :goto_0
    const-string p1, ""

    return-object p1
.end method

.method private processarColeta()V
    .locals 24

    .line 1138
    move-object/from16 v0, p0

    new-instance v1, Lcom/coleta/ambientuus/dto/Coleta;

    .line 1139
    iget-boolean v2, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvRecPeso:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    iget-object v2, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etPeso:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    iget-object v3, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    .line 1140
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarHoraData:Landroid/widget/TextView;

    .line 1141
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    iget v5, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->setaIdRotaStatico:I

    .line 1142
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 1143
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdVolume:Ljava/lang/Integer;

    const/4 v7, 0x0

    if-eqz v6, :cond_2

    iget-object v6, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdVolume:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-nez v6, :cond_1

    goto :goto_1

    :cond_1
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdVolume:Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_2

    :cond_2
    :goto_1
    move v6, v7

    :goto_2
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move v8, v7

    iget-object v7, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    move v9, v8

    iget-object v8, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    move v10, v9

    iget-object v9, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    iget-object v11, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etObservacao:Landroid/widget/EditText;

    .line 1147
    invoke-virtual {v11}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1149
    iget-object v12, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    if-eqz v12, :cond_4

    iget-object v12, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-nez v12, :cond_3

    goto :goto_3

    :cond_3
    iget-object v12, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    goto :goto_4

    :cond_4
    :goto_3
    move v12, v10

    :goto_4
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 1150
    iget-object v13, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swQtdLitro:Landroid/widget/Switch;

    invoke-virtual {v13}, Landroid/widget/Switch;->isChecked()Z

    move-result v13

    if-eqz v13, :cond_5

    const-string v13, "LT"

    goto :goto_5

    :cond_5
    const-string v13, "QTD"

    :goto_5
    iget-object v14, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasBombonaLer:Landroid/widget/EditText;

    .line 1151
    invoke-virtual {v14}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    iget-object v15, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

    .line 1155
    invoke-virtual {v15}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v21, 0x0

    const/16 v22, 0x0

    move v15, v10

    move-object v10, v11

    const-string v11, "N"

    move/from16 v16, v15

    const/4 v15, 0x0

    move/from16 v17, v16

    const/16 v16, 0x0

    move/from16 v19, v17

    const/16 v17, 0x0

    move/from16 v20, v19

    const/16 v19, 0x0

    move/from16 v23, v20

    const/16 v20, 0x0

    invoke-direct/range {v1 .. v22}, Lcom/coleta/ambientuus/dto/Coleta;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 1162
    iget-object v1, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    const-string v2, "0,00"

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/dto/Coleta;->setPeso(Ljava/lang/String;)V

    .line 1164
    :cond_6
    iget-object v1, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_bombona()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->validarBombona(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    return-void

    .line 1166
    :cond_7
    iget-object v1, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    const-string v3, "."

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v9

    .line 1167
    .local v9, "peso":F
    const/high16 v1, 0x42c80000    # 100.0f

    cmpl-float v1, v9, v1

    if-lez v1, :cond_8

    .line 1168
    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda14;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda14;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    const-string v2, "Verifique"

    const-string v3, "Peso m\u00e1ximo permitido 100 Kg."

    invoke-direct {v0, v2, v3, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarAlerta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 1169
    return-void

    .line 1172
    :cond_8
    iget-object v1, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Coleta;->getNumero_mtr()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 1173
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 1174
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/Coleta;->getObservacao()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 1175
    invoke-virtual {v4}, Lcom/coleta/ambientuus/dto/Coleta;->getId_volume()I

    move-result v4

    iget-object v5, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 1176
    invoke-virtual {v5}, Lcom/coleta/ambientuus/dto/Coleta;->getCliente_ausente()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 1177
    invoke-virtual {v6}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_sem_residuo()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 1178
    invoke-virtual {v7}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_extra()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    .line 1179
    invoke-virtual {v8}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_Etiqueta()Ljava/lang/String;

    move-result-object v8

    .line 1172
    invoke-direct/range {v0 .. v8}, Lcom/coleta/ambientuus/activities/ColetarActivity;->validarCampos(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 1180
    return-void

    .line 1183
    :cond_9
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->AddData()V

    .line 1184
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->clearData()V

    .line 1186
    iget-boolean v1, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    if-eqz v1, :cond_a

    .line 1187
    const/4 v15, 0x0

    iput-boolean v15, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bStop:Z

    .line 1188
    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    iput-object v1, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mReadThread:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    .line 1190
    :cond_a
    return-void
.end method

.method private salvaDadosSemCodigoBarra()V
    .locals 2

    .line 734
    new-instance v0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->insert(Lcom/coleta/ambientuus/dto/Coleta;)Ljava/lang/String;

    .line 735
    return-void
.end method

.method private setSpinnerVolumeID(Ljava/lang/String;)V
    .locals 4
    .param p1, "idVolume"    # Ljava/lang/String;

    .line 762
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 764
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/coleta/ambientuus/dto/Volume;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 765
    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/dto/Volume;

    .line 766
    .local v2, "v":Lcom/coleta/ambientuus/dto/Volume;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/Volume;->getId_volume()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 767
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v3, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 768
    goto :goto_1

    .line 764
    .end local v2    # "v":Lcom/coleta/ambientuus/dto/Volume;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 772
    .end local v1    # "i":I
    :cond_1
    :goto_1
    return-void
.end method

.method private validarBombona(Ljava/lang/String;)Z
    .locals 3
    .param p1, "codigo"    # Ljava/lang/String;

    .line 1193
    const/4 v0, 0x1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1195
    :cond_0
    new-instance v1, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1, p1}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->validaCadastroBombona(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1196
    .local v1, "erro":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1197
    const-string v0, "Erro"

    invoke-direct {p0, v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarAlerta(Ljava/lang/String;Ljava/lang/String;)V

    .line 1198
    const/4 v0, 0x0

    return v0

    .line 1200
    :cond_1
    return v0

    .line 1193
    .end local v1    # "erro":Ljava/lang/String;
    :cond_2
    :goto_0
    return v0
.end method

.method private validarCampos(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 16
    .param p1, "nrMTR"    # Ljava/lang/String;
    .param p2, "peso"    # Ljava/lang/String;
    .param p3, "obs"    # Ljava/lang/String;
    .param p4, "idVolume"    # I
    .param p5, "ausente"    # Ljava/lang/String;
    .param p6, "semResiduo"    # Ljava/lang/String;
    .param p7, "extra"    # Ljava/lang/String;
    .param p8, "codEtiqueta"    # Ljava/lang/String;

    .line 1211
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xa

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v2, v3, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v5

    .line 1212
    .local v2, "mtrValido":Z
    :goto_0
    const-string v3, "0,00"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, " 0,00"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "0"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move v3, v5

    goto :goto_2

    :cond_2
    :goto_1
    move v3, v4

    .line 1213
    .local v3, "pesoZero":Z
    :goto_2
    if-eqz p4, :cond_3

    move v6, v4

    goto :goto_3

    :cond_3
    move v6, v5

    .line 1215
    .local v6, "temVolume":Z
    :goto_3
    const-string v7, "S"

    move-object/from16 v8, p5

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const-string v10, "Verifique o tamanho do MTR/DC (10)"

    if-nez v9, :cond_10

    move-object/from16 v9, p6

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    move-object/from16 v15, p1

    move-object/from16 v11, p7

    move-object/from16 v12, p8

    goto/16 :goto_5

    .line 1222
    :cond_4
    move-object/from16 v11, p7

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 1223
    if-nez v2, :cond_5

    .line 1224
    invoke-direct {v0, v10}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    .line 1225
    return v5

    .line 1227
    :cond_5
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1228
    const-string v4, "Informe o Peso"

    invoke-direct {v0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    .line 1229
    return v5

    .line 1231
    :cond_6
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 1232
    const-string v4, "Preencha o campo Observa\u00e7\u00e3o"

    invoke-direct {v0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    .line 1233
    return v5

    .line 1235
    :cond_7
    if-nez v6, :cond_8

    .line 1236
    const-string v4, "Selecione uma bombona"

    invoke-direct {v0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    .line 1237
    return v5

    .line 1239
    :cond_8
    return v4

    .line 1242
    :cond_9
    invoke-virtual/range {p8 .. p8}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 1243
    const-string v4, "Informe uma etiqueta"

    invoke-direct {v0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    .line 1244
    return v5

    .line 1246
    :cond_a
    new-instance v7, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v12, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v12}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12

    invoke-direct {v7, v12}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1247
    .local v7, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    move-object/from16 v12, p8

    invoke-virtual {v7, v12}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->retornaManifestoEtiqueta(Ljava/lang/String;)Lcom/coleta/ambientuus/dto/Manifesto;

    move-result-object v13

    .line 1248
    .local v13, "manifestoEtiqueta":Lcom/coleta/ambientuus/dto/Manifesto;
    if-eqz v13, :cond_b

    .line 1249
    invoke-virtual {v13}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v15, p1

    invoke-static {v14, v15}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_c

    .line 1250
    const-string v4, "Etiqueta informada n\u00e3o pertence a esse manifesto"

    invoke-direct {v0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    .line 1251
    return v5

    .line 1248
    :cond_b
    move-object/from16 v15, p1

    .line 1256
    .end local v7    # "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    .end local v13    # "manifestoEtiqueta":Lcom/coleta/ambientuus/dto/Manifesto;
    :cond_c
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_d

    if-eqz v2, :cond_d

    if-eqz v6, :cond_d

    return v4

    .line 1258
    :cond_d
    if-nez v2, :cond_e

    invoke-direct {v0, v10}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    goto :goto_4

    .line 1259
    :cond_e
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_f

    const-string v4, "Informe o peso"

    invoke-direct {v0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    goto :goto_4

    .line 1260
    :cond_f
    const-string v4, "Selecione uma Bombona"

    invoke-direct {v0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    .line 1262
    :goto_4
    return v5

    .line 1215
    :cond_10
    move-object/from16 v15, p1

    move-object/from16 v9, p6

    move-object/from16 v11, p7

    move-object/from16 v12, p8

    .line 1216
    :goto_5
    if-eqz v2, :cond_11

    if-eqz v3, :cond_11

    return v4

    .line 1217
    :cond_11
    if-nez v2, :cond_12

    invoke-direct {v0, v10}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    goto :goto_6

    .line 1218
    :cond_12
    const-string v4, "Peso deve ser 0,00"

    invoke-direct {v0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarToast(Ljava/lang/String;)V

    .line 1219
    :goto_6
    return v5
.end method


# virtual methods
.method public AddData()V
    .locals 5

    .line 690
    const-string v0, "ArquivoPreferencia"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 691
    .local v0, "preferences":Landroid/content/SharedPreferences;
    const-string v2, "id_rota"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 692
    .local v2, "idRotaPref":Ljava/lang/String;
    const-string v3, "id_frota_veiculo"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 694
    .local v1, "idFrotaVeiculoPref":Ljava/lang/Integer;
    const-string v3, ""

    .line 696
    .local v3, "erroMensagem":Ljava/lang/String;
    iget-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->coleta:Lcom/coleta/ambientuus/dto/Coleta;

    invoke-virtual {v4}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_bombona()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->isCodigoBarraValido(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 697
    invoke-direct {p0, v2, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->processaComCodigoBarra(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 699
    :cond_0
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->salvaDadosSemCodigoBarra()V

    .line 702
    :goto_0
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "Dados inclu\u00eddos com sucesso!"

    goto :goto_1

    :cond_1
    move-object v4, v3

    :goto_1
    invoke-virtual {p0, p0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 703
    return-void
.end method

.method public clearData()V
    .locals 8

    .line 209
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterMTR:Landroid/widget/Switch;

    invoke-virtual {v0}, Landroid/widget/Switch;->isChecked()Z

    move-result v0

    .line 210
    .local v0, "manterMTR":Z
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterBombona:Landroid/widget/Switch;

    invoke-virtual {v1}, Landroid/widget/Switch;->isChecked()Z

    move-result v1

    .line 211
    .local v1, "manterBombona":Z
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterEtiqueta:Landroid/widget/Switch;

    invoke-virtual {v2}, Landroid/widget/Switch;->isChecked()Z

    move-result v2

    .line 213
    .local v2, "manterEtique":Z
    const-string v3, ""

    const/4 v4, 0x0

    .line 216
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 213
    if-nez v0, :cond_0

    .line 214
    iget-object v6, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    invoke-virtual {v6, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 215
    iget-object v6, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    const-string v7, "Selecione"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    iput-object v5, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    .line 217
    iget-object v6, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swQtdLitro:Landroid/widget/Switch;

    invoke-virtual {v6, v4}, Landroid/widget/Switch;->setChecked(Z)V

    .line 220
    :cond_0
    if-nez v1, :cond_1

    .line 221
    iget-object v6, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v6, v4}, Landroid/widget/Spinner;->setSelection(I)V

    .line 222
    iput-object v5, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdVolume:Ljava/lang/Integer;

    .line 225
    :cond_1
    if-nez v2, :cond_2

    .line 226
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

    invoke-virtual {v5, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 229
    :cond_2
    if-eqz v0, :cond_3

    if-nez v1, :cond_4

    .line 230
    :cond_3
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etPeso:Landroid/widget/EditText;

    invoke-virtual {v5, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 231
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvRecPeso:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etObservacao:Landroid/widget/EditText;

    invoke-virtual {v5, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 233
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->recuperarData()V

    .line 234
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbClienteAusente:Landroid/widget/CheckBox;

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 235
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaSemResiduo:Landroid/widget/CheckBox;

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 236
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaExtra:Landroid/widget/CheckBox;

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 237
    const-string v3, "N"

    iput-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 238
    iput-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 239
    iput-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    .line 243
    :cond_4
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasBombonaLer:Landroid/widget/EditText;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 244
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 245
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setClickable(Z)V

    .line 246
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 247
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setClickable(Z)V

    .line 248
    return-void
.end method

.method public clearDataTotal()V
    .locals 4

    .line 587
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 588
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etPeso:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 589
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvRecPeso:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 590
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etObservacao:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 591
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->recuperarData()V

    .line 592
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbClienteAusente:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    .line 597
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 592
    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 593
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaSemResiduo:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 594
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaExtra:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 595
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 596
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    const-string v3, "Selecione"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 597
    iput-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    .line 598
    const-string v0, "N"

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 599
    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 600
    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    .line 601
    iput-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdVolume:Ljava/lang/Integer;

    .line 602
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterBombona:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 603
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterMTR:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 604
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swQtdLitro:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 606
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasBombonaLer:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 607
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 608
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterEtiqueta:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 610
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 611
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setClickable(Z)V

    .line 613
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 614
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setClickable(Z)V

    .line 615
    return-void
.end method

.method public existsScale()V
    .locals 5

    .line 311
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 312
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 313
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "br.com.urano.SOCKET"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x4

    if-eqz v3, :cond_0

    .line 314
    const-string v3, "CONECTADO"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    .line 315
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mDevice:Landroid/bluetooth/BluetoothDevice;

    .line 316
    const-string v2, "br.com.urano.uuid"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mDeviceUUID:Ljava/util/UUID;

    .line 317
    const-string v2, "br.com.urano.buffersize"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mMaxChars:I

    .line 318
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etPeso:Landroid/widget/EditText;

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setVisibility(I)V

    goto :goto_0

    .line 320
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    .line 321
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvRecPeso:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 322
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mBtnSendReq:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 324
    :goto_0
    return-void
.end method

.method public handleResult(Lcom/google/zxing/Result;)V
    .locals 2
    .param p1, "rawResult"    # Lcom/google/zxing/Result;

    .line 665
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->btnAdd:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 666
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->btnLimparCamposColeta:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 667
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 668
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->llConteudo:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setVisibility(I)V

    .line 669
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->setVisibility(I)V

    .line 670
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->letras:Ljava/lang/String;

    .line 671
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->processaresultado()V

    .line 672
    return-void
.end method

.method public initButtons()V
    .locals 2

    .line 382
    sget v0, Lcom/coleta/ambientuus/R$id;->btnAbrirCameraLeitorID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda15;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 419
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->btnAdd:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda16;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 421
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->btnLimparCamposColeta:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda17;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda17;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 429
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mBtnSendReq:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda18;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda18;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 436
    sget v0, Lcom/coleta/ambientuus/R$id;->btnScanBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 460
    sget v0, Lcom/coleta/ambientuus/R$id;->btnScanEtiqueta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 483
    sget v0, Lcom/coleta/ambientuus/R$id;->btnListagemEtiquetaMTR:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 509
    sget v0, Lcom/coleta/ambientuus/R$id;->btnBuscarMTR:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda4;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 512
    return-void
.end method

.method public initVariables()V
    .locals 2

    .line 178
    sget v0, Lcom/coleta/ambientuus/R$id;->txtDataHoraID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarHoraData:Landroid/widget/TextView;

    .line 179
    sget v0, Lcom/coleta/ambientuus/R$id;->btnLimparCamposPesoMtrID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->btnLimparCamposColeta:Landroid/widget/Button;

    .line 180
    sget v0, Lcom/coleta/ambientuus/R$id;->btnRecPesoID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mBtnSendReq:Landroid/widget/Button;

    .line 181
    sget v0, Lcom/coleta/ambientuus/R$id;->txtEditPesoID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etPeso:Landroid/widget/EditText;

    .line 182
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etPeso:Landroid/widget/EditText;

    new-instance v1, Landroid/text/method/ScrollingMovementMethod;

    invoke-direct {v1}, Landroid/text/method/ScrollingMovementMethod;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 183
    sget v0, Lcom/coleta/ambientuus/R$id;->txtEditPesoBTID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvRecPeso:Landroid/widget/TextView;

    .line 184
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvRecPeso:Landroid/widget/TextView;

    new-instance v1, Landroid/text/method/ScrollingMovementMethod;

    invoke-direct {v1}, Landroid/text/method/ScrollingMovementMethod;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 185
    sget v0, Lcom/coleta/ambientuus/R$id;->txtEditNumeroMtrID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    .line 186
    sget v0, Lcom/coleta/ambientuus/R$id;->btnAdicionarBaseID:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->btnAdd:Landroid/widget/Button;

    .line 187
    sget v0, Lcom/coleta/ambientuus/R$id;->checkBoxCLAusente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbClienteAusente:Landroid/widget/CheckBox;

    .line 188
    sget v0, Lcom/coleta/ambientuus/R$id;->checkBoxColSresiduo:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaSemResiduo:Landroid/widget/CheckBox;

    .line 189
    sget v0, Lcom/coleta/ambientuus/R$id;->checkBoxColExtra:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaExtra:Landroid/widget/CheckBox;

    .line 190
    sget v0, Lcom/coleta/ambientuus/R$id;->editTextObservacao:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etObservacao:Landroid/widget/EditText;

    .line 191
    sget v0, Lcom/coleta/ambientuus/R$id;->switchManterEtiqueta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterEtiqueta:Landroid/widget/Switch;

    .line 192
    sget v0, Lcom/coleta/ambientuus/R$id;->switchManterMTR:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterMTR:Landroid/widget/Switch;

    .line 193
    sget v0, Lcom/coleta/ambientuus/R$id;->switchManterBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swManterBombona:Landroid/widget/Switch;

    .line 194
    sget v0, Lcom/coleta/ambientuus/R$id;->switchQtdLitro:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->swQtdLitro:Landroid/widget/Switch;

    .line 195
    sget v0, Lcom/coleta/ambientuus/R$id;->spinnerVolume:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    .line 196
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v0, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 198
    sget v0, Lcom/coleta/ambientuus/R$id;->zxscan:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    .line 199
    sget v0, Lcom/coleta/ambientuus/R$id;->layout_resultbotao:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->llConteudo:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 200
    sget v0, Lcom/coleta/ambientuus/R$id;->spinnerSelecionaCliente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerSelectCl:Landroid/widget/TextView;

    .line 202
    sget v0, Lcom/coleta/ambientuus/R$id;->edtBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasBombonaLer:Landroid/widget/EditText;

    .line 203
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasBombonaLer:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 205
    sget v0, Lcom/coleta/ambientuus/R$id;->edtEtiqueta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->tvCodBarrasEtiquetaLer:Landroid/widget/EditText;

    .line 206
    return-void
.end method

.method public onCheckboxClicked(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 618
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/coleta/ambientuus/R$id;->checkBoxCLAusente:I

    const-string v2, "S"

    const/4 v3, 0x0

    const-string v4, "N"

    if-ne v0, v1, :cond_1

    .line 619
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbClienteAusente:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 620
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaExtra:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 621
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaSemResiduo:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 622
    iput-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 623
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 624
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    goto/16 :goto_0

    .line 626
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaExtra:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 627
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaSemResiduo:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 628
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 629
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 630
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    goto :goto_0

    .line 632
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/coleta/ambientuus/R$id;->checkBoxColExtra:I

    if-ne v0, v1, :cond_3

    .line 633
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaExtra:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 634
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbClienteAusente:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 635
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaSemResiduo:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 636
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 637
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 638
    iput-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    goto :goto_0

    .line 640
    :cond_2
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbClienteAusente:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 641
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaSemResiduo:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 642
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 643
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 644
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    goto :goto_0

    .line 646
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/coleta/ambientuus/R$id;->checkBoxColSresiduo:I

    if-ne v0, v1, :cond_5

    .line 647
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaSemResiduo:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 648
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbClienteAusente:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 649
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaExtra:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 650
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 651
    iput-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 652
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    goto :goto_0

    .line 654
    :cond_4
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbClienteAusente:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 655
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->chbColetaExtra:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 656
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbClAusente:Ljava/lang/String;

    .line 657
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColSemResiduo:Ljava/lang/String;

    .line 658
    iput-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->resChbColExtra:Ljava/lang/String;

    .line 661
    :cond_5
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 140
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 141
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_coletar:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->setContentView(I)V

    .line 142
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 143
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v2, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 145
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->myDB:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 147
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->initVariables()V

    .line 149
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->loadSpinnerCliente()V

    .line 151
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->loadSpinnerDataVolume()V

    .line 153
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->recuperarData()V

    .line 155
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->prepareReader()V

    .line 157
    const-string v0, "ArquivoPreferencia"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 158
    .local v0, "preferences":Landroid/content/SharedPreferences;
    const-string v3, "id_rota"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->setaIdRotaStatico:I

    .line 160
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->existsScale()V

    .line 162
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->initFields()V

    .line 164
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->initButtons()V

    .line 166
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v2}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 168
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v2

    new-instance v3, Lcom/coleta/ambientuus/activities/ColetarActivity$1;

    invoke-direct {v3, p0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity$1;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;Z)V

    invoke-virtual {v2, p0, v3}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 175
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 823
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v0

    sget v1, Lcom/coleta/ambientuus/R$id;->spinnerVolume:I

    if-ne v0, v1, :cond_0

    .line 824
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/Volume;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/Volume;->getId_volume()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 825
    .local v0, "itemId":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdVolume:Ljava/lang/Integer;

    .line 826
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->spinnerVolume:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 827
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v1

    const-string v2, "android.permission.CAMERA"

    invoke-interface {v1, v2}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v1

    new-instance v2, Lcom/coleta/ambientuus/activities/ColetarActivity$7;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$7;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-interface {v1, v2}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v1

    .line 849
    invoke-interface {v1}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 850
    iget-boolean v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    if-eqz v1, :cond_0

    .line 851
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->llConteudo:Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->setVisibility(I)V

    .line 852
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->setVisibility(I)V

    .line 857
    .end local v0    # "itemId":I
    :cond_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 860
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 954
    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    if-eqz v0, :cond_0

    .line 955
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mIsBluetoothConnected:Z

    if-eqz v0, :cond_0

    .line 956
    new-instance v0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/activities/ColetarActivity-IA;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 959
    :cond_0
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    .line 960
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 964
    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->bluetoothConectado:Z

    if-eqz v0, :cond_1

    .line 965
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mIsBluetoothConnected:Z

    if-nez v0, :cond_1

    .line 966
    :cond_0
    new-instance v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/activities/ColetarActivity-IA;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 969
    :cond_1
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 970
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .line 979
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 980
    return-void
.end method

.method protected onStop()V
    .locals 0

    .line 974
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    .line 975
    return-void
.end method

.method public openManifestosCliente(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/Manifesto;",
            ">;)V"
        }
    .end annotation

    .line 808
    .local p1, "manifestosCliente":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    move-object v0, p1

    .line 810
    .local v0, "manifestos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Manifesto;>;"
    if-nez p1, :cond_0

    .line 811
    new-instance v1, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;

    new-instance v2, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->recebeIdClienteMTR:Ljava/lang/Integer;

    .line 812
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;->selectManifestosCliente(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 814
    :cond_0
    new-instance v1, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;-><init>(Ljava/util/List;)V

    .line 815
    .local v1, "bottomSheet":Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;
    new-instance v2, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda8;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->setOnItemSelecionadoListener(Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment$OnItemSelecionadoListener;)V

    .line 818
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    .line 819
    .local v2, "fm":Landroidx/fragment/app/FragmentManager;
    const-string v3, "ManifestosClienteBottomSheet"

    invoke-virtual {v1, v2, v3}, Lcom/coleta/ambientuus/fragments/ManifestosClienteFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 820
    return-void
.end method

.method public prepareReader()V
    .locals 2

    .line 252
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda5;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->leitorMTRLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 270
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda6;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->leitorBombonaLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 295
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda7;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->leitorEtiquetaLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 308
    return-void
.end method

.method public processaresultado()V
    .locals 3

    .line 675
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->letras:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 676
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->letras:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->var1:Ljava/lang/String;

    goto :goto_0

    .line 678
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->letras:Ljava/lang/String;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->var1:Ljava/lang/String;

    .line 680
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->var1:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 681
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->var1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 683
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->etNrMTR:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 684
    const-string v0, " ERRO AO LER CODIGO DE BARRAS "

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 686
    :goto_1
    return-void
.end method

.method public recuperarData()V
    .locals 4

    .line 740
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    .line 742
    .local v0, "dataAtual":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd/MM/yyyy HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 744
    .local v1, "dateFormat":Ljava/text/DateFormat;
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 746
    .local v2, "hoje":Ljava/lang/String;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity;->mostrarHoraData:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 747
    return-void
.end method

.method public showToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/String;

    .line 1067
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1068
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1069
    return-void
.end method
