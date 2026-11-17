.class public final Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;
.super Lorg/chromium/net/BidirectionalStream$Callback;
.source "VersionSafeCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/impl/VersionSafeCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BidirectionalStreamCallback"
.end annotation


# instance fields
.field private final mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;


# direct methods
.method public constructor <init>(Lorg/chromium/net/BidirectionalStream$Callback;)V
    .locals 0
    .param p1, "callback"    # Lorg/chromium/net/BidirectionalStream$Callback;

    .line 98
    invoke-direct {p0}, Lorg/chromium/net/BidirectionalStream$Callback;-><init>()V

    .line 99
    iput-object p1, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    .line 100
    return-void
.end method


# virtual methods
.method public onCanceled(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 1
    .param p1, "stream"    # Lorg/chromium/net/BidirectionalStream;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 143
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/BidirectionalStream$Callback;->onCanceled(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;)V

    .line 144
    return-void
.end method

.method public onFailed(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V
    .locals 1
    .param p1, "stream"    # Lorg/chromium/net/BidirectionalStream;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "error"    # Lorg/chromium/net/CronetException;

    .line 138
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/BidirectionalStream$Callback;->onFailed(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V

    .line 139
    return-void
.end method

.method public onReadCompleted(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;Z)V
    .locals 1
    .param p1, "stream"    # Lorg/chromium/net/BidirectionalStream;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "buffer"    # Ljava/nio/ByteBuffer;
    .param p4, "endOfStream"    # Z

    .line 115
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/chromium/net/BidirectionalStream$Callback;->onReadCompleted(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;Z)V

    .line 116
    return-void
.end method

.method public onResponseHeadersReceived(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 1
    .param p1, "stream"    # Lorg/chromium/net/BidirectionalStream;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 109
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/BidirectionalStream$Callback;->onResponseHeadersReceived(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;)V

    .line 110
    return-void
.end method

.method public onResponseTrailersReceived(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/UrlResponseInfo$HeaderBlock;)V
    .locals 1
    .param p1, "stream"    # Lorg/chromium/net/BidirectionalStream;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "trailers"    # Lorg/chromium/net/UrlResponseInfo$HeaderBlock;

    .line 127
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/BidirectionalStream$Callback;->onResponseTrailersReceived(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/UrlResponseInfo$HeaderBlock;)V

    .line 128
    return-void
.end method

.method public onStreamReady(Lorg/chromium/net/BidirectionalStream;)V
    .locals 1
    .param p1, "stream"    # Lorg/chromium/net/BidirectionalStream;

    .line 104
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    invoke-virtual {v0, p1}, Lorg/chromium/net/BidirectionalStream$Callback;->onStreamReady(Lorg/chromium/net/BidirectionalStream;)V

    .line 105
    return-void
.end method

.method public onSucceeded(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 1
    .param p1, "stream"    # Lorg/chromium/net/BidirectionalStream;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 132
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    invoke-virtual {v0, p1, p2}, Lorg/chromium/net/BidirectionalStream$Callback;->onSucceeded(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;)V

    .line 133
    return-void
.end method

.method public onWriteCompleted(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;Z)V
    .locals 1
    .param p1, "stream"    # Lorg/chromium/net/BidirectionalStream;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "buffer"    # Ljava/nio/ByteBuffer;
    .param p4, "endOfStream"    # Z

    .line 121
    iget-object v0, p0, Lorg/chromium/net/impl/VersionSafeCallbacks$BidirectionalStreamCallback;->mWrappedCallback:Lorg/chromium/net/BidirectionalStream$Callback;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/chromium/net/BidirectionalStream$Callback;->onWriteCompleted(Lorg/chromium/net/BidirectionalStream;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;Z)V

    .line 122
    return-void
.end method
