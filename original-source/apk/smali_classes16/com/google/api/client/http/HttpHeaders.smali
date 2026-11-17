.class public Lcom/google/api/client/http/HttpHeaders;
.super Lcom/google/api/client/util/GenericData;
.source "HttpHeaders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;,
        Lcom/google/api/client/http/HttpHeaders$HeaderParsingFakeLevelHttpRequest;
    }
.end annotation


# instance fields
.field private accept:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Accept"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private acceptEncoding:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Accept-Encoding"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private age:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Age"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private authenticate:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "WWW-Authenticate"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private authorization:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Authorization"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private cacheControl:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Cache-Control"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private contentEncoding:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Content-Encoding"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private contentLength:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Content-Length"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private contentMD5:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Content-MD5"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private contentRange:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Content-Range"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private contentType:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Content-Type"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private cookie:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Cookie"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private date:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Date"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private etag:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "ETag"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private expires:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Expires"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ifMatch:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "If-Match"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ifModifiedSince:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "If-Modified-Since"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ifNoneMatch:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "If-None-Match"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ifRange:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "If-Range"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ifUnmodifiedSince:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "If-Unmodified-Since"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private lastModified:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Last-Modified"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private location:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Location"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mimeVersion:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "MIME-Version"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private range:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Range"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private retryAfter:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "Retry-After"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private userAgent:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "User-Agent"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 62
    sget-object v0, Lcom/google/api/client/util/GenericData$Flags;->IGNORE_CASE:Lcom/google/api/client/util/GenericData$Flags;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/api/client/util/GenericData;-><init>(Ljava/util/EnumSet;)V

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    .line 71
    const-string v1, "gzip"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->acceptEncoding:Ljava/util/List;

    .line 63
    return-void
.end method

