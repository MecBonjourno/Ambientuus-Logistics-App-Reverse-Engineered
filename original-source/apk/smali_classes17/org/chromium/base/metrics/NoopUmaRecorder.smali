.class Lorg/chromium/base/metrics/NoopUmaRecorder;
.super Ljava/lang/Object;
.source "NoopUmaRecorder.java"

# interfaces
.implements Lorg/chromium/base/metrics/UmaRecorder;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 46
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/String;>;"
    return-void
.end method

.method public getHistogramSamplesForTesting(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
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

    .line 42
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHistogramTotalCountForTesting(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 37
    const/4 v0, 0x0

    return v0
.end method

.method public getHistogramValueCountForTesting(Ljava/lang/String;I)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I

    .line 32
    const/4 v0, 0x0

    return v0
.end method

.method public recordBooleanHistogram(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # Z

    .line 15
    return-void
.end method

.method public recordExponentialHistogram(Ljava/lang/String;IIII)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I
    .param p3, "min"    # I
    .param p4, "max"    # I
    .param p5, "numBuckets"    # I

    .line 19
    return-void
.end method

.method public recordLinearHistogram(Ljava/lang/String;IIII)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I
    .param p3, "min"    # I
    .param p4, "max"    # I
    .param p5, "numBuckets"    # I

    .line 22
    return-void
.end method

.method public recordSparseHistogram(Ljava/lang/String;I)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I

    .line 25
    return-void
.end method

.method public recordUserAction(Ljava/lang/String;J)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "elapsedRealtimeMillis"    # J

    .line 28
    return-void
.end method

.method public removeUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 49
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/String;>;"
    return-void
.end method
