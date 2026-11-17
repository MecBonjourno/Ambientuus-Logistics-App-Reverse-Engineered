.class public Lorg/chromium/net/CronetEngine$Builder;
.super Ljava/lang/Object;
.source "CronetEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/CronetEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;
    }
.end annotation


# static fields
.field public static final HTTP_CACHE_DISABLED:I = 0x0

.field public static final HTTP_CACHE_DISK:I = 0x3

.field public static final HTTP_CACHE_DISK_NO_HTTP:I = 0x2

.field public static final HTTP_CACHE_IN_MEMORY:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CronetEngine.Builder"


# instance fields
.field protected final mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 131
    invoke-static {p1}, Lorg/chromium/net/CronetEngine$Builder;->createBuilderDelegate(Landroid/content/Context;)Lorg/chromium/net/ICronetEngineBuilder;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/chromium/net/CronetEngine$Builder;-><init>(Lorg/chromium/net/ICronetEngineBuilder;)V

    .line 132
    return-void
.end method

.method public constructor <init>(Lorg/chromium/net/ICronetEngineBuilder;)V
    .locals 1
    .param p1, "builderDelegate"    # Lorg/chromium/net/ICronetEngineBuilder;

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    instance-of v0, p1, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;

    if-eqz v0, :cond_0

    .line 145
    iput-object p1, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    goto :goto_0

    .line 147
    :cond_0
    new-instance v0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;

    invoke-direct {v0, p1}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;-><init>(Lorg/chromium/net/ICronetEngineBuilder;)V

    iput-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    .line 150
    :goto_0
    return-void
.end method

