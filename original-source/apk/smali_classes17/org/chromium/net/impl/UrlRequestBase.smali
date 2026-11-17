.class public abstract Lorg/chromium/net/impl/UrlRequestBase;
.super Lorg/chromium/net/ExperimentalUrlRequest;
.source "UrlRequestBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/UrlRequestBase$StatusValues;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lorg/chromium/net/ExperimentalUrlRequest;-><init>()V

    return-void
.end method

.method public static convertLoadState(I)I
    .locals 2
    .param p0, "loadState"    # I

    .line 74
    if-ltz p0, :cond_0

    const/16 v0, 0xf

    if-gt p0, v0, :cond_0

    .line 75
    packed-switch p0, :pswitch_data_0

    .line 125
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No request status found."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :pswitch_1
    const/16 v0, 0xe

    return v0

    .line 116
    :pswitch_2
    const/16 v0, 0xd

    return v0

    .line 113
    :pswitch_3
    const/16 v0, 0xc

    return v0

    .line 110
    :pswitch_4
    const/16 v0, 0xb

    return v0

    .line 107
    :pswitch_5
    const/16 v0, 0xa

    return v0

    .line 104
    :pswitch_6
    const/16 v0, 0x9

    return v0

    .line 101
    :pswitch_7
    const/16 v0, 0x8

    return v0

    .line 98
    :pswitch_8
    const/4 v0, 0x7

    return v0

    .line 95
    :pswitch_9
    const/4 v0, 0x6

    return v0

    .line 92
    :pswitch_a
    const/4 v0, 0x5

    return v0

    .line 89
    :pswitch_b
    const/4 v0, 0x4

    return v0

    .line 86
    :pswitch_c
    const/4 v0, 0x3

    return v0

    .line 83
    :pswitch_d
    const/4 v0, 0x2

    return v0

    .line 80
    :pswitch_e
    const/4 v0, 0x1

    return v0

    .line 77
    :pswitch_f
    const/4 v0, 0x0

    return v0

    .line 74
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method protected abstract addHeader(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method protected abstract setHttpMethod(Ljava/lang/String;)V
.end method

.method protected abstract setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)V
.end method
