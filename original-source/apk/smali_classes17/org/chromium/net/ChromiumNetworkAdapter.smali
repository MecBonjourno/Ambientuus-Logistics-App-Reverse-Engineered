.class public final Lorg/chromium/net/ChromiumNetworkAdapter;
.super Ljava/lang/Object;
.source "ChromiumNetworkAdapter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static openConnection(Ljava/net/URL;Ljava/net/Proxy;Lorg/chromium/net/NetworkTrafficAnnotationTag;)Ljava/net/URLConnection;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "proxy"    # Ljava/net/Proxy;
    .param p2, "trafficAnnotation"    # Lorg/chromium/net/NetworkTrafficAnnotationTag;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    invoke-virtual {p0, p1}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static openConnection(Ljava/net/URL;Lorg/chromium/net/NetworkTrafficAnnotationTag;)Ljava/net/URLConnection;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "trafficAnnotation"    # Lorg/chromium/net/NetworkTrafficAnnotationTag;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    return-object v0
.end method

.method public static openStream(Ljava/net/URL;Lorg/chromium/net/NetworkTrafficAnnotationTag;)Ljava/io/InputStream;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "trafficAnnotation"    # Lorg/chromium/net/NetworkTrafficAnnotationTag;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    invoke-virtual {p0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method
