.class public abstract Lorg/chromium/base/PathUtils;
.super Ljava/lang/Object;
.source "PathUtils.java"


# annotations
.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final CACHE_DIRECTORY:I = 0x2

.field private static final DATA_DIRECTORY:I = 0x0

.field private static final NUM_DIRECTORIES:I = 0x3

.field private static final TAG:Ljava/lang/String; = "PathUtils"

.field private static final THUMBNAIL_DIRECTORY:I = 0x1

.field private static final THUMBNAIL_DIRECTORY_NAME:Ljava/lang/String; = "textures"

.field private static sCacheDirectoryBasePath:Ljava/lang/String;

.field private static sCacheSubDirectory:Ljava/lang/String;

.field private static sDataDirectoryBasePath:Ljava/lang/String;

.field private static sDataDirectorySuffix:Ljava/lang/String;

.field private static sDirPathFetchTask:Ljava/util/concurrent/FutureTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/FutureTask<",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sInitializationStarted:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public static synthetic $r8$lambda$KpCobdOU19ZOuosPUUJXOXj5Si0()[Ljava/lang/String;
    .locals 1

    invoke-static {}, Lorg/chromium/base/PathUtils;->setPrivateDirectoryPathInternal()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 37
    nop

    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Lorg/chromium/base/PathUtils;->sInitializationStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static chmod(Ljava/lang/String;I)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "mode"    # I

    .line 92
    :try_start_0
    invoke-static {p0, p1}, Landroid/system/Os;->chmod(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    goto :goto_0

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to set permissions for path \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "PathUtils"

    invoke-static {v2, v1}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static getAllPrivateDownloadsDirectories()[Ljava/lang/String;
    .locals 4

    .line 280
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 281
    .local v0, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskWrites()Lorg/chromium/base/StrictModeContext;

    move-result-object v1

    .line 282
    .local v1, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/content/Context;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v2

    .line 284
    .local v2, "externalDirs":[Ljava/io/File;
    if-nez v2, :cond_0

    move-object v3, v0

    goto :goto_0

    :cond_0
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 285
    .end local v0    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v2    # "externalDirs":[Ljava/io/File;
    .local v3, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 286
    .end local v1    # "ignored":Lorg/chromium/base/StrictModeContext;
    :cond_1
    invoke-static {v3}, Lorg/chromium/base/PathUtils;->toAbsolutePathStrings(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 281
    .end local v3    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v0    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v1    # "ignored":Lorg/chromium/base/StrictModeContext;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_2

    :try_start_1
    invoke-virtual {v1}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw v2
.end method

.method public static getCacheDirectory()Ljava/lang/String;
    .locals 2

    .line 235
    sget-object v0, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    if-eqz v0, :cond_0

    .line 236
    const/4 v0, 0x2

    invoke-static {v0}, Lorg/chromium/base/PathUtils;->getDirectoryPath(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 235
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "setDataDirectorySuffix must be called first."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static getDataDirectory()Ljava/lang/String;
    .locals 2

    .line 226
    sget-object v0, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    if-eqz v0, :cond_0

    .line 227
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/base/PathUtils;->getDirectoryPath(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 226
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "setDataDirectorySuffix must be called first."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private static getDirectoryPath(I)Ljava/lang/String;
    .locals 2
    .param p0, "index"    # I

    .line 217
    invoke-static {}, Lorg/chromium/base/PathUtils;->getOrComputeDirectoryPaths()[Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "paths":[Ljava/lang/String;
    aget-object v1, v0, p0

    return-object v1
.end method

.method public static getDownloadsDirectory()Ljava/lang/String;
    .locals 3

    .line 257
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskReads()Lorg/chromium/base/StrictModeContext;

    move-result-object v0

    .line 258
    .local v0, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_3

    .line 264
    invoke-static {}, Lorg/chromium/base/PathUtils;->getAllPrivateDownloadsDirectories()[Ljava/lang/String;

    move-result-object v1

    .line 265
    .local v1, "dirs":[Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 266
    array-length v2, v1

    if-nez v2, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    aget-object v2, v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 270
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 266
    :cond_1
    return-object v2

    .line 265
    :cond_2
    :try_start_1
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    .end local v0    # "ignored":Lorg/chromium/base/StrictModeContext;
    throw v2

    .line 268
    .end local v1    # "dirs":[Ljava/lang/String;
    .restart local v0    # "ignored":Lorg/chromium/base/StrictModeContext;
    :cond_3
    sget-object v1, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 269
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 270
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 268
    :cond_4
    return-object v1

    .line 257
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_5

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_1
    throw v1
.end method

.method public static getExternalDownloadVolumesNames()[Ljava/lang/String;
    .locals 12

    .line 298
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 300
    .local v0, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/base/compat/ApiHelperForQ;->getExternalVolumeNames(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v1

    .line 301
    .local v1, "volumes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 302
    .local v3, "vol":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "external_primary"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 304
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-class v5, Landroid/os/storage/StorageManager;

    .line 303
    invoke-static {v4, v5}, Lorg/chromium/base/compat/ApiHelperForM;->getSystemService(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/storage/StorageManager;

    .line 305
    .local v4, "manager":Landroid/os/storage/StorageManager;
    nop

    .line 306
    invoke-static {v3}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/chromium/base/compat/ApiHelperForR;->getVolumeDir(Landroid/os/storage/StorageManager;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v5

    .line 307
    .local v5, "volumeDir":Ljava/io/File;
    new-instance v6, Ljava/io/File;

    sget-object v7, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-direct {v6, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 310
    .local v6, "volumeDownloadDir":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_0

    .line 311
    nop

    .line 312
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    .line 313
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v7, v10, v11

    const/4 v7, 0x1

    aput-object v8, v10, v7

    const/4 v7, 0x2

    aput-object v9, v10, v7

    .line 311
    const-string v7, "PathUtils"

    const-string v8, "Download dir missing: %s, parent dir:%s, isDirectory:%s"

    invoke-static {v7, v8, v10}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 315
    :cond_0
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 317
    .end local v3    # "vol":Ljava/lang/String;
    .end local v4    # "manager":Landroid/os/storage/StorageManager;
    .end local v5    # "volumeDir":Ljava/io/File;
    .end local v6    # "volumeDownloadDir":Ljava/io/File;
    :cond_1
    goto :goto_0

    .line 319
    :cond_2
    invoke-static {v0}, Lorg/chromium/base/PathUtils;->toAbsolutePathStrings(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getExternalStorageDirectory()Ljava/lang/String;
    .locals 1

    .line 353
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getNativeLibraryDirectory()Ljava/lang/String;
    .locals 2

    .line 338
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 339
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    iget v1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_1

    iget v1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    goto :goto_0

    .line 344
    :cond_0
    const-string v1, "/system/lib/"

    return-object v1

    .line 341
    :cond_1
    :goto_0
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    return-object v1
.end method

.method private static getOrComputeDirectoryPaths()[Ljava/lang/String;
    .locals 3

    .line 77
    sget-object v0, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->isDone()Z

    move-result v0

    if-nez v0, :cond_1

    .line 78
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskWrites()Lorg/chromium/base/StrictModeContext;

    move-result-object v0

    .line 80
    .local v0, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_0
    sget-object v1, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v1}, Ljava/util/concurrent/FutureTask;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    goto :goto_1

    .line 78
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_0

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    throw v1

    .line 84
    .end local v0    # "ignored":Lorg/chromium/base/StrictModeContext;
    :cond_1
    :goto_1
    :try_start_2
    sget-object v0, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-object v0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getThumbnailCacheDirectory()Ljava/lang/String;
    .locals 2

    .line 243
    sget-object v0, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    if-eqz v0, :cond_0

    .line 244
    const/4 v0, 0x1

    invoke-static {v0}, Lorg/chromium/base/PathUtils;->getDirectoryPath(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 243
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "setDataDirectorySuffix must be called first."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static resetForTesting()V
    .locals 2

    .line 63
    sget-object v0, Lorg/chromium/base/PathUtils;->sInitializationStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 64
    const/4 v0, 0x0

    sput-object v0, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    .line 65
    sput-object v0, Lorg/chromium/base/PathUtils;->sDataDirectorySuffix:Ljava/lang/String;

    .line 66
    sput-object v0, Lorg/chromium/base/PathUtils;->sCacheSubDirectory:Ljava/lang/String;

    .line 67
    sput-object v0, Lorg/chromium/base/PathUtils;->sDataDirectoryBasePath:Ljava/lang/String;

    .line 68
    sput-object v0, Lorg/chromium/base/PathUtils;->sCacheDirectoryBasePath:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public static setPrivateDataDirectorySuffix(Ljava/lang/String;)V
    .locals 1
    .param p0, "suffix"    # Ljava/lang/String;

    .line 209
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/PathUtils;->setPrivateDataDirectorySuffix(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    return-void
.end method

.method public static setPrivateDataDirectorySuffix(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "suffix"    # Ljava/lang/String;
    .param p1, "cacheSubDir"    # Ljava/lang/String;

    .line 205
    const/4 v0, 0x0

    invoke-static {v0, v0, p0, p1}, Lorg/chromium/base/PathUtils;->setPrivateDirectoryPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    return-void
.end method

.method public static setPrivateDirectoryPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "dataBasePath"    # Ljava/lang/String;
    .param p1, "cacheBasePath"    # Ljava/lang/String;
    .param p2, "dataDirSuffix"    # Ljava/lang/String;
    .param p3, "cacheSubDir"    # Ljava/lang/String;

    .line 166
    sget-object v0, Lorg/chromium/base/PathUtils;->sInitializationStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 167
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 168
    sput-object p0, Lorg/chromium/base/PathUtils;->sDataDirectoryBasePath:Ljava/lang/String;

    .line 169
    sput-object p1, Lorg/chromium/base/PathUtils;->sCacheDirectoryBasePath:Ljava/lang/String;

    .line 170
    sput-object p2, Lorg/chromium/base/PathUtils;->sDataDirectorySuffix:Ljava/lang/String;

    .line 171
    sput-object p3, Lorg/chromium/base/PathUtils;->sCacheSubDirectory:Ljava/lang/String;

    .line 176
    new-instance v0, Ljava/util/concurrent/FutureTask;

    new-instance v1, Lorg/chromium/base/PathUtils$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lorg/chromium/base/PathUtils$$ExternalSyntheticLambda0;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    sput-object v0, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    .line 177
    sget-object v0, Lorg/chromium/base/task/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    sget-object v1, Lorg/chromium/base/PathUtils;->sDirPathFetchTask:Ljava/util/concurrent/FutureTask;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 167
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 179
    :cond_1
    sget-object v0, Lorg/chromium/base/PathUtils;->sDataDirectoryBasePath:Ljava/lang/String;

    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x2

    const-string v4, "%s != %s"

    if-eqz v0, :cond_5

    .line 181
    sget-object v0, Lorg/chromium/base/PathUtils;->sCacheDirectoryBasePath:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 183
    sget-object v0, Lorg/chromium/base/PathUtils;->sDataDirectorySuffix:Ljava/lang/String;

    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 185
    sget-object v0, Lorg/chromium/base/PathUtils;->sCacheSubDirectory:Ljava/lang/String;

    invoke-static {v0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 188
    :goto_0
    return-void

    .line 185
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p3, v3, v2

    sget-object v2, Lorg/chromium/base/PathUtils;->sCacheSubDirectory:Ljava/lang/String;

    aput-object v2, v3, v1

    .line 186
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 183
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p2, v3, v2

    sget-object v2, Lorg/chromium/base/PathUtils;->sDataDirectorySuffix:Ljava/lang/String;

    aput-object v2, v3, v1

    .line 184
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 181
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    sget-object v2, Lorg/chromium/base/PathUtils;->sCacheDirectoryBasePath:Ljava/lang/String;

    aput-object v2, v3, v1

    .line 182
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 179
    :cond_5
    new-instance v0, Ljava/lang/AssertionError;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v2

    sget-object v2, Lorg/chromium/base/PathUtils;->sDataDirectoryBasePath:Ljava/lang/String;

    aput-object v2, v3, v1

    .line 180
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private static setPrivateDirectoryPathInternal()[Ljava/lang/String;
    .locals 9

    .line 107
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    .line 108
    .local v0, "paths":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 109
    .local v1, "dataDir":Ljava/io/File;
    const/4 v2, 0x0

    .line 110
    .local v2, "thumbnailDir":Ljava/io/File;
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    .line 111
    .local v3, "appContext":Landroid/content/Context;
    sget-object v4, Lorg/chromium/base/PathUtils;->sDataDirectoryBasePath:Ljava/lang/String;

    const-string v5, "textures"

    const/4 v6, 0x0

    if-nez v4, :cond_0

    .line 112
    sget-object v4, Lorg/chromium/base/PathUtils;->sDataDirectorySuffix:Ljava/lang/String;

    invoke-virtual {v3, v4, v6}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    .line 113
    invoke-virtual {v3, v5, v6}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    goto :goto_0

    .line 115
    :cond_0
    new-instance v4, Ljava/io/File;

    sget-object v7, Lorg/chromium/base/PathUtils;->sDataDirectoryBasePath:Ljava/lang/String;

    sget-object v8, Lorg/chromium/base/PathUtils;->sDataDirectorySuffix:Ljava/lang/String;

    invoke-direct {v4, v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v4

    .line 116
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 117
    new-instance v4, Ljava/io/File;

    sget-object v7, Lorg/chromium/base/PathUtils;->sDataDirectoryBasePath:Ljava/lang/String;

    invoke-direct {v4, v7, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v4

    .line 118
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 121
    :goto_0
    const/4 v4, 0x0

    .line 122
    .local v4, "cacheDir":Ljava/io/File;
    sget-object v5, Lorg/chromium/base/PathUtils;->sCacheDirectoryBasePath:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 123
    new-instance v5, Ljava/io/File;

    sget-object v7, Lorg/chromium/base/PathUtils;->sCacheDirectoryBasePath:Ljava/lang/String;

    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .end local v4    # "cacheDir":Ljava/io/File;
    .local v5, "cacheDir":Ljava/io/File;
    goto :goto_1

    .line 125
    .end local v5    # "cacheDir":Ljava/io/File;
    .restart local v4    # "cacheDir":Ljava/io/File;
    :cond_1
    invoke-virtual {v3}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v5

    .line 127
    .end local v4    # "cacheDir":Ljava/io/File;
    .restart local v5    # "cacheDir":Ljava/io/File;
    :goto_1
    if-eqz v5, :cond_5

    .line 128
    sget-object v4, Lorg/chromium/base/PathUtils;->sCacheSubDirectory:Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 129
    new-instance v4, Ljava/io/File;

    sget-object v7, Lorg/chromium/base/PathUtils;->sCacheSubDirectory:Ljava/lang/String;

    invoke-direct {v4, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v5, v4

    .line 131
    :cond_2
    sget-object v4, Lorg/chromium/base/PathUtils;->sCacheDirectoryBasePath:Ljava/lang/String;

    if-nez v4, :cond_3

    sget-object v4, Lorg/chromium/base/PathUtils;->sCacheSubDirectory:Ljava/lang/String;

    if-eqz v4, :cond_4

    .line 132
    :cond_3
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 134
    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    const/16 v7, 0x5c0

    invoke-static {v4, v7}, Lorg/chromium/base/PathUtils;->chmod(Ljava/lang/String;I)V

    .line 136
    :cond_4
    const/4 v4, 0x2

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v4

    .line 138
    :cond_5
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v6

    .line 140
    aget-object v4, v0, v6

    const/16 v6, 0x1c0

    invoke-static {v4, v6}, Lorg/chromium/base/PathUtils;->chmod(Ljava/lang/String;I)V

    .line 141
    const/4 v4, 0x1

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v4

    .line 142
    return-object v0
.end method

.method private static toAbsolutePathStrings(Ljava/util/List;)[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 323
    .local p0, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 324
    .local v0, "absolutePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 325
    .local v2, "file":Ljava/io/File;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 326
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 327
    .end local v2    # "file":Ljava/io/File;
    goto :goto_0

    .line 329
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1
.end method
