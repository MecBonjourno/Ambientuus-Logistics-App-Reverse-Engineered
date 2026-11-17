.class public abstract Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
.super Ljava/lang/Object;
.source "AbstractGoogleClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/client/googleapis/services/AbstractGoogleClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Builder"
.end annotation


# instance fields
.field applicationName:Ljava/lang/String;

.field batchPath:Ljava/lang/String;

.field googleClientRequestInitializer:Lcom/google/api/client/googleapis/services/GoogleClientRequestInitializer;

.field httpRequestInitializer:Lcom/google/api/client/http/HttpRequestInitializer;

.field final objectParser:Lcom/google/api/client/util/ObjectParser;

.field rootUrl:Ljava/lang/String;

.field servicePath:Ljava/lang/String;

.field suppressPatternChecks:Z

.field suppressRequiredParameterChecks:Z

.field final transport:Lcom/google/api/client/http/HttpTransport;


# direct methods
.method protected constructor <init>(Lcom/google/api/client/http/HttpTransport;Ljava/lang/String;Ljava/lang/String;Lcom/google/api/client/util/ObjectParser;Lcom/google/api/client/http/HttpRequestInitializer;)V
    .locals 1
    .param p1, "transport"    # Lcom/google/api/client/http/HttpTransport;
    .param p2, "rootUrl"    # Ljava/lang/String;
    .param p3, "servicePath"    # Ljava/lang/String;
    .param p4, "objectParser"    # Lcom/google/api/client/util/ObjectParser;
    .param p5, "httpRequestInitializer"    # Lcom/google/api/client/http/HttpRequestInitializer;

    .line 344
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 345
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/http/HttpTransport;

    iput-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->transport:Lcom/google/api/client/http/HttpTransport;

    .line 346
    iput-object p4, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->objectParser:Lcom/google/api/client/util/ObjectParser;

    .line 347
    invoke-virtual {p0, p2}, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->setRootUrl(Ljava/lang/String;)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;

    .line 348
    invoke-virtual {p0, p3}, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->setServicePath(Ljava/lang/String;)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;

    .line 349
    iput-object p5, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->httpRequestInitializer:Lcom/google/api/client/http/HttpRequestInitializer;

    .line 350
    return-void
.end method


# virtual methods
.method public abstract build()Lcom/google/api/client/googleapis/services/AbstractGoogleClient;
.end method

.method public final getApplicationName()Ljava/lang/String;
    .locals 1

    .line 487
    iget-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->applicationName:Ljava/lang/String;

    return-object v0
.end method

.method public final getGoogleClientRequestInitializer()Lcom/google/api/client/googleapis/services/GoogleClientRequestInitializer;
    .locals 1

    .line 447
    iget-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->googleClientRequestInitializer:Lcom/google/api/client/googleapis/services/GoogleClientRequestInitializer;

    return-object v0
.end method

.method public final getHttpRequestInitializer()Lcom/google/api/client/http/HttpRequestInitializer;
    .locals 1

    .line 466
    iget-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->httpRequestInitializer:Lcom/google/api/client/http/HttpRequestInitializer;

    return-object v0
.end method

.method public getObjectParser()Lcom/google/api/client/util/ObjectParser;
    .locals 1

    .line 369
    iget-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->objectParser:Lcom/google/api/client/util/ObjectParser;

    return-object v0
.end method

.method public final getRootUrl()Ljava/lang/String;
    .locals 1

    .line 381
    iget-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->rootUrl:Ljava/lang/String;

    return-object v0
.end method

.method public final getServicePath()Ljava/lang/String;
    .locals 1

    .line 410
    iget-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->servicePath:Ljava/lang/String;

    return-object v0
.end method

.method public final getSuppressPatternChecks()Z
    .locals 1

    .line 506
    iget-boolean v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->suppressPatternChecks:Z

    return v0
.end method

.method public final getSuppressRequiredParameterChecks()Z
    .locals 1

    .line 532
    iget-boolean v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->suppressRequiredParameterChecks:Z

    return v0
.end method

.method public final getTransport()Lcom/google/api/client/http/HttpTransport;
    .locals 1

    .line 357
    iget-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->transport:Lcom/google/api/client/http/HttpTransport;

    return-object v0
.end method

.method public setApplicationName(Ljava/lang/String;)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 0
    .param p1, "applicationName"    # Ljava/lang/String;

    .line 500
    iput-object p1, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->applicationName:Ljava/lang/String;

    .line 501
    return-object p0
.end method

.method public setBatchPath(Ljava/lang/String;)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 0
    .param p1, "batchPath"    # Ljava/lang/String;

    .line 441
    iput-object p1, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->batchPath:Ljava/lang/String;

    .line 442
    return-object p0
.end method

.method public setGoogleClientRequestInitializer(Lcom/google/api/client/googleapis/services/GoogleClientRequestInitializer;)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 0
    .param p1, "googleClientRequestInitializer"    # Lcom/google/api/client/googleapis/services/GoogleClientRequestInitializer;

    .line 460
    iput-object p1, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->googleClientRequestInitializer:Lcom/google/api/client/googleapis/services/GoogleClientRequestInitializer;

    .line 461
    return-object p0
.end method

.method public setHttpRequestInitializer(Lcom/google/api/client/http/HttpRequestInitializer;)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 0
    .param p1, "httpRequestInitializer"    # Lcom/google/api/client/http/HttpRequestInitializer;

    .line 478
    iput-object p1, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->httpRequestInitializer:Lcom/google/api/client/http/HttpRequestInitializer;

    .line 479
    return-object p0
.end method

.method public setRootUrl(Ljava/lang/String;)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 1
    .param p1, "rootUrl"    # Ljava/lang/String;

    .line 397
    invoke-static {p1}, Lcom/google/api/client/googleapis/services/AbstractGoogleClient;->normalizeRootUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->rootUrl:Ljava/lang/String;

    .line 398
    return-object p0
.end method

.method public setServicePath(Ljava/lang/String;)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 1
    .param p1, "servicePath"    # Ljava/lang/String;

    .line 433
    invoke-static {p1}, Lcom/google/api/client/googleapis/services/AbstractGoogleClient;->normalizeServicePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->servicePath:Ljava/lang/String;

    .line 434
    return-object p0
.end method

.method public setSuppressAllChecks(Z)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 2
    .param p1, "suppressAllChecks"    # Z

    .line 565
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->setSuppressPatternChecks(Z)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->setSuppressRequiredParameterChecks(Z)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setSuppressPatternChecks(Z)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 0
    .param p1, "suppressPatternChecks"    # Z

    .line 522
    iput-boolean p1, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->suppressPatternChecks:Z

    .line 523
    return-object p0
.end method

.method public setSuppressRequiredParameterChecks(Z)Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;
    .locals 0
    .param p1, "suppressRequiredParameterChecks"    # Z

    .line 550
    iput-boolean p1, p0, Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;->suppressRequiredParameterChecks:Z

    .line 551
    return-object p0
.end method
