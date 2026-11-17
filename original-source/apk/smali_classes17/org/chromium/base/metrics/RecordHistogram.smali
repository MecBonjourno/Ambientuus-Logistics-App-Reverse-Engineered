.class public Lorg/chromium/base/metrics/RecordHistogram;
.super Ljava/lang/Object;
.source "RecordHistogram.java"


# annotations
.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static clampToInt(J)I
    .locals 2
    .param p0, "value"    # J

    .line 259
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    const v0, 0x7fffffff

    return v0

    .line 262
    :cond_0
    const-wide/32 v0, -0x80000000

    cmp-long v0, p0, v0

    if-gez v0, :cond_1

    const/high16 v0, -0x80000000

    return v0

    .line 263
    :cond_1
    long-to-int v0, p0

    return v0
.end method

.method public static getHistogramSamplesForTesting(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/chromium/base/metrics/HistogramBucket;",
            ">;"
        }
    .end annotation

    .line 307
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/chromium/base/metrics/UmaRecorder;->getHistogramSamplesForTesting(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getHistogramTotalCountForTesting(Ljava/lang/String;)I
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 296
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/chromium/base/metrics/UmaRecorder;->getHistogramTotalCountForTesting(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getHistogramValueCountForTesting(Ljava/lang/String;I)I
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 283
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/base/metrics/UmaRecorder;->getHistogramValueCountForTesting(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static recordBooleanHistogram(Ljava/lang/String;Z)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # Z

    .line 27
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/base/metrics/UmaRecorder;->recordBooleanHistogram(Ljava/lang/String;Z)V

    .line 28
    return-void
.end method

.method public static recordCount100000Histogram(Ljava/lang/String;I)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I

    .line 85
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    const v4, 0x186a0

    const/16 v5, 0x32

    const/4 v3, 0x1

    move-object v1, p0

    move v2, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sample":I
    .local v1, "name":Ljava/lang/String;
    .local v2, "sample":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 86
    return-void
.end method

.method public static recordCount1000Histogram(Ljava/lang/String;I)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I

    .line 74
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    const/16 v4, 0x3e8

    const/16 v5, 0x32

    const/4 v3, 0x1

    move-object v1, p0

    move v2, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sample":I
    .local v1, "name":Ljava/lang/String;
    .local v2, "sample":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 75
    return-void
.end method

.method public static recordCount100Histogram(Ljava/lang/String;I)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I

    .line 63
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    const/16 v4, 0x64

    const/16 v5, 0x32

    const/4 v3, 0x1

    move-object v1, p0

    move v2, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sample":I
    .local v1, "name":Ljava/lang/String;
    .local v2, "sample":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 64
    return-void
.end method

.method public static recordCount1MHistogram(Ljava/lang/String;I)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I

    .line 52
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    const v4, 0xf4240

    const/16 v5, 0x32

    const/4 v3, 0x1

    move-object v1, p0

    move v2, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sample":I
    .local v1, "name":Ljava/lang/String;
    .local v2, "sample":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 53
    return-void
.end method

.method public static recordCustomCountHistogram(Ljava/lang/String;IIII)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I
    .param p2, "min"    # I
    .param p3, "max"    # I
    .param p4, "numBuckets"    # I

    .line 101
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sample":I
    .end local p2    # "min":I
    .end local p3    # "max":I
    .end local p4    # "numBuckets":I
    .local v1, "name":Ljava/lang/String;
    .local v2, "sample":I
    .local v3, "min":I
    .local v4, "max":I
    .local v5, "numBuckets":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 102
    return-void
.end method

.method public static recordCustomTimesHistogram(Ljava/lang/String;JJJI)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "durationMs"    # J
    .param p3, "min"    # J
    .param p5, "max"    # J
    .param p7, "numBuckets"    # I

    .line 213
    invoke-static/range {p0 .. p7}, Lorg/chromium/base/metrics/RecordHistogram;->recordCustomTimesHistogramMilliseconds(Ljava/lang/String;JJJI)V

    .line 214
    return-void
.end method

.method private static recordCustomTimesHistogramMilliseconds(Ljava/lang/String;JJJI)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "duration"    # J
    .param p3, "min"    # J
    .param p5, "max"    # J
    .param p7, "numBuckets"    # I

    .line 268
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    .line 269
    invoke-static {p1, p2}, Lorg/chromium/base/metrics/RecordHistogram;->clampToInt(J)I

    move-result v2

    invoke-static {p3, p4}, Lorg/chromium/base/metrics/RecordHistogram;->clampToInt(J)I

    move-result v3

    invoke-static {p5, p6}, Lorg/chromium/base/metrics/RecordHistogram;->clampToInt(J)I

    move-result v4

    .line 268
    move-object v1, p0

    move v5, p7

    .end local p0    # "name":Ljava/lang/String;
    .end local p7    # "numBuckets":I
    .local v1, "name":Ljava/lang/String;
    .local v5, "numBuckets":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 270
    return-void
.end method

.method public static recordEnumeratedHistogram(Ljava/lang/String;II)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I
    .param p2, "max"    # I

    .line 41
    invoke-static {p0, p1, p2}, Lorg/chromium/base/metrics/RecordHistogram;->recordExactLinearHistogram(Ljava/lang/String;II)V

    .line 42
    return-void
.end method

.method public static recordExactLinearHistogram(Ljava/lang/String;II)V
    .locals 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I
    .param p2, "max"    # I

    .line 252
    const/4 v0, 0x1

    .line 254
    .local v0, "min":I
    add-int/lit8 v6, p2, 0x1

    .line 255
    .local v6, "numBuckets":I
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v1

    const/4 v4, 0x1

    move-object v2, p0

    move v3, p1

    move v5, p2

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sample":I
    .end local p2    # "max":I
    .local v2, "name":Ljava/lang/String;
    .local v3, "sample":I
    .local v5, "max":I
    invoke-interface/range {v1 .. v6}, Lorg/chromium/base/metrics/UmaRecorder;->recordLinearHistogram(Ljava/lang/String;IIII)V

    .line 256
    return-void
.end method

.method public static recordLinearCountHistogram(Ljava/lang/String;IIII)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I
    .param p2, "min"    # I
    .param p3, "max"    # I
    .param p4, "numBuckets"    # I

    .line 117
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sample":I
    .end local p2    # "min":I
    .end local p3    # "max":I
    .end local p4    # "numBuckets":I
    .local v1, "name":Ljava/lang/String;
    .local v2, "sample":I
    .local v3, "min":I
    .local v4, "max":I
    .local v5, "numBuckets":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordLinearHistogram(Ljava/lang/String;IIII)V

    .line 118
    return-void
.end method

.method public static recordLongTimesHistogram(Ljava/lang/String;J)V
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "durationMs"    # J

    .line 181
    const-wide/32 v5, 0x36ee80

    const/16 v7, 0x32

    const-wide/16 v3, 0x1

    move-object v0, p0

    move-wide v1, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "durationMs":J
    .local v0, "name":Ljava/lang/String;
    .local v1, "durationMs":J
    invoke-static/range {v0 .. v7}, Lorg/chromium/base/metrics/RecordHistogram;->recordCustomTimesHistogramMilliseconds(Ljava/lang/String;JJJI)V

    .line 182
    return-void
.end method

.method public static recordLongTimesHistogram100(Ljava/lang/String;J)V
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "durationMs"    # J

    .line 194
    const-wide/32 v5, 0x36ee80

    const/16 v7, 0x64

    const-wide/16 v3, 0x1

    move-object v0, p0

    move-wide v1, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "durationMs":J
    .local v0, "name":Ljava/lang/String;
    .local v1, "durationMs":J
    invoke-static/range {v0 .. v7}, Lorg/chromium/base/metrics/RecordHistogram;->recordCustomTimesHistogramMilliseconds(Ljava/lang/String;JJJI)V

    .line 195
    return-void
.end method

.method public static recordMediumTimesHistogram(Ljava/lang/String;J)V
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "durationMs"    # J

    .line 167
    const-wide/32 v5, 0x2bf20

    const/16 v7, 0x32

    const-wide/16 v3, 0xa

    move-object v0, p0

    move-wide v1, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "durationMs":J
    .local v0, "name":Ljava/lang/String;
    .local v1, "durationMs":J
    invoke-static/range {v0 .. v7}, Lorg/chromium/base/metrics/RecordHistogram;->recordCustomTimesHistogramMilliseconds(Ljava/lang/String;JJJI)V

    .line 169
    return-void
.end method

.method public static recordMemoryKBHistogram(Ljava/lang/String;I)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sizeInKB"    # I

    .line 226
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    const v4, 0x7a120

    const/16 v5, 0x32

    const/16 v3, 0x3e8

    move-object v1, p0

    move v2, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sizeInKB":I
    .local v1, "name":Ljava/lang/String;
    .local v2, "sizeInKB":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 227
    return-void
.end method

.method public static recordMemoryMediumMBHistogram(Ljava/lang/String;I)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sizeInMB"    # I

    .line 239
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    const/16 v4, 0xfa0

    const/16 v5, 0x64

    const/4 v3, 0x1

    move-object v1, p0

    move v2, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "sizeInMB":I
    .local v1, "name":Ljava/lang/String;
    .local v2, "sizeInMB":I
    invoke-interface/range {v0 .. v5}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 240
    return-void
.end method

.method public static recordPercentageHistogram(Ljava/lang/String;I)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I

    .line 128
    const/16 v0, 0x65

    invoke-static {p0, p1, v0}, Lorg/chromium/base/metrics/RecordHistogram;->recordExactLinearHistogram(Ljava/lang/String;II)V

    .line 129
    return-void
.end method

.method public static recordSparseHistogram(Ljava/lang/String;I)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I

    .line 140
    invoke-static {}, Lorg/chromium/base/metrics/UmaRecorderHolder;->get()Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/base/metrics/UmaRecorder;->recordSparseHistogram(Ljava/lang/String;I)V

    .line 141
    return-void
.end method

.method public static recordTimesHistogram(Ljava/lang/String;J)V
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "durationMs"    # J

    .line 153
    const-wide/16 v5, 0x2710

    const/16 v7, 0x32

    const-wide/16 v3, 0x1

    move-object v0, p0

    move-wide v1, p1

    .end local p0    # "name":Ljava/lang/String;
    .end local p1    # "durationMs":J
    .local v0, "name":Ljava/lang/String;
    .local v1, "durationMs":J
    invoke-static/range {v0 .. v7}, Lorg/chromium/base/metrics/RecordHistogram;->recordCustomTimesHistogramMilliseconds(Ljava/lang/String;JJJI)V

    .line 155
    return-void
.end method
