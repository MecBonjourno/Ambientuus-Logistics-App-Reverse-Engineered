.class public abstract Lorg/chromium/net/apihelpers/StringCronetCallback;
.super Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;
.source "StringCronetCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final CONTENT_TYPE_HEADER_NAME:Ljava/lang/String; = "Content-Type"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;-><init>()V

    return-void
.end method

.method private getCharsetFromHeaders(Lorg/chromium/net/UrlResponseInfo;)Ljava/nio/charset/Charset;
    .locals 10
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 37
    invoke-virtual {p1}, Lorg/chromium/net/UrlResponseInfo;->getAllHeaders()Ljava/util/Map;

    move-result-object v0

    const-string v1, "Content-Type"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 39
    .local v0, "contentTypeHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 41
    .local v1, "charset":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 42
    .local v3, "header":Ljava/lang/String;
    new-instance v4, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;

    invoke-direct {v4, v3}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;-><init>(Ljava/lang/String;)V

    .line 44
    .local v4, "parser":Lorg/chromium/net/apihelpers/ContentTypeParametersParser;
    :goto_1
    invoke-virtual {v4}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->hasMore()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 47
    :try_start_0
    invoke-virtual {v4}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->getNextParameter()Ljava/util/Map$Entry;

    move-result-object v5
    :try_end_0
    .catch Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .local v5, "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    nop

    .line 52
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 53
    .local v6, "parameterName":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 55
    .local v7, "parameterValue":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v7, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_2

    .line 56
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Multiple charsets provided: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " and "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 59
    :cond_1
    :goto_2
    move-object v1, v7

    .line 60
    .end local v5    # "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "parameterName":Ljava/lang/String;
    .end local v7    # "parameterValue":Ljava/lang/String;
    goto :goto_1

    .line 48
    :catch_0
    move-exception v5

    .line 50
    .local v5, "e":Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
    nop

    .line 61
    .end local v3    # "header":Ljava/lang/String;
    .end local v4    # "parser":Lorg/chromium/net/apihelpers/ContentTypeParametersParser;
    .end local v5    # "e":Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
    :cond_2
    goto :goto_0

    .line 63
    :cond_3
    if-eqz v1, :cond_4

    .line 64
    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    return-object v2

    .line 67
    :cond_4
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public bridge synthetic addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;
    .locals 0

    .line 19
    invoke-virtual {p0, p1}, Lorg/chromium/net/apihelpers/StringCronetCallback;->addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/StringCronetCallback;

    move-result-object p1

    return-object p1
.end method

.method public addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/StringCronetCallback;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<",
            "-",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/chromium/net/apihelpers/StringCronetCallback;"
        }
    .end annotation

    .line 27
    .local p1, "listener":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-Ljava/lang/String;>;"
    invoke-super {p0, p1}, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;

    .line 28
    return-object p0
.end method

.method protected bridge synthetic transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/apihelpers/StringCronetCallback;->transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Ljava/lang/String;
    .locals 2
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p2, "bodyBytes"    # [B

    .line 33
    new-instance v0, Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/chromium/net/apihelpers/StringCronetCallback;->getCharsetFromHeaders(Lorg/chromium/net/UrlResponseInfo;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method
