.class Lorg/chromium/net/impl/CronetUrlRequest$3;
.super Ljava/lang/Object;
.source "CronetUrlRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/chromium/net/impl/CronetUrlRequest;->onRedirectReceived(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/chromium/net/impl/CronetUrlRequest;

.field final synthetic val$newLocation:Ljava/lang/String;

.field final synthetic val$responseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;


# direct methods
.method constructor <init>(Lorg/chromium/net/impl/CronetUrlRequest;Lorg/chromium/net/impl/UrlResponseInfoImpl;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/chromium/net/impl/CronetUrlRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 577
    iput-object p1, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    iput-object p2, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->val$responseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    iput-object p3, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->val$newLocation:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 580
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetUrlRequest;->checkCallingThread()V

    .line 581
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$fgetmUrlRequestAdapterLock(Lorg/chromium/net/impl/CronetUrlRequest;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 582
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v1}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$misDoneLocked(Lorg/chromium/net/impl/CronetUrlRequest;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 583
    monitor-exit v0

    return-void

    .line 585
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$fputmWaitingOnRedirect(Lorg/chromium/net/impl/CronetUrlRequest;Z)V

    .line 586
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 589
    :try_start_1
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$fgetmCallback(Lorg/chromium/net/impl/CronetUrlRequest;)Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;

    move-result-object v0

    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    iget-object v2, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->val$responseInfo:Lorg/chromium/net/impl/UrlResponseInfoImpl;

    iget-object v3, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->val$newLocation:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->onRedirectReceived(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 592
    goto :goto_0

    .line 590
    :catch_0
    move-exception v0

    .line 591
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest$3;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v1, v0}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$monCallbackException(Lorg/chromium/net/impl/CronetUrlRequest;Ljava/lang/Exception;)V

    .line 593
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 586
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
