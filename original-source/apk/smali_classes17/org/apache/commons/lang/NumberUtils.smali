.class public final Lorg/apache/commons/lang/NumberUtils;
.super Ljava/lang/Object;
.source "NumberUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static compare(DD)I
    .locals 7
    .param p0, "lhs"    # D
    .param p2, "rhs"    # D

    .line 491
    cmpg-double v0, p0, p2

    const/4 v1, -0x1

    if-gez v0, :cond_0

    .line 492
    return v1

    .line 494
    :cond_0
    cmpl-double v0, p0, p2

    const/4 v2, 0x1

    if-lez v0, :cond_1

    .line 495
    return v2

    .line 501
    :cond_1
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    .line 502
    .local v3, "lhsBits":J
    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    .line 503
    .local v5, "rhsBits":J
    cmp-long v0, v3, v5

    if-nez v0, :cond_2

    .line 504
    const/4 v0, 0x0

    return v0

    .line 512
    :cond_2
    cmp-long v0, v3, v5

    if-gez v0, :cond_3

    .line 513
    return v1

    .line 515
    :cond_3
    return v2
.end method

.method public static compare(FF)I
    .locals 4
    .param p0, "lhs"    # F
    .param p1, "rhs"    # F

    .line 552
    cmpg-float v0, p0, p1

    const/4 v1, -0x1

    if-gez v0, :cond_0

    .line 553
    return v1

    .line 555
    :cond_0
    cmpl-float v0, p0, p1

    const/4 v2, 0x1

    if-lez v0, :cond_1

    .line 556
    return v2

    .line 562
    :cond_1
    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    .line 563
    .local v0, "lhsBits":I
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    .line 564
    .local v3, "rhsBits":I
    if-ne v0, v3, :cond_2

    .line 565
    const/4 v1, 0x0

    return v1

    .line 573
    :cond_2
    if-ge v0, v3, :cond_3

    .line 574
    return v1

    .line 576
    :cond_3
    return v2
.end method

.method public static createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    .locals 1
    .param p0, "val"    # Ljava/lang/String;

    .line 376
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 377
    .local v0, "bd":Ljava/math/BigDecimal;
    return-object v0
.end method

.method public static createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;
    .locals 1
    .param p0, "val"    # Ljava/lang/String;

    .line 364
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, p0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 365
    .local v0, "bi":Ljava/math/BigInteger;
    return-object v0
.end method

