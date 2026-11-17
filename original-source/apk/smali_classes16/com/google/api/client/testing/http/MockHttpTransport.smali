.class public Lcom/google/api/client/testing/http/MockHttpTransport;
.super Lcom/google/api/client/http/HttpTransport;
.source "MockHttpTransport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/testing/http/MockHttpTransport$Builder;
    }
.end annotation


# instance fields
.field private lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

.field private lowLevelHttpResponse:Lcom/google/api/client/testing/http/MockLowLevelHttpResponse;

.field private supportedMethods:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Lcom/google/api/client/http/HttpTransport;-><init>()V

    .line 60
    return-void
.end method

.method protected constructor <init>(Lcom/google/api/client/testing/http/MockHttpTransport$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/google/api/client/testing/http/MockHttpTransport$Builder;

    .line 67
    invoke-direct {p0}, Lcom/google/api/client/http/HttpTransport;-><init>()V

    .line 68
    iget-object v0, p1, Lcom/google/api/client/testing/http/MockHttpTransport$Builder;->supportedMethods:Ljava/util/Set;

    iput-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->supportedMethods:Ljava/util/Set;

    .line 69
    iget-object v0, p1, Lcom/google/api/client/testing/http/MockHttpTransport$Builder;->lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    iput-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    .line 70
    iget-object v0, p1, Lcom/google/api/client/testing/http/MockHttpTransport$Builder;->lowLevelHttpResponse:Lcom/google/api/client/testing/http/MockLowLevelHttpResponse;

    iput-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpResponse:Lcom/google/api/client/testing/http/MockLowLevelHttpResponse;

    .line 71
    return-void
.end method

.method public static builder()Lcom/google/api/client/testing/http/MockHttpTransport$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 120
    new-instance v0, Lcom/google/api/client/testing/http/MockHttpTransport$Builder;

    invoke-direct {v0}, Lcom/google/api/client/testing/http/MockHttpTransport$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public buildRequest(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/LowLevelHttpRequest;
    .locals 3
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    invoke-virtual {p0, p1}, Lcom/google/api/client/testing/http/MockHttpTransport;->supportsMethod(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "HTTP method %s not supported"

    invoke-static {v0, v2, v1}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 81
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    return-object v0

    .line 84
    :cond_0
    new-instance v0, Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    invoke-direct {v0, p2}, Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    .line 85
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpResponse:Lcom/google/api/client/testing/http/MockLowLevelHttpResponse;

    if-eqz v0, :cond_1

    .line 86
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    iget-object v1, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpResponse:Lcom/google/api/client/testing/http/MockLowLevelHttpResponse;

    invoke-virtual {v0, v1}, Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;->setResponse(Lcom/google/api/client/testing/http/MockLowLevelHttpResponse;)Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    .line 88
    :cond_1
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    return-object v0
.end method

.method public final getLowLevelHttpRequest()Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->lowLevelHttpRequest:Lcom/google/api/client/testing/http/MockLowLevelHttpRequest;

    return-object v0
.end method

.method public final getSupportedMethods()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->supportedMethods:Ljava/util/Set;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->supportedMethods:Ljava/util/Set;

    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public supportsMethod(Ljava/lang/String;)Z
    .locals 1
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->supportedMethods:Ljava/util/Set;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/api/client/testing/http/MockHttpTransport;->supportedMethods:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