.method static compareVersions(Ljava/lang/String;Ljava/lang/String;)I
    .locals 9
    .param p0, "s1"    # Ljava/lang/String;
    .param p1, "s2"    # Ljava/lang/String;

    .line 566
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    .line 569
    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 570
    .local v1, "s1segments":[Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 571
    .local v0, "s2segments":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 573
    :try_start_0
    aget-object v3, v1, v2

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 574
    .local v3, "s1segment":I
    aget-object v4, v0, v2

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 575
    .local v4, "s2segment":I
    if-eq v3, v4, :cond_0

    .line 576
    sub-int v5, v3, v4

    invoke-static {v5}, Ljava/lang/Integer;->signum(I)I

    move-result v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v5

    .line 582
    .end local v3    # "s1segment":I
    .end local v4    # "s2segment":I
    :cond_0
    nop

    .line 571
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 578
    :catch_0
    move-exception v3

    .line 579
    .local v3, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    aget-object v5, v1, v2

    aget-object v6, v0, v2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to convert version segments into integers: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " & "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 584
    .end local v2    # "i":I
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    array-length v2, v1

    array-length v3, v0

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->signum(I)I

    move-result v2

    return v2

    .line 567
    .end local v0    # "s2segments":[Ljava/lang/String;
    .end local v1    # "s1segments":[Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The input values cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static createBuilderDelegate(Landroid/content/Context;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .line 490
    new-instance v0, Ljava/util/ArrayList;

    .line 491
    invoke-static {p0}, Lorg/chromium/net/CronetProvider;->getAllProviders(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 492
    .local v0, "providers":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/net/CronetProvider;>;"
    invoke-static {p0, v0}, Lorg/chromium/net/CronetEngine$Builder;->getEnabledCronetProviders(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/CronetProvider;

    .line 493
    .local v1, "provider":Lorg/chromium/net/CronetProvider;
    const/4 v3, 0x3

    const-string v4, "CronetEngine.Builder"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 494
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v1, v3, v2

    .line 495
    const-string v2, "Using \'%s\' provider for creating CronetEngine.Builder."

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 494
    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    :cond_0
    invoke-virtual {v1}, Lorg/chromium/net/CronetProvider;->createBuilder()Lorg/chromium/net/CronetEngine$Builder;

    move-result-object v2

    iget-object v2, v2, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    return-object v2
.end method

.method static getEnabledCronetProviders(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lorg/chromium/net/CronetProvider;",
            ">;)",
            "Ljava/util/List<",
            "Lorg/chromium/net/CronetProvider;",
            ">;"
        }
    .end annotation

    .line 515
    .local p1, "providers":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/net/CronetProvider;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 521
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/chromium/net/CronetProvider;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 522
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/CronetProvider;

    .line 523
    .local v1, "provider":Lorg/chromium/net/CronetProvider;
    invoke-virtual {v1}, Lorg/chromium/net/CronetProvider;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 524
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 526
    .end local v1    # "provider":Lorg/chromium/net/CronetProvider;
    :cond_0
    goto :goto_0

    .line 529
    .end local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/chromium/net/CronetProvider;>;"
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 535
    new-instance v0, Lorg/chromium/net/CronetEngine$Builder$1;

    invoke-direct {v0}, Lorg/chromium/net/CronetEngine$Builder$1;-><init>()V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 549
    return-object p1

    .line 530
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "All available Cronet providers are disabled. A provider should be enabled before it can be used."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 516
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unable to find any Cronet provider. Have you included all necessary jars?"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getImplementationApiLevel()I
    .locals 5

    .line 597
    :try_start_0
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 598
    .local v0, "implClassLoader":Ljava/lang/ClassLoader;
    const-string v1, "org.chromium.net.impl.ImplVersion"

    .line 599
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 600
    .local v1, "implVersionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "getApiLevel"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 601
    .local v2, "getApiLevel":Ljava/lang/reflect/Method;
    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 603
    .local v3, "implementationApiLevel":I
    return v3

    .line 604
    .end local v0    # "implClassLoader":Ljava/lang/ClassLoader;
    .end local v1    # "implVersionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "getApiLevel":Ljava/lang/reflect/Method;
    .end local v3    # "implementationApiLevel":I
    :catch_0
    move-exception v0

    .line 606
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, -0x1

    return v1
.end method

.method private getMaximumApiLevel()I
    .locals 1

    .line 588
    invoke-static {}, Lorg/chromium/net/ApiVersion;->getMaximumAvailableApiLevel()I

    move-result v0

    return v0
.end method


# virtual methods
.method public addPublicKeyPins(Ljava/lang/String;Ljava/util/Set;ZLjava/util/Date;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "hostName"    # Ljava/lang/String;
    .param p3, "includeSubdomains"    # Z
    .param p4, "expirationDate"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "[B>;Z",
            "Ljava/util/Date;",
            ")",
            "Lorg/chromium/net/CronetEngine$Builder;"
        }
    .end annotation

    .line 341
    .local p2, "pinsSha256":Ljava/util/Set;, "Ljava/util/Set<[B>;"
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/chromium/net/ICronetEngineBuilder;->addPublicKeyPins(Ljava/lang/String;Ljava/util/Set;ZLjava/util/Date;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 343
    return-object p0
.end method

.method public addQuicHint(Ljava/lang/String;II)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "alternatePort"    # I

    .line 301
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/ICronetEngineBuilder;->addQuicHint(Ljava/lang/String;II)Lorg/chromium/net/ICronetEngineBuilder;

    .line 302
    return-object p0
.end method

.method public build()Lorg/chromium/net/CronetEngine;
    .locals 4

    .line 470
    invoke-direct {p0}, Lorg/chromium/net/CronetEngine$Builder;->getImplementationApiLevel()I

    move-result v0

    .line 471
    .local v0, "implLevel":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lorg/chromium/net/CronetEngine$Builder;->getMaximumApiLevel()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 472
    add-int/lit8 v1, v0, 0x1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The implementation version is lower than the API version. Calls to methods added in API "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " and newer will likely have no effect."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "CronetEngine.Builder"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    :cond_0
    iget-object v1, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v1}, Lorg/chromium/net/ICronetEngineBuilder;->build()Lorg/chromium/net/ExperimentalCronetEngine;

    move-result-object v1

    return-object v1
.end method

.method public enableBrotli(Z)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "value"    # Z

    .line 245
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableBrotli(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 246
    return-object p0
.end method

.method public enableHttp2(Z)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "value"    # Z

    .line 223
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableHttp2(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 224
    return-object p0
.end method

.method public enableHttpCache(IJ)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "cacheMode"    # I
    .param p2, "maxSize"    # J

    .line 285
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/ICronetEngineBuilder;->enableHttpCache(IJ)Lorg/chromium/net/ICronetEngineBuilder;

    .line 286
    return-object p0
.end method

.method public enableNetworkQualityEstimator(Z)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "value"    # Z

    .line 391
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableNetworkQualityEstimator(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 392
    return-object p0
.end method

.method public enablePublicKeyPinningBypassForLocalTrustAnchors(Z)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "value"    # Z

    .line 360
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enablePublicKeyPinningBypassForLocalTrustAnchors(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 361
    return-object p0
.end method

.method public enableQuic(Z)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "value"    # Z

    .line 211
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableQuic(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 212
    return-object p0
.end method

.method public enableSdch(Z)Lorg/chromium/net/CronetEngine$Builder;
    .locals 0
    .param p1, "value"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 233
    return-object p0
.end method

.method public getDefaultUserAgent()Ljava/lang/String;
    .locals 1

    .line 159
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0}, Lorg/chromium/net/ICronetEngineBuilder;->getDefaultUserAgent()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setConnectionMigrationOptions(Lorg/chromium/net/ConnectionMigrationOptions$Builder;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "connectionMigrationOptionsBuilder"    # Lorg/chromium/net/ConnectionMigrationOptions$Builder;

    .line 461
    invoke-virtual {p1}, Lorg/chromium/net/ConnectionMigrationOptions$Builder;->build()Lorg/chromium/net/ConnectionMigrationOptions;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/chromium/net/CronetEngine$Builder;->setConnectionMigrationOptions(Lorg/chromium/net/ConnectionMigrationOptions;)Lorg/chromium/net/CronetEngine$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setConnectionMigrationOptions(Lorg/chromium/net/ConnectionMigrationOptions;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "connectionMigrationOptions"    # Lorg/chromium/net/ConnectionMigrationOptions;

    .line 451
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setConnectionMigrationOptions(Lorg/chromium/net/ConnectionMigrationOptions;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 452
    return-object p0
.end method

.method public setDnsOptions(Lorg/chromium/net/DnsOptions$Builder;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "dnsOptions"    # Lorg/chromium/net/DnsOptions$Builder;

    .line 436
    invoke-virtual {p1}, Lorg/chromium/net/DnsOptions$Builder;->build()Lorg/chromium/net/DnsOptions;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/chromium/net/CronetEngine$Builder;->setDnsOptions(Lorg/chromium/net/DnsOptions;)Lorg/chromium/net/CronetEngine$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setDnsOptions(Lorg/chromium/net/DnsOptions;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "dnsOptions"    # Lorg/chromium/net/DnsOptions;

    .line 427
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setDnsOptions(Lorg/chromium/net/DnsOptions;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 428
    return-object p0
.end method

.method public setLibraryLoader(Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "loader"    # Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;

    .line 198
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setLibraryLoader(Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 199
    return-object p0
.end method

.method public setQuicOptions(Lorg/chromium/net/QuicOptions$Builder;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "quicOptionsBuilder"    # Lorg/chromium/net/QuicOptions$Builder;

    .line 414
    invoke-virtual {p1}, Lorg/chromium/net/QuicOptions$Builder;->build()Lorg/chromium/net/QuicOptions;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/chromium/net/CronetEngine$Builder;->setQuicOptions(Lorg/chromium/net/QuicOptions;)Lorg/chromium/net/CronetEngine$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setQuicOptions(Lorg/chromium/net/QuicOptions;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "quicOptions"    # Lorg/chromium/net/QuicOptions;

    .line 405
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setQuicOptions(Lorg/chromium/net/QuicOptions;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 406
    return-object p0
.end method

.method public setStoragePath(Ljava/lang/String;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 186
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setStoragePath(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 187
    return-object p0
.end method

.method public setThreadPriority(I)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "priority"    # I

    .line 375
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setThreadPriority(I)Lorg/chromium/net/ICronetEngineBuilder;

    .line 376
    return-object p0
.end method

.method public setUserAgent(Ljava/lang/String;)Lorg/chromium/net/CronetEngine$Builder;
    .locals 1
    .param p1, "userAgent"    # Ljava/lang/String;

    .line 171
    iget-object v0, p0, Lorg/chromium/net/CronetEngine$Builder;->mBuilderDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setUserAgent(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 172
    return-object p0
.end method
