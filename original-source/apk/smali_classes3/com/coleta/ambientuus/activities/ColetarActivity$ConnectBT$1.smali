.class Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;
.super Ljava/lang/Object;
.source "ColetarActivity.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    .line 997
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 1040
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 5
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 1000
    const/4 v0, 0x0

    .line 1004
    .local v0, "tmp":Landroid/bluetooth/BluetoothServerSocket;
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    iget-object v2, v2, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-string v3, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {v2, v3}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    .line 1005
    return-void

    .line 1007
    :cond_0
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    iget-object v2, v2, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmDevice(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    iget-object v4, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    iget-object v4, v4, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmDeviceUUID(Lcom/coleta/ambientuus/activities/ColetarActivity;)Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/bluetooth/BluetoothDevice;->createInsecureRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fputmBTSocket(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/bluetooth/BluetoothSocket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1020
    goto :goto_0

    .line 1009
    :catch_0
    move-exception v2

    .line 1011
    .local v2, "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    new-instance v4, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$1;

    invoke-direct {v4, p0, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$1;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;Ljava/io/IOException;)V

    invoke-virtual {v3, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1019
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    invoke-static {v3, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->-$$Nest$fputmConnectSuccessful(Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;Z)V

    .line 1021
    .end local v2    # "e":Ljava/io/IOException;
    :goto_0
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 1023
    :try_start_1
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    iget-object v2, v2, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothSocket;->connect()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1035
    goto :goto_1

    .line 1024
    :catch_1
    move-exception v2

    .line 1026
    .restart local v2    # "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    iget-object v3, v3, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    new-instance v4, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$2;

    invoke-direct {v4, p0, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$2;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;Ljava/io/IOException;)V

    invoke-virtual {v3, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1034
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    invoke-static {v3, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->-$$Nest$fputmConnectSuccessful(Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;Z)V

    .line 1036
    .end local v2    # "e":Ljava/io/IOException;
    :goto_1
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 1044
    return-void
.end method
