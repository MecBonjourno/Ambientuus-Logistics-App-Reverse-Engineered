.class public abstract Lorg/chromium/base/Callback$Helper;
.super Ljava/lang/Object;
.source "Callback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Helper"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static onBooleanResultFromNative(Lorg/chromium/base/Callback;Z)V
    .locals 1
    .param p0, "callback"    # Lorg/chromium/base/Callback;
    .param p1, "result"    # Z

    .line 47
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    .line 48
    return-void
.end method

.method static onIntResultFromNative(Lorg/chromium/base/Callback;I)V
    .locals 1
    .param p0, "callback"    # Lorg/chromium/base/Callback;
    .param p1, "result"    # I

    .line 53
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method static onLongResultFromNative(Lorg/chromium/base/Callback;J)V
    .locals 1
    .param p0, "callback"    # Lorg/chromium/base/Callback;
    .param p1, "result"    # J

    .line 59
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p0, v0}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    .line 60
    return-void
.end method

.method static onObjectResultFromNative(Lorg/chromium/base/Callback;Ljava/lang/Object;)V
    .locals 0
    .param p0, "callback"    # Lorg/chromium/base/Callback;
    .param p1, "result"    # Ljava/lang/Object;

    .line 41
    invoke-interface {p0, p1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    .line 42
    return-void
.end method

.method static onTimeResultFromNative(Lorg/chromium/base/Callback;J)V
    .locals 1
    .param p0, "callback"    # Lorg/chromium/base/Callback;
    .param p1, "result"    # J

    .line 65
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p0, v0}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    .line 66
    return-void
.end method

.method static runRunnable(Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .line 70
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 71
    return-void
.end method
