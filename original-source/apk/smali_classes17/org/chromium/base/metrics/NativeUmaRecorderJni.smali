.class public Lorg/chromium/base/metrics/NativeUmaRecorderJni;
.super Ljava/lang/Object;
.source "NativeUmaRecorderJni.java"

# interfaces
.implements Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;


# static fields
.field public static final TEST_HOOKS:Lorg/jni_zero/JniStaticTestMocker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jni_zero/JniStaticTestMocker<",
            "Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;",
            ">;"
        }
    .end annotation
.end field

.field private static testInstance:Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;


# direct methods
.method static bridge synthetic -$$Nest$sfputtestInstance(Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;)V
    .locals 0

    sput-object p0, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->testInstance:Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 25
    new-instance v0, Lorg/chromium/base/metrics/NativeUmaRecorderJni$1;

    invoke-direct {v0}, Lorg/chromium/base/metrics/NativeUmaRecorderJni$1;-><init>()V

    sput-object v0, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->TEST_HOOKS:Lorg/jni_zero/JniStaticTestMocker;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;
    .locals 2

    .line 98
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->TESTING_ENABLED:Z

    if-eqz v0, :cond_2

    .line 99
    sget-object v0, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->testInstance:Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    if-eqz v0, :cond_0

    .line 100
    sget-object v0, Lorg/chromium/base/metrics/NativeUmaRecorderJni;->testInstance:Lorg/chromium/base/metrics/NativeUmaRecorder$Natives;

    return-object v0

    .line 102
    :cond_0
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->REQUIRE_MOCK:Z

    if-nez v0, :cond_1

    goto :goto_0

    .line 103
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "No mock found for the native implementation of NativeUmaRecorder.Natives. The current configuration requires implementations be mocked."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_2
    :goto_0
    invoke-static {}, Lorg/jni_zero/NativeLibraryLoadedStatus;->checkLoaded()V

    .line 109
    new-instance v0, Lorg/chromium/base/metrics/NativeUmaRecorderJni;

    invoke-direct {v0}, Lorg/chromium/base/metrics/NativeUmaRecorderJni;-><init>()V

    return-object v0
.end method


# virtual methods
.method public addActionCallbackForTesting(Lorg/chromium/base/Callback;)J
    .locals 2
    .param p1, "callback"    # Lorg/chromium/base/Callback;

    .line 39
    invoke-static {p1}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_addActionCallbackForTesting(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public createHistogramSnapshotForTesting()J
    .locals 2

    .line 44
    invoke-static {}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_createHistogramSnapshotForTesting()J

    move-result-wide v0

    return-wide v0
.end method

.method public destroyHistogramSnapshotForTesting(J)V
    .locals 0
    .param p1, "snapshotPtr"    # J

    .line 49
    invoke-static {p1, p2}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_destroyHistogramSnapshotForTesting(J)V

    .line 50
    return-void
.end method

.method public getHistogramSamplesForTesting(Ljava/lang/String;)[J
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 54
    invoke-static {p1}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_getHistogramSamplesForTesting(Ljava/lang/String;)[J

    move-result-object v0

    return-object v0
.end method

.method public getHistogramTotalCountForTesting(Ljava/lang/String;J)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "snapshotPtr"    # J

    .line 59
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_getHistogramTotalCountForTesting(Ljava/lang/String;J)I

    move-result v0

    return v0
.end method

.method public getHistogramValueCountForTesting(Ljava/lang/String;IJ)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sample"    # I
    .param p3, "snapshotPtr"    # J

    .line 64
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_getHistogramValueCountForTesting(Ljava/lang/String;IJ)I

    move-result v0

    return v0
.end method

.method public recordBooleanHistogram(Ljava/lang/String;JZ)J
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "nativeHint"    # J
    .param p4, "sample"    # Z

    .line 69
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_recordBooleanHistogram(Ljava/lang/String;JZ)J

    move-result-wide v0

    return-wide v0
.end method

.method public recordExponentialHistogram(Ljava/lang/String;JIIII)J
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "nativeHint"    # J
    .param p4, "sample"    # I
    .param p5, "min"    # I
    .param p6, "max"    # I
    .param p7, "numBuckets"    # I

    .line 74
    invoke-static/range {p1 .. p7}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_recordExponentialHistogram(Ljava/lang/String;JIIII)J

    move-result-wide v0

    return-wide v0
.end method

.method public recordLinearHistogram(Ljava/lang/String;JIIII)J
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "nativeHint"    # J
    .param p4, "sample"    # I
    .param p5, "min"    # I
    .param p6, "max"    # I
    .param p7, "numBuckets"    # I

    .line 79
    invoke-static/range {p1 .. p7}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_recordLinearHistogram(Ljava/lang/String;JIIII)J

    move-result-wide v0

    return-wide v0
.end method

.method public recordSparseHistogram(Ljava/lang/String;JI)J
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "nativeHint"    # J
    .param p4, "sample"    # I

    .line 84
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_recordSparseHistogram(Ljava/lang/String;JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public recordUserAction(Ljava/lang/String;J)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "millisSinceEvent"    # J

    .line 89
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_recordUserAction(Ljava/lang/String;J)V

    .line 90
    return-void
.end method

.method public removeActionCallbackForTesting(J)V
    .locals 0
    .param p1, "callbackId"    # J

    .line 94
    invoke-static {p1, p2}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_metrics_NativeUmaRecorder_removeActionCallbackForTesting(J)V

    .line 95
    return-void
.end method
