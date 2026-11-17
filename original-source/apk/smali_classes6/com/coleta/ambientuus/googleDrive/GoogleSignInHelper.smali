.class public Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;
.super Ljava/lang/Object;
.source "GoogleSignInHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "GoogleSignInHelper"


# instance fields
.field private callback:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

.field private final credentialManager:Landroidx/credentials/CredentialManager;


# direct methods
.method public static synthetic $r8$lambda$PWpBszpDo30ZcEwGQ_lshS18f5M(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->lambda$notifyCancelled$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$QXtcL1rnMG41HzTcEff-8MfowY4(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->lambda$notifyError$1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$dZf-E8J_iYR72Xp2WbTG-VDulXE(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->lambda$notifySuccess$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleSignInError(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;Landroidx/credentials/exceptions/GetCredentialException;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->handleSignInError(Landroidx/credentials/exceptions/GetCredentialException;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleSignInResult(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;Landroidx/credentials/GetCredentialResponse;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->handleSignInResult(Landroidx/credentials/GetCredentialResponse;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-static {p1}, Landroidx/credentials/CredentialManager$-CC;->create(Landroid/content/Context;)Landroidx/credentials/CredentialManager;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->credentialManager:Landroidx/credentials/CredentialManager;

    .line 37
    return-void
.end method

.method private handleSignInError(Landroidx/credentials/exceptions/GetCredentialException;)V
    .locals 2
    .param p1, "e"    # Landroidx/credentials/exceptions/GetCredentialException;

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Erro classe: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GoogleSignInHelper"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 109
    instance-of v0, p1, Landroidx/credentials/exceptions/GetCredentialCancellationException;

    if-eqz v0, :cond_0

    .line 110
    invoke-direct {p0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->notifyCancelled()V

    goto :goto_0

    .line 111
    :cond_0
    instance-of v0, p1, Landroidx/credentials/exceptions/NoCredentialException;

    if-eqz v0, :cond_1

    .line 112
    const-string v0, "Nenhuma conta do Google encontrada"

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->notifyError(Ljava/lang/String;)V

    goto :goto_0

    .line 114
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Login falhou: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/credentials/exceptions/GetCredentialException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->notifyError(Ljava/lang/String;)V

    .line 116
    :goto_0
    return-void
.end method

.method private handleSignInResult(Landroidx/credentials/GetCredentialResponse;)V
    .locals 5
    .param p1, "response"    # Landroidx/credentials/GetCredentialResponse;

    .line 86
    :try_start_0
    invoke-virtual {p1}, Landroidx/credentials/GetCredentialResponse;->getCredential()Landroidx/credentials/Credential;

    move-result-object v0

    .line 88
    .local v0, "credential":Landroidx/credentials/Credential;
    const-string v1, "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"

    invoke-virtual {v0}, Landroidx/credentials/Credential;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    invoke-virtual {v0}, Landroidx/credentials/Credential;->getData()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/libraries/identity/googleid/GoogleIdTokenCredential;->createFrom(Landroid/os/Bundle;)Lcom/google/android/libraries/identity/googleid/GoogleIdTokenCredential;

    move-result-object v1

    .line 91
    .local v1, "googleCredential":Lcom/google/android/libraries/identity/googleid/GoogleIdTokenCredential;
    nop

    .line 92
    invoke-virtual {v1}, Lcom/google/android/libraries/identity/googleid/GoogleIdTokenCredential;->getId()Ljava/lang/String;

    move-result-object v2

    .line 93
    invoke-virtual {v1}, Lcom/google/android/libraries/identity/googleid/GoogleIdTokenCredential;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    .line 94
    invoke-virtual {v1}, Lcom/google/android/libraries/identity/googleid/GoogleIdTokenCredential;->getIdToken()Ljava/lang/String;

    move-result-object v4

    .line 91
    invoke-direct {p0, v2, v3, v4}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->notifySuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .end local v1    # "googleCredential":Lcom/google/android/libraries/identity/googleid/GoogleIdTokenCredential;
    goto :goto_0

    .line 97
    :cond_0
    const-string v1, "GoogleSignInHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Tipo de credential n\u00e3o esperado: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroidx/credentials/Credential;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const-string v1, "Credencial inesperada recebida"

    invoke-direct {p0, v1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->notifyError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .end local v0    # "credential":Landroidx/credentials/Credential;
    :goto_0
    goto :goto_1

    .line 100
    :catch_0
    move-exception v0

    .line 101
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Falha ao processar retorno do Login: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->notifyError(Ljava/lang/String;)V

    .line 103
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private synthetic lambda$notifyCancelled$2()V
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->callback:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

    invoke-interface {v0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;->onCancelled()V

    return-void
.end method

.method private synthetic lambda$notifyError$1(Ljava/lang/String;)V
    .locals 1
    .param p1, "error"    # Ljava/lang/String;

    .line 129
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->callback:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

    invoke-interface {v0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;->onError(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$notifySuccess$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "idToken"    # Ljava/lang/String;

    .line 121
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->callback:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;->onSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private notifyCancelled()V
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->callback:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

    if-eqz v0, :cond_0

    .line 136
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/os/HandlerCompat;->createAsync(Landroid/os/Looper;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 140
    :cond_0
    return-void
.end method

.method private notifyError(Ljava/lang/String;)V
    .locals 2
    .param p1, "error"    # Ljava/lang/String;

    .line 127
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->callback:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

    if-eqz v0, :cond_0

    .line 128
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/os/HandlerCompat;->createAsync(Landroid/os/Looper;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 132
    :cond_0
    return-void
.end method

.method private notifySuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "idToken"    # Ljava/lang/String;

    .line 119
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->callback:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

    if-eqz v0, :cond_0

    .line 120
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/os/HandlerCompat;->createAsync(Landroid/os/Looper;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 124
    :cond_0
    return-void
.end method


# virtual methods
.method public setCallback(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

    .line 40
    iput-object p1, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->callback:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;

    .line 41
    return-void
.end method

.method public signIn(Landroid/app/Activity;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;

    .line 46
    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v3, p1

    goto :goto_0

    .line 51
    :cond_0
    new-instance v0, Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;

    invoke-direct {v0}, Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;-><init>()V

    const-string v1, "903755048894-rnt9c9dcece0no3ipun5etu80f8o9fbo.apps.googleusercontent.com"

    .line 52
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;->setServerClientId(Ljava/lang/String;)Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;

    move-result-object v0

    .line 53
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;->setFilterByAuthorizedAccounts(Z)Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;

    move-result-object v0

    .line 54
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;->setAutoSelectEnabled(Z)Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;

    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption$Builder;->build()Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption;

    move-result-object v0

    .line 57
    .local v0, "googleIdOption":Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption;
    new-instance v1, Landroidx/credentials/GetCredentialRequest$Builder;

    invoke-direct {v1}, Landroidx/credentials/GetCredentialRequest$Builder;-><init>()V

    .line 58
    invoke-virtual {v1, v0}, Landroidx/credentials/GetCredentialRequest$Builder;->addCredentialOption(Landroidx/credentials/CredentialOption;)Landroidx/credentials/GetCredentialRequest$Builder;

    move-result-object v1

    .line 59
    invoke-virtual {v1}, Landroidx/credentials/GetCredentialRequest$Builder;->build()Landroidx/credentials/GetCredentialRequest;

    move-result-object v1

    move-object v4, v1

    .line 62
    .local v4, "request":Landroidx/credentials/GetCredentialRequest;
    iget-object v2, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->credentialManager:Landroidx/credentials/CredentialManager;

    .line 66
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v6

    new-instance v7, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$1;

    invoke-direct {v7, p0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$1;-><init>(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    const/4 v5, 0x0

    move-object v3, p1

    .end local p1    # "activity":Landroid/app/Activity;
    .local v3, "activity":Landroid/app/Activity;
    :try_start_1
    invoke-interface/range {v2 .. v7}, Landroidx/credentials/CredentialManager;->getCredentialAsync(Landroid/content/Context;Landroidx/credentials/GetCredentialRequest;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroidx/credentials/CredentialManagerCallback;)V

    .line 81
    .end local v0    # "googleIdOption":Lcom/google/android/libraries/identity/googleid/GetGoogleIdOption;
    .end local v4    # "request":Landroidx/credentials/GetCredentialRequest;
    goto :goto_2

    .line 79
    .end local v3    # "activity":Landroid/app/Activity;
    .restart local p1    # "activity":Landroid/app/Activity;
    :catch_0
    move-exception v0

    move-object v3, p1

    move-object p1, v0

    .end local p1    # "activity":Landroid/app/Activity;
    .restart local v3    # "activity":Landroid/app/Activity;
    goto :goto_1

    .line 46
    .end local v3    # "activity":Landroid/app/Activity;
    .restart local p1    # "activity":Landroid/app/Activity;
    :cond_1
    move-object v3, p1

    .line 47
    .end local p1    # "activity":Landroid/app/Activity;
    .restart local v3    # "activity":Landroid/app/Activity;
    :goto_0
    const-string p1, "Atividade Invalida"

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->notifyError(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 48
    return-void

    .line 79
    :catch_1
    move-exception v0

    move-object p1, v0

    .line 80
    .local p1, "e":Ljava/lang/Exception;
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Inicializacao do Login falhou: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->notifyError(Ljava/lang/String;)V

    .line 82
    .end local p1    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method
