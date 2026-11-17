.class public Lcom/coleta/ambientuus/ws/Services/TelasService;
.super Ljava/lang/Object;
.source "TelasService.java"


# instance fields
.field private final api:Lcom/coleta/ambientuus/ws/ApiService;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-static {}, Lcom/coleta/ambientuus/ws/RetrofitClient;->getClient()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/coleta/ambientuus/ws/ApiService;

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/ws/ApiService;

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/TelasService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 22
    return-void
.end method


# virtual methods
.method public sincronizar(Lcom/coleta/ambientuus/database/managers/TelasTableManager;)V
    .locals 2
    .param p1, "manager"    # Lcom/coleta/ambientuus/database/managers/TelasTableManager;

    .line 25
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/TelasService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    invoke-interface {v0}, Lcom/coleta/ambientuus/ws/ApiService;->getTelas()Lretrofit2/Call;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/ws/Services/TelasService$1;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/ws/Services/TelasService$1;-><init>(Lcom/coleta/ambientuus/ws/Services/TelasService;Lcom/coleta/ambientuus/database/managers/TelasTableManager;)V

    invoke-interface {v0, v1}, Lretrofit2/Call;->enqueue(Lretrofit2/Callback;)V

    .line 49
    return-void
.end method
