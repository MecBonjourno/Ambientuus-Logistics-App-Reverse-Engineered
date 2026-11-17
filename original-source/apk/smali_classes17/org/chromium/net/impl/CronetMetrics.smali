.class public final Lorg/chromium/net/impl/CronetMetrics;
.super Lorg/chromium/net/RequestFinishedInfo$Metrics;
.source "CronetMetrics.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mConnectEndMs:J

.field private final mConnectStartMs:J

.field private final mDnsEndMs:J

.field private final mDnsStartMs:J

.field private final mPushEndMs:J

.field private final mPushStartMs:J

.field private final mReceivedByteCount:Ljava/lang/Long;

.field private final mRequestEndMs:J

.field private final mRequestStartMs:J

.field private final mResponseStartMs:J

.field private final mSendingEndMs:J

.field private final mSendingStartMs:J

.field private final mSentByteCount:Ljava/lang/Long;

.field private final mSocketReused:Z

.field private final mSslEndMs:J

.field private final mSslStartMs:J

.field private final mTotalTimeMs:Ljava/lang/Long;

.field private final mTtfbMs:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 17
    return-void
.end method

.method public constructor <init>(JJJJJJJJJJJJJZJJ)V
    .locals 20
    .param p1, "requestStartMs"    # J
    .param p3, "dnsStartMs"    # J
    .param p5, "dnsEndMs"    # J
    .param p7, "connectStartMs"    # J
    .param p9, "connectEndMs"    # J
    .param p11, "sslStartMs"    # J
    .param p13, "sslEndMs"    # J
    .param p15, "sendingStartMs"    # J
    .param p17, "sendingEndMs"    # J
    .param p19, "pushStartMs"    # J
    .param p21, "pushEndMs"    # J
    .param p23, "responseStartMs"    # J
    .param p25, "requestEndMs"    # J
    .param p27, "socketReused"    # Z
    .param p28, "sentByteCount"    # J
    .param p30, "receivedByteCount"    # J

    .line 93
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-wide/from16 v3, p3

    move-wide/from16 v5, p7

    move-wide/from16 v7, p11

    move-wide/from16 v9, p15

    move-wide/from16 v11, p23

    move-wide/from16 v13, p25

    invoke-direct {v0}, Lorg/chromium/net/RequestFinishedInfo$Metrics;-><init>()V

    .line 96
    invoke-static/range {p3 .. p6}, Lorg/chromium/net/impl/CronetMetrics;->checkOrder(JJ)Z

    move-result v15

    if-eqz v15, :cond_f

    .line 97
    invoke-static/range {p7 .. p10}, Lorg/chromium/net/impl/CronetMetrics;->checkOrder(JJ)Z

    move-result v15

    if-eqz v15, :cond_e

    .line 98
    invoke-static/range {p11 .. p14}, Lorg/chromium/net/impl/CronetMetrics;->checkOrder(JJ)Z

    move-result v15

    if-eqz v15, :cond_d

    .line 99
    invoke-static/range {p15 .. p18}, Lorg/chromium/net/impl/CronetMetrics;->checkOrder(JJ)Z

    move-result v15

    if-eqz v15, :cond_c

    .line 100
    invoke-static/range {p19 .. p22}, Lorg/chromium/net/impl/CronetMetrics;->checkOrder(JJ)Z

    move-result v15

    if-eqz v15, :cond_b

    .line 102
    cmp-long v15, v13, v11

    if-ltz v15, :cond_a

    .line 104
    cmp-long v15, v3, v1

    const-wide/16 v16, -0x1

    if-gez v15, :cond_1

    cmp-long v15, v3, v16

    if-nez v15, :cond_0

    goto :goto_0

    :cond_0
    new-instance v15, Ljava/lang/AssertionError;

    invoke-direct {v15}, Ljava/lang/AssertionError;-><init>()V

    throw v15

    .line 105
    :cond_1
    :goto_0
    cmp-long v15, v9, v1

    if-gez v15, :cond_3

    cmp-long v15, v9, v16

    if-nez v15, :cond_2

    goto :goto_1

    :cond_2
    new-instance v15, Ljava/lang/AssertionError;

    invoke-direct {v15}, Ljava/lang/AssertionError;-><init>()V

    throw v15

    .line 106
    :cond_3
    :goto_1
    cmp-long v15, v7, v5

    if-gez v15, :cond_5

    cmp-long v15, v7, v16

    if-nez v15, :cond_4

    goto :goto_2

    :cond_4
    new-instance v15, Ljava/lang/AssertionError;

    invoke-direct {v15}, Ljava/lang/AssertionError;-><init>()V

    throw v15

    .line 107
    :cond_5
    :goto_2
    cmp-long v15, v11, v9

    if-gez v15, :cond_7

    cmp-long v15, v11, v16

    if-nez v15, :cond_6

    goto :goto_3

    :cond_6
    new-instance v15, Ljava/lang/AssertionError;

    invoke-direct {v15}, Ljava/lang/AssertionError;-><init>()V

    throw v15

    .line 108
    :cond_7
    :goto_3
    iput-wide v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mRequestStartMs:J

    .line 109
    iput-wide v3, v0, Lorg/chromium/net/impl/CronetMetrics;->mDnsStartMs:J

    .line 110
    move-wide/from16 v1, p5

    iput-wide v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mDnsEndMs:J

    .line 111
    iput-wide v5, v0, Lorg/chromium/net/impl/CronetMetrics;->mConnectStartMs:J

    .line 112
    move-wide/from16 v1, p9

    iput-wide v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mConnectEndMs:J

    .line 113
    iput-wide v7, v0, Lorg/chromium/net/impl/CronetMetrics;->mSslStartMs:J

    .line 114
    move-wide/from16 v1, p13

    iput-wide v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mSslEndMs:J

    .line 115
    iput-wide v9, v0, Lorg/chromium/net/impl/CronetMetrics;->mSendingStartMs:J

    .line 116
    move-wide/from16 v1, p17

    iput-wide v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mSendingEndMs:J

    .line 117
    move-wide/from16 v1, p19

    iput-wide v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mPushStartMs:J

    .line 118
    move-wide/from16 v1, p21

    iput-wide v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mPushEndMs:J

    .line 119
    iput-wide v11, v0, Lorg/chromium/net/impl/CronetMetrics;->mResponseStartMs:J

    .line 120
    iput-wide v13, v0, Lorg/chromium/net/impl/CronetMetrics;->mRequestEndMs:J

    .line 121
    move/from16 v15, p27

    iput-boolean v15, v0, Lorg/chromium/net/impl/CronetMetrics;->mSocketReused:Z

    .line 122
    invoke-static/range {p28 .. p29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mSentByteCount:Ljava/lang/Long;

    .line 123
    invoke-static/range {p30 .. p31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mReceivedByteCount:Ljava/lang/Long;

    .line 126
    cmp-long v1, p1, v16

    const/4 v2, 0x0

    if-eqz v1, :cond_8

    cmp-long v1, v11, v16

    if-eqz v1, :cond_8

    .line 127
    sub-long v18, v11, p1

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mTtfbMs:Ljava/lang/Long;

    goto :goto_4

    .line 129
    :cond_8
    iput-object v2, v0, Lorg/chromium/net/impl/CronetMetrics;->mTtfbMs:Ljava/lang/Long;

    .line 131
    :goto_4
    cmp-long v1, p1, v16

    if-eqz v1, :cond_9

    cmp-long v1, v13, v16

    if-eqz v1, :cond_9

    .line 132
    sub-long v1, v13, p1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/chromium/net/impl/CronetMetrics;->mTotalTimeMs:Ljava/lang/Long;

    goto :goto_5

    .line 134
    :cond_9
    iput-object v2, v0, Lorg/chromium/net/impl/CronetMetrics;->mTotalTimeMs:Ljava/lang/Long;

    .line 136
    :goto_5
    return-void

    .line 102
    :cond_a
    move/from16 v15, p27

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 100
    :cond_b
    move/from16 v15, p27

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 99
    :cond_c
    move/from16 v15, p27

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 98
    :cond_d
    move/from16 v15, p27

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 97
    :cond_e
    move/from16 v15, p27

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 96
    :cond_f
    move/from16 v15, p27

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 2
    .param p1, "ttfbMs"    # Ljava/lang/Long;
    .param p2, "totalTimeMs"    # Ljava/lang/Long;
    .param p3, "sentByteCount"    # Ljava/lang/Long;
    .param p4, "receivedByteCount"    # Ljava/lang/Long;

    .line 64
    invoke-direct {p0}, Lorg/chromium/net/RequestFinishedInfo$Metrics;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/chromium/net/impl/CronetMetrics;->mTtfbMs:Ljava/lang/Long;

    .line 66
    iput-object p2, p0, Lorg/chromium/net/impl/CronetMetrics;->mTotalTimeMs:Ljava/lang/Long;

    .line 67
    iput-object p3, p0, Lorg/chromium/net/impl/CronetMetrics;->mSentByteCount:Ljava/lang/Long;

    .line 68
    iput-object p4, p0, Lorg/chromium/net/impl/CronetMetrics;->mReceivedByteCount:Ljava/lang/Long;

    .line 71
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mRequestStartMs:J

    .line 72
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mDnsStartMs:J

    .line 73
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mDnsEndMs:J

    .line 74
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mConnectStartMs:J

    .line 75
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mConnectEndMs:J

    .line 76
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSslStartMs:J

    .line 77
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSslEndMs:J

    .line 78
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSendingStartMs:J

    .line 79
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSendingEndMs:J

    .line 80
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mPushStartMs:J

    .line 81
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mPushEndMs:J

    .line 82
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mResponseStartMs:J

    .line 83
    iput-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mRequestEndMs:J

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSocketReused:Z

    .line 85
    return-void
.end method

.method private static checkOrder(JJ)Z
    .locals 3
    .param p0, "start"    # J
    .param p2, "end"    # J

    .line 56
    cmp-long v0, p2, p0

    const-wide/16 v1, -0x1

    if-ltz v0, :cond_0

    cmp-long v0, p0, v1

    if-nez v0, :cond_1

    :cond_0
    cmp-long v0, p2, v1

    if-nez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static toDate(J)Ljava/util/Date;
    .locals 2
    .param p0, "timestamp"    # J

    .line 47
    const-wide/16 v0, -0x1

    cmp-long v0, p0, v0

    if-eqz v0, :cond_0

    .line 48
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    return-object v0

    .line 50
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public getConnectEnd()Ljava/util/Date;
    .locals 2

    .line 165
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mConnectEndMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getConnectStart()Ljava/util/Date;
    .locals 2

    .line 159
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mConnectStartMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getDnsEnd()Ljava/util/Date;
    .locals 2

    .line 153
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mDnsEndMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getDnsStart()Ljava/util/Date;
    .locals 2

    .line 147
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mDnsStartMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getPushEnd()Ljava/util/Date;
    .locals 2

    .line 201
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mPushEndMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getPushStart()Ljava/util/Date;
    .locals 2

    .line 195
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mPushStartMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getReceivedByteCount()Ljava/lang/Long;
    .locals 1

    .line 242
    iget-object v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mReceivedByteCount:Ljava/lang/Long;

    return-object v0
.end method

.method public getRequestEnd()Ljava/util/Date;
    .locals 2

    .line 213
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mRequestEndMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getRequestStart()Ljava/util/Date;
    .locals 2

    .line 141
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mRequestStartMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getResponseStart()Ljava/util/Date;
    .locals 2

    .line 207
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mResponseStartMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getSendingEnd()Ljava/util/Date;
    .locals 2

    .line 189
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSendingEndMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getSendingStart()Ljava/util/Date;
    .locals 2

    .line 183
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSendingStartMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getSentByteCount()Ljava/lang/Long;
    .locals 1

    .line 236
    iget-object v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSentByteCount:Ljava/lang/Long;

    return-object v0
.end method

.method public getSocketReused()Z
    .locals 1

    .line 218
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSocketReused:Z

    return v0
.end method

.method public getSslEnd()Ljava/util/Date;
    .locals 2

    .line 177
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSslEndMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getSslStart()Ljava/util/Date;
    .locals 2

    .line 171
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mSslStartMs:J

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetMetrics;->toDate(J)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getTotalTimeMs()Ljava/lang/Long;
    .locals 1

    .line 230
    iget-object v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mTotalTimeMs:Ljava/lang/Long;

    return-object v0
.end method

.method public getTtfbMs()Ljava/lang/Long;
    .locals 1

    .line 224
    iget-object v0, p0, Lorg/chromium/net/impl/CronetMetrics;->mTtfbMs:Ljava/lang/Long;

    return-object v0
.end method
