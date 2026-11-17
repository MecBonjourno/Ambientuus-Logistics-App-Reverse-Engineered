.class public final Lorg/apache/commons/lang/math/Fraction;
.super Ljava/lang/Number;
.source "Fraction.java"

# interfaces
.implements Ljava/lang/Comparable;


# static fields
.field public static final FOUR_FIFTHS:Lorg/apache/commons/lang/math/Fraction;

.field public static final ONE:Lorg/apache/commons/lang/math/Fraction;

.field public static final ONE_FIFTH:Lorg/apache/commons/lang/math/Fraction;

.field public static final ONE_HALF:Lorg/apache/commons/lang/math/Fraction;

.field public static final ONE_QUARTER:Lorg/apache/commons/lang/math/Fraction;

.field public static final ONE_THIRD:Lorg/apache/commons/lang/math/Fraction;

.field public static final THREE_FIFTHS:Lorg/apache/commons/lang/math/Fraction;

.field public static final THREE_QUARTERS:Lorg/apache/commons/lang/math/Fraction;

.field public static final TWO_FIFTHS:Lorg/apache/commons/lang/math/Fraction;

.field public static final TWO_QUARTERS:Lorg/apache/commons/lang/math/Fraction;

.field public static final TWO_THIRDS:Lorg/apache/commons/lang/math/Fraction;

.field public static final ZERO:Lorg/apache/commons/lang/math/Fraction;

.field private static final serialVersionUID:J = 0x3b76f0847842L


# instance fields
.field private final denominator:I

.field private transient hashCode:I

.field private final numerator:I

.field private transient toProperString:Ljava/lang/String;

.field private transient toString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 48
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->ZERO:Lorg/apache/commons/lang/math/Fraction;

    .line 52
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v0, v2, v2}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->ONE:Lorg/apache/commons/lang/math/Fraction;

    .line 56
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    const/4 v1, 0x2

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->ONE_HALF:Lorg/apache/commons/lang/math/Fraction;

    .line 60
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    const/4 v3, 0x3

    invoke-direct {v0, v2, v3}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->ONE_THIRD:Lorg/apache/commons/lang/math/Fraction;

    .line 64
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v0, v1, v3}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->TWO_THIRDS:Lorg/apache/commons/lang/math/Fraction;

    .line 68
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    const/4 v4, 0x4

    invoke-direct {v0, v2, v4}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->ONE_QUARTER:Lorg/apache/commons/lang/math/Fraction;

    .line 72
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v0, v1, v4}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->TWO_QUARTERS:Lorg/apache/commons/lang/math/Fraction;

    .line 76
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v0, v3, v4}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->THREE_QUARTERS:Lorg/apache/commons/lang/math/Fraction;

    .line 80
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    const/4 v5, 0x5

    invoke-direct {v0, v2, v5}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->ONE_FIFTH:Lorg/apache/commons/lang/math/Fraction;

    .line 84
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v0, v1, v5}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->TWO_FIFTHS:Lorg/apache/commons/lang/math/Fraction;

    .line 88
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v0, v3, v5}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->THREE_FIFTHS:Lorg/apache/commons/lang/math/Fraction;

    .line 92
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v0, v4, v5}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang/math/Fraction;->FOUR_FIFTHS:Lorg/apache/commons/lang/math/Fraction;

    return-void
.end method

.method private constructor <init>(II)V
    .locals 1
    .param p1, "numerator"    # I
    .param p2, "denominator"    # I

    .line 125
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 107
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/Fraction;->hashCode:I

    .line 111
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toString:Ljava/lang/String;

    .line 115
    iput-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    .line 126
    iput p1, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    .line 127
    iput p2, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    .line 128
    return-void
.end method

