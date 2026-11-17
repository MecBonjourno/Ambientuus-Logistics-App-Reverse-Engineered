.class Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;
.super Ljava/lang/Object;
.source "IniciarColetaExtraActivity.java"

# interfaces
.implements Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->initButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;


# direct methods
.method public static synthetic $r8$lambda$FZ30-BJP3sB_PJEhr2A9SG-IFwg(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;->lambda$onError$1(Ljava/lang/Exception;)V

    return-void
.end method

.method public static synthetic $r8$lambda$mOrCjM_Yto54K8pTNT4D3NjvXN8(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;->lambda$onRead$0(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    .line 250
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onError$1(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .line 258
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Erro: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private synthetic lambda$onRead$0(Ljava/lang/String;)V
    .locals 1
    .param p1, "valor"    # Ljava/lang/String;

    .line 253
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->-$$Nest$fgettiePeso(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;)Lcom/google/android/material/textfield/TextInputEditText;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .line 258
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;Ljava/lang/Exception;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 259
    return-void
.end method

.method public onRead(Ljava/lang/String;)V
    .locals 2
    .param p1, "valor"    # Ljava/lang/String;

    .line 253
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity$2;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 254
    return-void
.end method
