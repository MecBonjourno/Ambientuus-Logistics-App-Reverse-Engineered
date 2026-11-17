.class public Lorg/chromium/net/NetworkTrafficAnnotationTag;
.super Ljava/lang/Object;
.source "NetworkTrafficAnnotationTag.java"


# static fields
.field public static final MISSING_TRAFFIC_ANNOTATION:Lorg/chromium/net/NetworkTrafficAnnotationTag;

.field public static final NO_TRAFFIC_ANNOTATION_YET:Lorg/chromium/net/NetworkTrafficAnnotationTag;

.field public static final TRAFFIC_ANNOTATION_FOR_TESTS:Lorg/chromium/net/NetworkTrafficAnnotationTag;


# instance fields
.field private final mHashCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 28
    nop

    .line 29
    const-string v0, "undefined"

    const-string v1, "Nothing here yet."

    invoke-static {v0, v1}, Lorg/chromium/net/NetworkTrafficAnnotationTag;->createComplete(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/NetworkTrafficAnnotationTag;

    move-result-object v1

    sput-object v1, Lorg/chromium/net/NetworkTrafficAnnotationTag;->NO_TRAFFIC_ANNOTATION_YET:Lorg/chromium/net/NetworkTrafficAnnotationTag;

    .line 35
    nop

    .line 36
    const-string v1, "Function called without traffic annotation."

    invoke-static {v0, v1}, Lorg/chromium/net/NetworkTrafficAnnotationTag;->createComplete(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/NetworkTrafficAnnotationTag;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/NetworkTrafficAnnotationTag;->MISSING_TRAFFIC_ANNOTATION:Lorg/chromium/net/NetworkTrafficAnnotationTag;

    .line 39
    nop

    .line 40
    const-string v0, "test"

    const-string v1, "Traffic annotation for unit, browser and other tests"

    invoke-static {v0, v1}, Lorg/chromium/net/NetworkTrafficAnnotationTag;->createComplete(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/NetworkTrafficAnnotationTag;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/NetworkTrafficAnnotationTag;->TRAFFIC_ANNOTATION_FOR_TESTS:Lorg/chromium/net/NetworkTrafficAnnotationTag;

    .line 39
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "uniqueId"    # Ljava/lang/String;

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    invoke-static {p1}, Lorg/chromium/net/NetworkTrafficAnnotationTag;->iterativeHash(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/chromium/net/NetworkTrafficAnnotationTag;->mHashCode:I

    .line 87
    return-void
.end method

.method public static createComplete(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/NetworkTrafficAnnotationTag;
    .locals 1
    .param p0, "uniqueId"    # Ljava/lang/String;
    .param p1, "proto"    # Ljava/lang/String;

    .line 53
    new-instance v0, Lorg/chromium/net/NetworkTrafficAnnotationTag;

    invoke-direct {v0, p0}, Lorg/chromium/net/NetworkTrafficAnnotationTag;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method static iterativeHash(Ljava/lang/String;)I
    .locals 10
    .param p0, "s"    # Ljava/lang/String;

    .line 100
    const-wide/16 v0, 0x0

    .line 102
    .local v0, "acc":J
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 103
    .local v2, "bytes":[B
    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-byte v5, v2, v4

    .line 104
    .local v5, "b":B
    const-wide/16 v6, 0x1f

    mul-long/2addr v6, v0

    int-to-long v8, v5

    add-long/2addr v6, v8

    const-wide/32 v8, 0x839c501

    rem-long v0, v6, v8

    .line 103
    .end local v5    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 107
    :cond_0
    long-to-int v3, v0

    return v3
.end method


# virtual methods
.method public getHashCode()I
    .locals 1

    .line 75
    iget v0, p0, Lorg/chromium/net/NetworkTrafficAnnotationTag;->mHashCode:I

    return v0
.end method
