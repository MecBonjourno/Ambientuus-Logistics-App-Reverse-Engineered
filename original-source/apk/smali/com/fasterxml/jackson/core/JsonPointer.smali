.class public Lcom/fasterxml/jackson/core/JsonPointer;
.super Ljava/lang/Object;
.source "JsonPointer.java"


# static fields
.field protected static final EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

.field public static final SEPARATOR:C = '/'


# instance fields
.field protected final _asString:Ljava/lang/String;

.field protected volatile _head:Lcom/fasterxml/jackson/core/JsonPointer;

.field protected final _matchingElementIndex:I

.field protected final _matchingPropertyName:Ljava/lang/String;

.field protected final _nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 79
    const-string v0, ""

    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    .line 80
    const/4 v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    .line 81
    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 82
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonPointer;)V
    .locals 0
    .param p1, "fullString"    # Ljava/lang/String;
    .param p2, "segment"    # Ljava/lang/String;
    .param p3, "matchIndex"    # I
    .param p4, "next"    # Lcom/fasterxml/jackson/core/JsonPointer;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 101
    iput-object p4, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 102
    iput-object p2, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    .line 103
    iput p3, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    .line 104
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V
    .locals 1
    .param p1, "fullString"    # Ljava/lang/String;
    .param p2, "segment"    # Ljava/lang/String;
    .param p3, "next"    # Lcom/fasterxml/jackson/core/JsonPointer;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 89
    iput-object p3, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 91
    iput-object p2, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    .line 93
    invoke-static {p2}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    .line 94
    return-void
.end method

.method private static _appendEscape(Ljava/lang/StringBuilder;C)V
    .locals 1
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "c"    # C

    .line 503
    const/16 v0, 0x30

    if-ne p1, v0, :cond_0

    .line 504
    const/16 p1, 0x7e

    goto :goto_0

    .line 505
    :cond_0
    const/16 v0, 0x31

    if-ne p1, v0, :cond_1

    .line 506
    const/16 p1, 0x2f

    goto :goto_0

    .line 508
    :cond_1
    const/16 v0, 0x7e

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 510
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 511
    return-void
.end method

