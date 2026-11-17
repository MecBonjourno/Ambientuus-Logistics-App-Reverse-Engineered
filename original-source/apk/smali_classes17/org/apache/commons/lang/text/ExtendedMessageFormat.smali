.class public Lorg/apache/commons/lang/text/ExtendedMessageFormat;
.super Ljava/text/MessageFormat;
.source "ExtendedMessageFormat.java"


# static fields
.field private static final DUMMY_PATTERN:Ljava/lang/String; = ""

.field private static final END_FE:C = '}'

.field private static final ESCAPED_QUOTE:Ljava/lang/String; = "\'\'"

.field private static final QUOTE:C = '\''

.field private static final START_FE:C = '{'

.field private static final START_FMT:C = ','

.field private static final serialVersionUID:J = -0x20c7ae6efb1e381fL


# instance fields
.field private registry:Ljava/util/Map;

.field private toPattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;

    .line 90
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Locale;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;Ljava/util/Map;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Locale;Ljava/util/Map;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "registry"    # Ljava/util/Map;

    .line 124
    const-string v0, ""

    invoke-direct {p0, v0}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    .line 125
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->setLocale(Ljava/util/Locale;)V

    .line 126
    iput-object p3, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->registry:Ljava/util/Map;

    .line 127
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->applyPattern(Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "registry"    # Ljava/util/Map;

    .line 112
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;Ljava/util/Map;)V

    .line 113
    return-void
.end method

