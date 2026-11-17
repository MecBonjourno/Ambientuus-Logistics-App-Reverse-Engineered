.class public Lcom/coleta/ambientuus/ws/Services/ColetasService;
.super Ljava/lang/Object;
.source "ColetasService.java"


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final api:Lcom/coleta/ambientuus/ws/ApiService;

.field private final coletaList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;"
        }
    .end annotation
.end field

.field private final coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

.field private final context:Landroid/content/Context;


# direct methods
.method public static synthetic $r8$lambda$4O8bdUHiI27SNwMSeA5yv4UDls0(Lcom/coleta/ambientuus/ws/Services/ColetasService;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/ws/Services/ColetasService;->lambda$enviarColetas$1()V

    return-void
.end method

.method public static synthetic $r8$lambda$ZFeU2uVMe17sTtGNqJ2877Md1go(Lcom/coleta/ambientuus/ws/Services/ColetasService;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/ws/Services/ColetasService;->lambda$enviarColetas$2()V

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
            "Lcom/coleta/ambientuus/dto/Coleta;",
            ">;",
            "Landroid/app/Activity;",
            ")V"
        }
    .end annotation

    .line 31
    .local p2, "coletaList":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/Coleta;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->context:Landroid/content/Context;

    .line 33
    iput-object p2, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->coletaList:Ljava/util/List;

    .line 34
    new-instance v0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v1, p1}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    .line 35
    iput-object p3, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->activity:Landroid/app/Activity;

    .line 36
    invoke-static {}, Lcom/coleta/ambientuus/ws/RetrofitClient;->getClient()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/coleta/ambientuus/ws/ApiService;

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/ws/ApiService;

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    .line 37
    return-void
.end method

.method static synthetic lambda$enviarColetas$0(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 64
    return-void
.end method

.method private synthetic lambda$enviarColetas$1()V
    .locals 3

    .line 59
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 60
    const-string v1, "N\u00e3o foi poss\u00edvel atualizar a base"

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    .line 61
    const-string v1, "Reinicie o aplicativo e tente novamente."

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$drawable;->ic_alert_dialog_error:I

    .line 62
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setIcon(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/ws/Services/ColetasService$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lcom/coleta/ambientuus/ws/Services/ColetasService$$ExternalSyntheticLambda2;-><init>()V

    .line 63
    const-string v2, "Ok"

    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    .line 65
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 67
    return-void
.end method

.method private synthetic lambda$enviarColetas$2()V
    .locals 3

    .line 70
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->context:Landroid/content/Context;

    const-string v1, "Base atualizada com sucesso!"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 71
    return-void
.end method


# virtual methods
.method public enviarColetas()V
    .locals 6

    .line 41
    :try_start_0
    new-instance v0, Lcom/coleta/ambientuus/dto/list/ColetaList;

    invoke-direct {v0}, Lcom/coleta/ambientuus/dto/list/ColetaList;-><init>()V

    .line 42
    .local v0, "requestList":Lcom/coleta/ambientuus/dto/list/ColetaList;
    iget-object v1, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->coletaList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/dto/list/ColetaList;->setCOLETA(Ljava/util/List;)V

    .line 44
    iget-object v1, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->api:Lcom/coleta/ambientuus/ws/ApiService;

    invoke-interface {v1, v0}, Lcom/coleta/ambientuus/ws/ApiService;->postColeta(Lcom/coleta/ambientuus/dto/list/ColetaList;)Lretrofit2/Call;

    move-result-object v1

    .line 45
    .local v1, "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/ColetaList;>;"
    invoke-interface {v1}, Lretrofit2/Call;->execute()Lretrofit2/Response;

    move-result-object v2

    .line 47
    .local v2, "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/ColetaList;>;"
    invoke-virtual {v2}, Lretrofit2/Response;->isSuccessful()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 48
    invoke-virtual {v2}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/coleta/ambientuus/dto/list/ColetaList;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/list/ColetaList;->getCOLETAS()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/coleta/ambientuus/dto/Coleta;

    .line 49
    .local v4, "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    invoke-virtual {v4}, Lcom/coleta/ambientuus/dto/Coleta;->getId_app_coleta()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 50
    iget-object v5, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v5, v4}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->updateReturnColeta(Lcom/coleta/ambientuus/dto/Coleta;)V

    .line 52
    .end local v4    # "coleta":Lcom/coleta/ambientuus/dto/Coleta;
    :cond_0
    goto :goto_0

    .line 54
    :cond_1
    iget-object v3, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->updateListJson()Z

    move-result v3

    .line 55
    .local v3, "resultado":Z
    iget-object v4, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->coletaTableManager:Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v4}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->deleteOldColeta()V

    .line 57
    if-nez v3, :cond_2

    .line 58
    iget-object v4, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->activity:Landroid/app/Activity;

    new-instance v5, Lcom/coleta/ambientuus/ws/Services/ColetasService$$ExternalSyntheticLambda0;

    invoke-direct {v5, p0}, Lcom/coleta/ambientuus/ws/Services/ColetasService$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/ws/Services/ColetasService;)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 69
    :cond_2
    iget-object v4, p0, Lcom/coleta/ambientuus/ws/Services/ColetasService;->activity:Landroid/app/Activity;

    new-instance v5, Lcom/coleta/ambientuus/ws/Services/ColetasService$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0}, Lcom/coleta/ambientuus/ws/Services/ColetasService$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/ws/Services/ColetasService;)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 74
    .end local v3    # "resultado":Z
    :goto_1
    goto :goto_3

    .line 75
    :cond_3
    const-string v3, "COLETA_ERRO"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Erro na resposta: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 76
    invoke-virtual {v2}, Lretrofit2/Response;->errorBody()Lokhttp3/ResponseBody;

    move-result-object v5

    if-eqz v5, :cond_4

    invoke-virtual {v2}, Lretrofit2/Response;->errorBody()Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v5

    goto :goto_2

    :cond_4
    const-string v5, "Erro desconhecido"

    :goto_2
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 75
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .end local v0    # "requestList":Lcom/coleta/ambientuus/dto/list/ColetaList;
    .end local v1    # "call":Lretrofit2/Call;, "Lretrofit2/Call<Lcom/coleta/ambientuus/dto/list/ColetaList;>;"
    .end local v2    # "response":Lretrofit2/Response;, "Lretrofit2/Response<Lcom/coleta/ambientuus/dto/list/ColetaList;>;"
    :goto_3
    goto :goto_4

    .line 79
    :catch_0
    move-exception v0

    .line 80
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

    const-string v2, "COLETA_FALHA"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 82
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_4
    return-void
.end method
