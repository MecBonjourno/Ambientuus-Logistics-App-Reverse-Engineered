.class Lorg/chromium/net/urlconnection/CronetHttpURLStreamHandler;
.super Ljava/net/URLStreamHandler;
.source "CronetHttpURLStreamHandler.java"


# instance fields
.field private final mCronetEngine:Lorg/chromium/net/ExperimentalCronetEngine;


# direct methods
.method public constructor <init>(Lorg/chromium/net/ExperimentalCronetEngine;)V
    .locals 0
    .param p1, "cronetEngine"    # Lorg/chromium/net/ExperimentalCronetEngine;

    .line 28
    invoke-direct {p0}, Ljava/net/URLStreamHandler;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLStreamHandler;->mCronetEngine:Lorg/chromium/net/ExperimentalCronetEngine;

    .line 30
    return-void
.end method


# virtual methods
.method public openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLStreamHandler;->mCronetEngine:Lorg/chromium/net/ExperimentalCronetEngine;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ExperimentalCronetEngine;->openConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    return-object v0
.end method

.method public openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "proxy"    # Ljava/net/Proxy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLStreamHandler;->mCronetEngine:Lorg/chromium/net/ExperimentalCronetEngine;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/ExperimentalCronetEngine;->openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    return-object v0
.end method
