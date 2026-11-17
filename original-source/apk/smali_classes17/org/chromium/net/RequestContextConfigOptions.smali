.class public final Lorg/chromium/net/RequestContextConfigOptions;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "RequestContextConfigOptions.java"

# interfaces
.implements Lorg/chromium/net/RequestContextConfigOptionsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/RequestContextConfigOptions$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lorg/chromium/net/RequestContextConfigOptions;",
        "Lorg/chromium/net/RequestContextConfigOptions$Builder;",
        ">;",
        "Lorg/chromium/net/RequestContextConfigOptionsOrBuilder;"
    }
.end annotation


# static fields
.field public static final BROTLI_ENABLED_FIELD_NUMBER:I = 0x6

.field public static final BYPASS_PUBLIC_KEY_PINNING_FOR_LOCAL_TRUST_ANCHORS_FIELD_NUMBER:I = 0xd

.field private static final DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

.field public static final DISABLE_CACHE_FIELD_NUMBER:I = 0x7

.field public static final ENABLE_NETWORK_QUALITY_ESTIMATOR_FIELD_NUMBER:I = 0xc

.field public static final EXPERIMENTAL_OPTIONS_FIELD_NUMBER:I = 0xa

.field public static final HTTP2_ENABLED_FIELD_NUMBER:I = 0x5

.field public static final HTTP_CACHE_MAX_SIZE_FIELD_NUMBER:I = 0x9

.field public static final HTTP_CACHE_MODE_FIELD_NUMBER:I = 0x8

.field public static final MOCK_CERT_VERIFIER_FIELD_NUMBER:I = 0xb

.field public static final NETWORK_THREAD_PRIORITY_FIELD_NUMBER:I = 0xe

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lorg/chromium/net/RequestContextConfigOptions;",
            ">;"
        }
    .end annotation
.end field

.field public static final QUIC_DEFAULT_USER_AGENT_ID_FIELD_NUMBER:I = 0x4

.field public static final QUIC_ENABLED_FIELD_NUMBER:I = 0x3

.field public static final STORAGE_PATH_FIELD_NUMBER:I = 0x2

.field public static final USER_AGENT_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private brotliEnabled_:Z

.field private bypassPublicKeyPinningForLocalTrustAnchors_:Z

.field private disableCache_:Z

.field private enableNetworkQualityEstimator_:Z

.field private experimentalOptions_:Ljava/lang/String;

.field private http2Enabled_:Z

.field private httpCacheMaxSize_:J

.field private httpCacheMode_:I

.field private mockCertVerifier_:J

.field private networkThreadPriority_:I

.field private quicDefaultUserAgentId_:Ljava/lang/String;

.field private quicEnabled_:Z

.field private storagePath_:Ljava/lang/String;