.method private static _appendEscaped(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 4
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "segment"    # Ljava/lang/String;

    .line 206
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .local v1, "end":I
    :goto_0
    if-ge v0, v1, :cond_2

    .line 207
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 208
    .local v2, "c":C
    const/16 v3, 0x2f

    if-ne v2, v3, :cond_0

    .line 209
    const-string/jumbo v3, "~1"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    goto :goto_1

    .line 212
    :cond_0
    const/16 v3, 0x7e

    if-ne v2, v3, :cond_1

    .line 213
    const-string/jumbo v3, "~0"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    goto :goto_1

    .line 216
    :cond_1
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 206
    .end local v2    # "c":C
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 218
    .end local v0    # "i":I
    .end local v1    # "end":I
    :cond_2
    return-void
.end method

.method private static _fullPath(Lcom/fasterxml/jackson/core/JsonPointer;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "tail"    # Lcom/fasterxml/jackson/core/JsonPointer;
    .param p1, "segment"    # Ljava/lang/String;

    .line 190
    const/16 v0, 0x2f

    if-nez p0, :cond_0

    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 192
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 193
    invoke-static {v1, p1}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscaped(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 194
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 196
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 197
    .local v1, "tailDesc":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 198
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 199
    invoke-static {v2, p1}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscaped(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 200
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final _parseIndex(Ljava/lang/String;)I
    .locals 7
    .param p0, "str"    # Ljava/lang/String;

    .line 396
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 399
    .local v0, "len":I
    const/4 v1, -0x1

    if-eqz v0, :cond_8

    const/16 v2, 0xa

    if-le v0, v2, :cond_0

    goto :goto_2

    .line 403
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 404
    .local v4, "c":C
    const/16 v5, 0x30

    if-gt v4, v5, :cond_2

    .line 405
    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    if-ne v4, v5, :cond_1

    move v1, v3

    :cond_1
    return v1

    .line 407
    :cond_2
    const/16 v3, 0x39

    if-le v4, v3, :cond_3

    .line 408
    return v1

    .line 410
    :cond_3
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_0
    if-ge v6, v0, :cond_6

    .line 411
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 412
    if-gt v4, v3, :cond_5

    if-ge v4, v5, :cond_4

    goto :goto_1

    .line 410
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 413
    :cond_5
    :goto_1
    return v1

    .line 416
    .end local v6    # "i":I
    :cond_6
    if-ne v0, v2, :cond_7

    .line 417
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 418
    .local v2, "l":J
    const-wide/32 v5, 0x7fffffff

    cmp-long v5, v2, v5

    if-lez v5, :cond_7

    .line 419
    return v1

    .line 422
    .end local v2    # "l":J
    :cond_7
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 400
    .end local v4    # "c":C
    :cond_8
    :goto_2
    return v1
.end method

.method protected static _parseQuotedTail(Ljava/lang/String;I)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 6
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "i"    # I

    .line 454
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 455
    .local v0, "end":I
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x10

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 456
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x2

    if-le p1, v2, :cond_0

    .line 457
    add-int/lit8 v2, p1, -0x1

    const/4 v3, 0x1

    invoke-virtual {v1, p0, v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 459
    :cond_0
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "i":I
    .local v2, "i":I
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {v1, p1}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscape(Ljava/lang/StringBuilder;C)V

    .line 460
    :goto_0
    if-ge v2, v0, :cond_3

    .line 461
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 462
    .local p1, "c":C
    const/16 v3, 0x2f

    if-ne p1, v3, :cond_1

    .line 463
    new-instance v3, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v5

    invoke-direct {v3, p0, v4, v5}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    return-object v3

    .line 466
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 467
    const/16 v3, 0x7e

    if-ne p1, v3, :cond_2

    if-ge v2, v0, :cond_2

    .line 468
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v1, v2}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscape(Ljava/lang/StringBuilder;C)V

    .line 469
    move v2, v3

    goto :goto_0

    .line 471
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_2
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 472
    .end local p1    # "c":C
    goto :goto_0

    .line 474
    :cond_3
    new-instance p1, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-direct {p1, p0, v3, v4}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    return-object p1
.end method

.method protected static _parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 6
    .param p0, "input"    # Ljava/lang/String;

    .line 426
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 429
    .local v0, "end":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x1

    if-ge v1, v0, :cond_2

    .line 430
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 431
    .local v3, "c":C
    const/16 v4, 0x2f

    if-ne v3, v4, :cond_0

    .line 432
    new-instance v4, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v5

    invoke-direct {v4, p0, v2, v5}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    return-object v4

    .line 435
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 437
    const/16 v2, 0x7e

    if-ne v3, v2, :cond_1

    if-ge v1, v0, :cond_1

    .line 438
    invoke-static {p0, v1}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseQuotedTail(Ljava/lang/String;I)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v2

    return-object v2

    .line 441
    .end local v3    # "c":C
    :cond_1
    goto :goto_0

    .line 443
    .end local v1    # "i":I
    :cond_2
    new-instance v1, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-direct {v1, p0, v2, v3}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    return-object v1
.end method

.method public static compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 3
    .param p0, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 124
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 128
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_1

    .line 131
    invoke-static {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    return-object v0

    .line 129
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid input: JSON Pointer expression must start with \'/\': \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_2
    :goto_0
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0
.end method

.method public static forPath(Lcom/fasterxml/jackson/core/JsonStreamContext;Z)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 5
    .param p0, "context"    # Lcom/fasterxml/jackson/core/JsonStreamContext;
    .param p1, "includeRoot"    # Z

    .line 155
    if-nez p0, :cond_0

    .line 156
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0

    .line 158
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->hasPathSegment()Z

    move-result v0

    if-nez v0, :cond_2

    .line 160
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->hasCurrentIndex()Z

    move-result v0

    if-nez v0, :cond_2

    .line 161
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getParent()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object p0

    .line 164
    :cond_2
    const/4 v0, 0x0

    .line 166
    .local v0, "tail":Lcom/fasterxml/jackson/core/JsonPointer;
    :goto_0
    if-eqz p0, :cond_7

    .line 167
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inObject()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 168
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getCurrentName()Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "seg":Ljava/lang/String;
    if-nez v1, :cond_3

    .line 170
    const-string v1, ""

    .line 172
    :cond_3
    new-instance v2, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-static {v0, v1}, Lcom/fasterxml/jackson/core/JsonPointer;->_fullPath(Lcom/fasterxml/jackson/core/JsonPointer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1, v0}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    .line 173
    .end local v0    # "tail":Lcom/fasterxml/jackson/core/JsonPointer;
    .end local v1    # "seg":Ljava/lang/String;
    .local v2, "tail":Lcom/fasterxml/jackson/core/JsonPointer;
    move-object v0, v2

    goto :goto_1

    .end local v2    # "tail":Lcom/fasterxml/jackson/core/JsonPointer;
    .restart local v0    # "tail":Lcom/fasterxml/jackson/core/JsonPointer;
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inArray()Z

    move-result v1

    if-nez v1, :cond_5

    if-eqz p1, :cond_6

    .line 174
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getCurrentIndex()I

    move-result v1

    .line 175
    .local v1, "ix":I
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 176
    .local v2, "ixStr":Ljava/lang/String;
    new-instance v3, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-static {v0, v2}, Lcom/fasterxml/jackson/core/JsonPointer;->_fullPath(Lcom/fasterxml/jackson/core/JsonPointer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2, v1, v0}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonPointer;)V

    move-object v0, v3

    .line 166
    .end local v1    # "ix":I
    .end local v2    # "ixStr":Ljava/lang/String;
    :cond_6
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getParent()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object p0

    goto :goto_0

    .line 182
    :cond_7
    if-nez v0, :cond_8

    .line 183
    sget-object v1, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v1

    .line 185
    :cond_8
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 1
    .param p0, "input"    # Ljava/lang/String;

    .line 138
    invoke-static {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected _constructHead()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 8

    .line 480
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->last()Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    .line 481
    .local v0, "last":Lcom/fasterxml/jackson/core/JsonPointer;
    if-ne v0, p0, :cond_0

    .line 482
    sget-object v1, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v1

    .line 485
    :cond_0
    iget-object v1, v0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    .line 486
    .local v1, "suffixLength":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 487
    .local v2, "next":Lcom/fasterxml/jackson/core/JsonPointer;
    new-instance v3, Lcom/fasterxml/jackson/core/JsonPointer;

    iget-object v4, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    iget-object v5, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v1

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    iget v6, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    invoke-virtual {v2, v1, v0}, Lcom/fasterxml/jackson/core/JsonPointer;->_constructHead(ILcom/fasterxml/jackson/core/JsonPointer;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonPointer;)V

    return-object v3
.end method

.method protected _constructHead(ILcom/fasterxml/jackson/core/JsonPointer;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 7
    .param p1, "suffixLength"    # I
    .param p2, "last"    # Lcom/fasterxml/jackson/core/JsonPointer;

    .line 493
    if-ne p0, p2, :cond_0

    .line 494
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0

    .line 496
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 497
    .local v0, "next":Lcom/fasterxml/jackson/core/JsonPointer;
    iget-object v1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 498
    .local v1, "str":Ljava/lang/String;
    new-instance v2, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, p1

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    iget v5, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/core/JsonPointer;->_constructHead(ILcom/fasterxml/jackson/core/JsonPointer;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonPointer;)V

    return-object v2
.end method

.method public append(Lcom/fasterxml/jackson/core/JsonPointer;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 3
    .param p1, "tail"    # Lcom/fasterxml/jackson/core/JsonPointer;

    .line 289
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-ne p0, v0, :cond_0

    .line 290
    return-object p1

    .line 292
    :cond_0
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-ne p1, v0, :cond_1

    .line 293
    return-object p0

    .line 298
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 299
    .local v0, "currentJsonPointer":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 301
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 303
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/fasterxml/jackson/core/JsonPointer;->compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v1

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .line 383
    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 384
    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    return v0

    .line 385
    :cond_1
    instance-of v1, p1, Lcom/fasterxml/jackson/core/JsonPointer;

    if-nez v1, :cond_2

    return v0

    .line 386
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    move-object v1, p1

    check-cast v1, Lcom/fasterxml/jackson/core/JsonPointer;

    iget-object v1, v1, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getMatchingIndex()I
    .locals 1

    .line 250
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    return v0
.end method

.method public getMatchingProperty()Ljava/lang/String;
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 380
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public head()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 2

    .line 363
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_head:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 364
    .local v0, "h":Lcom/fasterxml/jackson/core/JsonPointer;
    if-nez v0, :cond_1

    .line 365
    sget-object v1, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eq p0, v1, :cond_0

    .line 366
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->_constructHead()Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    .line 368
    :cond_0
    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_head:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 370
    :cond_1
    return-object v0
.end method

.method public last()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 4

    .line 261
    move-object v0, p0

    .line 262
    .local v0, "current":Lcom/fasterxml/jackson/core/JsonPointer;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-ne v0, v1, :cond_0

    .line 263
    const/4 v1, 0x0

    return-object v1

    .line 266
    :cond_0
    :goto_0
    iget-object v1, v0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    move-object v2, v1

    .local v2, "next":Lcom/fasterxml/jackson/core/JsonPointer;
    sget-object v3, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eq v1, v3, :cond_1

    .line 267
    move-object v0, v2

    goto :goto_0

    .line 269
    :cond_1
    return-object v0
.end method

.method public matchElement(I)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 1
    .param p1, "index"    # I

    .line 337
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    if-ne p1, v0, :cond_1

    if-gez p1, :cond_0

    goto :goto_0

    .line 340
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0

    .line 338
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public matchProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 317
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 318
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0

    .line 320
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public matches()Z
    .locals 1

    .line 248
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public matchesElement(I)Z
    .locals 1
    .param p1, "index"    # I

    .line 330
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    if-ne p1, v0, :cond_0

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public matchesProperty(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 313
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public mayMatchElement()Z
    .locals 1

    .line 252
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public mayMatchProperty()Z
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public tail()Lcom/fasterxml/jackson/core/JsonPointer;
    .locals 1

    .line 349
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 379
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    return-object v0
.end method
