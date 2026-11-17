.class Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;
.super Ljava/lang/ClassLoader;
.source "BundleUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/BundleUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SplitCompatClassLoader"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SplitCompatClassLoader"


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 374
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 375
    const-string v0, "Splits: %s"

    invoke-static {}, Lorg/chromium/base/BundleUtils;->-$$Nest$sfgetsSplitsToRestore()Ljava/util/ArrayList;

    move-result-object v1

    const-string v2, "SplitCompatClassLoader"

    invoke-static {v2, v0, v1}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 376
    return-void
.end method

.method private checkSplitsClassLoaders(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 379
    invoke-static {}, Lorg/chromium/base/BundleUtils;->-$$Nest$sfgetsInflationClassLoaders()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ClassLoader;

    .line 381
    .local v1, "cl":Ljava/lang/ClassLoader;
    :try_start_0
    invoke-virtual {v1, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 382
    :catch_0
    move-exception v2

    .line 384
    .end local v1    # "cl":Ljava/lang/ClassLoader;
    goto :goto_0

    .line 385
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private restoreSplitsClassLoaders()V
    .locals 3

    .line 419
    invoke-static {}, Lorg/chromium/base/BundleUtils;->-$$Nest$sfgetsSplitsToRestore()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 420
    .local v1, "splitName":Ljava/lang/String;
    invoke-static {}, Lorg/chromium/base/BundleUtils;->-$$Nest$sfgetsInflationClassLoaders()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 421
    invoke-static {v1}, Lorg/chromium/base/BundleUtils;->registerSplitClassLoaderForInflation(Ljava/lang/String;)Ljava/lang/ClassLoader;

    .line 423
    .end local v1    # "splitName":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 424
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/base/BundleUtils;->-$$Nest$sfputsSplitsToRestore(Ljava/util/ArrayList;)V

    .line 425
    return-void
.end method


# virtual methods
.method public findClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 4
    .param p1, "cn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 393
    invoke-direct {p0, p1}, Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;->checkSplitsClassLoaders(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 394
    .local v0, "foundClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_0

    .line 395
    return-object v0

    .line 400
    :cond_0
    const-string v1, "android."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 404
    invoke-static {}, Lorg/chromium/base/BundleUtils;->-$$Nest$sfgetsSplitsToRestore()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 405
    invoke-direct {p0}, Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;->restoreSplitsClassLoaders()V

    .line 406
    invoke-direct {p0, p1}, Lorg/chromium/base/BundleUtils$SplitCompatClassLoader;->checkSplitsClassLoaders(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 407
    if-eqz v0, :cond_1

    .line 408
    return-object v0

    .line 411
    :cond_1
    invoke-static {}, Lorg/chromium/base/BundleUtils;->-$$Nest$sfgetsInflationClassLoaders()Ljava/util/Map;

    move-result-object v1

    .line 412
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    const-string v2, "\n"

    invoke-static {v2, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    .line 411
    const-string v2, "SplitCompatClassLoader"

    const-string v3, "No class %s amongst %s"

    invoke-static {v2, v3, p1, v1}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 414
    :cond_2
    new-instance v1, Ljava/lang/ClassNotFoundException;

    invoke-direct {v1, p1}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
