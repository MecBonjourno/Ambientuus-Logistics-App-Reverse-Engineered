.class public Lcom/coleta/ambientuus/ws/Services/ManifestoService;
.super Ljava/lang/Object;
.source "ManifestoService.java"


# instance fields
.field private final api:Lcom/coleta/ambientuus/ws/ApiService;

.field private final dataColeta:Ljava/lang/String;

.field private final idRota:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 2
    .param p1, "idRota"    # Ljava/lang/Integer;
    .param p2, "dataColeta"    # Ljava/lang/String;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/ManifestoService;->idRota:Ljava/lang/Integer;

    .line 22
    iput-object p2, p0, Lcom/coleta/ambientuus/ws/Services/ManifestoService;->dataColeta:Ljava/lang/String;

    .line 23
    invoke-static {}, Lcom/coleta/ambientuus/ws/RetrofitClient;->getClient()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/coleta/ambientuus/ws/ApiService;

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/ws/ApiService;

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ManifestoService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 24
    return-void
.end method


# virtual methods
.method public sincronizar(Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;)V
    .locals 3
    .param p1, "manager"    # Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;

    .line 27
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ManifestoService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    iget-object v1, p0, Lcom/coleta/ambientuus/ws/Services/ManifestoService;->idRota:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/coleta/ambientuus/ws/Services/ManifestoService;->dataColeta:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/coleta/ambientuus/ws/ApiService;->getManifesto(ILjava/lang/String;)Lretrofit2/Call;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/ws/Services/ManifestoService$1;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/ws/Services/ManifestoService$1;-><init>(Lcom/coleta/ambientuus/ws/Services/ManifestoService;Lcom/coleta/ambientuus/database/managers/ManifestoTableManager;)V

    invoke-interface {v0, v1}, Lretrofit2/Call;->enqueue(Lretrofit2/Callback;)V

    .line 52
    return-void
.end method
