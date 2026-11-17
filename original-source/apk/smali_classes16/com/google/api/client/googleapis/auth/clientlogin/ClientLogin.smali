.class public final Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin;
.super Ljava/lang/Object;
.source "ClientLogin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$ErrorInfo;,
        Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$Response;
    }
.end annotation


# instance fields
.field public accountType:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field public applicationName:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "source"
    .end annotation
.end field

.field public authTokenType:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "service"
    .end annotation
.end field

.field public captchaAnswer:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "logincaptcha"
    .end annotation
.end field

.field public captchaToken:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "logintoken"
    .end annotation
.end field

.field public password:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Passwd"
    .end annotation
.end field

.field public serverUrl:Lcom/google/api/client/http/GenericUrl;

.field public transport:Lcom/google/api/client/http/HttpTransport;

.field public username:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Email"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lcom/google/api/client/http/GenericUrl;

    const-string v1, "https://www.google.com"

    invoke-direct {v0, v1}, Lcom/google/api/client/http/GenericUrl;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin;->serverUrl:Lcom/google/api/client/http/GenericUrl;

    return-void
.end method

.method public static getAuthorizationHeaderValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "authToken"    # Ljava/lang/String;

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GoogleLogin auth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public authenticate()Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$Response;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 174
    iget-object v0, p0, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin;->serverUrl:Lcom/google/api/client/http/GenericUrl;

    invoke-virtual {v0}, Lcom/google/api/client/http/GenericUrl;->clone()Lcom/google/api/client/http/GenericUrl;

    move-result-object v0

    .line 175
    .local v0, "url":Lcom/google/api/client/http/GenericUrl;
    const-string v1, "/accounts/ClientLogin"

    invoke-virtual {v0, v1}, Lcom/google/api/client/http/GenericUrl;->appendRawPath(Ljava/lang/String;)V

    .line 176
    iget-object v1, p0, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin;->transport:Lcom/google/api/client/http/HttpTransport;

    .line 177
    invoke-virtual {v1}, Lcom/google/api/client/http/HttpTransport;->createRequestFactory()Lcom/google/api/client/http/HttpRequestFactory;

    move-result-object v1

    new-instance v2, Lcom/google/api/client/http/UrlEncodedContent;

    invoke-direct {v2, p0}, Lcom/google/api/client/http/UrlEncodedContent;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v0, v2}, Lcom/google/api/client/http/HttpRequestFactory;->buildPostRequest(Lcom/google/api/client/http/GenericUrl;Lcom/google/api/client/http/HttpContent;)Lcom/google/api/client/http/HttpRequest;

    move-result-object v1

    .line 178
    .local v1, "request":Lcom/google/api/client/http/HttpRequest;
    sget-object v2, Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;->INSTANCE:Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;

    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpRequest;->setParser(Lcom/google/api/client/util/ObjectParser;)Lcom/google/api/client/http/HttpRequest;

    .line 179
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpRequest;->setContentLoggingLimit(I)Lcom/google/api/client/http/HttpRequest;

    .line 180
    invoke-virtual {v1, v2}, Lcom/google/api/client/http/HttpRequest;->setThrowExceptionOnExecuteError(Z)Lcom/google/api/client/http/HttpRequest;

    .line 181
    invoke-virtual {v1}, Lcom/google/api/client/http/HttpRequest;->execute()Lcom/google/api/client/http/HttpResponse;

    move-result-object v2

    .line 183
    .local v2, "response":Lcom/google/api/client/http/HttpResponse;
    invoke-virtual {v2}, Lcom/google/api/client/http/HttpResponse;->isSuccessStatusCode()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 184
    const-class v3, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$Response;

    invoke-virtual {v2, v3}, Lcom/google/api/client/http/HttpResponse;->parseAs(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$Response;

    return-object v3

    .line 186
    :cond_0
    new-instance v3, Lcom/google/api/client/http/HttpResponseException$Builder;

    .line 187
    invoke-virtual {v2}, Lcom/google/api/client/http/HttpResponse;->getStatusCode()I

    move-result v4

    invoke-virtual {v2}, Lcom/google/api/client/http/HttpResponse;->getStatusMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/google/api/client/http/HttpResponse;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/google/api/client/http/HttpResponseException$Builder;-><init>(ILjava/lang/String;Lcom/google/api/client/http/HttpHeaders;)V

    .line 189
    .local v3, "builder":Lcom/google/api/client/http/HttpResponseException$Builder;
    const-class v4, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$ErrorInfo;

    invoke-virtual {v2, v4}, Lcom/google/api/client/http/HttpResponse;->parseAs(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$ErrorInfo;

    .line 190
    .local v4, "details":Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$ErrorInfo;
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 191
    .local v5, "detailString":Ljava/lang/String;
    invoke-static {v2}, Lcom/google/api/client/http/HttpResponseException;->computeMessageBuffer(Lcom/google/api/client/http/HttpResponse;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 192
    .local v6, "message":Ljava/lang/StringBuilder;
    invoke-static {v5}, Lcom/google/api/client/util/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 193
    sget-object v7, Lcom/google/api/client/util/StringUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    invoke-virtual {v3, v5}, Lcom/google/api/client/http/HttpResponseException$Builder;->setContent(Ljava/lang/String;)Lcom/google/api/client/http/HttpResponseException$Builder;

    .line 196
    :cond_1
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/google/api/client/http/HttpResponseException$Builder;->setMessage(Ljava/lang/String;)Lcom/google/api/client/http/HttpResponseException$Builder;

    .line 197
    new-instance v7, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLoginResponseException;

    invoke-direct {v7, v3, v4}, Lcom/google/api/client/googleapis/auth/clientlogin/ClientLoginResponseException;-><init>(Lcom/google/api/client/http/HttpResponseException$Builder;Lcom/google/api/client/googleapis/auth/clientlogin/ClientLogin$ErrorInfo;)V

    throw v7
.end method