.method private static addAndCheck(II)I
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I

    .line 665
    int-to-long v0, p0

    int-to-long v2, p1

    add-long/2addr v0, v2

    .line 666
    .local v0, "s":J
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    .line 670
    long-to-int v2, v0

    return v2

    .line 668
    :cond_0
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: add"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private addSub(Lorg/apache/commons/lang/math/Fraction;Z)Lorg/apache/commons/lang/math/Fraction;
    .locals 11
    .param p1, "fraction"    # Lorg/apache/commons/lang/math/Fraction;
    .param p2, "isAdd"    # Z

    .line 730
    if-eqz p1, :cond_8

    .line 734
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-nez v0, :cond_1

    .line 735
    if-eqz p2, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Fraction;->negate()Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    :goto_0
    return-object v0

    .line 737
    :cond_1
    iget v0, p1, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-nez v0, :cond_2

    .line 738
    return-object p0

    .line 742
    :cond_2
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    iget v1, p1, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    invoke-static {v0, v1}, Lorg/apache/commons/lang/math/Fraction;->greatestCommonDivisor(II)I

    move-result v0

    .line 743
    .local v0, "d1":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    .line 745
    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v2, p1, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    invoke-static {v1, v2}, Lorg/apache/commons/lang/math/Fraction;->mulAndCheck(II)I

    move-result v1

    .line 746
    .local v1, "uvp":I
    iget v2, p1, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v3, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    invoke-static {v2, v3}, Lorg/apache/commons/lang/math/Fraction;->mulAndCheck(II)I

    move-result v2

    .line 747
    .local v2, "upv":I
    new-instance v3, Lorg/apache/commons/lang/math/Fraction;

    if-eqz p2, :cond_3

    invoke-static {v1, v2}, Lorg/apache/commons/lang/math/Fraction;->addAndCheck(II)I

    move-result v4

    goto :goto_1

    :cond_3
    invoke-static {v1, v2}, Lorg/apache/commons/lang/math/Fraction;->subAndCheck(II)I

    move-result v4

    :goto_1
    iget v5, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    iget v6, p1, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    invoke-static {v5, v6}, Lorg/apache/commons/lang/math/Fraction;->mulPosAndCheck(II)I

    move-result v5

    invoke-direct {v3, v4, v5}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    return-object v3

    .line 754
    .end local v1    # "uvp":I
    .end local v2    # "upv":I
    :cond_4
    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    iget v2, p1, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v2, v0

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 756
    .local v1, "uvp":Ljava/math/BigInteger;
    iget v2, p1, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    iget v3, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v3, v0

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 758
    .local v2, "upv":Ljava/math/BigInteger;
    if-eqz p2, :cond_5

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    goto :goto_2

    :cond_5
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 761
    .local v3, "t":Ljava/math/BigInteger;
    :goto_2
    int-to-long v4, v0

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    .line 762
    .local v4, "tmodd1":I
    if-nez v4, :cond_6

    move v5, v0

    goto :goto_3

    :cond_6
    invoke-static {v4, v0}, Lorg/apache/commons/lang/math/Fraction;->greatestCommonDivisor(II)I

    move-result v5

    .line 765
    .local v5, "d2":I
    :goto_3
    int-to-long v6, v5

    invoke-static {v6, v7}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 766
    .local v6, "w":Ljava/math/BigInteger;
    invoke-virtual {v6}, Ljava/math/BigInteger;->bitLength()I

    move-result v7

    const/16 v8, 0x1f

    if-gt v7, v8, :cond_7

    .line 770
    new-instance v7, Lorg/apache/commons/lang/math/Fraction;

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v8

    iget v9, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v9, v0

    iget v10, p1, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v10, v5

    invoke-static {v9, v10}, Lorg/apache/commons/lang/math/Fraction;->mulPosAndCheck(II)I

    move-result v9

    invoke-direct {v7, v8, v9}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    return-object v7

    .line 767
    :cond_7
    new-instance v7, Ljava/lang/ArithmeticException;

    const-string v8, "overflow: numerator too large after multiply"

    invoke-direct {v7, v8}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 731
    .end local v0    # "d1":I
    .end local v1    # "uvp":Ljava/math/BigInteger;
    .end local v2    # "upv":Ljava/math/BigInteger;
    .end local v3    # "t":Ljava/math/BigInteger;
    .end local v4    # "tmodd1":I
    .end local v5    # "d2":I
    .end local v6    # "w":Ljava/math/BigInteger;
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The fraction must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getFraction(D)Lorg/apache/commons/lang/math/Fraction;
    .locals 28
    .param p0, "value"    # D

    .line 250
    const-wide/16 v0, 0x0

    cmpg-double v0, p0, v0

    if-gez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 251
    .local v0, "sign":I
    :goto_0
    invoke-static/range {p0 .. p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    .line 252
    .end local p0    # "value":D
    .local v2, "value":D
    const-wide v4, 0x41dfffffffc00000L    # 2.147483647E9

    cmpl-double v4, v2, v4

    if-gtz v4, :cond_4

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_4

    .line 256
    double-to-int v4, v2

    .line 257
    .local v4, "wholeNumber":I
    int-to-double v5, v4

    sub-double/2addr v2, v5

    .line 259
    const/4 v5, 0x0

    .line 260
    .local v5, "numer0":I
    const/4 v6, 0x1

    .line 261
    .local v6, "denom0":I
    const/4 v7, 0x1

    .line 262
    .local v7, "numer1":I
    const/4 v8, 0x0

    .line 263
    .local v8, "denom1":I
    const/4 v9, 0x0

    .line 264
    .local v9, "numer2":I
    const/4 v10, 0x0

    .line 265
    .local v10, "denom2":I
    double-to-int v11, v2

    .line 266
    .local v11, "a1":I
    const/4 v12, 0x0

    .line 267
    .local v12, "a2":I
    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    .line 268
    .local v13, "x1":D
    const-wide/16 v15, 0x0

    .line 269
    .local v15, "x2":D
    move-wide/from16 p0, v2

    const/16 v17, 0x1

    .end local v2    # "value":D
    .restart local p0    # "value":D
    int-to-double v1, v11

    sub-double v2, p0, v1

    .line 270
    .local v2, "y1":D
    const-wide/16 v18, 0x0

    .line 271
    .local v18, "y2":D
    const-wide v20, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 273
    .local v20, "delta2":D
    const/4 v1, 0x1

    .line 276
    .local v1, "i":I
    :goto_1
    move-wide/from16 v22, v20

    .line 277
    .local v22, "delta1":D
    move/from16 v24, v0

    move/from16 v25, v1

    .end local v0    # "sign":I
    .end local v1    # "i":I
    .local v24, "sign":I
    .local v25, "i":I
    div-double v0, v13, v2

    double-to-int v12, v0

    .line 278
    move-wide v15, v2

    .line 279
    int-to-double v0, v12

    mul-double/2addr v0, v2

    sub-double v18, v13, v0

    .line 280
    mul-int v0, v11, v7

    add-int v9, v0, v5

    .line 281
    mul-int v0, v11, v8

    add-int v10, v0, v6

    .line 282
    int-to-double v0, v9

    move-wide/from16 v26, v0

    int-to-double v0, v10

    div-double v0, v26, v0

    .line 283
    .local v0, "fraction":D
    sub-double v26, p0, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->abs(D)D

    move-result-wide v20

    .line 285
    move v11, v12

    .line 286
    move-wide v13, v15

    .line 287
    move-wide/from16 v2, v18

    .line 288
    move v5, v7

    .line 289
    move v6, v8

    .line 290
    move v7, v9

    .line 291
    move v8, v10

    .line 292
    move-wide/from16 v26, v0

    .end local v0    # "fraction":D
    .local v26, "fraction":D
    add-int/lit8 v0, v25, 0x1

    .line 294
    .end local v25    # "i":I
    .local v0, "i":I
    cmpl-double v1, v22, v20

    move/from16 v25, v1

    if-lez v25, :cond_2

    const/16 v1, 0x2710

    if-gt v10, v1, :cond_2

    if-lez v10, :cond_2

    const/16 v1, 0x19

    if-lt v0, v1, :cond_1

    goto :goto_2

    :cond_1
    move v1, v0

    move/from16 v0, v24

    goto :goto_1

    .line 295
    :cond_2
    :goto_2
    const/16 v1, 0x19

    if-eq v0, v1, :cond_3

    .line 298
    mul-int v1, v4, v6

    add-int/2addr v1, v5

    mul-int v1, v1, v24

    invoke-static {v1, v6}, Lorg/apache/commons/lang/math/Fraction;->getReducedFraction(II)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v1

    return-object v1

    .line 296
    :cond_3
    new-instance v1, Ljava/lang/ArithmeticException;

    move/from16 v17, v0

    .end local v0    # "i":I
    .local v17, "i":I
    const-string v0, "Unable to convert double to fraction"

    invoke-direct {v1, v0}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 252
    .end local v4    # "wholeNumber":I
    .end local v5    # "numer0":I
    .end local v6    # "denom0":I
    .end local v7    # "numer1":I
    .end local v8    # "denom1":I
    .end local v9    # "numer2":I
    .end local v10    # "denom2":I
    .end local v11    # "a1":I
    .end local v12    # "a2":I
    .end local v13    # "x1":D
    .end local v15    # "x2":D
    .end local v17    # "i":I
    .end local v18    # "y2":D
    .end local v20    # "delta2":D
    .end local v22    # "delta1":D
    .end local v24    # "sign":I
    .end local v26    # "fraction":D
    .end local p0    # "value":D
    .local v0, "sign":I
    .local v2, "value":D
    :cond_4
    move/from16 v24, v0

    .line 253
    .end local v0    # "sign":I
    .restart local v24    # "sign":I
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The value must not be greater than Integer.MAX_VALUE or NaN"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getFraction(II)Lorg/apache/commons/lang/math/Fraction;
    .locals 2
    .param p0, "numerator"    # I
    .param p1, "denominator"    # I

    .line 142
    if-eqz p1, :cond_2

    .line 145
    if-gez p1, :cond_1

    .line 146
    const/high16 v0, -0x80000000

    if-eq p0, v0, :cond_0

    if-eq p1, v0, :cond_0

    .line 150
    neg-int p0, p0

    .line 151
    neg-int p1, p1

    goto :goto_0

    .line 148
    :cond_0
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "overflow: can\'t negate"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_1
    :goto_0
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    return-object v0

    .line 143
    :cond_2
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The denominator must not be zero"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getFraction(III)Lorg/apache/commons/lang/math/Fraction;
    .locals 4
    .param p0, "whole"    # I
    .param p1, "numerator"    # I
    .param p2, "denominator"    # I

    .line 173
    if-eqz p2, :cond_4

    .line 176
    if-ltz p2, :cond_3

    .line 179
    if-ltz p1, :cond_2

    .line 183
    if-gez p0, :cond_0

    .line 184
    int-to-long v0, p0

    int-to-long v2, p2

    mul-long/2addr v0, v2

    int-to-long v2, p1

    sub-long/2addr v0, v2

    .local v0, "numeratorValue":J
    goto :goto_0

    .line 186
    .end local v0    # "numeratorValue":J
    :cond_0
    int-to-long v0, p0

    int-to-long v2, p2

    mul-long/2addr v0, v2

    int-to-long v2, p1

    add-long/2addr v0, v2

    .line 188
    .restart local v0    # "numeratorValue":J
    :goto_0
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_1

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    .line 192
    new-instance v2, Lorg/apache/commons/lang/math/Fraction;

    long-to-int v3, v0

    invoke-direct {v2, v3, p2}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    return-object v2

    .line 190
    :cond_1
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "Numerator too large to represent as an Integer."

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 180
    .end local v0    # "numeratorValue":J
    :cond_2
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The numerator must not be negative"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_3
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The denominator must not be negative"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_4
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The denominator must not be zero"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getFraction(Ljava/lang/String;)Lorg/apache/commons/lang/math/Fraction;
    .locals 5
    .param p0, "str"    # Ljava/lang/String;

    .line 320
    if-eqz p0, :cond_4

    .line 324
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 325
    .local v0, "pos":I
    if-ltz v0, :cond_0

    .line 326
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    invoke-static {v1, v2}, Lorg/apache/commons/lang/math/Fraction;->getFraction(D)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v1

    return-object v1

    .line 330
    :cond_0
    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 331
    const/16 v1, 0x2f

    const/4 v2, 0x0

    if-lez v0, :cond_2

    .line 332
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 333
    .local v3, "whole":I
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 334
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 335
    if-ltz v0, :cond_1

    .line 338
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 339
    .local v1, "numer":I
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 340
    .local v2, "denom":I
    invoke-static {v3, v1, v2}, Lorg/apache/commons/lang/math/Fraction;->getFraction(III)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v4

    return-object v4

    .line 336
    .end local v1    # "numer":I
    .end local v2    # "denom":I
    :cond_1
    new-instance v1, Ljava/lang/NumberFormatException;

    const-string v2, "The fraction could not be parsed as the format X Y/Z"

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 345
    .end local v3    # "whole":I
    :cond_2
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 346
    if-gez v0, :cond_3

    .line 348
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lorg/apache/commons/lang/math/Fraction;->getFraction(II)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v1

    return-object v1

    .line 350
    :cond_3
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 351
    .restart local v1    # "numer":I
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 352
    .restart local v2    # "denom":I
    invoke-static {v1, v2}, Lorg/apache/commons/lang/math/Fraction;->getFraction(II)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v3

    return-object v3

    .line 321
    .end local v0    # "pos":I
    .end local v1    # "numer":I
    .end local v2    # "denom":I
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The string must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getReducedFraction(II)Lorg/apache/commons/lang/math/Fraction;
    .locals 2
    .param p0, "numerator"    # I
    .param p1, "denominator"    # I

    .line 210
    if-eqz p1, :cond_4

    .line 213
    if-nez p0, :cond_0

    .line 214
    sget-object v0, Lorg/apache/commons/lang/math/Fraction;->ZERO:Lorg/apache/commons/lang/math/Fraction;

    return-object v0

    .line 217
    :cond_0
    const/high16 v0, -0x80000000

    if-ne p1, v0, :cond_1

    and-int/lit8 v1, p0, 0x1

    if-nez v1, :cond_1

    .line 218
    div-int/lit8 p0, p0, 0x2

    div-int/lit8 p1, p1, 0x2

    .line 220
    :cond_1
    if-gez p1, :cond_3

    .line 221
    if-eq p0, v0, :cond_2

    if-eq p1, v0, :cond_2

    .line 225
    neg-int p0, p0

    .line 226
    neg-int p1, p1

    goto :goto_0

    .line 223
    :cond_2
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "overflow: can\'t negate"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 229
    :cond_3
    :goto_0
    invoke-static {p0, p1}, Lorg/apache/commons/lang/math/Fraction;->greatestCommonDivisor(II)I

    move-result v0

    .line 230
    .local v0, "gcd":I
    div-int/2addr p0, v0

    .line 231
    div-int/2addr p1, v0

    .line 232
    new-instance v1, Lorg/apache/commons/lang/math/Fraction;

    invoke-direct {v1, p0, p1}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    return-object v1

    .line 211
    .end local v0    # "gcd":I
    :cond_4
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The denominator must not be zero"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static greatestCommonDivisor(II)I
    .locals 4
    .param p0, "u"    # I
    .param p1, "v"    # I

    .line 574
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_9

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_3

    .line 581
    :cond_0
    if-lez p0, :cond_1

    neg-int p0, p0

    .line 582
    :cond_1
    if-lez p1, :cond_2

    neg-int p1, p1

    .line 584
    :cond_2
    const/4 v0, 0x0

    .line 585
    .local v0, "k":I
    :goto_0
    and-int/lit8 v2, p0, 0x1

    const/16 v3, 0x1f

    if-nez v2, :cond_3

    and-int/lit8 v2, p1, 0x1

    if-nez v2, :cond_3

    if-ge v0, v3, :cond_3

    .line 586
    div-int/lit8 p0, p0, 0x2

    div-int/lit8 p1, p1, 0x2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 588
    :cond_3
    if-eq v0, v3, :cond_8

    .line 593
    and-int/lit8 v2, p0, 0x1

    if-ne v2, v1, :cond_4

    move v2, p1

    goto :goto_1

    :cond_4
    div-int/lit8 v2, p0, 0x2

    neg-int v2, v2

    .line 599
    .local v2, "t":I
    :cond_5
    :goto_1
    and-int/lit8 v3, v2, 0x1

    if-nez v3, :cond_6

    .line 600
    div-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 603
    :cond_6
    if-lez v2, :cond_7

    .line 604
    neg-int p0, v2

    goto :goto_2

    .line 606
    :cond_7
    move p1, v2

    .line 609
    :goto_2
    sub-int v3, p1, p0

    div-int/lit8 v2, v3, 0x2

    .line 612
    if-nez v2, :cond_5

    .line 613
    neg-int v3, p0

    shl-int/2addr v1, v0

    mul-int/2addr v3, v1

    return v3

    .line 589
    .end local v2    # "t":I
    :cond_8
    new-instance v1, Ljava/lang/ArithmeticException;

    const-string v2, "overflow: gcd is 2^31"

    invoke-direct {v1, v2}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 575
    .end local v0    # "k":I
    :cond_9
    :goto_3
    return v1
.end method

.method private static mulAndCheck(II)I
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I

    .line 629
    int-to-long v0, p0

    int-to-long v2, p1

    mul-long/2addr v0, v2

    .line 630
    .local v0, "m":J
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    .line 634
    long-to-int v2, v0

    return v2

    .line 632
    :cond_0
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: mul"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static mulPosAndCheck(II)I
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I

    .line 648
    int-to-long v0, p0

    int-to-long v2, p1

    mul-long/2addr v0, v2

    .line 649
    .local v0, "m":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    .line 652
    long-to-int v2, v0

    return v2

    .line 650
    :cond_0
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: mulPos"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static subAndCheck(II)I
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I

    .line 683
    int-to-long v0, p0

    int-to-long v2, p1

    sub-long/2addr v0, v2

    .line 684
    .local v0, "s":J
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    .line 688
    long-to-int v2, v0

    return v2

    .line 686
    :cond_0
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: add"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public abs()Lorg/apache/commons/lang/math/Fraction;
    .locals 1

    .line 524
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-ltz v0, :cond_0

    .line 525
    return-object p0

    .line 527
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->negate()Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    return-object v0
.end method

.method public add(Lorg/apache/commons/lang/math/Fraction;)Lorg/apache/commons/lang/math/Fraction;
    .locals 1
    .param p1, "fraction"    # Lorg/apache/commons/lang/math/Fraction;

    .line 702
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/lang/math/Fraction;->addSub(Lorg/apache/commons/lang/math/Fraction;Z)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    return-object v0
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 8
    .param p1, "object"    # Ljava/lang/Object;

    .line 870
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/lang/math/Fraction;

    .line 871
    .local v0, "other":Lorg/apache/commons/lang/math/Fraction;
    const/4 v1, 0x0

    if-ne p0, v0, :cond_0

    .line 872
    return v1

    .line 874
    :cond_0
    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v3, v0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-ne v2, v3, :cond_1

    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    iget v3, v0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    if-ne v2, v3, :cond_1

    .line 875
    return v1

    .line 879
    :cond_1
    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    int-to-long v2, v2

    iget v4, v0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    int-to-long v4, v4

    mul-long/2addr v2, v4

    .line 880
    .local v2, "first":J
    iget v4, v0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    int-to-long v4, v4

    iget v6, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    int-to-long v6, v6

    mul-long/2addr v4, v6

    .line 881
    .local v4, "second":J
    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    .line 882
    return v1

    .line 883
    :cond_2
    cmp-long v1, v2, v4

    if-gez v1, :cond_3

    .line 884
    const/4 v1, -0x1

    return v1

    .line 886
    :cond_3
    const/4 v1, 0x1

    return v1
.end method

.method public divideBy(Lorg/apache/commons/lang/math/Fraction;)Lorg/apache/commons/lang/math/Fraction;
    .locals 2
    .param p1, "fraction"    # Lorg/apache/commons/lang/math/Fraction;

    .line 812
    if-eqz p1, :cond_1

    .line 815
    iget v0, p1, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-eqz v0, :cond_0

    .line 818
    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Fraction;->invert()Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/math/Fraction;->multiplyBy(Lorg/apache/commons/lang/math/Fraction;)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    return-object v0

    .line 816
    :cond_0
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The fraction to divide by must not be zero"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 813
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The fraction must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public doubleValue()D
    .locals 4

    .line 450
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    int-to-double v0, v0

    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .line 833
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 834
    return v0

    .line 836
    :cond_0
    instance-of v1, p1, Lorg/apache/commons/lang/math/Fraction;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 837
    return v2

    .line 839
    :cond_1
    move-object v1, p1

    check-cast v1, Lorg/apache/commons/lang/math/Fraction;

    .line 840
    .local v1, "other":Lorg/apache/commons/lang/math/Fraction;
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getNumerator()I

    move-result v3

    invoke-virtual {v1}, Lorg/apache/commons/lang/math/Fraction;->getNumerator()I

    move-result v4

    if-ne v3, v4, :cond_2

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getDenominator()I

    move-result v3

    invoke-virtual {v1}, Lorg/apache/commons/lang/math/Fraction;->getDenominator()I

    move-result v4

    if-ne v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public floatValue()F
    .locals 2

    .line 440
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    int-to-float v0, v0

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method public getDenominator()I
    .locals 1

    .line 377
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    return v0
.end method

.method public getNumerator()I
    .locals 1

    .line 368
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    return v0
.end method

.method public getProperNumerator()I
    .locals 2

    .line 392
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    rem-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    return v0
.end method

.method public getProperWhole()I
    .locals 2

    .line 407
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v0, v1

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 850
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->hashCode:I

    if-nez v0, :cond_0

    .line 852
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getNumerator()I

    move-result v0

    add-int/lit16 v0, v0, 0x275

    mul-int/lit8 v0, v0, 0x25

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getDenominator()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/Fraction;->hashCode:I

    .line 854
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->hashCode:I

    return v0
.end method

.method public intValue()I
    .locals 2

    .line 420
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v0, v1

    return v0
.end method

.method public invert()Lorg/apache/commons/lang/math/Fraction;
    .locals 3

    .line 486
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-eqz v0, :cond_2

    .line 489
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_1

    .line 492
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-gez v0, :cond_0

    .line 493
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    neg-int v1, v1

    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    neg-int v2, v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    return-object v0

    .line 495
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    return-object v0

    .line 490
    :cond_1
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "overflow: can\'t negate numerator"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 487
    :cond_2
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Unable to invert zero."

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public longValue()J
    .locals 4

    .line 430
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    int-to-long v0, v0

    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public multiplyBy(Lorg/apache/commons/lang/math/Fraction;)Lorg/apache/commons/lang/math/Fraction;
    .locals 5
    .param p1, "fraction"    # Lorg/apache/commons/lang/math/Fraction;

    .line 786
    if-eqz p1, :cond_2

    .line 789
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-eqz v0, :cond_1

    iget v0, p1, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-nez v0, :cond_0

    goto :goto_0

    .line 794
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v1, p1, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    invoke-static {v0, v1}, Lorg/apache/commons/lang/math/Fraction;->greatestCommonDivisor(II)I

    move-result v0

    .line 795
    .local v0, "d1":I
    iget v1, p1, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    invoke-static {v1, v2}, Lorg/apache/commons/lang/math/Fraction;->greatestCommonDivisor(II)I

    move-result v1

    .line 796
    .local v1, "d2":I
    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    div-int/2addr v2, v0

    iget v3, p1, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    div-int/2addr v3, v1

    invoke-static {v2, v3}, Lorg/apache/commons/lang/math/Fraction;->mulAndCheck(II)I

    move-result v2

    iget v3, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v3, v1

    iget v4, p1, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v4, v0

    invoke-static {v3, v4}, Lorg/apache/commons/lang/math/Fraction;->mulPosAndCheck(II)I

    move-result v3

    invoke-static {v2, v3}, Lorg/apache/commons/lang/math/Fraction;->getReducedFraction(II)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v2

    return-object v2

    .line 790
    .end local v0    # "d1":I
    .end local v1    # "d2":I
    :cond_1
    :goto_0
    sget-object v0, Lorg/apache/commons/lang/math/Fraction;->ZERO:Lorg/apache/commons/lang/math/Fraction;

    return-object v0

    .line 787
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The fraction must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public negate()Lorg/apache/commons/lang/math/Fraction;
    .locals 3

    .line 508
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_0

    .line 511
    new-instance v0, Lorg/apache/commons/lang/math/Fraction;

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    neg-int v1, v1

    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang/math/Fraction;-><init>(II)V

    return-object v0

    .line 509
    :cond_0
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "overflow: too large to negate"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public pow(I)Lorg/apache/commons/lang/math/Fraction;
    .locals 2
    .param p1, "power"    # I

    .line 543
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 544
    return-object p0

    .line 545
    :cond_0
    if-nez p1, :cond_1

    .line 546
    sget-object v0, Lorg/apache/commons/lang/math/Fraction;->ONE:Lorg/apache/commons/lang/math/Fraction;

    return-object v0

    .line 547
    :cond_1
    if-gez p1, :cond_3

    .line 548
    const/high16 v0, -0x80000000

    if-ne p1, v0, :cond_2

    .line 549
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->invert()Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/math/Fraction;->pow(I)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    div-int/lit8 v1, p1, 0x2

    neg-int v1, v1

    :try_start_0
    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/math/Fraction;->pow(I)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .end local p0    # "this":Lorg/apache/commons/lang/math/Fraction;
    .end local p1    # "power":I
    :catchall_0
    move-exception p1

    throw p1

    .line 551
    .restart local p1    # "power":I
    :cond_2
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->invert()Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    neg-int v1, p1

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/math/Fraction;->pow(I)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    return-object v0

    .line 553
    :cond_3
    invoke-virtual {p0, p0}, Lorg/apache/commons/lang/math/Fraction;->multiplyBy(Lorg/apache/commons/lang/math/Fraction;)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    .line 554
    .local v0, "f":Lorg/apache/commons/lang/math/Fraction;
    rem-int/lit8 v1, p1, 0x2

    if-nez v1, :cond_4

    .line 555
    div-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/math/Fraction;->pow(I)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v1

    return-object v1

    .line 557
    :cond_4
    div-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/math/Fraction;->pow(I)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v1

    invoke-virtual {v1, p0}, Lorg/apache/commons/lang/math/Fraction;->multiplyBy(Lorg/apache/commons/lang/math/Fraction;)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v1

    return-object v1
.end method

.method public reduce()Lorg/apache/commons/lang/math/Fraction;
    .locals 3

    .line 466
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-nez v0, :cond_1

    .line 467
    sget-object v0, Lorg/apache/commons/lang/math/Fraction;->ZERO:Lorg/apache/commons/lang/math/Fraction;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/math/Fraction;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p0

    goto :goto_0

    :cond_0
    sget-object v0, Lorg/apache/commons/lang/math/Fraction;->ZERO:Lorg/apache/commons/lang/math/Fraction;

    :goto_0
    return-object v0

    .line 469
    :cond_1
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    invoke-static {v0, v1}, Lorg/apache/commons/lang/math/Fraction;->greatestCommonDivisor(II)I

    move-result v0

    .line 470
    .local v0, "gcd":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 471
    return-object p0

    .line 473
    :cond_2
    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    div-int/2addr v1, v0

    iget v2, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    div-int/2addr v2, v0

    invoke-static {v1, v2}, Lorg/apache/commons/lang/math/Fraction;->getFraction(II)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v1

    return-object v1
.end method

.method public subtract(Lorg/apache/commons/lang/math/Fraction;)Lorg/apache/commons/lang/math/Fraction;
    .locals 1
    .param p1, "fraction"    # Lorg/apache/commons/lang/math/Fraction;

    .line 716
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/lang/math/Fraction;->addSub(Lorg/apache/commons/lang/math/Fraction;Z)Lorg/apache/commons/lang/math/Fraction;

    move-result-object v0

    return-object v0
.end method

.method public toProperString()Ljava/lang/String;
    .locals 5

    .line 917
    iget-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 918
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-nez v0, :cond_0

    .line 919
    const-string v0, "0"

    iput-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    goto/16 :goto_2

    .line 920
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    if-ne v0, v1, :cond_1

    .line 921
    const-string v0, "1"

    iput-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    goto/16 :goto_2

    .line 922
    :cond_1
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    mul-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_2

    .line 923
    const-string v0, "-1"

    iput-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    goto :goto_2

    .line 924
    :cond_2
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    if-lez v0, :cond_3

    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    neg-int v0, v0

    goto :goto_0

    :cond_3
    iget v0, p0, Lorg/apache/commons/lang/math/Fraction;->numerator:I

    :goto_0
    iget v1, p0, Lorg/apache/commons/lang/math/Fraction;->denominator:I

    neg-int v1, v1

    const/16 v2, 0x2f

    const/16 v3, 0x20

    if-ge v0, v1, :cond_5

    .line 929
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getProperNumerator()I

    move-result v0

    .line 930
    .local v0, "properNumerator":I
    if-nez v0, :cond_4

    .line 931
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getProperWhole()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    goto :goto_1

    .line 933
    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getProperWhole()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getDenominator()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    .end local v0    # "properNumerator":I
    :goto_1
    goto :goto_2

    .line 939
    :cond_5
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getNumerator()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getDenominator()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    .line 944
    :cond_6
    :goto_2
    iget-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toProperString:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 898
    iget-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toString:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 899
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getNumerator()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Fraction;->getDenominator()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toString:Ljava/lang/String;

    .line 904
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/math/Fraction;->toString:Ljava/lang/String;

    return-object v0
.end method
