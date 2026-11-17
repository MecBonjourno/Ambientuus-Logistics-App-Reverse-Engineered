.class public Lcom/coleta/ambientuus/activities/LeitormtrActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "LeitormtrActivity.java"

# interfaces
.implements Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;


# instance fields
.field private bluetoothDesconectado:Ljava/lang/Boolean;

.field private codBarrasBombona:Ljava/lang/String;

.field private letras:Ljava/lang/String;

.field private scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

.field private txtResult:Landroid/widget/TextView;

.field private var1:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/LeitormtrActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 28
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->bluetoothDesconectado:Ljava/lang/Boolean;

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->codBarrasBombona:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public handleResult(Lcom/google/zxing/Result;)V
    .locals 2
    .param p1, "rawResult"    # Lcom/google/zxing/Result;

    .line 75
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->bluetoothDesconectado:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->txtResult:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->startCamera()V

    .line 79
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->startCamera()V

    .line 84
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->letras:Ljava/lang/String;

    .line 85
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->processaresultado()V

    .line 87
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 35
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    sget v0, Lcom/coleta/ambientuus/R$layout;->reader_leitormtr:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->setContentView(I)V

    .line 37
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/ActionBar;->hide()V

    .line 38
    sget v0, Lcom/coleta/ambientuus/R$id;->zxscan:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    .line 39
    sget v0, Lcom/coleta/ambientuus/R$id;->txt_result:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->txtResult:Landroid/widget/TextView;

    .line 41
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 42
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 43
    .local v1, "extras":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 44
    const-string v2, "naoconectado"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->bluetoothDesconectado:Ljava/lang/Boolean;

    .line 45
    const-string v2, "codigoBarrasBombona"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 46
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->codBarrasBombona:Ljava/lang/String;

    .line 51
    :cond_0
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v2

    const-string v3, "android.permission.CAMERA"

    invoke-interface {v2, v3}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v2

    new-instance v3, Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;-><init>(Lcom/coleta/ambientuus/activities/LeitormtrActivity;)V

    invoke-interface {v2, v3}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v2

    .line 64
    invoke-interface {v2}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 65
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 70
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 71
    return-void
.end method

.method public processaresultado()V
    .locals 5

    .line 90
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->letras:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 91
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->letras:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->var1:Ljava/lang/String;

    goto :goto_0

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->letras:Ljava/lang/String;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->var1:Ljava/lang/String;

    .line 95
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->var1:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const-string v2, "codigoBarrasBombona"

    const/16 v3, 0x7b

    const-string v4, "valorDoLeitor"

    if-ne v0, v1, :cond_2

    .line 96
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 97
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->var1:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->codBarrasBombona:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 99
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->codBarrasBombona:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 101
    :cond_1
    sget v1, Lcom/coleta/ambientuus/R$raw;->beep_ok:I

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    .line 102
    .local v1, "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 103
    invoke-virtual {p0, v3, v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->setResult(ILandroid/content/Intent;)V

    .line 104
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->finish()V

    .line 105
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "mediaPlayer":Landroid/media/MediaPlayer;
    goto :goto_1

    .line 106
    :cond_2
    const-string v0, "ERRO AO LER CODIGO DE BARRAS "

    invoke-virtual {p0, p0, v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 107
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 108
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string v1, ""

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->codBarrasBombona:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 110
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->codBarrasBombona:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 112
    :cond_3
    sget v1, Lcom/coleta/ambientuus/R$raw;->beep_erro:I

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    .line 113
    .restart local v1    # "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 114
    invoke-virtual {p0, v3, v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->setResult(ILandroid/content/Intent;)V

    .line 115
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->finish()V

    .line 117
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "mediaPlayer":Landroid/media/MediaPlayer;
    :goto_1
    return-void
.end method

.method public showToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/String;

    .line 120
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 121
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 122
    return-void
.end method
