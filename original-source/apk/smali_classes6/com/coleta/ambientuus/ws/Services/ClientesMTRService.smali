.class public Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;
.super Ljava/lang/Object;
.source "ClientesMTRService.java"


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

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 18
    return-void
.end method


# virtual methods
.method public sincronizar(Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;)V
    .locals 4
    .param p1, "manager"    # Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 21
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ClientesMTRService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    invoke-interface {v0}, Lcom/coleta/ambientuus/ws/ApiService;->getClientesMTR()Lretrofit2/Call;

    move-result-object v0

    invoke-interface {v0}, Lretrofit2/Call;->execute()Lretrofit2/Response;

    move-result-object v0

    .line 22
    .local v0, "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/ClienteMTRList;>;"
    invoke-virtual {v0}, Lretrofit2/Response;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 23
    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/dto/list/ClienteMTRList;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/list/ClienteMTRList;->getCLIENTESMTR()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/dto/ClienteMTR;

    .line 24
    .local v2, "c":Lcom/coleta/ambientuus/dto/ClienteMTR;
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/ClienteMTR;->getId_pessoa()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 25
    invoke-virtual {p1, v2}, Lcom/coleta/ambientuus/database/managers/ClienteMTRTableManager;->insert(Lcom/coleta/ambientuus/dto/ClienteMTR;)J

    .line 27
    .end local v2    # "c":Lcom/coleta/ambientuus/dto/ClienteMTR;
    :cond_0
    goto :goto_0

    :cond_1
    nop

    .line 31
    return-void

    .line 29
    :cond_2
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Erro ao sincronizar clientes"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
