.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;
.super Landroid/os/AsyncTask;
.source "BuscaDispositivoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SearchDevices"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Landroid/bluetooth/BluetoothDevice;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;


# direct methods
.method private constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V
    .locals 0

    .line 277
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 277
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 3
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation

    .line 280
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 282
    .local v0, "listDevices":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v1}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v1

    const-string v2, "android.permission.BLUETOOTH_CONNECT"

    invoke-interface {v1, v2}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v1

    new-instance v2, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;

    invoke-direct {v2, p0, v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices$1;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;Ljava/util/List;)V

    invoke-interface {v1, v2}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v1

    .line 314
    invoke-interface {v1}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 315
    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 277
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;)V"
        }
    .end annotation

    .line 320
    .local p1, "listDevices":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 321
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmLstDevices(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;

    .line 323
    .local v0, "adapter":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;
    invoke-virtual {v0, p1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->replaceItems(Ljava/util/List;)V

    .line 325
    .end local v0    # "adapter":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;
    :cond_0
    return-void
.end method
