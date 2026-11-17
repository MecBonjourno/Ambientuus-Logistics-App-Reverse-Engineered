.class Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;
.super Landroid/os/AsyncTask;
.source "IniciarColetaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectBT"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mConnectSuccessful:Z

.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;


# direct methods
.method static bridge synthetic -$$Nest$fputmConnectSuccessful(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->mConnectSuccessful:Z

    return-void
.end method

.method private constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V
    .locals 0

    .line 630
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 631
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->mConnectSuccessful:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 629
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2
    .param p1, "devices"    # [Ljava/lang/Void;

    .line 641
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 642
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 643
    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT$1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;)V

    .line 644
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 693
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 695
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 629
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Void;

    .line 700
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 701
    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->mConnectSuccessful:Z

    if-nez v0, :cond_0

    .line 702
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const-string v2, "N\u00e3o foi possivel conectar"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 703
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->finish()V

    goto :goto_0

    .line 705
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const-string v1, "Conectado"

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$mmsg(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Ljava/lang/String;)V

    .line 706
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fputmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Z)V

    .line 707
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fputmReadThread(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;)V

    .line 709
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetprogressDialog(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 710
    return-void
.end method

.method protected onPreExecute()V
    .locals 4

    .line 635
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const-string v2, "Espere"

    const-string v3, "Estamos conectando"

    invoke-static {v1, v2, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fputprogressDialog(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Landroid/app/ProgressDialog;)V

    .line 636
    return-void
.end method
