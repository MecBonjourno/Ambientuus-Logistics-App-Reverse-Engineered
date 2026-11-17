.class public Lcom/coleta/ambientuus/ws/Services/PontoColetaService;
.super Ljava/lang/Object;
.source "PontoColetaService.java"


# instance fields
.field private final api:Lcom/coleta/ambientuus/ws/ApiService;

.field private final dataColeta:Ljava/lang/String;

.field private final idRota:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 2
    .param p1, "idRota"    # Ljava/lang/Integer;
    .param p2, "dataColeta"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Lcom/coleta/ambientuus/ws/RetrofitClient;->getClient()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/coleta/ambientuus/ws/ApiService;

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/ws/ApiService;

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 30
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;->idRota:Ljava/lang/Integer;

    .line 31
    iput-object p2, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;->dataColeta:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public sincronizar(Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;Landroid/content/Context;)V
    .locals 3
    .param p1, "manager"    # Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;
    .param p2, "context"    # Landroid/content/Context;

    .line 35
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    iget-object v1, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;->idRota:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Services/PontoColetaService;->dataColeta:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/coleta/ambientuus/ws/ApiService;->getPontoColeta(ILjava/lang/String;)Lretrofit2/Call;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/coleta/ambientuus/ws/Services/PontoColetaService$1;-><init>(Lcom/coleta/ambientuus/ws/Services/PontoColetaService;Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;Landroid/content/Context;)V

    invoke-interface {v0, v1}, Lretrofit2/Call;->enqueue(Lretrofit2/Callback;)V

    .line 67
    return-void
.end method
