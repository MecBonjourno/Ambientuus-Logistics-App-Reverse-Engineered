.class public Lorg/apache/commons/lang/builder/EqualsBuilder;
.super Ljava/lang/Object;
.source "EqualsBuilder.java"


# instance fields
.field private isEquals:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 102
    return-void
.end method

.method private static reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/EqualsBuilder;Z[Ljava/lang/String;)V
    .locals 7
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "builder"    # Lorg/apache/commons/lang/builder/EqualsBuilder;
    .param p4, "useTransients"    # Z
    .param p5, "excludeFields"    # [Ljava/lang/String;

    .line 320
    invoke-virtual {p2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 321
    .local v0, "fields":[Ljava/lang/reflect/Field;
    if-eqz p5, :cond_0

    invoke-static {p5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_0

    :cond_0
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 322
    .local v1, "excludedFieldList":Ljava/util/List;
    :goto_0
    const/4 v2, 0x1

    invoke-static {v0, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    .line 323
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_3

    iget-boolean v3, p3, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v3, :cond_3

    .line 324
    aget-object v3, v0, v2

    .line 325
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

    .line 330
    :try_start_0
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p3, v4, v5}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang/builder/EqualsBuilder;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    goto :goto_2

    .line 331
    :catch_0
    move-exception v4

    .line 334
    .local v4, "e":Ljava/lang/IllegalAccessException;
    new-instance v5, Ljava/lang/InternalError;

    const-string v6, "Unexpected IllegalAccessException"

    invoke-direct {v5, v6}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v5

    .line 323
    .end local v3    # "f":Ljava/lang/reflect/Field;
    .end local v4    # "e":Ljava/lang/IllegalAccessException;
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 338
    .end local v2    # "i":I
    :cond_3
    return-void
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;

    .line 125
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, v1}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Collection;)Z
    .locals 1
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "excludeFields"    # Ljava/util/Collection;

    .line 148
    invoke-static {p2}, Lorg/apache/commons/lang/builder/ReflectionToStringBuilder;->toNoNullStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;Z)Z
    .locals 1
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "testTransients"    # Z

    .line 195
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;)Z
    .locals 1
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "testTransients"    # Z
    .param p3, "reflectUpToClass"    # Ljava/lang/Class;

    .line 224
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z
    .locals 10
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "testTransients"    # Z
    .param p3, "reflectUpToClass"    # Ljava/lang/Class;
    .param p4, "excludeFields"    # [Ljava/lang/String;

    .line 255
    if-ne p0, p1, :cond_0

    .line 256
    const/4 v0, 0x1

    return v0

    .line 258
    :cond_0
    const/4 v7, 0x0

    if-eqz p0, :cond_7

    if-nez p1, :cond_1

    goto/16 :goto_2

    .line 265
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    .line 266
    .local v8, "lhsClass":Ljava/lang/Class;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    .line 268
    .local v9, "rhsClass":Ljava/lang/Class;
    invoke-virtual {v8, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 269
    move-object v0, v8

    .line 270
    .local v0, "testClass":Ljava/lang/Class;
    invoke-virtual {v9, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 272
    move-object v0, v9

    move-object v3, v0

    goto :goto_0

    .line 270
    :cond_2
    move-object v3, v0

    goto :goto_0

    .line 274
    .end local v0    # "testClass":Ljava/lang/Class;
    :cond_3
    invoke-virtual {v9, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 275
    move-object v0, v9

    .line 276
    .restart local v0    # "testClass":Ljava/lang/Class;
    invoke-virtual {v8, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 278
    move-object v0, v8

    move-object v3, v0

    goto :goto_0

    .line 276
    :cond_4
    move-object v3, v0

    .line 284
    .end local v0    # "testClass":Ljava/lang/Class;
    :goto_0
    new-instance v4, Lorg/apache/commons/lang/builder/EqualsBuilder;

    invoke-direct {v4}, Lorg/apache/commons/lang/builder/EqualsBuilder;-><init>()V

    .line 286
    .local v4, "equalsBuilder":Lorg/apache/commons/lang/builder/EqualsBuilder;
    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move-object v6, p4

    :try_start_0
    invoke-static/range {v1 .. v6}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/EqualsBuilder;Z[Ljava/lang/String;)V

    .line 287
    :goto_1
    invoke-virtual {v3}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_5

    if-eq v3, p3, :cond_5

    .line 288
    invoke-virtual {v3}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v3

    .line 289
    .local v3, "testClass":Ljava/lang/Class;
    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move-object v6, p4

    invoke-static/range {v1 .. v6}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang/builder/EqualsBuilder;Z[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 298
    .end local v3    # "testClass":Ljava/lang/Class;
    :cond_5
    nop

    .line 299
    invoke-virtual {v4}, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals()Z

    move-result v0

    return v0

    .line 291
    :catch_0
    move-exception v0

    .line 297
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    return v7

    .line 282
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v4    # "equalsBuilder":Lorg/apache/commons/lang/builder/EqualsBuilder;
    :cond_6
    return v7

    .line 259
    .end local v8    # "lhsClass":Ljava/lang/Class;
    .end local v9    # "rhsClass":Ljava/lang/Class;
    :cond_7
    :goto_2
    return v7
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)Z
    .locals 2
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "excludeFields"    # [Ljava/lang/String;

    .line 171
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public append(BB)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 1
    .param p1, "lhs"    # B
    .param p2, "rhs"    # B

    .line 487
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 488
    return-object p0

    .line 490
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 491
    return-object p0
.end method

.method public append(CC)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 1
    .param p1, "lhs"    # C
    .param p2, "rhs"    # C

    .line 472
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 473
    return-object p0

    .line 475
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 476
    return-object p0
.end method

.method public append(DD)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 4
    .param p1, "lhs"    # D
    .param p3, "rhs"    # D

    .line 508
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 509
    return-object p0

    .line 511
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-static {p3, p4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(JJ)Lorg/apache/commons/lang/builder/EqualsBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(FF)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 2
    .param p1, "lhs"    # F
    .param p2, "rhs"    # F

    .line 528
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 529
    return-object p0

    .line 531
    :cond_0
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    invoke-static {p2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(II)Lorg/apache/commons/lang/builder/EqualsBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(II)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 1
    .param p1, "lhs"    # I
    .param p2, "rhs"    # I

    .line 442
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 443
    return-object p0

    .line 445
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 446
    return-object p0
.end method

.method public append(JJ)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 1
    .param p1, "lhs"    # J
    .param p3, "rhs"    # J

    .line 427
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 428
    return-object p0

    .line 430
    :cond_0
    cmp-long v0, p1, p3

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 431
    return-object p0
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 4
    .param p1, "lhs"    # Ljava/lang/Object;
    .param p2, "rhs"    # Ljava/lang/Object;

    .line 368
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 369
    return-object p0

    .line 371
    :cond_0
    if-ne p1, p2, :cond_1

    .line 372
    return-object p0

    .line 374
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_f

    if-nez p2, :cond_2

    goto/16 :goto_1

    .line 378
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 379
    .local v1, "lhsClass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-nez v2, :cond_5

    .line 380
    instance-of v2, p1, Ljava/math/BigDecimal;

    if-eqz v2, :cond_4

    .line 381
    move-object v2, p1

    check-cast v2, Ljava/math/BigDecimal;

    invoke-virtual {v2, p2}, Ljava/math/BigDecimal;->compareTo(Ljava/lang/Object;)I

    move-result v2

    if-nez v2, :cond_3

    const/4 v0, 0x1

    :cond_3
    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    goto/16 :goto_0

    .line 384
    :cond_4
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    goto/16 :goto_0

    .line 386
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_6

    .line 388
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    goto/16 :goto_0

    .line 392
    :cond_6
    instance-of v0, p1, [J

    if-eqz v0, :cond_7

    .line 393
    move-object v0, p1

    check-cast v0, [J

    move-object v2, p2

    check-cast v2, [J

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([J[J)Lorg/apache/commons/lang/builder/EqualsBuilder;

    goto/16 :goto_0

    .line 394
    :cond_7
    instance-of v0, p1, [I

    if-eqz v0, :cond_8

    .line 395
    move-object v0, p1

    check-cast v0, [I

    move-object v2, p2

    check-cast v2, [I

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([I[I)Lorg/apache/commons/lang/builder/EqualsBuilder;

    goto :goto_0

    .line 396
    :cond_8
    instance-of v0, p1, [S

    if-eqz v0, :cond_9

    .line 397
    move-object v0, p1

    check-cast v0, [S

    move-object v2, p2

    check-cast v2, [S

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([S[S)Lorg/apache/commons/lang/builder/EqualsBuilder;

    goto :goto_0

    .line 398
    :cond_9
    instance-of v0, p1, [C

    if-eqz v0, :cond_a

    .line 399
    move-object v0, p1

    check-cast v0, [C

    move-object v2, p2

    check-cast v2, [C

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([C[C)Lorg/apache/commons/lang/builder/EqualsBuilder;

    goto :goto_0

    .line 400
    :cond_a
    instance-of v0, p1, [B

    if-eqz v0, :cond_b

    .line 401
    move-object v0, p1

    check-cast v0, [B

    move-object v2, p2

    check-cast v2, [B

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([B[B)Lorg/apache/commons/lang/builder/EqualsBuilder;

    goto :goto_0

    .line 402
    :cond_b
    instance-of v0, p1, [D

    if-eqz v0, :cond_c

    .line 403
    move-object v0, p1

    check-cast v0, [D

    move-object v2, p2

    check-cast v2, [D

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([D[D)Lorg/apache/commons/lang/builder/EqualsBuilder;

    goto :goto_0

    .line 404
    :cond_c
    instance-of v0, p1, [F

    if-eqz v0, :cond_d

    .line 405
    move-object v0, p1

    check-cast v0, [F

    move-object v2, p2

    check-cast v2, [F

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([F[F)Lorg/apache/commons/lang/builder/EqualsBuilder;

    goto :goto_0

    .line 406
    :cond_d
    instance-of v0, p1, [Z

    if-eqz v0, :cond_e

    .line 407
    move-object v0, p1

    check-cast v0, [Z

    move-object v2, p2

    check-cast v2, [Z

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([Z[Z)Lorg/apache/commons/lang/builder/EqualsBuilder;

    goto :goto_0

    .line 410
    :cond_e
    move-object v0, p1

    check-cast v0, [Ljava/lang/Object;

    move-object v2, p2

    check-cast v2, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 412
    :goto_0
    return-object p0

    .line 375
    .end local v1    # "lhsClass":Ljava/lang/Class;
    :cond_f
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 376
    return-object p0
.end method

.method public append(SS)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 1
    .param p1, "lhs"    # S
    .param p2, "rhs"    # S

    .line 457
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 458
    return-object p0

    .line 460
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 461
    return-object p0
.end method

.method public append(ZZ)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 1
    .param p1, "lhs"    # Z
    .param p2, "rhs"    # Z

    .line 542
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 543
    return-object p0

    .line 545
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 546
    return-object p0
.end method

.method public append([B[B)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 3
    .param p1, "lhs"    # [B
    .param p2, "rhs"    # [B

    .line 715
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 716
    return-object p0

    .line 718
    :cond_0
    if-ne p1, p2, :cond_1

    .line 719
    return-object p0

    .line 721
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 725
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 726
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 727
    return-object p0

    .line 729
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 730
    aget-byte v1, p1, v0

    aget-byte v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(BB)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 729
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 732
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 722
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 723
    return-object p0
.end method

.method public append([C[C)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 3
    .param p1, "lhs"    # [C
    .param p2, "rhs"    # [C

    .line 684
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 685
    return-object p0

    .line 687
    :cond_0
    if-ne p1, p2, :cond_1

    .line 688
    return-object p0

    .line 690
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 694
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 695
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 696
    return-object p0

    .line 698
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 699
    aget-char v1, p1, v0

    aget-char v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(CC)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 698
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 701
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 691
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 692
    return-object p0
.end method

.method public append([D[D)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 5
    .param p1, "lhs"    # [D
    .param p2, "rhs"    # [D

    .line 746
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 747
    return-object p0

    .line 749
    :cond_0
    if-ne p1, p2, :cond_1

    .line 750
    return-object p0

    .line 752
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 756
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 757
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 758
    return-object p0

    .line 760
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 761
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(DD)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 760
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 763
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 753
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 754
    return-object p0
.end method

.method public append([F[F)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 3
    .param p1, "lhs"    # [F
    .param p2, "rhs"    # [F

    .line 777
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 778
    return-object p0

    .line 780
    :cond_0
    if-ne p1, p2, :cond_1

    .line 781
    return-object p0

    .line 783
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 787
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 788
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 789
    return-object p0

    .line 791
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 792
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(FF)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 791
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 794
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 784
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 785
    return-object p0
.end method

.method public append([I[I)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 3
    .param p1, "lhs"    # [I
    .param p2, "rhs"    # [I

    .line 622
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 623
    return-object p0

    .line 625
    :cond_0
    if-ne p1, p2, :cond_1

    .line 626
    return-object p0

    .line 628
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 632
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 633
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 634
    return-object p0

    .line 636
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 637
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(II)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 636
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 639
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 629
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 630
    return-object p0
.end method

.method public append([J[J)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 5
    .param p1, "lhs"    # [J
    .param p2, "rhs"    # [J

    .line 591
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 592
    return-object p0

    .line 594
    :cond_0
    if-ne p1, p2, :cond_1

    .line 595
    return-object p0

    .line 597
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 601
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 602
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 603
    return-object p0

    .line 605
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 606
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(JJ)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 605
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 608
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 598
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 599
    return-object p0
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 3
    .param p1, "lhs"    # [Ljava/lang/Object;
    .param p2, "rhs"    # [Ljava/lang/Object;

    .line 560
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 561
    return-object p0

    .line 563
    :cond_0
    if-ne p1, p2, :cond_1

    .line 564
    return-object p0

    .line 566
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 570
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 571
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 572
    return-object p0

    .line 574
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 575
    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 574
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 577
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 567
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 568
    return-object p0
.end method

.method public append([S[S)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 3
    .param p1, "lhs"    # [S
    .param p2, "rhs"    # [S

    .line 653
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 654
    return-object p0

    .line 656
    :cond_0
    if-ne p1, p2, :cond_1

    .line 657
    return-object p0

    .line 659
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 663
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 664
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 665
    return-object p0

    .line 667
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 668
    aget-short v1, p1, v0

    aget-short v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(SS)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 667
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 670
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 660
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 661
    return-object p0
.end method

.method public append([Z[Z)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 3
    .param p1, "lhs"    # [Z
    .param p2, "rhs"    # [Z

    .line 808
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 809
    return-object p0

    .line 811
    :cond_0
    if-ne p1, p2, :cond_1

    .line 812
    return-object p0

    .line 814
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p2, :cond_2

    goto :goto_1

    .line 818
    :cond_2
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_3

    .line 819
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 820
    return-object p0

    .line 822
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_4

    .line 823
    aget-boolean v1, p1, v0

    aget-boolean v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(ZZ)Lorg/apache/commons/lang/builder/EqualsBuilder;

    .line 822
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 825
    .end local v0    # "i":I
    :cond_4
    return-object p0

    .line 815
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->setEquals(Z)V

    .line 816
    return-object p0
.end method

.method public appendSuper(Z)Lorg/apache/commons/lang/builder/EqualsBuilder;
    .locals 1
    .param p1, "superEquals"    # Z

    .line 350
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 351
    return-object p0

    .line 353
    :cond_0
    iput-boolean p1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 354
    return-object p0
.end method

.method public isEquals()Z
    .locals 1

    .line 835
    iget-boolean v0, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    return v0
.end method

.method protected setEquals(Z)V
    .locals 0
    .param p1, "isEquals"    # Z

    .line 845
    iput-boolean p1, p0, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals:Z

    .line 846
    return-void
.end method
