.class public Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
.super Lcom/google/api/client/auth/oauth2/Credential$Builder;
.source "GoogleCredential.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field serviceAccountId:Ljava/lang/String;

.field serviceAccountPrivateKey:Ljava/security/PrivateKey;

.field serviceAccountPrivateKeyId:Ljava/lang/String;

.field serviceAccountProjectId:Ljava/lang/String;

.field serviceAccountScopes:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field serviceAccountUser:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 562
    invoke-static {}, Lcom/google/api/client/auth/oauth2/BearerToken;->authorizationHeaderAccessMethod()Lcom/google/api/client/auth/oauth2/Credential$AccessMethod;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/api/client/auth/oauth2/Credential$Builder;-><init>(Lcom/google/api/client/auth/oauth2/Credential$AccessMethod;)V

    .line 563
    const-string v0, "https://oauth2.googleapis.com/token"

    invoke-virtual {p0, v0}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setTokenServerEncodedUrl(Ljava/lang/String;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    .line 564
    return-void
.end method


# virtual methods
.method public bridge synthetic addRefreshListener(Lcom/google/api/client/auth/oauth2/CredentialRefreshListener;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->addRefreshListener(Lcom/google/api/client/auth/oauth2/CredentialRefreshListener;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addRefreshListener(Lcom/google/api/client/auth/oauth2/CredentialRefreshListener;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "refreshListener"    # Lcom/google/api/client/auth/oauth2/CredentialRefreshListener;

    .line 817
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->addRefreshListener(Lcom/google/api/client/auth/oauth2/CredentialRefreshListener;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/api/client/auth/oauth2/Credential;
    .locals 1

    .line 536
    invoke-virtual {p0}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->build()Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential;
    .locals 1

    .line 568
    new-instance v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential;

    invoke-direct {v0, p0}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential;-><init>(Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;)V

    return-object v0
.end method

.method public final getServiceAccountId()Ljava/lang/String;
    .locals 1

    .line 621
    iget-object v0, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountId:Ljava/lang/String;

    return-object v0
.end method

.method public final getServiceAccountPrivateKey()Ljava/security/PrivateKey;
    .locals 1

    .line 687
    iget-object v0, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountPrivateKey:Ljava/security/PrivateKey;

    return-object v0
.end method

.method public final getServiceAccountPrivateKeyId()Ljava/lang/String;
    .locals 1

    .line 710
    iget-object v0, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountPrivateKeyId:Ljava/lang/String;

    return-object v0
.end method

.method public final getServiceAccountProjectId()Ljava/lang/String;
    .locals 1

    .line 641
    iget-object v0, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountProjectId:Ljava/lang/String;

    return-object v0
.end method

.method public final getServiceAccountScopes()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 662
    iget-object v0, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountScopes:Ljava/util/Collection;

    return-object v0
.end method

.method public final getServiceAccountUser()Ljava/lang/String;
    .locals 1

    .line 793
    iget-object v0, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountUser:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic setClientAuthentication(Lcom/google/api/client/http/HttpExecuteInterceptor;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setClientAuthentication(Lcom/google/api/client/http/HttpExecuteInterceptor;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setClientAuthentication(Lcom/google/api/client/http/HttpExecuteInterceptor;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "clientAuthentication"    # Lcom/google/api/client/http/HttpExecuteInterceptor;

    .line 837
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->setClientAuthentication(Lcom/google/api/client/http/HttpExecuteInterceptor;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method

.method public setClientSecrets(Lcom/google/api/client/googleapis/auth/oauth2/GoogleClientSecrets;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 4
    .param p1, "clientSecrets"    # Lcom/google/api/client/googleapis/auth/oauth2/GoogleClientSecrets;

    .line 611
    invoke-virtual {p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleClientSecrets;->getDetails()Lcom/google/api/client/googleapis/auth/oauth2/GoogleClientSecrets$Details;

    move-result-object v0

    .line 612
    .local v0, "details":Lcom/google/api/client/googleapis/auth/oauth2/GoogleClientSecrets$Details;
    new-instance v1, Lcom/google/api/client/auth/oauth2/ClientParametersAuthentication;

    .line 613
    invoke-virtual {v0}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleClientSecrets$Details;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleClientSecrets$Details;->getClientSecret()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/google/api/client/auth/oauth2/ClientParametersAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 612
    invoke-virtual {p0, v1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setClientAuthentication(Lcom/google/api/client/http/HttpExecuteInterceptor;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    .line 614
    return-object p0
.end method

.method public setClientSecrets(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "clientId"    # Ljava/lang/String;
    .param p2, "clientSecret"    # Ljava/lang/String;

    .line 598
    new-instance v0, Lcom/google/api/client/auth/oauth2/ClientParametersAuthentication;

    invoke-direct {v0, p1, p2}, Lcom/google/api/client/auth/oauth2/ClientParametersAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setClientAuthentication(Lcom/google/api/client/http/HttpExecuteInterceptor;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    .line 599
    return-object p0
.end method

.method public bridge synthetic setClock(Lcom/google/api/client/util/Clock;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setClock(Lcom/google/api/client/util/Clock;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setClock(Lcom/google/api/client/util/Clock;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "clock"    # Lcom/google/api/client/util/Clock;

    .line 586
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->setClock(Lcom/google/api/client/util/Clock;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method

.method public bridge synthetic setJsonFactory(Lcom/google/api/client/json/JsonFactory;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setJsonFactory(Lcom/google/api/client/json/JsonFactory;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setJsonFactory(Lcom/google/api/client/json/JsonFactory;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "jsonFactory"    # Lcom/google/api/client/json/JsonFactory;

    .line 578
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->setJsonFactory(Lcom/google/api/client/json/JsonFactory;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method

.method public bridge synthetic setRefreshListeners(Ljava/util/Collection;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setRefreshListeners(Ljava/util/Collection;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setRefreshListeners(Ljava/util/Collection;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/google/api/client/auth/oauth2/CredentialRefreshListener;",
            ">;)",
            "Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;"
        }
    .end annotation

    .line 822
    .local p1, "refreshListeners":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/api/client/auth/oauth2/CredentialRefreshListener;>;"
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->setRefreshListeners(Ljava/util/Collection;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method

.method public bridge synthetic setRequestInitializer(Lcom/google/api/client/http/HttpRequestInitializer;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setRequestInitializer(Lcom/google/api/client/http/HttpRequestInitializer;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setRequestInitializer(Lcom/google/api/client/http/HttpRequestInitializer;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "requestInitializer"    # Lcom/google/api/client/http/HttpRequestInitializer;

    .line 812
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->setRequestInitializer(Lcom/google/api/client/http/HttpRequestInitializer;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method

.method public setServiceAccountId(Ljava/lang/String;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 0
    .param p1, "serviceAccountId"    # Ljava/lang/String;

    .line 633
    iput-object p1, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountId:Ljava/lang/String;

    .line 634
    return-object p0
.end method

.method public setServiceAccountPrivateKey(Ljava/security/PrivateKey;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 0
    .param p1, "serviceAccountPrivateKey"    # Ljava/security/PrivateKey;

    .line 699
    iput-object p1, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountPrivateKey:Ljava/security/PrivateKey;

    .line 700
    return-object p0
.end method

.method public setServiceAccountPrivateKeyFromP12File(Ljava/io/File;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "p12File"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 742
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setServiceAccountPrivateKeyFromP12File(Ljava/io/InputStream;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    .line 743
    return-object p0
.end method

.method public setServiceAccountPrivateKeyFromP12File(Ljava/io/InputStream;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 3
    .param p1, "p12FileInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 759
    nop

    .line 760
    invoke-static {}, Lcom/google/api/client/util/SecurityUtils;->getPkcs12KeyStore()Ljava/security/KeyStore;

    move-result-object v0

    .line 759
    const-string v1, "notasecret"

    const-string v2, "privatekey"

    invoke-static {v0, p1, v1, v2, v1}, Lcom/google/api/client/util/SecurityUtils;->loadPrivateKeyFromKeyStore(Ljava/security/KeyStore;Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/security/PrivateKey;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountPrivateKey:Ljava/security/PrivateKey;

    .line 762
    return-object p0
.end method

.method public setServiceAccountPrivateKeyFromPemFile(Ljava/io/File;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 3
    .param p1, "pemFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 781
    new-instance v0, Ljava/io/FileReader;

    invoke-direct {v0, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    const-string v1, "PRIVATE KEY"

    invoke-static {v0, v1}, Lcom/google/api/client/util/PemReader;->readFirstSectionAndClose(Ljava/io/Reader;Ljava/lang/String;)Lcom/google/api/client/util/PemReader$Section;

    move-result-object v0

    .line 782
    invoke-virtual {v0}, Lcom/google/api/client/util/PemReader$Section;->getBase64DecodedBytes()[B

    move-result-object v0

    .line 783
    .local v0, "bytes":[B
    nop

    .line 784
    invoke-static {}, Lcom/google/api/client/util/SecurityUtils;->getRsaKeyFactory()Ljava/security/KeyFactory;

    move-result-object v1

    new-instance v2, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v2, v0}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v1, v2}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v1

    iput-object v1, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountPrivateKey:Ljava/security/PrivateKey;

    .line 785
    return-object p0
.end method

.method public setServiceAccountPrivateKeyId(Ljava/lang/String;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 0
    .param p1, "serviceAccountPrivateKeyId"    # Ljava/lang/String;

    .line 725
    iput-object p1, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountPrivateKeyId:Ljava/lang/String;

    .line 726
    return-object p0
.end method

.method public setServiceAccountProjectId(Ljava/lang/String;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 0
    .param p1, "serviceAccountProjectId"    # Ljava/lang/String;

    .line 653
    iput-object p1, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountProjectId:Ljava/lang/String;

    .line 654
    return-object p0
.end method

.method public setServiceAccountScopes(Ljava/util/Collection;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;"
        }
    .end annotation

    .line 679
    .local p1, "serviceAccountScopes":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountScopes:Ljava/util/Collection;

    .line 680
    return-object p0
.end method

.method public setServiceAccountUser(Ljava/lang/String;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 0
    .param p1, "serviceAccountUser"    # Ljava/lang/String;

    .line 806
    iput-object p1, p0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->serviceAccountUser:Ljava/lang/String;

    .line 807
    return-object p0
.end method

.method public bridge synthetic setTokenServerEncodedUrl(Ljava/lang/String;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setTokenServerEncodedUrl(Ljava/lang/String;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTokenServerEncodedUrl(Ljava/lang/String;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "tokenServerEncodedUrl"    # Ljava/lang/String;

    .line 832
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->setTokenServerEncodedUrl(Ljava/lang/String;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method

.method public bridge synthetic setTokenServerUrl(Lcom/google/api/client/http/GenericUrl;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setTokenServerUrl(Lcom/google/api/client/http/GenericUrl;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTokenServerUrl(Lcom/google/api/client/http/GenericUrl;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "tokenServerUrl"    # Lcom/google/api/client/http/GenericUrl;

    .line 827
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->setTokenServerUrl(Lcom/google/api/client/http/GenericUrl;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method

.method public bridge synthetic setTransport(Lcom/google/api/client/http/HttpTransport;)Lcom/google/api/client/auth/oauth2/Credential$Builder;
    .locals 0

    .line 536
    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;->setTransport(Lcom/google/api/client/http/HttpTransport;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTransport(Lcom/google/api/client/http/HttpTransport;)Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;
    .locals 1
    .param p1, "transport"    # Lcom/google/api/client/http/HttpTransport;

    .line 573
    invoke-super {p0, p1}, Lcom/google/api/client/auth/oauth2/Credential$Builder;->setTransport(Lcom/google/api/client/http/HttpTransport;)Lcom/google/api/client/auth/oauth2/Credential$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/googleapis/auth/oauth2/GoogleCredential$Builder;

    return-object v0
.end method
