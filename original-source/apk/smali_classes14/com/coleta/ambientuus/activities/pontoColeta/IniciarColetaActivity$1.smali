.class Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$1;
.super Ljava/lang/Object;
.source "IniciarColetaActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->initButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    .line 301
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 310
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const-string v1, "Precisa da permiss\u00e3o da c\u00e2mera"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 311
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 304
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 305
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetreaderLauncher(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 306
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 315
    return-void
.end method
