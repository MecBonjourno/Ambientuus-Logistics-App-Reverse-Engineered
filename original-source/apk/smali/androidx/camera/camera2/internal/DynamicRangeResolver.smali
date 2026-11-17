.class final Landroidx/camera/camera2/internal/DynamicRangeResolver;
.super Ljava/lang/Object;
.source "DynamicRangeResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/DynamicRangeResolver$Api33Impl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DynamicRangeResolver"


# instance fields
.field private final mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

.field private final mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

.field private final mIs10BitSupported:Z


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V
    .locals 6
    .param p1, "characteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 64
    invoke-static {p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->fromCameraCharacteristics(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    .line 66
    iget-object v0, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 67
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 68
    .local v0, "availableCapabilities":[I
    const/4 v1, 0x0

    .line 69
    .local v1, "is10BitSupported":Z
    if-eqz v0, :cond_1

    .line 70
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v0, v3

    .line 71
    .local v4, "capability":I
    const/16 v5, 0x12

    if-ne v4, v5, :cond_0

    .line 73
    const/4 v1, 0x1

    .line 74
    goto :goto_1

    .line 70
    .end local v4    # "capability":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 78
    :cond_1
    :goto_1
    iput-boolean v1, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mIs10BitSupported:Z

    .line 79
    return-void
.end method

.method private static canResolve(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z
    .locals 4
    .param p0, "testRange"    # Landroidx/camera/core/DynamicRange;
    .param p1, "fullySpecifiedRange"    # Landroidx/camera/core/DynamicRange;

    .line 474
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v0

    const-string v1, "Fully specified range is not actually fully specified."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 476
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 477
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 478
    return v2

    .line 481
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-eq v0, v3, :cond_1

    .line 482
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-eqz v0, :cond_1

    .line 483
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v3

    if-eq v0, v3, :cond_1

    .line 484
    return v2

    .line 487
    :cond_1
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    if-eqz v0, :cond_3

    .line 488
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v3

    if-ne v0, v3, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    :cond_3
    :goto_0
    nop

    .line 487
    :goto_1
    return v1
.end method

.method private static canResolveWithinConstraints(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z
    .locals 3
    .param p0, "rangeToResolve"    # Landroidx/camera/core/DynamicRange;
    .param p1, "candidateRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/core/DynamicRange;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;)Z"
        }
    .end annotation

    .line 451
    .local p2, "constraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 452
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v2, 0x1

    aput-object p1, v0, v2

    const-string v2, "Candidate Dynamic range is not within constraints.\nDynamic range to resolve:\n  %s\nCandidate dynamic range:\n  %s"

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "DynamicRangeResolver"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    return v1

    .line 461
    :cond_0
    invoke-static {p0, p1}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->canResolve(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z

    move-result v0

    return v0
.end method

.method private static findSupportedHdrMatch(Landroidx/camera/core/DynamicRange;Ljava/util/Collection;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;
    .locals 7
    .param p0, "rangeToMatch"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;)",
            "Landroidx/camera/core/DynamicRange;"
        }
    .end annotation

    .line 382
    .local p1, "fullySpecifiedCandidateRanges":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/DynamicRange;>;"
    .local p2, "constraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 383
    return-object v1

    .line 386
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/DynamicRange;

    .line 387
    .local v3, "candidateRange":Landroidx/camera/core/DynamicRange;
    const-string v4, "Fully specified DynamicRange cannot be null."

    invoke-static {v3, v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    invoke-virtual {v3}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v4

    .line 390
    .local v4, "candidateEncoding":I
    invoke-virtual {v3}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v5

    const-string v6, "Fully specified DynamicRange must have fully defined encoding."

    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 392
    if-ne v4, v2, :cond_1

    .line 394
    goto :goto_0

    .line 397
    :cond_1
    invoke-static {p0, v3, p2}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->canResolveWithinConstraints(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 398
    return-object v3

    .line 400
    .end local v3    # "candidateRange":Landroidx/camera/core/DynamicRange;
    .end local v4    # "candidateEncoding":I
    :cond_2
    goto :goto_0

    .line 401
    :cond_3
    return-object v1
.end method

.method private static isFullyUnspecified(Landroidx/camera/core/DynamicRange;)Z
    .locals 1
    .param p0, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 425
    sget-object v0, Landroidx/camera/core/DynamicRange;->UNSPECIFIED:Landroidx/camera/core/DynamicRange;

    invoke-static {p0, v0}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isPartiallySpecified(Landroidx/camera/core/DynamicRange;)Z
    .locals 2
    .param p0, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 433
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    .line 434
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-eqz v0, :cond_0

    .line 435
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    if-eqz v0, :cond_2

    .line 436
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-nez v0, :cond_1

    .line 437
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 433
    :goto_1
    return v0
.end method

.method private resolveDynamicRange(Landroidx/camera/core/DynamicRange;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/lang/String;)Landroidx/camera/core/DynamicRange;
    .locals 18
    .param p1, "requestedDynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p5, "rangeOwnerLabel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroidx/camera/core/DynamicRange;"
        }
    .end annotation

    .line 222
    .local p2, "combinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p3, "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p4, "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 223
    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 224
    return-object v0

    .line 228
    :cond_0
    return-object v3

    .line 233
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v2

    .line 234
    .local v2, "requestedEncoding":I
    invoke-virtual {v0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v4

    .line 235
    .local v4, "requestedBitDepth":I
    const/4 v5, 0x1

    if-ne v2, v5, :cond_3

    if-nez v4, :cond_3

    .line 236
    sget-object v5, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-interface {v1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 237
    sget-object v3, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    return-object v3

    .line 240
    :cond_2
    return-object v3

    .line 245
    :cond_3
    move-object/from16 v6, p3

    invoke-static {v0, v6, v1}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->findSupportedHdrMatch(Landroidx/camera/core/DynamicRange;Ljava/util/Collection;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;

    move-result-object v7

    .line 247
    .local v7, "resolvedDynamicRange":Landroidx/camera/core/DynamicRange;
    const/4 v8, 0x0

    const/4 v9, 0x3

    const-string v10, "DynamicRangeResolver"

    const/4 v11, 0x2

    if-eqz v7, :cond_4

    .line 248
    new-array v3, v9, [Ljava/lang/Object;

    aput-object p5, v3, v8

    aput-object v0, v3, v5

    aput-object v7, v3, v11

    const-string v5, "Resolved dynamic range for use case %s from existing attached surface.\n%s\n->\n%s"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v10, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    return-object v7

    .line 256
    :cond_4
    move-object/from16 v12, p4

    invoke-static {v0, v12, v1}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->findSupportedHdrMatch(Landroidx/camera/core/DynamicRange;Ljava/util/Collection;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;

    move-result-object v7

    .line 258
    if-eqz v7, :cond_5

    .line 259
    new-array v3, v9, [Ljava/lang/Object;

    aput-object p5, v3, v8

    aput-object v0, v3, v5

    aput-object v7, v3, v11

    const-string v5, "Resolved dynamic range for use case %s from concurrently bound use case.\n%s\n->\n%s"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v10, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    return-object v7

    .line 269
    :cond_5
    sget-object v13, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-static {v0, v13, v1}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->canResolveWithinConstraints(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 271
    new-array v3, v9, [Ljava/lang/Object;

    aput-object p5, v3, v8

    aput-object v0, v3, v5

    sget-object v5, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    aput-object v5, v3, v11

    const-string v5, "Resolved dynamic range for use case %s to no compatible HDR dynamic ranges.\n%s\n->\n%s"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v10, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    sget-object v3, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    return-object v3

    .line 280
    :cond_6
    if-ne v2, v11, :cond_d

    const/16 v13, 0xa

    if-eq v4, v13, :cond_8

    if-nez v4, :cond_7

    goto :goto_0

    :cond_7
    move-object/from16 v16, v3

    move/from16 v17, v5

    move-object/from16 v3, p0

    goto :goto_3

    .line 283
    :cond_8
    :goto_0
    new-instance v13, Ljava/util/LinkedHashSet;

    invoke-direct {v13}, Ljava/util/LinkedHashSet;-><init>()V

    .line 286
    .local v13, "hdrDefaultRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    const/4 v14, 0x0

    .line 287
    .local v14, "recommendedRange":Landroidx/camera/core/DynamicRange;
    sget v15, Landroid/os/Build$VERSION;->SDK_INT:I

    move-object/from16 v16, v3

    const/16 v3, 0x21

    if-lt v15, v3, :cond_9

    .line 288
    move-object/from16 v3, p0

    iget-object v15, v3, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v15}, Landroidx/camera/camera2/internal/DynamicRangeResolver$Api33Impl;->getRecommended10BitDynamicRange(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/core/DynamicRange;

    move-result-object v14

    .line 289
    if-eqz v14, :cond_a

    .line 290
    invoke-interface {v13, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 287
    :cond_9
    move-object/from16 v3, p0

    .line 295
    :cond_a
    :goto_1
    sget-object v15, Landroidx/camera/core/DynamicRange;->HLG_10_BIT:Landroidx/camera/core/DynamicRange;

    invoke-interface {v13, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 296
    invoke-static {v0, v13, v1}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->findSupportedHdrMatch(Landroidx/camera/core/DynamicRange;Ljava/util/Collection;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;

    move-result-object v7

    .line 298
    if-eqz v7, :cond_c

    .line 299
    nop

    .line 303
    invoke-static {v7, v14}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_b

    const-string/jumbo v15, "recommended"

    goto :goto_2

    .line 304
    :cond_b
    const-string/jumbo v15, "required"

    :goto_2
    move/from16 v17, v5

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p5, v5, v8

    aput-object v15, v5, v17

    aput-object v0, v5, v11

    aput-object v7, v5, v9

    .line 299
    const-string v8, "Resolved dynamic range for use case %s from %s 10-bit supported dynamic range.\n%s\n->\n%s"

    invoke-static {v8, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v10, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    return-object v7

    .line 298
    :cond_c
    move/from16 v17, v5

    goto :goto_3

    .line 280
    .end local v13    # "hdrDefaultRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .end local v14    # "recommendedRange":Landroidx/camera/core/DynamicRange;
    :cond_d
    move-object/from16 v16, v3

    move/from16 v17, v5

    move-object/from16 v3, p0

    .line 315
    :goto_3
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_10

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/camera/core/DynamicRange;

    .line 316
    .local v13, "candidateRange":Landroidx/camera/core/DynamicRange;
    invoke-virtual {v13}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v14

    const-string v15, "Candidate dynamic range must be fully specified."

    invoke-static {v14, v15}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 320
    sget-object v14, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-virtual {v13, v14}, Landroidx/camera/core/DynamicRange;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_e

    .line 321
    goto :goto_4

    .line 324
    :cond_e
    invoke-static {v0, v13}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->canResolve(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z

    move-result v14

    if-eqz v14, :cond_f

    .line 325
    new-array v5, v9, [Ljava/lang/Object;

    aput-object p5, v5, v8

    aput-object v0, v5, v17

    aput-object v13, v5, v11

    const-string v8, "Resolved dynamic range for use case %s from validated dynamic range constraints or supported HDR dynamic ranges.\n%s\n->\n%s"

    invoke-static {v8, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v10, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    return-object v13

    .line 332
    .end local v13    # "candidateRange":Landroidx/camera/core/DynamicRange;
    :cond_f
    goto :goto_4

    .line 335
    :cond_10
    return-object v16
.end method

.method private resolveDynamicRangeAndUpdateConstraints(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Landroidx/camera/core/impl/UseCaseConfig;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;)",
            "Landroidx/camera/core/DynamicRange;"
        }
    .end annotation

    .line 173
    .local p1, "supportedDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p2, "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p3, "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p4, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .local p5, "outCombinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p4}, Landroidx/camera/core/impl/UseCaseConfig;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v1

    .line 174
    .local v1, "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    nop

    .line 176
    invoke-interface {p4}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetName()Ljava/lang/String;

    move-result-object v5

    .line 174
    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move-object v2, p5

    .end local p2    # "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .end local p3    # "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .end local p5    # "outCombinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local v2, "outCombinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local v3, "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local v4, "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-direct/range {v0 .. v5}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->resolveDynamicRange(Landroidx/camera/core/DynamicRange;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/lang/String;)Landroidx/camera/core/DynamicRange;

    move-result-object p2

    .line 178
    .local p2, "resolvedDynamicRange":Landroidx/camera/core/DynamicRange;
    if-eqz p2, :cond_0

    .line 179
    iget-object p3, v0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    invoke-static {v2, p2, p3}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->updateConstraints(Ljava/util/Set;Landroidx/camera/core/DynamicRange;Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;)V

    .line 197
    return-object p2

    .line 181
    :cond_0
    new-instance p3, Ljava/lang/IllegalArgumentException;

    .line 192
    invoke-interface {p4}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetName()Ljava/lang/String;

    move-result-object p5

    .line 193
    const-string v5, "\n  "

    invoke-static {v5, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    .line 194
    invoke-static {v5, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p5, v7, v8

    const/4 p5, 0x1

    aput-object v1, v7, p5

    const/4 p5, 0x2

    aput-object v6, v7, p5

    const/4 p5, 0x3

    aput-object v5, v7, p5

    .line 181
    const-string p5, "Unable to resolve supported dynamic range. The dynamic range may not be supported on the device or may not be allowed concurrently with other attached use cases.\nUse case:\n  %s\nRequested dynamic range:\n  %s\nSupported dynamic ranges:\n  %s\nConstrained set of concurrent dynamic ranges:\n  %s"

    invoke-static {p5, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-direct {p3, p5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p3
.end method

.method private static updateConstraints(Ljava/util/Set;Landroidx/camera/core/DynamicRange;Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;)V
    .locals 8
    .param p1, "newDynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "dynamicRangesInfo"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;",
            ")V"
        }
    .end annotation

    .line 350
    .local p0, "combinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Cannot update already-empty constraints."

    invoke-static {v0, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 352
    nop

    .line 353
    invoke-virtual {p2, p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->getDynamicRangeCaptureRequestConstraints(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;

    move-result-object v0

    .line 354
    .local v0, "newConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 356
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 358
    .local v2, "previousConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p0, v0}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 359
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 364
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    .line 372
    const-string v4, "\n  "

    invoke-static {v4, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    .line 373
    invoke-static {v4, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    aput-object v5, v6, v1

    const/4 v1, 0x2

    aput-object v4, v6, v1

    .line 364
    const-string v1, "Constraints of dynamic range cannot be combined with existing constraints.\nDynamic range:\n  %s\nConstraints:\n  %s\nExisting constraints:\n  %s"

    invoke-static {v1, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 376
    .end local v2    # "previousConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method is10BitDynamicRangeSupported()Z
    .locals 1

    .line 85
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mIs10BitSupported:Z

    return v0
.end method

.method resolveAndValidateDynamicRanges(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ljava/util/Map;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 101
    .local p1, "existingSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p2, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p3, "useCasePriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    move-object v3, v0

    .line 102
    .local v3, "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 103
    .local v1, "asi":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 104
    .end local v1    # "asi":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 107
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v2

    .line 112
    .local v2, "supportedDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 113
    .local v6, "combinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/DynamicRange;

    .line 114
    .local v1, "dynamicRange":Landroidx/camera/core/DynamicRange;
    iget-object v4, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    invoke-static {v6, v1, v4}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->updateConstraints(Ljava/util/Set;Landroidx/camera/core/DynamicRange;Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;)V

    .line 115
    .end local v1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    goto :goto_1

    .line 128
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v0, "orderedFullyDefinedUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v7, v1

    .line 130
    .local v7, "orderedPartiallyDefinedUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v8, v1

    .line 131
    .local v8, "orderedUndefinedUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 132
    .local v4, "priorityIdx":I
    move-object/from16 v9, p2

    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/UseCaseConfig;

    .line 133
    .local v5, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v5}, Landroidx/camera/core/impl/UseCaseConfig;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v10

    .line 134
    .local v10, "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-static {v10}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->isFullyUnspecified(Landroidx/camera/core/DynamicRange;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 135
    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 136
    :cond_2
    invoke-static {v10}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->isPartiallySpecified(Landroidx/camera/core/DynamicRange;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 137
    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 139
    :cond_3
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .end local v4    # "priorityIdx":I
    .end local v5    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v10    # "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    :goto_3
    goto :goto_2

    .line 143
    :cond_4
    move-object/from16 v9, p2

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v10, v1

    .line 147
    .local v10, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    .line 150
    .local v4, "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v11, v1

    .line 151
    .local v11, "orderedUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface {v11, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 152
    invoke-interface {v11, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 153
    invoke-interface {v11, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 154
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroidx/camera/core/impl/UseCaseConfig;

    .line 155
    .restart local v5    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->resolveDynamicRangeAndUpdateConstraints(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Landroidx/camera/core/impl/UseCaseConfig;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;

    move-result-object v13

    .line 158
    .local v13, "resolvedDynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-interface {v10, v5, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 160
    invoke-interface {v4, v13}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 162
    .end local v5    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v13    # "resolvedDynamicRange":Landroidx/camera/core/DynamicRange;
    :cond_5
    goto :goto_4

    .line 164
    :cond_6
    return-object v10
.end method
