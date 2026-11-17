.class public final Lorg/chromium/base/CommandLineInitUtil;
.super Ljava/lang/Object;
.source "CommandLineInitUtil.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final COMMAND_LINE_FILE_PATH:Ljava/lang/String; = "/data/local"

.field private static final COMMAND_LINE_FILE_PATH_DEBUG_APP:Ljava/lang/String; = "/data/local/tmp"

.field private static sFilenameOverrideForTesting:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 19
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method private static getDebugApp(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 96
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "adb_enabled"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    move v2, v1

    .line 98
    .local v2, "adbEnabled":Z
    :cond_0
    if-eqz v2, :cond_1

    .line 99
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "debug_app"

    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 102
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static initCommandLine(Ljava/lang/String;)V
    .locals 1
    .param p0, "fileName"    # Ljava/lang/String;

    .line 57
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/CommandLineInitUtil;->initCommandLine(Ljava/lang/String;Lorg/chromium/base/supplier/Supplier;)V

    .line 58
    return-void
.end method

.method public static initCommandLine(Ljava/lang/String;Lorg/chromium/base/supplier/Supplier;)V
    .locals 4
    .param p0, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/chromium/base/supplier/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 67
    .local p1, "shouldUseDebugFlags":Lorg/chromium/base/supplier/Supplier;, "Lorg/chromium/base/supplier/Supplier<Ljava/lang/Boolean;>;"
    sget-object v0, Lorg/chromium/base/CommandLineInitUtil;->sFilenameOverrideForTesting:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 68
    sget-object p0, Lorg/chromium/base/CommandLineInitUtil;->sFilenameOverrideForTesting:Ljava/lang/String;

    .line 70
    :cond_0
    invoke-static {}, Lorg/chromium/base/CommandLine;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_3

    .line 71
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/local/tmp"

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .local v0, "commandLineFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    .line 74
    .local v1, "debugFlagsExist":Z
    if-eqz v1, :cond_1

    invoke-static {p1}, Lorg/chromium/base/CommandLineInitUtil;->shouldUseDebugCommandLine(Lorg/chromium/base/supplier/Supplier;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 75
    :cond_1
    new-instance v2, Ljava/io/File;

    const-string v3, "/data/local"

    invoke-direct {v2, v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v2

    .line 77
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/chromium/base/CommandLine;->initFromFile(Ljava/lang/String;)V

    .line 78
    return-void

    .line 70
    .end local v0    # "commandLineFile":Ljava/io/File;
    .end local v1    # "debugFlagsExist":Z
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static setFilenameOverrideForTesting(Ljava/lang/String;)V
    .locals 0
    .param p0, "value"    # Ljava/lang/String;

    .line 49
    sput-object p0, Lorg/chromium/base/CommandLineInitUtil;->sFilenameOverrideForTesting:Ljava/lang/String;

    .line 50
    return-void
.end method

.method private static shouldUseDebugCommandLine(Lorg/chromium/base/supplier/Supplier;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/supplier/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 89
    .local p0, "shouldUseDebugFlags":Lorg/chromium/base/supplier/Supplier;, "Lorg/chromium/base/supplier/Supplier<Ljava/lang/Boolean;>;"
    const/4 v0, 0x1

    if-eqz p0, :cond_0

    invoke-interface {p0}, Lorg/chromium/base/supplier/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    .line 90
    :cond_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 92
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Lorg/chromium/base/CommandLineInitUtil;->getDebugApp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {}, Lorg/chromium/base/BuildInfo;->isDebugAndroid()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_0
    return v0
.end method
