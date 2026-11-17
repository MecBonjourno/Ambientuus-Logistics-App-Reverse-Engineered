.class public Lcom/coleta/ambientuus/ws/Services/TerceirosService;
.super Ljava/lang/Object;
.source "TerceirosService.java"


# instance fields
.field private final api:Lcom/coleta/ambientuus/ws/ApiService;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-static {}, Lcom/coleta/ambientuus/ws/RetrofitClient;->getClient()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/coleta/ambientuus/ws/ApiService;

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/ws/ApiService;

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/TerceirosService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 18
    return-void
.end method


# virtual methods
.method public sincronizar(Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;)V
    .locals 3
    .param p1, "manager"    # Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 20
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/TerceirosService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    invoke-interface {v0}, Lcom/coleta/ambientuus/ws/ApiService;->getTerceiros()Lretrofit2/Call;

    move-result-object v0

    invoke-interface {v0}, Lretrofit2/Call;->execute()Lretrofit2/Response;

    move-result-object v0

    .line 21
    .local v0, "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/TerceiroList;>;"
    invoke-virtual {v0}, Lretrofit2/Response;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 22
    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/list/TerceiroList;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/list/TerceiroList;->getTERCEIROS()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/dto/Terceiro;

    .line 23
    .local v2, "t":Lcom/coleta/ambientuus/dto/Terceiro;
    invoke-virtual {p1, v2}, Lcom/coleta/ambientuus/database/managers/TerceiroTableManager;->insert(Lcom/coleta/ambientuus/dto/Terceiro;)V

    .line 24
    .end local v2    # "t":Lcom/coleta/ambientuus/dto/Terceiro;
    goto :goto_0

    :cond_0
    nop

    .line 28
    return-void

    .line 26
    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Erro ao sincronizar terceiros"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
