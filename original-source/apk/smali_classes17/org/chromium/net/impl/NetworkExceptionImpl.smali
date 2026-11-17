.class public Lorg/chromium/net/impl/NetworkExceptionImpl;
.super Lorg/chromium/net/NetworkException;
.source "NetworkExceptionImpl.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected final mCronetInternalErrorCode:I

.field protected final mErrorCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "errorCode"    # I
    .param p3, "cronetInternalErrorCode"    # I

    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/chromium/net/NetworkException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    if-lez p2, :cond_1

    const/16 v0, 0xc

    if-ge p2, v0, :cond_1

    .line 30
    if-gez p3, :cond_0

    .line 31
    iput p2, p0, Lorg/chromium/net/impl/NetworkExceptionImpl;->mErrorCode:I

    .line 32
    iput p3, p0, Lorg/chromium/net/impl/NetworkExceptionImpl;->mCronetInternalErrorCode:I

    .line 33
    return-void

    .line 30
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 29
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method public getCronetInternalErrorCode()I
    .locals 1

    .line 42
    iget v0, p0, Lorg/chromium/net/impl/NetworkExceptionImpl;->mCronetInternalErrorCode:I

    return v0
.end method

.method public getErrorCode()I
    .locals 1

    .line 37
    iget v0, p0, Lorg/chromium/net/impl/NetworkExceptionImpl;->mErrorCode:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 3

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-super {p0}, Lorg/chromium/net/NetworkException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .local v0, "b":Ljava/lang/StringBuilder;
    const-string v1, ", ErrorCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/chromium/net/impl/NetworkExceptionImpl;->mErrorCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    iget v1, p0, Lorg/chromium/net/impl/NetworkExceptionImpl;->mCronetInternalErrorCode:I

    if-eqz v1, :cond_0

    .line 69
    const-string v1, ", InternalErrorCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/chromium/net/impl/NetworkExceptionImpl;->mCronetInternalErrorCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    :cond_0
    const-string v1, ", Retryable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/chromium/net/impl/NetworkExceptionImpl;->immediatelyRetryable()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public immediatelyRetryable()Z
    .locals 1

    .line 47
    iget v0, p0, Lorg/chromium/net/impl/NetworkExceptionImpl;->mErrorCode:I

    packed-switch v0, :pswitch_data_0

    .line 54
    :pswitch_0
    const/4 v0, 0x0

    return v0

    .line 60
    :pswitch_1
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
