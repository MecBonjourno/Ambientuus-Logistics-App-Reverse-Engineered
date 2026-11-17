.class public abstract Lorg/chromium/net/impl/CronetEngineBuilderImpl;
.super Lorg/chromium/net/ICronetEngineBuilder;
.source "CronetEngineBuilderImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;,
        Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;,
        Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;,
        Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheSetting;
    }
.end annotation


# static fields
.field private static final INVALID_PKP_HOST_NAME:Ljava/util/regex/Pattern;

.field private static final INVALID_THREAD_PRIORITY:I = 0x14


# instance fields
.field private final mApplicationContext:Landroid/content/Context;

.field private mBrotiEnabled:Z

.field private mDisableCache:Z

.field private mExperimentalOptions:Ljava/lang/String;

.field private mHttp2Enabled:Z

.field private mHttpCacheMaxSize:J

.field private mHttpCacheMode:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

.field protected mMockCertVerifier:J

.field private mNetworkQualityEstimatorEnabled:Z

.field private final mPkps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;",
            ">;"
        }
    .end annotation
.end field

.field private mPublicKeyPinningBypassForLocalTrustAnchorsEnabled:Z

.field private mQuicEnabled:Z

.field private final mQuicHints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;",
            ">;"
        }
    .end annotation
.end field

.field private mStoragePath:Ljava/lang/String;

.field private mThreadPriority:I

