.class Lcom/coleta/ambientuus/fragments/EtiquetasFragment$1;
.super Ljava/lang/Object;
.source "EtiquetasFragment.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->initButton(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/fragments/EtiquetasFragment;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/fragments/EtiquetasFragment;

    .line 143
    iput-object p1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 152
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasFragment;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const-string v1, "Precisa da permiss\u00e3o da c\u00e2mera"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 153
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 146
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasFragment;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 147
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/fragments/EtiquetasFragment$1;->this$0:Lcom/coleta/ambientuus/fragments/EtiquetasFragment;

    invoke-static {v1}, Lcom/coleta/ambientuus/fragments/EtiquetasFragment;->-$$Nest$fgetleitorEtiquetaLauncher(Lcom/coleta/ambientuus/fragments/EtiquetasFragment;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 148
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 157
    return-void
.end method
