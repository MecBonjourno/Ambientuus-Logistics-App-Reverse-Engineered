.class public Lorg/apache/commons/lang/Validate;
.super Ljava/lang/Object;
.source "Validate.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method public static allElementsOfType(Ljava/util/Collection;Ljava/lang/Class;)V
    .locals 5
    .param p0, "collection"    # Ljava/util/Collection;
    .param p1, "clazz"    # Ljava/lang/Class;

    .line 543
    invoke-static {p0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;)V

    .line 544
    invoke-static {p1}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;)V

    .line 545
    const/4 v0, 0x0

    .line 546
    .local v0, "i":I
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 547
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 546
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 548
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "The validated collection contains an element not of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " at index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 552
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public static allElementsOfType(Ljava/util/Collection;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 2
    .param p0, "collection"    # Ljava/util/Collection;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "message"    # Ljava/lang/String;

    .line 513
    invoke-static {p0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;)V

    .line 514
    invoke-static {p1}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;)V

    .line 515
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 516
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 517
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 520
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public static isTrue(Z)V
    .locals 2
    .param p0, "expression"    # Z

    .line 180
    if-eqz p0, :cond_0

    .line 183
    return-void

    .line 181
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The validated expression is false"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isTrue(ZLjava/lang/String;)V
    .locals 1
    .param p0, "expression"    # Z
    .param p1, "message"    # Ljava/lang/String;

    .line 156
    if-eqz p0, :cond_0

    .line 159
    return-void

    .line 157
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isTrue(ZLjava/lang/String;D)V
    .locals 2
    .param p0, "expression"    # Z
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "value"    # D

    .line 129
    if-eqz p0, :cond_0

    .line 132
    return-void

    .line 130
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isTrue(ZLjava/lang/String;J)V
    .locals 2
    .param p0, "expression"    # Z
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "value"    # J

    .line 102
    if-eqz p0, :cond_0

    .line 105
    return-void

    .line 103
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isTrue(ZLjava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p0, "expression"    # Z
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 76
    if-eqz p0, :cond_0

    .line 79
    return-void

    .line 77
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static noNullElements(Ljava/util/Collection;)V
    .locals 5
    .param p0, "collection"    # Ljava/util/Collection;

    .line 489
    invoke-static {p0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;)V

    .line 490
    const/4 v0, 0x0

    .line 491
    .local v0, "i":I
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 492
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 491
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 493
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "The validated collection contains null element at index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 496
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public static noNullElements(Ljava/util/Collection;Ljava/lang/String;)V
    .locals 2
    .param p0, "collection"    # Ljava/util/Collection;
    .param p1, "message"    # Ljava/lang/String;

    .line 463
    invoke-static {p0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;)V

    .line 464
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 465
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 466
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 469
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public static noNullElements([Ljava/lang/Object;)V
    .locals 4
    .param p0, "array"    # [Ljava/lang/Object;

    .line 434
    invoke-static {p0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;)V

    .line 435
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 436
    aget-object v1, p0, v0

    if-eqz v1, :cond_0

    .line 435
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 437
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "The validated array contains null element at index: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 440
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method public static noNullElements([Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "message"    # Ljava/lang/String;

    .line 407
    invoke-static {p0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;)V

    .line 408
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 409
    aget-object v1, p0, v0

    if-eqz v1, :cond_0

    .line 408
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 410
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 413
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method public static notEmpty(Ljava/lang/String;)V
    .locals 2
    .param p0, "string"    # Ljava/lang/String;

    .line 381
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 384
    return-void

    .line 382
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The validated string is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmpty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 362
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 365
    return-void

    .line 363
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmpty(Ljava/util/Collection;)V
    .locals 2
    .param p0, "collection"    # Ljava/util/Collection;

    .line 301
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 304
    return-void

    .line 302
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The validated collection is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmpty(Ljava/util/Collection;Ljava/lang/String;)V
    .locals 1
    .param p0, "collection"    # Ljava/util/Collection;
    .param p1, "message"    # Ljava/lang/String;

    .line 282
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 285
    return-void

    .line 283
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmpty(Ljava/util/Map;)V
    .locals 2
    .param p0, "map"    # Ljava/util/Map;

    .line 341
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 344
    return-void

    .line 342
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The validated map is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmpty(Ljava/util/Map;Ljava/lang/String;)V
    .locals 1
    .param p0, "map"    # Ljava/util/Map;
    .param p1, "message"    # Ljava/lang/String;

    .line 322
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 325
    return-void

    .line 323
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmpty([Ljava/lang/Object;)V
    .locals 2
    .param p0, "array"    # [Ljava/lang/Object;

    .line 261
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    .line 264
    return-void

    .line 262
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The validated array is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmpty([Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "message"    # Ljava/lang/String;

    .line 242
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    .line 245
    return-void

    .line 243
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notNull(Ljava/lang/Object;)V
    .locals 2
    .param p0, "object"    # Ljava/lang/Object;

    .line 221
    if-eqz p0, :cond_0

    .line 224
    return-void

    .line 222
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The validated object is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notNull(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "message"    # Ljava/lang/String;

    .line 202
    if-eqz p0, :cond_0

    .line 205
    return-void

    .line 203
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
