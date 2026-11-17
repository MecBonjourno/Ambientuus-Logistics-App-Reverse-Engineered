.class public Lorg/apache/commons/lang/text/StrSubstitutor;
.super Ljava/lang/Object;
.source "StrSubstitutor.java"


# static fields
.field public static final DEFAULT_ESCAPE:C = '$'

.field public static final DEFAULT_PREFIX:Lorg/apache/commons/lang/text/StrMatcher;

.field public static final DEFAULT_SUFFIX:Lorg/apache/commons/lang/text/StrMatcher;


# instance fields
.field private escapeChar:C

.field private prefixMatcher:Lorg/apache/commons/lang/text/StrMatcher;

.field private suffixMatcher:Lorg/apache/commons/lang/text/StrMatcher;

.field private variableResolver:Lorg/apache/commons/lang/text/StrLookup;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 101
    const-string v0, "${"

    invoke-static {v0}, Lorg/apache/commons/lang/text/StrMatcher;->stringMatcher(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/text/StrSubstitutor;->DEFAULT_PREFIX:Lorg/apache/commons/lang/text/StrMatcher;

    .line 105
    const-string v0, "}"

    invoke-static {v0}, Lorg/apache/commons/lang/text/StrMatcher;->stringMatcher(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/text/StrSubstitutor;->DEFAULT_SUFFIX:Lorg/apache/commons/lang/text/StrMatcher;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 170
    const/4 v0, 0x0

    move-object v1, v0

    check-cast v1, Lorg/apache/commons/lang/text/StrLookup;

    sget-object v1, Lorg/apache/commons/lang/text/StrSubstitutor;->DEFAULT_PREFIX:Lorg/apache/commons/lang/text/StrMatcher;

    sget-object v2, Lorg/apache/commons/lang/text/StrSubstitutor;->DEFAULT_SUFFIX:Lorg/apache/commons/lang/text/StrMatcher;

    const/16 v3, 0x24

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/apache/commons/lang/text/StrSubstitutor;-><init>(Lorg/apache/commons/lang/text/StrLookup;Lorg/apache/commons/lang/text/StrMatcher;Lorg/apache/commons/lang/text/StrMatcher;C)V

    .line 171
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 4
    .param p1, "valueMap"    # Ljava/util/Map;

    .line 180
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrLookup;->mapLookup(Ljava/util/Map;)Lorg/apache/commons/lang/text/StrLookup;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/lang/text/StrSubstitutor;->DEFAULT_PREFIX:Lorg/apache/commons/lang/text/StrMatcher;

    sget-object v2, Lorg/apache/commons/lang/text/StrSubstitutor;->DEFAULT_SUFFIX:Lorg/apache/commons/lang/text/StrMatcher;

    const/16 v3, 0x24

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/apache/commons/lang/text/StrSubstitutor;-><init>(Lorg/apache/commons/lang/text/StrLookup;Lorg/apache/commons/lang/text/StrMatcher;Lorg/apache/commons/lang/text/StrMatcher;C)V

    .line 181
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "valueMap"    # Ljava/util/Map;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "suffix"    # Ljava/lang/String;

    .line 192
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrLookup;->mapLookup(Ljava/util/Map;)Lorg/apache/commons/lang/text/StrLookup;

    move-result-object v0

    const/16 v1, 0x24

    invoke-direct {p0, v0, p2, p3, v1}, Lorg/apache/commons/lang/text/StrSubstitutor;-><init>(Lorg/apache/commons/lang/text/StrLookup;Ljava/lang/String;Ljava/lang/String;C)V

    .line 193
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;C)V
    .locals 1
    .param p1, "valueMap"    # Ljava/util/Map;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "suffix"    # Ljava/lang/String;
    .param p4, "escape"    # C

    .line 205
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrLookup;->mapLookup(Ljava/util/Map;)Lorg/apache/commons/lang/text/StrLookup;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/apache/commons/lang/text/StrSubstitutor;-><init>(Lorg/apache/commons/lang/text/StrLookup;Ljava/lang/String;Ljava/lang/String;C)V

    .line 206
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/lang/text/StrLookup;)V
    .locals 3
    .param p1, "variableResolver"    # Lorg/apache/commons/lang/text/StrLookup;

    .line 214
    sget-object v0, Lorg/apache/commons/lang/text/StrSubstitutor;->DEFAULT_PREFIX:Lorg/apache/commons/lang/text/StrMatcher;

    sget-object v1, Lorg/apache/commons/lang/text/StrSubstitutor;->DEFAULT_SUFFIX:Lorg/apache/commons/lang/text/StrMatcher;

    const/16 v2, 0x24

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/apache/commons/lang/text/StrSubstitutor;-><init>(Lorg/apache/commons/lang/text/StrLookup;Lorg/apache/commons/lang/text/StrMatcher;Lorg/apache/commons/lang/text/StrMatcher;C)V

    .line 215
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/lang/text/StrLookup;Ljava/lang/String;Ljava/lang/String;C)V
    .locals 0
    .param p1, "variableResolver"    # Lorg/apache/commons/lang/text/StrLookup;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "suffix"    # Ljava/lang/String;
    .param p4, "escape"    # C

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariableResolver(Lorg/apache/commons/lang/text/StrLookup;)V

    .line 228
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariablePrefix(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrSubstitutor;

    .line 229
    invoke-virtual {p0, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariableSuffix(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrSubstitutor;

    .line 230
    invoke-virtual {p0, p4}, Lorg/apache/commons/lang/text/StrSubstitutor;->setEscapeChar(C)V

    .line 231
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/lang/text/StrLookup;Lorg/apache/commons/lang/text/StrMatcher;Lorg/apache/commons/lang/text/StrMatcher;C)V
    .locals 0
    .param p1, "variableResolver"    # Lorg/apache/commons/lang/text/StrLookup;
    .param p2, "prefixMatcher"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p3, "suffixMatcher"    # Lorg/apache/commons/lang/text/StrMatcher;
    .param p4, "escape"    # C

    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 244
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariableResolver(Lorg/apache/commons/lang/text/StrLookup;)V

    .line 245
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariablePrefixMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrSubstitutor;

    .line 246
    invoke-virtual {p0, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariableSuffixMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrSubstitutor;

    .line 247
    invoke-virtual {p0, p4}, Lorg/apache/commons/lang/text/StrSubstitutor;->setEscapeChar(C)V

    .line 248
    return-void
.end method

.method private checkCyclicSubstitution(Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .param p1, "varName"    # Ljava/lang/String;
    .param p2, "priorVariables"    # Ljava/util/List;

    .line 622
    invoke-interface {p2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 623
    return-void

    .line 625
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    .line 626
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const-string v1, "Infinite loop in property interpolation of "

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 627
    const/4 v1, 0x0

    invoke-interface {p2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 628
    const-string v1, ": "

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 629
    const-string v1, "->"

    invoke-virtual {v0, p2, v1}, Lorg/apache/commons/lang/text/StrBuilder;->appendWithSeparators(Ljava/util/Collection;Ljava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 630
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static replace(Ljava/lang/Object;Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .param p0, "source"    # Ljava/lang/Object;
    .param p1, "valueMap"    # Ljava/util/Map;

    .line 134
    new-instance v0, Lorg/apache/commons/lang/text/StrSubstitutor;

    invoke-direct {v0, p1}, Lorg/apache/commons/lang/text/StrSubstitutor;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/text/StrSubstitutor;->replace(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static replace(Ljava/lang/Object;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "source"    # Ljava/lang/Object;
    .param p1, "valueMap"    # Ljava/util/Map;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "suffix"    # Ljava/lang/String;

    .line 150
    new-instance v0, Lorg/apache/commons/lang/text/StrSubstitutor;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;-><init>(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/text/StrSubstitutor;->replace(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static replaceSystemProperties(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "source"    # Ljava/lang/Object;

    .line 161
    new-instance v0, Lorg/apache/commons/lang/text/StrSubstitutor;

    invoke-static {}, Lorg/apache/commons/lang/text/StrLookup;->systemPropertiesLookup()Lorg/apache/commons/lang/text/StrLookup;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/lang/text/StrSubstitutor;-><init>(Lorg/apache/commons/lang/text/StrLookup;)V

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/text/StrSubstitutor;->replace(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private substitute(Lorg/apache/commons/lang/text/StrBuilder;IILjava/util/List;)I
    .locals 23
    .param p1, "buf"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "priorVariables"    # Ljava/util/List;

    .line 537
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrSubstitutor;->getVariablePrefixMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v4

    .line 538
    .local v4, "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrSubstitutor;->getVariableSuffixMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v5

    .line 539
    .local v5, "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrSubstitutor;->getEscapeChar()C

    move-result v6

    .line 541
    .local v6, "escape":C
    if-nez p4, :cond_0

    const/4 v8, 0x1

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    .line 542
    .local v8, "top":Z
    :goto_0
    const/4 v9, 0x0

    .line 543
    .local v9, "altered":Z
    const/4 v10, 0x0

    .line 544
    .local v10, "lengthChange":I
    iget-object v11, v1, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 545
    .local v11, "chars":[C
    add-int v12, v2, v3

    .line 546
    .local v12, "bufEnd":I
    move/from16 v13, p2

    move v14, v13

    move v13, v12

    move-object v12, v11

    move v11, v10

    move v10, v9

    move-object/from16 v9, p4

    .line 547
    .end local p4    # "priorVariables":Ljava/util/List;
    .local v9, "priorVariables":Ljava/util/List;
    .local v10, "altered":Z
    .local v11, "lengthChange":I
    .local v12, "chars":[C
    .local v13, "bufEnd":I
    .local v14, "pos":I
    :goto_1
    if-ge v14, v13, :cond_8

    .line 548
    invoke-virtual {v4, v12, v14, v2, v13}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v15

    .line 549
    .local v15, "startMatchLen":I
    if-nez v15, :cond_1

    .line 550
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move/from16 v21, v6

    const/16 v17, 0x1

    goto/16 :goto_3

    .line 553
    :cond_1
    if-le v14, v2, :cond_2

    add-int/lit8 v16, v14, -0x1

    const/16 v17, 0x1

    aget-char v7, v12, v16

    if-ne v7, v6, :cond_3

    .line 555
    add-int/lit8 v7, v14, -0x1

    invoke-virtual {v1, v7}, Lorg/apache/commons/lang/text/StrBuilder;->deleteCharAt(I)Lorg/apache/commons/lang/text/StrBuilder;

    .line 556
    iget-object v7, v1, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 557
    .end local v12    # "chars":[C
    .local v7, "chars":[C
    add-int/lit8 v11, v11, -0x1

    .line 558
    const/4 v10, 0x1

    .line 559
    add-int/lit8 v13, v13, -0x1

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move/from16 v21, v6

    move-object v12, v7

    goto/16 :goto_3

    .line 553
    .end local v7    # "chars":[C
    .restart local v12    # "chars":[C
    :cond_2
    const/16 v17, 0x1

    .line 562
    :cond_3
    move v7, v14

    .line 563
    .local v7, "startPos":I
    add-int/2addr v14, v15

    .line 564
    const/16 v16, 0x0

    .line 565
    .local v16, "endMatchLen":I
    :goto_2
    if-ge v14, v13, :cond_7

    .line 566
    invoke-virtual {v5, v12, v14, v2, v13}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CIII)I

    move-result v16

    .line 567
    if-nez v16, :cond_4

    .line 568
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 571
    :cond_4
    move-object/from16 v18, v4

    .end local v4    # "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v18, "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    new-instance v4, Ljava/lang/String;

    move-object/from16 v19, v5

    .end local v5    # "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v19, "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    add-int v5, v7, v15

    sub-int v20, v14, v7

    move/from16 v21, v6

    .end local v6    # "escape":C
    .local v21, "escape":C
    sub-int v6, v20, v15

    invoke-direct {v4, v12, v5, v6}, Ljava/lang/String;-><init>([CII)V

    .line 573
    .local v4, "varName":Ljava/lang/String;
    add-int v14, v14, v16

    .line 574
    move v5, v14

    .line 577
    .local v5, "endPos":I
    if-nez v9, :cond_5

    .line 578
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object v9, v6

    .line 579
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v12, v2, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-interface {v9, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 583
    :cond_5
    invoke-direct {v0, v4, v9}, Lorg/apache/commons/lang/text/StrSubstitutor;->checkCyclicSubstitution(Ljava/lang/String;Ljava/util/List;)V

    .line 584
    invoke-interface {v9, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 587
    invoke-virtual {v0, v4, v1, v7, v5}, Lorg/apache/commons/lang/text/StrSubstitutor;->resolveVariable(Ljava/lang/String;Lorg/apache/commons/lang/text/StrBuilder;II)Ljava/lang/String;

    move-result-object v6

    .line 588
    .local v6, "varValue":Ljava/lang/String;
    if-eqz v6, :cond_6

    .line 590
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v2

    .line 591
    .local v2, "varLen":I
    invoke-virtual {v1, v7, v5, v6}, Lorg/apache/commons/lang/text/StrBuilder;->replace(IILjava/lang/String;)Lorg/apache/commons/lang/text/StrBuilder;

    .line 592
    const/4 v10, 0x1

    .line 593
    invoke-direct {v0, v1, v7, v2, v9}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;IILjava/util/List;)I

    move-result v20

    .line 594
    .local v20, "change":I
    sub-int v22, v5, v7

    sub-int v22, v2, v22

    add-int v20, v20, v22

    .line 595
    add-int v14, v14, v20

    .line 596
    add-int v13, v13, v20

    .line 597
    add-int v11, v11, v20

    .line 598
    iget-object v12, v1, Lorg/apache/commons/lang/text/StrBuilder;->buffer:[C

    .line 602
    .end local v2    # "varLen":I
    .end local v20    # "change":I
    :cond_6
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v9, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 603
    goto :goto_3

    .line 565
    .end local v18    # "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local v19    # "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local v21    # "escape":C
    .local v4, "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v5, "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .local v6, "escape":C
    :cond_7
    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move/from16 v21, v6

    .line 603
    .end local v4    # "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local v5    # "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local v6    # "escape":C
    .end local v7    # "startPos":I
    .end local v15    # "startMatchLen":I
    .end local v16    # "endMatchLen":I
    .restart local v18    # "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .restart local v19    # "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .restart local v21    # "escape":C
    :goto_3
    move/from16 v2, p2

    move-object/from16 v4, v18

    move-object/from16 v5, v19

    move/from16 v6, v21

    goto/16 :goto_1

    .line 609
    .end local v18    # "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local v19    # "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local v21    # "escape":C
    .restart local v4    # "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .restart local v5    # "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .restart local v6    # "escape":C
    :cond_8
    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move/from16 v21, v6

    .end local v4    # "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local v5    # "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .end local v6    # "escape":C
    .restart local v18    # "prefixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .restart local v19    # "suffixMatcher":Lorg/apache/commons/lang/text/StrMatcher;
    .restart local v21    # "escape":C
    if-eqz v8, :cond_9

    .line 610
    return v10

    .line 612
    :cond_9
    return v11
.end method


# virtual methods
.method public getEscapeChar()C
    .locals 1

    .line 666
    iget-char v0, p0, Lorg/apache/commons/lang/text/StrSubstitutor;->escapeChar:C

    return v0
.end method

.method public getVariablePrefixMatcher()Lorg/apache/commons/lang/text/StrMatcher;
    .locals 1

    .line 692
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrSubstitutor;->prefixMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    return-object v0
.end method

.method public getVariableResolver()Lorg/apache/commons/lang/text/StrLookup;
    .locals 1

    .line 818
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrSubstitutor;->variableResolver:Lorg/apache/commons/lang/text/StrLookup;

    return-object v0
.end method

.method public getVariableSuffixMatcher()Lorg/apache/commons/lang/text/StrMatcher;
    .locals 1

    .line 757
    iget-object v0, p0, Lorg/apache/commons/lang/text/StrSubstitutor;->suffixMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    return-object v0
.end method

.method public replace(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3
    .param p1, "source"    # Ljava/lang/Object;

    .line 422
    if-nez p1, :cond_0

    .line 423
    const/4 v0, 0x0

    return-object v0

    .line 425
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-direct {v0}, Lorg/apache/commons/lang/text/StrBuilder;-><init>()V

    invoke-virtual {v0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    .line 426
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    .line 427
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replace(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "source"    # Ljava/lang/String;

    .line 259
    if-nez p1, :cond_0

    .line 260
    const/4 v0, 0x0

    return-object v0

    .line 262
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-direct {v0, p1}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(Ljava/lang/String;)V

    .line 263
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    move-result v1

    if-nez v1, :cond_1

    .line 264
    return-object p1

    .line 266
    :cond_1
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replace(Ljava/lang/String;II)Ljava/lang/String;
    .locals 2
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 282
    if-nez p1, :cond_0

    .line 283
    const/4 v0, 0x0

    return-object v0

    .line 285
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-direct {v0, p3}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/String;II)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    .line 286
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    move-result v1

    if-nez v1, :cond_1

    .line 287
    add-int v1, p2, p3

    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 289
    :cond_1
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replace(Ljava/lang/StringBuffer;)Ljava/lang/String;
    .locals 3
    .param p1, "source"    # Ljava/lang/StringBuffer;

    .line 342
    if-nez p1, :cond_0

    .line 343
    const/4 v0, 0x0

    return-object v0

    .line 345
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    invoke-virtual {v0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    .line 346
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    .line 347
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replace(Ljava/lang/StringBuffer;II)Ljava/lang/String;
    .locals 2
    .param p1, "source"    # Ljava/lang/StringBuffer;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 364
    if-nez p1, :cond_0

    .line 365
    const/4 v0, 0x0

    return-object v0

    .line 367
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-direct {v0, p3}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    .line 368
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    .line 369
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replace(Lorg/apache/commons/lang/text/StrBuilder;)Ljava/lang/String;
    .locals 3
    .param p1, "source"    # Lorg/apache/commons/lang/text/StrBuilder;

    .line 382
    if-nez p1, :cond_0

    .line 383
    const/4 v0, 0x0

    return-object v0

    .line 385
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-virtual {p1}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    invoke-virtual {v0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append(Lorg/apache/commons/lang/text/StrBuilder;)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    .line 386
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    .line 387
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replace(Lorg/apache/commons/lang/text/StrBuilder;II)Ljava/lang/String;
    .locals 2
    .param p1, "source"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 404
    if-nez p1, :cond_0

    .line 405
    const/4 v0, 0x0

    return-object v0

    .line 407
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-direct {v0, p3}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append(Lorg/apache/commons/lang/text/StrBuilder;II)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    .line 408
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    .line 409
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replace([C)Ljava/lang/String;
    .locals 3
    .param p1, "source"    # [C

    .line 302
    if-nez p1, :cond_0

    .line 303
    const/4 v0, 0x0

    return-object v0

    .line 305
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    array-length v1, p1

    invoke-direct {v0, v1}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    invoke-virtual {v0, p1}, Lorg/apache/commons/lang/text/StrBuilder;->append([C)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    .line 306
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    .line 307
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replace([CII)Ljava/lang/String;
    .locals 2
    .param p1, "source"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 324
    if-nez p1, :cond_0

    .line 325
    const/4 v0, 0x0

    return-object v0

    .line 327
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-direct {v0, p3}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append([CII)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v0

    .line 328
    .local v0, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    .line 329
    invoke-virtual {v0}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public replaceIn(Ljava/lang/StringBuffer;)Z
    .locals 2
    .param p1, "source"    # Ljava/lang/StringBuffer;

    .line 440
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 441
    return v0

    .line 443
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/lang/text/StrSubstitutor;->replaceIn(Ljava/lang/StringBuffer;II)Z

    move-result v0

    return v0
.end method

.method public replaceIn(Ljava/lang/StringBuffer;II)Z
    .locals 3
    .param p1, "source"    # Ljava/lang/StringBuffer;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 460
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 461
    return v0

    .line 463
    :cond_0
    new-instance v1, Lorg/apache/commons/lang/text/StrBuilder;

    invoke-direct {v1, p3}, Lorg/apache/commons/lang/text/StrBuilder;-><init>(I)V

    invoke-virtual {v1, p1, p2, p3}, Lorg/apache/commons/lang/text/StrBuilder;->append(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang/text/StrBuilder;

    move-result-object v1

    .line 464
    .local v1, "buf":Lorg/apache/commons/lang/text/StrBuilder;
    invoke-virtual {p0, v1, v0, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    move-result v2

    if-nez v2, :cond_1

    .line 465
    return v0

    .line 467
    :cond_1
    add-int v0, p2, p3

    invoke-virtual {v1}, Lorg/apache/commons/lang/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, p2, v0, v2}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 468
    const/4 v0, 0x1

    return v0
.end method

.method public replaceIn(Lorg/apache/commons/lang/text/StrBuilder;)Z
    .locals 2
    .param p1, "source"    # Lorg/apache/commons/lang/text/StrBuilder;

    .line 480
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 481
    return v0

    .line 483
    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/lang/text/StrBuilder;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    move-result v0

    return v0
.end method

.method public replaceIn(Lorg/apache/commons/lang/text/StrBuilder;II)Z
    .locals 1
    .param p1, "source"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 499
    if-nez p1, :cond_0

    .line 500
    const/4 v0, 0x0

    return v0

    .line 502
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z

    move-result v0

    return v0
.end method

.method protected resolveVariable(Ljava/lang/String;Lorg/apache/commons/lang/text/StrBuilder;II)Ljava/lang/String;
    .locals 2
    .param p1, "variableName"    # Ljava/lang/String;
    .param p2, "buf"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p3, "startPos"    # I
    .param p4, "endPos"    # I

    .line 651
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/StrSubstitutor;->getVariableResolver()Lorg/apache/commons/lang/text/StrLookup;

    move-result-object v0

    .line 652
    .local v0, "resolver":Lorg/apache/commons/lang/text/StrLookup;
    if-nez v0, :cond_0

    .line 653
    const/4 v1, 0x0

    return-object v1

    .line 655
    :cond_0
    invoke-virtual {v0, p1}, Lorg/apache/commons/lang/text/StrLookup;->lookup(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public setEscapeChar(C)V
    .locals 0
    .param p1, "escapeCharacter"    # C

    .line 677
    iput-char p1, p0, Lorg/apache/commons/lang/text/StrSubstitutor;->escapeChar:C

    .line 678
    return-void
.end method

.method public setVariablePrefix(C)Lorg/apache/commons/lang/text/StrSubstitutor;
    .locals 1
    .param p1, "prefix"    # C

    .line 725
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrMatcher;->charMatcher(C)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariablePrefixMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrSubstitutor;

    move-result-object v0

    return-object v0
.end method

.method public setVariablePrefix(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrSubstitutor;
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .line 739
    if-eqz p1, :cond_0

    .line 742
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrMatcher;->stringMatcher(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariablePrefixMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrSubstitutor;

    move-result-object v0

    return-object v0

    .line 740
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Variable prefix must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setVariablePrefixMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrSubstitutor;
    .locals 2
    .param p1, "prefixMatcher"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 707
    if-eqz p1, :cond_0

    .line 710
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrSubstitutor;->prefixMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 711
    return-object p0

    .line 708
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Variable prefix matcher must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setVariableResolver(Lorg/apache/commons/lang/text/StrLookup;)V
    .locals 0
    .param p1, "variableResolver"    # Lorg/apache/commons/lang/text/StrLookup;

    .line 827
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrSubstitutor;->variableResolver:Lorg/apache/commons/lang/text/StrLookup;

    .line 828
    return-void
.end method

.method public setVariableSuffix(C)Lorg/apache/commons/lang/text/StrSubstitutor;
    .locals 1
    .param p1, "suffix"    # C

    .line 790
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrMatcher;->charMatcher(C)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariableSuffixMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrSubstitutor;

    move-result-object v0

    return-object v0
.end method

.method public setVariableSuffix(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrSubstitutor;
    .locals 2
    .param p1, "suffix"    # Ljava/lang/String;

    .line 804
    if-eqz p1, :cond_0

    .line 807
    invoke-static {p1}, Lorg/apache/commons/lang/text/StrMatcher;->stringMatcher(Ljava/lang/String;)Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/text/StrSubstitutor;->setVariableSuffixMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrSubstitutor;

    move-result-object v0

    return-object v0

    .line 805
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Variable suffix must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setVariableSuffixMatcher(Lorg/apache/commons/lang/text/StrMatcher;)Lorg/apache/commons/lang/text/StrSubstitutor;
    .locals 2
    .param p1, "suffixMatcher"    # Lorg/apache/commons/lang/text/StrMatcher;

    .line 772
    if-eqz p1, :cond_0

    .line 775
    iput-object p1, p0, Lorg/apache/commons/lang/text/StrSubstitutor;->suffixMatcher:Lorg/apache/commons/lang/text/StrMatcher;

    .line 776
    return-object p0

    .line 773
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Variable suffix matcher must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected substitute(Lorg/apache/commons/lang/text/StrBuilder;II)Z
    .locals 1
    .param p1, "buf"    # Lorg/apache/commons/lang/text/StrBuilder;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 521
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/lang/text/StrSubstitutor;->substitute(Lorg/apache/commons/lang/text/StrBuilder;IILjava/util/List;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