.method private static addHeader(Ljava/util/logging/Logger;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Lcom/google/api/client/http/LowLevelHttpRequest;Ljava/lang/String;Ljava/lang/Object;Ljava/io/Writer;)V
    .locals 5
    .param p0, "logger"    # Ljava/util/logging/Logger;
    .param p1, "logbuf"    # Ljava/lang/StringBuilder;
    .param p2, "curlbuf"    # Ljava/lang/StringBuilder;
    .param p3, "lowLevelHttpRequest"    # Lcom/google/api/client/http/LowLevelHttpRequest;
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "value"    # Ljava/lang/Object;
    .param p6, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 864
    if-eqz p5, :cond_8

    invoke-static {p5}, Lcom/google/api/client/util/Data;->isNull(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 868
    :cond_0
    invoke-static {p5}, Lcom/google/api/client/http/HttpHeaders;->toStringValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 870
    .local v0, "stringValue":Ljava/lang/String;
    move-object v1, v0

    .line 871
    .local v1, "loggedStringValue":Ljava/lang/String;
    const-string v2, "Authorization"

    invoke-virtual {v2, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "Cookie"

    invoke-virtual {v2, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_1
    if-eqz p0, :cond_2

    sget-object v2, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    .line 872
    invoke-virtual {p0, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 873
    :cond_2
    const-string v1, "<Not Logged>"

    .line 875
    :cond_3
    const-string v2, ": "

    if-eqz p1, :cond_4

    .line 876
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 877
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 878
    sget-object v3, Lcom/google/api/client/util/StringUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 880
    :cond_4
    if-eqz p2, :cond_5

    .line 881
    const-string v3, " -H \'"

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 884
    :cond_5
    if-eqz p3, :cond_6

    .line 885
    invoke-virtual {p3, p4, v0}, Lcom/google/api/client/http/LowLevelHttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 888
    :cond_6
    if-eqz p6, :cond_7

    .line 889
    invoke-virtual {p6, p4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 890
    invoke-virtual {p6, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 891
    invoke-virtual {p6, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 892
    const-string v2, "\r\n"

    invoke-virtual {p6, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 894
    :cond_7
    return-void

    .line 865
    .end local v0    # "stringValue":Ljava/lang/String;
    .end local v1    # "loggedStringValue":Ljava/lang/String;
    :cond_8
    :goto_0
    return-void
.end method

.method private getAsList(Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1023
    .local p1, "passedValue":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_0

    .line 1024
    const/4 v0, 0x0

    return-object v0

    .line 1026
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1027
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1028
    return-object v0
.end method

.method private getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1018
    .local p1, "internalValue":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private static parseValue(Ljava/lang/reflect/Type;Ljava/util/List;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p0, "valueType"    # Ljava/lang/reflect/Type;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Type;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1178
    .local p1, "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Type;>;"
    invoke-static {p1, p0}, Lcom/google/api/client/util/Data;->resolveWildcardTypeOrTypeVariable(Ljava/util/List;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 1179
    .local v0, "resolved":Ljava/lang/reflect/Type;
    invoke-static {v0, p2}, Lcom/google/api/client/util/Data;->parsePrimitiveValue(Ljava/lang/reflect/Type;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method static serializeHeaders(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/util/logging/Logger;Lcom/google/api/client/http/LowLevelHttpRequest;)V
    .locals 6
    .param p0, "headers"    # Lcom/google/api/client/http/HttpHeaders;
    .param p1, "logbuf"    # Ljava/lang/StringBuilder;
    .param p2, "curlbuf"    # Ljava/lang/StringBuilder;
    .param p3, "logger"    # Ljava/util/logging/Logger;
    .param p4, "lowLevelHttpRequest"    # Lcom/google/api/client/http/LowLevelHttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 917
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .end local p0    # "headers":Lcom/google/api/client/http/HttpHeaders;
    .end local p1    # "logbuf":Ljava/lang/StringBuilder;
    .end local p2    # "curlbuf":Ljava/lang/StringBuilder;
    .end local p3    # "logger":Ljava/util/logging/Logger;
    .end local p4    # "lowLevelHttpRequest":Lcom/google/api/client/http/LowLevelHttpRequest;
    .local v0, "headers":Lcom/google/api/client/http/HttpHeaders;
    .local v1, "logbuf":Ljava/lang/StringBuilder;
    .local v2, "curlbuf":Ljava/lang/StringBuilder;
    .local v3, "logger":Ljava/util/logging/Logger;
    .local v4, "lowLevelHttpRequest":Lcom/google/api/client/http/LowLevelHttpRequest;
    invoke-static/range {v0 .. v5}, Lcom/google/api/client/http/HttpHeaders;->serializeHeaders(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/util/logging/Logger;Lcom/google/api/client/http/LowLevelHttpRequest;Ljava/io/Writer;)V

    .line 918
    return-void
.end method

.method static serializeHeaders(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/util/logging/Logger;Lcom/google/api/client/http/LowLevelHttpRequest;Ljava/io/Writer;)V
    .locals 20
    .param p0, "headers"    # Lcom/google/api/client/http/HttpHeaders;
    .param p1, "logbuf"    # Ljava/lang/StringBuilder;
    .param p2, "curlbuf"    # Ljava/lang/StringBuilder;
    .param p3, "logger"    # Ljava/util/logging/Logger;
    .param p4, "lowLevelHttpRequest"    # Lcom/google/api/client/http/LowLevelHttpRequest;
    .param p5, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 942
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 943
    .local v0, "headerNames":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/http/HttpHeaders;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 944
    .local v2, "headerEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 945
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    const-string v6, "multiple headers of the same name (headers are case insensitive): %s"

    invoke-static {v4, v6, v5}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 947
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    .line 948
    .local v12, "value":Ljava/lang/Object;
    if-eqz v12, :cond_4

    .line 950
    move-object v4, v3

    .line 951
    .local v4, "displayName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/http/HttpHeaders;->getClassInfo()Lcom/google/api/client/util/ClassInfo;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/google/api/client/util/ClassInfo;->getFieldInfo(Ljava/lang/String;)Lcom/google/api/client/util/FieldInfo;

    move-result-object v5

    .line 952
    .local v5, "fieldInfo":Lcom/google/api/client/util/FieldInfo;
    if-eqz v5, :cond_0

    .line 953
    invoke-virtual {v5}, Lcom/google/api/client/util/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v4

    move-object v11, v4

    goto :goto_1

    .line 952
    :cond_0
    move-object v11, v4

    .line 955
    .end local v4    # "displayName":Ljava/lang/String;
    .local v11, "displayName":Ljava/lang/String;
    :goto_1
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 956
    .local v4, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Object;>;"
    instance-of v6, v12, Ljava/lang/Iterable;

    if-nez v6, :cond_2

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_2

    .line 967
    :cond_1
    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v7, p3

    move-object/from16 v10, p4

    move-object/from16 v13, p5

    invoke-static/range {v7 .. v13}, Lcom/google/api/client/http/HttpHeaders;->addHeader(Ljava/util/logging/Logger;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Lcom/google/api/client/http/LowLevelHttpRequest;Ljava/lang/String;Ljava/lang/Object;Ljava/io/Writer;)V

    goto :goto_4

    .line 957
    :cond_2
    :goto_2
    invoke-static {v12}, Lcom/google/api/client/util/Types;->iterableOf(Ljava/lang/Object;)Ljava/lang/Iterable;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    .line 958
    .local v18, "repeatedValue":Ljava/lang/Object;
    move-object/from16 v14, p1

    move-object/from16 v15, p2

    move-object/from16 v13, p3

    move-object/from16 v16, p4

    move-object/from16 v19, p5

    move-object/from16 v17, v11

    .end local v11    # "displayName":Ljava/lang/String;
    .local v17, "displayName":Ljava/lang/String;
    invoke-static/range {v13 .. v19}, Lcom/google/api/client/http/HttpHeaders;->addHeader(Ljava/util/logging/Logger;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Lcom/google/api/client/http/LowLevelHttpRequest;Ljava/lang/String;Ljava/lang/Object;Ljava/io/Writer;)V

    .line 965
    .end local v17    # "displayName":Ljava/lang/String;
    .end local v18    # "repeatedValue":Ljava/lang/Object;
    .restart local v11    # "displayName":Ljava/lang/String;
    goto :goto_3

    :cond_3
    nop

    .line 970
    .end local v2    # "headerEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Object;>;"
    .end local v5    # "fieldInfo":Lcom/google/api/client/util/FieldInfo;
    .end local v11    # "displayName":Ljava/lang/String;
    .end local v12    # "value":Ljava/lang/Object;
    :cond_4
    :goto_4
    goto :goto_0

    .line 971
    :cond_5
    if-eqz p5, :cond_6

    .line 972
    invoke-virtual/range {p5 .. p5}, Ljava/io/Writer;->flush()V

    .line 974
    :cond_6
    return-void
.end method

.method public static serializeHeadersForMultipartRequests(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;Ljava/util/logging/Logger;Ljava/io/Writer;)V
    .locals 6
    .param p0, "headers"    # Lcom/google/api/client/http/HttpHeaders;
    .param p1, "logbuf"    # Ljava/lang/StringBuilder;
    .param p2, "logger"    # Ljava/util/logging/Logger;
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 933
    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    .end local p0    # "headers":Lcom/google/api/client/http/HttpHeaders;
    .end local p1    # "logbuf":Ljava/lang/StringBuilder;
    .end local p2    # "logger":Ljava/util/logging/Logger;
    .end local p3    # "writer":Ljava/io/Writer;
    .local v0, "headers":Lcom/google/api/client/http/HttpHeaders;
    .local v1, "logbuf":Ljava/lang/StringBuilder;
    .local v3, "logger":Ljava/util/logging/Logger;
    .local v5, "writer":Ljava/io/Writer;
    invoke-static/range {v0 .. v5}, Lcom/google/api/client/http/HttpHeaders;->serializeHeaders(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/util/logging/Logger;Lcom/google/api/client/http/LowLevelHttpRequest;Ljava/io/Writer;)V

    .line 934
    return-void
.end method

.method private static toStringValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "headerValue"    # Ljava/lang/Object;

    .line 900
    instance-of v0, p0, Ljava/lang/Enum;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Ljava/lang/Enum;

    .line 901
    invoke-static {v0}, Lcom/google/api/client/util/FieldInfo;->of(Ljava/lang/Enum;)Lcom/google/api/client/util/FieldInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/client/util/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 900
    :goto_0
    return-object v0
.end method


# virtual methods
.method public clone()Lcom/google/api/client/http/HttpHeaders;
    .locals 1

    .line 171
    invoke-super {p0}, Lcom/google/api/client/util/GenericData;->clone()Lcom/google/api/client/util/GenericData;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/http/HttpHeaders;

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 59
    invoke-virtual {p0}, Lcom/google/api/client/http/HttpHeaders;->clone()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 59
    invoke-virtual {p0}, Lcom/google/api/client/http/HttpHeaders;->clone()Lcom/google/api/client/http/HttpHeaders;

    move-result-object v0

    return-object v0
.end method

.method public final fromHttpHeaders(Lcom/google/api/client/http/HttpHeaders;)V
    .locals 3
    .param p1, "headers"    # Lcom/google/api/client/http/HttpHeaders;

    .line 1083
    :try_start_0
    new-instance v0, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;-><init>(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;)V

    .line 1084
    .local v0, "state":Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;
    new-instance v2, Lcom/google/api/client/http/HttpHeaders$HeaderParsingFakeLevelHttpRequest;

    invoke-direct {v2, p0, v0}, Lcom/google/api/client/http/HttpHeaders$HeaderParsingFakeLevelHttpRequest;-><init>(Lcom/google/api/client/http/HttpHeaders;Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;)V

    invoke-static {p1, v1, v1, v1, v2}, Lcom/google/api/client/http/HttpHeaders;->serializeHeaders(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/util/logging/Logger;Lcom/google/api/client/http/LowLevelHttpRequest;)V

    .line 1086
    invoke-virtual {v0}, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;->finish()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1090
    .end local v0    # "state":Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;
    nop

    .line 1091
    return-void

    .line 1087
    :catch_0
    move-exception v0

    .line 1089
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {v0}, Lcom/google/api/client/util/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public final fromHttpResponse(Lcom/google/api/client/http/LowLevelHttpResponse;Ljava/lang/StringBuilder;)V
    .locals 5
    .param p1, "response"    # Lcom/google/api/client/http/LowLevelHttpResponse;
    .param p2, "logger"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 986
    invoke-virtual {p0}, Lcom/google/api/client/http/HttpHeaders;->clear()V

    .line 987
    new-instance v0, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;

    invoke-direct {v0, p0, p2}, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;-><init>(Lcom/google/api/client/http/HttpHeaders;Ljava/lang/StringBuilder;)V

    .line 988
    .local v0, "state":Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;
    invoke-virtual {p1}, Lcom/google/api/client/http/LowLevelHttpResponse;->getHeaderCount()I

    move-result v1

    .line 989
    .local v1, "headerCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 990
    invoke-virtual {p1, v2}, Lcom/google/api/client/http/LowLevelHttpResponse;->getHeaderName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2}, Lcom/google/api/client/http/LowLevelHttpResponse;->getHeaderValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4, v0}, Lcom/google/api/client/http/HttpHeaders;->parseHeader(Ljava/lang/String;Ljava/lang/String;Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;)V

    .line 989
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 992
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {v0}, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;->finish()V

    .line 993
    return-void
.end method

.method public final getAccept()Ljava/lang/String;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->accept:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getAcceptEncoding()Ljava/lang/String;
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->acceptEncoding:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getAge()Ljava/lang/Long;
    .locals 1

    .line 820
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->age:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method public final getAuthenticate()Ljava/lang/String;
    .locals 1

    .line 787
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->authenticate:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getAuthenticateAsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 796
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->authenticate:Ljava/util/List;

    return-object v0
.end method

.method public final getAuthorization()Ljava/lang/String;
    .locals 1

    .line 232
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->authorization:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getAuthorizationAsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 241
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->authorization:Ljava/util/List;

    return-object v0
.end method

.method public final getCacheControl()Ljava/lang/String;
    .locals 1

    .line 279
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->cacheControl:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getContentEncoding()Ljava/lang/String;
    .locals 1

    .line 303
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentEncoding:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getContentLength()Ljava/lang/Long;
    .locals 1

    .line 327
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentLength:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method public final getContentMD5()Ljava/lang/String;
    .locals 1

    .line 351
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentMD5:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getContentRange()Ljava/lang/String;
    .locals 1

    .line 375
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentRange:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getContentType()Ljava/lang/String;
    .locals 1

    .line 399
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentType:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getCookie()Ljava/lang/String;
    .locals 1

    .line 427
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->cookie:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getDate()Ljava/lang/String;
    .locals 1

    .line 451
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->date:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getETag()Ljava/lang/String;
    .locals 1

    .line 475
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->etag:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getExpires()Ljava/lang/String;
    .locals 1

    .line 499
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->expires:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getFirstHeaderStringValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 1039
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1040
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 1041
    const/4 v1, 0x0

    return-object v1

    .line 1043
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 1044
    .local v1, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Object;>;"
    instance-of v2, v0, Ljava/lang/Iterable;

    if-nez v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1045
    :cond_1
    invoke-static {v0}, Lcom/google/api/client/util/Types;->iterableOf(Ljava/lang/Object;)Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1046
    .local v2, "repeatedValue":Ljava/lang/Object;
    invoke-static {v2}, Lcom/google/api/client/http/HttpHeaders;->toStringValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1049
    .end local v2    # "repeatedValue":Ljava/lang/Object;
    :cond_2
    invoke-static {v0}, Lcom/google/api/client/http/HttpHeaders;->toStringValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getHeaderStringValues(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1060
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1061
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 1062
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 1064
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 1065
    .local v1, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Object;>;"
    instance-of v2, v0, Ljava/lang/Iterable;

    if-nez v2, :cond_2

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 1072
    :cond_1
    invoke-static {v0}, Lcom/google/api/client/http/HttpHeaders;->toStringValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 1066
    :cond_2
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1067
    .local v2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v0}, Lcom/google/api/client/util/Types;->iterableOf(Ljava/lang/Object;)Ljava/lang/Iterable;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 1068
    .local v4, "repeatedValue":Ljava/lang/Object;
    invoke-static {v4}, Lcom/google/api/client/http/HttpHeaders;->toStringValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1069
    .end local v4    # "repeatedValue":Ljava/lang/Object;
    goto :goto_1

    .line 1070
    :cond_3
    invoke-static {v2}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method

.method public final getIfMatch()Ljava/lang/String;
    .locals 1

    .line 547
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifMatch:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getIfModifiedSince()Ljava/lang/String;
    .locals 1

    .line 523
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifModifiedSince:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getIfNoneMatch()Ljava/lang/String;
    .locals 1

    .line 571
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifNoneMatch:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getIfRange()Ljava/lang/String;
    .locals 1

    .line 619
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifRange:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getIfUnmodifiedSince()Ljava/lang/String;
    .locals 1

    .line 595
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifUnmodifiedSince:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getLastModified()Ljava/lang/String;
    .locals 1

    .line 643
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->lastModified:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getLocation()Ljava/lang/String;
    .locals 1

    .line 667
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->location:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getMimeVersion()Ljava/lang/String;
    .locals 1

    .line 691
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->mimeVersion:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getRange()Ljava/lang/String;
    .locals 1

    .line 715
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->range:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getRetryAfter()Ljava/lang/String;
    .locals 1

    .line 739
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->retryAfter:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getUserAgent()Ljava/lang/String;
    .locals 1

    .line 763
    iget-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->userAgent:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->getFirstHeaderValue(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method parseHeader(Ljava/lang/String;Ljava/lang/String;Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;)V
    .locals 9
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "headerValue"    # Ljava/lang/String;
    .param p3, "state"    # Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;

    .line 1131
    iget-object v0, p3, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;->context:Ljava/util/List;

    .line 1132
    .local v0, "context":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Type;>;"
    iget-object v1, p3, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;->classInfo:Lcom/google/api/client/util/ClassInfo;

    .line 1133
    .local v1, "classInfo":Lcom/google/api/client/util/ClassInfo;
    iget-object v2, p3, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;->arrayValueMap:Lcom/google/api/client/util/ArrayValueMap;

    .line 1134
    .local v2, "arrayValueMap":Lcom/google/api/client/util/ArrayValueMap;
    iget-object v3, p3, Lcom/google/api/client/http/HttpHeaders$ParseHeaderState;->logger:Ljava/lang/StringBuilder;

    .line 1136
    .local v3, "logger":Ljava/lang/StringBuilder;
    if-eqz v3, :cond_0

    .line 1137
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/google/api/client/util/StringUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1140
    :cond_0
    invoke-virtual {v1, p1}, Lcom/google/api/client/util/ClassInfo;->getFieldInfo(Ljava/lang/String;)Lcom/google/api/client/util/FieldInfo;

    move-result-object v4

    .line 1141
    .local v4, "fieldInfo":Lcom/google/api/client/util/FieldInfo;
    if-eqz v4, :cond_5

    .line 1142
    invoke-virtual {v4}, Lcom/google/api/client/util/FieldInfo;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/google/api/client/util/Data;->resolveWildcardTypeOrTypeVariable(Ljava/util/List;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v5

    .line 1144
    .local v5, "type":Ljava/lang/reflect/Type;
    invoke-static {v5}, Lcom/google/api/client/util/Types;->isArray(Ljava/lang/reflect/Type;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1146
    nop

    .line 1147
    invoke-static {v5}, Lcom/google/api/client/util/Types;->getArrayComponentType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/google/api/client/util/Types;->getRawArrayComponentType(Ljava/util/List;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v6

    .line 1148
    .local v6, "rawArrayComponentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Lcom/google/api/client/util/FieldInfo;->getField()Ljava/lang/reflect/Field;

    move-result-object v7

    .line 1149
    invoke-static {v6, v0, p2}, Lcom/google/api/client/http/HttpHeaders;->parseValue(Ljava/lang/reflect/Type;Ljava/util/List;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 1148
    invoke-virtual {v2, v7, v6, v8}, Lcom/google/api/client/util/ArrayValueMap;->put(Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1150
    .end local v6    # "rawArrayComponentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_1

    .line 1151
    :cond_1
    invoke-static {v0, v5}, Lcom/google/api/client/util/Types;->getRawArrayComponentType(Ljava/util/List;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v6

    const-class v7, Ljava/lang/Iterable;

    .line 1150
    invoke-static {v6, v7}, Lcom/google/api/client/util/Types;->isAssignableToOrFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1154
    invoke-virtual {v4, p0}, Lcom/google/api/client/util/FieldInfo;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Collection;

    .line 1155
    .local v6, "collection":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    if-nez v6, :cond_2

    .line 1156
    invoke-static {v5}, Lcom/google/api/client/util/Data;->newCollectionInstance(Ljava/lang/reflect/Type;)Ljava/util/Collection;

    move-result-object v6

    .line 1157
    invoke-virtual {v4, p0, v6}, Lcom/google/api/client/util/FieldInfo;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1159
    :cond_2
    const-class v7, Ljava/lang/Object;

    if-ne v5, v7, :cond_3

    const/4 v7, 0x0

    goto :goto_0

    :cond_3
    invoke-static {v5}, Lcom/google/api/client/util/Types;->getIterableParameter(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v7

    .line 1160
    .local v7, "subFieldType":Ljava/lang/reflect/Type;
    :goto_0
    invoke-static {v7, v0, p2}, Lcom/google/api/client/http/HttpHeaders;->parseValue(Ljava/lang/reflect/Type;Ljava/util/List;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 1161
    .end local v6    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    .end local v7    # "subFieldType":Ljava/lang/reflect/Type;
    goto :goto_1

    .line 1163
    :cond_4
    invoke-static {v5, v0, p2}, Lcom/google/api/client/http/HttpHeaders;->parseValue(Ljava/lang/reflect/Type;Ljava/util/List;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, p0, v6}, Lcom/google/api/client/util/FieldInfo;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1165
    .end local v5    # "type":Ljava/lang/reflect/Type;
    :goto_1
    goto :goto_2

    .line 1168
    :cond_5
    invoke-virtual {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 1169
    .local v5, "listValue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez v5, :cond_6

    .line 1170
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v6

    .line 1171
    invoke-virtual {p0, p1, v5}, Lcom/google/api/client/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/http/HttpHeaders;

    .line 1173
    :cond_6
    invoke-virtual {v5, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1175
    .end local v5    # "listValue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_2
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 176
    invoke-super {p0, p1, p2}, Lcom/google/api/client/util/GenericData;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/http/HttpHeaders;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 59
    invoke-virtual {p0, p1, p2}, Lcom/google/api/client/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/http/HttpHeaders;

    move-result-object p1

    return-object p1
.end method

.method public setAccept(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "accept"    # Ljava/lang/String;

    .line 199
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->accept:Ljava/util/List;

    .line 200
    return-object p0
.end method

.method public setAcceptEncoding(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "acceptEncoding"    # Ljava/lang/String;

    .line 222
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->acceptEncoding:Ljava/util/List;

    .line 223
    return-object p0
.end method

.method public setAge(Ljava/lang/Long;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "age"    # Ljava/lang/Long;

    .line 834
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->age:Ljava/util/List;

    .line 835
    return-object p0
.end method

.method public setAuthenticate(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "authenticate"    # Ljava/lang/String;

    .line 810
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->authenticate:Ljava/util/List;

    .line 811
    return-object p0
.end method

.method public setAuthorization(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "authorization"    # Ljava/lang/String;

    .line 255
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/api/client/http/HttpHeaders;->setAuthorization(Ljava/util/List;)Lcom/google/api/client/http/HttpHeaders;

    move-result-object v0

    return-object v0
.end method

.method public setAuthorization(Ljava/util/List;)Lcom/google/api/client/http/HttpHeaders;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/client/http/HttpHeaders;"
        }
    .end annotation

    .line 269
    .local p1, "authorization":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/google/api/client/http/HttpHeaders;->authorization:Ljava/util/List;

    .line 270
    return-object p0
.end method

.method public setBasicAuthentication(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .line 850
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 851
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 852
    .local v0, "userPass":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/api/client/util/StringUtils;->getBytesUtf8(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/google/api/client/util/Base64;->encodeBase64String([B)Ljava/lang/String;

    move-result-object v1

    .line 853
    .local v1, "encoded":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Basic "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/api/client/http/HttpHeaders;->setAuthorization(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;

    move-result-object v2

    return-object v2
.end method

.method public setCacheControl(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "cacheControl"    # Ljava/lang/String;

    .line 293
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->cacheControl:Ljava/util/List;

    .line 294
    return-object p0
.end method

.method public setContentEncoding(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "contentEncoding"    # Ljava/lang/String;

    .line 317
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentEncoding:Ljava/util/List;

    .line 318
    return-object p0
.end method

.method public setContentLength(Ljava/lang/Long;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "contentLength"    # Ljava/lang/Long;

    .line 341
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentLength:Ljava/util/List;

    .line 342
    return-object p0
.end method

.method public setContentMD5(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "contentMD5"    # Ljava/lang/String;

    .line 365
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentMD5:Ljava/util/List;

    .line 366
    return-object p0
.end method

.method public setContentRange(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "contentRange"    # Ljava/lang/String;

    .line 389
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentRange:Ljava/util/List;

    .line 390
    return-object p0
.end method

.method public setContentType(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "contentType"    # Ljava/lang/String;

    .line 413
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->contentType:Ljava/util/List;

    .line 414
    return-object p0
.end method

.method public setCookie(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "cookie"    # Ljava/lang/String;

    .line 441
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->cookie:Ljava/util/List;

    .line 442
    return-object p0
.end method

.method public setDate(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "date"    # Ljava/lang/String;

    .line 465
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->date:Ljava/util/List;

    .line 466
    return-object p0
.end method

.method public setETag(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "etag"    # Ljava/lang/String;

    .line 489
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->etag:Ljava/util/List;

    .line 490
    return-object p0
.end method

.method public setExpires(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "expires"    # Ljava/lang/String;

    .line 513
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->expires:Ljava/util/List;

    .line 514
    return-object p0
.end method

.method public setIfMatch(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "ifMatch"    # Ljava/lang/String;

    .line 561
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifMatch:Ljava/util/List;

    .line 562
    return-object p0
.end method

.method public setIfModifiedSince(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "ifModifiedSince"    # Ljava/lang/String;

    .line 537
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifModifiedSince:Ljava/util/List;

    .line 538
    return-object p0
.end method

.method public setIfNoneMatch(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "ifNoneMatch"    # Ljava/lang/String;

    .line 585
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifNoneMatch:Ljava/util/List;

    .line 586
    return-object p0
.end method

.method public setIfRange(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "ifRange"    # Ljava/lang/String;

    .line 633
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifRange:Ljava/util/List;

    .line 634
    return-object p0
.end method

.method public setIfUnmodifiedSince(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "ifUnmodifiedSince"    # Ljava/lang/String;

    .line 609
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->ifUnmodifiedSince:Ljava/util/List;

    .line 610
    return-object p0
.end method

.method public setLastModified(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "lastModified"    # Ljava/lang/String;

    .line 657
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->lastModified:Ljava/util/List;

    .line 658
    return-object p0
.end method

.method public setLocation(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .line 681
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->location:Ljava/util/List;

    .line 682
    return-object p0
.end method

.method public setMimeVersion(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "mimeVersion"    # Ljava/lang/String;

    .line 705
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->mimeVersion:Ljava/util/List;

    .line 706
    return-object p0
.end method

.method public setRange(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "range"    # Ljava/lang/String;

    .line 729
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->range:Ljava/util/List;

    .line 730
    return-object p0
.end method

.method public setRetryAfter(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "retryAfter"    # Ljava/lang/String;

    .line 753
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->retryAfter:Ljava/util/List;

    .line 754
    return-object p0
.end method

.method public setUserAgent(Ljava/lang/String;)Lcom/google/api/client/http/HttpHeaders;
    .locals 1
    .param p1, "userAgent"    # Ljava/lang/String;

    .line 777
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpHeaders;->getAsList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/api/client/http/HttpHeaders;->userAgent:Ljava/util/List;

    .line 778
    return-object p0
.end method
