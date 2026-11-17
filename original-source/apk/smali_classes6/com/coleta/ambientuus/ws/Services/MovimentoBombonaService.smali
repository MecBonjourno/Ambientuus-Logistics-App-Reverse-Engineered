.class public Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;
.super Ljava/lang/Object;
.source "MovimentoBombonaService.java"


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final api:Lcom/coleta/ambientuus/ws/ApiService;

.field private final context:Landroid/content/Context;

.field private final movimentoBombonaList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$gJPRk2Rq-mdOI06H_Fv0Z6Kdf_A(Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->lambda$enviarMovimentos$0()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Landroid/app/Activity;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
            ">;",
            "Landroid/app/Activity;",
            ")V"
        }
    .end annotation

    .line 24
    .local p2, "movimentoBombonaList":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->context:Landroid/content/Context;

    .line 26
    iput-object p2, p0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->movimentoBombonaList:Ljava/util/List;

    .line 27
    iput-object p3, p0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->activity:Landroid/app/Activity;

    .line 28
    invoke-static {}, Lcom/coleta/ambientuus/ws/RetrofitClient;->getClient()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/coleta/ambientuus/ws/ApiService;

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/ws/ApiService;

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 29
    return-void
.end method

.method private synthetic lambda$enviarMovimentos$0()V
    .locals 3

    .line 42
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->context:Landroid/content/Context;

    const-string v1, "Movimentos enviados com sucesso!"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 43
    return-void
.end method


# virtual methods
.method public enviarMovimentos()V
    .locals 6

    .line 33
    :try_start_0
    new-instance v0, Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;

    invoke-direct {v0}, Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;-><init>()V

    .line 34
    .local v0, "requestList":Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;
    iget-object v1, p0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->movimentoBombonaList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;->setBOMBONAS(Ljava/util/List;)V

    .line 36
    iget-object v1, p0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    invoke-interface {v1, v0}, Lcom/coleta/ambientuus/ws/ApiService;->postBombona(Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;)Lretrofit2/Call;

    move-result-object v1

    .line 37
    .local v1, "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;>;"
    invoke-interface {v1}, Lretrofit2/Call;->execute()Lretrofit2/Response;

    move-result-object v2

    .line 39
    .local v2, "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;>;"
    invoke-virtual {v2}, Lretrofit2/Response;->isSuccessful()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 41
    iget-object v3, p0, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;->activity:Landroid/app/Activity;

    new-instance v4, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0}, Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/ws/Services/MovimentoBombonaService;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 45
    :cond_0
    const-string v3, "BOMBONA_ERRO"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Erro na resposta: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 46
    invoke-virtual {v2}, Lretrofit2/Response;->errorBody()Lokhttp3/ResponseBody;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v2}, Lretrofit2/Response;->errorBody()Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    :cond_1
    const-string v5, "Erro desconhecido"

    :goto_0
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 45
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .end local v0    # "requestList":Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;
    .end local v1    # "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;>;"
    .end local v2    # "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;>;"
    :goto_1
    goto :goto_2

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Falha na requisi\u00e7\u00e3o: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "BOMBONA_FALHA"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method
