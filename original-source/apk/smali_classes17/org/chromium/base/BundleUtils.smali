.class public Lorg/chromium/base/BundleUtils;
.super Ljava/lang/Object;
.source "BundleUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final LOADED_SPLITS_KEY:Ljava/lang/String; = "split_compat_loaded_splits"

.field private static final TAG:Ljava/lang/String; = "BundleUtils"

.field private static final sCachedClassLoaders:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ">;"
        }
    .end annotation
.end field

.field private static final sInflationClassLoaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ">;"
        }
    .end annotation
.end field

.field private static sIsBundle:Ljava/lang/Boolean;

.field private static sSplitCompatClassLoaderInstance:Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;

.field private static final sSplitLock:Ljava/lang/Object;

.field private static sSplitsToRestore:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$sfgetsInflationClassLoaders()Ljava/util/Map;
    .locals 1

    sget-object v0, Lorg/chromium/base/BundleUtils;->sInflationClassLoaders:Ljava/util/Map;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsSplitsToRestore()Ljava/util/ArrayList;
    .locals 1

    sget-object v0, Lorg/chromium/base/BundleUtils;->sSplitsToRestore:Ljava/util/ArrayList;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputsSplitsToRestore(Ljava/util/ArrayList;)V
    .locals 0

    sput-object p0, Lorg/chromium/base/BundleUtils;->sSplitsToRestore:Ljava/util/ArrayList;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 53
    nop

    .line 57
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/chromium/base/BundleUtils;->sSplitLock:Ljava/lang/Object;

    .line 61
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    sput-object v0, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    .line 63
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 64
    invoke-static {v0}, Lj$/util/DesugarCollections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/BundleUtils;->sInflationClassLoaders:Ljava/util/Map;

    .line 63
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canLoadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Z
    .locals 2
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p1, "className"    # Ljava/lang/String;

    .line 338
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 339
    const/4 v0, 0x1

    return v0

    .line 340
    :catch_0
    move-exception v1

    .line 341
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    return v0
.end method

.method public static checkContextClassLoader(Landroid/content/Context;Landroid/app/Activity;)V
    .locals 5
    .param p0, "baseContext"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;

    .line 256
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 257
    .local v0, "activityClassLoader":Ljava/lang/ClassLoader;
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 258
    .local v1, "contextClassLoader":Ljava/lang/ClassLoader;
    if-eq v0, v1, :cond_0

    .line 259
    nop

    .line 260
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 259
    const-string v3, "BundleUtils"

    const-string v4, "Mismatched ClassLoaders between Activity and context (fixing): %s"

    invoke-static {v3, v4, v2}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 261
    invoke-static {p0, v0}, Lorg/chromium/base/BundleUtils;->replaceClassLoader(Landroid/content/Context;Ljava/lang/ClassLoader;)V

    .line 263
    :cond_0
    return-void
.end method

