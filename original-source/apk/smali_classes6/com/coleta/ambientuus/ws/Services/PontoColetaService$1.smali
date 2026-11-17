.class Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;
.super Ljava/lang/Object;
.source "PontoColetaService.java"

# interfaces
.implements Lretrofit2/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/ws/Services/PontoColetaService;->sincronizar(Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lretrofit2/Callback<",
        "Lcom/coleta/ambientuus/dto/list/PontoColetaList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/ws/Services/PontoColetaService;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$manager:Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/ws/Services/PontoColetaService;Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/ws/Services/PontoColetaService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;->this$0:Lcom/coleta/ambientuus/ws/Services/PontoColetaService;

    iput-object p2, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;->val$manager:Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    iput-object p3, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;->val$context:Landroid/content/Context;

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
            "Lcom/coleta/ambientuus/dto/list/PontoColetaList;",
            ">;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 63
    .local p1, "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/PontoColetaList;>;"
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

    const-string v1, "PONTO_COLETA_FALHA"

    invoke-static {v1, v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 64
    sget-object v0, Lcom/coleta/ambientuus/domain/model/SyncState;->ERROR:Lcom/coleta/ambientuus/domain/model/SyncState;

    invoke-static {v0}, Lcom/coleta/ambientuus/utils/SyncStatus;->setStatus(Lcom/coleta/ambientuus/domain/model/SyncState;)V

    .line 65
    return-void
.end method

.method public onResponse(Lretrofit2/Call;Lretrofit2/Response;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/PontoColetaList;",
            ">;",
            "Lretrofit2/Response<",
            "Lcom/coleta/ambientuus/dto/list/PontoColetaList;",
            ">;)V"
        }
    .end annotation

    .line 38
    .local p1, "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/PontoColetaList;>;"
    .local p2, "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/PontoColetaList;>;"
    invoke-virtual {p2}, Lretrofit2/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 39
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;->val$manager:Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->deleteAll()V

    .line 40
    invoke-virtual {p2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/list/PontoColetaList;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/list/PontoColetaList;->getPontosColeta()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 41
    .local v1, "p":Lcom/coleta/ambientuus/dto/PontoColeta;
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getCodCliente()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 42
    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;->val$manager:Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    invoke-virtual {v2, v1}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->insert(Lcom/coleta/ambientuus/dto/PontoColeta;)V

    .line 44
    .end local v1    # "p":Lcom/coleta/ambientuus/dto/PontoColeta;
    :cond_0
    goto :goto_0

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;->val$context:Landroid/content/Context;

    const-string v1, "SYNC_PREFS"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 46
    .local v0, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "pontosColetaSincronizado"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 48
    sget-object v1, Lcom/coleta/ambientuus/domain/model/SyncState;->SUCCESS:Lcom/coleta/ambientuus/domain/model/SyncState;

    invoke-static {v1}, Lcom/coleta/ambientuus/utils/SyncStatus;->setStatus(Lcom/coleta/ambientuus/domain/model/SyncState;)V

    .line 50
    .end local v0    # "prefs":Landroid/content/SharedPreferences;
    goto :goto_1

    .line 52
    :cond_2
    :try_start_0
    const-string v0, "PONTO_COLETA_ERRO"

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

    .line 53
    sget-object v0, Lcom/coleta/ambientuus/domain/model/SyncState;->ERROR:Lcom/coleta/ambientuus/domain/model/SyncState;

    invoke-static {v0}, Lcom/coleta/ambientuus/utils/SyncStatus;->setStatus(Lcom/coleta/ambientuus/domain/model/SyncState;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    goto :goto_1

    .line 54
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 56
    sget-object v1, Lcom/coleta/ambientuus/domain/model/SyncState;->ERROR:Lcom/coleta/ambientuus/domain/model/SyncState;

    invoke-static {v1}, Lcom/coleta/ambientuus/utils/SyncStatus;->setStatus(Lcom/coleta/ambientuus/domain/model/SyncState;)V

    .line 59
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method
