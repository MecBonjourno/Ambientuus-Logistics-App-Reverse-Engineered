.class Lcom/coleta/ambientuus/ws/Services/TelasService$1;
.super Ljava/lang/Object;
.source "TelasService.java"

# interfaces
.implements Lretrofit2/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/ws/Services/TelasService;->sincronizar(Lcom/coleta/ambientuus/database/managers/TelasTableManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lretrofit2/Callback<",
        "Lcom/coleta/ambientuus/dto/list/TelasList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/ws/Services/TelasService;

.field final synthetic val$manager:Lcom/coleta/ambientuus/database/managers/TelasTableManager;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/ws/Services/TelasService;Lcom/coleta/ambientuus/database/managers/TelasTableManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/ws/Services/TelasService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/TelasService$1;->this$0:Lcom/coleta/ambientuus/ws/Services/TelasService;

    iput-object p2, p0, Lcom/coleta/ambientuus/ws/Services/TelasService$1;->val$manager:Lcom/coleta/ambientuus/database/managers/TelasTableManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lretrofit2/Call;Ljava/lang/Throwable;)V
    .locals 2
    .param p2, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/TelasList;",
            ">;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 46
    .local p1, "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/TelasList;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Falha na requisi\u00e7\u00e3o: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ERRO"

    invoke-static {v1, v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 47
    return-void
.end method

.method public onResponse(Lretrofit2/Call;Lretrofit2/Response;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/TelasList;",
            ">;",
            "Lretrofit2/Response<",
            "Lcom/coleta/ambientuus/dto/list/TelasList;",
            ">;)V"
        }
    .end annotation

    .line 28
    .local p1, "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/TelasList;>;"
    .local p2, "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/TelasList;>;"
    invoke-virtual {p2}, Lretrofit2/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 29
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/TelasService$1;->val$manager:Lcom/coleta/ambientuus/database/managers/TelasTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->deleteAll()V

    .line 30
    invoke-virtual {p2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/list/TelasList;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/list/TelasList;->getTelas()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/Telas;

    .line 31
    .local v1, "t":Lcom/coleta/ambientuus/dto/Telas;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/Telas;->getCOLETAR_MANUAL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 32
    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Services/TelasService$1;->val$manager:Lcom/coleta/ambientuus/database/managers/TelasTableManager;

    invoke-virtual {v2, v1}, Lcom/coleta/ambientuus/database/managers/TelasTableManager;->insert(Lcom/coleta/ambientuus/dto/Telas;)V

    .line 34
    .end local v1    # "t":Lcom/coleta/ambientuus/dto/Telas;
    :cond_0
    goto :goto_0

    :cond_1
    goto :goto_1

    .line 37
    :cond_2
    :try_start_0
    const-string v0, "ERRO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Erro na resposta: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lretrofit2/Response;->errorBody()Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    goto :goto_1

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 42
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    return-void
.end method
