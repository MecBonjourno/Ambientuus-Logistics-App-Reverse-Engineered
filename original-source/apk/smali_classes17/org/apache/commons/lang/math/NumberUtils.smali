.class public Lorg/apache/commons/lang/math/NumberUtils;
.super Ljava/lang/Object;
.source "NumberUtils.java"


# static fields
.field public static final BYTE_MINUS_ONE:Ljava/lang/Byte;

.field public static final BYTE_ONE:Ljava/lang/Byte;

.field public static final BYTE_ZERO:Ljava/lang/Byte;

.field public static final DOUBLE_MINUS_ONE:Ljava/lang/Double;

.field public static final DOUBLE_ONE:Ljava/lang/Double;

.field public static final DOUBLE_ZERO:Ljava/lang/Double;

.field public static final FLOAT_MINUS_ONE:Ljava/lang/Float;

.field public static final FLOAT_ONE:Ljava/lang/Float;

.field public static final FLOAT_ZERO:Ljava/lang/Float;

.field public static final INTEGER_MINUS_ONE:Ljava/lang/Integer;

.field public static final INTEGER_ONE:Ljava/lang/Integer;

.field public static final INTEGER_ZERO:Ljava/lang/Integer;

.field public static final LONG_MINUS_ONE:Ljava/lang/Long;

.field public static final LONG_ONE:Ljava/lang/Long;

.field public static final LONG_ZERO:Ljava/lang/Long;

.field public static final SHORT_MINUS_ONE:Ljava/lang/Short;

.field public static final SHORT_ONE:Ljava/lang/Short;

.field public static final SHORT_ZERO:Ljava/lang/Short;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 41
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->LONG_ZERO:Ljava/lang/Long;

    .line 43
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, 0x1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->LONG_ONE:Ljava/lang/Long;

    .line 45
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, -0x1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->LONG_MINUS_ONE:Ljava/lang/Long;

    .line 47
    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    .line 49
    new-instance v0, Ljava/lang/Integer;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    .line 51
    new-instance v0, Ljava/lang/Integer;

    const/4 v3, -0x1

    invoke-direct {v0, v3}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_MINUS_ONE:Ljava/lang/Integer;

    .line 53
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, v1}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->SHORT_ZERO:Ljava/lang/Short;

    .line 55
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, v2}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->SHORT_ONE:Ljava/lang/Short;

    .line 57
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, v3}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->SHORT_MINUS_ONE:Ljava/lang/Short;

    .line 59
    new-instance v0, Ljava/lang/Byte;

    invoke-direct {v0, v1}, Ljava/lang/Byte;-><init>(B)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->BYTE_ZERO:Ljava/lang/Byte;

    .line 61
    new-instance v0, Ljava/lang/Byte;

    invoke-direct {v0, v2}, Ljava/lang/Byte;-><init>(B)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->BYTE_ONE:Ljava/lang/Byte;

    .line 63
    new-instance v0, Ljava/lang/Byte;

    invoke-direct {v0, v3}, Ljava/lang/Byte;-><init>(B)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->BYTE_MINUS_ONE:Ljava/lang/Byte;

    .line 65
    new-instance v0, Ljava/lang/Double;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->DOUBLE_ZERO:Ljava/lang/Double;

    .line 67
    new-instance v0, Ljava/lang/Double;

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->DOUBLE_ONE:Ljava/lang/Double;

    .line 69
    new-instance v0, Ljava/lang/Double;

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->DOUBLE_MINUS_ONE:Ljava/lang/Double;

    .line 71
    new-instance v0, Ljava/lang/Float;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->FLOAT_ZERO:Ljava/lang/Float;

    .line 73
    new-instance v0, Ljava/lang/Float;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->FLOAT_ONE:Ljava/lang/Float;

    .line 75
    new-instance v0, Ljava/lang/Float;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    sput-object v0, Lorg/apache/commons/lang/math/NumberUtils;->FLOAT_MINUS_ONE:Ljava/lang/Float;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    return-void
.end method

.method public static compare(DD)I
    .locals 7
    .param p0, "lhs"    # D
    .param p2, "rhs"    # D

    .line 1261
    cmpg-double v0, p0, p2

    const/4 v1, -0x1

    if-gez v0, :cond_0

    .line 1262
    return v1

    .line 1264
    :cond_0
    cmpl-double v0, p0, p2

    const/4 v2, 0x1

    if-lez v0, :cond_1

    .line 1265
    return v2

    .line 1271
    :cond_1
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    .line 1272
    .local v3, "lhsBits":J
    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    .line 1273
    .local v5, "rhsBits":J
    cmp-long v0, v3, v5

    if-nez v0, :cond_2

    .line 1274
    const/4 v0, 0x0

    return v0

    .line 1282
    :cond_2
    cmp-long v0, v3, v5

    if-gez v0, :cond_3

    .line 1283
    return v1

    .line 1285
    :cond_3
    return v2
