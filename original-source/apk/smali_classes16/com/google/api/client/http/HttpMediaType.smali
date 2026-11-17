.class public final Lcom/google/api/client/http/HttpMediaType;
.super Ljava/lang/Object;
.source "HttpMediaType.java"


# static fields
.field private static final FULL_MEDIA_TYPE_REGEX:Ljava/util/regex/Pattern;

.field private static final PARAMETER_REGEX:Ljava/util/regex/Pattern;

.field private static final TOKEN_REGEX:Ljava/util/regex/Pattern;

.field private static final TYPE_REGEX:Ljava/util/regex/Pattern;


# instance fields
.field private cachedBuildResult:Ljava/lang/String;

.field private final parameters:Ljava/util/SortedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private subType:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 70
    const-string v0, "[\\w!#$&.+\\-\\^_]+|[*]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/http/HttpMediaType;->TYPE_REGEX:Ljava/util/regex/Pattern;

    .line 74
    nop

    .line 75
    const-string v0, "[\\p{ASCII}&&[^\\p{Cntrl} ;/=\\[\\]\\(\\)\\<\\>\\@\\,\\:\\\"\\?\\=]]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/http/HttpMediaType;->TOKEN_REGEX:Ljava/util/regex/Pattern;

    .line 80
    const-string v0, "[^\\s/=;\"]+"

    .line 81
    .local v0, "typeOrKey":Ljava/lang/String;
    const-string v1, ";.*"

    .line 82
    .local v1, "wholeParameterSection":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\\s*("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")/("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")\\s*("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x20

    invoke-static {v2, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    sput-object v2, Lcom/google/api/client/http/HttpMediaType;->FULL_MEDIA_TYPE_REGEX:Ljava/util/regex/Pattern;

    .line 89
    const-string v2, "\"([^\"]*)\""

    .line 90
    .local v2, "quotedParameterValue":Ljava/lang/String;
    const-string v3, "[^\\s;\"]*"

    .line 91
    .local v3, "unquotedParameterValue":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "|"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 92
    .local v4, "parameterValue":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\\s*;\\s*("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")=("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    sput-object v5, Lcom/google/api/client/http/HttpMediaType;->PARAMETER_REGEX:Ljava/util/regex/Pattern;

    .line 94
    .end local v0    # "typeOrKey":Ljava/lang/String;
    .end local v1    # "wholeParameterSection":Ljava/lang/String;
    .end local v2    # "quotedParameterValue":Ljava/lang/String;
    .end local v3    # "unquotedParameterValue":Ljava/lang/String;
    .end local v4    # "parameterValue":Ljava/lang/String;
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "mediaType"    # Ljava/lang/String;

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const-string v0, "application"

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->type:Ljava/lang/String;

    .line 58
    const-string v0, "octet-stream"

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->subType:Ljava/lang/String;

    .line 61
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    .line 112
    invoke-direct {p0, p1}, Lcom/google/api/client/http/HttpMediaType;->fromString(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 113
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "subType"    # Ljava/lang/String;

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const-string v0, "application"

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->type:Ljava/lang/String;

    .line 58
    const-string v0, "octet-stream"

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->subType:Ljava/lang/String;

    .line 61
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    .line 102
    invoke-virtual {p0, p1}, Lcom/google/api/client/http/HttpMediaType;->setType(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 103
    invoke-virtual {p0, p2}, Lcom/google/api/client/http/HttpMediaType;->setSubType(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 104
    return-void
.end method

.method public static equalsIgnoreParameters(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "mediaTypeA"    # Ljava/lang/String;
    .param p1, "mediaTypeB"    # Ljava/lang/String;

    .line 303
    if-nez p0, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    new-instance v0, Lcom/google/api/client/http/HttpMediaType;

    invoke-direct {v0, p0}, Lcom/google/api/client/http/HttpMediaType;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/google/api/client/http/HttpMediaType;

    invoke-direct {v1, p1}, Lcom/google/api/client/http/HttpMediaType;-><init>(Ljava/lang/String;)V

    .line 304
    invoke-virtual {v0, v1}, Lcom/google/api/client/http/HttpMediaType;->equalsIgnoreParameters(Lcom/google/api/client/http/HttpMediaType;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 303
    :goto_0
    return v0
.end method

.method private fromString(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;
    .locals 7
    .param p1, "combinedType"    # Ljava/lang/String;

    .line 167
    sget-object v0, Lcom/google/api/client/http/HttpMediaType;->FULL_MEDIA_TYPE_REGEX:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 168
    .local v0, "matcher":Ljava/util/regex/Matcher;
    nop

    .line 169
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    .line 168
    const-string v2, "Type must be in the \'maintype/subtype; parameter=value\' format"

    invoke-static {v1, v2}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 171
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/api/client/http/HttpMediaType;->setType(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 172
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/api/client/http/HttpMediaType;->setSubType(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 173
    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 174
    .local v4, "params":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 175
    sget-object v5, Lcom/google/api/client/http/HttpMediaType;->PARAMETER_REGEX:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 176
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 178
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 179
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 180
    .local v6, "value":Ljava/lang/String;
    if-nez v6, :cond_0

    .line 181
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 183
    :cond_0
    invoke-virtual {p0, v5, v6}, Lcom/google/api/client/http/HttpMediaType;->setParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 184
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    goto :goto_0

    .line 186
    :cond_1
    return-object p0
.end method

.method static matchesToken(Ljava/lang/String;)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .line 249
    sget-object v0, Lcom/google/api/client/http/HttpMediaType;->TOKEN_REGEX:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method private static quoteString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "unquotedString"    # Ljava/lang/String;

    .line 253
    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, "escapedString":Ljava/lang/String;
    const-string v1, "\\\""

    const-string v2, "\""

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 255
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public build()Ljava/lang/String;
    .locals 5

    .line 262
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 263
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    return-object v0

    .line 266
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .local v0, "str":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/google/api/client/http/HttpMediaType;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 269
    iget-object v1, p0, Lcom/google/api/client/http/HttpMediaType;->subType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    iget-object v1, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    if-eqz v1, :cond_2

    .line 271
    iget-object v1, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    invoke-interface {v1}, Ljava/util/SortedMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 272
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 273
    .local v3, "value":Ljava/lang/String;
    const-string v4, "; "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    const-string v4, "="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    invoke-static {v3}, Lcom/google/api/client/http/HttpMediaType;->matchesToken(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-static {v3}, Lcom/google/api/client/http/HttpMediaType;->quoteString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_1
    move-object v4, v3

    :goto_1
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "value":Ljava/lang/String;
    goto :goto_0

    .line 279
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    .line 280
    iget-object v1, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    return-object v1
.end method

.method public clearParameters()V
    .locals 1

    .line 232
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    .line 233
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    invoke-interface {v0}, Ljava/util/SortedMap;->clear()V

    .line 234
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 332
    instance-of v0, p1, Lcom/google/api/client/http/HttpMediaType;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 333
    return v1

    .line 336
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/google/api/client/http/HttpMediaType;

    .line 338
    .local v0, "otherType":Lcom/google/api/client/http/HttpMediaType;
    invoke-virtual {p0, v0}, Lcom/google/api/client/http/HttpMediaType;->equalsIgnoreParameters(Lcom/google/api/client/http/HttpMediaType;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    iget-object v3, v0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public equalsIgnoreParameters(Lcom/google/api/client/http/HttpMediaType;)Z
    .locals 2
    .param p1, "mediaType"    # Lcom/google/api/client/http/HttpMediaType;

    .line 293
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/google/api/client/http/HttpMediaType;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/api/client/http/HttpMediaType;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    invoke-virtual {p0}, Lcom/google/api/client/http/HttpMediaType;->getSubType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/api/client/http/HttpMediaType;->getSubType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 293
    :goto_0
    return v0
.end method

.method public getCharsetParameter()Ljava/nio/charset/Charset;
    .locals 2

    .line 321
    const-string v0, "charset"

    invoke-virtual {p0, v0}, Lcom/google/api/client/http/HttpMediaType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 322
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 214
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getParameters()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 241
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getSubType()Ljava/lang/String;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->subType:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->type:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 327
    invoke-virtual {p0}, Lcom/google/api/client/http/HttpMediaType;->build()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public removeParameter(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 223
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    .line 224
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    return-object p0
.end method

.method public setCharsetParameter(Ljava/nio/charset/Charset;)Lcom/google/api/client/http/HttpMediaType;
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .line 313
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    :goto_0
    const-string v1, "charset"

    invoke-virtual {p0, v1, v0}, Lcom/google/api/client/http/HttpMediaType;->setParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 314
    return-object p0
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 196
    if-nez p2, :cond_0

    .line 197
    invoke-virtual {p0, p1}, Lcom/google/api/client/http/HttpMediaType;->removeParameter(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;

    .line 198
    return-object p0

    .line 201
    :cond_0
    sget-object v0, Lcom/google/api/client/http/HttpMediaType;->TOKEN_REGEX:Ljava/util/regex/Pattern;

    .line 202
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    .line 201
    const-string v1, "Name contains reserved characters"

    invoke-static {v0, v1}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 203
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    .line 204
    iget-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->parameters:Ljava/util/SortedMap;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    return-object p0
.end method

.method public setSubType(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;
    .locals 2
    .param p1, "subType"    # Ljava/lang/String;

    .line 141
    sget-object v0, Lcom/google/api/client/http/HttpMediaType;->TYPE_REGEX:Ljava/util/regex/Pattern;

    .line 142
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    .line 141
    const-string v1, "Subtype contains reserved characters"

    invoke-static {v0, v1}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 143
    iput-object p1, p0, Lcom/google/api/client/http/HttpMediaType;->subType:Ljava/lang/String;

    .line 144
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    .line 145
    return-object p0
.end method

.method public setType(Ljava/lang/String;)Lcom/google/api/client/http/HttpMediaType;
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .line 121
    sget-object v0, Lcom/google/api/client/http/HttpMediaType;->TYPE_REGEX:Ljava/util/regex/Pattern;

    .line 122
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    .line 121
    const-string v1, "Type contains reserved characters"

    invoke-static {v0, v1}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 123
    iput-object p1, p0, Lcom/google/api/client/http/HttpMediaType;->type:Ljava/lang/String;

    .line 124
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/api/client/http/HttpMediaType;->cachedBuildResult:Ljava/lang/String;

    .line 125
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 285
    invoke-virtual {p0}, Lcom/google/api/client/http/HttpMediaType;->build()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
