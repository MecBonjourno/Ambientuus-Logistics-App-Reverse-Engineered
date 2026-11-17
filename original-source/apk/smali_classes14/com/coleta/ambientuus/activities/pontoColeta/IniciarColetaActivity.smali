.class public Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;
.super Lcom/coleta/ambientuus/activities/main/BaseActivity;
.source "IniciarColetaActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;,
        Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;,
        Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;
    }
.end annotation


# instance fields
.field private bStop:Z

.field private bluetoothConectado:Ljava/lang/Boolean;

.field private btnLerPeso:Landroid/widget/Button;

.field private databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private etiquetaAtual:J

.field private etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

.field private idTipoResiduo:Ljava/lang/Integer;

.field private mBTSocket:Landroid/bluetooth/BluetoothSocket;

.field private mDevice:Landroid/bluetooth/BluetoothDevice;

.field private mDeviceUUID:Ljava/util/UUID;

.field private mIsBluetoothConnected:Z

.field private mIsUserInitiatedDisconnect:Z

.field private mMaxChars:I

.field private mReadThread:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

.field private pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

.field private progressDialog:Landroid/app/ProgressDialog;

.field private qtdEtiquetas:J

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

.field private smColetaExtra:Landroidx/appcompat/widget/SwitchCompat;

.field private smManterBombona:Landroidx/appcompat/widget/SwitchCompat;

.field private smManterNrMTR:Landroidx/appcompat/widget/SwitchCompat;

.field private tieBombona:Landroid/widget/AutoCompleteTextView;

