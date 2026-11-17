.class Lcom/coleta/ambientuus/utils/BluetoothConnector$1;
.super Ljava/lang/Object;
.source "BluetoothConnector.java"

# interfaces
.implements Lcom/karumi/dexter/listener/single/PermissionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/utils/BluetoothConnector;->connectToDevice(Landroid/app/Activity;Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;

.field final synthetic val$device:Landroid/bluetooth/BluetoothDevice;

.field final synthetic val$uuid:Ljava/util/UUID;


# direct methods
.method constructor <init>(Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 31
    iput-object p1, p0, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;->val$device:Landroid/bluetooth/BluetoothDevice;

    iput-object p2, p0, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;->val$uuid:Ljava/util/UUID;

    iput-object p3, p0, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;->val$callback:Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied(Lcom/karumi/dexter/listener/PermissionDeniedResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionDeniedResponse;

    .line 39
    iget-object v0, p0, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;->val$callback:Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;

    const-string v1, "Permiss\u00e3o BLUETOOTH_CONNECT foi negada."

    invoke-interface {v0, v1}, Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;->onError(Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/karumi/dexter/listener/PermissionGrantedResponse;

    .line 34
    iget-object v0, p0, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;->val$device:Landroid/bluetooth/BluetoothDevice;

    iget-object v1, p0, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;->val$uuid:Ljava/util/UUID;

    iget-object v2, p0, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;->val$callback:Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;

    invoke-static {v0, v1, v2}, Lcom/coleta/ambientuus/utils/BluetoothConnector;->-$$Nest$smconnect(Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V

    .line 35
    return-void
.end method

.method public onPermissionRationaleShouldBeShown(Lcom/karumi/dexter/listener/PermissionRequest;Lcom/karumi/dexter/PermissionToken;)V
    .locals 0
    .param p1, "permission"    # Lcom/karumi/dexter/listener/PermissionRequest;
    .param p2, "token"    # Lcom/karumi/dexter/PermissionToken;

    .line 44
    invoke-interface {p2}, Lcom/karumi/dexter/PermissionToken;->continuePermissionRequest()V

    .line 45
    return-void
.end method
