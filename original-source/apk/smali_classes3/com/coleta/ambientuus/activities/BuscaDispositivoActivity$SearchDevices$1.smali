.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->doInBackground([Ljava/lang/Void;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

.field final synthetic val$listDevices:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;Ljava/util/List;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 282
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->val$listDevices:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 309
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v1, "Para utilizar \u00e9 preciso permitir acesso ao BlueTooth"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 310
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 311
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 285
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    const-string v1, "android.permission.BLUETOOTH_SCAN"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;)V

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 305
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 306
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 313
    return-void
.end method
