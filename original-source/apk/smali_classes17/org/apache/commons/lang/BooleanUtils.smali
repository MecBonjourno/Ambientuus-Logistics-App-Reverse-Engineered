.class public Lorg/apache/commons/lang/BooleanUtils;
.super Ljava/lang/Object;
.source "BooleanUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public static isFalse(Ljava/lang/Boolean;)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 126
    if-nez p0, :cond_0

    .line 127
    const/4 v0, 0x0

    return v0

    .line 129
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isNotFalse(Ljava/lang/Boolean;)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 147
    invoke-static {p0}, Lorg/apache/commons/lang/BooleanUtils;->isFalse(Ljava/lang/Boolean;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isNotTrue(Ljava/lang/Boolean;)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 108
    invoke-static {p0}, Lorg/apache/commons/lang/BooleanUtils;->isTrue(Ljava/lang/Boolean;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isTrue(Ljava/lang/Boolean;)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 87
    if-nez p0, :cond_0

    .line 88
    const/4 v0, 0x0

    return v0

    .line 90
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static negate(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 64
    if-nez p0, :cond_0

    .line 65
    const/4 v0, 0x0

    return-object v0

    .line 67
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v0
.end method

.method public static toBoolean(I)Z
    .locals 1
    .param p0, "value"    # I

    .line 226
    if-nez p0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public static toBoolean(III)Z
    .locals 2
    .param p0, "value"    # I
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I

    .line 287
    if-ne p0, p1, :cond_0

    .line 288
    const/4 v0, 0x1

    return v0

    .line 289
    :cond_0
    if-ne p0, p2, :cond_1

    .line 290
    const/4 v0, 0x0

    return v0

    .line 293
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/Boolean;)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 183
    if-nez p0, :cond_0

    .line 184
    const/4 v0, 0x0

    return v0

    .line 186
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static toBoolean(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Z
    .locals 3
    .param p0, "value"    # Ljava/lang/Integer;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;

    .line 316
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p0, :cond_1

    .line 317
    if-nez p1, :cond_0

    .line 318
    return v1

    .line 319
    :cond_0
    if-nez p2, :cond_3

    .line 320
    return v0

    .line 322
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 323
    return v1

    .line 324
    :cond_2
    invoke-virtual {p0, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 325
    return v0

    .line 328
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/String;)Z
    .locals 12
    .param p0, "str"    # Ljava/lang/String;

    .line 656
    const-string v0, "true"

    const/4 v1, 0x1

    if-ne p0, v0, :cond_0

    .line 657
    return v1

    .line 659
    :cond_0
    const/4 v0, 0x0

    if-nez p0, :cond_1

    .line 660
    return v0

    .line 662
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x45

    const/16 v4, 0x65

    const/4 v5, 0x2

    packed-switch v2, :pswitch_data_0

    goto/16 :goto_5

    .line 685
    :pswitch_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 686
    .local v2, "ch":C
    const/16 v6, 0x74

    const/16 v7, 0x55

    const/16 v8, 0x75

    const/16 v9, 0x52

    const/16 v10, 0x72

    const/4 v11, 0x3

    if-ne v2, v6, :cond_6

    .line 687
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v10, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v9, :cond_4

    :cond_2
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v8, :cond_3

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_4

    :cond_3
    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v4, :cond_5

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v3, :cond_4

    goto :goto_0

    :cond_4
    move v1, v0

    :cond_5
    :goto_0
    return v1

    .line 692
    :cond_6
    const/16 v6, 0x54

    if-ne v2, v6, :cond_16

    .line 693
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v9, :cond_7

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v10, :cond_9

    :cond_7
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v7, :cond_8

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_9

    :cond_8
    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v3, :cond_a

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_9

    goto :goto_1

    :cond_9
    move v1, v0

    :cond_a
    :goto_1
    return v1

    .line 671
    .end local v2    # "ch":C
    :pswitch_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 672
    .restart local v2    # "ch":C
    const/16 v6, 0x79

    const/16 v7, 0x53

    const/16 v8, 0x73

    if-ne v2, v6, :cond_e

    .line 673
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v4, :cond_b

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v3, :cond_c

    :cond_b
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v8, :cond_d

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_c

    goto :goto_2

    :cond_c
    move v1, v0

    :cond_d
    :goto_2
    return v1

    .line 677
    :cond_e
    const/16 v6, 0x59

    if-ne v2, v6, :cond_12

    .line 678
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v3, :cond_f

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_10

    :cond_f
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v7, :cond_11

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_10

    goto :goto_3

    :cond_10
    move v1, v0

    :cond_11
    :goto_3
    return v1

    .line 682
    :cond_12
    return v0

    .line 664
    .end local v2    # "ch":C
    :pswitch_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 665
    .local v2, "ch0":C
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 666
    .local v3, "ch1":C
    const/16 v4, 0x6f

    if-eq v2, v4, :cond_13

    const/16 v4, 0x4f

    if-ne v2, v4, :cond_14

    :cond_13
    const/16 v4, 0x6e

    if-eq v3, v4, :cond_15

    const/16 v4, 0x4e

    if-ne v3, v4, :cond_14

    goto :goto_4

    :cond_14
    move v1, v0

    :cond_15
    :goto_4
    return v1

    .line 700
    .end local v2    # "ch0":C
    .end local v3    # "ch1":C
    :cond_16
    :goto_5
    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static toBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;

    .line 733
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p0, :cond_1

    .line 734
    if-nez p1, :cond_0

    .line 735
    return v1

    .line 736
    :cond_0
    if-nez p2, :cond_3

    .line 737
    return v0

    .line 739
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 740
    return v1

    .line 741
    :cond_2
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 742
    return v0

    .line 745
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The String did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanDefaultIfNull(Ljava/lang/Boolean;Z)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "valueIfNull"    # Z

    .line 203
    if-nez p0, :cond_0

    .line 204
    return p1

    .line 206
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static toBooleanObject(I)Ljava/lang/Boolean;
    .locals 1
    .param p0, "value"    # I

    .line 244
    if-nez p0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v0
.end method

.method public static toBooleanObject(IIII)Ljava/lang/Boolean;
    .locals 2
    .param p0, "value"    # I
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I
    .param p3, "nullValue"    # I

    .line 348
    if-ne p0, p1, :cond_0

    .line 349
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 350
    :cond_0
    if-ne p0, p2, :cond_1

    .line 351
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 352
    :cond_1
    if-ne p0, p3, :cond_2

    .line 353
    const/4 v0, 0x0

    return-object v0

    .line 356
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanObject(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "value"    # Ljava/lang/Integer;

    .line 264
    if-nez p0, :cond_0

    .line 265
    const/4 v0, 0x0

    return-object v0

    .line 267
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v0
.end method

.method public static toBooleanObject(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 2
    .param p0, "value"    # Ljava/lang/Integer;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;
    .param p3, "nullValue"    # Ljava/lang/Integer;

    .line 379
    const/4 v0, 0x0

    if-nez p0, :cond_2

    .line 380
    if-nez p1, :cond_0

    .line 381
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 382
    :cond_0
    if-nez p2, :cond_1

    .line 383
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 384
    :cond_1
    if-nez p3, :cond_5

    .line 385
    return-object v0

    .line 387
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 388
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 389
    :cond_3
    invoke-virtual {p0, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 390
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 391
    :cond_4
    invoke-virtual {p0, p3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 392
    return-object v0

    .line 395
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanObject(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 563
    const-string v0, "true"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 564
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 565
    :cond_0
    const-string v0, "false"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 566
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 567
    :cond_1
    const-string v0, "on"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 568
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 569
    :cond_2
    const-string v0, "off"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 570
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 571
    :cond_3
    const-string v0, "yes"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 572
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 573
    :cond_4
    const-string v0, "no"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 574
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 577
    :cond_5
    const/4 v0, 0x0

    return-object v0
.end method

.method public static toBooleanObject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;
    .param p3, "nullString"    # Ljava/lang/String;

    .line 603
    const/4 v0, 0x0

    if-nez p0, :cond_2

    .line 604
    if-nez p1, :cond_0

    .line 605
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 606
    :cond_0
    if-nez p2, :cond_1

    .line 607
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 608
    :cond_1
    if-nez p3, :cond_5

    .line 609
    return-object v0

    .line 611
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 612
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 613
    :cond_3
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 614
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 615
    :cond_4
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 616
    return-object v0

    .line 619
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The String did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanObject(Z)Ljava/lang/Boolean;
    .locals 1
    .param p0, "bool"    # Z

    .line 165
    if-eqz p0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v0
.end method

.method public static toInteger(Ljava/lang/Boolean;III)I
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I
    .param p3, "nullValue"    # I

    .line 486
    if-nez p0, :cond_0

    .line 487
    return p3

    .line 489
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, p1

    goto :goto_0

    :cond_1
    move v0, p2

    :goto_0
    return v0
.end method

.method public static toInteger(Z)I
    .locals 0
    .param p0, "bool"    # Z

    .line 413
    return p0
.end method

.method public static toInteger(ZII)I
    .locals 1
    .param p0, "bool"    # Z
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I

    .line 467
    if-eqz p0, :cond_0

    move v0, p1

    goto :goto_0

    :cond_0
    move v0, p2

    :goto_0
    return v0
.end method

.method public static toIntegerObject(Ljava/lang/Boolean;)Ljava/lang/Integer;
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 447
    if-nez p0, :cond_0

    .line 448
    const/4 v0, 0x0

    return-object v0

    .line 450
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    :goto_0
    return-object v0
.end method

.method public static toIntegerObject(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;
    .param p3, "nullValue"    # Ljava/lang/Integer;

    .line 530
    if-nez p0, :cond_0

    .line 531
    return-object p3

    .line 533
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v0, p1

    goto :goto_0

    :cond_1
    move-object v0, p2

    :goto_0
    return-object v0
.end method

.method public static toIntegerObject(Z)Ljava/lang/Integer;
    .locals 1
    .param p0, "bool"    # Z

    .line 429
    if-eqz p0, :cond_0

    sget-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    goto :goto_0

    :cond_0
    sget-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    :goto_0
    return-object v0
.end method

.method public static toIntegerObject(ZLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 1
    .param p0, "bool"    # Z
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;

    .line 508
    if-eqz p0, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    return-object v0
.end method

.method public static toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;
    .param p3, "nullString"    # Ljava/lang/String;

    .line 823
    if-nez p0, :cond_0

    .line 824
    return-object p3

    .line 826
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v0, p1

    goto :goto_0

    :cond_1
    move-object v0, p2

    :goto_0
    return-object v0
.end method

.method public static toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "bool"    # Z
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;

    .line 898
    if-eqz p0, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    return-object v0
.end method

.method public static toStringOnOff(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 783
    const-string v0, "off"

    const/4 v1, 0x0

    const-string v2, "on"

    invoke-static {p0, v2, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringOnOff(Z)Ljava/lang/String;
    .locals 2
    .param p0, "bool"    # Z

    .line 862
    const-string v0, "on"

    const-string v1, "off"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringTrueFalse(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 765
    const-string v0, "false"

    const/4 v1, 0x0

    const-string v2, "true"

    invoke-static {p0, v2, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringTrueFalse(Z)Ljava/lang/String;
    .locals 2
    .param p0, "bool"    # Z

    .line 845
    const-string v0, "true"

    const-string v1, "false"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringYesNo(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .param p0, "bool"    # Ljava/lang/Boolean;

    .line 801
    const-string v0, "no"

    const/4 v1, 0x0

    const-string v2, "yes"

    invoke-static {p0, v2, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringYesNo(Z)Ljava/lang/String;
    .locals 2
    .param p0, "bool"    # Z

    .line 879
    const-string v0, "yes"

    const-string v1, "no"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static xor([Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 4
    .param p0, "array"    # [Ljava/lang/Boolean;

    .line 959
    if-eqz p0, :cond_2

    .line 961
    array-length v0, p0

    if-eqz v0, :cond_1

    .line 964
    const/4 v0, 0x0

    .line 966
    .local v0, "primitive":[Z
    :try_start_0
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->toPrimitive([Ljava/lang/Boolean;)[Z

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 969
    .end local v0    # "primitive":[Z
    .local v1, "primitive":[Z
    nop

    .line 970
    invoke-static {v1}, Lorg/apache/commons/lang/BooleanUtils;->xor([Z)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v0

    .line 967
    .end local v1    # "primitive":[Z
    .restart local v0    # "primitive":[Z
    :catch_0
    move-exception v1

    .line 968
    .local v1, "ex":Ljava/lang/NullPointerException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The array must not contain any null elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 962
    .end local v0    # "primitive":[Z
    .end local v1    # "ex":Ljava/lang/NullPointerException;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 960
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static xor([Z)Z
    .locals 5
    .param p0, "array"    # [Z

    .line 919
    if-eqz p0, :cond_5

    .line 921
    array-length v0, p0

    if-eqz v0, :cond_4

    .line 926
    const/4 v0, 0x0

    .line 927
    .local v0, "trueCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ge v1, v2, :cond_2

    .line 930
    aget-boolean v2, p0, v1

    if-eqz v2, :cond_1

    .line 931
    if-ge v0, v4, :cond_0

    .line 932
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 934
    :cond_0
    return v3

    .line 927
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 940
    .end local v1    # "i":I
    :cond_2
    if-ne v0, v4, :cond_3

    move v3, v4

    :cond_3
    return v3

    .line 922
    .end local v0    # "trueCount":I
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 920
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
