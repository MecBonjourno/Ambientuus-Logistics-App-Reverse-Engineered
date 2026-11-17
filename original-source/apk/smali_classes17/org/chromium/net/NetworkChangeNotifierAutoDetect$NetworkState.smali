.class public Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;
.super Ljava/lang/Object;
.source "NetworkChangeNotifierAutoDetect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/NetworkChangeNotifierAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetworkState"
.end annotation


# instance fields
.field private final mConnected:Z

.field private final mIsMetered:Z

.field private final mIsPrivateDnsActive:Z

.field private final mNetworkIdentifier:Ljava/lang/String;

.field private final mPrivateDnsServerName:Ljava/lang/String;

.field private final mSubtype:I

.field private final mType:I


# direct methods
.method public constructor <init>(ZIIZLjava/lang/String;ZLjava/lang/String;)V
    .locals 2
    .param p1, "connected"    # Z
    .param p2, "type"    # I
    .param p3, "subtype"    # I
    .param p4, "isMetered"    # Z
    .param p5, "networkIdentifier"    # Ljava/lang/String;
    .param p6, "isPrivateDnsActive"    # Z
    .param p7, "privateDnsServerName"    # Ljava/lang/String;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-boolean p1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mConnected:Z

    .line 80
    iput p2, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mType:I

    .line 81
    iput p3, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mSubtype:I

    .line 82
    iput-boolean p4, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mIsMetered:Z

    .line 83
    const-string v0, ""

    if-nez p5, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    move-object v1, p5

    :goto_0
    iput-object v1, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mNetworkIdentifier:Ljava/lang/String;

    .line 84
    iput-boolean p6, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mIsPrivateDnsActive:Z

    .line 85
    if-nez p7, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, p7

    :goto_1
    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mPrivateDnsServerName:Ljava/lang/String;

    .line 86
    return-void
.end method


# virtual methods
.method public getConnectionCost()I
    .locals 1

    .line 125
    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->isMetered()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    const/4 v0, 0x2

    return v0

    .line 128
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public getConnectionSubtype()I
    .locals 2

    .line 135
    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 136
    const/4 v0, 0x1

    return v0

    .line 139
    :cond_0
    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getNetworkType()I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 184
    :pswitch_0
    return v1

    .line 144
    :pswitch_1
    return v1

    .line 149
    :pswitch_2
    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getNetworkSubType()I

    move-result v0

    packed-switch v0, :pswitch_data_1

    .line 181
    return v1

    .line 177
    :pswitch_3
    const/16 v0, 0x11

    return v0

    .line 175
    :pswitch_4
    const/16 v0, 0x10

    return v0

    .line 179
    :pswitch_5
    const/16 v0, 0x12

    return v0

    .line 173
    :pswitch_6
    const/16 v0, 0xd

    return v0

    .line 159
    :pswitch_7
    const/4 v0, 0x4

    return v0

    .line 171
    :pswitch_8
    const/16 v0, 0xc

    return v0

    .line 169
    :pswitch_9
    const/16 v0, 0xf

    return v0

    .line 167
    :pswitch_a
    const/16 v0, 0xe

    return v0

    .line 157
    :pswitch_b
    const/4 v0, 0x6

    return v0

    .line 165
    :pswitch_c
    const/16 v0, 0xb

    return v0

    .line 163
    :pswitch_d
    const/16 v0, 0xa

    return v0

    .line 155
    :pswitch_e
    const/4 v0, 0x5

    return v0

    .line 161
    :pswitch_f
    const/16 v0, 0x9

    return v0

    .line 153
    :pswitch_10
    const/16 v0, 0x8

    return v0

    .line 151
    :pswitch_11
    const/4 v0, 0x7

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public getConnectionType()I
    .locals 2

    .line 114
    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 115
    const/4 v0, 0x6

    return v0

    .line 117
    :cond_0
    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getNetworkType()I

    move-result v0

    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getNetworkSubType()I

    move-result v1

    invoke-static {v0, v1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->-$$Nest$smconvertToConnectionType(II)I

    move-result v0

    return v0
.end method

.method public getNetworkIdentifier()Ljava/lang/String;
    .locals 1

    .line 106
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mNetworkIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public getNetworkSubType()I
    .locals 1

    .line 101
    iget v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mSubtype:I

    return v0
.end method

.method public getNetworkType()I
    .locals 1

    .line 93
    iget v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mType:I

    return v0
.end method

.method public getPrivateDnsServerName()Ljava/lang/String;
    .locals 1

    .line 199
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mPrivateDnsServerName:Ljava/lang/String;

    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    .line 89
    iget-boolean v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mConnected:Z

    return v0
.end method

.method public isMetered()Z
    .locals 1

    .line 97
    iget-boolean v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mIsMetered:Z

    return v0
.end method

.method public isPrivateDnsActive()Z
    .locals 1

    .line 192
    iget-boolean v0, p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->mIsPrivateDnsActive:Z

    return v0
.end method
