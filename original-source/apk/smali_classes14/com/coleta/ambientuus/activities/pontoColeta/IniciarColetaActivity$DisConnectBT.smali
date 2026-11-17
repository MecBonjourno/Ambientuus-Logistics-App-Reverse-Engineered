.class Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;
.super Landroid/os/AsyncTask;
.source "IniciarColetaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;
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
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;


# direct methods
.method private constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V
    .locals 0

    .line 713
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 713
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Void;

    .line 720
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmReadThread(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 721
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmReadThread(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    move-result-object v0

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->stop()V

    .line 722
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmReadThread(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;

    move-result-object v0

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 723
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fputmReadThread(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;)V

    .line 726
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 729
    goto :goto_1

    .line 727
    :catch_0
    move-exception v0

    .line 728
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 730
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 713
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Void;

    .line 735
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 736
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fputmIsBluetoothConnected(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Z)V

    .line 737
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmIsUserInitiatedDisconnect(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 738
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$DisConnectBT;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->finish()V

    .line 740
    :cond_0
    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .line 716
    return-void
.end method
