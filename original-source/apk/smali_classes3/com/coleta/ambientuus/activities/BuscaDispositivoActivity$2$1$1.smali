.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1$1;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;)V
    .locals 0
    .param p1, "this$2"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;

    .line 132
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1$1;->this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 139
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 135
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 136
    .local v0, "enableBT":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1$1;->this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const/16 v2, 0xa

    invoke-virtual {v1, v0, v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 137
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 141
    return-void
.end method
