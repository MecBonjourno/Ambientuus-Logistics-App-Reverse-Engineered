.class Lorg/chromium/net/apihelpers/JsonCronetCallback$1;
.super Lorg/chromium/net/apihelpers/StringCronetCallback;
.source "JsonCronetCallback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/apihelpers/JsonCronetCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/StringCronetCallback;-><init>()V

    return-void
.end method


# virtual methods
.method protected shouldFollowRedirect(Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)Z
    .locals 1
    .param p1, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p2, "newLocationUrl"    # Ljava/lang/String;

    .line 20
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
