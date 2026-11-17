.class final Lorg/chromium/base/metrics/NativeUmaRecorder;
.super Ljava/lang/Object;
.source "NativeUmaRecorder.java"

# interfaces
.implements Lorg/chromium/base/metrics/UmaRecorder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base::android"
.end annotation

.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mNativeHints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mUserActionTestingCallbackNativePtrs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 25
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    invoke-static {v0}, Lj$/util/DesugarCollections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/metrics/NativeUmaRecorder;->mNativeHints:Ljava/util/Map;

    .line 34
    return-void
.end method

.method private getNativeHint(Ljava/lang/String;)J
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 125
    iget-object v0, p0, Lorg/chromium/base/metrics/NativeUmaRecorder;->mNativeHints:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 130
    .local v0, "hint":Ljava/lang/Long;
    if-nez v0, :cond_0

    const-wide/16 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_0
    return-wide v1
.end method

.method private maybeUpdateNativeHint(Ljava/lang/String;JJ)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "oldHint"    # J
    .param p4, "newHint"    # J

    .line 134
    cmp-long v0, p2, p4

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lorg/chromium/base/metrics/NativeUmaRecorder;->mNativeHints:Ljava/util/Map;

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    :cond_0
    return-void
.end method


# virtual methods
.method public addUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 101
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/String;>;"
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->addActionCallbackForTesting(Lorg/chromium/base/Callback;)J

    move-result-wide v0

    .line 102
    .local v0, "ptr":J
    iget-object v2, p0, Lorg/chromium/base/metrics/NativeUmaRecorder;->mUserActionTestingCallbackNativePtrs:Ljava/util/Map;

    if-nez v2, :cond_0

    .line 103
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-static {v2}, Lj$/util/DesugarCollections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    iput-object v2, p0, Lorg/chromium/base/metrics/NativeUmaRecorder;->mUserActionTestingCallbackNativePtrs:Ljava/util/Map;

    .line 105
    :cond_0
    iget-object v2, p0, Lorg/chromium/base/metrics/NativeUmaRecorder;->mUserActionTestingCallbackNativePtrs:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    return-void
.end method

