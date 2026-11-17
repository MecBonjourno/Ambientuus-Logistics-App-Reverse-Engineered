.class public abstract Lorg/chromium/net/apihelpers/JsonCronetCallback;
.super Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;
.source "JsonCronetCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# static fields
.field private static final STRING_CALLBACK:Lorg/chromium/net/apihelpers/StringCronetCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    new-instance v0, Lorg/chromium/net/apihelpers/JsonCronetCallback$1;

    invoke-direct {v0}, Lorg/chromium/net/apihelpers/JsonCronetCallback$1;-><init>()V

    sput-object v0, Lorg/chromium/net/apihelpers/JsonCronetCallback;->STRING_CALLBACK:Lorg/chromium/net/apihelpers/StringCronetCallback;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;
    .locals 0

    .line 16
    invoke-virtual {p0, p1}, Lorg/chromium/net/apihelpers/JsonCronetCallback;->addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/JsonCronetCallback;

    move-result-object p1

    return-object p1
.end method

.method public addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/JsonCronetCallback;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<",
            "-",
            "Lorg/json/JSONObject;",
            ">;)",
            "Lorg/chromium/net/apihelpers/JsonCronetCallback;"
        }
    .end annotation

    .line 27
    .local p1, "listener":Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;, "Lorg/chromium/net/apihelpers/CronetRequestCompletionListener<-Lorg/json/JSONObject;>;"
    invoke-super {p0, p1}, Lorg/chromium/net/apihelpers/InMemoryTransformCronetCallback;->addCompletionListener(Lorg/chromium/net/apihelpers/CronetRequestCompletionListener;)Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;

    .line 28
    return-object p0
.end method

.method protected bridge synthetic transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Ljava/lang/Object;
    .locals 0

    .line 16
    invoke-virtual {p0, p1, p2}, Lorg/chromium/net/apihelpers/JsonCronetCallback;->transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1
.end method

.method protected transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Lorg/json/JSONObject;
    .locals 4
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p2, "bodyBytes"    # [B

    .line 33
    sget-object v0, Lorg/chromium/net/apihelpers/JsonCronetCallback;->STRING_CALLBACK:Lorg/chromium/net/apihelpers/StringCronetCallback;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/apihelpers/StringCronetCallback;->transformBodyBytes(Lorg/chromium/net/UrlResponseInfo;[B)Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "bodyString":Ljava/lang/String;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 36
    :catch_0
    move-exception v1

    .line 38
    .local v1, "e":Lorg/json/JSONException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Cannot parse the string as JSON!"

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
