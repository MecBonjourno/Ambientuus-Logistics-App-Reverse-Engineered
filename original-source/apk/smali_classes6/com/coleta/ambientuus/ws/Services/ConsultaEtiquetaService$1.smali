.class Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService$1;
.super Ljava/lang/Object;
.source "ConsultaEtiquetaService.java"

# interfaces
.implements Lretrofit2/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;->consultar(Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lretrofit2/Callback<",
        "Lcom/coleta/ambientuus/dto/list/BombonaClienteList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;

.field final synthetic val$callback:Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService$1;->this$0:Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;

    iput-object p2, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService$1;->val$callback:Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lretrofit2/Call;Ljava/lang/Throwable;)V
    .locals 1
    .param p2, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/BombonaClienteList;",
            ">;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 42
    .local p1, "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/BombonaClienteList;>;"
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService$1;->val$callback:Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;

    invoke-interface {v0, p2}, Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;->onErro(Ljava/lang/Throwable;)V

    .line 43
    return-void
.end method

.method public onResponse(Lretrofit2/Call;Lretrofit2/Response;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/BombonaClienteList;",
            ">;",
            "Lretrofit2/Response<",
            "Lcom/coleta/ambientuus/dto/list/BombonaClienteList;",
            ">;)V"
        }
    .end annotation

    .line 31
    .local p1, "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/BombonaClienteList;>;"
    .local p2, "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/BombonaClienteList;>;"
    invoke-virtual {p2}, Lretrofit2/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService$1;->val$callback:Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;

    invoke-virtual {p2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/list/BombonaClienteList;

    invoke-interface {v0, v1}, Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;->onSucesso(Lcom/coleta/ambientuus/dto/list/BombonaClienteList;)V

    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService$1;->val$callback:Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;

    new-instance v1, Ljava/lang/Exception;

    const-string v2, "Resposta inv\u00e1lida da API"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;->onErro(Ljava/lang/Throwable;)V

    .line 38
    :goto_0
    return-void
.end method
