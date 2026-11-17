.class Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
.super Ljava/lang/Object;
.source "ProxyChangeListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/ProxyChangeListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProxyConfig"
.end annotation


# static fields
.field public static final DIRECT:Lorg/chromium/net/ProxyChangeListener$ProxyConfig;


# instance fields
.field public final mExclusionList:[Ljava/lang/String;

.field public final mHost:Ljava/lang/String;

.field public final mPacUrl:Ljava/lang/String;

.field public final mPort:I


# direct methods
.method static bridge synthetic -$$Nest$smfromProxyInfo(Landroid/net/ProxyInfo;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
    .locals 0

    invoke-static {p0}, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->fromProxyInfo(Landroid/net/ProxyInfo;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 104
    new-instance v0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, ""

    invoke-direct {v0, v3, v1, v3, v2}, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->DIRECT:Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "pacUrl"    # Ljava/lang/String;
    .param p4, "exclusionList"    # [Ljava/lang/String;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mHost:Ljava/lang/String;

    .line 75
    iput p2, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPort:I

    .line 76
    iput-object p3, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPacUrl:Ljava/lang/String;

    .line 77
    iput-object p4, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mExclusionList:[Ljava/lang/String;

    .line 78
    return-void
.end method

.method private static fromProxyInfo(Landroid/net/ProxyInfo;)Lorg/chromium/net/ProxyChangeListener$ProxyConfig;
    .locals 7
    .param p0, "proxyInfo"    # Landroid/net/ProxyInfo;

    .line 81
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 82
    return-object v0

    .line 84
    :cond_0
    invoke-virtual {p0}, Landroid/net/ProxyInfo;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 85
    .local v1, "host":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/net/ProxyInfo;->getPacFileUrl()Landroid/net/Uri;

    move-result-object v2

    .line 86
    .local v2, "pacFileUrl":Landroid/net/Uri;
    new-instance v3, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;

    if-nez v1, :cond_1

    const-string v4, ""

    goto :goto_0

    :cond_1
    move-object v4, v1

    :goto_0
    invoke-virtual {p0}, Landroid/net/ProxyInfo;->getPort()I

    move-result v5

    .line 87
    sget-object v6, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {v6, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    .line 88
    :goto_1
    invoke-virtual {p0}, Landroid/net/ProxyInfo;->getExclusionList()[Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v5, v0, v6}, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;)V

    .line 86
    return-object v3
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 6

    .line 94
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mHost:Ljava/lang/String;

    const-string v1, "localhost"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mHost:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "<redacted>"

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mHost:Ljava/lang/String;

    .line 95
    .local v0, "possiblyRedactedHost":Ljava/lang/String;
    :goto_1
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget v2, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPort:I

    .line 96
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lorg/chromium/net/ProxyChangeListener$ProxyConfig;->mPacUrl:Ljava/lang/String;

    if-nez v3, :cond_2

    const-string v3, "null"

    goto :goto_2

    :cond_2
    const-string v3, "\"<redacted>\""

    :goto_2
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x1

    aput-object v2, v4, v5

    const/4 v2, 0x2

    aput-object v3, v4, v2

    .line 95
    const-string v2, "ProxyConfig [mHost=\"%s\", mPort=%d, mPacUrl=%s]"

    invoke-static {v1, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
