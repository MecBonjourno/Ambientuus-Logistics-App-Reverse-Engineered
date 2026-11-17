.class public Lcom/coleta/ambientuus/ws/Services/BombonasService;
.super Ljava/lang/Object;
.source "BombonasService.java"


# instance fields
.field private final api:Lcom/coleta/ambientuus/ws/ApiService;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-static {}, Lcom/coleta/ambientuus/ws/RetrofitClient;->getClient()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/coleta/ambientuus/ws/ApiService;

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/ws/ApiService;

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/BombonasService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 19
    return-void
.end method


# virtual methods
.method public sincronizar(Lcom/coleta/ambientuus/database/managers/BombonaTableManager;)V
    .locals 3
    .param p1, "manager"    # Lcom/coleta/ambientuus/database/managers/BombonaTableManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/BombonasService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    invoke-interface {v0}, Lcom/coleta/ambientuus/ws/ApiService;->getBombonas()Lretrofit2/Call;

    move-result-object v0

    invoke-interface {v0}, Lretrofit2/Call;->execute()Lretrofit2/Response;

    move-result-object v0

    .line 23
    .local v0, "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/BombonaList;>;"
    invoke-virtual {v0}, Lretrofit2/Response;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 24
    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/list/BombonaList;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/list/BombonaList;->getBfBombonas()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/dto/Bombona;

    .line 25
    .local v2, "b":Lcom/coleta/ambientuus/dto/Bombona;
    invoke-virtual {p1, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->insert(Lcom/coleta/ambientuus/dto/Bombona;)J

    .line 26
    .end local v2    # "b":Lcom/coleta/ambientuus/dto/Bombona;
    goto :goto_0

    :cond_0
    nop

    .line 30
    return-void

    .line 28
    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Erro ao sincronizar bombonas"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
