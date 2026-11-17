.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    .line 127
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 129
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmBTAdapter(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v1, "O Bluetooth n\u00e3o foi encontrado"

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$mmsg(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmBTAdapter(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 132
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    const-string v1, "android.permission.BLUETOOTH_SCAN"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1$1;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;)V

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 143
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    goto :goto_0

    .line 145
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetlistaDevicesDisponiveis(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 146
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmBTAdapter(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->startDiscovery()Z

    .line 148
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 149
    return-void
.end method
