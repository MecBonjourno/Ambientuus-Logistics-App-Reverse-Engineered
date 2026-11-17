.class public Lorg/chromium/base/JNIUtils;
.super Ljava/lang/Object;
.source "JNIUtils.java"


# annotations
.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final TAG:Ljava/lang/String; = "JNIUtils"

.field private static sJniClassLoader:Ljava/lang/ClassLoader;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getSplitClassLoader(Ljava/lang/String;)Ljava/lang/ClassLoader;
    .locals 4
    .param p0, "splitName"    # Ljava/lang/String;

    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 28
    invoke-static {p0}, Lorg/chromium/base/BundleUtils;->isIsolatedSplitInstalled(Ljava/lang/String;)Z

    move-result v0

    .line 29
    .local v0, "isInstalled":Z
    const-string v1, "Init JNI Classloader for %s. isInstalled=%b"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "JNIUtils"

    invoke-static {v3, v1, p0, v2}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    if-eqz v0, :cond_0

    .line 32
    invoke-static {p0}, Lorg/chromium/base/BundleUtils;->getOrCreateSplitClassLoader(Ljava/lang/String;)Ljava/lang/ClassLoader;

    move-result-object v1

    return-object v1

    .line 41
    .end local v0    # "isInstalled":Z
    :cond_0
    sget-object v0, Lorg/chromium/base/JNIUtils;->sJniClassLoader:Ljava/lang/ClassLoader;

    if-eqz v0, :cond_1

    sget-object v0, Lorg/chromium/base/JNIUtils;->sJniClassLoader:Ljava/lang/ClassLoader;

    goto :goto_0

    :cond_1
    const-class v0, Lorg/chromium/base/JNIUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static setClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .line 50
    sput-object p0, Lorg/chromium/base/JNIUtils;->sJniClassLoader:Ljava/lang/ClassLoader;

    .line 51
    return-void
.end method

.method public static splitMap(Ljava/util/Map;[Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;[TK;[TV;)V"
        }
    .end annotation

    .line 57
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    .local p1, "outKeys":[Ljava/lang/Object;, "[TK;"
    .local p2, "outValues":[Ljava/lang/Object;, "[TV;"
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    array-length v1, p1

    if-ne v0, v1, :cond_2

    .line 58
    array-length v0, p2

    array-length v1, p1

    if-ne v0, v1, :cond_1

    .line 60
    const/4 v0, 0x0

    .line 61
    .local v0, "i":I
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 62
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, p1, v0

    .line 63
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, p2, v0

    .line 64
    nop

    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    add-int/lit8 v0, v0, 0x1

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    return-void

    .line 58
    .end local v0    # "i":I
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 57
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
