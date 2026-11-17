.class Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$3;
.super Ljava/lang/Object;
.source "IniciarColetaExtraActivity.java"

# interfaces
.implements Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    .line 491
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$3;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/bluetooth/BluetoothSocket;)V
    .locals 3
    .param p1, "socket"    # Landroid/bluetooth/BluetoothSocket;

    .line 494
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$3;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    invoke-static {v0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->-$$Nest$fputmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;Landroid/bluetooth/BluetoothSocket;)V

    .line 495
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$3;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Conectado com sucesso"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 496
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 500
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$3;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 501
    return-void
.end method
