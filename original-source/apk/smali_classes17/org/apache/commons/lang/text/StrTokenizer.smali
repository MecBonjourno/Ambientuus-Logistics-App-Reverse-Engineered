.class public Lorg/apache/commons/lang/text/StrTokenizer;
.super Ljava/lang/Object;
.source "StrTokenizer.java"

# interfaces
.implements Ljava/util/ListIterator;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

.field private static final TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;


# instance fields
.field private chars:[C

.field private delimMatcher:Lorg/apache/commons/lang/text/StrMatcher;

.field private emptyAsNull:Z

.field private ignoreEmptyTokens:Z

.field private ignoredMatcher:Lorg/apache/commons/lang/text/StrMatcher;

.field private quoteMatcher:Lorg/apache/commons/lang/text/StrMatcher;

.field private tokenPos:I

.field private tokens:[Ljava/lang/String;

.field private trimmerMatcher:Lorg/apache/commons/lang/text/StrMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 93
    new-instance v0, Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-direct {v0}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    .line 94
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->commaMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 95
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->doubleQuoteMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->setQuoteMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 96
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->setIgnoredMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 97
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->trimMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->setTrimmerMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 98
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->setEmptyTokenAsNull(Z)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 99
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->setIgnoreEmptyTokens(Z)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 101
    new-instance v0, Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-direct {v0}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    .line 102
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->tabMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 103
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->doubleQuoteMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/lang/text/StrTokenizer;->setQuoteMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 104
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/lang/text/StrTokenizer;->setIgnoredMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 105
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->trimMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/lang/text/StrTokenizer;->setTrimmerMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 106
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->setEmptyTokenAsNull(Z)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 107
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->setIgnoreEmptyTokens(Z)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 108
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 241
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->splitMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->delimMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 120
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->quoteMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 122
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoredMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 124
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->trimmerMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->emptyAsNull:Z

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoreEmptyTokens:Z

    .line 242
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    .line 243
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "input"    # Ljava/lang/String;

    .line 252
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->splitMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->delimMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 120
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->quoteMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 122
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoredMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 124
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->trimmerMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->emptyAsNull:Z

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoreEmptyTokens:Z

    .line 253
    if-eqz p1, :cond_0

    .line 254
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    goto :goto_0

    .line 256
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    .line 258
    :goto_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;C)V
    .locals 0
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "delim"    # C

    .line 267
    invoke-direct {p0, p1}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>(Ljava/lang/String;)V

    .line 268
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterChar(C)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 269
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;CC)V
    .locals 0
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "delim"    # C
    .param p3, "quote"    # C

    .line 302
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>(Ljava/lang/String;C)V

    .line 303
    invoke-virtual {p0, p3}, Lorg/apache/commons/lang/text/StrTokenizer;->setQuoteChar(C)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 304
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "delim"    # Ljava/lang/String;

    .line 278
    invoke-direct {p0, p1}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>(Ljava/lang/String;)V

    .line 279
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterString(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 280
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/commons/lang/text/StrMatcher;)V
    .locals 0
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "delim"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 289
    invoke-direct {p0, p1}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>(Ljava/lang/String;)V

    .line 290
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 291
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/commons/lang/text/StrMatcher;Lorg/apache/commons/lang/text/StrMatcher;)V
    .locals 0
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "delim"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p3, "quote"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 315
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>(Ljava/lang/String;Lorg/apache/commons/lang/text/StrMatcher;)V

    .line 316
    invoke-virtual {p0, p3}, Lorg/apache/commons/lang/text/StrTokenizer;->setQuoteMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 317
    return-void
.end method

