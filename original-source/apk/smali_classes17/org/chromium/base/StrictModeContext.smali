.class public final Lorg/chromium/base/StrictModeContext;
.super Ljava/lang/Object;
.source "StrictModeContext.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private final mThreadPolicy:Landroid/os/StrictMode$ThreadPolicy;

.field private final mVmPolicy:Landroid/os/StrictMode$VmPolicy;


# direct methods
.method private constructor <init>(Landroid/os/StrictMode$ThreadPolicy;)V
    .locals 1
    .param p1, "threadPolicy"    # Landroid/os/StrictMode$ThreadPolicy;

    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/chromium/base/StrictModeContext;-><init>(Landroid/os/StrictMode$ThreadPolicy;Landroid/os/StrictMode$VmPolicy;)V

    .line 39
    return-void
.end method

.method private constructor <init>(Landroid/os/StrictMode$ThreadPolicy;Landroid/os/StrictMode$VmPolicy;)V
    .locals 3
    .param p1, "threadPolicy"    # Landroid/os/StrictMode$ThreadPolicy;
    .param p2, "vmPolicy"    # Landroid/os/StrictMode$VmPolicy;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    int-to-long v0, v0

    const-string v2, "StrictModeContext"

    invoke-static {v2, v0, v1}, Lorg/chromium/base/TraceEvent;->startAsync(Ljava/lang/String;J)V

    .line 33
    iput-object p1, p0, Lorg/chromium/base/StrictModeContext;->mThreadPolicy:Landroid/os/StrictMode$ThreadPolicy;

    .line 34
    iput-object p2, p0, Lorg/chromium/base/StrictModeContext;->mVmPolicy:Landroid/os/StrictMode$VmPolicy;

    .line 35
    return-void
.end method

.method private constructor <init>(Landroid/os/StrictMode$VmPolicy;)V
    .locals 1
    .param p1, "vmPolicy"    # Landroid/os/StrictMode$VmPolicy;

    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/chromium/base/StrictModeContext;-><init>(Landroid/os/StrictMode$ThreadPolicy;Landroid/os/StrictMode$VmPolicy;)V

    .line 43
    return-void
.end method

.method public static allowAllThreadPolicies()Lorg/chromium/base/StrictModeContext;
    .locals 3

    .line 64
    const-string v0, "StrictModeContext.allowAllThreadPolicies"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 65
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Landroid/os/StrictMode;->getThreadPolicy()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 66
    .local v1, "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    sget-object v2, Landroid/os/StrictMode$ThreadPolicy;->LAX:Landroid/os/StrictMode$ThreadPolicy;

    invoke-static {v2}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 67
    new-instance v2, Lorg/chromium/base/StrictModeContext;

    invoke-direct {v2, v1}, Lorg/chromium/base/StrictModeContext;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 67
    :cond_0
    return-object v2

    .line 64
    .end local v1    # "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method

.method public static allowAllVmPolicies()Lorg/chromium/base/StrictModeContext;
    .locals 3

    .line 51
    const-string v0, "StrictModeContext.allowAllVmPolicies"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 52
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Landroid/os/StrictMode;->getVmPolicy()Landroid/os/StrictMode$VmPolicy;

    move-result-object v1

    .line 53
    .local v1, "oldPolicy":Landroid/os/StrictMode$VmPolicy;
    sget-object v2, Landroid/os/StrictMode$VmPolicy;->LAX:Landroid/os/StrictMode$VmPolicy;

    invoke-static {v2}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V

    .line 54
    new-instance v2, Lorg/chromium/base/StrictModeContext;

    invoke-direct {v2, v1}, Lorg/chromium/base/StrictModeContext;-><init>(Landroid/os/StrictMode$VmPolicy;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 54
    :cond_0
    return-object v2

    .line 51
    .end local v1    # "oldPolicy":Landroid/os/StrictMode$VmPolicy;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method

.method public static allowDiskReads()Lorg/chromium/base/StrictModeContext;
    .locals 3

    .line 85
    const-string v0, "StrictModeContext.allowDiskReads"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 86
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 87
    .local v1, "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    new-instance v2, Lorg/chromium/base/StrictModeContext;

    invoke-direct {v2, v1}, Lorg/chromium/base/StrictModeContext;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 87
    :cond_0
    return-object v2

    .line 85
    .end local v1    # "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method

.method public static allowDiskWrites()Lorg/chromium/base/StrictModeContext;
    .locals 3

    .line 75
    const-string v0, "StrictModeContext.allowDiskWrites"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 76
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskWrites()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 77
    .local v1, "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    new-instance v2, Lorg/chromium/base/StrictModeContext;

    invoke-direct {v2, v1}, Lorg/chromium/base/StrictModeContext;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 77
    :cond_0
    return-object v2

    .line 75
    .end local v1    # "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method

.method public static allowSlowCalls()Lorg/chromium/base/StrictModeContext;
    .locals 3

    .line 95
    const-string v0, "StrictModeContext.allowSlowCalls"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 96
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Landroid/os/StrictMode;->getThreadPolicy()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 97
    .local v1, "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    new-instance v2, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v2, v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 98
    invoke-virtual {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitCustomSlowCalls()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v2

    .line 97
    invoke-static {v2}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 99
    new-instance v2, Lorg/chromium/base/StrictModeContext;

    invoke-direct {v2, v1}, Lorg/chromium/base/StrictModeContext;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 99
    :cond_0
    return-object v2

    .line 95
    .end local v1    # "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method

.method public static allowUnbufferedIo()Lorg/chromium/base/StrictModeContext;
    .locals 4

    .line 110
    const-string v0, "StrictModeContext.allowUnbufferedIo"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    .line 111
    .local v0, "e":Lorg/chromium/base/TraceEvent;
    :try_start_0
    invoke-static {}, Landroid/os/StrictMode;->getThreadPolicy()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 112
    .local v1, "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_0

    .line 113
    new-instance v2, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v2, v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 114
    invoke-virtual {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitUnbufferedIo()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v2

    .line 115
    invoke-virtual {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v2

    .line 113
    invoke-static {v2}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 117
    :cond_0
    new-instance v2, Lorg/chromium/base/StrictModeContext;

    invoke-direct {v2, v1}, Lorg/chromium/base/StrictModeContext;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    .line 117
    :cond_1
    return-object v2

    .line 110
    .end local v1    # "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v1
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 123
    iget-object v0, p0, Lorg/chromium/base/StrictModeContext;->mThreadPolicy:Landroid/os/StrictMode$ThreadPolicy;

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lorg/chromium/base/StrictModeContext;->mThreadPolicy:Landroid/os/StrictMode$ThreadPolicy;

    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 126
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/StrictModeContext;->mVmPolicy:Landroid/os/StrictMode$VmPolicy;

    if-eqz v0, :cond_1

    .line 127
    iget-object v0, p0, Lorg/chromium/base/StrictModeContext;->mVmPolicy:Landroid/os/StrictMode$VmPolicy;

    invoke-static {v0}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V

    .line 129
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    int-to-long v0, v0

    const-string v2, "StrictModeContext"

    invoke-static {v2, v0, v1}, Lorg/chromium/base/TraceEvent;->finishAsync(Ljava/lang/String;J)V

    .line 130
    return-void
.end method
