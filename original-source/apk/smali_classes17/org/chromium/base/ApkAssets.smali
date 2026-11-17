.class public Lorg/chromium/base/ApkAssets;
.super Ljava/lang/Object;
.source "ApkAssets.java"


# annotations
.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base::android"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ApkAssets"

.field private static sLastError:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static open(Ljava/lang/String;Ljava/lang/String;)[J
    .locals 14
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "splitName"    # Ljava/lang/String;

    .line 32
    const-string v0, "Unable to close AssetFileDescriptor"

    const-string v1, "ApkAssets"

    const/4 v2, 0x0

    sput-object v2, Lorg/chromium/base/ApkAssets;->sLastError:Ljava/lang/String;

    .line 33
    const/4 v2, 0x0

    .line 35
    .local v2, "afd":Landroid/content/res/AssetFileDescriptor;
    const/4 v3, 0x3

    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    .line 36
    .local v4, "context":Landroid/content/Context;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {p1}, Lorg/chromium/base/BundleUtils;->isIsolatedSplitInstalled(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 37
    invoke-static {v4, p1}, Lorg/chromium/base/BundleUtils;->createIsolatedSplitContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v5

    move-object v4, v5

    .line 39
    :cond_0
    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    .line 40
    .local v5, "manager":Landroid/content/res/AssetManager;
    invoke-virtual {v5, p0}, Landroid/content/res/AssetManager;->openNonAssetFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    move-object v2, v6

    .line 41
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v8

    .line 42
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v10

    new-array v12, v3, [J

    const/4 v13, 0x0

    aput-wide v6, v12, v13

    const/4 v6, 0x1

    aput-wide v8, v12, v6

    const/4 v6, 0x2

    aput-wide v10, v12, v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    if-eqz v2, :cond_1

    .line 62
    :try_start_1
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 64
    :catch_0
    move-exception v3

    .line 65
    .local v3, "e2":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 66
    .end local v3    # "e2":Ljava/io/IOException;
    :cond_1
    :goto_0
    nop

    .line 41
    :goto_1
    return-object v12

    .line 60
    .end local v4    # "context":Landroid/content/Context;
    .end local v5    # "manager":Landroid/content/res/AssetManager;
    :catchall_0
    move-exception v3

    goto :goto_4

    .line 43
    :catch_1
    move-exception v4

    .line 44
    .local v4, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error while loading asset "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sput-object v5, Lorg/chromium/base/ApkAssets;->sLastError:Ljava/lang/String;

    .line 55
    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 56
    sget-object v5, Lorg/chromium/base/ApkAssets;->sLastError:Ljava/lang/String;

    invoke-static {v1, v5}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    :cond_2
    new-array v3, v3, [J

    fill-array-data v3, :array_0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 61
    if-eqz v2, :cond_3

    .line 62
    :try_start_3
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    .line 64
    :catch_2
    move-exception v5

    .line 65
    .local v5, "e2":Ljava/io/IOException;
    invoke-static {v1, v0, v5}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 66
    .end local v5    # "e2":Ljava/io/IOException;
    :cond_3
    :goto_2
    nop

    .line 58
    :goto_3
    return-object v3

    .line 61
    .end local v4    # "e":Ljava/io/IOException;
    :goto_4
    if-eqz v2, :cond_4

    .line 62
    :try_start_4
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_5

    .line 64
    :catch_3
    move-exception v4

    .line 65
    .local v4, "e2":Ljava/io/IOException;
    invoke-static {v1, v0, v4}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 66
    .end local v4    # "e2":Ljava/io/IOException;
    :cond_4
    :goto_5
    nop

    .line 67
    :goto_6
    throw v3

    :array_0
    .array-data 8
        -0x1
        -0x1
        -0x1
    .end array-data
.end method

.method private static takeLastErrorString()Ljava/lang/String;
    .locals 2

    .line 72
    sget-object v0, Lorg/chromium/base/ApkAssets;->sLastError:Ljava/lang/String;

    .line 73
    .local v0, "rv":Ljava/lang/String;
    const/4 v1, 0x0

    sput-object v1, Lorg/chromium/base/ApkAssets;->sLastError:Ljava/lang/String;

    .line 74
    return-object v0
.end method
