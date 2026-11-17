.class Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;
.super Landroid/os/AsyncTask;
.source "ColetarActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DisConnectBT"
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
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;


# direct methods
.method private constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V
    .locals 0

    .line 918
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/activities/ColetarActivity-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 918
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Void;

    .line 925
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmReadThread(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 926
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmReadThread(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    move-result-object v0

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->stop()V

    .line 927
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmReadThread(Lcom/coleta/ambientuus/activities/ColetarActivity;)Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    move-result-object v0

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 928
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fputmReadThread(Lcom/coleta/ambientuus/activities/ColetarActivity;Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;)V

    .line 931
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 934
    goto :goto_1

    .line 932
    :catch_0
    move-exception v0

    .line 933
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 935
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 918
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Void;

    .line 940
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 941
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fputmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/ColetarActivity;Z)V

    .line 942
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmIsUserInitiatedDisconnect(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 943
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->finish()V

    .line 945
    :cond_0
    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .line 921
    return-void
.end method
