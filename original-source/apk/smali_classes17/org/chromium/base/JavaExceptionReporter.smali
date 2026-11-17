.class public Lorg/chromium/base/JavaExceptionReporter;
.super Ljava/lang/Object;
.source "JavaExceptionReporter.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/JavaExceptionReporter$Natives;
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
.field private final mCrashAfterReport:Z

.field private mHandlingException:Z

.field private final mParent:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 21
    return-void
.end method

.method private constructor <init>(Ljava/lang/Thread$UncaughtExceptionHandler;Z)V
    .locals 0
    .param p1, "parent"    # Ljava/lang/Thread$UncaughtExceptionHandler;
    .param p2, "crashAfterReport"    # Z

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/chromium/base/JavaExceptionReporter;->mParent:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 31
    iput-boolean p2, p0, Lorg/chromium/base/JavaExceptionReporter;->mCrashAfterReport:Z

    .line 32
    return-void
.end method

.method private static installHandler(Z)V
    .locals 2
    .param p0, "crashAfterReport"    # Z

    .line 74
    new-instance v0, Lorg/chromium/base/JavaExceptionReporter;

    .line 75
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lorg/chromium/base/JavaExceptionReporter;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;Z)V

    .line 74
    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 76
    return-void
.end method

.method public static reportException(Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "exception"    # Ljava/lang/Throwable;

    .line 68
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->runningOnUiThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    invoke-static {}, Lorg/chromium/base/JavaExceptionReporterJni;->get()Lorg/chromium/base/JavaExceptionReporter$Natives;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1, p0}, Lorg/chromium/base/JavaExceptionReporter$Natives;->reportJavaException(ZLjava/lang/Throwable;)V

    .line 70
    return-void

    .line 68
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static reportStackTrace(Ljava/lang/String;)V
    .locals 2
    .param p0, "stackTrace"    # Ljava/lang/String;

    .line 54
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->runningOnUiThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    invoke-static {}, Lorg/chromium/base/JavaExceptionReporterJni;->get()Lorg/chromium/base/JavaExceptionReporter$Natives;

    move-result-object v0

    .line 56
    invoke-static {p0}, Lorg/chromium/base/PiiElider;->sanitizeStacktrace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 55
    invoke-interface {v0, v1}, Lorg/chromium/base/JavaExceptionReporter$Natives;->reportJavaStackTrace(Ljava/lang/String;)V

    .line 57
    return-void

    .line 54
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Thread;
    .param p2, "e"    # Ljava/lang/Throwable;

    .line 36
    iget-boolean v0, p0, Lorg/chromium/base/JavaExceptionReporter;->mHandlingException:Z

    if-nez v0, :cond_0

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/base/JavaExceptionReporter;->mHandlingException:Z

    .line 38
    invoke-static {}, Lorg/chromium/base/JavaExceptionReporterJni;->get()Lorg/chromium/base/JavaExceptionReporter$Natives;

    move-result-object v0

    iget-boolean v1, p0, Lorg/chromium/base/JavaExceptionReporter;->mCrashAfterReport:Z

    invoke-interface {v0, v1, p2}, Lorg/chromium/base/JavaExceptionReporter$Natives;->reportJavaException(ZLjava/lang/Throwable;)V

    .line 40
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/JavaExceptionReporter;->mParent:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_1

    .line 41
    iget-object v0, p0, Lorg/chromium/base/JavaExceptionReporter;->mParent:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 43
    :cond_1
    return-void
.end method