.field private userAgent_:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$mclearBrotliEnabled(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearBrotliEnabled()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearBypassPublicKeyPinningForLocalTrustAnchors(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearBypassPublicKeyPinningForLocalTrustAnchors()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearDisableCache(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearDisableCache()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearEnableNetworkQualityEstimator(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearEnableNetworkQualityEstimator()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearExperimentalOptions(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearExperimentalOptions()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearHttp2Enabled(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearHttp2Enabled()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearHttpCacheMaxSize(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearHttpCacheMaxSize()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearHttpCacheMode(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearHttpCacheMode()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearMockCertVerifier(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearMockCertVerifier()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearNetworkThreadPriority(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearNetworkThreadPriority()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearQuicDefaultUserAgentId(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearQuicDefaultUserAgentId()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearQuicEnabled(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearQuicEnabled()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearStoragePath(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearStoragePath()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearUserAgent(Lorg/chromium/net/RequestContextConfigOptions;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/RequestContextConfigOptions;->clearUserAgent()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetBrotliEnabled(Lorg/chromium/net/RequestContextConfigOptions;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setBrotliEnabled(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetBypassPublicKeyPinningForLocalTrustAnchors(Lorg/chromium/net/RequestContextConfigOptions;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setBypassPublicKeyPinningForLocalTrustAnchors(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetDisableCache(Lorg/chromium/net/RequestContextConfigOptions;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setDisableCache(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetEnableNetworkQualityEstimator(Lorg/chromium/net/RequestContextConfigOptions;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setEnableNetworkQualityEstimator(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetExperimentalOptions(Lorg/chromium/net/RequestContextConfigOptions;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setExperimentalOptions(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetExperimentalOptionsBytes(Lorg/chromium/net/RequestContextConfigOptions;Lcom/google/protobuf/ByteString;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setExperimentalOptionsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetHttp2Enabled(Lorg/chromium/net/RequestContextConfigOptions;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setHttp2Enabled(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetHttpCacheMaxSize(Lorg/chromium/net/RequestContextConfigOptions;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lorg/chromium/net/RequestContextConfigOptions;->setHttpCacheMaxSize(J)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetHttpCacheMode(Lorg/chromium/net/RequestContextConfigOptions;I)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setHttpCacheMode(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetMockCertVerifier(Lorg/chromium/net/RequestContextConfigOptions;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lorg/chromium/net/RequestContextConfigOptions;->setMockCertVerifier(J)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetNetworkThreadPriority(Lorg/chromium/net/RequestContextConfigOptions;I)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setNetworkThreadPriority(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetQuicDefaultUserAgentId(Lorg/chromium/net/RequestContextConfigOptions;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setQuicDefaultUserAgentId(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetQuicDefaultUserAgentIdBytes(Lorg/chromium/net/RequestContextConfigOptions;Lcom/google/protobuf/ByteString;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setQuicDefaultUserAgentIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetQuicEnabled(Lorg/chromium/net/RequestContextConfigOptions;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setQuicEnabled(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetStoragePath(Lorg/chromium/net/RequestContextConfigOptions;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setStoragePath(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetStoragePathBytes(Lorg/chromium/net/RequestContextConfigOptions;Lcom/google/protobuf/ByteString;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setStoragePathBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetUserAgent(Lorg/chromium/net/RequestContextConfigOptions;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setUserAgent(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetUserAgentBytes(Lorg/chromium/net/RequestContextConfigOptions;Lcom/google/protobuf/ByteString;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->setUserAgentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetDEFAULT_INSTANCE()Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1

    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 1332
    new-instance v0, Lorg/chromium/net/RequestContextConfigOptions;

    invoke-direct {v0}, Lorg/chromium/net/RequestContextConfigOptions;-><init>()V

    .line 1335
    .local v0, "defaultInstance":Lorg/chromium/net/RequestContextConfigOptions;
    sput-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    .line 1336
    const-class v1, Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 1338
    .end local v0    # "defaultInstance":Lorg/chromium/net/RequestContextConfigOptions;
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->userAgent_:Ljava/lang/String;

    .line 16
    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->storagePath_:Ljava/lang/String;

    .line 17
    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicDefaultUserAgentId_:Ljava/lang/String;

    .line 18
    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->experimentalOptions_:Ljava/lang/String;

    .line 19
    return-void
.end method

.method private clearBrotliEnabled()V
    .locals 1

    .line 281
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 282
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->brotliEnabled_:Z

    .line 283
    return-void
.end method

.method private clearBypassPublicKeyPinningForLocalTrustAnchors()V
    .locals 1

    .line 539
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, -0x1001

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 540
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bypassPublicKeyPinningForLocalTrustAnchors_:Z

    .line 541
    return-void
.end method

.method private clearDisableCache()V
    .locals 1

    .line 315
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 316
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->disableCache_:Z

    .line 317
    return-void
.end method

.method private clearEnableNetworkQualityEstimator()V
    .locals 1

    .line 505
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, -0x801

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 506
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->enableNetworkQualityEstimator_:Z

    .line 507
    return-void
.end method

.method private clearExperimentalOptions()V
    .locals 1

    .line 428
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, -0x201

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 429
    invoke-static {}, Lorg/chromium/net/RequestContextConfigOptions;->getDefaultInstance()Lorg/chromium/net/RequestContextConfigOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/RequestContextConfigOptions;->getExperimentalOptions()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->experimentalOptions_:Ljava/lang/String;

    .line 430
    return-void
.end method

.method private clearHttp2Enabled()V
    .locals 1

    .line 247
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 248
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->http2Enabled_:Z

    .line 249
    return-void
.end method

.method private clearHttpCacheMaxSize()V
    .locals 2

    .line 383
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, -0x101

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 384
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->httpCacheMaxSize_:J

    .line 385
    return-void
.end method

.method private clearHttpCacheMode()V
    .locals 1

    .line 349
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 350
    const/4 v0, 0x0

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->httpCacheMode_:I

    .line 351
    return-void
.end method

.method private clearMockCertVerifier()V
    .locals 2

    .line 471
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, -0x401

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 472
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->mockCertVerifier_:J

    .line 473
    return-void
.end method

.method private clearNetworkThreadPriority()V
    .locals 1

    .line 573
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, -0x2001

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 574
    const/4 v0, 0x0

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->networkThreadPriority_:I

    .line 575
    return-void
.end method

.method private clearQuicDefaultUserAgentId()V
    .locals 1

    .line 204
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 205
    invoke-static {}, Lorg/chromium/net/RequestContextConfigOptions;->getDefaultInstance()Lorg/chromium/net/RequestContextConfigOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/RequestContextConfigOptions;->getQuicDefaultUserAgentId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicDefaultUserAgentId_:Ljava/lang/String;

    .line 206
    return-void
.end method

.method private clearQuicEnabled()V
    .locals 1

    .line 159
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 160
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicEnabled_:Z

    .line 161
    return-void
.end method

.method private clearStoragePath()V
    .locals 1

    .line 116
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 117
    invoke-static {}, Lorg/chromium/net/RequestContextConfigOptions;->getDefaultInstance()Lorg/chromium/net/RequestContextConfigOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/RequestContextConfigOptions;->getStoragePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->storagePath_:Ljava/lang/String;

    .line 118
    return-void
.end method

.method private clearUserAgent()V
    .locals 1

    .line 62
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 63
    invoke-static {}, Lorg/chromium/net/RequestContextConfigOptions;->getDefaultInstance()Lorg/chromium/net/RequestContextConfigOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/RequestContextConfigOptions;->getUserAgent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->userAgent_:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public static getDefaultInstance()Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1

    .line 1341
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static newBuilder()Lorg/chromium/net/RequestContextConfigOptions$Builder;
    .locals 1

    .line 652
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-virtual {v0}, Lorg/chromium/net/RequestContextConfigOptions;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions$Builder;

    return-object v0
.end method

.method public static newBuilder(Lorg/chromium/net/RequestContextConfigOptions;)Lorg/chromium/net/RequestContextConfigOptions$Builder;
    .locals 1
    .param p0, "prototype"    # Lorg/chromium/net/RequestContextConfigOptions;

    .line 655
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-virtual {v0, p0}, Lorg/chromium/net/RequestContextConfigOptions;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions$Builder;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 629
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0}, Lorg/chromium/net/RequestContextConfigOptions;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 635
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0, p1}, Lorg/chromium/net/RequestContextConfigOptions;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 593
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 600
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 640
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 647
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 617
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 624
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 580
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "data"    # Ljava/nio/ByteBuffer;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 587
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom([B)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 605
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/RequestContextConfigOptions;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 612
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lorg/chromium/net/RequestContextConfigOptions;",
            ">;"
        }
    .end annotation

    .line 1347
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-virtual {v0}, Lorg/chromium/net/RequestContextConfigOptions;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setBrotliEnabled(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 274
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 275
    iput-boolean p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->brotliEnabled_:Z

    .line 276
    return-void
.end method

.method private setBypassPublicKeyPinningForLocalTrustAnchors(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 532
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit16 v0, v0, 0x1000

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 533
    iput-boolean p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->bypassPublicKeyPinningForLocalTrustAnchors_:Z

    .line 534
    return-void
.end method

.method private setDisableCache(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 308
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 309
    iput-boolean p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->disableCache_:Z

    .line 310
    return-void
.end method

.method private setEnableNetworkQualityEstimator(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 498
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit16 v0, v0, 0x800

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 499
    iput-boolean p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->enableNetworkQualityEstimator_:Z

    .line 500
    return-void
.end method

.method private setExperimentalOptions(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 420
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 421
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit16 v0, v0, 0x200

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 422
    iput-object p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->experimentalOptions_:Ljava/lang/String;

    .line 423
    return-void
.end method

.method private setExperimentalOptionsBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .line 437
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->experimentalOptions_:Ljava/lang/String;

    .line 438
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit16 v0, v0, 0x200

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 439
    return-void
.end method

.method private setHttp2Enabled(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 240
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 241
    iput-boolean p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->http2Enabled_:Z

    .line 242
    return-void
.end method

.method private setHttpCacheMaxSize(J)V
    .locals 1
    .param p1, "value"    # J

    .line 376
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit16 v0, v0, 0x100

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 377
    iput-wide p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->httpCacheMaxSize_:J

    .line 378
    return-void
.end method

.method private setHttpCacheMode(I)V
    .locals 1
    .param p1, "value"    # I

    .line 342
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 343
    iput p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->httpCacheMode_:I

    .line 344
    return-void
.end method

.method private setMockCertVerifier(J)V
    .locals 1
    .param p1, "value"    # J

    .line 464
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit16 v0, v0, 0x400

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 465
    iput-wide p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->mockCertVerifier_:J

    .line 466
    return-void
.end method

.method private setNetworkThreadPriority(I)V
    .locals 1
    .param p1, "value"    # I

    .line 566
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit16 v0, v0, 0x2000

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 567
    iput p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->networkThreadPriority_:I

    .line 568
    return-void
.end method

.method private setQuicDefaultUserAgentId(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 196
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 197
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 198
    iput-object p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicDefaultUserAgentId_:Ljava/lang/String;

    .line 199
    return-void
.end method

.method private setQuicDefaultUserAgentIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .line 213
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicDefaultUserAgentId_:Ljava/lang/String;

    .line 214
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 215
    return-void
.end method

.method private setQuicEnabled(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 152
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 153
    iput-boolean p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicEnabled_:Z

    .line 154
    return-void
.end method

.method private setStoragePath(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 108
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 110
    iput-object p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->storagePath_:Ljava/lang/String;

    .line 111
    return-void
.end method

.method private setStoragePathBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .line 125
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->storagePath_:Ljava/lang/String;

    .line 126
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 127
    return-void
.end method

.method private setUserAgent(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 54
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 56
    iput-object p1, p0, Lorg/chromium/net/RequestContextConfigOptions;->userAgent_:Ljava/lang/String;

    .line 57
    return-void
.end method

.method private setUserAgentBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .line 71
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->userAgent_:Ljava/lang/String;

    .line 72
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    .line 73
    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "method"    # Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;
    .param p2, "arg0"    # Ljava/lang/Object;
    .param p3, "arg1"    # Ljava/lang/Object;

    .line 1267
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 1325
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 1322
    :pswitch_0
    return-object v2

    .line 1319
    :pswitch_1
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    return-object v0

    .line 1304
    :pswitch_2
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->PARSER:Lcom/google/protobuf/Parser;

    .line 1305
    .local v0, "parser":Lcom/google/protobuf/Parser;, "Lcom/google/protobuf/Parser<Lorg/chromium/net/RequestContextConfigOptions;>;"
    if-nez v0, :cond_1

    .line 1306
    const-class v1, Lorg/chromium/net/RequestContextConfigOptions;

    monitor-enter v1

    .line 1307
    :try_start_0
    sget-object v2, Lorg/chromium/net/RequestContextConfigOptions;->PARSER:Lcom/google/protobuf/Parser;

    move-object v0, v2

    .line 1308
    if-nez v0, :cond_0

    .line 1309
    new-instance v2, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object v3, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-direct {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    move-object v0, v2

    .line 1312
    sput-object v0, Lorg/chromium/net/RequestContextConfigOptions;->PARSER:Lcom/google/protobuf/Parser;

    .line 1314
    :cond_0
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 1316
    :cond_1
    :goto_0
    return-object v0

    .line 1301
    .end local v0    # "parser":Lcom/google/protobuf/Parser;, "Lcom/google/protobuf/Parser<Lorg/chromium/net/RequestContextConfigOptions;>;"
    :pswitch_3
    sget-object v0, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    return-object v0

    .line 1275
    :pswitch_4
    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "bitField0_"

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const-string v2, "userAgent_"

    aput-object v2, v0, v1

    const-string v1, "storagePath_"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "quicEnabled_"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string v1, "quicDefaultUserAgentId_"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string v1, "http2Enabled_"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string v1, "brotliEnabled_"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string v1, "disableCache_"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    const-string v1, "httpCacheMode_"

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const-string v1, "httpCacheMaxSize_"

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const-string v1, "experimentalOptions_"

    const/16 v2, 0xa

    aput-object v1, v0, v2

    const-string v1, "mockCertVerifier_"

    const/16 v2, 0xb

    aput-object v1, v0, v2

    const-string v1, "enableNetworkQualityEstimator_"

    const/16 v2, 0xc

    aput-object v1, v0, v2

    const-string v1, "bypassPublicKeyPinningForLocalTrustAnchors_"

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const-string v1, "networkThreadPriority_"

    const/16 v2, 0xe

    aput-object v1, v0, v2

    .line 1292
    .local v0, "objects":[Ljava/lang/Object;
    const-string v1, "\u0001\u000e\u0000\u0001\u0001\u000e\u000e\u0000\u0000\u0000\u0001\u1008\u0000\u0002\u1008\u0001\u0003\u1007\u0002\u0004\u1008\u0003\u0005\u1007\u0004\u0006\u1007\u0005\u0007\u1007\u0006\u0008\u1004\u0007\t\u1002\u0008\n\u1008\t\u000b\u1002\n\u000c\u1007\u000b\r\u1007\u000c\u000e\u1004\r"

    .line 1297
    .local v1, "info":Ljava/lang/String;
    sget-object v2, Lorg/chromium/net/RequestContextConfigOptions;->DEFAULT_INSTANCE:Lorg/chromium/net/RequestContextConfigOptions;

    invoke-static {v2, v1, v0}, Lorg/chromium/net/RequestContextConfigOptions;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 1272
    .end local v0    # "objects":[Ljava/lang/Object;
    .end local v1    # "info":Ljava/lang/String;
    :pswitch_5
    new-instance v0, Lorg/chromium/net/RequestContextConfigOptions$Builder;

    invoke-direct {v0, v2}, Lorg/chromium/net/RequestContextConfigOptions$Builder;-><init>(Lorg/chromium/net/RequestContextConfigOptions-IA;)V

    return-object v0

    .line 1269
    :pswitch_6
    new-instance v0, Lorg/chromium/net/RequestContextConfigOptions;

    invoke-direct {v0}, Lorg/chromium/net/RequestContextConfigOptions;-><init>()V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getBrotliEnabled()Z
    .locals 1

    .line 267
    iget-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->brotliEnabled_:Z

    return v0
.end method

.method public getBypassPublicKeyPinningForLocalTrustAnchors()Z
    .locals 1

    .line 525
    iget-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bypassPublicKeyPinningForLocalTrustAnchors_:Z

    return v0
.end method

.method public getDisableCache()Z
    .locals 1

    .line 301
    iget-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->disableCache_:Z

    return v0
.end method

.method public getEnableNetworkQualityEstimator()Z
    .locals 1

    .line 491
    iget-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->enableNetworkQualityEstimator_:Z

    return v0
.end method

.method public getExperimentalOptions()Ljava/lang/String;
    .locals 1

    .line 403
    iget-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->experimentalOptions_:Ljava/lang/String;

    return-object v0
.end method

.method public getExperimentalOptionsBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 412
    iget-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->experimentalOptions_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getHttp2Enabled()Z
    .locals 1

    .line 233
    iget-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->http2Enabled_:Z

    return v0
.end method

.method public getHttpCacheMaxSize()J
    .locals 2

    .line 369
    iget-wide v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->httpCacheMaxSize_:J

    return-wide v0
.end method

.method public getHttpCacheMode()I
    .locals 1

    .line 335
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->httpCacheMode_:I

    return v0
.end method

.method public getMockCertVerifier()J
    .locals 2

    .line 457
    iget-wide v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->mockCertVerifier_:J

    return-wide v0
.end method

.method public getNetworkThreadPriority()I
    .locals 1

    .line 559
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->networkThreadPriority_:I

    return v0
.end method

.method public getQuicDefaultUserAgentId()Ljava/lang/String;
    .locals 1

    .line 179
    iget-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicDefaultUserAgentId_:Ljava/lang/String;

    return-object v0
.end method

.method public getQuicDefaultUserAgentIdBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 188
    iget-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicDefaultUserAgentId_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getQuicEnabled()Z
    .locals 1

    .line 145
    iget-boolean v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->quicEnabled_:Z

    return v0
.end method

.method public getStoragePath()Ljava/lang/String;
    .locals 1

    .line 91
    iget-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->storagePath_:Ljava/lang/String;

    return-object v0
.end method

.method public getStoragePathBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 100
    iget-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->storagePath_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getUserAgent()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->userAgent_:Ljava/lang/String;

    return-object v0
.end method

.method public getUserAgentBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 46
    iget-object v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->userAgent_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public hasBrotliEnabled()Z
    .locals 1

    .line 259
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasBypassPublicKeyPinningForLocalTrustAnchors()Z
    .locals 1

    .line 517
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasDisableCache()Z
    .locals 1

    .line 293
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasEnableNetworkQualityEstimator()Z
    .locals 1

    .line 483
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, 0x800

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasExperimentalOptions()Z
    .locals 1

    .line 395
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasHttp2Enabled()Z
    .locals 1

    .line 225
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasHttpCacheMaxSize()Z
    .locals 1

    .line 361
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasHttpCacheMode()Z
    .locals 1

    .line 327
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasMockCertVerifier()Z
    .locals 1

    .line 449
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasNetworkThreadPriority()Z
    .locals 1

    .line 551
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit16 v0, v0, 0x2000

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasQuicDefaultUserAgentId()Z
    .locals 1

    .line 171
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasQuicEnabled()Z
    .locals 1

    .line 137
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasStoragePath()Z
    .locals 1

    .line 83
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasUserAgent()Z
    .locals 2

    .line 29
    iget v0, p0, Lorg/chromium/net/RequestContextConfigOptions;->bitField0_:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
