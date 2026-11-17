.class public Lcom/coleta/ambientuus/activities/LeitorColetaActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "LeitorColetaActivity.java"

# interfaces
.implements Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;


# instance fields
.field private scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;


# direct methods
.method static bridge synthetic -$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/LeitorColetaActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResult(Lcom/google/zxing/Result;)V
    .locals 3
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 42
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    .line 43
    .local v0, "texto":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v1}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 45
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 46
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "codigoMTR"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    const/16 v2, 0xc8

    invoke-virtual {p0, v2, v1}, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->setResult(ILandroid/content/Intent;)V

    .line 48
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->finish()V

    .line 49
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 18
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    sget v0, Lcom/coleta/ambientuus/R$layout;->reader_leitor_etiqueta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->setContentView(I)V

    .line 20
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 21
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v2, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 23
    sget v0, Lcom/coleta/ambientuus/R$id;->zxscanEtiqueta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    .line 24
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v0, p0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->setResultHandler(Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;)V

    .line 25
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->startCamera()V

    .line 27
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    new-instance v2, Lcom/coleta/ambientuus/activities/LeitorColetaActivity$1;

    invoke-direct {v2, p0, v1}, Lcom/coleta/ambientuus/activities/LeitorColetaActivity$1;-><init>(Lcom/coleta/ambientuus/activities/LeitorColetaActivity;Z)V

    invoke-virtual {v0, p0, v2}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 34
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitorColetaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 38
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 39
    return-void
.end method
