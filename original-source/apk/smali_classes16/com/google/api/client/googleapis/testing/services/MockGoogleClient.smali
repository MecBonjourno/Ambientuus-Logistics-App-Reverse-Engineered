.class public Lcom/google/api/client/googleapis/testing/services/MockGoogleClient;
.super Lcom/google/api/client/googleapis/services/AbstractGoogleClient;
.source "MockGoogleClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/googleapis/testing/services/MockGoogleClient$Builder;
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/google/api/client/googleapis/testing/services/MockGoogleClient$Builder;)V
    .locals 0
    .param p1, "builder"    # Lcom/google/api/client/googleapis/testing/services/MockGoogleClient$Builder;

    .line 52
    invoke-direct {p0, p1}, Lcom/google/api/client/googleapis/services/AbstractGoogleClient;-><init>(Lcom/google/api/client/googleapis/services/AbstractGoogleClient$Builder;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/google/api/client/http/HttpTransport;Ljava/lang/String;Ljava/lang/String;Lcom/google/api/client/util/ObjectParser;Lcom/google/api/client/http/HttpRequestInitializer;)V
    .locals 6
    .param p1, "transport"    # Lcom/google/api/client/http/HttpTransport;
    .param p2, "rootUrl"    # Ljava/lang/String;
    .param p3, "servicePath"    # Ljava/lang/String;
    .param p4, "objectParser"    # Lcom/google/api/client/util/ObjectParser;
    .param p5, "httpRequestInitializer"    # Lcom/google/api/client/http/HttpRequestInitializer;

    .line 43
    new-instance v0, Lcom/google/api/client/googleapis/testing/services/MockGoogleClient$Builder;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .end local p1    # "transport":Lcom/google/api/client/http/HttpTransport;
    .end local p2    # "rootUrl":Ljava/lang/String;
    .end local p3    # "servicePath":Ljava/lang/String;
    .end local p4    # "objectParser":Lcom/google/api/client/util/ObjectParser;
    .end local p5    # "httpRequestInitializer":Lcom/google/api/client/http/HttpRequestInitializer;
    .local v1, "transport":Lcom/google/api/client/http/HttpTransport;
    .local v2, "rootUrl":Ljava/lang/String;
    .local v3, "servicePath":Ljava/lang/String;
    .local v4, "objectParser":Lcom/google/api/client/util/ObjectParser;
    .local v5, "httpRequestInitializer":Lcom/google/api/client/http/HttpRequestInitializer;
    invoke-direct/range {v0 .. v5}, Lcom/google/api/client/googleapis/testing/services/MockGoogleClient$Builder;-><init>(Lcom/google/api/client/http/HttpTransport;Ljava/lang/String;Ljava/lang/String;Lcom/google/api/client/util/ObjectParser;Lcom/google/api/client/http/HttpRequestInitializer;)V

    invoke-direct {p0, v0}, Lcom/google/api/client/googleapis/testing/services/MockGoogleClient;-><init>(Lcom/google/api/client/googleapis/testing/services/MockGoogleClient$Builder;)V

    .line 44
    return-void
.end method
