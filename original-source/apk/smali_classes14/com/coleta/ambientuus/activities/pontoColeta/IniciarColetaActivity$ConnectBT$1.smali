.class Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;
.super Ljava/lang/Object;
.source "IniciarColetaActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    .line 644
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 687
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 5
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 647
    const/4 v0, 0x0

    .line 651
    .local v0, "tmp":Landroid/bluetooth/BluetoothServerSocket;
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    iget-object v2, v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const-string v3, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {v2, v3}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    .line 652
    return-void

    .line 654
    :cond_0
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    iget-object v2, v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmDevice(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    iget-object v4, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    iget-object v4, v4, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v4}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmDeviceUUID(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/bluetooth/BluetoothDevice;->createInsecureRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fputmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/bluetooth/BluetoothSocket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 667
    goto :goto_0

    .line 656
    :catch_0
    move-exception v2

    .line 658
    .local v2, "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    new-instance v4, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1$1;

    invoke-direct {v4, p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1$1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;Ljava/io/IOException;)V

    invoke-virtual {v3, v4}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 666
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    invoke-static {v3, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->-$$Nest$fputmConnectSuccessful(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;Z)V

    .line 668
    .end local v2    # "e":Ljava/io/IOException;
    :goto_0
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 670
    :try_start_1
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    iget-object v2, v2, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothSocket;->connect()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 682
    goto :goto_1

    .line 671
    :catch_1
    move-exception v2

    .line 673
    .restart local v2    # "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    new-instance v4, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1$2;

    invoke-direct {v4, p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1$2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;Ljava/io/IOException;)V

    invoke-virtual {v3, v4}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 681
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;

    invoke-static {v3, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->-$$Nest$fputmConnectSuccessful(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;Z)V

    .line 683
    .end local v2    # "e":Ljava/io/IOException;
    :goto_1
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 691
    return-void
.end method
