.class public Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "BuscaDispositivoActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;,
        Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;
    }
.end annotation


# static fields
.field private static final BT_ENABLE_REQUEST:I = 0xa

.field public static final BUFFER_SIZE:Ljava/lang/String; = "br.com.urano.buffersize"

.field public static final DEVICE_EXTRA:Ljava/lang/String; = "br.com.urano.SOCKET"

.field private static final DEVICE_LIST:Ljava/lang/String; = "br.com.urano.devicelist"

.field private static final DEVICE_LIST_SELECTED:Ljava/lang/String; = "br.com.urano.devicelistselected"

.field public static final DEVICE_UUID:Ljava/lang/String; = "br.com.urano.uuid"

.field private static final SETTINGS:I = 0x14

.field private static final TAG:Ljava/lang/String; = "BlueTest5-Homescreen"


# instance fields
.field private listaDevicesDisponiveis:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mBTAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBtnConnect:Landroid/widget/Button;

.field private mBtnSearch:Landroid/widget/Button;

.field private mBufferSize:I

.field private mDeviceUUID:Ljava/util/UUID;

.field private mLstDevices:Landroid/widget/ListView;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;


# direct methods
.method static bridge synthetic -$$Nest$fgetlistaDevicesDisponiveis(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->listaDevicesDisponiveis:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmBTAdapter(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/bluetooth/BluetoothAdapter;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBTAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmBtnConnect(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBtnConnect:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmBufferSize(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)I
    .locals 0

    iget p0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBufferSize:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmDeviceUUID(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Ljava/util/UUID;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mDeviceUUID:Ljava/util/UUID;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmLstDevices(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/widget/ListView;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mLstDevices:Landroid/widget/ListView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetpontoColeta(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Lcom/coleta/ambientuus/dto/PontoColeta;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mmsg(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->msg(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 66
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBTAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->listaDevicesDisponiveis:Ljava/util/List;

    .line 72
    const-string v0, "00001101-0000-1000-8000-00805F9B34FB"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mDeviceUUID:Ljava/util/UUID;

    .line 75
    const v0, 0xc350

    iput v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBufferSize:I

    .line 341
    new-instance v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private initList(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;)V"
        }
    .end annotation

    .line 261
    .local p1, "objects":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    new-instance v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/coleta/ambientuus/R$layout;->list_item:I

    sget v4, Lcom/coleta/ambientuus/R$id;->lstContent:I

    move-object v1, p0

    move-object v5, p1

    .end local p1    # "objects":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    .local v5, "objects":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-direct/range {v0 .. v5}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Landroid/content/Context;IILjava/util/List;)V

    .line 262
    .local v0, "adapter":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;
    iget-object p1, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mLstDevices:Landroid/widget/ListView;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 263
    iget-object p1, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mLstDevices:Landroid/widget/ListView;

    new-instance v2, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$5;

    invoke-direct {v2, p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$5;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;)V

    invoke-virtual {p1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 270
    return-void
.end method

.method private msg(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .line 252
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 253
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 254
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 222
    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 232
    :sswitch_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 233
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "prefUuid"

    const-string v2, "Null"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 234
    .local v1, "uuid":Ljava/lang/String;
    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mDeviceUUID:Ljava/util/UUID;

    .line 235
    const-string v3, "prefTextBuffer"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 236
    .local v3, "bufSize":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBufferSize:I

    .line 238
    const-string v4, "prefOrientation"

    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 239
    .local v2, "orientation":Ljava/lang/String;
    goto :goto_0

    .line 224
    .end local v0    # "prefs":Landroid/content/SharedPreferences;
    .end local v1    # "uuid":Ljava/lang/String;
    .end local v2    # "orientation":Ljava/lang/String;
    .end local v3    # "bufSize":Ljava/lang/String;
    :sswitch_1
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 225
    const-string v0, "O Bluetooth foi ativado com sucesso"

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->msg(Ljava/lang/String;)V

    .line 226
    new-instance v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity-IA;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 228
    :cond_0
    const-string v0, "N\u00e3o foi possivel ativar o Bluetooth"

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->msg(Ljava/lang/String;)V

    .line 230
    nop

    .line 243
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 244
    return-void

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_1
        0x14 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 85
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 86
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_busca_dispositivo:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->setContentView(I)V

    .line 88
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 89
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v2, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 91
    sget v0, Lcom/coleta/ambientuus/R$id;->btnSearch:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBtnSearch:Landroid/widget/Button;

    .line 92
    sget v0, Lcom/coleta/ambientuus/R$id;->btnConnect:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBtnConnect:Landroid/widget/Button;

    .line 93
    sget v0, Lcom/coleta/ambientuus/R$id;->lstDevices:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mLstDevices:Landroid/widget/ListView;

    .line 95
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "ponto"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/PontoColeta;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 97
    if-eqz p1, :cond_2

    .line 98
    const-string v0, "br.com.urano.devicelist"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 99
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/bluetooth/BluetoothDevice;>;"
    if-eqz v0, :cond_1

    .line 100
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->initList(Ljava/util/List;)V

    .line 101
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mLstDevices:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;

    .line 102
    .local v2, "adapter":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;
    const-string v3, "br.com.urano.devicelistselected"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 103
    .local v3, "selectedIndex":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 104
    invoke-virtual {v2, v3}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->setSelectedIndex(I)V

    .line 105
    iget-object v4, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBtnConnect:Landroid/widget/Button;

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 107
    .end local v2    # "adapter":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;
    .end local v3    # "selectedIndex":I
    :cond_0
    goto :goto_0

    .line 108
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->initList(Ljava/util/List;)V

    .line 110
    .end local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/bluetooth/BluetoothDevice;>;"
    :goto_0
    goto :goto_1

    .line 111
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->initList(Ljava/util/List;)V

    .line 113
    :goto_1
    invoke-static {p0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    const-string v2, "android.permission.ACCESS_FINE_LOCATION"

    const-string v3, "android.permission.BLUETOOTH_SCAN"

    const-string v4, "android.permission.BLUETOOTH_CONNECT"

    const-string v5, "android.permission.ACCESS_COARSE_LOCATION"

    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermissions([Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$MultiPermissionListener;

    move-result-object v0

    new-instance v2, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$1;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$1;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V

    .line 114
    invoke-interface {v0, v2}, Lcom/karumi/dexter/DexterBuilder$MultiPermissionListener;->withListener(Lcom/karumi/dexter/listener/multi/MultiplePermissionsListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 119
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 121
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBtnSearch:Landroid/widget/Button;

    new-instance v2, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mBtnConnect:Landroid/widget/Button;

    new-instance v2, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    new-instance v2, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$4;

    invoke-direct {v2, p0, v1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$4;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Z)V

    invoke-virtual {v0, p0, v2}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 193
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 369
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 370
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 371
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 212
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    .line 213
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .line 200
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 201
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mLstDevices:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;

    .line 202
    .local v0, "adapter":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;
    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->getEntireList()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 203
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/bluetooth/BluetoothDevice;>;"
    if-eqz v1, :cond_0

    .line 204
    const-string v2, "br.com.urano.devicelist"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 205
    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->-$$Nest$fgetselectedIndex(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;)I

    move-result v2

    .line 206
    .local v2, "selectedIndex":I
    const-string v3, "br.com.urano.devicelistselected"

    invoke-virtual {p1, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 208
    .end local v2    # "selectedIndex":I
    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 3

    .line 330
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStart()V

    .line 331
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 332
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.bluetooth.device.action.FOUND"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 333
    const-string v1, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 334
    const-string v1, "android.bluetooth.adapter.action.DISCOVERY_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 335
    const-string v1, "android.bluetooth.adapter.action.DISCOVERY_FINISHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 336
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    .line 337
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v0, v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 339
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 0

    .line 217
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    .line 218
    return-void
.end method
