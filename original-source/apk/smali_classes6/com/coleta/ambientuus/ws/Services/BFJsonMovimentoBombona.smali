.class public Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;
.super Landroid/os/AsyncTask;
.source "BFJsonMovimentoBombona.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/util/List<",
        "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
        ">;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static final URL_JSON_MOVIMENTO_BOMBONA:Ljava/lang/String; = "http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/inseriMovimentoBombona"


# instance fields
.field private context:Landroid/content/Context;

.field private dialog:Landroid/app/ProgressDialog;

.field private movtos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
            ">;)V"
        }
    .end annotation

    .line 30
    .local p2, "movtos":Ljava/util/List;, "Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->context:Landroid/content/Context;

    .line 32
    iput-object p2, p0, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->movtos:Ljava/util/List;

    .line 33
    return-void
.end method

.method private static error(Ljava/lang/String;)V
    .locals 1
    .param p0, "log"    # Ljava/lang/String;

    .line 92
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 94
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 22
    check-cast p1, [Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->doInBackground([Ljava/util/List;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/util/List;)Ljava/lang/Void;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/List<",
            "Lcom/coleta/ambientuus/dto/MovimentoBombona;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .line 45
    .local p1, "lists":[Ljava/util/List;, "[Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    const-string v0, "utf-8"

    const/4 v1, 0x0

    .line 47
    .local v1, "con":Ljava/net/HttpURLConnection;
    :try_start_0
    new-instance v2, Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;

    invoke-direct {v2}, Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;-><init>()V

    .line 48
    .local v2, "BOMBONAS":Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;
    iget-object v3, p0, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->movtos:Ljava/util/List;

    invoke-virtual {v2, v3}, Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;->setBOMBONAS(Ljava/util/List;)V

    .line 50
    new-instance v3, Lcom/google/gson/Gson;

    invoke-direct {v3}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v3, v2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 52
    .local v3, "jsonInputString":Ljava/lang/String;
    new-instance v4, Ljava/net/URL;

    const-string v5, "http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/inseriMovimentoBombona"

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 53
    .local v4, "url":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;

    move-object v1, v5

    .line 55
    const-string v5, "POST"

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 56
    const-string v5, "Content-Type"

    const-string v6, "application/json; utf-8"

    invoke-virtual {v1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string v5, "Accept"

    const-string v6, "application/json"

    invoke-virtual {v1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 60
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 61
    .local v5, "os":Ljava/io/OutputStream;
    :try_start_1
    invoke-virtual {v3, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 62
    .local v6, "input":[B
    array-length v7, v6

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8, v7}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 63
    .end local v6    # "input":[B
    if-eqz v5, :cond_0

    :try_start_2
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 65
    .end local v5    # "os":Ljava/io/OutputStream;
    :cond_0
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    .line 66
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 67
    .local v5, "br":Ljava/io/BufferedReader;
    :try_start_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .local v0, "response":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .line 69
    .local v6, "responseLine":Ljava/lang/String;
    :goto_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    move-object v6, v7

    if-eqz v7, :cond_1

    .line 70
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 72
    .end local v0    # "response":Ljava/lang/StringBuilder;
    .end local v6    # "responseLine":Ljava/lang/String;
    :cond_1
    :try_start_4
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 80
    .end local v2    # "BOMBONAS":Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;
    .end local v3    # "jsonInputString":Ljava/lang/String;
    .end local v4    # "url":Ljava/net/URL;
    .end local v5    # "br":Ljava/io/BufferedReader;
    if-eqz v1, :cond_3

    .line 81
    :goto_1
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_4

    .line 65
    .restart local v2    # "BOMBONAS":Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;
    .restart local v3    # "jsonInputString":Ljava/lang/String;
    .restart local v4    # "url":Ljava/net/URL;
    .restart local v5    # "br":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v6

    :try_start_6
    invoke-virtual {v0, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "con":Ljava/net/HttpURLConnection;
    .end local p1    # "lists":[Ljava/util/List;, "[Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    :goto_2
    throw v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 60
    .restart local v1    # "con":Ljava/net/HttpURLConnection;
    .local v5, "os":Ljava/io/OutputStream;
    .restart local p1    # "lists":[Ljava/util/List;, "[Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    :catchall_2
    move-exception v0

    if-eqz v5, :cond_2

    :try_start_7
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v6

    :try_start_8
    invoke-virtual {v0, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "con":Ljava/net/HttpURLConnection;
    .end local p1    # "lists":[Ljava/util/List;, "[Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    :cond_2
    :goto_3
    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 80
    .end local v2    # "BOMBONAS":Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;
    .end local v3    # "jsonInputString":Ljava/lang/String;
    .end local v4    # "url":Ljava/net/URL;
    .end local v5    # "os":Ljava/io/OutputStream;
    .restart local v1    # "con":Ljava/net/HttpURLConnection;
    .restart local p1    # "lists":[Ljava/util/List;, "[Ljava/util/List<Lcom/coleta/ambientuus/dto/MovimentoBombona;>;"
    :catchall_4
    move-exception v0

    goto :goto_5

    .line 73
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/lang/Exception;
    :try_start_9
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 75
    .local v2, "sw":Ljava/io/StringWriter;
    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 76
    .local v3, "pw":Ljava/io/PrintWriter;
    invoke-virtual {v0, v3}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 77
    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v4

    .line 78
    .local v4, "message":Ljava/lang/String;
    invoke-static {v4}, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->error(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 80
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "sw":Ljava/io/StringWriter;
    .end local v3    # "pw":Ljava/io/PrintWriter;
    .end local v4    # "message":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 81
    goto :goto_1

    .line 83
    :cond_3
    :goto_4
    const/4 v0, 0x0

    return-object v0

    .line 80
    :goto_5
    if-eqz v1, :cond_4

    .line 81
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 82
    :cond_4
    throw v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 22
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 3
    .param p1, "aVoid"    # Ljava/lang/Void;

    .line 87
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 88
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->context:Landroid/content/Context;

    const-string v1, "Dados enviados com sucesso!"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 89
    return-void
.end method

.method protected onPreExecute()V
    .locals 4

    .line 37
    iget-object v0, p0, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->context:Landroid/content/Context;

    const-string v1, "Por favor aguarde...."

    const/4 v2, 0x1

    const-string v3, "Atualizando dados!"

    invoke-static {v0, v3, v1, v2}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/ws/Services/BFJsonMovimentoBombona;->dialog:Landroid/app/ProgressDialog;

    .line 41
    return-void
.end method
