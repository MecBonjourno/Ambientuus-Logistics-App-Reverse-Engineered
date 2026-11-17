.class Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1$1;
.super Ljava/lang/Object;
.source "CarregarBombonaActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;

    .line 67
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 76
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    const-string v1, "Precisa da permissao da camera"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 77
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 78
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 70
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 71
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "ORIGEM"

    const-string v2, "TR"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 72
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .line 73
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 80
    return-void
.end method
