.class public abstract Lorg/chromium/net/QuicException;
.super Lorg/chromium/net/NetworkException;
.source "QuicException.java"


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 24
    invoke-direct {p0, p1, p2}, Lorg/chromium/net/NetworkException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    return-void
.end method


# virtual methods
.method public abstract getQuicDetailedErrorCode()I
.end method
