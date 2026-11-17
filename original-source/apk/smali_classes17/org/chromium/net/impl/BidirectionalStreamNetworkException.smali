.class public Lorg/chromium/net/impl/BidirectionalStreamNetworkException;
.super Lorg/chromium/net/impl/NetworkExceptionImpl;
.source "BidirectionalStreamNetworkException.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "errorCode"    # I
    .param p3, "cronetInternalErrorCode"    # I

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lorg/chromium/net/impl/NetworkExceptionImpl;-><init>(Ljava/lang/String;II)V

    .line 19
    return-void
.end method


# virtual methods
.method public immediatelyRetryable()Z
    .locals 2

    .line 23
    iget v0, p0, Lorg/chromium/net/impl/BidirectionalStreamNetworkException;->mCronetInternalErrorCode:I

    sparse-switch v0, :sswitch_data_0

    .line 29
    invoke-super {p0}, Lorg/chromium/net/impl/NetworkExceptionImpl;->immediatelyRetryable()Z

    move-result v0

    return v0

    .line 26
    :sswitch_0
    iget v0, p0, Lorg/chromium/net/impl/BidirectionalStreamNetworkException;->mErrorCode:I

    const/16 v1, 0xb

    if-ne v0, v1, :cond_0

    .line 27
    const/4 v0, 0x1

    return v0

    .line 26
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :sswitch_data_0
    .sparse-switch
        -0x166 -> :sswitch_0
        -0x160 -> :sswitch_0
    .end sparse-switch
.end method
