.class public Lorg/chromium/net/impl/CallbackExceptionImpl;
.super Lorg/chromium/net/CallbackException;
.source "CallbackExceptionImpl.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 14
    invoke-direct {p0, p1, p2}, Lorg/chromium/net/CallbackException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    return-void
.end method
