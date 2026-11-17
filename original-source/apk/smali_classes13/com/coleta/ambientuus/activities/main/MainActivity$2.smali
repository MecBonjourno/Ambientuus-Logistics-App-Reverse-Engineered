.class Lcom/coleta/ambientuus/activities/main/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/main/MainActivity;->searchQRCodeEtiqueta(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/main/MainActivity;

    .line 309
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$2;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErro(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 324
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$2;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    const-string v1, "Erro ao consultar QR Code"

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->exibirErro(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    return-void
.end method

.method public onSucesso(Lcom/coleta/ambientuus/dto/list/BombonaClienteList;)V
    .locals 3
    .param p1, "lista"    # Lcom/coleta/ambientuus/dto/list/BombonaClienteList;

    .line 312
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/list/BombonaClienteList;->getBombonaClienteList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 313
    invoke-virtual {p1}, Lcom/coleta/ambientuus/dto/list/BombonaClienteList;->getBombonaClienteList()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/BombonaCliente;

    .line 314
    .local v0, "bombonaCliente":Lcom/coleta/ambientuus/dto/BombonaCliente;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$2;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v1, v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$mcreatePopupEtiquetaCliente(Lcom/coleta/ambientuus/activities/main/MainActivity;Lcom/coleta/ambientuus/dto/BombonaCliente;)V

    .line 315
    .end local v0    # "bombonaCliente":Lcom/coleta/ambientuus/dto/BombonaCliente;
    goto :goto_0

    .line 316
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$2;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    const-string v1, "Erro ao consultar QR Code"

    const-string v2, "N\u00e3o encontrado dados para o QR Code bipado."

    invoke-static {v0, v1, v2}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->exibirErro(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    :goto_0
    return-void
.end method
