.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;


# direct methods
.method public static synthetic $r8$lambda$-qsH1w4O0suuYy3HO-StOE4U8mU(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->lambda$onClick$0(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    return-void
.end method

.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    .line 162
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onClick$0(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 4
    .param p1, "tipo"    # Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    .line 166
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmLstDevices(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->getSelectedItem()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 167
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 169
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetpontoColeta(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Lcom/coleta/ambientuus/dto/PontoColeta;

    move-result-object v2

    const-string v3, "ponto"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 170
    const-string v2, "br.com.urano.SOCKET"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 171
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmDeviceUUID(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "br.com.urano.uuid"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmBufferSize(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)I

    move-result v2

    const-string v3, "br.com.urano.buffersize"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 173
    const-string v2, "CONECTADO"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 174
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v3, "android.permission.BLUETOOTH_SCAN"

    invoke-static {v2, v3}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    .line 175
    return-void

    .line 177
    :cond_0
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmBTAdapter(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 178
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmBTAdapter(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 180
    :cond_1
    const-string v2, "tipo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-virtual {v2, v1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->startActivity(Landroid/content/Intent;)V

    .line 182
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .line 165
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    new-instance v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$3;)V

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/utils/PesagemPreferences;->verifyPreferences(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;)V

    .line 183
    return-void
.end method