.end method

.method public static compare(FF)I
    .locals 4
    .param p0, "lhs"    # F
    .param p1, "rhs"    # F

    .line 1322
    cmpg-float v0, p0, p1

    const/4 v1, -0x1

    if-gez v0, :cond_0

    .line 1323
    return v1

    .line 1325
    :cond_0
    cmpl-float v0, p0, p1

    const/4 v2, 0x1

    if-lez v0, :cond_1

    .line 1326
    return v2

    .line 1332
    :cond_1
    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    .line 1333
    .local v0, "lhsBits":I
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    .line 1334
    .local v3, "rhsBits":I
    if-ne v0, v3, :cond_2

    .line 1335
    const/4 v1, 0x0

    return v1

    .line 1343
    :cond_2
    if-ge v0, v3, :cond_3

    .line 1344
    return v1

    .line 1346
    :cond_3
    return v2
.end method

.method public static createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .line 659
    if-nez p0, :cond_0

    .line 660
    const/4 v0, 0x0

    return-object v0

    .line 663
    :cond_0
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 666
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 664
    :cond_1
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "A blank string is not a valid number"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 643
    if-nez p0, :cond_0

    .line 644
    const/4 v0, 0x0

    return-object v0

    .line 646
    :cond_0
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, p0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static createDouble(Ljava/lang/String;)Ljava/lang/Double;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 593
    if-nez p0, :cond_0

    .line 594
    const/4 v0, 0x0

    return-object v0

    .line 596
    :cond_0
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public static createFloat(Ljava/lang/String;)Ljava/lang/Float;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 577
    if-nez p0, :cond_0

    .line 578
    const/4 v0, 0x0

    return-object v0

    .line 580
    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public static createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 610
    if-nez p0, :cond_0

    .line 611
    const/4 v0, 0x0

    return-object v0

    .line 614
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static createLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 627
    if-nez p0, :cond_0

    .line 628
    const/4 v0, 0x0

    return-object v0

    .line 630
    :cond_0
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public static createNumber(Ljava/lang/String;)Ljava/lang/Number;
    .locals 18
    .param p0, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 398
    move-object/from16 v1, p0

    const/4 v0, 0x0

    if-nez v1, :cond_0

    .line 399
    return-object v0

    .line 401
    :cond_0
    invoke-static {v1}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_19

    .line 404
    const-string v2, "--"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 409
    return-object v0

    .line 411
    :cond_1
    const-string v0, "0x"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "-0x"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_c

    .line 414
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 418
    .local v3, "lastChar":C
    const/16 v0, 0x2e

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 419
    .local v4, "decPos":I
    const/16 v0, 0x65

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v5, 0x45

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    add-int/2addr v0, v5

    add-int/lit8 v5, v0, 0x1

    .line 421
    .local v5, "expPos":I
    const-string v6, " is not a valid number."

    const/4 v0, -0x1

    const/4 v7, 0x0

    if-le v4, v0, :cond_5

    .line 423
    if-le v5, v0, :cond_4

    .line 424
    if-lt v5, v4, :cond_3

    .line 427
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v1, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .local v8, "dec":Ljava/lang/String;
    goto :goto_0

    .line 425
    .end local v8    # "dec":Ljava/lang/String;
    :cond_3
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 429
    :cond_4
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 431
    .restart local v8    # "dec":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .local v9, "mant":Ljava/lang/String;
    goto :goto_2

    .line 433
    .end local v8    # "dec":Ljava/lang/String;
    .end local v9    # "mant":Ljava/lang/String;
    :cond_5
    if-le v5, v0, :cond_6

    .line 434
    invoke-virtual {v1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    move-object v9, v8

    .local v8, "mant":Ljava/lang/String;
    goto :goto_1

    .line 436
    .end local v8    # "mant":Ljava/lang/String;
    :cond_6
    move-object/from16 v8, p0

    move-object v9, v8

    .line 438
    .restart local v9    # "mant":Ljava/lang/String;
    :goto_1
    const/4 v8, 0x0

    .line 440
    .local v8, "dec":Ljava/lang/String;
    :goto_2
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v10

    const/4 v11, 0x0

    if-nez v10, :cond_10

    .line 441
    if-le v5, v0, :cond_7

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v2

    if-ge v5, v0, :cond_7

    .line 442
    add-int/lit8 v0, v5, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    sub-int/2addr v10, v2

    invoke-virtual {v1, v0, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v10, v0

    .local v0, "exp":Ljava/lang/String;
    goto :goto_3

    .line 444
    .end local v0    # "exp":Ljava/lang/String;
    :cond_7
    const/4 v0, 0x0

    move-object v10, v0

    .line 447
    .local v10, "exp":Ljava/lang/String;
    :goto_3
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-virtual {v1, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 448
    .local v14, "numeric":Ljava/lang/String;
    invoke-static {v9}, Lorg/apache/commons/lang/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {v10}, Lorg/apache/commons/lang/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    move v0, v2

    goto :goto_4

    :cond_8
    move v0, v7

    :goto_4
    move v15, v0

    .line 449
    .local v15, "allZeros":Z
    sparse-switch v3, :sswitch_data_0

    goto/16 :goto_7

    .line 452
    :sswitch_0
    if-nez v8, :cond_b

    if-nez v10, :cond_b

    invoke-virtual {v14, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v7, 0x2d

    if-ne v0, v7, :cond_9

    invoke-virtual {v14, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    :cond_9
    invoke-static {v14}, Lorg/apache/commons/lang/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 456
    :cond_a
    :try_start_0
    invoke-static {v14}, Lorg/apache/commons/lang/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 457
    :catch_0
    move-exception v0

    .line 460
    invoke-static {v14}, Lorg/apache/commons/lang/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0

    .line 463
    :cond_b
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 467
    :sswitch_1
    :try_start_1
    invoke-static {v14}, Lorg/apache/commons/lang/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    .line 468
    .local v0, "f":Ljava/lang/Float;
    invoke-virtual {v0}, Ljava/lang/Float;->isInfinite()Z

    move-result v2

    if-nez v2, :cond_d

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    cmpl-float v2, v2, v11

    if-nez v2, :cond_c

    if-eqz v15, :cond_d

    .line 471
    :cond_c
    return-object v0

    .line 476
    .end local v0    # "f":Ljava/lang/Float;
    :cond_d
    goto :goto_5

    .line 474
    :catch_1
    move-exception v0

    .line 481
    :goto_5
    :sswitch_2
    :try_start_2
    invoke-static {v14}, Lorg/apache/commons/lang/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    .line 482
    .local v0, "d":Ljava/lang/Double;
    invoke-virtual {v0}, Ljava/lang/Double;->isInfinite()Z

    move-result v2

    if-nez v2, :cond_f

    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    move-result v2
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    const-wide/16 v16, 0x0

    float-to-double v12, v2

    cmpl-double v2, v12, v16

    if-nez v2, :cond_e

    if-eqz v15, :cond_f

    .line 483
    :cond_e
    return-object v0

    .line 487
    .end local v0    # "d":Ljava/lang/Double;
    :cond_f
    goto :goto_6

    .line 485
    :catch_2
    move-exception v0

    .line 489
    :goto_6
    :try_start_3
    invoke-static {v14}, Lorg/apache/commons/lang/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    return-object v0

    .line 490
    :catch_3
    move-exception v0

    .line 495
    :goto_7
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 501
    .end local v10    # "exp":Ljava/lang/String;
    .end local v14    # "numeric":Ljava/lang/String;
    .end local v15    # "allZeros":Z
    :cond_10
    const-wide/16 v16, 0x0

    if-le v5, v0, :cond_11

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v2

    if-ge v5, v0, :cond_11

    .line 502
    add-int/lit8 v0, v5, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v1, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v6, v0

    .local v0, "exp":Ljava/lang/String;
    goto :goto_8

    .line 504
    .end local v0    # "exp":Ljava/lang/String;
    :cond_11
    const/4 v0, 0x0

    move-object v6, v0

    .line 506
    .local v6, "exp":Ljava/lang/String;
    :goto_8
    if-nez v8, :cond_12

    if-nez v6, :cond_12

    .line 509
    :try_start_4
    invoke-static {v1}, Lorg/apache/commons/lang/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_4

    return-object v0

    .line 510
    :catch_4
    move-exception v0

    .line 514
    :try_start_5
    invoke-static {v1}, Lorg/apache/commons/lang/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_5

    return-object v0

    .line 515
    :catch_5
    move-exception v0

    .line 518
    invoke-static {v1}, Lorg/apache/commons/lang/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0

    .line 522
    :cond_12
    invoke-static {v9}, Lorg/apache/commons/lang/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-static {v6}, Lorg/apache/commons/lang/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_9

    :cond_13
    move v2, v7

    .line 524
    .local v2, "allZeros":Z
    :goto_9
    :try_start_6
    invoke-static {v1}, Lorg/apache/commons/lang/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    .line 525
    .local v0, "f":Ljava/lang/Float;
    invoke-virtual {v0}, Ljava/lang/Float;->isInfinite()Z

    move-result v7

    if-nez v7, :cond_15

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v7
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_6

    cmpl-float v7, v7, v11

    if-nez v7, :cond_14

    if-eqz v2, :cond_15

    .line 526
    :cond_14
    return-object v0

    .line 530
    .end local v0    # "f":Ljava/lang/Float;
    :cond_15
    goto :goto_a

    .line 528
    :catch_6
    move-exception v0

    .line 532
    :goto_a
    :try_start_7
    invoke-static {v1}, Lorg/apache/commons/lang/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    .line 533
    .local v0, "d":Ljava/lang/Double;
    invoke-virtual {v0}, Ljava/lang/Double;->isInfinite()Z

    move-result v7

    if-nez v7, :cond_17

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_7

    cmpl-double v7, v10, v16

    if-nez v7, :cond_16

    if-eqz v2, :cond_17

    .line 534
    :cond_16
    return-object v0

    .line 538
    .end local v0    # "d":Ljava/lang/Double;
    :cond_17
    goto :goto_b

    .line 536
    :catch_7
    move-exception v0

    .line 540
    :goto_b
    invoke-static {v1}, Lorg/apache/commons/lang/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0

    .line 412
    .end local v2    # "allZeros":Z
    .end local v3    # "lastChar":C
    .end local v4    # "decPos":I
    .end local v5    # "expPos":I
    .end local v6    # "exp":Ljava/lang/String;
    .end local v8    # "dec":Ljava/lang/String;
    .end local v9    # "mant":Ljava/lang/String;
    :cond_18
    :goto_c
    invoke-static {v1}, Lorg/apache/commons/lang/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 402
    :cond_19
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v2, "A blank string is not a valid number"

    invoke-direct {v0, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_data_0
    .sparse-switch
        0x44 -> :sswitch_2
        0x46 -> :sswitch_1
        0x4c -> :sswitch_0
        0x64 -> :sswitch_2
        0x66 -> :sswitch_1
        0x6c -> :sswitch_0
    .end sparse-switch
.end method

.method private static isAllZeros(Ljava/lang/String;)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;

    .line 555
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 556
    return v0

    .line 558
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x0

    if-ltz v1, :cond_2

    .line 559
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-eq v3, v4, :cond_1

    .line 560
    return v2

    .line 558
    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 563
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    goto :goto_1

    :cond_3
    move v0, v2

    :goto_1
    return v0
.end method

.method public static isDigits(Ljava/lang/String;)Z
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .line 1362
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1363
    return v1

    .line 1365
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 1366
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1367
    return v1

    .line 1365
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1370
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public static isNumber(Ljava/lang/String;)Z
    .locals 18
    .param p0, "str"    # Ljava/lang/String;

    .line 1387
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1388
    return v1

    .line 1390
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 1391
    .local v0, "chars":[C
    array-length v2, v0

    .line 1392
    .local v2, "sz":I
    const/4 v3, 0x0

    .line 1393
    .local v3, "hasExp":Z
    const/4 v4, 0x0

    .line 1394
    .local v4, "hasDecPoint":Z
    const/4 v5, 0x0

    .line 1395
    .local v5, "allowSigns":Z
    const/4 v6, 0x0

    .line 1397
    .local v6, "foundDigit":Z
    aget-char v7, v0, v1

    const/16 v8, 0x2d

    const/4 v9, 0x1

    if-ne v7, v8, :cond_1

    move v7, v9

    goto :goto_0

    :cond_1
    move v7, v1

    .line 1398
    .local v7, "start":I
    :goto_0
    add-int/lit8 v10, v7, 0x1

    const/16 v11, 0x46

    const/16 v12, 0x66

    const/16 v13, 0x39

    const/16 v14, 0x30

    if-le v2, v10, :cond_8

    .line 1399
    aget-char v10, v0, v7

    if-ne v10, v14, :cond_8

    add-int/lit8 v10, v7, 0x1

    aget-char v10, v0, v10

    const/16 v15, 0x78

    if-ne v10, v15, :cond_8

    .line 1400
    add-int/lit8 v8, v7, 0x2

    .line 1401
    .local v8, "i":I
    if-ne v8, v2, :cond_2

    .line 1402
    return v1

    .line 1405
    :cond_2
    :goto_1
    array-length v10, v0

    if-ge v8, v10, :cond_7

    .line 1406
    aget-char v10, v0, v8

    if-lt v10, v14, :cond_3

    aget-char v10, v0, v8

    if-le v10, v13, :cond_5

    :cond_3
    aget-char v10, v0, v8

    const/16 v15, 0x61

    if-lt v10, v15, :cond_4

    aget-char v10, v0, v8

    if-le v10, v12, :cond_5

    :cond_4
    aget-char v10, v0, v8

    const/16 v15, 0x41

    if-lt v10, v15, :cond_6

    aget-char v10, v0, v8

    if-le v10, v11, :cond_5

    goto :goto_2

    .line 1405
    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1409
    :cond_6
    :goto_2
    return v1

    .line 1412
    :cond_7
    return v9

    .line 1415
    .end local v8    # "i":I
    :cond_8
    add-int/lit8 v2, v2, -0x1

    .line 1417
    move v10, v7

    .line 1420
    .local v10, "i":I
    :goto_3
    const/16 v15, 0x45

    move/from16 v16, v1

    const/16 v1, 0x65

    if-lt v10, v2, :cond_14

    move/from16 v17, v9

    add-int/lit8 v9, v2, 0x1

    if-ge v10, v9, :cond_9

    if-eqz v5, :cond_9

    if-nez v6, :cond_9

    goto :goto_8

    .line 1453
    :cond_9
    array-length v8, v0

    if-ge v10, v8, :cond_12

    .line 1454
    aget-char v8, v0, v10

    if-lt v8, v14, :cond_a

    aget-char v8, v0, v10

    if-gt v8, v13, :cond_a

    .line 1456
    return v17

    .line 1458
    :cond_a
    aget-char v8, v0, v10

    if-eq v8, v1, :cond_11

    aget-char v1, v0, v10

    if-ne v1, v15, :cond_b

    goto :goto_6

    .line 1462
    :cond_b
    if-nez v5, :cond_d

    aget-char v1, v0, v10

    const/16 v8, 0x64

    if-eq v1, v8, :cond_c

    aget-char v1, v0, v10

    const/16 v8, 0x44

    if-eq v1, v8, :cond_c

    aget-char v1, v0, v10

    if-eq v1, v12, :cond_c

    aget-char v1, v0, v10

    if-ne v1, v11, :cond_d

    .line 1467
    :cond_c
    return v6

    .line 1469
    :cond_d
    aget-char v1, v0, v10

    const/16 v8, 0x6c

    if-eq v1, v8, :cond_f

    aget-char v1, v0, v10

    const/16 v8, 0x4c

    if-ne v1, v8, :cond_e

    goto :goto_4

    .line 1475
    :cond_e
    return v16

    .line 1472
    :cond_f
    :goto_4
    if-eqz v6, :cond_10

    if-nez v3, :cond_10

    move/from16 v1, v17

    goto :goto_5

    :cond_10
    move/from16 v1, v16

    :goto_5
    return v1

    .line 1460
    :cond_11
    :goto_6
    return v16

    .line 1479
    :cond_12
    if-nez v5, :cond_13

    if-eqz v6, :cond_13

    move/from16 v1, v17

    goto :goto_7

    :cond_13
    move/from16 v1, v16

    :goto_7
    return v1

    .line 1420
    :cond_14
    move/from16 v17, v9

    .line 1421
    :goto_8
    aget-char v9, v0, v10

    if-lt v9, v14, :cond_15

    aget-char v9, v0, v10

    if-gt v9, v13, :cond_15

    .line 1422
    const/4 v1, 0x1

    .line 1423
    .end local v6    # "foundDigit":Z
    .local v1, "foundDigit":Z
    const/4 v5, 0x0

    move v6, v1

    goto :goto_c

    .line 1425
    .end local v1    # "foundDigit":Z
    .restart local v6    # "foundDigit":Z
    :cond_15
    aget-char v9, v0, v10

    const/16 v11, 0x2e

    if-ne v9, v11, :cond_18

    .line 1426
    if-nez v4, :cond_17

    if-eqz v3, :cond_16

    goto :goto_9

    .line 1430
    :cond_16
    const/4 v1, 0x1

    move v4, v1

    .end local v4    # "hasDecPoint":Z
    .local v1, "hasDecPoint":Z
    goto :goto_c

    .line 1428
    .end local v1    # "hasDecPoint":Z
    .restart local v4    # "hasDecPoint":Z
    :cond_17
    :goto_9
    return v16

    .line 1431
    :cond_18
    aget-char v9, v0, v10

    if-eq v9, v1, :cond_1d

    aget-char v1, v0, v10

    if-ne v1, v15, :cond_19

    goto :goto_b

    .line 1442
    :cond_19
    aget-char v1, v0, v10

    const/16 v9, 0x2b

    if-eq v1, v9, :cond_1b

    aget-char v1, v0, v10

    if-ne v1, v8, :cond_1a

    goto :goto_a

    .line 1449
    :cond_1a
    return v16

    .line 1443
    :cond_1b
    :goto_a
    if-nez v5, :cond_1c

    .line 1444
    return v16

    .line 1446
    :cond_1c
    const/4 v1, 0x0

    .line 1447
    .end local v5    # "allowSigns":Z
    .local v1, "allowSigns":Z
    const/4 v5, 0x0

    move v6, v5

    move v5, v1

    .end local v6    # "foundDigit":Z
    .local v5, "foundDigit":Z
    goto :goto_c

    .line 1433
    .end local v1    # "allowSigns":Z
    .local v5, "allowSigns":Z
    .restart local v6    # "foundDigit":Z
    :cond_1d
    :goto_b
    if-eqz v3, :cond_1e

    .line 1435
    return v16

    .line 1437
    :cond_1e
    if-nez v6, :cond_1f

    .line 1438
    return v16

    .line 1440
    :cond_1f
    const/4 v1, 0x1

    .line 1441
    .end local v3    # "hasExp":Z
    .local v1, "hasExp":Z
    const/4 v3, 0x1

    move v5, v3

    move v3, v1

    .line 1451
    .end local v1    # "hasExp":Z
    .restart local v3    # "hasExp":Z
    :goto_c
    add-int/lit8 v10, v10, 0x1

    move/from16 v1, v16

    move/from16 v9, v17

    const/16 v11, 0x46

    goto/16 :goto_3
.end method

.method public static max(BBB)B
    .locals 0
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .line 1184
    if-le p1, p0, :cond_0

    .line 1185
    move p0, p1

    .line 1187
    :cond_0
    if-le p2, p0, :cond_1

    .line 1188
    move p0, p2

    .line 1190
    :cond_1
    return p0
.end method

.method public static max([B)B
    .locals 3
    .param p0, "array"    # [B

    .line 934
    if-eqz p0, :cond_3

    .line 936
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 941
    const/4 v0, 0x0

    aget-byte v0, p0, v0

    .line 942
    .local v0, "max":B
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 943
    aget-byte v2, p0, v1

    if-le v2, v0, :cond_0

    .line 944
    aget-byte v0, p0, v1

    .line 942
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 948
    .end local v1    # "i":I
    :cond_1
    return v0

    .line 937
    .end local v0    # "max":B
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 935
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static max(DDD)D
    .locals 2
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .line 1206
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static max([D)D
    .locals 5
    .param p0, "array"    # [D

    .line 962
    if-eqz p0, :cond_4

    .line 964
    array-length v0, p0

    if-eqz v0, :cond_3

    .line 969
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    .line 970
    .local v0, "max":D
    const/4 v2, 0x1

    .local v2, "j":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 971
    aget-wide v3, p0, v2

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 972
    const-wide/high16 v3, 0x7ff8000000000000L    # Double.NaN

    return-wide v3

    .line 974
    :cond_0
    aget-wide v3, p0, v2

    cmpl-double v3, v3, v0

    if-lez v3, :cond_1

    .line 975
    aget-wide v0, p0, v2

    .line 970
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 979
    .end local v2    # "j":I
    :cond_2
    return-wide v0

    .line 965
    .end local v0    # "max":D
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 963
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static max(FFF)F
    .locals 1
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F

    .line 1222
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public static max([F)F
    .locals 3
    .param p0, "array"    # [F

    .line 993
    if-eqz p0, :cond_4

    .line 995
    array-length v0, p0

    if-eqz v0, :cond_3

    .line 1000
    const/4 v0, 0x0

    aget v0, p0, v0

    .line 1001
    .local v0, "max":F
    const/4 v1, 0x1

    .local v1, "j":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 1002
    aget v2, p0, v1

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1003
    const/high16 v2, 0x7fc00000    # Float.NaN

    return v2

    .line 1005
    :cond_0
    aget v2, p0, v1

    cmpl-float v2, v2, v0

    if-lez v2, :cond_1

    .line 1006
    aget v0, p0, v1

    .line 1001
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1010
    .end local v1    # "j":I
    :cond_2
    return v0

    .line 996
    .end local v0    # "max":F
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 994
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static max(III)I
    .locals 0
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .line 1148
    if-le p1, p0, :cond_0

    .line 1149
    move p0, p1

    .line 1151
    :cond_0
    if-le p2, p0, :cond_1

    .line 1152
    move p0, p2

    .line 1154
    :cond_1
    return p0
.end method

.method public static max([I)I
    .locals 3
    .param p0, "array"    # [I

    .line 880
    if-eqz p0, :cond_3

    .line 882
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 887
    const/4 v0, 0x0

    aget v0, p0, v0

    .line 888
    .local v0, "max":I
    const/4 v1, 0x1

    .local v1, "j":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 889
    aget v2, p0, v1

    if-le v2, v0, :cond_0

    .line 890
    aget v0, p0, v1

    .line 888
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 894
    .end local v1    # "j":I
    :cond_1
    return v0

    .line 883
    .end local v0    # "max":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 881
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static max(JJJ)J
    .locals 1
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .line 1130
    cmp-long v0, p2, p0

    if-lez v0, :cond_0

    .line 1131
    move-wide p0, p2

    .line 1133
    :cond_0
    cmp-long v0, p4, p0

    if-lez v0, :cond_1

    .line 1134
    move-wide p0, p4

    .line 1136
    :cond_1
    return-wide p0
.end method

.method public static max([J)J
    .locals 5
    .param p0, "array"    # [J

    .line 853
    if-eqz p0, :cond_3

    .line 855
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 860
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    .line 861
    .local v0, "max":J
    const/4 v2, 0x1

    .local v2, "j":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_1

    .line 862
    aget-wide v3, p0, v2

    cmp-long v3, v3, v0

    if-lez v3, :cond_0

    .line 863
    aget-wide v0, p0, v2

    .line 861
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 867
    .end local v2    # "j":I
    :cond_1
    return-wide v0

    .line 856
    .end local v0    # "max":J
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 854
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static max(SSS)S
    .locals 0
    .param p0, "a"    # S
    .param p1, "b"    # S
    .param p2, "c"    # S

    .line 1166
    if-le p1, p0, :cond_0

    .line 1167
    move p0, p1

    .line 1169
    :cond_0
    if-le p2, p0, :cond_1

    .line 1170
    move p0, p2

    .line 1172
    :cond_1
    return p0
.end method

.method public static max([S)S
    .locals 3
    .param p0, "array"    # [S

    .line 907
    if-eqz p0, :cond_3

    .line 909
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 914
    const/4 v0, 0x0

    aget-short v0, p0, v0

    .line 915
    .local v0, "max":S
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 916
    aget-short v2, p0, v1

    if-le v2, v0, :cond_0

    .line 917
    aget-short v0, p0, v1

    .line 915
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 921
    .end local v1    # "i":I
    :cond_1
    return v0

    .line 910
    .end local v0    # "max":S
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 908
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static min(BBB)B
    .locals 0
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .line 1078
    if-ge p1, p0, :cond_0

    .line 1079
    move p0, p1

    .line 1081
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1082
    move p0, p2

    .line 1084
    :cond_1
    return p0
.end method

.method public static min([B)B
    .locals 3
    .param p0, "array"    # [B

    .line 762
    if-eqz p0, :cond_3

    .line 764
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 769
    const/4 v0, 0x0

    aget-byte v0, p0, v0

    .line 770
    .local v0, "min":B
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 771
    aget-byte v2, p0, v1

    if-ge v2, v0, :cond_0

    .line 772
    aget-byte v0, p0, v1

    .line 770
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 776
    .end local v1    # "i":I
    :cond_1
    return v0

    .line 765
    .end local v0    # "min":B
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 763
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static min(DDD)D
    .locals 2
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .line 1100
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static min([D)D
    .locals 5
    .param p0, "array"    # [D

    .line 790
    if-eqz p0, :cond_4

    .line 792
    array-length v0, p0

    if-eqz v0, :cond_3

    .line 797
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    .line 798
    .local v0, "min":D
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 799
    aget-wide v3, p0, v2

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 800
    const-wide/high16 v3, 0x7ff8000000000000L    # Double.NaN

    return-wide v3

    .line 802
    :cond_0
    aget-wide v3, p0, v2

    cmpg-double v3, v3, v0

    if-gez v3, :cond_1

    .line 803
    aget-wide v0, p0, v2

    .line 798
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 807
    .end local v2    # "i":I
    :cond_2
    return-wide v0

    .line 793
    .end local v0    # "min":D
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 791
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static min(FFF)F
    .locals 1
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F

    .line 1116
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public static min([F)F
    .locals 3
    .param p0, "array"    # [F

    .line 821
    if-eqz p0, :cond_4

    .line 823
    array-length v0, p0

    if-eqz v0, :cond_3

    .line 828
    const/4 v0, 0x0

    aget v0, p0, v0

    .line 829
    .local v0, "min":F
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 830
    aget v2, p0, v1

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 831
    const/high16 v2, 0x7fc00000    # Float.NaN

    return v2

    .line 833
    :cond_0
    aget v2, p0, v1

    cmpg-float v2, v2, v0

    if-gez v2, :cond_1

    .line 834
    aget v0, p0, v1

    .line 829
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 838
    .end local v1    # "i":I
    :cond_2
    return v0

    .line 824
    .end local v0    # "min":F
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 822
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static min(III)I
    .locals 0
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .line 1042
    if-ge p1, p0, :cond_0

    .line 1043
    move p0, p1

    .line 1045
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1046
    move p0, p2

    .line 1048
    :cond_1
    return p0
.end method

.method public static min([I)I
    .locals 3
    .param p0, "array"    # [I

    .line 708
    if-eqz p0, :cond_3

    .line 710
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 715
    const/4 v0, 0x0

    aget v0, p0, v0

    .line 716
    .local v0, "min":I
    const/4 v1, 0x1

    .local v1, "j":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 717
    aget v2, p0, v1

    if-ge v2, v0, :cond_0

    .line 718
    aget v0, p0, v1

    .line 716
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 722
    .end local v1    # "j":I
    :cond_1
    return v0

    .line 711
    .end local v0    # "min":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 709
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static min(JJJ)J
    .locals 1
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .line 1024
    cmp-long v0, p2, p0

    if-gez v0, :cond_0

    .line 1025
    move-wide p0, p2

    .line 1027
    :cond_0
    cmp-long v0, p4, p0

    if-gez v0, :cond_1

    .line 1028
    move-wide p0, p4

    .line 1030
    :cond_1
    return-wide p0
.end method

.method public static min([J)J
    .locals 5
    .param p0, "array"    # [J

    .line 681
    if-eqz p0, :cond_3

    .line 683
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 688
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    .line 689
    .local v0, "min":J
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_1

    .line 690
    aget-wide v3, p0, v2

    cmp-long v3, v3, v0

    if-gez v3, :cond_0

    .line 691
    aget-wide v0, p0, v2

    .line 689
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 695
    .end local v2    # "i":I
    :cond_1
    return-wide v0

    .line 684
    .end local v0    # "min":J
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 682
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static min(SSS)S
    .locals 0
    .param p0, "a"    # S
    .param p1, "b"    # S
    .param p2, "c"    # S

    .line 1060
    if-ge p1, p0, :cond_0

    .line 1061
    move p0, p1

    .line 1063
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1064
    move p0, p2

    .line 1066
    :cond_1
    return p0
.end method

.method public static min([S)S
    .locals 3
    .param p0, "array"    # [S

    .line 735
    if-eqz p0, :cond_3

    .line 737
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 742
    const/4 v0, 0x0

    aget-short v0, p0, v0

    .line 743
    .local v0, "min":S
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 744
    aget-short v2, p0, v1

    if-ge v2, v0, :cond_0

    .line 745
    aget-short v0, p0, v1

    .line 743
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 749
    .end local v1    # "i":I
    :cond_1
    return v0

    .line 738
    .end local v0    # "min":S
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 736
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static stringToInt(Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 108
    invoke-static {p0}, Lorg/apache/commons/lang/math/NumberUtils;->toInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static stringToInt(Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .line 151
    invoke-static {p0, p1}, Lorg/apache/commons/lang/math/NumberUtils;->toInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static toDouble(Ljava/lang/String;)D
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .line 302
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/math/NumberUtils;->toDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static toDouble(Ljava/lang/String;D)D
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # D

    .line 325
    if-nez p0, :cond_0

    .line 326
    return-wide p1

    .line 329
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 330
    :catch_0
    move-exception v0

    .line 331
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    return-wide p1
.end method

.method public static toFloat(Ljava/lang/String;)F
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 250
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/math/NumberUtils;->toFloat(Ljava/lang/String;F)F

    move-result v0

    return v0
.end method

.method public static toFloat(Ljava/lang/String;F)F
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # F

    .line 273
    if-nez p0, :cond_0

    .line 274
    return p1

    .line 277
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 278
    :catch_0
    move-exception v0

    .line 279
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    return p1
.end method

.method public static toInt(Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 129
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/math/NumberUtils;->toInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static toInt(Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .line 172
    if-nez p0, :cond_0

    .line 173
    return p1

    .line 176
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 177
    :catch_0
    move-exception v0

    .line 178
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    return p1
.end method

.method public static toLong(Ljava/lang/String;)J
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .line 200
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/math/NumberUtils;->toLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static toLong(Ljava/lang/String;J)J
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # J

    .line 221
    if-nez p0, :cond_0

    .line 222
    return-wide p1

    .line 225
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 226
    :catch_0
    move-exception v0

    .line 227
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    return-wide p1
.end method
