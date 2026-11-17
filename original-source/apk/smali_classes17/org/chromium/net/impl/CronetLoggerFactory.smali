.class public final Lorg/chromium/net/impl/CronetLoggerFactory;
.super Ljava/lang/Object;
.source "CronetLoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/CronetLoggerFactory$SwapLoggerForTesting;
    }
.end annotation


# static fields
.field private static final CRONET_LOGGER_IMPL_CLASS:Ljava/lang/String; = "com.google.net.cronet.telemetry.CronetLoggerImpl"

.field private static final SAMPLE_RATE_PER_SECOND:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field private static final sDefaultLogger:Lorg/chromium/net/impl/CronetLogger;

.field private static sTestingLogger:Lorg/chromium/net/impl/CronetLogger;


# direct methods
.method static bridge synthetic -$$Nest$smsetLoggerForTesting(Lorg/chromium/net/impl/CronetLogger;)V
    .locals 0

    invoke-static {p0}, Lorg/chromium/net/impl/CronetLoggerFactory;->setLoggerForTesting(Lorg/chromium/net/impl/CronetLogger;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-class v0, Lorg/chromium/net/impl/CronetLoggerFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/CronetLoggerFactory;->TAG:Ljava/lang/String;

    .line 24
    new-instance v0, Lorg/chromium/net/impl/NoOpLogger;

    invoke-direct {v0}, Lorg/chromium/net/impl/NoOpLogger;-><init>()V

    sput-object v0, Lorg/chromium/net/impl/CronetLoggerFactory;->sDefaultLogger:Lorg/chromium/net/impl/CronetLogger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createLogger(Landroid/content/Context;Lorg/chromium/net/impl/CronetLogger$CronetSource;)Lorg/chromium/net/impl/CronetLogger;
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "source"    # Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 44
    sget-object v0, Lorg/chromium/net/impl/CronetLoggerFactory;->sTestingLogger:Lorg/chromium/net/impl/CronetLogger;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/chromium/net/impl/CronetLoggerFactory;->sTestingLogger:Lorg/chromium/net/impl/CronetLogger;

    return-object v0

    .line 47
    :cond_0
    invoke-static {p0, p1}, Lorg/chromium/net/impl/CronetManifest;->isAppOptedInForTelemetry(Landroid/content/Context;Lorg/chromium/net/impl/CronetLogger$CronetSource;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_1

    goto :goto_0

    .line 52
    :cond_1
    invoke-static {}, Lorg/chromium/net/impl/CronetLoggerFactory;->fetchLoggerImplClass()Ljava/lang/Class;

    move-result-object v0

    .line 53
    .local v0, "cronetLoggerImplClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/chromium/net/impl/CronetLogger;>;"
    if-nez v0, :cond_2

    sget-object v1, Lorg/chromium/net/impl/CronetLoggerFactory;->sDefaultLogger:Lorg/chromium/net/impl/CronetLogger;

    return-object v1

    .line 56
    :cond_2
    const/4 v1, 0x1

    :try_start_0
    new-array v2, v1, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v3, v1, v4

    .line 56
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/impl/CronetLogger;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 58
    :catch_0
    move-exception v1

    .line 60
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/chromium/net/impl/CronetLoggerFactory;->TAG:Ljava/lang/String;

    const-string v3, "Exception creating an instance of CronetLoggerImpl"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 62
    .end local v1    # "e":Ljava/lang/Exception;
    sget-object v1, Lorg/chromium/net/impl/CronetLoggerFactory;->sDefaultLogger:Lorg/chromium/net/impl/CronetLogger;

    return-object v1

    .line 49
    .end local v0    # "cronetLoggerImplClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/chromium/net/impl/CronetLogger;>;"
    :cond_3
    :goto_0
    sget-object v0, Lorg/chromium/net/impl/CronetLoggerFactory;->sDefaultLogger:Lorg/chromium/net/impl/CronetLogger;

    return-object v0
.end method

.method public static createNoOpLogger()Lorg/chromium/net/impl/CronetLogger;
    .locals 1

    .line 37
    sget-object v0, Lorg/chromium/net/impl/CronetLoggerFactory;->sDefaultLogger:Lorg/chromium/net/impl/CronetLogger;

    return-object v0
.end method

.method private static fetchLoggerImplClass()Ljava/lang/Class;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lorg/chromium/net/impl/CronetLogger;",
            ">;"
        }
    .end annotation

    .line 92
    const-class v0, Lorg/chromium/net/impl/CronetLoggerFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 94
    .local v0, "loader":Ljava/lang/ClassLoader;
    :try_start_0
    const-string v1, "com.google.net.cronet.telemetry.CronetLoggerImpl"

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lorg/chromium/net/impl/CronetLogger;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 95
    :catch_0
    move-exception v1

    .line 96
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/chromium/net/impl/CronetLoggerFactory;->TAG:Ljava/lang/String;

    const-string v3, "Exception fetching LoggerImpl class"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 97
    const/4 v2, 0x0

    return-object v2
.end method

.method private static setLoggerForTesting(Lorg/chromium/net/impl/CronetLogger;)V
    .locals 0
    .param p0, "testingLogger"    # Lorg/chromium/net/impl/CronetLogger;

    .line 66
    sput-object p0, Lorg/chromium/net/impl/CronetLoggerFactory;->sTestingLogger:Lorg/chromium/net/impl/CronetLogger;

    .line 67
    return-void
.end method
