.class Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;
.super Ljava/lang/Object;
.source "LeitormtrActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/LeitormtrActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/LeitormtrActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/LeitormtrActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    .line 51
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 59
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    const-string v2, "Precisa da permissao da camera!"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 54
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->-$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/LeitormtrActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    invoke-virtual {v0, v1}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->setResultHandler(Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;)V

    .line 55
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitormtrActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitormtrActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/LeitormtrActivity;->-$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/LeitormtrActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    move-result-object v0

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->startCamera()V

    .line 56
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 62
    return-void
.end method
