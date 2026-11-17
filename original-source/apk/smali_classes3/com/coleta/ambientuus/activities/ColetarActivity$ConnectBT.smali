.class Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;
.super Landroid/os/AsyncTask;
.source "ColetarActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity;
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

.field final synthetic this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;


# direct methods
.method static bridge synthetic -$$Nest$fputmConnectSuccessful(Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->mConnectSuccessful:Z

    return-void
.end method

.method private constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V
    .locals 0

    .line 983
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 984
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->mConnectSuccessful:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/activities/ColetarActivity-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 982
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2
    .param p1, "devices"    # [Ljava/lang/Void;

    .line 994
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 995
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    .line 996
    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;)V

    .line 997
    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 1046
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 1048
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 982
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Void;

    .line 1053
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 1054
    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->mConnectSuccessful:Z

    if-nez v0, :cond_0

    .line 1055
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-string v2, "N\u00e3o foi possivel conectar"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1056
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->finish()V

    goto :goto_0

    .line 1058
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-string v1, "Conectado"

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$mmsg(Lcom/coleta/ambientuus/activities/ColetarActivity;Ljava/lang/String;)V

    .line 1059
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fputmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/ColetarActivity;Z)V

    .line 1060
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    new-instance v1, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fputmReadThread(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;)V

    .line 1062
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetprogressDialog(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1063
    return-void
.end method

.method protected onPreExecute()V
    .locals 4

    .line 988
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const-string v2, "Espere"

    const-string v3, "Estamos conectando"

    invoke-static {v1, v2, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fputprogressDialog(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/app/ProgressDialog;)V

    .line 989
    return-void
.end method
