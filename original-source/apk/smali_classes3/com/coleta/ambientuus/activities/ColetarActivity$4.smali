.class Lcom/coleta/ambientuus/activities/ColetarActivity$4;
.super Ljava/lang/Object;
.source "ColetarActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity;->initButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/ColetarActivity;

    .line 385
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 405
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-string v2, "Precisa da permissao da camera"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 406
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 388
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetbluetoothConectado(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 389
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 390
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "naoconectado"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 391
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgettvCodBarrasBombonaLer(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 392
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgettvCodBarrasBombonaLer(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "codigoBarrasBombona"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 394
    :cond_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetleitorMTRLauncher(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 395
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 396
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/ColetarActivity;->btnAdd:Landroid/widget/Button;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 397
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetbtnLimparCamposColeta(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 398
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-virtual {v0, v1}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->setResultHandler(Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;)V

    .line 399
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$4;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    move-result-object v0

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->startCamera()V

    .line 401
    :goto_0
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 410
    return-void
.end method
