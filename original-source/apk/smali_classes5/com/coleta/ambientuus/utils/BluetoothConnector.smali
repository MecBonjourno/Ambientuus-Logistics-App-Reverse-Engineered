.class public Lcom/coleta/ambientuus/utils/BluetoothConnector;
.super Ljava/lang/Object;
.source "BluetoothConnector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;
    }
.end annotation


# direct methods
.method static bridge synthetic -$$Nest$smconnect(Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/coleta/ambientuus/utils/BluetoothConnector;->connect(Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static connect(Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V
    .locals 3
    .param p0, "device"    # Landroid/bluetooth/BluetoothDevice;
    .param p1, "uuid"    # Ljava/util/UUID;
    .param p2, "callback"    # Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;

    .line 53
    :try_start_0
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 54
    invoke-virtual {p0, p1}, Landroid/bluetooth/BluetoothDevice;->createInsecureRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    .line 55
    .local v0, "socket":Landroid/bluetooth/BluetoothSocket;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->connect()V

    .line 56
    invoke-interface {p2, v0}, Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;->onConnected(Landroid/bluetooth/BluetoothSocket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .end local v0    # "socket":Landroid/bluetooth/BluetoothSocket;
    goto :goto_0

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Erro ao conectar: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1}, Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;->onError(Ljava/lang/String;)V

    .line 61
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method public static connectToDevice(Landroid/app/Activity;Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;
    .param p2, "uuid"    # Ljava/util/UUID;
    .param p3, "callback"    # Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;

    .line 28
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 29
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 30
    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;

    invoke-direct {v1, p1, p2, p3}, Lcom/coleta/ambientuus/utils/BluetoothConnector$1;-><init>(Landroid/bluetooth/BluetoothDevice;Ljava/util/UUID;Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;)V

    .line 31
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 47
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 49
    :cond_0
    return-void
.end method
