.class public abstract Lorg/chromium/net/CallbackException;
.super Lorg/chromium/net/CronetException;
.source "CallbackException.java"


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 22
    invoke-direct {p0, p1, p2}, Lorg/chromium/net/CronetException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    return-void
.end method
