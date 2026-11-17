.class Lcom/coleta/ambientuus/activities/ColetarActivity$6;
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

    .line 463
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$6;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 473
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$6;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-string v1, "Precisa da permiss\u00e3o da c\u00e2mera"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 474
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 466
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$6;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 467
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "ORIGEM"

    const-string v2, "ET"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 468
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$6;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetleitorEtiquetaLauncher(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 469
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 478
    return-void
.end method
