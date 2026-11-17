.class Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;
.super Ljava/lang/Object;
.source "LerBombonaActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;

    .line 85
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 96
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    const-string v1, "Precisa da permissao da camera"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 97
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 98
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 88
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 89
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "ORIGEM"

    const-string v2, "A"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;->-$$Nest$fgetspinnerClienteBombona(Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "ClienteSelectinado"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 91
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;->-$$Nest$fgetspinnerClienteBombonaSel(Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "IdPessoaClienteSelecionado"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 92
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;->this$1:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .line 93
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 100
    return-void
.end method
