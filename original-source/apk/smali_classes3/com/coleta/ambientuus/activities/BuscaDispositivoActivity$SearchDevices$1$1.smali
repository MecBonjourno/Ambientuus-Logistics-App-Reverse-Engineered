.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;)V
    .locals 0
    .param p1, "this$2"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;

    .line 285
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;->this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 300
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;->this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v1, "Para utilizar \u00e9 preciso permitir acesso ao BlueTooth"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 301
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 302
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 4
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 288
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;->this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 289
    return-void

    .line 291
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;->this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmBTAdapter(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v0

    .line 292
    .local v0, "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 293
    .local v2, "device":Landroid/bluetooth/BluetoothDevice;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;->this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetlistaDevicesDisponiveis(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 294
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1$1;->this$2:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;->val$listDevices:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    .end local v2    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_1
    goto :goto_0

    .line 297
    :cond_2
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 304
    return-void
.end method