.method public constructor <init>([C)V
    .locals 1
    .param p1, "input"    # [C

    .line 329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->splitMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->delimMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 120
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->quoteMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 122
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoredMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 124
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->trimmerMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->emptyAsNull:Z

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoreEmptyTokens:Z

    .line 330
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    .line 331
    return-void
.end method

.method public constructor <init>([CC)V
    .locals 0
    .param p1, "input"    # [C
    .param p2, "delim"    # C

    .line 343
    invoke-direct {p0, p1}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>([C)V

    .line 344
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterChar(C)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 345
    return-void
.end method

.method public constructor <init>([CCC)V
    .locals 0
    .param p1, "input"    # [C
    .param p2, "delim"    # C
    .param p3, "quote"    # C

    .line 387
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>([CC)V

    .line 388
    invoke-virtual {p0, p3}, Lorg/apache/commons/lang/text/StrTokenizer;->setQuoteChar(C)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 389
    return-void
.end method

.method public constructor <init>([CLjava/lang/String;)V
    .locals 0
    .param p1, "input"    # [C
    .param p2, "delim"    # Ljava/lang/String;

    .line 357
    invoke-direct {p0, p1}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>([C)V

    .line 358
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterString(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 359
    return-void
.end method

.method public constructor <init>([CLorg/apache/commons/lang/text/StrMatcher;)V
    .locals 0
    .param p1, "input"    # [C
    .param p2, "delim"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 371
    invoke-direct {p0, p1}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>([C)V

    .line 372
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 373
    return-void
.end method

.method public constructor <init>([CLorg/apache/commons/lang/text/StrMatcher;Lorg/apache/commons/lang/text/StrMatcher;)V
    .locals 0
    .param p1, "input"    # [C
    .param p2, "delim"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p3, "quote"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 403
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/StrTokenizer;-><init>([CLorg/apache/commons/lang/text/StrMatcher;)V

    .line 404
    invoke-virtual {p0, p3}, Lorg/apache/commons/lang/text/StrTokenizer;->setQuoteMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 405
    return-void
.end method

.method private addToken(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .param p1, "list"    # Ljava/util/List;
    .param p2, "tok"    # Ljava/lang/String;

    .line 672
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 673
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->isIgnoreEmptyTokens()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 674
    return-void

    .line 676
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->isEmptyTokenAsNull()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 677
    const/4 p2, 0x0

    .line 680
    :cond_2
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 681
    return-void
.end method

.method private checkTokenized()V
    .locals 3

    .line 612
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    if-nez v0, :cond_1

    .line 613
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 615
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1, v1}, Lorg/apache/commons/lang/text/StrTokenizer;->tokenize([CII)Ljava/util/List;

    move-result-object v0

    .line 616
    .local v0, "split":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    .end local v0    # "split":Ljava/util/List;
    goto :goto_0

    .line 618
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    array-length v2, v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/commons/lang/text/StrTokenizer;->tokenize([CII)Ljava/util/List;

    move-result-object v0

    .line 619
    .restart local v0    # "split":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    .line 622
    .end local v0    # "split":Ljava/util/List;
    :cond_1
    :goto_0
    return-void
.end method

.method private static getCSVClone()Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1

    .line 139
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->CSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrTokenizer;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/lang/text/StrTokenizer;

    return-object v0
.end method

.method public static getCSVInstance()Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1

    .line 152
    invoke-static {}, Lorg/apache/commons/lang/text/StrTokenizer;->getCSVClone()Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    return-object v0
.end method

.method public static getCSVInstance(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p0, "input"    # Ljava/lang/String;

    .line 165
    invoke-static {}, Lorg/apache/commons/lang/text/StrTokenizer;->getCSVClone()Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    .line 166
    .local v0, "tok":Lorg/apache/commons/lang/text/StrTokenizer;
    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/text/StrTokenizer;->reset(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 167
    return-object v0
.end method

.method public static getCSVInstance([C)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p0, "input"    # [C

    .line 180
    invoke-static {}, Lorg/apache/commons/lang/text/StrTokenizer;->getCSVClone()Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    .line 181
    .local v0, "tok":Lorg/apache/commons/lang/text/StrTokenizer;
    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/text/StrTokenizer;->reset([C)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 182
    return-object v0
.end method

.method private static getTSVClone()Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1

    .line 191
    sget-object v0, Lorg/apache/commons/lang/text/StrTokenizer;->TSV_TOKENIZER_PROTOTYPE:Lorg/apache/commons/lang/text/StrTokenizer;

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrTokenizer;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/lang/text/StrTokenizer;

    return-object v0
.end method

.method public static getTSVInstance()Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1

    .line 204
    invoke-static {}, Lorg/apache/commons/lang/text/StrTokenizer;->getTSVClone()Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    return-object v0
.end method

.method public static getTSVInstance(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p0, "input"    # Ljava/lang/String;

    .line 215
    invoke-static {}, Lorg/apache/commons/lang/text/StrTokenizer;->getTSVClone()Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    .line 216
    .local v0, "tok":Lorg/apache/commons/lang/text/StrTokenizer;
    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/text/StrTokenizer;->reset(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 217
    return-object v0
.end method

.method public static getTSVInstance([C)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p0, "input"    # [C

    .line 228
    invoke-static {}, Lorg/apache/commons/lang/text/StrTokenizer;->getTSVClone()Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    .line 229
    .local v0, "tok":Lorg/apache/commons/lang/text/StrTokenizer;
    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/text/StrTokenizer;->reset([C)Lorg/apache/commons/lang/text/StrTokenizer;

    .line 230
    return-object v0
.end method

.method private isQuote([CIIII)Z
    .locals 3
    .param p1, "chars"    # [C
    .param p2, "pos"    # I
    .param p3, "len"    # I
    .param p4, "quoteStart"    # I
    .param p5, "quoteLen"    # I

    .line 844
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p5, :cond_2

    .line 845
    add-int v1, p2, v0

    if-ge v1, p3, :cond_1

    add-int v1, p2, v0

    aget-char v1, p1, v1

    add-int v2, p4, v0

    aget-char v2, p1, v2

    if-eq v1, v2, :cond_0

    goto :goto_1

    .line 844
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 846
    :cond_1
    :goto_1
    const/4 v1, 0x0

    return v1

    .line 849
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method private readNextToken([CIILorg/apache/commons/lang/text/StrBuilder;Ljava/util/List;)I
    .locals 9
    .param p1, "chars"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .param p4, "workArea"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p5, "tokens"    # Ljava/util/List;

    .line 697
    move v2, p2

    .end local p2    # "start":I
    .local v2, "start":I
    :goto_0
    if-ge v2, p3, :cond_1

    .line 698
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getIgnoredMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object p2

    invoke-virtual {p2, p1, v2, v2, p3}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result p2

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getTrimmerMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {v0, p1, v2, v2, p3}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 701
    .local p2, "removeLen":I
    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getDelimiterMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {v0, p1, v2, v2, p3}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v0

    if-gtz v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getQuoteMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {v0, p1, v2, v2, p3}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v0

    if-lez v0, :cond_0

    .line 704
    goto :goto_1

    .line 706
    :cond_0
    add-int/2addr v2, p2

    .end local p2    # "removeLen":I
    goto :goto_0

    .line 710
    :cond_1
    :goto_1
    const-string p2, ""

    if-lt v2, p3, :cond_2

    .line 711
    invoke-direct {p0, p5, p2}, Lorg/apache/commons/lang/text/StrTokenizer;->addToken(Ljava/util/List;Ljava/lang/String;)V

    .line 712
    const/4 p2, -0x1

    return p2

    .line 716
    :cond_2
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getDelimiterMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {v0, p1, v2, v2, p3}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v8

    .line 717
    .local v8, "delimLen":I
    if-lez v8, :cond_3

    .line 718
    invoke-direct {p0, p5, p2}, Lorg/apache/commons/lang/text/StrTokenizer;->addToken(Ljava/util/List;Ljava/lang/String;)V

    .line 719
    add-int p2, v2, v8

    return p2

    .line 723
    :cond_3
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getQuoteMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object p2

    invoke-virtual {p2, p1, v2, v2, p3}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v7

    .line 724
    .local v7, "quoteLen":I
    if-lez v7, :cond_4

    .line 725
    move v6, v2

    .end local v2    # "start":I
    .local v6, "start":I
    add-int v2, v6, v7

    move-object v0, p0

    move-object v1, p1

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .end local p1    # "chars":[C
    .end local p3    # "len":I
    .end local p4    # "workArea":Lorg/apache/commons/lang/text/StrBuilder;
    .end local p5    # "tokens":Ljava/util/List;
    .local v1, "chars":[C
    .local v3, "len":I
    .local v4, "workArea":Lorg/apache/commons/lang/text/StrBuilder;
    .local v5, "tokens":Ljava/util/List;
    invoke-direct/range {v0 .. v7}, Lorg/apache/commons/lang/text/StrTokenizer;->readWithQuotes([CIILorg/apache/commons/lang/text/StrBuilder;Ljava/util/List;II)I

    move-result p1

    move p2, v7

    .end local v7    # "quoteLen":I
    .local p2, "quoteLen":I
    return p1

    .line 727
    .end local v1    # "chars":[C
    .end local v3    # "len":I
    .end local v4    # "workArea":Lorg/apache/commons/lang/text/StrBuilder;
    .end local v5    # "tokens":Ljava/util/List;
    .end local v6    # "start":I
    .end local p2    # "quoteLen":I
    .restart local v2    # "start":I
    .restart local v7    # "quoteLen":I
    .restart local p1    # "chars":[C
    .restart local p3    # "len":I
    .restart local p4    # "workArea":Lorg/apache/commons/lang/text/StrBuilder;
    .restart local p5    # "tokens":Ljava/util/List;
    :cond_4
    move-object v1, p1

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move p2, v7

    .end local v7    # "quoteLen":I
    .end local p1    # "chars":[C
    .end local p3    # "len":I
    .end local p4    # "workArea":Lorg/apache/commons/lang/text/StrBuilder;
    .end local p5    # "tokens":Ljava/util/List;
    .restart local v1    # "chars":[C
    .restart local v3    # "len":I
    .restart local v4    # "workArea":Lorg/apache/commons/lang/text/StrBuilder;
    .restart local v5    # "tokens":Ljava/util/List;
    .restart local p2    # "quoteLen":I
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lorg/apache/commons/lang/text/StrTokenizer;->readWithQuotes([CIILorg/apache/commons/lang/text/StrBuilder;Ljava/util/List;II)I

    move-result p1

    move v6, v2

    .end local v2    # "start":I
    .restart local v6    # "start":I
    return p1
.end method

.method private readWithQuotes([CIILorg/apache/commons/lang/text/StrBuilder;Ljava/util/List;II)I
    .locals 14
    .param p1, "chars"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .param p4, "workArea"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p5, "tokens"    # Ljava/util/List;
    .param p6, "quoteStart"    # I
    .param p7, "quoteLen"    # I

    .line 749
    move/from16 v0, p2

    move/from16 v4, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    invoke-virtual {v7}, Lorg/apache/commons/lang/text/StrBuilder;->clear()Lorg/apache/commons/lang/text/StrBuilder;

    .line 750
    move/from16 v1, p2

    .line 751
    .local v1, "pos":I
    const/4 v9, 0x0

    if-lez p7, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v9

    .line 752
    .local v2, "quoting":Z
    :goto_0
    const/4 v3, 0x0

    move v10, v2

    move v11, v3

    move v3, v1

    .line 754
    .end local v1    # "pos":I
    .end local v2    # "quoting":Z
    .local v3, "pos":I
    .local v10, "quoting":Z
    .local v11, "trimStart":I
    :goto_1
    if-ge v3, v4, :cond_9

    .line 758
    if-eqz v10, :cond_3

    .line 765
    move-object v1, p0

    move-object v2, p1

    move/from16 v5, p6

    move/from16 v6, p7

    invoke-direct/range {v1 .. v6}, Lorg/apache/commons/lang/text/StrTokenizer;->isQuote([CIIII)Z

    move-result v12

    move v13, v3

    .end local v3    # "pos":I
    .local v13, "pos":I
    if-eqz v12, :cond_2

    .line 766
    add-int v3, v13, p7

    move-object v1, p0

    move-object v2, p1

    move/from16 v4, p3

    move/from16 v5, p6

    move/from16 v6, p7

    invoke-direct/range {v1 .. v6}, Lorg/apache/commons/lang/text/StrTokenizer;->isQuote([CIIII)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 768
    invoke-virtual {v7, p1, v13, v6}, Lorg/apache/commons/lang/text/StrBuilder;->append([CII)Lorg/apache/commons/lang/text/StrBuilder;

    .line 769
    mul-int/lit8 v3, v6, 0x2

    add-int/2addr v3, v13

    .line 770
    .end local v13    # "pos":I
    .restart local v3    # "pos":I
    invoke-virtual {v7}, Lorg/apache/commons/lang/text/StrBuilder;->size()I

    move-result v11

    .line 771
    goto :goto_1

    .line 775
    .end local v3    # "pos":I
    .restart local v13    # "pos":I
    :cond_1
    const/4 v10, 0x0

    .line 776
    add-int v3, v13, v6

    .line 777
    .end local v13    # "pos":I
    .restart local v3    # "pos":I
    goto :goto_1

    .line 781
    .end local v3    # "pos":I
    .restart local v13    # "pos":I
    :cond_2
    move/from16 v4, p3

    move/from16 v6, p7

    add-int/lit8 v3, v13, 0x1

    .end local v13    # "pos":I
    .restart local v3    # "pos":I
    aget-char v5, p1, v13

    invoke-virtual {v7, v5}, Lorg/apache/commons/lang/text/StrBuilder;->append(C)Lorg/apache/commons/lang/text/StrBuilder;

    .line 782
    invoke-virtual {v7}, Lorg/apache/commons/lang/text/StrBuilder;->size()I

    move-result v11

    goto :goto_1

    .line 788
    :cond_3
    move/from16 v6, p7

    move v13, v3

    .end local v3    # "pos":I
    .restart local v13    # "pos":I
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getDelimiterMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v3

    invoke-virtual {v3, p1, v13, v0, v4}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v12

    .line 789
    .local v12, "delimLen":I
    if-lez v12, :cond_4

    .line 791
    invoke-virtual {v7, v9, v11}, Lorg/apache/commons/lang/text/StrBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v8, v3}, Lorg/apache/commons/lang/text/StrTokenizer;->addToken(Ljava/util/List;Ljava/lang/String;)V

    .line 792
    add-int v3, v13, v12

    return v3

    .line 796
    :cond_4
    if-lez v6, :cond_5

    .line 797
    move-object v1, p0

    move-object v2, p1

    move/from16 v5, p6

    move v3, v13

    .end local v13    # "pos":I
    .restart local v3    # "pos":I
    invoke-direct/range {v1 .. v6}, Lorg/apache/commons/lang/text/StrTokenizer;->isQuote([CIIII)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 798
    const/4 v10, 0x1

    .line 799
    add-int v3, v3, p7

    .line 800
    goto :goto_1

    .line 796
    .end local v3    # "pos":I
    .restart local v13    # "pos":I
    :cond_5
    move v3, v13

    .line 805
    .end local v13    # "pos":I
    .restart local v3    # "pos":I
    :cond_6
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getIgnoredMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v5

    invoke-virtual {v5, p1, v3, v0, v4}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v5

    .line 806
    .local v5, "ignoredLen":I
    if-lez v5, :cond_7

    .line 807
    add-int/2addr v3, v5

    .line 808
    goto :goto_1

    .line 814
    :cond_7
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getTrimmerMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v6

    invoke-virtual {v6, p1, v3, v0, v4}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v6

    .line 815
    .local v6, "trimmedLen":I
    if-lez v6, :cond_8

    .line 816
    invoke-virtual {v7, p1, v3, v6}, Lorg/apache/commons/lang/text/StrBuilder;->append([CII)Lorg/apache/commons/lang/text/StrBuilder;

    .line 817
    add-int/2addr v3, v6

    .line 818
    goto/16 :goto_1

    .line 822
    :cond_8
    add-int/lit8 v13, v3, 0x1

    .end local v3    # "pos":I
    .restart local v13    # "pos":I
    aget-char v3, p1, v3

    invoke-virtual {v7, v3}, Lorg/apache/commons/lang/text/StrBuilder;->append(C)Lorg/apache/commons/lang/text/StrBuilder;

    .line 823
    invoke-virtual {v7}, Lorg/apache/commons/lang/text/StrBuilder;->size()I

    move-result v11

    move v3, v13

    .end local v5    # "ignoredLen":I
    .end local v6    # "trimmedLen":I
    .end local v12    # "delimLen":I
    goto/16 :goto_1

    .line 828
    .end local v13    # "pos":I
    .restart local v3    # "pos":I
    :cond_9
    invoke-virtual {v7, v9, v11}, Lorg/apache/commons/lang/text/StrBuilder;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v8, v5}, Lorg/apache/commons/lang/text/StrTokenizer;->addToken(Ljava/util/List;Ljava/lang/String;)V

    .line 829
    const/4 v5, -0x1

    return v5
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 603
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "add() is unsupported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 1088
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->cloneReset()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 1089
    :catch_0
    move-exception v0

    .line 1090
    .local v0, "ex":Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    return-object v1
.end method

.method cloneReset()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1103
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/lang/text/StrTokenizer;

    .line 1104
    .local v0, "cloned":Lorg/apache/commons/lang/text/StrTokenizer;
    iget-object v1, v0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    if-eqz v1, :cond_0

    .line 1105
    iget-object v1, v0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    invoke-virtual {v1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [C

    iput-object v1, v0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    .line 1107
    :cond_0
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrTokenizer;->reset()Lorg/apache/commons/lang/text/StrTokenizer;

    .line 1108
    return-object v0
.end method

.method public getContent()Ljava/lang/String;
    .locals 2

    .line 1072
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    if-nez v0, :cond_0

    .line 1073
    const/4 v0, 0x0

    return-object v0

    .line 1075
    :cond_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method public getDelimiterMatcher()Lorg/apache/commons/lang/text/StrMatcher;
    .locals 1

    .line 860
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->delimMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    return-object v0
.end method

.method public getIgnoredMatcher()Lorg/apache/commons/lang/text/StrMatcher;
    .locals 1

    .line 956
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoredMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    return-object v0
.end method

.method public getQuoteMatcher()Lorg/apache/commons/lang/text/StrMatcher;
    .locals 1

    .line 912
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->quoteMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    return-object v0
.end method

.method public getTokenArray()[Ljava/lang/String;
    .locals 1

    .line 449
    invoke-direct {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->checkTokenized()V

    .line 450
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getTokenList()Ljava/util/List;
    .locals 3

    .line 459
    invoke-direct {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->checkTokenized()V

    .line 460
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    array-length v1, v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 461
    .local v0, "list":Ljava/util/List;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 462
    iget-object v2, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 461
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 464
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public getTrimmerMatcher()Lorg/apache/commons/lang/text/StrMatcher;
    .locals 1

    .line 1000
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->trimmerMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    return-object v0
.end method

.method public hasNext()Z
    .locals 2

    .line 523
    invoke-direct {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->checkTokenized()V

    .line 524
    iget v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasPrevious()Z
    .locals 1

    .line 554
    invoke-direct {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->checkTokenized()V

    .line 555
    iget v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isEmptyTokenAsNull()Z
    .locals 1

    .line 1027
    iget-boolean v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->emptyAsNull:Z

    return v0
.end method

.method public isIgnoreEmptyTokens()Z
    .locals 1

    .line 1050
    iget-boolean v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoreEmptyTokens:Z

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 3

    .line 533
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 534
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    iget v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    aget-object v0, v0, v1

    return-object v0

    .line 536
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public nextIndex()I
    .locals 1

    .line 545
    iget v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    return v0
.end method

.method public nextToken()Ljava/lang/String;
    .locals 3

    .line 425
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 426
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    iget v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    aget-object v0, v0, v1

    return-object v0

    .line 428
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public previous()Ljava/lang/Object;
    .locals 2

    .line 564
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->hasPrevious()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 565
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    iget v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    aget-object v0, v0, v1

    return-object v0

    .line 567
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public previousIndex()I
    .locals 1

    .line 576
    iget v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public previousToken()Ljava/lang/String;
    .locals 2

    .line 437
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->hasPrevious()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 438
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    iget v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    aget-object v0, v0, v1

    return-object v0

    .line 440
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 585
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "remove() is unsupported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1

    .line 475
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokenPos:I

    .line 476
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    .line 477
    return-object p0
.end method

.method public reset(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p1, "input"    # Ljava/lang/String;

    .line 489
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->reset()Lorg/apache/commons/lang/text/StrTokenizer;

    .line 490
    if-eqz p1, :cond_0

    .line 491
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    goto :goto_0

    .line 493
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    .line 495
    :goto_0
    return-object p0
.end method

.method public reset([C)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 0
    .param p1, "input"    # [C

    .line 510
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->reset()Lorg/apache/commons/lang/text/StrTokenizer;

    .line 511
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->chars:[C

    .line 512
    return-object p0
.end method

.method public set(Ljava/lang/Object;)V
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 594
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "set() is unsupported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDelimiterChar(C)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p1, "delim"    # C

    .line 887
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrMatcher;->charMatcher(C)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    return-object v0
.end method

.method public setDelimiterMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p1, "delim"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 872
    if-nez p1, :cond_0

    .line 873
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->noneMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->delimMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    goto :goto_0

    .line 875
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->delimMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 877
    :goto_0
    return-object p0
.end method

.method public setDelimiterString(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p1, "delim"    # Ljava/lang/String;

    .line 897
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrMatcher;->stringMatcher(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrTokenizer;->setDelimiterMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    return-object v0
.end method

.method public setEmptyTokenAsNull(Z)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 0
    .param p1, "emptyAsNull"    # Z

    .line 1038
    iput-boolean p1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->emptyAsNull:Z

    .line 1039
    return-object p0
.end method

.method public setIgnoreEmptyTokens(Z)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 0
    .param p1, "ignoreEmptyTokens"    # Z

    .line 1061
    iput-boolean p1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoreEmptyTokens:Z

    .line 1062
    return-object p0
.end method

.method public setIgnoredChar(C)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p1, "ignored"    # C

    .line 985
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrMatcher;->charMatcher(C)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrTokenizer;->setIgnoredMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    return-object v0
.end method

.method public setIgnoredMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 0
    .param p1, "ignored"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 969
    if-eqz p1, :cond_0

    .line 970
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->ignoredMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 972
    :cond_0
    return-object p0
.end method

.method public setQuoteChar(C)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1
    .param p1, "quote"    # C

    .line 941
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrMatcher;->charMatcher(C)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrTokenizer;->setQuoteMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;

    move-result-object v0

    return-object v0
.end method

.method public setQuoteMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 0
    .param p1, "quote"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 925
    if-eqz p1, :cond_0

    .line 926
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->quoteMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 928
    :cond_0
    return-object p0
.end method

.method public setTrimmerMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 0
    .param p1, "trimmer"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 1013
    if-eqz p1, :cond_0

    .line 1014
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrTokenizer;->trimmerMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 1016
    :cond_0
    return-object p0
.end method

.method public size()I
    .locals 1

    .line 415
    invoke-direct {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->checkTokenized()V

    .line 416
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1118
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrTokenizer;->tokens:[Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1119
    const-string v0, "StrTokenizer[not tokenized yet]"

    return-object v0

    .line 1121
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "StrTokenizer"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrTokenizer;->getTokenList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected tokenize([CII)Ljava/util/List;
    .locals 7
    .param p1, "chars"    # [C
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .line 645
    if-eqz p1, :cond_3

    if-nez p3, :cond_0

    move-object v1, p0

    move-object v2, p1

    move v4, p3

    goto :goto_1

    .line 648
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-direct {v0}, Lorg/apache/commons/lang/text/StrBuilder;-><init>()V

    move-object v5, v0

    .line 649
    .local v5, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 650
    .local v6, "tokens":Ljava/util/List;
    move v0, p2

    move v3, v0

    .line 653
    .local v3, "pos":I
    :goto_0
    if-ltz v3, :cond_2

    if-ge v3, p3, :cond_2

    .line 655
    move-object v1, p0

    move-object v2, p1

    move v4, p3

    .end local p1    # "chars":[C
    .end local p3    # "count":I
    .local v2, "chars":[C
    .local v4, "count":I
    invoke-direct/range {v1 .. v6}, Lorg/apache/commons/lang/text/StrTokenizer;->readNextToken([CIILorg/apache/commons/lang/text/StrBuilder;Ljava/util/List;)I

    move-result v3

    .line 658
    if-lt v3, v4, :cond_1

    .line 659
    const-string p1, ""

    invoke-direct {p0, v6, p1}, Lorg/apache/commons/lang/text/StrTokenizer;->addToken(Ljava/util/List;Ljava/lang/String;)V

    .line 653
    :cond_1
    move-object p1, v2

    move p3, v4

    goto :goto_0

    .end local v2    # "chars":[C
    .end local v4    # "count":I
    .restart local p1    # "chars":[C
    .restart local p3    # "count":I
    :cond_2
    move-object v1, p0

    move-object v2, p1

    move v4, p3

    .line 662
    .end local p1    # "chars":[C
    .end local p3    # "count":I
    .restart local v2    # "chars":[C
    .restart local v4    # "count":I
    return-object v6

    .line 645
    .end local v2    # "chars":[C
    .end local v3    # "pos":I
    .end local v4    # "count":I
    .end local v5    # "buf":Lorg/apache/commons/lang/text/StrBuilder;
    .end local v6    # "tokens":Ljava/util/List;
    .restart local p1    # "chars":[C
    .restart local p3    # "count":I
    :cond_3
    move-object v1, p0

    move-object v2, p1

    move v4, p3

    .line 646
    .end local p1    # "chars":[C
    .end local p3    # "count":I
    .restart local v2    # "chars":[C
    .restart local v4    # "count":I
    :goto_1
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p1
.end method
