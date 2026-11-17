.class public Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;
.super Ljava/lang/Object;
.source "ConsultaEtiquetaService.java"


# instance fields
.field private final api:Lcom/coleta/ambientuus/ws/ApiService;

.field private final etiqueta:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "etiqueta"    # Ljava/lang/String;

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;->etiqueta:Ljava/lang/String;

    .line 20
    invoke-static {}, Lcom/coleta/ambientuus/ws/RetrofitClient;->getClient()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/coleta/ambientuus/ws/ApiService;

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/ws/ApiService;

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 21
    return-void
.end method


# virtual methods
.method public consultar(Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;)V
    .locals 2
    .param p1, "callback"    # Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;

    .line 24
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    iget-object v1, p0, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;->etiqueta:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/coleta/ambientuus/ws/ApiService;->getConsultaEtiqueta(Ljava/lang/String;)Lretrofit2/Call;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService$1;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService$1;-><init>(Lcom/coleta/ambientuus/ws/Services/ConsultaEtiquetaService;Lcom/coleta/ambientuus/utils/ConsultaEtiquetaCallback;)V

    .line 25
    invoke-interface {v0, v1}, Lretrofit2/Call;->enqueue(Lretrofit2/Callback;)V

    .line 45
    return-void
.end method
