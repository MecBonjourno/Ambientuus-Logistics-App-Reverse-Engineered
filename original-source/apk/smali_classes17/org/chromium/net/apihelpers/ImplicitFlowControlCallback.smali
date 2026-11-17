.class public abstract Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;
.super Lorg/chromium/net/UrlRequest$Callback;
.source "ImplicitFlowControlCallback.java"


# static fields
.field private static final BYTE_BUFFER_CAPACITY:I = 0x8000


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lorg/chromium/net/UrlRequest$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract onBodyChunkRead(Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public final onCanceled(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 0
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 128
    invoke-virtual {p0, p2}, Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;->onCanceled(Lorg/chromium/net/UrlResponseInfo;)V

    .line 129
    return-void
.end method

.method protected abstract onCanceled(Lorg/chromium/net/UrlResponseInfo;)V
.end method

.method public final onFailed(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V
    .locals 0
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "error"    # Lorg/chromium/net/CronetException;

    .line 123
    invoke-virtual {p0, p2, p3}, Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;->onFailed(Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V

    .line 124
    return-void
.end method

.method protected abstract onFailed(Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V
.end method

.method public final onReadCompleted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 110
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 111
    invoke-virtual {p0, p2, p3}, Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;->onBodyChunkRead(Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V

    .line 112
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 113
    invoke-virtual {p1, p3}, Lorg/chromium/net/UrlRequest;->read(Ljava/nio/ByteBuffer;)V

    .line 114
    return-void
.end method

.method public final onRedirectReceived(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "newLocationUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 100
    invoke-virtual {p0, p2, p3}, Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;->shouldFollowRedirect(Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    invoke-virtual {p1}, Lorg/chromium/net/UrlRequest;->followRedirect()V

    goto :goto_0

    .line 103
    :cond_0
    invoke-virtual {p1}, Lorg/chromium/net/UrlRequest;->cancel()V

    .line 105
    :goto_0
    return-void
.end method

.method public final onResponseStarted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 93
    invoke-virtual {p0, p2}, Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;->onResponseStarted(Lorg/chromium/net/UrlResponseInfo;)V

    .line 94
    const v0, 0x8000

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/chromium/net/UrlRequest;->read(Ljava/nio/ByteBuffer;)V

    .line 95
    return-void
.end method

.method protected abstract onResponseStarted(Lorg/chromium/net/UrlResponseInfo;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public final onSucceeded(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 0
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 118
    invoke-virtual {p0, p2}, Lorg/chromium/net/apihelpers/ImplicitFlowControlCallback;->onSucceeded(Lorg/chromium/net/UrlResponseInfo;)V

    .line 119
    return-void
.end method

.method protected abstract onSucceeded(Lorg/chromium/net/UrlResponseInfo;)V
.end method

.method protected abstract shouldFollowRedirect(Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