.method public static createContextForInflation(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "splitName"    # Ljava/lang/String;

    .line 288
    invoke-static {p1}, Lorg/chromium/base/BundleUtils;->isIsolatedSplitInstalled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 289
    return-object p0

    .line 291
    :cond_0
    invoke-static {p1}, Lorg/chromium/base/BundleUtils;->registerSplitClassLoaderForInflation(Ljava/lang/String;)Ljava/lang/ClassLoader;

    move-result-object v0

    .line 292
    .local v0, "splitClassLoader":Ljava/lang/ClassLoader;
    new-instance v1, Lorg/chromium/base/BundleUtils$1;

    invoke-direct {v1, p0, v0}, Lorg/chromium/base/BundleUtils$1;-><init>(Landroid/content/Context;Ljava/lang/ClassLoader;)V

    return-object v1
.end method

.method public static createIsolatedSplitContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;
    .locals 9
    .param p0, "base"    # Landroid/content/Context;
    .param p1, "splitName"    # Ljava/lang/String;

    .line 149
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 150
    return-object p0

    .line 160
    :cond_0
    :try_start_0
    invoke-static {p0}, Lorg/chromium/base/BundleUtils;->isApplicationContext(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 161
    invoke-static {p0, p1}, Lorg/chromium/base/compat/ApiHelperForO;->createContextForSplit(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v0

    .local v0, "context":Landroid/content/Context;
    goto :goto_0

    .line 163
    .end local v0    # "context":Landroid/content/Context;
    :cond_1
    invoke-static {}, Lorg/chromium/base/BundleUtils;->getSplitContextLock()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    :try_start_1
    invoke-static {p0, p1}, Lorg/chromium/base/compat/ApiHelperForO;->createContextForSplit(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v1

    .line 165
    .local v1, "context":Landroid/content/Context;
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v0, v1

    .line 167
    .end local v1    # "context":Landroid/content/Context;
    .restart local v0    # "context":Landroid/content/Context;
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 168
    .local v1, "parent":Ljava/lang/ClassLoader;
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 175
    .local v2, "appContext":Landroid/content/Context;
    invoke-static {}, Lorg/chromium/base/BundleUtils;->isolatedSplitsEnabled()Z

    move-result v3

    if-eqz v3, :cond_2

    const-class v3, Lorg/chromium/base/BundleUtils;

    .line 176
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    if-eqz v2, :cond_2

    .line 177
    invoke-virtual {v2}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    .line 178
    .local v3, "shouldReplaceClassLoader":Z
    :goto_1
    sget-object v4, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    monitor-enter v4
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 179
    if-eqz v3, :cond_3

    :try_start_3
    sget-object v5, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    invoke-virtual {v5, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 180
    invoke-static {p1}, Lorg/chromium/base/BundleUtils;->getSplitApkPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 183
    .local v5, "apkPath":Ljava/lang/String;
    sget-object v6, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    new-instance v7, Ldalvik/system/PathClassLoader;

    .line 184
    invoke-virtual {v2}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    invoke-direct {v7, v5, v8}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 183
    invoke-virtual {v6, p1, v7}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    .end local v5    # "apkPath":Ljava/lang/String;
    :cond_3
    sget-object v5, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    invoke-virtual {v5, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/ClassLoader;

    .line 189
    .local v5, "cachedClassLoader":Ljava/lang/ClassLoader;
    if-eqz v5, :cond_4

    .line 190
    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 192
    const/4 v3, 0x1

    .line 193
    invoke-static {v0, v5}, Lorg/chromium/base/BundleUtils;->replaceClassLoader(Landroid/content/Context;Ljava/lang/ClassLoader;)V

    goto :goto_2

    .line 196
    :cond_4
    sget-object v6, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-virtual {v6, p1, v7}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .end local v5    # "cachedClassLoader":Ljava/lang/ClassLoader;
    :cond_5
    :goto_2
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 199
    :try_start_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Android.IsolatedSplits.ClassLoaderReplaced."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v3}, Lorg/chromium/base/metrics/RecordHistogram;->recordBooleanHistogram(Ljava/lang/String;Z)V
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    .line 202
    return-object v0

    .line 198
    :catchall_0
    move-exception v5

    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .end local p0    # "base":Landroid/content/Context;
    .end local p1    # "splitName":Ljava/lang/String;
    :try_start_6
    throw v5
    :try_end_6
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6 .. :try_end_6} :catch_0

    .line 165
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "parent":Ljava/lang/ClassLoader;
    .end local v2    # "appContext":Landroid/content/Context;
    .end local v3    # "shouldReplaceClassLoader":Z
    .restart local p0    # "base":Landroid/content/Context;
    .restart local p1    # "splitName":Ljava/lang/String;
    :catchall_1
    move-exception v1

    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .end local p0    # "base":Landroid/content/Context;
    .end local p1    # "splitName":Ljava/lang/String;
    :try_start_8
    throw v1
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_8} :catch_0

    .line 203
    .restart local p0    # "base":Landroid/content/Context;
    .restart local p1    # "splitName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getNativeLibraryPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "libraryName"    # Ljava/lang/String;
    .param p1, "splitName"    # Ljava/lang/String;

    .line 228
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskReads()Lorg/chromium/base/StrictModeContext;

    move-result-object v0

    .line 232
    .local v0, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_0
    const-class v1, Lorg/chromium/base/BundleUtils;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    check-cast v1, Ldalvik/system/BaseDexClassLoader;

    .line 233
    invoke-virtual {v1, p0}, Ldalvik/system/BaseDexClassLoader;->findLibrary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    .local v1, "path":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 235
    nop

    .line 252
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 235
    :cond_0
    return-object v1

    .line 240
    :cond_1
    :try_start_1
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 242
    .local v2, "classLoader":Ljava/lang/ClassLoader;
    instance-of v3, v2, Ldalvik/system/BaseDexClassLoader;

    if-eqz v3, :cond_2

    .line 243
    move-object v3, v2

    check-cast v3, Ldalvik/system/BaseDexClassLoader;

    invoke-virtual {v3, p0}, Ldalvik/system/BaseDexClassLoader;->findLibrary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v1, v3

    goto :goto_0

    .line 244
    :cond_2
    instance-of v3, v2, Lorg/chromium/base/WrappedClassLoader;

    if-eqz v3, :cond_3

    .line 245
    move-object v3, v2

    check-cast v3, Lorg/chromium/base/WrappedClassLoader;

    invoke-virtual {v3, p0}, Lorg/chromium/base/WrappedClassLoader;->findLibrary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v3

    .line 247
    :cond_3
    :goto_0
    if-eqz v1, :cond_5

    .line 248
    nop

    .line 252
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 248
    :cond_4
    return-object v1

    .line 251
    :cond_5
    :try_start_2
    invoke-static {p0, p1}, Lorg/chromium/base/BundleUtils;->getSplitApkLibraryPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 252
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 251
    :cond_6
    return-object v3

    .line 228
    .end local v1    # "path":Ljava/lang/String;
    .end local v2    # "classLoader":Ljava/lang/ClassLoader;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_7

    :try_start_3
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7
    :goto_1
    throw v1
.end method

.method public static getOrCreateSplitClassLoader(Ljava/lang/String;)Ljava/lang/ClassLoader;
    .locals 3
    .param p0, "splitName"    # Ljava/lang/String;

    .line 315
    sget-object v0, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    monitor-enter v0

    .line 316
    :try_start_0
    sget-object v1, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    invoke-virtual {v1, p0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ClassLoader;

    .line 317
    .local v1, "ret":Ljava/lang/ClassLoader;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 319
    if-nez v1, :cond_1

    .line 321
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lorg/chromium/base/BundleUtils;->createIsolatedSplitContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    .line 322
    sget-object v0, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    monitor-enter v0

    .line 323
    :try_start_1
    sget-object v2, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    invoke-virtual {v2, p0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ClassLoader;

    move-object v1, v2

    .line 324
    if-eqz v1, :cond_0

    .line 325
    monitor-exit v0

    goto :goto_0

    .line 324
    :cond_0
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    .end local v1    # "ret":Ljava/lang/ClassLoader;
    .end local p0    # "splitName":Ljava/lang/String;
    throw v2

    .line 325
    .restart local v1    # "ret":Ljava/lang/ClassLoader;
    .restart local p0    # "splitName":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 327
    :cond_1
    :goto_0
    return-object v1

    .line 317
    .end local v1    # "ret":Ljava/lang/ClassLoader;
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method private static getSplitApkLibraryPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "libraryName"    # Ljava/lang/String;
    .param p1, "splitName"    # Ljava/lang/String;

    .line 431
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 432
    return-object v2

    .line 435
    :cond_0
    invoke-static {p1}, Lorg/chromium/base/BundleUtils;->getSplitApkPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 436
    .local v0, "apkPath":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 437
    return-object v2

    .line 441
    :cond_1
    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 442
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "primaryCpuAbi"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 444
    .local v2, "primaryCpuAbi":Ljava/lang/String;
    invoke-static {p0}, Ljava/lang/System;->mapLibraryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "!/lib/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 445
    .end local v1    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "primaryCpuAbi":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 446
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static getSplitApkPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "splitName"    # Ljava/lang/String;

    .line 112
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 113
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->splitNames:[Ljava/lang/String;

    .line 114
    .local v1, "splitNames":[Ljava/lang/String;
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 115
    return-object v2

    .line 117
    :cond_0
    invoke-static {v1, p0}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    .line 118
    .local v3, "idx":I
    if-gez v3, :cond_1

    goto :goto_0

    :cond_1
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->splitSourceDirs:[Ljava/lang/String;

    aget-object v2, v2, v3

    :goto_0
    return-object v2
.end method

.method public static getSplitCompatClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .line 350
    sget-object v0, Lorg/chromium/base/BundleUtils;->sSplitCompatClassLoaderInstance:Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;

    if-nez v0, :cond_0

    .line 351
    new-instance v0, Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;

    invoke-direct {v0}, Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;-><init>()V

    sput-object v0, Lorg/chromium/base/BundleUtils;->sSplitCompatClassLoaderInstance:Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;

    .line 353
    :cond_0
    sget-object v0, Lorg/chromium/base/BundleUtils;->sSplitCompatClassLoaderInstance:Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;

    return-object v0
.end method

.method public static getSplitContextLock()Ljava/lang/Object;
    .locals 1

    .line 136
    sget-object v0, Lorg/chromium/base/BundleUtils;->sSplitLock:Ljava/lang/Object;

    return-object v0
.end method

.method private static isApplicationContext(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 451
    nop

    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_1

    .line 452
    instance-of v0, p0, Landroid/app/Application;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 453
    :cond_0
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_0

    .line 455
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static isBundle()Z
    .locals 1

    .line 95
    sget-boolean v0, Lorg/chromium/build/BuildConfig;->BUNDLES_SUPPORTED:Z

    if-nez v0, :cond_0

    .line 96
    const/4 v0, 0x0

    return v0

    .line 98
    :cond_0
    sget-object v0, Lorg/chromium/base/BundleUtils;->sIsBundle:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 99
    sget-object v0, Lorg/chromium/base/BundleUtils;->sIsBundle:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 98
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static isBundleForNative()Z
    .locals 1

    .line 88
    invoke-static {}, Lorg/chromium/base/BundleUtils;->isBundle()Z

    move-result v0

    return v0
.end method

.method public static isIsolatedSplitInstalled(Ljava/lang/String;)Z
    .locals 3
    .param p0, "splitName"    # Ljava/lang/String;

    .line 126
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 127
    return v2

    .line 129
    :cond_0
    invoke-static {p0}, Lorg/chromium/base/BundleUtils;->getSplitApkPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method

.method public static isolatedSplitsEnabled()Z
    .locals 1

    .line 107
    sget-boolean v0, Lorg/chromium/build/BuildConfig;->ISOLATED_SPLITS_ENABLED:Z

    return v0
.end method

.method public static newInstance(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "className"    # Ljava/lang/String;

    .line 271
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 272
    .local v0, "appContext":Landroid/content/Context;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/chromium/base/BundleUtils;->canLoadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 273
    move-object p0, v0

    .line 276
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 277
    :catch_0
    move-exception v1

    .line 278
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static registerSplitClassLoaderForInflation(Ljava/lang/String;)Ljava/lang/ClassLoader;
    .locals 2
    .param p0, "splitName"    # Ljava/lang/String;

    .line 331
    invoke-static {p0}, Lorg/chromium/base/BundleUtils;->getOrCreateSplitClassLoader(Ljava/lang/String;)Ljava/lang/ClassLoader;

    move-result-object v0

    .line 332
    .local v0, "splitClassLoader":Ljava/lang/ClassLoader;
    sget-object v1, Lorg/chromium/base/BundleUtils;->sInflationClassLoaders:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    return-object v0
.end method

.method public static replaceClassLoader(Landroid/content/Context;Ljava/lang/ClassLoader;)V
    .locals 3
    .param p0, "baseContext"    # Landroid/content/Context;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .line 210
    nop

    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_0

    .line 211
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_0

    .line 216
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "mClassLoader"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 217
    .local v0, "classLoaderField":Ljava/lang/reflect/Field;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 218
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    .end local v0    # "classLoaderField":Ljava/lang/reflect/Field;
    nop

    .line 222
    return-void

    .line 219
    :catch_0
    move-exception v0

    .line 220
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Error setting ClassLoader."

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static resetForTesting()V
    .locals 2

    .line 72
    const/4 v0, 0x0

    sput-object v0, Lorg/chromium/base/BundleUtils;->sIsBundle:Ljava/lang/Boolean;

    .line 73
    sget-object v1, Lorg/chromium/base/BundleUtils;->sCachedClassLoaders:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->clear()V

    .line 74
    sget-object v1, Lorg/chromium/base/BundleUtils;->sInflationClassLoaders:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 75
    sput-object v0, Lorg/chromium/base/BundleUtils;->sSplitCompatClassLoaderInstance:Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;

    .line 76
    sput-object v0, Lorg/chromium/base/BundleUtils;->sSplitsToRestore:Ljava/util/ArrayList;

    .line 77
    return-void
.end method

.method public static restoreLoadedSplits(Landroid/os/Bundle;)V
    .locals 1
    .param p0, "savedInstanceState"    # Landroid/os/Bundle;

    .line 362
    if-nez p0, :cond_0

    .line 363
    return-void

    .line 365
    :cond_0
    const-string v0, "split_compat_loaded_splits"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/BundleUtils;->sSplitsToRestore:Ljava/util/ArrayList;

    .line 366
    return-void
.end method

.method public static saveLoadedSplits(Landroid/os/Bundle;)V
    .locals 2
    .param p0, "outState"    # Landroid/os/Bundle;

    .line 357
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lorg/chromium/base/BundleUtils;->sInflationClassLoaders:Ljava/util/Map;

    .line 358
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 357
    const-string v1, "split_compat_loaded_splits"

    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 359
    return-void
.end method

.method public static setIsBundle(Z)V
    .locals 1
    .param p0, "isBundle"    # Z

    .line 103
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/BundleUtils;->sIsBundle:Ljava/lang/Boolean;

    .line 104
    return-void
.end method