.method public getHistogramSamplesForTesting(Ljava/lang/String;)Ljava/util/List;
    .locals 8
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

    .line 88
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->getHistogramSamplesForTesting(Ljava/lang/String;)[J

    move-result-object v0

    .line 89
    .local v0, "samplesArray":[J
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 90
    .local v1, "buckets":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/metrics/HistogramBucket;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 91
    aget-wide v3, v0, v2

    long-to-int v3, v3

    .line 92
    .local v3, "min":I
    add-int/lit8 v4, v2, 0x1

    aget-wide v4, v0, v4

    .line 93
    .local v4, "max":J
    add-int/lit8 v6, v2, 0x2

    aget-wide v6, v0, v6

    long-to-int v6, v6

    .line 94
    .local v6, "count":I
    new-instance v7, Lorg/chromium/base/metrics/HistogramBucket;

    invoke-direct {v7, v3, v4, v5, v6}, Lorg/chromium/base/metrics/HistogramBucket;-><init>(IJI)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .end local v3    # "min":I
    .end local v4    # "max":J
    .end local v6    # "count":I
    add-int/lit8 v2, v2, 0x3

    goto :goto_0

    .line 96
    .end local v2    # "i":I
    :cond_0
    return-object v1
.end method

.method public getHistogramTotalCountForTesting(Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 83
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-interface {v0, p1, v1, v2}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->getHistogramTotalCountForTesting(Ljava/lang/String;J)I

    move-result v0

    return v0
.end method

.method public getHistogramValueCountForTesting(Ljava/lang/String;I)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I

    .line 78
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-interface {v0, p1, p2, v1, v2}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->getHistogramValueCountForTesting(Ljava/lang/String;IJ)I

    move-result v0

    return v0
.end method

.method public recordBooleanHistogram(Ljava/lang/String;Z)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # Z

    .line 40
    invoke-direct {p0, p1}, Lorg/chromium/base/metrics/NativeUmaRecorder;->getNativeHint(Ljava/lang/String;)J

    move-result-wide v2

    .line 41
    .local v2, "oldHint":J
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v0

    invoke-interface {v0, p1, v2, v3, p2}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->recordBooleanHistogram(Ljava/lang/String;JZ)J

    move-result-wide v4

    .line 42
    .local v4, "newHint":J
    move-object v0, p0

    move-object v1, p1

    .end local p1    # "name":Ljava/lang/String;
    .local v1, "name":Ljava/lang/String;
    invoke-direct/range {v0 .. v5}, Lorg/chromium/base/metrics/NativeUmaRecorder;->maybeUpdateNativeHint(Ljava/lang/String;JJ)V

    .line 43
    return-void
.end method

.method public recordExponentialHistogram(Ljava/lang/String;IIII)V
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I
    .param p3, "min"    # I
    .param p4, "max"    # I
    .param p5, "numBuckets"    # I

    .line 48
    invoke-direct {p0, p1}, Lorg/chromium/base/metrics/NativeUmaRecorder;->getNativeHint(Ljava/lang/String;)J

    move-result-wide v2

    .line 49
    .local v2, "oldHint":J
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v0

    move-object v1, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "sample":I
    .end local p3    # "min":I
    .end local p4    # "max":I
    .end local p5    # "numBuckets":I
    .local v1, "name":Ljava/lang/String;
    .local v4, "sample":I
    .local v5, "min":I
    .local v6, "max":I
    .local v7, "numBuckets":I
    invoke-interface/range {v0 .. v7}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->recordExponentialHistogram(Ljava/lang/String;JIIII)J

    move-result-wide p1

    .line 51
    move p3, v4

    move p4, v5

    .end local v4    # "sample":I
    .end local v5    # "min":I
    .local p1, "newHint":J
    .local p3, "sample":I
    .local p4, "min":I
    move-object v0, p0

    move-wide v4, p1

    .end local p1    # "newHint":J
    .local v4, "newHint":J
    invoke-direct/range {v0 .. v5}, Lorg/chromium/base/metrics/NativeUmaRecorder;->maybeUpdateNativeHint(Ljava/lang/String;JJ)V

    .line 52
    return-void
.end method

.method public recordLinearHistogram(Ljava/lang/String;IIII)V
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I
    .param p3, "min"    # I
    .param p4, "max"    # I
    .param p5, "numBuckets"    # I

    .line 56
    invoke-direct {p0, p1}, Lorg/chromium/base/metrics/NativeUmaRecorder;->getNativeHint(Ljava/lang/String;)J

    move-result-wide v2

    .line 57
    .local v2, "oldHint":J
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v0

    move-object v1, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "sample":I
    .end local p3    # "min":I
    .end local p4    # "max":I
    .end local p5    # "numBuckets":I
    .local v1, "name":Ljava/lang/String;
    .local v4, "sample":I
    .local v5, "min":I
    .local v6, "max":I
    .local v7, "numBuckets":I
    invoke-interface/range {v0 .. v7}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->recordLinearHistogram(Ljava/lang/String;JIIII)J

    move-result-wide p1

    .line 59
    move p3, v4

    move p4, v5

    .end local v4    # "sample":I
    .end local v5    # "min":I
    .local p1, "newHint":J
    .local p3, "sample":I
    .local p4, "min":I
    move-object v0, p0

    move-wide v4, p1

    .end local p1    # "newHint":J
    .local v4, "newHint":J
    invoke-direct/range {v0 .. v5}, Lorg/chromium/base/metrics/NativeUmaRecorder;->maybeUpdateNativeHint(Ljava/lang/String;JJ)V

    .line 60
    return-void
.end method

.method public recordSparseHistogram(Ljava/lang/String;I)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I

    .line 64
    invoke-direct {p0, p1}, Lorg/chromium/base/metrics/NativeUmaRecorder;->getNativeHint(Ljava/lang/String;)J

    move-result-wide v2

    .line 65
    .local v2, "oldHint":J
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v0

    invoke-interface {v0, p1, v2, v3, p2}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->recordSparseHistogram(Ljava/lang/String;JI)J

    move-result-wide v4

    .line 66
    .local v4, "newHint":J
    move-object v0, p0

    move-object v1, p1

    .end local p1    # "name":Ljava/lang/String;
    .local v1, "name":Ljava/lang/String;
    invoke-direct/range {v0 .. v5}, Lorg/chromium/base/metrics/NativeUmaRecorder;->maybeUpdateNativeHint(Ljava/lang/String;JJ)V

    .line 67
    return-void
.end method

.method public recordUserAction(Ljava/lang/String;J)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "elapsedRealtimeMillis"    # J

    .line 72
    invoke-static {}, Lorg/chromium/base/TimeUtils;->elapsedRealtimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p2

    .line 73
    .local v0, "millisSinceEvent":J
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v2

    invoke-interface {v2, p1, v0, v1}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->recordUserAction(Ljava/lang/String;J)V

    .line 74
    return-void
.end method

.method public removeUserActionCallbackForTesting(Lorg/chromium/base/Callback;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/Callback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 110
    .local p1, "callback":Lorg/chromium/base/Callback;, "Lorg/chromium/base/Callback<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/chromium/base/metrics/NativeUmaRecorder;->mUserActionTestingCallbackNativePtrs:Ljava/util/Map;

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lorg/chromium/base/metrics/NativeUmaRecorder;->mUserActionTestingCallbackNativePtrs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 116
    .local v0, "ptr":Ljava/lang/Long;
    if-eqz v0, :cond_0

    .line 121
    invoke-static {}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;->removeActionCallbackForTesting(J)V

    .line 122
    return-void

    .line 117
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Attempting to remove a user action callback that was never previously registered."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 111
    .end local v0    # "ptr":Ljava/lang/Long;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Attempting to remove a user action callback without previously registering any."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
