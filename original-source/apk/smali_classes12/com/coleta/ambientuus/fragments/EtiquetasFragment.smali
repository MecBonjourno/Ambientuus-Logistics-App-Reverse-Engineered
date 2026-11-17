.class public Lcom/coleta/ambientuus/fragments/EtiquetasFragment;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;
.source "EtiquetasFragment.java"


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;

.field private etiquetas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;"
        }
    .end annotation
.end field

.field private idManifesto:Ljava/lang/Integer;

.field private leitorEtiquetaLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$-MtDZkXMFuyH6r-h9-3eCbJisvQ(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->lambda$initButton$6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$KYTAEZZkl-cNbL3luGrMBuRLLAM(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->lambda$initButton$4(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$yBfEbPGyhPRzTXBCnFVhfP440iU(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->lambda$prepareReader$2(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$z8Tt6XxJQWNg4Lur0zusIdnEfws(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->lambda$initButton$3(Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetleitorEtiquetaLauncher(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->leitorEtiquetaLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-object p0
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/Integer;)V
    .locals 0
    .param p2, "idManifesto"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Etiqueta;",
            ">;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    .line 45
    .local p1, "etiquetas":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->etiquetas:Ljava/util/List;

    .line 47
    iput-object p2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->idManifesto:Ljava/lang/Integer;

    .line 48
    return-void
.end method

.method private synthetic lambda$initButton$3(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 141
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 142
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$1;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;)V

    .line 143
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 159
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 160
    return-void
.end method

.method private synthetic lambda$initButton$4(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 169
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 170
    new-instance v0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 171
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 172
    .local v0, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->idManifesto:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->deleteAllManifesto(Ljava/lang/Integer;)V

    .line 173
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->etiquetas:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 174
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->notifyDataSetChanged()V

    .line 175
    return-void
.end method

.method static synthetic lambda$initButton$5(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 178
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    .line 179
    return-void
.end method

.method private synthetic lambda$initButton$6(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 164
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 165
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    const-string v1, "Deseja excluir todas?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 166
    const-string v1, "Deseja deletar todas as etiquetas vinculadas ao Manifesto?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 167
    new-instance v1, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;)V

    const/4 v2, -0x1

    const-string v3, "Sim"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 176
    new-instance v1, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda4;-><init>()V

    const/4 v2, -0x2

    const-string v3, "N\u00e3o"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 180
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 197
    return-void
.end method

.method static synthetic lambda$prepareReader$0(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 101
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$prepareReader$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 121
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method private synthetic lambda$prepareReader$2(Landroidx/activity/result/ActivityResult;)V
    .locals 10
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    .line 73
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_2

    .line 74
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    .line 75
    .local v0, "data":Landroid/content/Intent;
    if-eqz v0, :cond_2

    .line 76
    new-instance v1, Lcom/coleta/ambientuus/dto/Etiqueta;

    .line 77
    const-string v2, "codigoEtiqueta"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->idManifesto:Ljava/lang/Integer;

    const-string v4, "A"

    const/4 v5, 0x0

    invoke-direct {v1, v5, v2, v3, v4}, Lcom/coleta/ambientuus/dto/Etiqueta;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V

    .line 80
    .local v1, "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    new-instance v2, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    new-instance v3, Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 81
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 83
    .local v2, "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v3

    .line 84
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getId_manifesto()Ljava/lang/Integer;

    move-result-object v4

    .line 83
    invoke-virtual {v2, v3, v4}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->verificarEtiquetaEmOutroManifesto(Ljava/lang/String;Ljava/lang/Integer;)Z

    move-result v3

    const-string v4, "OK"

    const/4 v5, -0x3

    const-string v6, "Etiqueta "

    const-string v7, "Erro"

    if-nez v3, :cond_1

    .line 85
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v3

    .line 86
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getId_manifesto()Ljava/lang/Integer;

    move-result-object v8

    .line 85
    invoke-virtual {v2, v3, v8}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->verificarEtiquetaNoManifesto(Ljava/lang/String;Ljava/lang/Integer;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 87
    invoke-virtual {v2, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->insert(Lcom/coleta/ambientuus/dto/Etiqueta;)V

    .line 88
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/coleta/ambientuus/R$raw;->beep_ok:I

    invoke-static {v3, v4}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v3

    .line 89
    .local v3, "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v3}, Landroid/media/MediaPlayer;->start()V

    .line 90
    iget-object v4, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->etiquetas:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    iget-object v4, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;

    iget-object v5, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->etiquetas:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;->notifyItemInserted(I)V

    .line 92
    .end local v3    # "mediaPlayer":Landroid/media/MediaPlayer;
    goto/16 :goto_0

    .line 93
    :cond_0
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v8, Lcom/coleta/ambientuus/R$raw;->beep_erro:I

    invoke-static {v3, v8}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v3

    .line 94
    .restart local v3    # "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v3}, Landroid/media/MediaPlayer;->start()V

    .line 96
    new-instance v8, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    .line 97
    .local v8, "alertDialog":Landroid/app/AlertDialog;
    invoke-virtual {v8, v7}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 98
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " j\u00e1 vinculada a este manifesto!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 100
    new-instance v6, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda5;

    invoke-direct {v6}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda5;-><init>()V

    invoke-virtual {v8, v5, v4, v6}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 102
    sget v4, Lcom/coleta/ambientuus/R$drawable;->ic_alert_dialog_error:I

    invoke-virtual {v8, v4}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 103
    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    .line 109
    .end local v3    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v8    # "alertDialog":Landroid/app/AlertDialog;
    goto :goto_0

    .line 111
    :cond_1
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v8, Lcom/coleta/ambientuus/R$raw;->beep_erro:I

    invoke-static {v3, v8}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v3

    .line 112
    .restart local v3    # "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v3}, Landroid/media/MediaPlayer;->start()V

    .line 114
    new-instance v8, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    .line 115
    .restart local v8    # "alertDialog":Landroid/app/AlertDialog;
    invoke-virtual {v8, v7}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 116
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " j\u00e1 vinculada a outro manifesto(Nro: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 118
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Etiqueta;->getCod_etiqueta()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->retornaManifestoEtiqueta(Ljava/lang/String;)Lcom/coleta/ambientuus/dto/Manifesto;

    move-result-object v7

    invoke-virtual {v7}, Lcom/coleta/ambientuus/dto/Manifesto;->getNumero_manifesto()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 116
    invoke-virtual {v8, v6}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 120
    new-instance v6, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda6;

    invoke-direct {v6}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda6;-><init>()V

    invoke-virtual {v8, v5, v4, v6}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 122
    sget v4, Lcom/coleta/ambientuus/R$drawable;->ic_alert_dialog_error:I

    invoke-virtual {v8, v4}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 123
    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    .line 134
    .end local v0    # "data":Landroid/content/Intent;
    .end local v1    # "etiqueta":Lcom/coleta/ambientuus/dto/Etiqueta;
    .end local v2    # "etiquetaTableManager":Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;
    .end local v3    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v8    # "alertDialog":Landroid/app/AlertDialog;
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public initButton(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 140
    sget v0, Lcom/coleta/ambientuus/R$id;->btnLerCodigo:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    sget v0, Lcom/coleta/ambientuus/R$id;->btnExcluirTodas:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 55
    sget v0, Lcom/coleta/ambientuus/R$layout;->fragment_etiquetas_bottom_sheet:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 57
    .local v0, "view":Landroid/view/View;
    sget v1, Lcom/coleta/ambientuus/R$id;->rvEtiquetas:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .local v1, "rvEtiquetas":Landroidx/recyclerview/widget/RecyclerView;
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 59
    new-instance v2, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;

    iget-object v3, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->etiquetas:Ljava/util/List;

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;-><init>(Ljava/util/List;)V

    iput-object v2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;

    .line 60
    iget-object v2, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaAdapter;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 62
    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->prepareReader()V

    .line 64
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->initButton(Landroid/view/View;)V

    .line 66
    return-object v0
.end method

.method public prepareReader()V
    .locals 2

    .line 70
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v1, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;)V

    invoke-virtual {p0, v0, v1}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->leitorEtiquetaLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 136
    return-void
.end method