.method private appendQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Ljava/lang/StringBuffer;Z)Ljava/lang/StringBuffer;
    .locals 8
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;
    .param p3, "appendTo"    # Ljava/lang/StringBuffer;
    .param p4, "escapingOn"    # Z

    .line 419
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v0

    .line 420
    .local v0, "start":I
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 421
    .local v1, "c":[C
    const/4 v2, 0x0

    const/16 v3, 0x27

    if-eqz p4, :cond_1

    aget-char v4, v1, v0

    if-ne v4, v3, :cond_1

    .line 422
    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p3, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    :goto_0
    return-object v2

    .line 424
    :cond_1
    move v4, v0

    .line 425
    .local v4, "lastHold":I
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v5

    .local v5, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_4

    .line 426
    if-eqz p4, :cond_2

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "\'\'"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 427
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {p3, v1, v4, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 429
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v5

    invoke-virtual {p2, v6}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 430
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    .line 431
    goto :goto_3

    .line 433
    :cond_2
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v6

    aget-char v6, v1, v6

    packed-switch v6, :pswitch_data_0

    .line 439
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto :goto_3

    .line 435
    :pswitch_0
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    .line 436
    if-nez p3, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-virtual {p3, v1, v4, v2}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    move-result-object v2

    :goto_2
    return-object v2

    .line 425
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 442
    .end local v5    # "i":I
    :cond_4
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unterminated quoted string at position "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :pswitch_data_0
    .packed-switch 0x27
        :pswitch_0
    .end packed-switch
.end method

.method private containsElements(Ljava/util/Collection;)Z
    .locals 3
    .param p1, "coll"    # Ljava/util/Collection;

    .line 464
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 467
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 468
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 469
    const/4 v0, 0x1

    return v0

    .line 472
    .end local v1    # "iter":Ljava/util/Iterator;
    :cond_2
    return v0

    .line 465
    :cond_3
    :goto_0
    return v0
.end method

.method private getFormat(Ljava/lang/String;)Ljava/text/Format;
    .locals 5
    .param p1, "desc"    # Ljava/lang/String;

    .line 247
    iget-object v0, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->registry:Ljava/util/Map;

    if-eqz v0, :cond_1

    .line 248
    move-object v0, p1

    .line 249
    .local v0, "name":Ljava/lang/String;
    const/4 v1, 0x0

    .line 250
    .local v1, "args":Ljava/lang/String;
    const/16 v2, 0x2c

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 251
    .local v2, "i":I
    if-lez v2, :cond_0

    .line 252
    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 253
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 255
    :cond_0
    iget-object v3, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->registry:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/lang/text/FormatFactory;

    .line 256
    .local v3, "factory":Lorg/apache/commons/lang/text/FormatFactory;
    if-eqz v3, :cond_1

    .line 257
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-interface {v3, v0, v1, v4}, Lorg/apache/commons/lang/text/FormatFactory;->getFormat(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;

    move-result-object v4

    return-object v4

    .line 260
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "args":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "factory":Lorg/apache/commons/lang/text/FormatFactory;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Z)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;
    .param p3, "escapingOn"    # Z

    .line 455
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->appendQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Ljava/lang/StringBuffer;Z)Ljava/lang/StringBuffer;

    .line 456
    return-void
.end method

.method private insertFormats(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 8
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "customPatterns"    # Ljava/util/ArrayList;

    .line 345
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->containsElements(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 346
    return-object p1

    .line 348
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 349
    .local v0, "sb":Ljava/lang/StringBuffer;
    new-instance v1, Ljava/text/ParsePosition;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/text/ParsePosition;-><init>(I)V

    .line 350
    .local v1, "pos":Ljava/text/ParsePosition;
    const/4 v3, -0x1

    .line 351
    .local v3, "fe":I
    const/4 v4, 0x0

    .line 352
    .local v4, "depth":I
    :goto_0
    invoke-virtual {v1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 353
    invoke-virtual {v1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 354
    .local v5, "c":C
    sparse-switch v5, :sswitch_data_0

    goto :goto_1

    .line 371
    :sswitch_0
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 359
    :sswitch_1
    add-int/lit8 v4, v4, 0x1

    .line 360
    const/4 v6, 0x1

    if-ne v4, v6, :cond_2

    .line 361
    add-int/lit8 v3, v3, 0x1

    .line 362
    const/16 v6, 0x7b

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-direct {p0, v1}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    move-result-object v7

    invoke-direct {p0, p1, v7}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->readArgumentIndex(Ljava/lang/String;Ljava/text/ParsePosition;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 364
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 365
    .local v6, "customPattern":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 366
    const/16 v7, 0x2c

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .end local v6    # "customPattern":Ljava/lang/String;
    :cond_1
    goto :goto_2

    .line 356
    :sswitch_2
    invoke-direct {p0, p1, v1, v0, v2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->appendQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Ljava/lang/StringBuffer;Z)Ljava/lang/StringBuffer;

    .line 357
    goto :goto_2

    .line 374
    :goto_1
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 375
    invoke-direct {p0, v1}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    .end local v5    # "c":C
    :cond_2
    :goto_2
    goto :goto_0

    .line 378
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_2
        0x7b -> :sswitch_1
        0x7d -> :sswitch_0
    .end sparse-switch
.end method

.method private next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;
    .locals 1
    .param p1, "pos"    # Ljava/text/ParsePosition;

    .line 403
    invoke-virtual {p1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 404
    return-object p1
.end method

.method private parseFormatDescription(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/String;
    .locals 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .line 313
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v0

    .line 314
    .local v0, "start":I
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 315
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v1

    .line 316
    .local v1, "text":I
    const/4 v2, 0x1

    .line 317
    .local v2, "depth":I
    :goto_0
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 318
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    goto :goto_1

    .line 323
    :sswitch_0
    add-int/lit8 v2, v2, -0x1

    .line 324
    if-nez v2, :cond_0

    .line 325
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 320
    :sswitch_1
    add-int/lit8 v2, v2, 0x1

    .line 321
    goto :goto_1

    .line 329
    :sswitch_2
    const/4 v3, 0x0

    invoke-direct {p0, p1, p2, v3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->getQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Z)V

    .line 317
    :cond_0
    :goto_1
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto :goto_0

    .line 333
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unterminated format element at position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    nop

    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_2
        0x7b -> :sswitch_1
        0x7d -> :sswitch_0
    .end sparse-switch
.end method

.method private readArgumentIndex(Ljava/lang/String;Ljava/text/ParsePosition;)I
    .locals 7
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .line 271
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v0

    .line 272
    .local v0, "start":I
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 273
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 274
    .local v1, "result":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 275
    .local v2, "error":Z
    :goto_0
    if-nez v2, :cond_3

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 276
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 277
    .local v3, "c":C
    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    const/16 v5, 0x7d

    const/16 v6, 0x2c

    if-eqz v4, :cond_0

    .line 278
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 279
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 280
    if-eq v3, v6, :cond_0

    if-eq v3, v5, :cond_0

    .line 281
    const/4 v2, 0x1

    .line 282
    goto :goto_1

    .line 285
    :cond_0
    if-eq v3, v6, :cond_1

    if-ne v3, v5, :cond_2

    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 287
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v4

    .line 288
    :catch_0
    move-exception v4

    .line 293
    :cond_2
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    .line 294
    .end local v2    # "error":Z
    .local v4, "error":Z
    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move v2, v4

    .line 275
    .end local v3    # "c":C
    .end local v4    # "error":Z
    .restart local v2    # "error":Z
    :goto_1
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto :goto_0

    .line 296
    :cond_3
    if-eqz v2, :cond_4

    .line 297
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid format argument index at position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v5

    invoke-virtual {p1, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 301
    :cond_4
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unterminated format element at position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V
    .locals 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .line 388
    const/4 v0, 0x0

    .line 389
    .local v0, "len":I
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 391
    .local v1, "buffer":[C
    :cond_0
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->splitMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v2

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {v2, v1, v3}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CI)I

    move-result v0

    .line 392
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p2, v2}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 393
    if-lez v0, :cond_1

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_0

    .line 394
    :cond_1
    return-void
.end method


# virtual methods
.method public final applyPattern(Ljava/lang/String;)V
    .locals 14
    .param p1, "pattern"    # Ljava/lang/String;

    .line 143
    iget-object v0, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->registry:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 144
    invoke-super {p0, p1}, Ljava/text/MessageFormat;->applyPattern(Ljava/lang/String;)V

    .line 145
    invoke-super {p0}, Ljava/text/MessageFormat;->toPattern()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->toPattern:Ljava/lang/String;

    .line 146
    return-void

    .line 148
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .local v0, "foundFormats":Ljava/util/ArrayList;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v1, "foundDescriptions":Ljava/util/ArrayList;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 152
    .local v2, "stripCustom":Ljava/lang/StringBuffer;
    new-instance v3, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Ljava/text/ParsePosition;-><init>(I)V

    .line 153
    .local v3, "pos":Ljava/text/ParsePosition;
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    .line 154
    .local v5, "c":[C
    const/4 v6, 0x0

    .line 155
    .local v6, "fmtCount":I
    :goto_0
    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v7, v8, :cond_6

    .line 156
    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v7

    aget-char v7, v5, v7

    const/4 v8, 0x1

    sparse-switch v7, :sswitch_data_0

    goto/16 :goto_4

    .line 161
    :sswitch_0
    add-int/lit8 v6, v6, 0x1

    .line 162
    invoke-direct {p0, p1, v3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 163
    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v7

    .line 164
    .local v7, "start":I
    invoke-direct {p0, v3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    move-result-object v9

    invoke-direct {p0, p1, v9}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->readArgumentIndex(Ljava/lang/String;Ljava/text/ParsePosition;)I

    move-result v9

    .line 165
    .local v9, "index":I
    const/16 v10, 0x7b

    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 166
    invoke-direct {p0, p1, v3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 167
    const/4 v10, 0x0

    .line 168
    .local v10, "format":Ljava/text/Format;
    const/4 v11, 0x0

    .line 169
    .local v11, "formatDescription":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v12

    aget-char v12, v5, v12

    const/16 v13, 0x2c

    if-ne v12, v13, :cond_1

    .line 170
    invoke-direct {p0, v3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    move-result-object v12

    invoke-direct {p0, p1, v12}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->parseFormatDescription(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/String;

    move-result-object v11

    .line 172
    invoke-direct {p0, v11}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->getFormat(Ljava/lang/String;)Ljava/text/Format;

    move-result-object v10

    .line 173
    if-nez v10, :cond_1

    .line 174
    invoke-virtual {v2, v13}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    :cond_1
    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    if-nez v10, :cond_2

    const/4 v12, 0x0

    goto :goto_1

    :cond_2
    move-object v12, v11

    :goto_1
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ne v12, v6, :cond_3

    move v12, v8

    goto :goto_2

    :cond_3
    move v12, v4

    :goto_2
    invoke-static {v12}, Lorg/apache/commons/lang/Validate;->isTrue(Z)V

    .line 180
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ne v12, v6, :cond_4

    goto :goto_3

    :cond_4
    move v8, v4

    :goto_3
    invoke-static {v8}, Lorg/apache/commons/lang/Validate;->isTrue(Z)V

    .line 181
    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v8

    aget-char v8, v5, v8

    const/16 v12, 0x7d

    if-ne v8, v12, :cond_5

    goto :goto_4

    .line 182
    :cond_5
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v12, "Unreadable format element at position "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 158
    .end local v7    # "start":I
    .end local v9    # "index":I
    .end local v10    # "format":Ljava/text/Format;
    .end local v11    # "formatDescription":Ljava/lang/String;
    :sswitch_1
    invoke-direct {p0, p1, v3, v2, v8}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->appendQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Ljava/lang/StringBuffer;Z)Ljava/lang/StringBuffer;

    .line 159
    goto/16 :goto_0

    .line 187
    :goto_4
    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v7

    aget-char v7, v5, v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 188
    invoke-direct {p0, v3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto/16 :goto_0

    .line 191
    :cond_6
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-super {p0, v4}, Ljava/text/MessageFormat;->applyPattern(Ljava/lang/String;)V

    .line 192
    invoke-super {p0}, Ljava/text/MessageFormat;->toPattern()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->insertFormats(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->toPattern:Ljava/lang/String;

    .line 193
    invoke-direct {p0, v0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->containsElements(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 194
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->getFormats()[Ljava/text/Format;

    move-result-object v4

    .line 197
    .local v4, "origFormats":[Ljava/text/Format;
    const/4 v7, 0x0

    .line 198
    .local v7, "i":I
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "it":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8

    .line 199
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/text/Format;

    .line 200
    .local v9, "f":Ljava/text/Format;
    if-eqz v9, :cond_7

    .line 201
    aput-object v9, v4, v7

    .line 198
    .end local v9    # "f":Ljava/text/Format;
    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 204
    .end local v8    # "it":Ljava/util/Iterator;
    :cond_8
    invoke-super {p0, v4}, Ljava/text/MessageFormat;->setFormats([Ljava/text/Format;)V

    .line 206
    .end local v4    # "origFormats":[Ljava/text/Format;
    .end local v7    # "i":I
    :cond_9
    return-void

    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_1
        0x7b -> :sswitch_0
    .end sparse-switch
.end method

.method public setFormat(ILjava/text/Format;)V
    .locals 1
    .param p1, "formatElementIndex"    # I
    .param p2, "newFormat"    # Ljava/text/Format;

    .line 213
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setFormatByArgumentIndex(ILjava/text/Format;)V
    .locals 1
    .param p1, "argumentIndex"    # I
    .param p2, "newFormat"    # Ljava/text/Format;

    .line 221
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setFormats([Ljava/text/Format;)V
    .locals 1
    .param p1, "newFormats"    # [Ljava/text/Format;

    .line 229
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setFormatsByArgumentIndex([Ljava/text/Format;)V
    .locals 1
    .param p1, "newFormats"    # [Ljava/text/Format;

    .line 237
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toPattern()Ljava/lang/String;
    .locals 1

    .line 134
    iget-object v0, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->toPattern:Ljava/lang/String;

    return-object v0
.end method
