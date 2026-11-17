.class public Lorg/chromium/net/urlconnection/CronetURLStreamHandlerFactory;
.super Ljava/lang/Object;
.source "CronetURLStreamHandlerFactory.java"

# interfaces
.implements Ljava/net/URLStreamHandlerFactory;


# instance fields
.field private final mCronetEngine:Lorg/chromium/net/ExperimentalCronetEngine;


# direct methods
.method public constructor <init>(Lorg/chromium/net/ExperimentalCronetEngine;)V
    .locals 2
    .param p1, "cronetEngine"    # Lorg/chromium/net/ExperimentalCronetEngine;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    if-eqz p1, :cond_0

    .line 55
    iput-object p1, p0, Lorg/chromium/net/urlconnection/CronetURLStreamHandlerFactory;->mCronetEngine:Lorg/chromium/net/ExperimentalCronetEngine;

    .line 56
    return-void

    .line 53
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "CronetEngine is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public createURLStreamHandler(Ljava/lang/String;)Ljava/net/URLStreamHandler;
    .locals 2
    .param p1, "protocol"    # Ljava/lang/String;

    .line 64
    const-string v0, "http"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "https"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 67
    :cond_0
    const/4 v0, 0x0

    return-object v0

    .line 65
    :cond_1
    :goto_0
    new-instance v0, Lorg/chromium/net/urlconnection/CronetHttpURLStreamHandler;

    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetURLStreamHandlerFactory;->mCronetEngine:Lorg/chromium/net/ExperimentalCronetEngine;

    invoke-direct {v0, v1}, Lorg/chromium/net/urlconnection/CronetHttpURLStreamHandler;-><init>(Lorg/chromium/net/ExperimentalCronetEngine;)V

    return-object v0
.end method
