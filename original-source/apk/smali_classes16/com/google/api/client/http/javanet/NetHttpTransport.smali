.class public final Lcom/google/api/client/http/javanet/NetHttpTransport;
.super Lcom/google/api/client/http/HttpTransport;
.source "NetHttpTransport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/http/javanet/NetHttpTransport$Builder;
    }
.end annotation


# static fields
.field private static final SHOULD_USE_PROXY_FLAG:Ljava/lang/String; = "com.google.api.client.should_use_proxy"

.field private static final SUPPORTED_METHODS:[Ljava/lang/String;


# instance fields
.field private final connectionFactory:Lcom/google/api/client/http/javanet/ConnectionFactory;

.field private final hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private final sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 73
    const-string v5, "PUT"

    const-string v6, "TRACE"

    const-string v0, "DELETE"

    const-string v1, "GET"

    const-string v2, "HEAD"

    const-string v3, "OPTIONS"

    const-string v4, "POST"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/http/javanet/NetHttpTransport;->SUPPORTED_METHODS:[Ljava/lang/String;

    .line 81
    sget-object v0, Lcom/google/api/client/http/javanet/NetHttpTransport;->SUPPORTED_METHODS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 82
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 103
    const/4 v0, 0x0

    move-object v1, v0

    check-cast v1, Lcom/google/api/client/http/javanet/ConnectionFactory;

    invoke-direct {p0, v0, v0, v0}, Lcom/google/api/client/http/javanet/NetHttpTransport;-><init>(Lcom/google/api/client/http/javanet/ConnectionFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;)V

    .line 104
    return-void
.end method

.method constructor <init>(Lcom/google/api/client/http/javanet/ConnectionFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;)V
    .locals 1
    .param p1, "connectionFactory"    # Lcom/google/api/client/http/javanet/ConnectionFactory;
    .param p2, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p3, "hostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;

    .line 126
    invoke-direct {p0}, Lcom/google/api/client/http/HttpTransport;-><init>()V

    .line 127
    nop

    .line 128
    invoke-direct {p0, p1}, Lcom/google/api/client/http/javanet/NetHttpTransport;->getConnectionFactory(Lcom/google/api/client/http/javanet/ConnectionFactory;)Lcom/google/api/client/http/javanet/ConnectionFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/javanet/NetHttpTransport;->connectionFactory:Lcom/google/api/client/http/javanet/ConnectionFactory;

    .line 129
    iput-object p2, p0, Lcom/google/api/client/http/javanet/NetHttpTransport;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 130
    iput-object p3, p0, Lcom/google/api/client/http/javanet/NetHttpTransport;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 131
    return-void
.end method

.method constructor <init>(Ljava/net/Proxy;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;)V
    .locals 1
    .param p1, "proxy"    # Ljava/net/Proxy;
    .param p2, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p3, "hostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;

    .line 115
    new-instance v0, Lcom/google/api/client/http/javanet/DefaultConnectionFactory;

    invoke-direct {v0, p1}, Lcom/google/api/client/http/javanet/DefaultConnectionFactory;-><init>(Ljava/net/Proxy;)V

    invoke-direct {p0, v0, p2, p3}, Lcom/google/api/client/http/javanet/NetHttpTransport;-><init>(Lcom/google/api/client/http/javanet/ConnectionFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;)V

    .line 116
    return-void
.end method

.method static synthetic access$000()Ljava/net/Proxy;
    .locals 1

    .line 61
    invoke-static {}, Lcom/google/api/client/http/javanet/NetHttpTransport;->defaultProxy()Ljava/net/Proxy;

    move-result-object v0

    return-object v0
.end method

.method private static defaultProxy()Ljava/net/Proxy;
    .locals 5

    .line 63
    new-instance v0, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    new-instance v2, Ljava/net/InetSocketAddress;

    .line 65
    const-string v3, "https.proxyHost"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 66
    const-string v4, "https.proxyPort"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 63
    return-object v0
.end method

.method private getConnectionFactory(Lcom/google/api/client/http/javanet/ConnectionFactory;)Lcom/google/api/client/http/javanet/ConnectionFactory;
    .locals 2
    .param p1, "connectionFactory"    # Lcom/google/api/client/http/javanet/ConnectionFactory;

    .line 134
    if-nez p1, :cond_1

    .line 135
    const-string v0, "com.google.api.client.should_use_proxy"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 136
    new-instance v0, Lcom/google/api/client/http/javanet/DefaultConnectionFactory;

    invoke-static {}, Lcom/google/api/client/http/javanet/NetHttpTransport;->defaultProxy()Ljava/net/Proxy;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/api/client/http/javanet/DefaultConnectionFactory;-><init>(Ljava/net/Proxy;)V

    return-object v0

    .line 138
    :cond_0
    new-instance v0, Lcom/google/api/client/http/javanet/DefaultConnectionFactory;

    invoke-direct {v0}, Lcom/google/api/client/http/javanet/DefaultConnectionFactory;-><init>()V

    return-object v0

    .line 140
    :cond_1
    return-object p1
.end method


# virtual methods
.method protected bridge synthetic buildRequest(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/LowLevelHttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    invoke-virtual {p0, p1, p2}, Lcom/google/api/client/http/javanet/NetHttpTransport;->buildRequest(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/javanet/NetHttpRequest;

    move-result-object p1

    return-object p1
.end method

.method protected buildRequest(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/javanet/NetHttpRequest;
    .locals 4
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    invoke-virtual {p0, p1}, Lcom/google/api/client/http/javanet/NetHttpTransport;->supportsMethod(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "HTTP method %s not supported"

    invoke-static {v0, v2, v1}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 152
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 153
    .local v0, "connUrl":Ljava/net/URL;
    iget-object v1, p0, Lcom/google/api/client/http/javanet/NetHttpTransport;->connectionFactory:Lcom/google/api/client/http/javanet/ConnectionFactory;

    invoke-interface {v1, v0}, Lcom/google/api/client/http/javanet/ConnectionFactory;->openConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v1

    .line 154
    .local v1, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {v1, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 156
    instance-of v2, v1, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_1

    .line 157
    move-object v2, v1

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    .line 158
    .local v2, "secureConnection":Ljavax/net/ssl/HttpsURLConnection;
    iget-object v3, p0, Lcom/google/api/client/http/javanet/NetHttpTransport;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v3, :cond_0

    .line 159
    iget-object v3, p0, Lcom/google/api/client/http/javanet/NetHttpTransport;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 161
    :cond_0
    iget-object v3, p0, Lcom/google/api/client/http/javanet/NetHttpTransport;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v3, :cond_1

    .line 162
    iget-object v3, p0, Lcom/google/api/client/http/javanet/NetHttpTransport;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 165
    .end local v2    # "secureConnection":Ljavax/net/ssl/HttpsURLConnection;
    :cond_1
    new-instance v2, Lcom/google/api/client/http/javanet/NetHttpRequest;

    invoke-direct {v2, v1}, Lcom/google/api/client/http/javanet/NetHttpRequest;-><init>(Ljava/net/HttpURLConnection;)V

    return-object v2
.end method

.method public supportsMethod(Ljava/lang/String;)Z
    .locals 1
    .param p1, "method"    # Ljava/lang/String;

    .line 145
    sget-object v0, Lcom/google/api/client/http/javanet/NetHttpTransport;->SUPPORTED_METHODS:[Ljava/lang/String;

    invoke-static {v0, p1}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
