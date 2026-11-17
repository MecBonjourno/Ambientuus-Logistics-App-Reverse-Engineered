.class Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;
.super Ljava/lang/Object;
.source "AbstractGoogleClientRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ApiClientVersion"
.end annotation


# static fields
.field private static final JAVA_VERSION:Ljava/lang/String;

.field private static final OS_NAME:Ljava/lang/String;

.field private static final OS_VERSION:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 139
    invoke-static {}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->getJavaVersion()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->JAVA_VERSION:Ljava/lang/String;

    .line 140
    const-string v0, "os.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->OS_NAME:Ljava/lang/String;

    .line 141
    const-string v0, "os.version"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatSemver(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->OS_VERSION:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/google/api/client/googleapis/services/AbstractGoogleClient;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/api/client/googleapis/services/AbstractGoogleClient;

    .line 138
    invoke-static {p0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->build(Lcom/google/api/client/googleapis/services/AbstractGoogleClient;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static build(Lcom/google/api/client/googleapis/services/AbstractGoogleClient;)Ljava/lang/String;
    .locals 5
    .param p0, "client"    # Lcom/google/api/client/googleapis/services/AbstractGoogleClient;

    .line 145
    nop

    .line 148
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/google/api/client/googleapis/GoogleUtils;->VERSION:Ljava/lang/String;

    .line 149
    invoke-static {v1}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatSemver(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    sget-object v3, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->JAVA_VERSION:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v0, v2, v3

    const/4 v0, 0x2

    aput-object v1, v2, v0

    sget-object v0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->OS_NAME:Ljava/lang/String;

    const/4 v1, 0x3

    aput-object v0, v2, v1

    sget-object v0, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->OS_VERSION:Ljava/lang/String;

    const/4 v1, 0x4

    aput-object v0, v2, v1

    .line 145
    const-string v0, "java/%s http-google-%s/%s %s/%s"

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static formatName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .line 167
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "[^\\w\\d\\-]"

    const-string v2, "-"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static formatSemver(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "version"    # Ljava/lang/String;

    .line 172
    const-string v0, "(\\d+\\.\\d+\\.\\d+).*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 173
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 174
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 176
    :cond_0
    return-object p0
.end method

.method private static getJavaVersion()Ljava/lang/String;
    .locals 2

    .line 156
    const-string v0, "java.version"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "version":Ljava/lang/String;
    const-string v1, "9"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 159
    const-string v1, "9.0.0"

    return-object v1

    .line 161
    :cond_0
    invoke-static {v0}, Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest$ApiClientVersion;->formatSemver(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
