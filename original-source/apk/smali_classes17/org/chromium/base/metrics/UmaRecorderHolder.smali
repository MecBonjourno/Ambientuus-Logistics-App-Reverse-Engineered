.class public Lorg/chromium/base/metrics/UmaRecorderHolder;
.super Ljava/lang/Object;
.source "UmaRecorderHolder.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static sNativeInitialized:Z

.field private static sRecorder:Lorg/chromium/base/metrics/CachingUmaRecorder;

.field private static sSetUpNativeUmaRecorder:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 8
    nop

    .line 12
    new-instance v0, Lorg/chromium/base/metrics/CachingUmaRecorder;

    invoke-direct {v0}, Lorg/chromium/base/metrics/CachingUmaRecorder;-><init>()V

    sput-object v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sRecorder:Lorg/chromium/base/metrics/CachingUmaRecorder;

    .line 15
    const/4 v0, 0x1

    sput-boolean v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sSetUpNativeUmaRecorder:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()Lorg/chromium/base/metrics/UmaRecorder;
    .locals 1

    .line 22
    sget-object v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sRecorder:Lorg/chromium/base/metrics/CachingUmaRecorder;

    return-object v0
.end method

.method public static onLibraryLoaded()V
    .locals 2

    .line 53
    sget-boolean v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sSetUpNativeUmaRecorder:Z

    if-nez v0, :cond_0

    return-void

    .line 55
    :cond_0
    sget-boolean v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sNativeInitialized:Z

    if-nez v0, :cond_1

    .line 56
    const/4 v0, 0x1

    sput-boolean v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sNativeInitialized:Z

    .line 57
    sget-object v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sRecorder:Lorg/chromium/base/metrics/CachingUmaRecorder;

    new-instance v1, Lorg/chromium/base/metrics/NativeUmaRecorder;

    invoke-direct {v1}, Lorg/chromium/base/metrics/NativeUmaRecorder;-><init>()V

    invoke-virtual {v0, v1}, Lorg/chromium/base/metrics/CachingUmaRecorder;->setDelegate(Lorg/chromium/base/metrics/UmaRecorder;)Lorg/chromium/base/metrics/UmaRecorder;

    .line 58
    return-void

    .line 55
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static resetForTesting()V
    .locals 1

    .line 67
    sget-boolean v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sNativeInitialized:Z

    if-nez v0, :cond_0

    .line 68
    new-instance v0, Lorg/chromium/base/metrics/CachingUmaRecorder;

    invoke-direct {v0}, Lorg/chromium/base/metrics/CachingUmaRecorder;-><init>()V

    sput-object v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sRecorder:Lorg/chromium/base/metrics/CachingUmaRecorder;

    .line 70
    :cond_0
    return-void
.end method

.method public static setNonNativeDelegate(Lorg/chromium/base/metrics/UmaRecorder;)V
    .locals 3
    .param p0, "recorder"    # Lorg/chromium/base/metrics/UmaRecorder;

    .line 35
    sget-object v0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sRecorder:Lorg/chromium/base/metrics/CachingUmaRecorder;

    invoke-virtual {v0, p0}, Lorg/chromium/base/metrics/CachingUmaRecorder;->setDelegate(Lorg/chromium/base/metrics/UmaRecorder;)Lorg/chromium/base/metrics/UmaRecorder;

    move-result-object v0

    .line 36
    .local v0, "previous":Lorg/chromium/base/metrics/UmaRecorder;
    instance-of v1, v0, Lorg/chromium/base/metrics/NativeUmaRecorder;

    if-nez v1, :cond_0

    .line 38
    return-void

    .line 36
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "A NativeUmaRecorder has already been set"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public static setUpNativeUmaRecorder(Z)V
    .locals 0
    .param p0, "setUpNativeUmaRecorder"    # Z

    .line 46
    sput-boolean p0, Lorg/chromium/base/metrics/UmaRecorderHolder;->sSetUpNativeUmaRecorder:Z

    .line 47
    return-void
.end method