.method public static createDouble(Ljava/lang/String;)Ljava/lang/Double;
    .locals 1
    .param p0, "val"    # Ljava/lang/String;

    .line 329
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public static createFloat(Ljava/lang/String;)Ljava/lang/Float;
    .locals 1
    .param p0, "val"    # Ljava/lang/String;

    .line 318
    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public static createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .param p0, "val"    # Ljava/lang/String;

    .line 342
    invoke-static {p0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static createLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .param p0, "val"    # Ljava/lang/String;

    .line 353
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public static createNumber(Ljava/lang/String;)Ljava/lang/Number;
    .locals 18
    .param p0, "val"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 139
    move-object/from16 v1, p0

    const/4 v0, 0x0

    if-nez v1, :cond_0

    .line 140
    return-object v0

    .line 142
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_19

    .line 145
    const-string v2, "--"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 150
    return-object v0

    .line 152
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

    .line 155
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 159
    .local v3, "lastChar":C
    const/16 v0, 0x2e

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 160
    .local v4, "decPos":I
    const/16 v0, 0x65

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v5, 0x45

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    add-int/2addr v0, v5

    add-int/lit8 v5, v0, 0x1

    .line 162
    .local v5, "expPos":I
    const-string v6, " is not a valid number."

    const/4 v0, -0x1

    const/4 v7, 0x0

    if-le v4, v0, :cond_5

    .line 164
    if-le v5, v0, :cond_4

    .line 165
    if-lt v5, v4, :cond_3

    .line 168
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v1, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .local v8, "dec":Ljava/lang/String;
    goto :goto_0

    .line 166
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

    .line 170
    :cond_4
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 172
    .restart local v8    # "dec":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .local v9, "mant":Ljava/lang/String;
    goto :goto_2

    .line 174
    .end local v8    # "dec":Ljava/lang/String;
    .end local v9    # "mant":Ljava/lang/String;
    :cond_5
    if-le v5, v0, :cond_6

    .line 175
    invoke-virtual {v1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    move-object v9, v8

    .local v8, "mant":Ljava/lang/String;
    goto :goto_1

    .line 177
    .end local v8    # "mant":Ljava/lang/String;
    :cond_6
    move-object/from16 v8, p0

    move-object v9, v8

    .line 179
    .restart local v9    # "mant":Ljava/lang/String;
    :goto_1
    const/4 v8, 0x0

    .line 181
    .local v8, "dec":Ljava/lang/String;
    :goto_2
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v10

    const/4 v11, 0x0

    if-nez v10, :cond_10

    .line 182
    if-le v5, v0, :cond_7

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v2

    if-ge v5, v0, :cond_7

    .line 183
    add-int/lit8 v0, v5, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    sub-int/2addr v10, v2

    invoke-virtual {v1, v0, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v10, v0

    .local v0, "exp":Ljava/lang/String;
    goto :goto_3

    .line 185
    .end local v0    # "exp":Ljava/lang/String;
    :cond_7
    const/4 v0, 0x0

    move-object v10, v0

    .line 188
    .local v10, "exp":Ljava/lang/String;
    :goto_3
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-virtual {v1, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 189
    .local v14, "numeric":Ljava/lang/String;
    invoke-static {v9}, Lorg/apache/commons/lang/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {v10}, Lorg/apache/commons/lang/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    move v0, v2

    goto :goto_4

    :cond_8
    move v0, v7

    :goto_4
    move v15, v0

    .line 190
    .local v15, "allZeros":Z
    sparse-switch v3, :sswitch_data_0

    goto/16 :goto_7

    .line 193
    :sswitch_0
    if-nez v8, :cond_b

    if-nez v10, :cond_b

    invoke-virtual {v14, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v7, 0x2d

    if-ne v0, v7, :cond_9

    invoke-virtual {v14, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    :cond_9
    invoke-static {v14}, Lorg/apache/commons/lang/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 197
    :cond_a
    :try_start_0
    invoke-static {v14}, Lorg/apache/commons/lang/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 198
    :catch_0
    move-exception v0

    .line 201
    invoke-static {v14}, Lorg/apache/commons/lang/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0

    .line 204
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

    .line 208
    :sswitch_1
    :try_start_1
    invoke-static {v14}, Lorg/apache/commons/lang/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    .line 209
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

    .line 212
    :cond_c
    return-object v0

    .line 217
    .end local v0    # "f":Ljava/lang/Float;
    :cond_d
    goto :goto_5

    .line 215
    :catch_1
    move-exception v0

    .line 222
    :goto_5
    :sswitch_2
    :try_start_2
    invoke-static {v14}, Lorg/apache/commons/lang/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    .line 223
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

    .line 224
    :cond_e
    return-object v0

    .line 228
    .end local v0    # "d":Ljava/lang/Double;
    :cond_f
    goto :goto_6

    .line 226
    :catch_2
    move-exception v0

    .line 230
    :goto_6
    :try_start_3
    invoke-static {v14}, Lorg/apache/commons/lang/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    return-object v0

    .line 231
    :catch_3
    move-exception v0

    .line 236
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

    .line 242
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

    .line 243
    add-int/lit8 v0, v5, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v1, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v6, v0

    .local v0, "exp":Ljava/lang/String;
    goto :goto_8

    .line 245
    .end local v0    # "exp":Ljava/lang/String;
    :cond_11
    const/4 v0, 0x0

    move-object v6, v0

    .line 247
    .local v6, "exp":Ljava/lang/String;
    :goto_8
    if-nez v8, :cond_12

    if-nez v6, :cond_12

    .line 250
    :try_start_4
    invoke-static {v1}, Lorg/apache/commons/lang/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_4

    return-object v0

    .line 251
    :catch_4
    move-exception v0

    .line 255
    :try_start_5
    invoke-static {v1}, Lorg/apache/commons/lang/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_5

    return-object v0

    .line 256
    :catch_5
    move-exception v0

    .line 259
    invoke-static {v1}, Lorg/apache/commons/lang/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0

    .line 263
    :cond_12
    invoke-static {v9}, Lorg/apache/commons/lang/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-static {v6}, Lorg/apache/commons/lang/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_9

    :cond_13
    move v2, v7

    .line 265
    .local v2, "allZeros":Z
    :goto_9
    :try_start_6
    invoke-static {v1}, Lorg/apache/commons/lang/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    .line 266
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

    .line 267
    :cond_14
    return-object v0

    .line 271
    .end local v0    # "f":Ljava/lang/Float;
    :cond_15
    goto :goto_a

    .line 269
    :catch_6
    move-exception v0

    .line 273
    :goto_a
    :try_start_7
    invoke-static {v1}, Lorg/apache/commons/lang/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    .line 274
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

    .line 275
    :cond_16
    return-object v0

    .line 279
    .end local v0    # "d":Ljava/lang/Double;
    :cond_17
    goto :goto_b

    .line 277
    :catch_7
    move-exception v0

    .line 281
    :goto_b
    invoke-static {v1}, Lorg/apache/commons/lang/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0

    .line 153
    .end local v2    # "allZeros":Z
    .end local v3    # "lastChar":C
    .end local v4    # "decPos":I
    .end local v5    # "expPos":I
    .end local v6    # "exp":Ljava/lang/String;
    .end local v8    # "dec":Ljava/lang/String;
    .end local v9    # "mant":Ljava/lang/String;
    :cond_18
    :goto_c
    invoke-static {v1}, Lorg/apache/commons/lang/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 143
    :cond_19
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v2, "\"\" is not a valid number."

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
    .param p0, "s"    # Ljava/lang/String;

    .line 297
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 298
    return v0

    .line 300
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x0

    if-ltz v1, :cond_2

    .line 301
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-eq v3, v4, :cond_1

    .line 302
    return v2

    .line 300
    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 305
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

    .line 593
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 596
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 597
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-nez v2, :cond_1

    .line 598
    return v0

    .line 596
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 601
    .end local v1    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0

    .line 594
    :cond_3
    :goto_1
    return v0
.end method

.method public static isNumber(Ljava/lang/String;)Z
    .locals 18
    .param p0, "str"    # Ljava/lang/String;

    .line 618
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 619
    return v1

    .line 621
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 622
    .local v0, "chars":[C
    array-length v2, v0

    .line 623
    .local v2, "sz":I
    const/4 v3, 0x0

    .line 624
    .local v3, "hasExp":Z
    const/4 v4, 0x0

    .line 625
    .local v4, "hasDecPoint":Z
    const/4 v5, 0x0

    .line 626
    .local v5, "allowSigns":Z
    const/4 v6, 0x0

    .line 628
    .local v6, "foundDigit":Z
    aget-char v7, v0, v1

    const/16 v8, 0x2d

    const/4 v9, 0x1

    if-ne v7, v8, :cond_1

    move v7, v9

    goto :goto_0

    :cond_1
    move v7, v1

    .line 629
    .local v7, "start":I
    :goto_0
    add-int/lit8 v10, v7, 0x1

    const/16 v11, 0x46

    const/16 v12, 0x66

    const/16 v13, 0x39

    const/16 v14, 0x30

    if-le v2, v10, :cond_8

    .line 630
    aget-char v10, v0, v7

    if-ne v10, v14, :cond_8

    add-int/lit8 v10, v7, 0x1

    aget-char v10, v0, v10

    const/16 v15, 0x78

    if-ne v10, v15, :cond_8

    .line 631
    add-int/lit8 v8, v7, 0x2

    .line 632
    .local v8, "i":I
    if-ne v8, v2, :cond_2

    .line 633
    return v1

    .line 636
    :cond_2
    :goto_1
    array-length v10, v0

    if-ge v8, v10, :cond_7

    .line 637
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

    .line 636
    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 640
    :cond_6
    :goto_2
    return v1

    .line 643
    :cond_7
    return v9

    .line 646
    .end local v8    # "i":I
    :cond_8
    add-int/lit8 v2, v2, -0x1

    .line 648
    move v10, v7

    .line 651
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

    .line 684
    :cond_9
    array-length v8, v0

    if-ge v10, v8, :cond_12

    .line 685
    aget-char v8, v0, v10

    if-lt v8, v14, :cond_a

    aget-char v8, v0, v10

    if-gt v8, v13, :cond_a

    .line 687
    return v17

    .line 689
    :cond_a
    aget-char v8, v0, v10

    if-eq v8, v1, :cond_11

    aget-char v1, v0, v10

    if-ne v1, v15, :cond_b

    goto :goto_6

    .line 693
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

    .line 698
    :cond_c
    return v6

    .line 700
    :cond_d
    aget-char v1, v0, v10

    const/16 v8, 0x6c

    if-eq v1, v8, :cond_f

    aget-char v1, v0, v10

    const/16 v8, 0x4c

    if-ne v1, v8, :cond_e

    goto :goto_4

    .line 706
    :cond_e
    return v16

    .line 703
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

    .line 691
    :cond_11
    :goto_6
    return v16

    .line 710
    :cond_12
    if-nez v5, :cond_13

    if-eqz v6, :cond_13

    move/from16 v1, v17

    goto :goto_7

    :cond_13
    move/from16 v1, v16

    :goto_7
    return v1

    .line 651
    :cond_14
    move/from16 v17, v9

    .line 652
    :goto_8
    aget-char v9, v0, v10

    if-lt v9, v14, :cond_15

    aget-char v9, v0, v10

    if-gt v9, v13, :cond_15

    .line 653
    const/4 v1, 0x1

    .line 654
    .end local v6    # "foundDigit":Z
    .local v1, "foundDigit":Z
    const/4 v5, 0x0

    move v6, v1

    goto :goto_c

    .line 656
    .end local v1    # "foundDigit":Z
    .restart local v6    # "foundDigit":Z
    :cond_15
    aget-char v9, v0, v10

    const/16 v11, 0x2e

    if-ne v9, v11, :cond_18

    .line 657
    if-nez v4, :cond_17

    if-eqz v3, :cond_16

    goto :goto_9

    .line 661
    :cond_16
    const/4 v1, 0x1

    move v4, v1

    .end local v4    # "hasDecPoint":Z
    .local v1, "hasDecPoint":Z
    goto :goto_c

    .line 659
    .end local v1    # "hasDecPoint":Z
    .restart local v4    # "hasDecPoint":Z
    :cond_17
    :goto_9
    return v16

    .line 662
    :cond_18
    aget-char v9, v0, v10

    if-eq v9, v1, :cond_1d

    aget-char v1, v0, v10

    if-ne v1, v15, :cond_19

    goto :goto_b

    .line 673
    :cond_19
    aget-char v1, v0, v10

    const/16 v9, 0x2b

    if-eq v1, v9, :cond_1b

    aget-char v1, v0, v10

    if-ne v1, v8, :cond_1a

    goto :goto_a

    .line 680
    :cond_1a
    return v16

    .line 674
    :cond_1b
    :goto_a
    if-nez v5, :cond_1c

    .line 675
    return v16

    .line 677
    :cond_1c
    const/4 v1, 0x0

    .line 678
    .end local v5    # "allowSigns":Z
    .local v1, "allowSigns":Z
    const/4 v5, 0x0

    move v6, v5

    move v5, v1

    .end local v6    # "foundDigit":Z
    .local v5, "foundDigit":Z
    goto :goto_c

    .line 664
    .end local v1    # "allowSigns":Z
    .local v5, "allowSigns":Z
    .restart local v6    # "foundDigit":Z
    :cond_1d
    :goto_b
    if-eqz v3, :cond_1e

    .line 666
    return v16

    .line 668
    :cond_1e
    if-nez v6, :cond_1f

    .line 669
    return v16

    .line 671
    :cond_1f
    const/4 v1, 0x1

    .line 672
    .end local v3    # "hasExp":Z
    .local v1, "hasExp":Z
    const/4 v3, 0x1

    move v5, v3

    move v3, v1

    .line 682
    .end local v1    # "hasExp":Z
    .restart local v3    # "hasExp":Z
    :goto_c
    add-int/lit8 v10, v10, 0x1

    move/from16 v1, v16

    move/from16 v9, v17

    const/16 v11, 0x46

    goto/16 :goto_3
.end method

.method public static maximum(III)I
    .locals 0
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .line 445
    if-le p1, p0, :cond_0

    .line 446
    move p0, p1

    .line 448
    :cond_0
    if-le p2, p0, :cond_1

    .line 449
    move p0, p2

    .line 451
    :cond_1
    return p0
.end method

.method public static maximum(JJJ)J
    .locals 1
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .line 427
    cmp-long v0, p2, p0

    if-lez v0, :cond_0

    .line 428
    move-wide p0, p2

    .line 430
    :cond_0
    cmp-long v0, p4, p0

    if-lez v0, :cond_1

    .line 431
    move-wide p0, p4

    .line 433
    :cond_1
    return-wide p0
.end method

.method public static minimum(III)I
    .locals 0
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .line 409
    if-ge p1, p0, :cond_0

    .line 410
    move p0, p1

    .line 412
    :cond_0
    if-ge p2, p0, :cond_1

    .line 413
    move p0, p2

    .line 415
    :cond_1
    return p0
.end method

.method public static minimum(JJJ)J
    .locals 1
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .line 391
    cmp-long v0, p2, p0

    if-gez v0, :cond_0

    .line 392
    move-wide p0, p2

    .line 394
    :cond_0
    cmp-long v0, p4, p0

    if-gez v0, :cond_1

    .line 395
    move-wide p0, p4

    .line 397
    :cond_1
    return-wide p0
.end method

.method public static stringToInt(Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 61
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/NumberUtils;->stringToInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static stringToInt(Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .line 74
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    return p1
.end method
