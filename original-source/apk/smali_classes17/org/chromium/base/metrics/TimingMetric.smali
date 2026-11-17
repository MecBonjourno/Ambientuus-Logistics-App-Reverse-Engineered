.class public Lorg/chromium/base/metrics/TimingMetric;
.super Ljava/lang/Object;
.source "TimingMetric.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/metrics/TimingMetric$TimerType;
    }
.end annotation


# instance fields
.field private final mMetricName:Ljava/lang/String;

.field private mStartTime:J

.field private final mTimerType:I


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "metricName"    # Ljava/lang/String;
    .param p2, "timerType"    # I

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/chromium/base/metrics/TimingMetric;->mMetricName:Ljava/lang/String;

    .line 71
    iput p2, p0, Lorg/chromium/base/metrics/TimingMetric;->mTimerType:I

    .line 72
    return-void
.end method

.method public static mediumUptime(Ljava/lang/String;)Lorg/chromium/base/metrics/TimingMetric;
    .locals 3
    .param p0, "metricName"    # Ljava/lang/String;

    .line 52
    new-instance v0, Lorg/chromium/base/metrics/TimingMetric;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lorg/chromium/base/metrics/TimingMetric;-><init>(Ljava/lang/String;I)V

    .line 53
    .local v0, "ret":Lorg/chromium/base/metrics/TimingMetric;
    invoke-static {}, Lorg/chromium/base/TimeUtils;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lorg/chromium/base/metrics/TimingMetric;->mStartTime:J

    .line 54
    return-object v0
.end method

.method public static shortThreadTime(Ljava/lang/String;)Lorg/chromium/base/metrics/TimingMetric;
    .locals 3
    .param p0, "metricName"    # Ljava/lang/String;

    .line 64
    new-instance v0, Lorg/chromium/base/metrics/TimingMetric;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lorg/chromium/base/metrics/TimingMetric;-><init>(Ljava/lang/String;I)V

    .line 65
    .local v0, "ret":Lorg/chromium/base/metrics/TimingMetric;
    invoke-static {}, Lorg/chromium/base/TimeUtils;->currentThreadTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lorg/chromium/base/metrics/TimingMetric;->mStartTime:J

    .line 66
    return-object v0
.end method

.method public static shortUptime(Ljava/lang/String;)Lorg/chromium/base/metrics/TimingMetric;
    .locals 3
    .param p0, "metricName"    # Ljava/lang/String;

    .line 40
    new-instance v0, Lorg/chromium/base/metrics/TimingMetric;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/chromium/base/metrics/TimingMetric;-><init>(Ljava/lang/String;I)V

    .line 41
    .local v0, "ret":Lorg/chromium/base/metrics/TimingMetric;
    invoke-static {}, Lorg/chromium/base/TimeUtils;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lorg/chromium/base/metrics/TimingMetric;->mStartTime:J

    .line 42
    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 6

    .line 76
    iget-object v0, p0, Lorg/chromium/base/metrics/TimingMetric;->mMetricName:Ljava/lang/String;

    .line 77
    .local v0, "metricName":Ljava/lang/String;
    iget-wide v1, p0, Lorg/chromium/base/metrics/TimingMetric;->mStartTime:J

    .line 78
    .local v1, "startTime":J
    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    return-void

    .line 79
    :cond_0
    iput-wide v3, p0, Lorg/chromium/base/metrics/TimingMetric;->mStartTime:J

    .line 81
    iget v3, p0, Lorg/chromium/base/metrics/TimingMetric;->mTimerType:I

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 91
    :pswitch_0
    nop

    .line 92
    invoke-static {}, Lorg/chromium/base/TimeUtils;->currentThreadTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    .line 91
    invoke-static {v0, v3, v4}, Lorg/chromium/base/metrics/RecordHistogram;->recordTimesHistogram(Ljava/lang/String;J)V

    goto :goto_0

    .line 87
    :pswitch_1
    nop

    .line 88
    invoke-static {}, Lorg/chromium/base/TimeUtils;->uptimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    .line 87
    invoke-static {v0, v3, v4}, Lorg/chromium/base/metrics/RecordHistogram;->recordMediumTimesHistogram(Ljava/lang/String;J)V

    .line 89
    goto :goto_0

    .line 83
    :pswitch_2
    nop

    .line 84
    invoke-static {}, Lorg/chromium/base/TimeUtils;->uptimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    .line 83
    invoke-static {v0, v3, v4}, Lorg/chromium/base/metrics/RecordHistogram;->recordTimesHistogram(Ljava/lang/String;J)V

    .line 85
    nop

    .line 95
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