.field private mUserAgent:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 131
    const-string v0, "^[0-9\\.]*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->INVALID_PKP_HOST_NAME:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 158
    invoke-direct {p0}, Lorg/chromium/net/ICronetEngineBuilder;-><init>()V

    .line 138
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mQuicHints:Ljava/util/List;

    .line 139
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mPkps:Ljava/util/List;

    .line 152
    const/16 v0, 0x14

    iput v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mThreadPriority:I

    .line 159
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mApplicationContext:Landroid/content/Context;

    .line 160
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableQuic(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 161
    invoke-virtual {p0, v0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableHttp2(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 162
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableBrotli(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 163
    const-wide/16 v2, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableHttpCache(IJ)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 164
    invoke-virtual {p0, v1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableNetworkQualityEstimator(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 165
    invoke-virtual {p0, v0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enablePublicKeyPinningBypassForLocalTrustAnchors(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    .line 166
    return-void
.end method

.method private static validateHostNameForPinningAndConvert(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "hostName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 377
    sget-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->INVALID_PKP_HOST_NAME:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    const-string v1, "Hostname "

    if-nez v0, :cond_1

    .line 382
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0xff

    if-gt v0, v2, :cond_0

    .line 387
    const/4 v0, 0x2

    :try_start_0
    invoke-static {p0, v0}, Ljava/net/IDN;->toASCII(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 388
    :catch_0
    move-exception v0

    .line 389
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " is illegal. The name of the host does not comply with RFC 1122 and RFC 1123."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 383
    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is too long. The name of the host does not comply with RFC 1122 and RFC 1123."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 378
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is illegal. A hostname should not consist of digits and/or dots only."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public bridge synthetic addPublicKeyPins(Ljava/lang/String;Ljava/util/Set;ZLjava/util/Date;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->addPublicKeyPins(Ljava/lang/String;Ljava/util/Set;ZLjava/util/Date;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public addPublicKeyPins(Ljava/lang/String;Ljava/util/Set;ZLjava/util/Date;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 6
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
            "Lorg/chromium/net/impl/CronetEngineBuilderImpl;"
        }
    .end annotation

    .line 317
    .local p2, "pinsSha256":Ljava/util/Set;, "Ljava/util/Set<[B>;"
    if-eqz p1, :cond_4

    .line 320
    if-eqz p2, :cond_3

    .line 323
    if-eqz p4, :cond_2

    .line 326
    invoke-static {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->validateHostNameForPinningAndConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 328
    .local v0, "idnHostName":Ljava/lang/String;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 329
    .local v1, "hashes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 330
    .local v3, "pinSha256":[B
    if-eqz v3, :cond_0

    array-length v4, v3

    const/16 v5, 0x20

    if-ne v4, v5, :cond_0

    .line 333
    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    .end local v3    # "pinSha256":[B
    goto :goto_0

    .line 331
    .restart local v3    # "pinSha256":[B
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "Public key pin is invalid"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 336
    .end local v3    # "pinSha256":[B
    :cond_1
    iget-object v2, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mPkps:Ljava/util/List;

    new-instance v3, Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v5

    new-array v5, v5, [[B

    invoke-interface {v4, v5}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[B

    invoke-direct {v3, v0, v4, p3, p4}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;-><init>(Ljava/lang/String;[[BZLjava/util/Date;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    return-object p0

    .line 324
    .end local v0    # "idnHostName":Ljava/lang/String;
    .end local v1    # "hashes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "The pin expiration date cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 321
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "The set of SHA256 pins cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 318
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "The hostname cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic addQuicHint(Ljava/lang/String;II)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1, p2, p3}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->addQuicHint(Ljava/lang/String;II)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public addQuicHint(Ljava/lang/String;II)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "alternatePort"    # I

    .line 303
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 306
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mQuicHints:Ljava/util/List;

    new-instance v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;

    invoke-direct {v1, p1, p2, p3}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;-><init>(Ljava/lang/String;II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    return-object p0

    .line 304
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal QUIC Hint Host: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method brotliEnabled()Z
    .locals 1

    .line 261
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mBrotiEnabled:Z

    return v0
.end method

.method cacheDisabled()Z
    .locals 1

    .line 284
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mHttpCacheMode:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->isContentCacheEnabled()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public bridge synthetic enableBrotli(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableBrotli(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public enableBrotli(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "value"    # Z

    .line 255
    iput-boolean p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mBrotiEnabled:Z

    .line 256
    return-object p0
.end method

.method public bridge synthetic enableHttp2(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableHttp2(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public enableHttp2(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "value"    # Z

    .line 239
    iput-boolean p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mHttp2Enabled:Z

    .line 240
    return-object p0
.end method

.method public bridge synthetic enableHttpCache(IJ)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1, p2, p3}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableHttpCache(IJ)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public enableHttpCache(IJ)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 3
    .param p1, "cacheMode"    # I
    .param p2, "maxSize"    # J

    .line 271
    invoke-static {p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->fromPublicBuilderCacheMode(I)Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    move-result-object v0

    .line 273
    .local v0, "cacheModeEnum":Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;
    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->getType()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->storagePath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 274
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Storage path must be set"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 277
    :cond_1
    :goto_0
    iput-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mHttpCacheMode:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    .line 278
    iput-wide p2, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mHttpCacheMaxSize:J

    .line 280
    return-object p0
.end method

.method public bridge synthetic enableNetworkQualityEstimator(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableNetworkQualityEstimator(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public enableNetworkQualityEstimator(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "value"    # Z

    .line 431
    iput-boolean p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mNetworkQualityEstimatorEnabled:Z

    .line 432
    return-object p0
.end method

.method public bridge synthetic enablePublicKeyPinningBypassForLocalTrustAnchors(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enablePublicKeyPinningBypassForLocalTrustAnchors(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public enablePublicKeyPinningBypassForLocalTrustAnchors(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "value"    # Z

    .line 351
    iput-boolean p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mPublicKeyPinningBypassForLocalTrustAnchorsEnabled:Z

    .line 352
    return-object p0
.end method

.method public bridge synthetic enableQuic(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableQuic(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public enableQuic(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "value"    # Z

    .line 218
    iput-boolean p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mQuicEnabled:Z

    .line 219
    return-object p0
.end method

.method public bridge synthetic enableSdch(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->enableSdch(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public enableSdch(Z)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "value"    # Z

    .line 250
    return-object p0
.end method

.method public experimentalOptions()Ljava/lang/String;
    .locals 1

    .line 401
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mExperimentalOptions:Ljava/lang/String;

    return-object v0
.end method

.method getContext()Landroid/content/Context;
    .locals 1

    .line 458
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mApplicationContext:Landroid/content/Context;

    return-object v0
.end method

.method getDefaultQuicUserAgentId()Ljava/lang/String;
    .locals 1

    .line 234
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mQuicEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mApplicationContext:Landroid/content/Context;

    invoke-static {v0}, Lorg/chromium/net/impl/UserAgent;->getQuicUserAgentIdFrom(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getDefaultUserAgent()Ljava/lang/String;
    .locals 1

    .line 170
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mApplicationContext:Landroid/content/Context;

    invoke-static {v0}, Lorg/chromium/net/impl/UserAgent;->from(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getUserAgent()Ljava/lang/String;
    .locals 1

    .line 181
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mUserAgent:Ljava/lang/String;

    return-object v0
.end method

.method http2Enabled()Z
    .locals 1

    .line 245
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mHttp2Enabled:Z

    return v0
.end method

.method httpCacheMaxSize()J
    .locals 2

    .line 288
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mHttpCacheMaxSize:J

    return-wide v0
.end method

.method httpCacheMode()I
    .locals 1

    .line 293
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mHttpCacheMode:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->getType()I

    move-result v0

    return v0
.end method

.method libraryLoader()Lorg/chromium/net/impl/VersionSafeCallbacks$LibraryLoader;
    .locals 1

    .line 213
    const/4 v0, 0x0

    return-object v0
.end method

.method mockCertVerifier()J
    .locals 2

    .line 417
    iget-wide v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mMockCertVerifier:J

    return-wide v0
.end method

.method networkQualityEstimatorEnabled()Z
    .locals 1

    .line 426
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mNetworkQualityEstimatorEnabled:Z

    return v0
.end method

.method publicBuilderHttpCacheMode()I
    .locals 1

    .line 298
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mHttpCacheMode:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    invoke-virtual {v0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->toPublicBuilderCacheMode()I

    move-result v0

    return v0
.end method

.method publicKeyPinningBypassForLocalTrustAnchorsEnabled()Z
    .locals 1

    .line 357
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mPublicKeyPinningBypassForLocalTrustAnchorsEnabled:Z

    return v0
.end method

.method publicKeyPins()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/chromium/net/impl/CronetEngineBuilderImpl$Pkp;",
            ">;"
        }
    .end annotation

    .line 346
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mPkps:Ljava/util/List;

    return-object v0
.end method

.method quicEnabled()Z
    .locals 1

    .line 224
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mQuicEnabled:Z

    return v0
.end method

.method quicHints()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/chromium/net/impl/CronetEngineBuilderImpl$QuicHint;",
            ">;"
        }
    .end annotation

    .line 311
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mQuicHints:Ljava/util/List;

    return-object v0
.end method

.method public bridge synthetic setExperimentalOptions(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->setExperimentalOptions(Ljava/lang/String;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setExperimentalOptions(Ljava/lang/String;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "options"    # Ljava/lang/String;

    .line 396
    iput-object p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mExperimentalOptions:Ljava/lang/String;

    .line 397
    return-object p0
.end method

.method public bridge synthetic setLibraryLoader(Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->setLibraryLoader(Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setLibraryLoader(Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "loader"    # Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;

    .line 204
    return-object p0
.end method

.method public setMockCertVerifierForTesting(J)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "mockCertVerifier"    # J

    .line 412
    iput-wide p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mMockCertVerifier:J

    .line 413
    return-object p0
.end method

.method public bridge synthetic setStoragePath(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->setStoragePath(Ljava/lang/String;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setStoragePath(Ljava/lang/String;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 186
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    iput-object p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mStoragePath:Ljava/lang/String;

    .line 190
    return-object p0

    .line 187
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Storage path must be set to existing directory"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setThreadPriority(I)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->setThreadPriority(I)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setThreadPriority(I)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 2
    .param p1, "priority"    # I

    .line 437
    const/16 v0, 0x13

    if-gt p1, v0, :cond_0

    const/16 v0, -0x14

    if-lt p1, v0, :cond_0

    .line 440
    iput p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mThreadPriority:I

    .line 441
    return-object p0

    .line 438
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Thread priority invalid"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setUserAgent(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->setUserAgent(Ljava/lang/String;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;

    move-result-object p1

    return-object p1
.end method

.method public setUserAgent(Ljava/lang/String;)Lorg/chromium/net/impl/CronetEngineBuilderImpl;
    .locals 0
    .param p1, "userAgent"    # Ljava/lang/String;

    .line 175
    iput-object p1, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mUserAgent:Ljava/lang/String;

    .line 176
    return-object p0
.end method

.method storagePath()Ljava/lang/String;
    .locals 1

    .line 195
    iget-object v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mStoragePath:Ljava/lang/String;

    return-object v0
.end method

.method threadPriority(I)I
    .locals 2
    .param p1, "defaultThreadPriority"    # I

    .line 449
    iget v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mThreadPriority:I

    const/16 v1, 0x14

    if-ne v0, v1, :cond_0

    move v0, p1

    goto :goto_0

    :cond_0
    iget v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl;->mThreadPriority:I

    :goto_0
    return v0
.end method
