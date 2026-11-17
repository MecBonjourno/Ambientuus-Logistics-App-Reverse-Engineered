.class Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;
.super Ljava/lang/Object;
.source "GoogleAccountCredential.java"

# interfaces
.implements Lcom/google/api/client/http/HttpExecuteInterceptor;
.implements Lcom/google/api/client/http/HttpUnsuccessfulResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RequestHandler"
.end annotation


# instance fields
.field received401:Z

.field final synthetic this$0:Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

.field token:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    .line 283
    iput-object p1, p0, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;->this$0:Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/google/api/client/http/HttpRequest;Lcom/google/api/client/http/HttpResponse;Z)Z
    .locals 3
    .param p1, "request"    # Lcom/google/api/client/http/HttpRequest;
    .param p2, "response"    # Lcom/google/api/client/http/HttpResponse;
    .param p3, "supportsRetry"    # Z

    .line 306
    invoke-virtual {p2}, Lcom/google/api/client/http/HttpResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0x191

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;->received401:Z

    if-nez v0, :cond_0

    .line 307
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;->received401:Z

    .line 308
    iget-object v1, p0, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;->this$0:Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    iget-object v1, v1, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;->token:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/auth/GoogleAuthUtil;->invalidateToken(Landroid/content/Context;Ljava/lang/String;)V

    .line 309
    return v0

    .line 311
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public intercept(Lcom/google/api/client/http/HttpRequest;)V
    .locals 3
    .param p1, "request"    # Lcom/google/api/client/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 292
    :try_start_0
    iget-object v0, p0, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;->this$0:Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    invoke-virtual {v0}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;->getToken()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;->token:Ljava/lang/String;

    .line 293
    invoke-virtual {p1}, Lcom/google/api/client/http/HttpRequest;->getHeaders()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential$RequestHandler;->token:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/api/client/http/HttpHeaders;->setAuthorization(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    :try_end_0
    .catch Lcom/google/android/gms/auth/GooglePlayServicesAvailabilityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/gms/auth/UserRecoverableAuthException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/android/gms/auth/GoogleAuthException; {:try_start_0 .. :try_end_0} :catch_0

    .line 300
    nop

    .line 301
    return-void

    .line 298
    :catch_0
    move-exception v0

    .line 299
    .local v0, "e":Lcom/google/android/gms/auth/GoogleAuthException;
    new-instance v1, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAuthIOException;

    invoke-direct {v1, v0}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAuthIOException;-><init>(Lcom/google/android/gms/auth/GoogleAuthException;)V

    throw v1

    .line 296
    .end local v0    # "e":Lcom/google/android/gms/auth/GoogleAuthException;
    :catch_1
    move-exception v0

    .line 297
    .local v0, "e":Lcom/google/android/gms/auth/UserRecoverableAuthException;
    new-instance v1, Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException;

    invoke-direct {v1, v0}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException;-><init>(Lcom/google/android/gms/auth/UserRecoverableAuthException;)V

    throw v1

    .line 294
    .end local v0    # "e":Lcom/google/android/gms/auth/UserRecoverableAuthException;
    :catch_2
    move-exception v0

    .line 295
    .local v0, "e":Lcom/google/android/gms/auth/GooglePlayServicesAvailabilityException;
    new-instance v1, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GooglePlayServicesAvailabilityIOException;

    invoke-direct {v1, v0}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GooglePlayServicesAvailabilityIOException;-><init>(Lcom/google/android/gms/auth/GooglePlayServicesAvailabilityException;)V

    throw v1
.end method
