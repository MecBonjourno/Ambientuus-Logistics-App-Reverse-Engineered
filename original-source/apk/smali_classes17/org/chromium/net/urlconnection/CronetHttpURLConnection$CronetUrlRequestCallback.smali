.class Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;
.super Lorg/chromium/net/UrlRequest$Callback;
.source "CronetHttpURLConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/urlconnection/CronetHttpURLConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CronetUrlRequestCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;


# direct methods
.method public constructor <init>(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)V
    .locals 0

    .line 527
    iput-object p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-direct {p0}, Lorg/chromium/net/UrlRequest$Callback;-><init>()V

    return-void
.end method

.method private setResponseDataCompleted(Ljava/io/IOException;)V
    .locals 2
    .param p1, "exception"    # Ljava/io/IOException;

    .line 597
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0, p1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmException(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Ljava/io/IOException;)V

    .line 598
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmInputStream(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/CronetInputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 599
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmInputStream(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/CronetInputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/chromium/net/urlconnection/CronetInputStream;->setResponseDataCompleted(Ljava/io/IOException;)V

    .line 601
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmOutputStream(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/CronetOutputStream;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 602
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmOutputStream(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/CronetOutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/chromium/net/urlconnection/CronetOutputStream;->setRequestCompleted(Ljava/io/IOException;)V

    .line 604
    :cond_1
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmHasResponseHeadersOrCompleted(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Z)V

    .line 605
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmMessageLoop(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/MessageLoop;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/urlconnection/MessageLoop;->quit()V

    .line 606
    return-void
.end method


# virtual methods
.method public onCanceled(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 2
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 586
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0, p2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmResponseInfo(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Lorg/chromium/net/UrlResponseInfo;)V

    .line 587
    new-instance v0, Ljava/io/IOException;

    const-string v1, "disconnect() called"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->setResponseDataCompleted(Ljava/io/IOException;)V

    .line 588
    return-void
.end method

.method public onFailed(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Lorg/chromium/net/CronetException;)V
    .locals 2
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "exception"    # Lorg/chromium/net/CronetException;

    .line 576
    if-eqz p3, :cond_0

    .line 580
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0, p2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmResponseInfo(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Lorg/chromium/net/UrlResponseInfo;)V

    .line 581
    invoke-direct {p0, p3}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->setResponseDataCompleted(Ljava/io/IOException;)V

    .line 582
    return-void

    .line 577
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Exception cannot be null in onFailed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onReadCompleted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 540
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0, p2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmResponseInfo(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Lorg/chromium/net/UrlResponseInfo;)V

    .line 541
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmMessageLoop(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/MessageLoop;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/urlconnection/MessageLoop;->quit()V

    .line 542
    return-void
.end method

.method public onRedirectReceived(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)V
    .locals 3
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;
    .param p3, "newLocationUrl"    # Ljava/lang/String;

    .line 547
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmOnRedirectCalled(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Z)V

    .line 549
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 550
    .local v0, "newUrl":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->access$000(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 551
    .local v1, "sameProtocol":Z
    iget-object v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->access$100(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 554
    iget-object v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v2, v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->access$202(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Ljava/net/URL;)Ljava/net/URL;

    .line 556
    :cond_0
    iget-object v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->access$300(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Z

    move-result v2

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    .line 557
    iget-object v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmRequest(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/UrlRequest;

    move-result-object v2

    invoke-virtual {v2}, Lorg/chromium/net/UrlRequest;->followRedirect()V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 558
    return-void

    .line 562
    .end local v0    # "newUrl":Ljava/net/URL;
    .end local v1    # "sameProtocol":Z
    :cond_1
    goto :goto_0

    .line 560
    :catch_0
    move-exception v0

    .line 563
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0, p2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmResponseInfo(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Lorg/chromium/net/UrlResponseInfo;)V

    .line 564
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmRequest(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/UrlRequest;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/UrlRequest;->cancel()V

    .line 565
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->setResponseDataCompleted(Ljava/io/IOException;)V

    .line 566
    return-void
.end method

.method public onResponseStarted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 2
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 531
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0, p2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmResponseInfo(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Lorg/chromium/net/UrlResponseInfo;)V

    .line 532
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmHasResponseHeadersOrCompleted(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Z)V

    .line 534
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fgetmMessageLoop(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/MessageLoop;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/urlconnection/MessageLoop;->quit()V

    .line 535
    return-void
.end method

.method public onSucceeded(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 1
    .param p1, "request"    # Lorg/chromium/net/UrlRequest;
    .param p2, "info"    # Lorg/chromium/net/UrlResponseInfo;

    .line 570
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->this$0:Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-static {v0, p2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->-$$Nest$fputmResponseInfo(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Lorg/chromium/net/UrlResponseInfo;)V

    .line 571
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;->setResponseDataCompleted(Ljava/io/IOException;)V

    .line 572
    return-void
.end method
