.class public final Lorg/chromium/net/httpflags/ResolvedFlags;
.super Ljava/lang/Object;
.source "ResolvedFlags.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    }
.end annotation


# instance fields
.field private final mFlags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/net/httpflags/ResolvedFlags$Value;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$smparseVersionString(Ljava/lang/String;)[I
    .locals 0

    invoke-static {p0}, Lorg/chromium/net/httpflags/ResolvedFlags;->parseVersionString(Ljava/lang/String;)[I

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/net/httpflags/ResolvedFlags$Value;",
            ">;)V"
        }
    .end annotation

    .line 202
    .local p1, "flags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    iput-object p1, p0, Lorg/chromium/net/httpflags/ResolvedFlags;->mFlags:Ljava/util/Map;

    .line 204
    return-void
.end method

.method private static parseVersionString(Ljava/lang/String;)[I
    .locals 4
    .param p0, "versionString"    # Ljava/lang/String;

    .line 216
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 219
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, "."

    invoke-direct {v0, p0, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .local v0, "tokenizer":Ljava/util/StringTokenizer;
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v1

    new-array v1, v1, [I

    .line 221
    .local v1, "components":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 222
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aput v3, v1, v2

    .line 221
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 224
    .end local v2    # "i":I
    :cond_0
    return-object v1

    .line 217
    .end local v0    # "tokenizer":Ljava/util/StringTokenizer;
    .end local v1    # "components":[I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Version string is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p0    # "versionString":Ljava/lang/String;
    throw v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .restart local p0    # "versionString":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 226
    .local v0, "exception":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to parse HTTP flags version string: `"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "`"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static resolve(Lorg/chromium/net/httpflags/Flags;Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/httpflags/ResolvedFlags;
    .locals 8
    .param p0, "flags"    # Lorg/chromium/net/httpflags/Flags;
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "cronetVersion"    # Ljava/lang/String;

    .line 186
    invoke-static {p2}, Lorg/chromium/net/httpflags/ResolvedFlags;->parseVersionString(Ljava/lang/String;)[I

    move-result-object v0

    .line 187
    .local v0, "parsedCronetVersion":[I
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 188
    .local v1, "resolvedFlags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;>;"
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/Flags;->getFlagsMap()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 190
    .local v3, "flag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/FlagValue;>;"
    :try_start_0
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v4, p1, v0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->-$$Nest$smresolve(Lorg/chromium/net/httpflags/FlagValue;Ljava/lang/String;[I)Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    move-result-object v4

    .line 191
    .local v4, "value":Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    if-nez v4, :cond_0

    goto :goto_0

    .line 192
    :cond_0
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    nop

    .line 197
    .end local v3    # "flag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/FlagValue;>;"
    .end local v4    # "value":Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    goto :goto_0

    .line 193
    .restart local v3    # "flag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/FlagValue;>;"
    :catch_0
    move-exception v2

    .line 194
    .local v2, "exception":Ljava/lang/RuntimeException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    .line 195
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to resolve HTTP flag `"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "`"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 198
    .end local v2    # "exception":Ljava/lang/RuntimeException;
    .end local v3    # "flag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/FlagValue;>;"
    :cond_1
    new-instance v2, Lorg/chromium/net/httpflags/ResolvedFlags;

    invoke-direct {v2, v1}, Lorg/chromium/net/httpflags/ResolvedFlags;-><init>(Ljava/util/Map;)V

    return-object v2
.end method


# virtual methods
.method public flags()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/net/httpflags/ResolvedFlags$Value;",
            ">;"
        }
    .end annotation

    .line 211
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags;->mFlags:Ljava/util/Map;

    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
