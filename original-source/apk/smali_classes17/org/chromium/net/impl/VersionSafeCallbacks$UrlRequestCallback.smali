.class public final Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;
.super Lorg/chromium/net/UrlRequest$Callback;
.source "VersionSafeCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/impl/VersionSafeCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UrlRequestCallback"
.end annotation


# instance fields
.field private final mWrappedCallback:Lorg/chromium/net/UrlRequest$Callback;


# direct methods
.method public constructor <init>(Lorg/chromium/net/UrlRequest$Callback;)V
    .locals 0
    .param p1, "callback"    # Lorg/chromium/net/UrlRequest$Callback;

    .line 39
    invoke-direct {p0}, Lorg/chromium/net/UrlRequest$Callback;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->mWrappedCallback:Lorg/chromium/net/UrlRequest$Callback;

    .line 41
    return-void
.end method


# virtual methods
.method public onCanceled(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 72
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->mWrappedCallback:Lorg/chromium/net/UrlRequest$Callback;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/UrlRequest$Callback;->onCanceled(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V

    .line 73
    return-void
.end method

.method public onFailed(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "error"    # Lorg/chromium/net/CronetException;

    .line 67
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->mWrappedCallback:Lorg/chromium/net/UrlRequest$Callback;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/UrlRequest$Callback;->onFailed(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V

    .line 68
    return-void
.end method

.method public onReadCompleted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->mWrappedCallback:Lorg/chromium/net/UrlRequest$Callback;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/UrlRequest$Callback;->onReadCompleted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V

    .line 58
    return-void
.end method

.method public onRedirectReceived(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "newLocationUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->mWrappedCallback:Lorg/chromium/net/UrlRequest$Callback;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/UrlRequest$Callback;->onRedirectReceived(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public onResponseStarted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->mWrappedCallback:Lorg/chromium/net/UrlRequest$Callback;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/UrlRequest$Callback;->onResponseStarted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V

    .line 52
    return-void
.end method

.method public onSucceeded(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 62
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->mWrappedCallback:Lorg/chromium/net/UrlRequest$Callback;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/UrlRequest$Callback;->onSucceeded(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V

    .line 63
    return-void
.end method
