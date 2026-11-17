.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;
.super Landroid/content/BroadcastReceiver;
.source "BuscaDispositivoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    .line 341
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 343
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 344
    .local v0, "action":Ljava/lang/String;
    const-string v1, "android.bluetooth.adapter.action.DISCOVERY_STARTED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 345
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v2, "Procurando Dispositivos! Pode levar at\u00e9 15 segundos"

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$mmsg(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 346
    :cond_0
    const-string v1, "android.bluetooth.adapter.action.DISCOVERY_FINISHED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 347
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetlistaDevicesDisponiveis(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 348
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v2, "Nenhum dispositivo emparelhado encontrado, emparelhe seu dispositivo e tente novamente"

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$mmsg(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 350
    :cond_1
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v2, "Busca Concluida!"

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$mmsg(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 352
    :cond_2
    const-string v1, "android.bluetooth.device.action.FOUND"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 353
    const-string v1, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 354
    .local v1, "device":Landroid/bluetooth/BluetoothDevice;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetlistaDevicesDisponiveis(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 355
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetlistaDevicesDisponiveis(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 356
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6$1;

    invoke-direct {v3, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6$1;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;)V

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 364
    .end local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_3
    :goto_0
    return-void
.end method
