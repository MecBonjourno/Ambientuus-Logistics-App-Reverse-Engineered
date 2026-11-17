.class public Lorg/chromium/net/impl/CronetLibraryLoader;
.super Ljava/lang/Object;
.source "CronetLibraryLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/CronetLibraryLoader$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "cronet"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final LIBRARY_NAME:Ljava/lang/String;

.field public static final LOG_FLAG_NAME:Ljava/lang/String; = "Cronet_log_me"

.field public static final TAG:Ljava/lang/String;

.field private static sHttpFlags:Lorg/chromium/net/httpflags/ResolvedFlags;

.field private static final sHttpFlagsLoaded:Landroid/os/ConditionVariable;

.field private static final sInitThread:Landroid/os/HandlerThread;

.field private static volatile sInitThreadInitDone:Z

.field private static volatile sLibraryLoaded:Z

.field private static final sLoadLock:Ljava/lang/Object;

.field private static final sWaitForLibLoad:Landroid/os/ConditionVariable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 30
    nop

    .line 34
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sLoadLock:Ljava/lang/Object;

    .line 35
    invoke-static {}, Lorg/chromium/net/impl/ImplVersion;->getCronetVersion()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cronet."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->LIBRARY_NAME:Ljava/lang/String;

    .line 37
    const-class v0, Lorg/chromium/net/impl/CronetLibraryLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->TAG:Ljava/lang/String;

    .line 41
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "CronetInit"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sInitThread:Landroid/os/HandlerThread;

    .line 48
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    sput-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sWaitForLibLoad:Landroid/os/ConditionVariable;

    .line 50
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    sput-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sHttpFlagsLoaded:Landroid/os/ConditionVariable;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ensureInitialized(Landroid/content/Context;Lorg/chromium/net/impl/CronetEngineBuilderImpl;)V
    .locals 8
    .param p0, "applicationContext"    # Landroid/content/Context;
    .param p1, "builder"    # Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 62
    sget-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sLoadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 63
    :try_start_0
    sget-boolean v1, Lorg/chromium/net/impl/CronetLibraryLoader;->sInitThreadInitDone:Z

    if-nez v1, :cond_1

    .line 64
    invoke-static {p0}, Lorg/chromium/base/ContextUtils;->initApplicationContext(Landroid/content/Context;)V

    .line 65
    sget-object v1, Lorg/chromium/net/impl/CronetLibraryLoader;->sInitThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 66
    sget-object v1, Lorg/chromium/net/impl/CronetLibraryLoader;->sInitThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 68
    :cond_0
    new-instance v1, Lorg/chromium/net/impl/CronetLibraryLoader$1;

    invoke-direct {v1}, Lorg/chromium/net/impl/CronetLibraryLoader$1;-><init>()V

    invoke-static {v1}, Lorg/chromium/net/impl/CronetLibraryLoader;->postToInitThread(Ljava/lang/Runnable;)V

    .line 75
    :cond_1
    sget-boolean v1, Lorg/chromium/net/impl/CronetLibraryLoader;->sLibraryLoaded:Z

    if-nez v1, :cond_4

    .line 76
    invoke-virtual {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->libraryLoader()Lorg/chromium/net/impl/VersionSafeCallbacks$LibraryLoader;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 77
    invoke-virtual {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->libraryLoader()Lorg/chromium/net/impl/VersionSafeCallbacks$LibraryLoader;

    move-result-object v1

    sget-object v2, Lorg/chromium/net/impl/CronetLibraryLoader;->LIBRARY_NAME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/chromium/net/impl/VersionSafeCallbacks$LibraryLoader;->loadLibrary(Ljava/lang/String;)V

    goto :goto_0

    .line 79
    :cond_2
    sget-object v1, Lorg/chromium/net/impl/CronetLibraryLoader;->LIBRARY_NAME:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 81
    :goto_0
    invoke-static {}, Lorg/chromium/net/impl/ImplVersion;->getCronetVersion()Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, "implVersion":Ljava/lang/String;
    invoke-static {}, Lorg/chromium/net/impl/CronetLibraryLoaderJni;->get()Lorg/chromium/net/impl/CronetLibraryLoader$Natives;

    move-result-object v2

    invoke-interface {v2}, Lorg/chromium/net/impl/CronetLibraryLoader$Natives;->getCronetVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    .line 87
    sget-object v2, Lorg/chromium/net/impl/CronetLibraryLoader;->TAG:Ljava/lang/String;

    const-string v4, "Cronet version: %s, arch: %s"

    const-string v5, "os.arch"

    .line 88
    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 87
    invoke-static {v2, v4, v1, v5}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 89
    invoke-static {}, Lorg/chromium/net/impl/CronetLibraryLoader;->setNativeLoggingLevel()V

    .line 90
    sput-boolean v3, Lorg/chromium/net/impl/CronetLibraryLoader;->sLibraryLoaded:Z

    .line 91
    sget-object v2, Lorg/chromium/net/impl/CronetLibraryLoader;->sWaitForLibLoad:Landroid/os/ConditionVariable;

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->open()V

    goto :goto_1

    .line 83
    :cond_3
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v4, "Expected Cronet version number %s, actual version number %s."

    .line 85
    invoke-static {}, Lorg/chromium/net/impl/CronetLibraryLoaderJni;->get()Lorg/chromium/net/impl/CronetLibraryLoader$Natives;

    move-result-object v5

    invoke-interface {v5}, Lorg/chromium/net/impl/CronetLibraryLoader$Natives;->getCronetVersion()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    aput-object v5, v6, v3

    .line 83
    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local p0    # "applicationContext":Landroid/content/Context;
    .end local p1    # "builder":Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    throw v2

    .line 93
    .end local v1    # "implVersion":Ljava/lang/String;
    .restart local p0    # "applicationContext":Landroid/content/Context;
    .restart local p1    # "builder":Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    :cond_4
    :goto_1
    monitor-exit v0

    .line 94
    return-void

    .line 93
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static ensureInitializedFromNative()V
    .locals 2

    .line 229
    sget-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sLoadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 230
    const/4 v1, 0x1

    :try_start_0
    sput-boolean v1, Lorg/chromium/net/impl/CronetLibraryLoader;->sLibraryLoaded:Z

    .line 231
    sget-object v1, Lorg/chromium/net/impl/CronetLibraryLoader;->sWaitForLibLoad:Landroid/os/ConditionVariable;

    invoke-virtual {v1}, Landroid/os/ConditionVariable;->open()V

    .line 232
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 236
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 237
    .local v0, "applicationContext":Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 238
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/net/impl/CronetLibraryLoader;->ensureInitialized(Landroid/content/Context;Lorg/chromium/net/impl/CronetEngineBuilderImpl;)V

    .line 239
    return-void

    .line 237
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 232
    .end local v0    # "applicationContext":Landroid/content/Context;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method static ensureInitializedOnInitThread()V
    .locals 6

    .line 129
    invoke-static {}, Lorg/chromium/net/impl/CronetLibraryLoader;->onInitThread()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 130
    sget-boolean v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sInitThreadInitDone:Z

    if-eqz v0, :cond_0

    .line 131
    return-void

    .line 136
    :cond_0
    sget-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sHttpFlags:Lorg/chromium/net/httpflags/ResolvedFlags;

    if-nez v0, :cond_4

    .line 137
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 138
    .local v0, "applicationContext":Landroid/content/Context;
    invoke-static {v0}, Lorg/chromium/net/httpflags/HttpFlagsLoader;->load(Landroid/content/Context;)Lorg/chromium/net/httpflags/Flags;

    move-result-object v1

    .line 139
    .local v1, "flags":Lorg/chromium/net/httpflags/Flags;
    if-eqz v1, :cond_1

    move-object v2, v1

    goto :goto_0

    :cond_1
    invoke-static {}, Lorg/chromium/net/httpflags/Flags;->newBuilder()Lorg/chromium/net/httpflags/Flags$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lorg/chromium/net/httpflags/Flags$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    check-cast v2, Lorg/chromium/net/httpflags/Flags;

    .line 140
    :goto_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lorg/chromium/net/impl/ImplVersion;->getCronetVersion()Ljava/lang/String;

    move-result-object v4

    .line 139
    invoke-static {v2, v3, v4}, Lorg/chromium/net/httpflags/ResolvedFlags;->resolve(Lorg/chromium/net/httpflags/Flags;Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/httpflags/ResolvedFlags;

    move-result-object v2

    sput-object v2, Lorg/chromium/net/impl/CronetLibraryLoader;->sHttpFlags:Lorg/chromium/net/httpflags/ResolvedFlags;

    .line 141
    sget-object v2, Lorg/chromium/net/impl/CronetLibraryLoader;->sHttpFlagsLoaded:Landroid/os/ConditionVariable;

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->open()V

    .line 142
    sget-object v2, Lorg/chromium/net/impl/CronetLibraryLoader;->sHttpFlags:Lorg/chromium/net/httpflags/ResolvedFlags;

    invoke-virtual {v2}, Lorg/chromium/net/httpflags/ResolvedFlags;->flags()Ljava/util/Map;

    move-result-object v2

    const-string v3, "Cronet_log_me"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    .line 143
    .local v2, "logMe":Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    if-eqz v2, :cond_2

    .line 144
    sget-object v3, Lorg/chromium/net/impl/CronetLibraryLoader;->TAG:Ljava/lang/String;

    const-string v4, "HTTP flags log line: %s"

    invoke-virtual {v2}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getStringValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 147
    :cond_2
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->init()Lorg/chromium/net/NetworkChangeNotifier;

    .line 153
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->registerToReceiveNotificationsAlways()V

    .line 155
    sget-object v3, Lorg/chromium/net/impl/CronetLibraryLoader;->sWaitForLibLoad:Landroid/os/ConditionVariable;

    invoke-virtual {v3}, Landroid/os/ConditionVariable;->block()V

    .line 156
    sget-boolean v3, Lorg/chromium/net/impl/CronetLibraryLoader;->sLibraryLoaded:Z

    if-eqz v3, :cond_3

    .line 166
    invoke-static {}, Lorg/chromium/net/impl/CronetLibraryLoaderJni;->get()Lorg/chromium/net/impl/CronetLibraryLoader$Natives;

    move-result-object v3

    invoke-interface {v3}, Lorg/chromium/net/impl/CronetLibraryLoader$Natives;->cronetInitOnInitThread()V

    .line 167
    const/4 v3, 0x1

    sput-boolean v3, Lorg/chromium/net/impl/CronetLibraryLoader;->sInitThreadInitDone:Z

    .line 168
    return-void

    .line 156
    :cond_3
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 136
    .end local v0    # "applicationContext":Landroid/content/Context;
    .end local v1    # "flags":Lorg/chromium/net/httpflags/Flags;
    .end local v2    # "logMe":Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 129
    :cond_5
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static getBaseFeatureOverrides()[B
    .locals 1

    .line 194
    sget-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sHttpFlagsLoaded:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 195
    sget-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sHttpFlags:Lorg/chromium/net/httpflags/ResolvedFlags;

    invoke-static {v0}, Lorg/chromium/net/httpflags/BaseFeature;->getOverrides(Lorg/chromium/net/httpflags/ResolvedFlags;)Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method private static getDefaultUserAgent()Ljava/lang/String;
    .locals 1

    .line 208
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/net/impl/UserAgent;->from(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static onInitThread()Z
    .locals 2

    .line 120
    sget-object v0, Lorg/chromium/net/impl/CronetLibraryLoader;->sInitThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static postToInitThread(Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 174
    invoke-static {}, Lorg/chromium/net/impl/CronetLibraryLoader;->onInitThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 177
    :cond_0
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lorg/chromium/net/impl/CronetLibraryLoader;->sInitThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 179
    :goto_0
    return-void
.end method

.method private static setNativeLoggingLevel()V
    .locals 3

    .line 98
    const-string v0, "chromium"

    .line 104
    .local v0, "nativeLogTag":Ljava/lang/String;
    const/4 v1, 0x2

    const-string v2, "chromium"

    invoke-static {v2, v1}, Lorg/chromium/base/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 105
    const/4 v1, -0x2

    .local v1, "loggingLevel":I
    goto :goto_0

    .line 106
    .end local v1    # "loggingLevel":I
    :cond_0
    const/4 v1, 0x3

    invoke-static {v2, v1}, Lorg/chromium/base/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 107
    const/4 v1, -0x1

    .line 113
    .restart local v1    # "loggingLevel":I
    :goto_0
    invoke-static {}, Lorg/chromium/net/impl/CronetLibraryLoaderJni;->get()Lorg/chromium/net/impl/CronetLibraryLoader$Natives;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/chromium/net/impl/CronetLibraryLoader$Natives;->setMinLogLevel(I)V

    .line 114
    return-void

    .line 111
    .end local v1    # "loggingLevel":I
    :cond_1
    return-void
.end method

.method private static setNetworkThreadPriorityOnNetworkThread(I)V
    .locals 0
    .param p0, "priority"    # I

    .line 243
    invoke-static {p0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 244
    return-void
.end method
