.class Lorg/chromium/net/impl/CronetUrlRequest$5;
.super Ljava/lang/Object;
.source "CronetUrlRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/chromium/net/impl/CronetUrlRequest;->onSucceeded(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/chromium/net/impl/CronetUrlRequest;


# direct methods
.method constructor <init>(Lorg/chromium/net/impl/CronetUrlRequest;)V
    .locals 0
    .param p1, "this$0"    # Lorg/chromium/net/impl/CronetUrlRequest;

    .line 676
    iput-object p1, p0, Lorg/chromium/net/impl/CronetUrlRequest$5;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 679
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest$5;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$fgetmUrlRequestAdapterLock(Lorg/chromium/net/impl/CronetUrlRequest;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 680
    :try_start_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest$5;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v1}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$misDoneLocked(Lorg/chromium/net/impl/CronetUrlRequest;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 681
    monitor-exit v0

    return-void

    .line 685
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest$5;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$mdestroyRequestAdapterLocked(Lorg/chromium/net/impl/CronetUrlRequest;I)V

    .line 686
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 688
    :try_start_1
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest$5;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$fgetmCallback(Lorg/chromium/net/impl/CronetUrlRequest;)Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;

    move-result-object v0

    iget-object v1, p0, Lorg/chromium/net/impl/CronetUrlRequest$5;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    iget-object v2, p0, Lorg/chromium/net/impl/CronetUrlRequest$5;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v2}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$fgetmResponseInfo(Lorg/chromium/net/impl/CronetUrlRequest;)Lorg/chromium/net/impl/UrlResponseInfoImpl;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestCallback;->onSucceeded(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 691
    goto :goto_0

    .line 689
    :catch_0
    move-exception v0

    .line 690
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/chromium/net/impl/CronetUrlRequestContext;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception in onSucceeded method"

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 692
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/impl/CronetUrlRequest$5;->this$0:Lorg/chromium/net/impl/CronetUrlRequest;

    invoke-static {v0}, Lorg/chromium/net/impl/CronetUrlRequest;->-$$Nest$mmaybeReportMetrics(Lorg/chromium/net/impl/CronetUrlRequest;)V

    .line 693
    return-void

    .line 686
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
