.class Lcom/coleta/ambientuus/activities/ColetarActivity$7;
.super Ljava/lang/Object;
.source "ColetarActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
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

    .line 827
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 842
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-string v2, "Precisa da permissao da camera"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 843
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 830
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetbluetoothConectado(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 831
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 832
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "naoconectado"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 833
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->startActivity(Landroid/content/Intent;)V

    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 834
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetbluetoothConectado(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 835
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-virtual {v0, v1}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->setResultHandler(Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;)V

    .line 836
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$7;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    move-result-object v0

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->startCamera()V

    goto :goto_1

    .line 834
    :cond_1
    :goto_0
    nop

    .line 838
    :goto_1
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 847
    return-void
.end method
