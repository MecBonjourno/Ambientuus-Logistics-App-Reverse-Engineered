.class public Lorg/apache/commons/lang/text/StrBuilder;
.super Ljava/lang/Object;
.source "StrBuilder.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang/text/StrBuilder$StrBuilderWriter;,
        Lorg/apache/commons/lang/text/StrBuilder$StrBuilderReader;,
        Lorg/apache/commons/lang/text/StrBuilder$StrBuilderTokenizer;
    }
.end annotation


# static fields
.field static final CAPACITY:I = 0x20

.field private static final serialVersionUID:J = 0x69dea51fe8fc7e4bL


# instance fields
.field protected buffer:[C

.field private newLine:Ljava/lang/String;

.field private nullText:Ljava/lang/String;

.field protected size:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 98
    const/16 v0, 0x20

    invoke-direct {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    .line 99
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "initialCapacity"    # I

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    if-gtz p1, :cond_0

    .line 109
    const/16 p1, 0x20

    .line 111
    :cond_0
    new-array v0, p1, [C

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 112
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    const/16 v0, 0x20

    if-nez p1, :cond_0

    .line 123
    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    goto :goto_0

    .line 125
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    new-array v0, v1, [C

    iput-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 126
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 128
    :goto_0
    return-void
.end method

.method private deleteImpl(III)V
    .locals 3
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "len"    # I

    .line 1468
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v2, p2

    invoke-static {v0, p2, v1, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1469
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v0, p3

    iput v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1470
    return-void
.end method

.method private replaceImpl(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 7
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p2, "replaceStr"    # Ljava/lang/String;
    .param p3, "from"    # I
    .param p4, "to"    # I
    .param p5, "replaceCount"    # I

    .line 1789
    if-eqz p1, :cond_5

    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-nez v0, :cond_0

    move-object v1, p0

    move-object v5, p2

    goto :goto_3

    .line 1792
    :cond_0
    if-nez p2, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    :goto_0
    move v6, v0

    .line 1793
    .local v6, "replaceLen":I
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 1794
    .local v0, "buf":[C
    move v1, p3

    move v2, v1

    .local v2, "i":I
    :goto_1
    if-ge v2, p4, :cond_4

    if-eqz p5, :cond_4

    .line 1795
    invoke-virtual {p1, v0, v2, p3, p4}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v4

    .line 1796
    .local v4, "removeLen":I
    if-lez v4, :cond_3

    .line 1797
    add-int v3, v2, v4

    move-object v1, p0

    move-object v5, p2

    .end local p2    # "replaceStr":Ljava/lang/String;
    .local v5, "replaceStr":Ljava/lang/String;
    invoke-direct/range {v1 .. v6}, Lorg/apache/commons/lang/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1798
    sub-int p2, p4, v4

    add-int/2addr p2, v6

    .line 1799
    .end local p4    # "to":I
    .local p2, "to":I
    add-int p4, v2, v6

    add-int/lit8 v2, p4, -0x1

    .line 1800
    if-lez p5, :cond_2

    .line 1801
    add-int/lit8 p5, p5, -0x1

    move p4, p2

    goto :goto_2

    .line 1800
    :cond_2
    move p4, p2

    goto :goto_2

    .line 1796
    .end local v5    # "replaceStr":Ljava/lang/String;
    .local p2, "replaceStr":Ljava/lang/String;
    .restart local p4    # "to":I
    :cond_3
    move-object v1, p0

    move-object v5, p2

    .line 1794
    .end local v4    # "removeLen":I
    .end local p2    # "replaceStr":Ljava/lang/String;
    .restart local v5    # "replaceStr":Ljava/lang/String;
    :goto_2
    add-int/lit8 v2, v2, 0x1

    move-object p2, v5

    goto :goto_1

    .end local v5    # "replaceStr":Ljava/lang/String;
    .restart local p2    # "replaceStr":Ljava/lang/String;
    :cond_4
    move-object v1, p0

    move-object v5, p2

    .line 1805
    .end local v2    # "i":I
    .end local p2    # "replaceStr":Ljava/lang/String;
    .restart local v5    # "replaceStr":Ljava/lang/String;
    return-object v1

    .line 1789
    .end local v0    # "buf":[C
    .end local v5    # "replaceStr":Ljava/lang/String;
    .end local v6    # "replaceLen":I
    .restart local p2    # "replaceStr":Ljava/lang/String;
    :cond_5
    move-object v1, p0

    move-object v5, p2

    .line 1790
    .end local p2    # "replaceStr":Ljava/lang/String;
    .restart local v5    # "replaceStr":Ljava/lang/String;
    :goto_3
    return-object v1
.end method

.method private replaceImpl(IIILjava/lang/String;I)V
    .locals 5
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "removeLen"    # I
    .param p4, "insertStr"    # Ljava/lang/String;
    .param p5, "insertLen"    # I

    .line 1607
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v0, p3

    add-int/2addr v0, p5

    .line 1608
    .local v0, "newSize":I
    if-eq p5, p3, :cond_0

    .line 1609
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1610
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int v3, p1, p5

    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v4, p2

    invoke-static {v1, p2, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1611
    iput v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1613
    :cond_0
    if-lez p5, :cond_1

    .line 1614
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-virtual {p4, v1, p5, v2, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 1616
    :cond_1
    return-void
.end method


# virtual methods
.method public append(C)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "ch"    # C

    .line 688
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    .line 689
    .local v0, "len":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 690
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    aput-char p1, v1, v2

    .line 691
    return-object p0
.end method

.method public append(D)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # D

    .line 731
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(F)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # F

    .line 721
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(I)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # I

    .line 701
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(J)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # J

    .line 711
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 455
    if-nez p1, :cond_0

    .line 456
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 458
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .line 469
    if-nez p1, :cond_0

    .line 470
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 472
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 473
    .local v0, "strLen":I
    if-lez v0, :cond_1

    .line 474
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    .line 475
    .local v1, "len":I
    add-int v2, v1, v0

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 476
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, v2, v0, v3, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 477
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 479
    .end local v1    # "len":I
    :cond_1
    return-object p0
.end method

.method public append(Ljava/lang/String;II)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .line 492
    if-nez p1, :cond_0

    .line 493
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 495
    :cond_0
    if-ltz p2, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt p2, v0, :cond_3

    .line 498
    if-ltz p3, :cond_2

    add-int v0, p2, p3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v0, v1, :cond_2

    .line 501
    if-lez p3, :cond_1

    .line 502
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    .line 503
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 504
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Ljava/lang/String;->getChars(II[CI)V

    .line 505
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 507
    .end local v0    # "len":I
    :cond_1
    return-object p0

    .line 499
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "length must be valid"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 496
    :cond_3
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "startIndex must be valid"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public append(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "str"    # Ljava/lang/StringBuffer;

    .line 518
    if-nez p1, :cond_0

    .line 519
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 521
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    .line 522
    .local v0, "strLen":I
    if-lez v0, :cond_1

    .line 523
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    .line 524
    .local v1, "len":I
    add-int v2, v1, v0

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 525
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, v2, v0, v3, v1}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 526
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 528
    .end local v1    # "len":I
    :cond_1
    return-object p0
.end method

.method public append(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/StringBuffer;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .line 541
    if-nez p1, :cond_0

    .line 542
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 544
    :cond_0
    if-ltz p2, :cond_3

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-gt p2, v0, :cond_3

    .line 547
    if-ltz p3, :cond_2

    add-int v0, p2, p3

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-gt v0, v1, :cond_2

    .line 550
    if-lez p3, :cond_1

    .line 551
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    .line 552
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 553
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 554
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 556
    .end local v0    # "len":I
    :cond_1
    return-object p0

    .line 548
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "length must be valid"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 545
    :cond_3
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "startIndex must be valid"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public append(Lorg/apache/commons/lang/text/StrBuilder;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 5
    .param p1, "str"    # Lorg/apache/commons/lang/text/StrBuilder;

    .line 567
    if-nez p1, :cond_0

    .line 568
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 570
    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    .line 571
    .local v0, "strLen":I
    if-lez v0, :cond_1

    .line 572
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    .line 573
    .local v1, "len":I
    add-int v2, v1, v0

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 574
    iget-object v2, p1, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-static {v2, v3, v4, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 575
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 577
    .end local v1    # "len":I
    :cond_1
    return-object p0
.end method

.method public append(Lorg/apache/commons/lang/text/StrBuilder;II)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .line 590
    if-nez p1, :cond_0

    .line 591
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 593
    :cond_0
    if-ltz p2, :cond_3

    invoke-virtual {p1}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    if-gt p2, v0, :cond_3

    .line 596
    if-ltz p3, :cond_2

    add-int v0, p2, p3

    invoke-virtual {p1}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    if-gt v0, v1, :cond_2

    .line 599
    if-lez p3, :cond_1

    .line 600
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    .line 601
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 602
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Lorg/apache/commons/lang/text/StrBuilder;->getChars(II[CI)V

    .line 603
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 605
    .end local v0    # "len":I
    :cond_1
    return-object p0

    .line 597
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "length must be valid"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 594
    :cond_3
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "startIndex must be valid"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public append(Z)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "value"    # Z

    .line 664
    const/16 v0, 0x65

    if-eqz p1, :cond_0

    .line 665
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 666
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/16 v3, 0x74

    aput-char v3, v1, v2

    .line 667
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/16 v3, 0x72

    aput-char v3, v1, v2

    .line 668
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/16 v3, 0x75

    aput-char v3, v1, v2

    .line 669
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    aput-char v0, v1, v2

    goto :goto_0

    .line 671
    :cond_0
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x5

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 672
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/16 v3, 0x66

    aput-char v3, v1, v2

    .line 673
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/16 v3, 0x61

    aput-char v3, v1, v2

    .line 674
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/16 v3, 0x6c

    aput-char v3, v1, v2

    .line 675
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/16 v3, 0x73

    aput-char v3, v1, v2

    .line 676
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    aput-char v0, v1, v2

    .line 678
    :goto_0
    return-object p0
.end method

.method public append([C)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "chars"    # [C

    .line 616
    if-nez p1, :cond_0

    .line 617
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 619
    :cond_0
    array-length v0, p1

    .line 620
    .local v0, "strLen":I
    if-lez v0, :cond_1

    .line 621
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    .line 622
    .local v1, "len":I
    add-int v2, v1, v0

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 623
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-static {p1, v2, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 624
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 626
    .end local v1    # "len":I
    :cond_1
    return-object p0
.end method

.method public append([CII)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 3
    .param p1, "chars"    # [C
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .line 639
    if-nez p1, :cond_0

    .line 640
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNull()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 642
    :cond_0
    if-ltz p2, :cond_3

    array-length v0, p1

    if-gt p2, v0, :cond_3

    .line 645
    if-ltz p3, :cond_2

    add-int v0, p2, p3

    array-length v1, p1

    if-gt v0, v1, :cond_2

    .line 648
    if-lez p3, :cond_1

    .line 649
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    .line 650
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 651
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-static {p1, p2, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 652
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 654
    .end local v0    # "len":I
    :cond_1
    return-object p0

    .line 646
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 643
    :cond_3
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid startIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public appendAll(Ljava/util/Collection;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 2
    .param p1, "coll"    # Ljava/util/Collection;

    .line 946
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 947
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 948
    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 949
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    goto :goto_0

    .line 952
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_0
    return-object p0
.end method

.method public appendAll(Ljava/util/Iterator;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "it"    # Ljava/util/Iterator;

    .line 965
    if-eqz p1, :cond_0

    .line 966
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 967
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    goto :goto_0

    .line 970
    :cond_0
    return-object p0
.end method

.method public appendAll([Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 2
    .param p1, "array"    # [Ljava/lang/Object;

    .line 928
    if-eqz p1, :cond_0

    array-length v0, p1

    if-lez v0, :cond_0

    .line 929
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 930
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 929
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 933
    .end local v0    # "i":I
    :cond_0
    return-object p0
.end method

.method public appendFixedWidthPadLeft(IIC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # I
    .param p2, "width"    # I
    .param p3, "padChar"    # C

    .line 1215
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->appendFixedWidthPadLeft(Ljava/lang/Object;IC)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFixedWidthPadLeft(Ljava/lang/Object;IC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "width"    # I
    .param p3, "padChar"    # C

    .line 1183
    if-lez p2, :cond_4

    .line 1184
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v0, p2

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1185
    if-nez p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->getNullText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1186
    .local v0, "str":Ljava/lang/String;
    :goto_0
    if-nez v0, :cond_1

    .line 1187
    const-string v0, ""

    .line 1189
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1190
    .local v1, "strLen":I
    if-lt v1, p2, :cond_2

    .line 1191
    sub-int v2, v1, p2

    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-virtual {v0, v2, v1, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_2

    .line 1193
    :cond_2
    sub-int v2, p2, v1

    .line 1194
    .local v2, "padLen":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v2, :cond_3

    .line 1195
    iget-object v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v5, v3

    aput-char p3, v4, v5

    .line 1194
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1197
    .end local v3    # "i":I
    :cond_3
    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v4, v2

    const/4 v5, 0x0

    invoke-virtual {v0, v5, v1, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 1199
    .end local v2    # "padLen":I
    :goto_2
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v2, p2

    iput v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1201
    .end local v0    # "str":Ljava/lang/String;
    .end local v1    # "strLen":I
    :cond_4
    return-object p0
.end method

.method public appendFixedWidthPadRight(IIC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # I
    .param p2, "width"    # I
    .param p3, "padChar"    # C

    .line 1262
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->appendFixedWidthPadRight(Ljava/lang/Object;IC)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFixedWidthPadRight(Ljava/lang/Object;IC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "width"    # I
    .param p3, "padChar"    # C

    .line 1230
    if-lez p2, :cond_4

    .line 1231
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v0, p2

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1232
    if-nez p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->getNullText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1233
    .local v0, "str":Ljava/lang/String;
    :goto_0
    if-nez v0, :cond_1

    .line 1234
    const-string v0, ""

    .line 1236
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1237
    .local v1, "strLen":I
    const/4 v2, 0x0

    if-lt v1, p2, :cond_2

    .line 1238
    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-virtual {v0, v2, p2, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_2

    .line 1240
    :cond_2
    sub-int v3, p2, v1

    .line 1241
    .local v3, "padLen":I
    iget-object v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-virtual {v0, v2, v1, v4, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 1242
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_3

    .line 1243
    iget-object v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v5, v1

    add-int/2addr v5, v2

    aput-char p3, v4, v5

    .line 1242
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1246
    .end local v2    # "i":I
    .end local v3    # "padLen":I
    :cond_3
    :goto_2
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v2, p2

    iput v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1248
    .end local v0    # "str":Ljava/lang/String;
    .end local v1    # "strLen":I
    :cond_4
    return-object p0
.end method

.method public appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1

    .line 428
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->newLine:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 429
    sget-object v0, Lorg/apache/commons/lang/SystemUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 430
    return-object p0

    .line 432
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->newLine:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendNull()Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1

    .line 441
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->nullText:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 442
    return-object p0

    .line 444
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendPadding(IC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "length"    # I
    .param p2, "padChar"    # C

    .line 1161
    if-ltz p1, :cond_0

    .line 1162
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1163
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 1164
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    aput-char p2, v1, v2

    .line 1163
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1167
    .end local v0    # "i":I
    :cond_0
    return-object p0
.end method

.method public appendSeparator(C)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "separator"    # C

    .line 1091
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1092
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(C)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1094
    :cond_0
    return-object p0
.end method

.method public appendSeparator(CI)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 0
    .param p1, "separator"    # C
    .param p2, "loopIndex"    # I

    .line 1146
    if-lez p2, :cond_0

    .line 1147
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(C)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1149
    :cond_0
    return-object p0
.end method

.method public appendSeparator(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "separator"    # Ljava/lang/String;

    .line 1065
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1066
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1068
    :cond_0
    return-object p0
.end method

.method public appendSeparator(Ljava/lang/String;I)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 0
    .param p1, "separator"    # Ljava/lang/String;
    .param p2, "loopIndex"    # I

    .line 1119
    if-eqz p1, :cond_0

    if-lez p2, :cond_0

    .line 1120
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1122
    :cond_0
    return-object p0
.end method

.method public appendWithSeparators(Ljava/util/Collection;Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 2
    .param p1, "coll"    # Ljava/util/Collection;
    .param p2, "separator"    # Ljava/lang/String;

    .line 1007
    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 1008
    if-nez p2, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    move-object p2, v0

    .line 1009
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1010
    .local v0, "it":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1011
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1012
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1013
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    goto :goto_1

    .line 1017
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_2
    return-object p0
.end method

.method public appendWithSeparators(Ljava/util/Iterator;Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "it"    # Ljava/util/Iterator;
    .param p2, "separator"    # Ljava/lang/String;

    .line 1031
    if-eqz p1, :cond_2

    .line 1032
    if-nez p2, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    move-object p2, v0

    .line 1033
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1034
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1035
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1036
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    goto :goto_1

    .line 1040
    :cond_2
    return-object p0
.end method

.method public appendWithSeparators([Ljava/lang/Object;Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 2
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "separator"    # Ljava/lang/String;

    .line 985
    if-eqz p1, :cond_1

    array-length v0, p1

    if-lez v0, :cond_1

    .line 986
    if-nez p2, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    move-object p2, v0

    .line 987
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 988
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 989
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 990
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 988
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 993
    .end local v0    # "i":I
    :cond_1
    return-object p0
.end method

.method public appendln(C)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "ch"    # C

    .line 870
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(C)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(D)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # D

    .line 914
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/text/StrBuilder;->append(D)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(F)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # F

    .line 903
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(F)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(I)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # I

    .line 881
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(I)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(J)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # J

    .line 892
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/text/StrBuilder;->append(J)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 744
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 756
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/String;II)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .line 770
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;II)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/StringBuffer;

    .line 782
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/StringBuffer;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .line 796
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Lorg/apache/commons/lang/text/StrBuilder;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Lorg/apache/commons/lang/text/StrBuilder;

    .line 808
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Lorg/apache/commons/lang/text/StrBuilder;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Lorg/apache/commons/lang/text/StrBuilder;II)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .line 822
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append(Lorg/apache/commons/lang/text/StrBuilder;II)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Z)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "value"    # Z

    .line 859
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Z)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln([C)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "chars"    # [C

    .line 834
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append([C)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln([CII)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "chars"    # [C
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .line 848
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append([CII)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public asReader()Ljava/io/Reader;
    .locals 1

    .line 2363
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder$StrBuilderReader;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang/text/StrBuilder$StrBuilderReader;-><init>(Lorg/apache/commons/lang/text/StrBuilder;)V

    return-object v0
.end method

.method public asTokenizer()Lorg/apache/commons/lang/text/StrTokenizer;
    .locals 1

    .line 2339
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder$StrBuilderTokenizer;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang/text/StrBuilder$StrBuilderTokenizer;-><init>(Lorg/apache/commons/lang/text/StrBuilder;)V

    return-object v0
.end method

.method public asWriter()Ljava/io/Writer;
    .locals 1

    .line 2388
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder$StrBuilderWriter;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang/text/StrBuilder$StrBuilderWriter;-><init>(Lorg/apache/commons/lang/text/StrBuilder;)V

    return-object v0
.end method

.method public capacity()I
    .locals 1

    .line 218
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    array-length v0, v0

    return v0
.end method

.method public charAt(I)C
    .locals 1
    .param p1, "index"    # I

    .line 302
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 305
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v0, v0, p1

    return v0

    .line 303
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public clear()Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1

    .line 287
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 288
    return-object p0
.end method

.method public contains(C)Z
    .locals 3
    .param p1, "ch"    # C

    .line 2026
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2027
    .local v0, "thisBuf":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge v1, v2, :cond_1

    .line 2028
    aget-char v2, v0, v1

    if-ne v2, p1, :cond_0

    .line 2029
    const/4 v2, 0x1

    return v2

    .line 2027
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2032
    .end local v1    # "i":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .line 2042
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public contains(Lorg/apache/commons/lang/text/StrMatcher;)Z
    .locals 2
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 2057
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Lorg/apache/commons/lang/text/StrMatcher;I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public delete(II)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .line 1482
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 1483
    sub-int v0, p2, p1

    .line 1484
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 1485
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/lang/text/StrBuilder;->deleteImpl(III)V

    .line 1487
    :cond_0
    return-object p0
.end method

.method public deleteAll(C)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 3
    .param p1, "ch"    # C

    .line 1498
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge v0, v1, :cond_3

    .line 1499
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_2

    .line 1500
    move v1, v0

    .line 1501
    .local v1, "start":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge v0, v2, :cond_1

    .line 1502
    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v2, v2, v0

    if-eq v2, p1, :cond_0

    .line 1503
    nop

    .line 1506
    :cond_1
    sub-int v2, v0, v1

    .line 1507
    .local v2, "len":I
    invoke-direct {p0, v1, v0, v2}, Lorg/apache/commons/lang/text/StrBuilder;->deleteImpl(III)V

    .line 1508
    sub-int/2addr v0, v2

    .line 1498
    .end local v1    # "start":I
    .end local v2    # "len":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1511
    .end local v0    # "i":I
    :cond_3
    return-object p0
.end method

.method public deleteAll(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .line 1538
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 1539
    .local v1, "len":I
    :goto_0
    if-lez v1, :cond_1

    .line 1540
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 1541
    .local v0, "index":I
    :goto_1
    if-ltz v0, :cond_1

    .line 1542
    add-int v2, v0, v1

    invoke-direct {p0, v0, v2, v1}, Lorg/apache/commons/lang/text/StrBuilder;->deleteImpl(III)V

    .line 1543
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1

    .line 1546
    .end local v0    # "index":I
    :cond_1
    return-object p0
.end method

.method public deleteAll(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 1578
    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v5, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    .end local p1    # "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v1, "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang/text/StrBuilder;->replace(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object p1

    return-object p1
.end method

.method public deleteCharAt(I)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 2
    .param p1, "index"    # I

    .line 336
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge p1, v0, :cond_0

    .line 339
    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->deleteImpl(III)V

    .line 340
    return-object p0

    .line 337
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public deleteFirst(C)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 3
    .param p1, "ch"    # C

    .line 1521
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge v0, v1, :cond_1

    .line 1522
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_0

    .line 1523
    add-int/lit8 v1, v0, 0x1

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/commons/lang/text/StrBuilder;->deleteImpl(III)V

    .line 1524
    goto :goto_1

    .line 1521
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1527
    .end local v0    # "i":I
    :cond_1
    :goto_1
    return-object p0
.end method

.method public deleteFirst(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .line 1556
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 1557
    .local v1, "len":I
    :goto_0
    if-lez v1, :cond_1

    .line 1558
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 1559
    .local v0, "index":I
    if-ltz v0, :cond_1

    .line 1560
    add-int v2, v0, v1

    invoke-direct {p0, v0, v2, v1}, Lorg/apache/commons/lang/text/StrBuilder;->deleteImpl(III)V

    .line 1563
    .end local v0    # "index":I
    :cond_1
    return-object p0
.end method

.method public deleteFirst(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 1592
    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v5, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    .end local p1    # "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v1, "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang/text/StrBuilder;->replace(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object p1

    return-object p1
.end method

.method public endsWith(Ljava/lang/String;)Z
    .locals 7
    .param p1, "str"    # Ljava/lang/String;

    .line 1895
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1896
    return v0

    .line 1898
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 1899
    .local v1, "len":I
    const/4 v2, 0x1

    if-nez v1, :cond_1

    .line 1900
    return v2

    .line 1902
    :cond_1
    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-le v1, v3, :cond_2

    .line 1903
    return v0

    .line 1905
    :cond_2
    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v3, v1

    .line 1906
    .local v3, "pos":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v1, :cond_4

    .line 1907
    iget-object v5, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v5, v5, v3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v5, v6, :cond_3

    .line 1908
    return v0

    .line 1906
    :cond_3
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1911
    .end local v4    # "i":I
    :cond_4
    return v2
.end method

.method public ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "capacity"    # I

    .line 228
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    array-length v0, v0

    if-le p1, v0, :cond_0

    .line 229
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 230
    .local v0, "old":[C
    new-array v1, p1, [C

    iput-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 231
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    .end local v0    # "old":[C
    :cond_0
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 2480
    instance-of v0, p1, Lorg/apache/commons/lang/text/StrBuilder;

    if-eqz v0, :cond_0

    .line 2481
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->equals(Lorg/apache/commons/lang/text/StrBuilder;)Z

    move-result v0

    return v0

    .line 2483
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Lorg/apache/commons/lang/text/StrBuilder;)Z
    .locals 7
    .param p1, "other"    # Lorg/apache/commons/lang/text/StrBuilder;

    .line 2456
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 2457
    return v0

    .line 2459
    :cond_0
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    iget v2, p1, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v3, 0x0

    if-eq v1, v2, :cond_1

    .line 2460
    return v3

    .line 2462
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2463
    .local v1, "thisBuf":[C
    iget-object v2, p1, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2464
    .local v2, "otherBuf":[C
    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v4, v0

    .local v4, "i":I
    :goto_0
    if-ltz v4, :cond_3

    .line 2465
    aget-char v5, v1, v4

    aget-char v6, v2, v4

    if-eq v5, v6, :cond_2

    .line 2466
    return v3

    .line 2464
    :cond_2
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 2469
    .end local v4    # "i":I
    :cond_3
    return v0
.end method

.method public equalsIgnoreCase(Lorg/apache/commons/lang/text/StrBuilder;)Z
    .locals 9
    .param p1, "other"    # Lorg/apache/commons/lang/text/StrBuilder;

    .line 2430
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 2431
    return v0

    .line 2433
    :cond_0
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    iget v2, p1, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v3, 0x0

    if-eq v1, v2, :cond_1

    .line 2434
    return v3

    .line 2436
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2437
    .local v1, "thisBuf":[C
    iget-object v2, p1, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2438
    .local v2, "otherBuf":[C
    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v4, v0

    .local v4, "i":I
    :goto_0
    if-ltz v4, :cond_3

    .line 2439
    aget-char v5, v1, v4

    .line 2440
    .local v5, "c1":C
    aget-char v6, v2, v4

    .line 2441
    .local v6, "c2":C
    if-eq v5, v6, :cond_2

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v7

    invoke-static {v6}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v8

    if-eq v7, v8, :cond_2

    .line 2442
    return v3

    .line 2438
    .end local v5    # "c1":C
    .end local v6    # "c2":C
    :cond_2
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 2445
    .end local v4    # "i":I
    :cond_3
    return v0
.end method

.method public getChars(II[CI)V
    .locals 2
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "destination"    # [C
    .param p4, "destinationIndex"    # I

    .line 405
    if-ltz p1, :cond_2

    .line 408
    if-ltz p2, :cond_1

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    if-gt p2, v0, :cond_1

    .line 411
    if-gt p1, p2, :cond_0

    .line 414
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    sub-int v1, p2, p1

    invoke-static {v0, p1, p3, p4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 415
    return-void

    .line 412
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "end < start"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 409
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 406
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public getChars([C)[C
    .locals 3
    .param p1, "destination"    # [C

    .line 386
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    .line 387
    .local v0, "len":I
    if-eqz p1, :cond_0

    array-length v1, p1

    if-ge v1, v0, :cond_1

    .line 388
    :cond_0
    new-array p1, v0, [C

    .line 390
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    invoke-static {v1, v2, p1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 391
    return-object p1
.end method

.method public getNewLineText()Ljava/lang/String;
    .locals 1

    .line 137
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->newLine:Ljava/lang/String;

    return-object v0
.end method

.method public getNullText()Ljava/lang/String;
    .locals 1

    .line 158
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->nullText:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 2492
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2493
    .local v0, "buf":[C
    const/4 v1, 0x0

    .line 2494
    .local v1, "hash":I
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v2, v2, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_0

    .line 2495
    mul-int/lit8 v3, v1, 0x1f

    aget-char v4, v0, v2

    add-int v1, v3, v4

    .line 2494
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 2497
    .end local v2    # "i":I
    :cond_0
    return v1
.end method

.method public indexOf(C)I
    .locals 1
    .param p1, "ch"    # C

    .line 2068
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(CI)I

    move-result v0

    return v0
.end method

.method public indexOf(CI)I
    .locals 4
    .param p1, "ch"    # C
    .param p2, "startIndex"    # I

    .line 2079
    if-gez p2, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    move v0, p2

    .line 2080
    .end local p2    # "startIndex":I
    .local v0, "startIndex":I
    :goto_0
    iget p2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v1, -0x1

    if-lt v0, p2, :cond_1

    .line 2081
    return v1

    .line 2083
    :cond_1
    iget-object p2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2084
    .local p2, "thisBuf":[C
    move v2, v0

    .local v2, "i":I
    :goto_1
    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge v2, v3, :cond_3

    .line 2085
    aget-char v3, p2, v2

    if-ne v3, p1, :cond_2

    .line 2086
    return v2

    .line 2084
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2089
    .end local v2    # "i":I
    :cond_3
    return v1
.end method

.method public indexOf(Ljava/lang/String;)I
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 2101
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/String;I)I
    .locals 8
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "startIndex"    # I

    .line 2115
    const/4 v0, 0x0

    if-gez p2, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    move v1, p2

    .line 2116
    .end local p2    # "startIndex":I
    .local v1, "startIndex":I
    :goto_0
    const/4 p2, -0x1

    if-eqz p1, :cond_8

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-lt v1, v2, :cond_1

    goto :goto_3

    .line 2119
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 2120
    .local v2, "strLen":I
    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 2121
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p2

    invoke-virtual {p0, p2, v1}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(CI)I

    move-result p2

    return p2

    .line 2123
    :cond_2
    if-nez v2, :cond_3

    .line 2124
    return v1

    .line 2126
    :cond_3
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-le v2, v0, :cond_4

    .line 2127
    return p2

    .line 2129
    :cond_4
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2130
    .local v0, "thisBuf":[C
    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v4, v2

    add-int/2addr v4, v3

    .line 2132
    .local v4, "len":I
    move v3, v1

    .local v3, "i":I
    :goto_1
    if-ge v3, v4, :cond_7

    .line 2133
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    if-ge v5, v2, :cond_6

    .line 2134
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    add-int v7, v3, v5

    aget-char v7, v0, v7

    if-eq v6, v7, :cond_5

    .line 2135
    nop

    .line 2132
    .end local v5    # "j":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2133
    .restart local v5    # "j":I
    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 2138
    .end local v5    # "j":I
    :cond_6
    return v3

    .line 2140
    .end local v3    # "i":I
    :cond_7
    return p2

    .line 2117
    .end local v0    # "thisBuf":[C
    .end local v2    # "strLen":I
    .end local v4    # "len":I
    :cond_8
    :goto_3
    return p2
.end method

.method public indexOf(Lorg/apache/commons/lang/text/StrMatcher;)I
    .locals 1
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 2154
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Lorg/apache/commons/lang/text/StrMatcher;I)I

    move-result v0

    return v0
.end method

.method public indexOf(Lorg/apache/commons/lang/text/StrMatcher;I)I
    .locals 5
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p2, "startIndex"    # I

    .line 2170
    if-gez p2, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    move v0, p2

    .line 2171
    .end local p2    # "startIndex":I
    .local v0, "startIndex":I
    :goto_0
    const/4 p2, -0x1

    if-eqz p1, :cond_4

    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-lt v0, v1, :cond_1

    goto :goto_2

    .line 2174
    :cond_1
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 2175
    .local v1, "len":I
    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2176
    .local v2, "buf":[C
    move v3, v0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_3

    .line 2177
    invoke-virtual {p1, v2, v3, v0, v1}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v4

    if-lez v4, :cond_2

    .line 2178
    return v3

    .line 2176
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2181
    .end local v3    # "i":I
    :cond_3
    return p2

    .line 2172
    .end local v1    # "len":I
    .end local v2    # "buf":[C
    :cond_4
    :goto_2
    return p2
.end method

.method public insert(IC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # C

    .line 1402
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->validateIndex(I)V

    .line 1403
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1404
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v3, p1

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1405
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aput-char p2, v0, p1

    .line 1406
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1407
    return-object p0
.end method

.method public insert(ID)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # D

    .line 1455
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(IF)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # F

    .line 1443
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(II)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .line 1419
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(IJ)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # J

    .line 1431
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(ILjava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "obj"    # Ljava/lang/Object;

    .line 1276
    if-nez p2, :cond_0

    .line 1277
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 1279
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 7
    .param p1, "index"    # I
    .param p2, "str"    # Ljava/lang/String;

    .line 1292
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->validateIndex(I)V

    .line 1293
    if-nez p2, :cond_0

    .line 1294
    iget-object p2, p0, Lorg/apache/commons/lang/text/StrBuilder;->nullText:Ljava/lang/String;

    .line 1296
    :cond_0
    const/4 v0, 0x0

    if-nez p2, :cond_1

    move v1, v0

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    .line 1297
    .local v1, "strLen":I
    :goto_0
    if-lez v1, :cond_2

    .line 1298
    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    .line 1299
    .local v2, "newSize":I
    invoke-virtual {p0, v2}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1300
    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget-object v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int v5, p1, v1

    iget v6, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v6, p1

    invoke-static {v3, p1, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1301
    iput v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1302
    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-virtual {p2, v0, v1, v3, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 1304
    .end local v2    # "newSize":I
    :cond_2
    return-object p0
.end method

.method public insert(IZ)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 5
    .param p1, "index"    # I
    .param p2, "value"    # Z

    .line 1371
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->validateIndex(I)V

    .line 1372
    const/16 v0, 0x65

    if-eqz p2, :cond_0

    .line 1373
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1374
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v3, p1, 0x4

    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1375
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v2, p1, 0x1

    .end local p1    # "index":I
    .local v2, "index":I
    const/16 v3, 0x74

    aput-char v3, v1, p1

    .line 1376
    iget-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .local v1, "index":I
    const/16 v3, 0x72

    aput-char v3, p1, v2

    .line 1377
    iget-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    const/16 v3, 0x75

    aput-char v3, p1, v1

    .line 1378
    iget-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aput-char v0, p1, v2

    .line 1379
    iget p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 p1, p1, 0x4

    iput p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    goto :goto_0

    .line 1381
    .end local v2    # "index":I
    .restart local p1    # "index":I
    :cond_0
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x5

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1382
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v3, p1, 0x5

    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1383
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v2, p1, 0x1

    .end local p1    # "index":I
    .restart local v2    # "index":I
    const/16 v3, 0x66

    aput-char v3, v1, p1

    .line 1384
    iget-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    const/16 v3, 0x61

    aput-char v3, p1, v2

    .line 1385
    iget-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    const/16 v3, 0x6c

    aput-char v3, p1, v1

    .line 1386
    iget-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    const/16 v3, 0x73

    aput-char v3, p1, v2

    .line 1387
    iget-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aput-char v0, p1, v1

    .line 1388
    iget p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 p1, p1, 0x5

    iput p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    move v2, v1

    .line 1390
    .end local v1    # "index":I
    .restart local v2    # "index":I
    :goto_0
    return-object p0
.end method

.method public insert(I[C)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 5
    .param p1, "index"    # I
    .param p2, "chars"    # [C

    .line 1317
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->validateIndex(I)V

    .line 1318
    if-nez p2, :cond_0

    .line 1319
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 1321
    :cond_0
    array-length v0, p2

    .line 1322
    .local v0, "len":I
    if-lez v0, :cond_1

    .line 1323
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1324
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int v3, p1, v0

    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1325
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-static {p2, v1, v2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1326
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1328
    :cond_1
    return-object p0
.end method

.method public insert(I[CII)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4
    .param p1, "index"    # I
    .param p2, "chars"    # [C
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .line 1343
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->validateIndex(I)V

    .line 1344
    if-nez p2, :cond_0

    .line 1345
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    return-object v0

    .line 1347
    :cond_0
    if-ltz p3, :cond_3

    array-length v0, p2

    if-gt p3, v0, :cond_3

    .line 1350
    if-ltz p4, :cond_2

    add-int v0, p3, p4

    array-length v1, p2

    if-gt v0, v1, :cond_2

    .line 1353
    if-lez p4, :cond_1

    .line 1354
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v0, p4

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1355
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int v2, p1, p4

    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v3, p1

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1356
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-static {p2, p3, v0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1357
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/2addr v0, p4

    iput v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1359
    :cond_1
    return-object p0

    .line 1351
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1348
    :cond_3
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 272
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public lastIndexOf(C)I
    .locals 1
    .param p1, "ch"    # C

    .line 2192
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->lastIndexOf(CI)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(CI)I
    .locals 3
    .param p1, "ch"    # C
    .param p2, "startIndex"    # I

    .line 2203
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-lt p2, v0, :cond_0

    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    move v0, p2

    .line 2204
    .end local p2    # "startIndex":I
    .local v0, "startIndex":I
    :goto_0
    const/4 p2, -0x1

    if-gez v0, :cond_1

    .line 2205
    return p2

    .line 2207
    :cond_1
    move v1, v0

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_3

    .line 2208
    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v2, v2, v1

    if-ne v2, p1, :cond_2

    .line 2209
    return v1

    .line 2207
    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 2212
    .end local v1    # "i":I
    :cond_3
    return p2
.end method

.method public lastIndexOf(Ljava/lang/String;)I
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 2224
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->lastIndexOf(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(Ljava/lang/String;I)I
    .locals 7
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "startIndex"    # I

    .line 2238
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v1, 0x1

    if-lt p2, v0, :cond_0

    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v0, v1

    goto :goto_0

    :cond_0
    move v0, p2

    .line 2239
    .end local p2    # "startIndex":I
    .local v0, "startIndex":I
    :goto_0
    const/4 p2, -0x1

    if-eqz p1, :cond_8

    if-gez v0, :cond_1

    goto :goto_4

    .line 2242
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 2243
    .local v2, "strLen":I
    if-lez v2, :cond_6

    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-gt v2, v3, :cond_6

    .line 2244
    if-ne v2, v1, :cond_2

    .line 2245
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    invoke-virtual {p0, p2, v0}, Lorg/apache/commons/lang/text/StrBuilder;->lastIndexOf(CI)I

    move-result p2

    return p2

    .line 2249
    :cond_2
    sub-int v3, v0, v2

    add-int/2addr v3, v1

    .local v3, "i":I
    :goto_1
    if-ltz v3, :cond_5

    .line 2250
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2
    if-ge v1, v2, :cond_4

    .line 2251
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    iget-object v5, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    add-int v6, v3, v1

    aget-char v5, v5, v6

    if-eq v4, v5, :cond_3

    .line 2252
    nop

    .line 2249
    .end local v1    # "j":I
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 2250
    .restart local v1    # "j":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 2255
    .end local v1    # "j":I
    :cond_4
    return v3

    .line 2249
    .end local v3    # "i":I
    :cond_5
    goto :goto_3

    .line 2258
    :cond_6
    if-nez v2, :cond_7

    .line 2259
    return v0

    .line 2261
    :cond_7
    :goto_3
    return p2

    .line 2240
    .end local v2    # "strLen":I
    :cond_8
    :goto_4
    return p2
.end method

.method public lastIndexOf(Lorg/apache/commons/lang/text/StrMatcher;)I
    .locals 1
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 2275
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->lastIndexOf(Lorg/apache/commons/lang/text/StrMatcher;I)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(Lorg/apache/commons/lang/text/StrMatcher;I)I
    .locals 5
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p2, "startIndex"    # I

    .line 2291
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-lt p2, v0, :cond_0

    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    move v0, p2

    .line 2292
    .end local p2    # "startIndex":I
    .local v0, "startIndex":I
    :goto_0
    const/4 p2, -0x1

    if-eqz p1, :cond_4

    if-gez v0, :cond_1

    goto :goto_2

    .line 2295
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 2296
    .local v1, "buf":[C
    add-int/lit8 v2, v0, 0x1

    .line 2297
    .local v2, "endIndex":I
    move v3, v0

    .local v3, "i":I
    :goto_1
    if-ltz v3, :cond_3

    .line 2298
    const/4 v4, 0x0

    invoke-virtual {p1, v1, v3, v4, v2}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v4

    if-lez v4, :cond_2

    .line 2299
    return v3

    .line 2297
    :cond_2
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 2302
    .end local v3    # "i":I
    :cond_3
    return p2

    .line 2293
    .end local v1    # "buf":[C
    .end local v2    # "endIndex":I
    :cond_4
    :goto_2
    return p2
.end method

.method public leftString(I)Ljava/lang/String;
    .locals 4
    .param p1, "length"    # I

    .line 1957
    if-gtz p1, :cond_0

    .line 1958
    const-string v0, ""

    return-object v0

    .line 1959
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v1, 0x0

    if-lt p1, v0, :cond_1

    .line 1960
    new-instance v0, Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-direct {v0, v2, v1, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    .line 1962
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-direct {v0, v2, v1, p1}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public length()I
    .locals 1

    .line 182
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    return v0
.end method

.method public midString(II)Ljava/lang/String;
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I

    .line 2005
    if-gez p1, :cond_0

    .line 2006
    const/4 p1, 0x0

    .line 2008
    :cond_0
    if-lez p2, :cond_3

    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_1

    goto :goto_0

    .line 2011
    :cond_1
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int v1, p1, p2

    if-gt v0, v1, :cond_2

    .line 2012
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    .line 2014
    :cond_2
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    invoke-direct {v0, v1, p1, p2}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    .line 2009
    :cond_3
    :goto_0
    const-string v0, ""

    return-object v0
.end method

.method public minimizeCapacity()Lorg/apache/commons/lang/text/StrBuilder;
    .locals 4

    .line 242
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    array-length v0, v0

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 243
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 244
    .local v0, "old":[C
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    new-array v1, v1, [C

    iput-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 245
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 247
    .end local v0    # "old":[C
    :cond_0
    return-object p0
.end method

.method public replace(IILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "replaceStr"    # Ljava/lang/String;

    .line 1630
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/text/StrBuilder;->validateRange(II)I

    move-result v2

    .line 1631
    .end local p2    # "endIndex":I
    .local v2, "endIndex":I
    if-nez p3, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p2

    :goto_0
    move v5, p2

    .line 1632
    .local v5, "insertLen":I
    sub-int v3, v2, p1

    move-object v0, p0

    move v1, p1

    move-object v4, p3

    .end local p1    # "startIndex":I
    .end local p3    # "replaceStr":Ljava/lang/String;
    .local v1, "startIndex":I
    .local v4, "replaceStr":Ljava/lang/String;
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1633
    return-object v0
.end method

.method public replace(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p2, "replaceStr"    # Ljava/lang/String;
    .param p3, "startIndex"    # I
    .param p4, "endIndex"    # I
    .param p5, "replaceCount"    # I

    .line 1767
    invoke-virtual {p0, p3, p4}, Lorg/apache/commons/lang/text/StrBuilder;->validateRange(II)I

    move-result v4

    .line 1768
    .end local p4    # "endIndex":I
    .local v4, "endIndex":I
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v5, p5

    .end local p1    # "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local p2    # "replaceStr":Ljava/lang/String;
    .end local p3    # "startIndex":I
    .end local p5    # "replaceCount":I
    .local v1, "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v2, "replaceStr":Ljava/lang/String;
    .local v3, "startIndex":I
    .local v5, "replaceCount":I
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang/text/StrBuilder;->replaceImpl(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object p1

    return-object p1
.end method

.method public replaceAll(CC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 2
    .param p1, "search"    # C
    .param p2, "replace"    # C

    .line 1646
    if-eq p1, p2, :cond_1

    .line 1647
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge v0, v1, :cond_1

    .line 1648
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_0

    .line 1649
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aput-char p2, v1, v0

    .line 1647
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1653
    .end local v0    # "i":I
    :cond_1
    return-object p0
.end method

.method public replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 8
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "replaceStr"    # Ljava/lang/String;

    .line 1685
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    :goto_0
    move v5, v1

    .line 1686
    .local v5, "searchLen":I
    if-lez v5, :cond_3

    .line 1687
    if-nez p2, :cond_1

    move v7, v0

    goto :goto_1

    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    move v7, v1

    .line 1688
    .local v7, "replaceLen":I
    :goto_1
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    move v3, v0

    .line 1689
    .local v3, "index":I
    :goto_2
    if-ltz v3, :cond_2

    .line 1690
    add-int v4, v3, v5

    move-object v2, p0

    move-object v6, p2

    .end local p2    # "replaceStr":Ljava/lang/String;
    .local v6, "replaceStr":Ljava/lang/String;
    invoke-direct/range {v2 .. v7}, Lorg/apache/commons/lang/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1691
    add-int p2, v3, v7

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v3

    move-object p2, v6

    goto :goto_2

    .line 1689
    .end local v6    # "replaceStr":Ljava/lang/String;
    .restart local p2    # "replaceStr":Ljava/lang/String;
    :cond_2
    move-object v2, p0

    move-object v6, p2

    .end local p2    # "replaceStr":Ljava/lang/String;
    .restart local v6    # "replaceStr":Ljava/lang/String;
    goto :goto_3

    .line 1686
    .end local v3    # "index":I
    .end local v6    # "replaceStr":Ljava/lang/String;
    .end local v7    # "replaceLen":I
    .restart local p2    # "replaceStr":Ljava/lang/String;
    :cond_3
    move-object v2, p0

    move-object v6, p2

    .line 1694
    .end local p2    # "replaceStr":Ljava/lang/String;
    .restart local v6    # "replaceStr":Ljava/lang/String;
    :goto_3
    return-object v2
.end method

.method public replaceAll(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p2, "replaceStr"    # Ljava/lang/String;

    .line 1729
    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v5, -0x1

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .end local p1    # "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local p2    # "replaceStr":Ljava/lang/String;
    .local v1, "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v2, "replaceStr":Ljava/lang/String;
    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang/text/StrBuilder;->replace(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object p1

    return-object p1
.end method

.method public replaceFirst(CC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 2
    .param p1, "search"    # C
    .param p2, "replace"    # C

    .line 1665
    if-eq p1, p2, :cond_1

    .line 1666
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge v0, v1, :cond_1

    .line 1667
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_0

    .line 1668
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aput-char p2, v1, v0

    .line 1669
    goto :goto_1

    .line 1666
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1673
    .end local v0    # "i":I
    :cond_1
    :goto_1
    return-object p0
.end method

.method public replaceFirst(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 8
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "replaceStr"    # Ljava/lang/String;

    .line 1705
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    :goto_0
    move v5, v1

    .line 1706
    .local v5, "searchLen":I
    if-lez v5, :cond_3

    .line 1707
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 1708
    .local v3, "index":I
    if-ltz v3, :cond_2

    .line 1709
    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    :goto_1
    move v7, v0

    .line 1710
    .local v7, "replaceLen":I
    add-int v4, v3, v5

    move-object v2, p0

    move-object v6, p2

    .end local p2    # "replaceStr":Ljava/lang/String;
    .local v6, "replaceStr":Ljava/lang/String;
    invoke-direct/range {v2 .. v7}, Lorg/apache/commons/lang/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    goto :goto_2

    .line 1708
    .end local v6    # "replaceStr":Ljava/lang/String;
    .end local v7    # "replaceLen":I
    .restart local p2    # "replaceStr":Ljava/lang/String;
    :cond_2
    move-object v2, p0

    move-object v6, p2

    .end local p2    # "replaceStr":Ljava/lang/String;
    .restart local v6    # "replaceStr":Ljava/lang/String;
    goto :goto_2

    .line 1706
    .end local v3    # "index":I
    .end local v6    # "replaceStr":Ljava/lang/String;
    .restart local p2    # "replaceStr":Ljava/lang/String;
    :cond_3
    move-object v2, p0

    move-object v6, p2

    .line 1713
    .end local p2    # "replaceStr":Ljava/lang/String;
    .restart local v6    # "replaceStr":Ljava/lang/String;
    :goto_2
    return-object v2
.end method

.method public replaceFirst(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p2, "replaceStr"    # Ljava/lang/String;

    .line 1744
    iget v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v5, 0x1

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .end local p1    # "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local p2    # "replaceStr":Ljava/lang/String;
    .local v1, "matcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v2, "replaceStr":Ljava/lang/String;
    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang/text/StrBuilder;->replace(Lorg/apache/commons/lang/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object p1

    return-object p1
.end method

.method public reverse()Lorg/apache/commons/lang/text/StrBuilder;
    .locals 6

    .line 1815
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-nez v0, :cond_0

    .line 1816
    return-object p0

    .line 1819
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    div-int/lit8 v0, v0, 0x2

    .line 1820
    .local v0, "half":I
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 1821
    .local v1, "buf":[C
    const/4 v2, 0x0

    .local v2, "leftIdx":I
    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    add-int/lit8 v3, v3, -0x1

    .local v3, "rightIdx":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 1822
    aget-char v4, v1, v2

    .line 1823
    .local v4, "swap":C
    aget-char v5, v1, v3

    aput-char v5, v1, v2

    .line 1824
    aput-char v4, v1, v3

    .line 1821
    .end local v4    # "swap":C
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 1826
    .end local v2    # "leftIdx":I
    .end local v3    # "rightIdx":I
    :cond_1
    return-object p0
.end method

.method public rightString(I)Ljava/lang/String;
    .locals 4
    .param p1, "length"    # I

    .line 1979
    if-gtz p1, :cond_0

    .line 1980
    const-string v0, ""

    return-object v0

    .line 1981
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_1

    .line 1982
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    .line 1984
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    sub-int/2addr v2, p1

    invoke-direct {v0, v1, v2, p1}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public setCharAt(IC)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "ch"    # C

    .line 319
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 322
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aput-char p2, v0, p1

    .line 323
    return-object p0

    .line 320
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public setLength(I)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 5
    .param p1, "length"    # I

    .line 194
    if-ltz p1, :cond_2

    .line 197
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge p1, v0, :cond_0

    .line 198
    iput p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    goto :goto_1

    .line 199
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-le p1, v0, :cond_1

    .line 200
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 201
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 202
    .local v0, "oldEnd":I
    move v1, p1

    .line 203
    .local v1, "newEnd":I
    iput p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 204
    move v2, v0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 205
    iget-object v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    const/4 v4, 0x0

    aput-char v4, v3, v2

    .line 204
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 208
    .end local v0    # "oldEnd":I
    .end local v1    # "newEnd":I
    .end local v2    # "i":I
    :cond_1
    :goto_1
    return-object p0

    .line 195
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public setNewLineText(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 0
    .param p1, "newLine"    # Ljava/lang/String;

    .line 147
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->newLine:Ljava/lang/String;

    .line 148
    return-object p0
.end method

.method public setNullText(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;
    .locals 1
    .param p1, "nullText"    # Ljava/lang/String;

    .line 168
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 169
    const/4 p1, 0x0

    .line 171
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrBuilder;->nullText:Ljava/lang/String;

    .line 172
    return-object p0
.end method

.method public size()I
    .locals 1

    .line 260
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    return v0
.end method

.method public startsWith(Ljava/lang/String;)Z
    .locals 6
    .param p1, "str"    # Ljava/lang/String;

    .line 1868
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1869
    return v0

    .line 1871
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 1872
    .local v1, "len":I
    const/4 v2, 0x1

    if-nez v1, :cond_1

    .line 1873
    return v2

    .line 1875
    :cond_1
    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-le v1, v3, :cond_2

    .line 1876
    return v0

    .line 1878
    :cond_2
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_4

    .line 1879
    iget-object v4, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    aget-char v4, v4, v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_3

    .line 1880
    return v0

    .line 1878
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1883
    .end local v3    # "i":I
    :cond_4
    return v2
.end method

.method public substring(I)Ljava/lang/String;
    .locals 1
    .param p1, "start"    # I

    .line 1923
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/text/StrBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public substring(II)Ljava/lang/String;
    .locals 3
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .line 1940
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 1941
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    sub-int v2, p2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public toCharArray()[C
    .locals 4

    .line 350
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-nez v0, :cond_0

    .line 351
    sget-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    return-object v0

    .line 353
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    new-array v0, v0, [C

    .line 354
    .local v0, "chars":[C
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 355
    return-object v0
.end method

.method public toCharArray(II)[C
    .locals 4
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .line 369
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 370
    sub-int v0, p2, p1

    .line 371
    .local v0, "len":I
    if-nez v0, :cond_0

    .line 372
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    return-object v1

    .line 374
    :cond_0
    new-array v1, v0, [C

    .line 375
    .local v1, "chars":[C
    iget-object v2, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    const/4 v3, 0x0

    invoke-static {v2, p1, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 376
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 2511
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public toStringBuffer()Ljava/lang/StringBuffer;
    .locals 4

    .line 2521
    new-instance v0, Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public trim()Lorg/apache/commons/lang/text/StrBuilder;
    .locals 5

    .line 1837
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-nez v0, :cond_0

    .line 1838
    return-object p0

    .line 1840
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 1841
    .local v0, "len":I
    iget-object v1, p0, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 1842
    .local v1, "buf":[C
    const/4 v2, 0x0

    .line 1843
    .local v2, "pos":I
    :goto_0
    const/16 v3, 0x20

    if-ge v2, v0, :cond_1

    aget-char v4, v1, v2

    if-gt v4, v3, :cond_1

    .line 1844
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1846
    :cond_1
    :goto_1
    if-ge v2, v0, :cond_2

    add-int/lit8 v4, v0, -0x1

    aget-char v4, v1, v4

    if-gt v4, v3, :cond_2

    .line 1847
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 1849
    :cond_2
    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-ge v0, v3, :cond_3

    .line 1850
    iget v3, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    invoke-virtual {p0, v0, v3}, Lorg/apache/commons/lang/text/StrBuilder;->delete(II)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1852
    :cond_3
    if-lez v2, :cond_4

    .line 1853
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v2}, Lorg/apache/commons/lang/text/StrBuilder;->delete(II)Lorg/apache/commons/lang/text/StrBuilder;

    .line 1855
    :cond_4
    return-object p0
.end method

.method protected validateIndex(I)V
    .locals 1
    .param p1, "index"    # I

    .line 2554
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-gt p1, v0, :cond_0

    .line 2557
    return-void

    .line 2555
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method protected validateRange(II)I
    .locals 2
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .line 2535
    if-ltz p1, :cond_2

    .line 2538
    iget v0, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    if-le p2, v0, :cond_0

    .line 2539
    iget p2, p0, Lorg/apache/commons/lang/text/StrBuilder;->size:I

    .line 2541
    :cond_0
    if-gt p1, p2, :cond_1

    .line 2544
    return p2

    .line 2542
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "end < start"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2536
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method