.field private tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

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
.method public static synthetic $r8$lambda$07lTQcM0tsI4iElGON1lG2et8ho(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$initButtons$6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$F-mm2H761cMQYQFdGLwBmZ33rFw(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$initButtons$8(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$IrmNXBETfHmpCofWp1bpMOsODJ0(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/widget/CompoundButton;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$initFields$0(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$O9N8SwCgqr_mGQ6R7fINi1TFIuQ(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$initButtons$9(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Q-oJjYATspxT-8PSsYZyeABjsPU(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/dto/TipoResiduo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$loadDataTipoResiduo$2(Lcom/coleta/ambientuus/dto/TipoResiduo;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ZHHQV0pInA4ot3G7Bgs7j0h37Ns(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$initReader$4(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$dR7L9ZGKLbnDi53RdeWxGQzKnls(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$initButtons$10(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$eRk9g5dFn11_NWPQp01eqXaaDbI(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$initButtons$7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$m7brjWbPEctV8xH94Rw3nF1ZbvI(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$validarCampos$11()V

    return-void
.end method

.method public static synthetic $r8$lambda$nAU-C79vPCFAF3s207URxP0mb4k(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$initReader$5(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$vtU6dj4bAYFiPk5j4IHwhSnzSTA(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$prepareColetaExtra$1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$xWipWMmOqQbguRJA-9DPMrgy1AI(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->lambda$loadDataTipoResiduo$3(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetbStop(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bStop:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/bluetooth/BluetoothSocket;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDevice(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/bluetooth/BluetoothDevice;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mDevice:Landroid/bluetooth/BluetoothDevice;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDeviceUUID(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Ljava/util/UUID;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mDeviceUUID:Ljava/util/UUID;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mIsBluetoothConnected:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmIsUserInitiatedDisconnect(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mIsUserInitiatedDisconnect:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmMaxChars(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)I
    .locals 0

    iget p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mMaxChars:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmReadThread(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mReadThread:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetprogressDialog(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/app/ProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->progressDialog:Landroid/app/ProgressDialog;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetreaderLauncher(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->readerLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgettiePeso(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/google/android/material/textfield/TextInputEditText;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputbStop(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bStop:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/bluetooth/BluetoothSocket;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mIsBluetoothConnected:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmReadThread(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mReadThread:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputprogressDialog(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/app/ProgressDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->progressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static bridge synthetic -$$Nest$mmsg(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->msg(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 77
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;-><init>()V

    .line 97
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 100
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->idTipoResiduo:Ljava/lang/Integer;

    .line 108
    const/16 v1, 0x3e8

    iput v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mMaxChars:I

    .line 111
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mReadThread:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    .line 112
    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mIsUserInitiatedDisconnect:Z

    .line 113
    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mIsBluetoothConnected:Z

    .line 114
    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bStop:Z

    return-void
.end method

.method private disableEtiqueta()V
    .locals 4

    .line 243
    iget-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    if-eqz v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setEnabled(Z)V

    .line 246
    :cond_0
    return-void
.end method

.method private getInfoEtiqueta()V
    .locals 7

    .line 227
    new-instance v0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 228
    .local v0, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->buscarIntervaloEtiquetas(I)Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    move-result-object v1

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    .line 229
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getUltima()J

    move-result-wide v1

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getPrimeira()J

    move-result-wide v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->qtdEtiquetas:J

    .line 230
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 231
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 230
    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->buscaUltimaEtiqueta(II)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    .line 232
    iget-wide v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    const-wide/16 v5, 0x0

    cmp-long v1, v1, v5

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getPrimeira()J

    move-result-wide v1

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    add-long/2addr v1, v3

    :goto_0
    iput-wide v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    .line 233
    return-void
.end method

.method private initButtons()V
    .locals 5

    .line 297
    sget v0, Lcom/coleta/ambientuus/R$id;->btnLerMTRDC:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 298
    .local v0, "btnLerMTRDC":Landroid/widget/Button;
    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 299
    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda6;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 319
    sget v1, Lcom/coleta/ambientuus/R$id;->btnLerPeso:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->btnLerPeso:Landroid/widget/Button;

    .line 320
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->btnLerPeso:Landroid/widget/Button;

    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda7;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 339
    sget v1, Lcom/coleta/ambientuus/R$id;->btnLimpar:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 340
    .local v1, "btnLimpar":Landroid/widget/Button;
    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda8;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 345
    sget v2, Lcom/coleta/ambientuus/R$id;->btnLancar:I

    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 346
    .local v2, "btnLancar":Landroid/widget/Button;
    new-instance v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda9;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda9;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 348
    sget v3, Lcom/coleta/ambientuus/R$id;->btnFinalizar:I

    invoke-virtual {p0, v3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 349
    .local v3, "btnFinalizar":Landroid/widget/Button;
    new-instance v4, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda10;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda10;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    return-void
.end method

.method private initEtiquetaText()V
    .locals 8

    .line 236
    sget v0, Lcom/coleta/ambientuus/R$id;->tvEtiquetaQtd:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 237
    .local v0, "tvEtiquetaQtd":Landroid/widget/TextView;
    iget-wide v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    .line 238
    .local v1, "etiquetaAtualVer":J
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getPrimeira()J

    move-result-wide v3

    sub-long v3, v1, v3

    .line 239
    .local v3, "qtdEtiquetaAtual":J
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " de "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->qtdEtiquetas:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Etiqueta "

    invoke-static {v6, v5}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldSufix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 240
    return-void
.end method

.method private initFields()V
    .locals 2

    .line 136
    sget v0, Lcom/coleta/ambientuus/R$id;->tieNroMtrDc:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    .line 137
    sget v0, Lcom/coleta/ambientuus/R$id;->smManterNrMTR:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smManterNrMTR:Landroidx/appcompat/widget/SwitchCompat;

    .line 138
    sget v0, Lcom/coleta/ambientuus/R$id;->tiePeso:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    .line 139
    sget v0, Lcom/coleta/ambientuus/R$id;->radio_qtd:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->radioQtd:Landroid/widget/RadioButton;

    .line 140
    sget v0, Lcom/coleta/ambientuus/R$id;->radio_peso:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->radioPeso:Landroid/widget/RadioButton;

    .line 141
    sget v0, Lcom/coleta/ambientuus/R$id;->tieBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    .line 142
    sget v0, Lcom/coleta/ambientuus/R$id;->smManterBombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smManterBombona:Landroidx/appcompat/widget/SwitchCompat;

    .line 143
    sget v0, Lcom/coleta/ambientuus/R$id;->tieObservacao:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieObservacao:Lcom/google/android/material/textfield/TextInputEditText;

    .line 145
    sget v0, Lcom/coleta/ambientuus/R$id;->smColetaExtra:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smColetaExtra:Landroidx/appcompat/widget/SwitchCompat;

    .line 146
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smColetaExtra:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 157
    return-void
.end method

.method private initReader()V
    .locals 2

    .line 271
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda13;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->readerLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 284
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->readerLauncherEtiqueta:Landroidx/activity/result/ActivityResultLauncher;

    .line 294
    return-void
.end method

.method private initTipoColeta()V
    .locals 5

    .line 264
    sget v0, Lcom/coleta/ambientuus/R$id;->tvTipoColeta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 265
    .local v0, "tvTipoColeta":Landroid/widget/TextView;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tipoPesagem:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tipoPesagem:Ljava/lang/String;

    .line 266
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 267
    .local v1, "tipoPesagemTexto":Ljava/lang/String;
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    return-void
.end method

.method private synthetic lambda$initButtons$10(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .line 350
    const/4 v0, 0x1

    .line 351
    .local v0, "finaliza":Z
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getSelectedBombona()Lcom/coleta/ambientuus/dto/Volume;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieObservacao:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 352
    :cond_0
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->saveColeta()Z

    move-result v0

    .line 354
    :cond_1
    if-eqz v0, :cond_3

    .line 355
    iget-wide v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getUltima()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-gtz v1, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->finalizeColeta(Ljava/lang/Boolean;)V

    .line 357
    :cond_3
    return-void
.end method

.method private synthetic lambda$initButtons$6(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 299
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 300
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    .line 301
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 317
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 299
    return-void
.end method

.method private synthetic lambda$initButtons$7(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 333
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bluetoothConectado:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 334
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bStop:Z

    .line 335
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mReadThread:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    .line 337
    :cond_0
    return-void
.end method

.method private synthetic lambda$initButtons$8(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 341
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->clearFields()V

    .line 342
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initDefaultData()V

    .line 343
    return-void
.end method

.method private synthetic lambda$initButtons$9(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 346
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->saveColeta()Z

    return-void
.end method

.method private synthetic lambda$initFields$0(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .param p1, "v"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 147
    if-eqz p2, :cond_0

    .line 148
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->prepareColetaExtra()V

    goto :goto_0

    .line 150
    :cond_0
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->changeColetaExtraVisibility(I)V

    .line 151
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    .line 152
    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 153
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->idTipoResiduo:Ljava/lang/Integer;

    .line 155
    :goto_0
    return-void
.end method

.method private synthetic lambda$initReader$4(Landroidx/activity/result/ActivityResult;)V
    .locals 4
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 274
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_1

    .line 275
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 276
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "Erro ao retornar codigo de Barras"

    invoke-static {v0, v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 277
    const-string v1, "codigoBarras"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 278
    .local v1, "codigoBarras":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 279
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xa

    if-le v2, v3, :cond_0

    .line 280
    const/4 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 281
    :cond_0
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v2, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 283
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "codigoBarras":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private synthetic lambda$initReader$5(Landroidx/activity/result/ActivityResult;)V
    .locals 3
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 287
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 288
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 289
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "Erro ao retornar codigo de Barras"

    invoke-static {v0, v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 290
    const-string v1, "codigoBarras"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 291
    .local v1, "codigoBarras":Ljava/lang/String;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v2, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 293
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "codigoBarras":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private synthetic lambda$loadDataTipoResiduo$2(Lcom/coleta/ambientuus/dto/TipoResiduo;)V
    .locals 1
    .param p1, "selectedItem"    # Lcom/coleta/ambientuus/dto/TipoResiduo;

    .line 203
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/TipoResiduo;->getId_tipo_residuo()Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->idTipoResiduo:Ljava/lang/Integer;

    return-void
.end method

.method private synthetic lambda$loadDataTipoResiduo$3(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;Landroid/view/View;)V
    .locals 8
    .param p1, "helper"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .param p2, "tipoResiduos"    # Ljava/util/List;
    .param p3, "v"    # Landroid/view/View;

    .line 196
    new-instance v4, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda11;

    invoke-direct {v4}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda11;-><init>()V

    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 202
    invoke-virtual {v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda12;

    invoke-direct {v7, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda12;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    .line 196
    const-string v3, "Selecione o Tipo de Res\u00edduo"

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    .end local p1    # "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .end local p2    # "tipoResiduos":Ljava/util/List;
    .local v0, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .local v2, "tipoResiduos":Ljava/util/List;
    invoke-virtual/range {v0 .. v7}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V

    return-void
.end method

.method private synthetic lambda$prepareColetaExtra$1(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 180
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 181
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->readerLauncherEtiqueta:Landroidx/activity/result/ActivityResultLauncher;

    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 182
    return-void
.end method

.method static synthetic lambda$showConfirm$12(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "acao"    # Ljava/lang/Runnable;
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 539
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 540
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 541
    return-void
.end method

.method private synthetic lambda$validarCampos$11()V
    .locals 2

    .line 488
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    const-string v1, "0,00"

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private loadDataBombona()V
    .locals 3

    .line 212
    new-instance v0, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/VolumeTableManager;->getAllVolumes()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->volumes:Ljava/util/List;

    .line 213
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x109000a

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->volumes:Ljava/util/List;

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 215
    .local v0, "dataAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/coleta/ambientuus/dto/Volume;>;"
    const v1, 0x1090009

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 216
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1, v0}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 217
    return-void
.end method

.method private loadDataBombonaExtra()V
    .locals 3

    .line 220
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x109000a

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->volumes:Ljava/util/List;

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 222
    .local v0, "dataAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/coleta/ambientuus/dto/Volume;>;"
    const v1, 0x1090009

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 223
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v1, v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 224
    return-void
.end method

.method private msg(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 799
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 800
    return-void
.end method

.method private prepareColetaExtra()V
    .locals 6

    .line 171
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->changeColetaExtraVisibility(I)V

    .line 172
    sget v1, Lcom/coleta/ambientuus/R$id;->tieEtiquetaExtra:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    .line 173
    sget v1, Lcom/coleta/ambientuus/R$id;->tieResiduoExtra:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 174
    sget v1, Lcom/coleta/ambientuus/R$id;->tieBombonaExtra:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    .line 175
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->loadDataTipoResiduo()V

    .line 176
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->loadDataBombonaExtra()V

    .line 178
    sget v1, Lcom/coleta/ambientuus/R$id;->btnLerEtiquetaExtra:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 179
    .local v1, "btnLerEtiquetaExtra":Landroid/widget/Button;
    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    iget-wide v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 185
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v2, v0}, Lcom/google/android/material/textfield/TextInputEditText;->setEnabled(Z)V

    .line 186
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 187
    invoke-static {v1, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 188
    sget v0, Lcom/coleta/ambientuus/R$id;->coletaExtraEtiqueta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 190
    :cond_0
    return-void
.end method

.method private saveColeta()Z
    .locals 3

    .line 567
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->createColeta()Lcom/coleta/ambientuus/dto/Coleta;

    move-result-object v0

    .line 568
    .local v0, "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->validarCampos(Lcom/coleta/ambientuus/dto/Coleta;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 569
    const/4 v1, 0x0

    return v1

    .line 571
    :cond_0
    new-instance v1, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->insert(Lcom/coleta/ambientuus/dto/Coleta;)Ljava/lang/String;

    .line 572
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->updateStatusPontoColetaLastEtiqueta()V

    .line 573
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->clearFields()V

    .line 574
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initDefaultData()V

    .line 575
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->updateDataEtiqueta()V

    .line 576
    const/4 v1, 0x1

    return v1
.end method

.method private showConfirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 7
    .param p1, "titulo"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "acao"    # Ljava/lang/Runnable;

    .line 532
    new-instance v5, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda5;

    invoke-direct {v5, p3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda5;-><init>(Ljava/lang/Runnable;)V

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

    .line 544
    return-void
.end method

.method private updateStatusPontoColeta()V
    .locals 3

    .line 556
    new-instance v0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 557
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "200"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->updateStatus(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 559
    return-void
.end method

.method private validarCampos(Lcom/coleta/ambientuus/dto/Coleta;)Z
    .locals 16
    .param p1, "coleta"    # Lcom/coleta/ambientuus/dto/Coleta;

    .line 471
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getNumero_mtr()Ljava/lang/String;

    move-result-object v1

    .line 472
    .local v1, "nrMTR":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getPeso()Ljava/lang/String;

    move-result-object v2

    .line 473
    .local v2, "peso":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getObservacao()Ljava/lang/String;

    move-result-object v3

    .line 474
    .local v3, "obs":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getId_volume()I

    move-result v4

    .line 475
    .local v4, "idVolume":I
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getColeta_extra()Ljava/lang/String;

    move-result-object v5

    .line 476
    .local v5, "extra":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/coleta/ambientuus/dto/Coleta;->getCod_Etiqueta()Ljava/lang/String;

    move-result-object v6

    .line 478
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

    .line 479
    .local v7, "mtrValido":Z
    :goto_0
    if-eqz v4, :cond_1

    move v8, v9

    goto :goto_1

    :cond_1
    move v8, v10

    .line 481
    .local v8, "temVolume":Z
    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 482
    const-string v9, "Informe o Peso"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showMessage(Ljava/lang/String;)V

    .line 483
    return v10

    .line 486
    :cond_2
    const-string v11, ","

    const-string v12, "."

    invoke-virtual {v2, v11, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    .line 487
    .local v11, "pesof":F
    const/high16 v12, 0x42c80000    # 100.0f

    cmpl-float v12, v11, v12

    if-lez v12, :cond_3

    .line 488
    new-instance v9, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda0;

    invoke-direct {v9, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    const-string v12, "Verifique"

    const-string v13, "Peso m\u00e1ximo permitido 100 Kg."

    invoke-direct {v0, v12, v13, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showConfirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 489
    return v10

    .line 492
    :cond_3
    const-string v12, "S"

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    const-string v13, "Verifique o tamanho do MTR/DC (10)"

    if-eqz v12, :cond_6

    .line 493
    if-nez v7, :cond_4

    .line 494
    invoke-virtual {v0, v13}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showMessage(Ljava/lang/String;)V

    .line 495
    return v10

    .line 501
    :cond_4
    if-nez v8, :cond_5

    .line 502
    const-string v9, "Selecione uma bombona"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showMessage(Ljava/lang/String;)V

    .line 503
    return v10

    .line 505
    :cond_5
    return v9

    .line 508
    :cond_6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_7

    .line 509
    const-string v9, "Informe uma etiqueta"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showMessage(Ljava/lang/String;)V

    .line 510
    return v10

    .line 512
    :cond_7
    new-instance v12, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v14, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v14}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v14

    invoke-direct {v12, v14}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 513
    .local v12, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    invoke-virtual {v12, v6}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->retornaManifestoEtiqueta(Ljava/lang/String;)Lcom/coleta/ambientuus/dto/Manifesto;

    move-result-object v14

    .line 514
    .local v14, "manifestoEtiqueta":Lcom/coleta/ambientuus/dto/Manifesto;
    if-eqz v14, :cond_8

    .line 515
    invoke-virtual {v14}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_8

    .line 516
    const-string v9, "Etiqueta informada n\u00e3o pertence a esse manifesto"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showMessage(Ljava/lang/String;)V

    .line 517
    return v10

    .line 522
    .end local v12    # "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    .end local v14    # "manifestoEtiqueta":Lcom/coleta/ambientuus/dto/Manifesto;
    :cond_8
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_9

    if-eqz v7, :cond_9

    if-eqz v8, :cond_9

    return v9

    .line 524
    :cond_9
    if-nez v7, :cond_a

    invoke-virtual {v0, v13}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showMessage(Ljava/lang/String;)V

    goto :goto_2

    .line 525
    :cond_a
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_b

    const-string v9, "Informe o peso"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showMessage(Ljava/lang/String;)V

    goto :goto_2

    .line 526
    :cond_b
    const-string v9, "Selecione uma Bombona"

    invoke-virtual {v0, v9}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showMessage(Ljava/lang/String;)V

    .line 528
    :goto_2
    return v10
.end method


# virtual methods
.method public changeColetaExtraVisibility(I)V
    .locals 1
    .param p1, "TYPE"    # I

    .line 208
    sget v0, Lcom/coleta/ambientuus/R$id;->coletaExtra:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 209
    return-void
.end method

.method public clearFields()V
    .locals 3

    .line 376
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smManterNrMTR:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_0

    .line 377
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 379
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 380
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smManterBombona:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v0

    if-nez v0, :cond_1

    .line 381
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 383
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieObservacao:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 384
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smColetaExtra:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 385
    sget v0, Lcom/coleta/ambientuus/R$id;->smManterBombonaExtra:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    .line 386
    .local v0, "smManterBombonaExtra":Landroidx/appcompat/widget/SwitchCompat;
    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v2

    if-nez v2, :cond_2

    .line 387
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v2, v1}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    :cond_2
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v2, v1}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 391
    .end local v0    # "smManterBombonaExtra":Landroidx/appcompat/widget/SwitchCompat;
    :cond_3
    return-void
.end method

.method public createColeta()Lcom/coleta/ambientuus/dto/Coleta;
    .locals 29

    .line 394
    move-object/from16 v0, p0

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 395
    .local v1, "dataAtual":Ljava/util/Date;
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "dd/MM/yyyy HH:mm:ss"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 396
    .local v2, "dateFormat":Ljava/text/DateFormat;
    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    .line 397
    .local v6, "hoje":Ljava/lang/String;
    const-string v3, "ArquivoPreferencia"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 398
    .local v3, "preferences":Landroid/content/SharedPreferences;
    const-string v5, "id_rota"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v25

    .line 399
    .local v25, "idRota":I
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tiePeso:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v5}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 400
    .local v5, "peso":Ljava/lang/String;
    iget-wide v7, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    .line 401
    .local v7, "etiquetaColeta":Ljava/lang/String;
    iget-wide v8, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_0

    .line 402
    iget-object v8, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieEtiquetaExtra:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v8}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v20, v7

    goto :goto_0

    .line 401
    :cond_0
    move-object/from16 v20, v7

    .line 404
    .end local v7    # "etiquetaColeta":Ljava/lang/String;
    .local v20, "etiquetaColeta":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getSelectedBombona()Lcom/coleta/ambientuus/dto/Volume;

    move-result-object v26

    .line 405
    .local v26, "volume":Lcom/coleta/ambientuus/dto/Volume;
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getSelectedBombonaExtra()Lcom/coleta/ambientuus/dto/Volume;

    move-result-object v27

    .line 407
    .local v27, "volumeExtra":Lcom/coleta/ambientuus/dto/Volume;
    move-object v7, v3

    .end local v3    # "preferences":Landroid/content/SharedPreferences;
    .local v7, "preferences":Landroid/content/SharedPreferences;
    new-instance v3, Lcom/coleta/ambientuus/dto/Coleta;

    iget-object v8, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    .line 409
    invoke-virtual {v8}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-static {v8}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/text/Editable;

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .line 411
    move-object v9, v7

    .end local v7    # "preferences":Landroid/content/SharedPreferences;
    .local v9, "preferences":Landroid/content/SharedPreferences;
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 412
    if-nez v26, :cond_1

    move v10, v4

    goto :goto_1

    :cond_1
    invoke-virtual/range {v26 .. v26}, Lcom/coleta/ambientuus/dto/Volume;->getId_volume()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    :goto_1
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 415
    iget-object v11, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smColetaExtra:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v11}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v11

    if-eqz v11, :cond_2

    const-string v11, "S"

    goto :goto_2

    :cond_2
    const-string v11, "N"

    :goto_2
    iget-object v12, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieObservacao:Lcom/google/android/material/textfield/TextInputEditText;

    .line 416
    invoke-virtual {v12}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    iget-object v13, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 418
    invoke-virtual {v13}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v14

    .line 419
    iget-object v13, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->radioQtd:Landroid/widget/RadioButton;

    invoke-virtual {v13}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v13

    if-eqz v13, :cond_3

    const-string v13, "QTD"

    goto :goto_3

    :cond_3
    const-string v13, "LT"

    :goto_3
    move-object v15, v13

    .line 425
    iget-object v13, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->idTipoResiduo:Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    if-nez v13, :cond_4

    const/4 v13, 0x0

    goto :goto_4

    :cond_4
    iget-object v13, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->idTipoResiduo:Ljava/lang/Integer;

    :goto_4
    move-object/from16 v21, v13

    .line 426
    if-nez v27, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual/range {v27 .. v27}, Lcom/coleta/ambientuus/dto/Volume;->getId_volume()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_5
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    iget-object v4, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 427
    invoke-virtual {v4}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdColetaLogradouro()Ljava/lang/Integer;

    move-result-object v23

    iget-object v4, v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 428
    invoke-virtual {v4}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdDiaColeta()Ljava/lang/Integer;

    move-result-object v24

    move-object v4, v9

    .end local v9    # "preferences":Landroid/content/SharedPreferences;
    .local v4, "preferences":Landroid/content/SharedPreferences;
    const-string v9, "N"

    move-object v13, v4

    move-object v4, v5

    move-object v5, v8

    move-object v8, v10

    .end local v5    # "peso":Ljava/lang/String;
    .local v4, "peso":Ljava/lang/String;
    .local v13, "preferences":Landroid/content/SharedPreferences;
    const-string v10, "N"

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

    move-object/from16 v28, v19

    .end local v19    # "preferences":Landroid/content/SharedPreferences;
    .local v28, "preferences":Landroid/content/SharedPreferences;
    const/16 v19, 0x0

    invoke-direct/range {v3 .. v24}, Lcom/coleta/ambientuus/dto/Coleta;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 430
    .local v3, "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    return-object v3
.end method

.method public existsScale()V
    .locals 5

    .line 361
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 362
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 363
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "br.com.urano.SOCKET"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    .line 364
    const-string v3, "CONECTADO"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bluetoothConectado:Ljava/lang/Boolean;

    .line 365
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mDevice:Landroid/bluetooth/BluetoothDevice;

    .line 366
    const-string v2, "br.com.urano.uuid"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mDeviceUUID:Ljava/util/UUID;

    .line 367
    const-string v2, "br.com.urano.buffersize"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mMaxChars:I

    .line 368
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->btnLerPeso:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 370
    :cond_0
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bluetoothConectado:Ljava/lang/Boolean;

    .line 371
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->btnLerPeso:Landroid/widget/Button;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 373
    :goto_0
    return-void
.end method

.method public finalizeColeta(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "pendente"    # Ljava/lang/Boolean;

    .line 580
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 581
    .local v0, "intent":Landroid/content/Intent;
    const v1, 0x10008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 582
    const-string v1, "ponto"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 583
    const-string v1, "pendente"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 584
    const-string v1, "finaliza"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 585
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 586
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->finish()V

    .line 587
    return-void
.end method

.method public getSelectedBombona()Lcom/coleta/ambientuus/dto/Volume;
    .locals 4

    .line 434
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 435
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 436
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Volume;

    .line 437
    .local v1, "vol":Lcom/coleta/ambientuus/dto/Volume;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Volume;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v3}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 438
    return-object v1

    .line 435
    .end local v1    # "vol":Lcom/coleta/ambientuus/dto/Volume;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 442
    .end local v0    # "i":I
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->volumes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Volume;

    .line 443
    .local v1, "volume":Lcom/coleta/ambientuus/dto/Volume;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Volume;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombona:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v3}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 444
    return-object v1

    .line 446
    .end local v1    # "volume":Lcom/coleta/ambientuus/dto/Volume;
    :cond_2
    goto :goto_1

    .line 447
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSelectedBombonaExtra()Lcom/coleta/ambientuus/dto/Volume;
    .locals 4

    .line 451
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    if-eqz v0, :cond_3

    .line 452
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 453
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 454
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Volume;

    .line 455
    .local v1, "vol":Lcom/coleta/ambientuus/dto/Volume;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Volume;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v3}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 456
    return-object v1

    .line 453
    .end local v1    # "vol":Lcom/coleta/ambientuus/dto/Volume;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 460
    .end local v0    # "i":I
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->volumes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Volume;

    .line 461
    .local v1, "volume":Lcom/coleta/ambientuus/dto/Volume;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Volume;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieBombonaExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v3}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 462
    return-object v1

    .line 464
    .end local v1    # "volume":Lcom/coleta/ambientuus/dto/Volume;
    :cond_2
    goto :goto_1

    .line 466
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public initDefaultData()V
    .locals 3

    .line 160
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteEmiteMtr()Ljava/lang/String;

    move-result-object v0

    const-string v1, "N"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieNroMtrDc:Lcom/google/android/material/textfield/TextInputEditText;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 162
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smManterNrMTR:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getColetaExtra()Ljava/lang/String;

    move-result-object v0

    const-string v2, "S"

    invoke-static {v0, v2}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->smColetaExtra:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 168
    :cond_1
    return-void
.end method

.method public loadDataTipoResiduo()V
    .locals 4

    .line 193
    new-instance v0, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->databaseHelper:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 194
    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/TipoResiduoTableManager;->getAllTipoResiduo()Ljava/util/List;

    move-result-object v0

    .line 195
    .local v0, "tipoResiduos":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/TipoResiduo;>;"
    new-instance v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    invoke-direct {v1}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;-><init>()V

    .line 196
    .local v1, "helper":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper<Lcom/coleta/ambientuus/dto/TipoResiduo;>;"
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tieResiduoExtra:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    new-instance v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0, v1, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$$ExternalSyntheticLambda4;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 205
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "saveInstanceState"    # Landroid/os/Bundle;

    .line 119
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 120
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_ponto_coleta_coletar:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->setContentView(I)V

    .line 122
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "ponto"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/PontoColeta;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 123
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "tipo"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->tipoPesagem:Ljava/lang/String;

    .line 125
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initFields()V

    .line 126
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initDefaultData()V

    .line 127
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->loadDataBombona()V

    .line 128
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->updateDataEtiqueta()V

    .line 129
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initTipoColeta()V

    .line 130
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initReader()V

    .line 131
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initButtons()V

    .line 132
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->existsScale()V

    .line 133
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 591
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bluetoothConectado:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 592
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mIsBluetoothConnected:Z

    if-eqz v0, :cond_0

    .line 593
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity-IA;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 596
    :cond_0
    invoke-super {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onPause()V

    .line 597
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 601
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->bluetoothConectado:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 602
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->mIsBluetoothConnected:Z

    if-nez v0, :cond_1

    .line 603
    :cond_0
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity-IA;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 606
    :cond_1
    invoke-super {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onResume()V

    .line 607
    return-void
.end method

.method public showMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 549
    const-string v0, "Aten\u00e7\u00e3o"

    invoke-static {p0, v0, p1}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->exibirInformacao(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    return-void
.end method

.method public showToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/String;

    .line 795
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 796
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 797
    return-void
.end method

.method public updateDataEtiqueta()V
    .locals 0

    .line 257
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->getInfoEtiqueta()V

    .line 258
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initEtiquetaText()V

    .line 259
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->disableEtiqueta()V

    .line 260
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->validateEtiqueta()V

    .line 261
    return-void
.end method

.method public updateStatusPontoColetaLastEtiqueta()V
    .locals 4

    .line 562
    iget-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getUltima()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 563
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->updateStatusPontoColeta()V

    .line 564
    :cond_0
    return-void
.end method

.method public validateEtiqueta()V
    .locals 4

    .line 249
    iget-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v1, "TESTE"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getUltima()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    iget-wide v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaAtual:J

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->etiquetaIntervalo:Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/model/EtiquetaIntervalo;->getUltima()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 252
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->finalizeColeta(Ljava/lang/Boolean;)V

    .line 254
    :cond_0
    return-void
.end method
