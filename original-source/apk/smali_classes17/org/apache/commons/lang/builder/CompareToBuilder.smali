.class public Lorg/apache/commons/lang/builder/CompareToBuilder;
.super Ljava/lang/Object;
.source "CompareToBuilder.java"


# instance fields
.field private comparison:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 112
    return-void
.end method

.method private static reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/CompareToBuilder;Z[Ljava/lang/String;)V
    .locals 7
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "builder"    # Lorg/apache/commons/lang/builder/CompareToBuilder;
    .param p4, "useTransients"    # Z
    .param p5, "excludeFields"    # [Ljava/lang/String;

    .line 357
    invoke-virtual {p2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 358
    .local v0, "fields":[Ljava/lang/reflect/Field;
    if-eqz p5, :cond_0

    invoke-static {p5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_0

    :cond_0
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 359
    .local v1, "excludedFieldList":Ljava/util/List;
    :goto_0
    const/4 v2, 0x1

    invoke-static {v0, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    .line 360
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_3

    iget v3, p3, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v3, :cond_3

    .line 361
    aget-object v3, v0, v2

    .line 362
    .local v3, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x24

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_2

    if-nez p4, :cond_1

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v4

    if-nez v4, :cond_2

    :cond_1
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_2

    .line 367
    :try_start_0
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p3, v4, v5}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang/builder/CompareToBuilder;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 372
    goto :goto_2

    .line 368
    :catch_0
    move-exception v4

    .line 371
    .local v4, "e":Ljava/lang/IllegalAccessException;
    new-instance v5, Ljava/lang/InternalError;

    const-string v6, "Unexpected IllegalAccessException"

    invoke-direct {v5, v6}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v5

    .line 360
    .end local v3    # "f":Ljava/lang/reflect/Field;
    .end local v4    # "e":Ljava/lang/IllegalAccessException;
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 375
    .end local v2    # "i":I
    :cond_3
    return-void
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;

    .line 142
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Collection;)I
    .locals 1
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "excludeFields"    # Ljava/util/Collection;

    .line 207
    invoke-static {p2}, Lorg/apache/commons/lang/builder/ReflectionToStringBuilder;->toNoNullStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;Z)I
    .locals 1
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "compareTransients"    # Z

    .line 174
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, v0}, Lorg/apache/commons/lang/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;)I
    .locals 2
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "compareTransients"    # Z
    .param p3, "reflectUpToClass"    # Ljava/lang/Class;

    .line 277
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, p3, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I
    .locals 11
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "compareTransients"    # Z
    .param p3, "reflectUpToClass"    # Ljava/lang/Class;
    .param p4, "excludeFields"    # [Ljava/lang/String;

    .line 319
    if-ne p0, p1, :cond_0

    .line 320
    const/4 v0, 0x0

    return v0

    .line 322
    :cond_0
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    .line 325
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 326
    .local v3, "lhsClazz":Ljava/lang/Class;
    invoke-virtual {v3, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 329
    new-instance v4, Lorg/apache/commons/lang/builder/CompareToBuilder;

    invoke-direct {v4}, Lorg/apache/commons/lang/builder/CompareToBuilder;-><init>()V

    .line 330
    .local v4, "compareToBuilder":Lorg/apache/commons/lang/builder/CompareToBuilder;
    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move-object v6, p4

    .end local p0    # "lhs":Ljava/lang/Object;
    .end local p1    # "rhs":Ljava/lang/Object;
    .end local p2    # "compareTransients":Z
    .end local p4    # "excludeFields":[Ljava/lang/String;
    .local v1, "lhs":Ljava/lang/Object;
    .local v2, "rhs":Ljava/lang/Object;
    .local v5, "compareTransients":Z
    .local v6, "excludeFields":[Ljava/lang/String;
    invoke-static/range {v1 .. v6}, Lorg/apache/commons/lang/builder/CompareToBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/CompareToBuilder;Z[Ljava/lang/String;)V

    .line 331
    :goto_0
    invoke-virtual {v3}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    if-eqz p0, :cond_1

    if-eq v3, p3, :cond_1

    .line 332
    invoke-virtual {v3}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v7

    .line 333
    .end local v3    # "lhsClazz":Ljava/lang/Class;
    .local v7, "lhsClazz":Ljava/lang/Class;
    move-object v8, v4

    move v9, v5

    move-object v10, v6

    move-object v5, v1

    move-object v6, v2

    .end local v1    # "lhs":Ljava/lang/Object;
    .end local v2    # "rhs":Ljava/lang/Object;
    .end local v4    # "compareToBuilder":Lorg/apache/commons/lang/builder/CompareToBuilder;
    .local v5, "lhs":Ljava/lang/Object;
    .local v6, "rhs":Ljava/lang/Object;
    .local v8, "compareToBuilder":Lorg/apache/commons/lang/builder/CompareToBuilder;
    .local v9, "compareTransients":Z
    .local v10, "excludeFields":[Ljava/lang/String;
    invoke-static/range {v5 .. v10}, Lorg/apache/commons/lang/builder/CompareToBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/CompareToBuilder;Z[Ljava/lang/String;)V

    move-object v3, v7

    move v5, v9

    move-object v6, v10

    .end local v8    # "compareToBuilder":Lorg/apache/commons/lang/builder/CompareToBuilder;
    .end local v9    # "compareTransients":Z
    .end local v10    # "excludeFields":[Ljava/lang/String;
    .restart local v1    # "lhs":Ljava/lang/Object;
    .restart local v2    # "rhs":Ljava/lang/Object;
    .restart local v4    # "compareToBuilder":Lorg/apache/commons/lang/builder/CompareToBuilder;
    .local v5, "compareTransients":Z
    .local v6, "excludeFields":[Ljava/lang/String;
    goto :goto_0

    .line 335
    .end local v7    # "lhsClazz":Ljava/lang/Class;
    .restart local v3    # "lhsClazz":Ljava/lang/Class;
    :cond_1
    invoke-virtual {v4}, Lorg/apache/commons/lang/builder/CompareToBuilder;->toComparison()I

    move-result p0

    return p0

    .line 327
    .end local v1    # "lhs":Ljava/lang/Object;
    .end local v2    # "rhs":Ljava/lang/Object;
    .end local v4    # "compareToBuilder":Lorg/apache/commons/lang/builder/CompareToBuilder;
    .end local v5    # "compareTransients":Z
    .end local v6    # "excludeFields":[Ljava/lang/String;
    .restart local p0    # "lhs":Ljava/lang/Object;
    .restart local p1    # "rhs":Ljava/lang/Object;
    .restart local p2    # "compareTransients":Z
    .restart local p4    # "excludeFields":[Ljava/lang/String;
    :cond_2
    move-object v1, p0

    .end local p0    # "lhs":Ljava/lang/Object;
    .restart local v1    # "lhs":Ljava/lang/Object;
    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    throw p0

    .line 322
    .end local v1    # "lhs":Ljava/lang/Object;
    .end local v3    # "lhsClazz":Ljava/lang/Class;
    .restart local p0    # "lhs":Ljava/lang/Object;
    :cond_3
    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move-object v6, p4

    .line 323
    .end local p0    # "lhs":Ljava/lang/Object;
    .end local p1    # "rhs":Ljava/lang/Object;
    .end local p2    # "compareTransients":Z
    .end local p4    # "excludeFields":[Ljava/lang/String;
    .restart local v1    # "lhs":Ljava/lang/Object;
    .restart local v2    # "rhs":Ljava/lang/Object;
    .restart local v5    # "compareTransients":Z
    .restart local v6    # "excludeFields":[Ljava/lang/String;
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0}, Ljava/lang/NullPointerException;-><init>()V

    throw p0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)I
    .locals 2
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "excludeFields"    # [Ljava/lang/String;

    .line 240
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Lorg/apache/commons/lang/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public append(BB)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # B
    .param p2, "rhs"    # B

    .line 568
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 569
    return-object p0

    .line 571
    :cond_0
    if-ge p1, p2, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    if-le p1, p2, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 572
    return-object p0
.end method

.method public append(CC)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # C
    .param p2, "rhs"    # C

    .line 552
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 553
    return-object p0

    .line 555
    :cond_0
    if-ge p1, p2, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    if-le p1, p2, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 556
    return-object p0
.end method

.method public append(DD)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # D
    .param p3, "rhs"    # D

    .line 589
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 590
    return-object p0

    .line 592
    :cond_0
    invoke-static {p1, p2, p3, p4}, Lorg/apache/commons/lang/math/NumberUtils;->compare(DD)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 593
    return-object p0
.end method

.method public append(FF)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # F
    .param p2, "rhs"    # F

    .line 610
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 611
    return-object p0

    .line 613
    :cond_0
    invoke-static {p1, p2}, Lorg/apache/commons/lang/math/NumberUtils;->compare(FF)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 614
    return-object p0
.end method

.method public append(II)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # I
    .param p2, "rhs"    # I

    .line 520
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 521
    return-object p0

    .line 523
    :cond_0
    if-ge p1, p2, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    if-le p1, p2, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 524
    return-object p0
.end method

.method public append(JJ)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # J
    .param p3, "rhs"    # J

    .line 504
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 505
    return-object p0

    .line 507
    :cond_0
    cmp-long v0, p1, p3

    if-gez v0, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    cmp-long v0, p1, p3

    if-lez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 508
    return-object p0
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # Ljava/lang/Object;
    .param p2, "rhs"    # Ljava/lang/Object;

    .line 415
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang/builder/CompareToBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 2
    .param p1, "lhs"    # Ljava/lang/Object;
    .param p2, "rhs"    # Ljava/lang/Object;
    .param p3, "comparator"    # Ljava/util/Comparator;

    .line 444
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 445
    return-object p0

    .line 447
    :cond_0
    if-ne p1, p2, :cond_1

    .line 448
    return-object p0

    .line 450
    :cond_1
    if-nez p1, :cond_2

    .line 451
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 452
    return-object p0

    .line 454
    :cond_2
    if-nez p2, :cond_3

    .line 455
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 456
    return-object p0

    .line 458
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 462
    instance-of v0, p1, [J

    if-eqz v0, :cond_4

    .line 463
    move-object v0, p1

    check-cast v0, [J

    move-object v1, p2

    check-cast v1, [J

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([J[J)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto/16 :goto_0

    .line 464
    :cond_4
    instance-of v0, p1, [I

    if-eqz v0, :cond_5

    .line 465
    move-object v0, p1

    check-cast v0, [I

    move-object v1, p2

    check-cast v1, [I

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([I[I)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto/16 :goto_0

    .line 466
    :cond_5
    instance-of v0, p1, [S

    if-eqz v0, :cond_6

    .line 467
    move-object v0, p1

    check-cast v0, [S

    move-object v1, p2

    check-cast v1, [S

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([S[S)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto :goto_0

    .line 468
    :cond_6
    instance-of v0, p1, [C

    if-eqz v0, :cond_7

    .line 469
    move-object v0, p1

    check-cast v0, [C

    move-object v1, p2

    check-cast v1, [C

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([C[C)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto :goto_0

    .line 470
    :cond_7
    instance-of v0, p1, [B

    if-eqz v0, :cond_8

    .line 471
    move-object v0, p1

    check-cast v0, [B

    move-object v1, p2

    check-cast v1, [B

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([B[B)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto :goto_0

    .line 472
    :cond_8
    instance-of v0, p1, [D

    if-eqz v0, :cond_9

    .line 473
    move-object v0, p1

    check-cast v0, [D

    move-object v1, p2

    check-cast v1, [D

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([D[D)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto :goto_0

    .line 474
    :cond_9
    instance-of v0, p1, [F

    if-eqz v0, :cond_a

    .line 475
    move-object v0, p1

    check-cast v0, [F

    move-object v1, p2

    check-cast v1, [F

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([F[F)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto :goto_0

    .line 476
    :cond_a
    instance-of v0, p1, [Z

    if-eqz v0, :cond_b

    .line 477
    move-object v0, p1

    check-cast v0, [Z

    move-object v1, p2

    check-cast v1, [Z

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([Z[Z)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto :goto_0

    .line 481
    :cond_b
    move-object v0, p1

    check-cast v0, [Ljava/lang/Object;

    move-object v1, p2

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1, p3}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang/builder/CompareToBuilder;

    goto :goto_0

    .line 485
    :cond_c
    if-nez p3, :cond_d

    .line 486
    move-object v0, p1

    check-cast v0, Ljava/lang/Comparable;

    invoke-interface {v0, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 488
    :cond_d
    invoke-interface {p3, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 491
    :goto_0
    return-object p0
.end method

.method public append(SS)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # S
    .param p2, "rhs"    # S

    .line 536
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 537
    return-object p0

    .line 539
    :cond_0
    if-ge p1, p2, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    if-le p1, p2, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 540
    return-object p0
.end method

.method public append(ZZ)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # Z
    .param p2, "rhs"    # Z

    .line 626
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 627
    return-object p0

    .line 629
    :cond_0
    if-ne p1, p2, :cond_1

    .line 630
    return-object p0

    .line 632
    :cond_1
    if-nez p1, :cond_2

    .line 633
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 635
    :cond_2
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 637
    :goto_0
    return-object p0
.end method

.method public append([B[B)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 4
    .param p1, "lhs"    # [B
    .param p2, "rhs"    # [B

    .line 889
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 890
    return-object p0

    .line 892
    :cond_0
    if-ne p1, p2, :cond_1

    .line 893
    return-object p0

    .line 895
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 896
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 897
    return-object p0

    .line 899
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 900
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 901
    return-object p0

    .line 903
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 904
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 905
    return-object p0

    .line 907
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 908
    aget-byte v1, p1, v0

    aget-byte v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(BB)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 907
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 910
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public append([C[C)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 4
    .param p1, "lhs"    # [C
    .param p2, "rhs"    # [C

    .line 849
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 850
    return-object p0

    .line 852
    :cond_0
    if-ne p1, p2, :cond_1

    .line 853
    return-object p0

    .line 855
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 856
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 857
    return-object p0

    .line 859
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 860
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 861
    return-object p0

    .line 863
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 864
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 865
    return-object p0

    .line 867
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 868
    aget-char v1, p1, v0

    aget-char v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(CC)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 867
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 870
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public append([D[D)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 5
    .param p1, "lhs"    # [D
    .param p2, "rhs"    # [D

    .line 929
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 930
    return-object p0

    .line 932
    :cond_0
    if-ne p1, p2, :cond_1

    .line 933
    return-object p0

    .line 935
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 936
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 937
    return-object p0

    .line 939
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 940
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 941
    return-object p0

    .line 943
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 944
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 945
    return-object p0

    .line 947
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 948
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(DD)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 947
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 950
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public append([F[F)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 4
    .param p1, "lhs"    # [F
    .param p2, "rhs"    # [F

    .line 969
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 970
    return-object p0

    .line 972
    :cond_0
    if-ne p1, p2, :cond_1

    .line 973
    return-object p0

    .line 975
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 976
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 977
    return-object p0

    .line 979
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 980
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 981
    return-object p0

    .line 983
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 984
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 985
    return-object p0

    .line 987
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 988
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(FF)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 987
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 990
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public append([I[I)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 4
    .param p1, "lhs"    # [I
    .param p2, "rhs"    # [I

    .line 769
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 770
    return-object p0

    .line 772
    :cond_0
    if-ne p1, p2, :cond_1

    .line 773
    return-object p0

    .line 775
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 776
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 777
    return-object p0

    .line 779
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 780
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 781
    return-object p0

    .line 783
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 784
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 785
    return-object p0

    .line 787
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 788
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(II)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 787
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 790
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public append([J[J)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 5
    .param p1, "lhs"    # [J
    .param p2, "rhs"    # [J

    .line 729
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 730
    return-object p0

    .line 732
    :cond_0
    if-ne p1, p2, :cond_1

    .line 733
    return-object p0

    .line 735
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 736
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 737
    return-object p0

    .line 739
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 740
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 741
    return-object p0

    .line 743
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 744
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 745
    return-object p0

    .line 747
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 748
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(JJ)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 747
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 750
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "lhs"    # [Ljava/lang/Object;
    .param p2, "rhs"    # [Ljava/lang/Object;

    .line 662
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang/builder/CompareToBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 4
    .param p1, "lhs"    # [Ljava/lang/Object;
    .param p2, "rhs"    # [Ljava/lang/Object;
    .param p3, "comparator"    # Ljava/util/Comparator;

    .line 689
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 690
    return-object p0

    .line 692
    :cond_0
    if-ne p1, p2, :cond_1

    .line 693
    return-object p0

    .line 695
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 696
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 697
    return-object p0

    .line 699
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 700
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 701
    return-object p0

    .line 703
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 704
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 705
    return-object p0

    .line 707
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 708
    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2, p3}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 707
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 710
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public append([S[S)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 4
    .param p1, "lhs"    # [S
    .param p2, "rhs"    # [S

    .line 809
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 810
    return-object p0

    .line 812
    :cond_0
    if-ne p1, p2, :cond_1

    .line 813
    return-object p0

    .line 815
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 816
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 817
    return-object p0

    .line 819
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 820
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 821
    return-object p0

    .line 823
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 824
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 825
    return-object p0

    .line 827
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 828
    aget-short v1, p1, v0

    aget-short v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(SS)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 827
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 830
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public append([Z[Z)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 4
    .param p1, "lhs"    # [Z
    .param p2, "rhs"    # [Z

    .line 1009
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 1010
    return-object p0

    .line 1012
    :cond_0
    if-ne p1, p2, :cond_1

    .line 1013
    return-object p0

    .line 1015
    :cond_1
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 1016
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 1017
    return-object p0

    .line 1019
    :cond_2
    const/4 v1, 0x1

    if-nez p2, :cond_3

    .line 1020
    iput v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 1021
    return-object p0

    .line 1023
    :cond_3
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_5

    .line 1024
    array-length v2, p1

    array-length v3, p2

    if-ge v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    iput v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 1025
    return-object p0

    .line 1027
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 1028
    aget-boolean v1, p1, v0

    aget-boolean v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/CompareToBuilder;->append(ZZ)Lorg/apache/commons/lang/builder/CompareToBuilder;

    .line 1027
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1030
    .end local v0    # "i":I
    :cond_6
    return-object p0
.end method

.method public appendSuper(I)Lorg/apache/commons/lang/builder/CompareToBuilder;
    .locals 1
    .param p1, "superCompareTo"    # I

    .line 387
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 388
    return-object p0

    .line 390
    :cond_0
    iput p1, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    .line 391
    return-object p0
.end method

.method public toComparison()I
    .locals 1

    .line 1043
    iget v0, p0, Lorg/apache/commons/lang/builder/CompareToBuilder;->comparison:I

    return v0
.end method
