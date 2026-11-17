.class public final Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
.super Ljava/lang/Object;
.source "ByteQuadsCanonicalizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;
    }
.end annotation


# static fields
.field private static final DEFAULT_T_SIZE:I = 0x40

.field static final MAX_ENTRIES_FOR_REUSE:I = 0x1770

.field private static final MAX_T_SIZE:I = 0x10000

.field private static final MIN_HASH_SIZE:I = 0x10

.field private static final MULT:I = 0x21

.field private static final MULT2:I = 0x1003f

.field private static final MULT3:I = 0x1f


# instance fields
.field private _count:I

.field private final _failOnDoS:Z

.field private _hashArea:[I

.field private _hashShared:Z

.field private _hashSize:I

.field private _intern:Z

.field private _longNameOffset:I

.field private _names:[Ljava/lang/String;

.field private transient _needRehash:Z

.field private final _parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

.field private _secondaryStart:I

.field private final _seed:I

.field private _spilloverEnd:I

.field private final _tableInfo:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;",
            ">;"
        }
    .end annotation
.end field

.field private _tertiaryShift:I

.field private _tertiaryStart:I


# direct methods
.method private constructor <init>(IZIZ)V
    .locals 2
    .param p1, "sz"    # I
    .param p2, "intern"    # Z
    .param p3, "seed"    # I
    .param p4, "failOnDoS"    # Z

    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 224
    iput p3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    .line 225
    iput-boolean p2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    .line 226
    iput-boolean p4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_failOnDoS:Z

    .line 228
    const/16 v0, 0x10

    if-ge p1, v0, :cond_0

    .line 229
    const/16 p1, 0x10

    goto :goto_1

    .line 233
    :cond_0
    add-int/lit8 v0, p1, -0x1

    and-int/2addr v0, p1

    if-eqz v0, :cond_2

    .line 234
    const/16 v0, 0x10

    .line 235
    .local v0, "curr":I
    :goto_0
    if-ge v0, p1, :cond_1

    .line 236
    add-int/2addr v0, v0

    goto :goto_0

    .line 238
    :cond_1
    move p1, v0

    .line 241
    .end local v0    # "curr":I
    :cond_2
    :goto_1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->createInitial(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    .line 242
    return-void
.end method

.method private constructor <init>(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;ZIZLcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;)V
    .locals 3
    .param p1, "parent"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .param p2, "intern"    # Z
    .param p3, "seed"    # I
    .param p4, "failOnDoS"    # Z
    .param p5, "state"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 250
    iput-object p1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 251
    iput p3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    .line 252
    iput-boolean p2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    .line 253
    iput-boolean p4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_failOnDoS:Z

    .line 254
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    .line 257
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->count:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 258
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->size:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    .line 259
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shl-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    .line 260
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    const/4 v2, 0x1

    shr-int/2addr v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    .line 261
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->tertiaryShift:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    .line 263
    iget-object v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->mainHash:[I

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 264
    iget-object v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->names:[Ljava/lang/String;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    .line 266
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->spilloverEnd:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 267
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->longNameOffset:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    .line 270
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    .line 271
    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    .line 272
    return-void
.end method

.method private _appendLongName([II)I
    .locals 5
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I

    .line 939
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    .line 942
    .local v0, "start":I
    add-int v1, v0, p2

    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    array-length v2, v2

    if-le v1, v2, :cond_0

    .line 944
    add-int v1, v0, p2

    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    array-length v2, v2

    sub-int/2addr v1, v2

    .line 946
    .local v1, "toAdd":I
    const/16 v2, 0x1000

    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 948
    .local v2, "minAdd":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    array-length v3, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/2addr v3, v4

    .line 949
    .local v3, "newSize":I
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    invoke-static {v4, v3}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v4

    iput-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 951
    .end local v1    # "toAdd":I
    .end local v2    # "minAdd":I
    .end local v3    # "newSize":I
    :cond_0
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    invoke-static {p1, v1, v2, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 952
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    add-int/2addr v1, p2

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    .line 953
    return v0
.end method

.method private final _calcOffset(I)I
    .locals 2
    .param p1, "hash"    # I

    .line 604
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    add-int/lit8 v0, v0, -0x1

    and-int/2addr v0, p1

    .line 606
    .local v0, "ix":I
    shl-int/lit8 v1, v0, 0x2

    return v1
.end method

.method static _calcTertiaryShift(I)I
    .locals 2
    .param p0, "primarySlots"    # I

    .line 1191
    shr-int/lit8 v0, p0, 0x2

    .line 1194
    .local v0, "tertSlots":I
    const/16 v1, 0x40

    if-ge v0, v1, :cond_0

    .line 1195
    const/4 v1, 0x4

    return v1

    .line 1197
    :cond_0
    const/16 v1, 0x100

    if-gt v0, v1, :cond_1

    .line 1198
    const/4 v1, 0x5

    return v1

    .line 1200
    :cond_1
    const/16 v1, 0x400

    if-gt v0, v1, :cond_2

    .line 1201
    const/4 v1, 0x6

    return v1

    .line 1204
    :cond_2
    const/4 v1, 0x7

    return v1
.end method

.method private _findOffsetForAdd(I)I
    .locals 7
    .param p1, "hash"    # I

    .line 890
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v0

    .line 891
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 892
    .local v1, "hashArea":[I
    add-int/lit8 v2, v0, 0x3

    aget v2, v1, v2

    if-nez v2, :cond_0

    .line 894
    return v0

    .line 897
    :cond_0
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v3, v0, 0x3

    shl-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    .line 898
    .local v2, "offset2":I
    add-int/lit8 v3, v2, 0x3

    aget v3, v1, v3

    if-nez v3, :cond_1

    .line 900
    return v2

    .line 904
    :cond_1
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v4, v4, 0x2

    shr-int v4, v0, v4

    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v4, v5

    add-int/2addr v3, v4

    .line 905
    .end local v2    # "offset2":I
    .local v3, "offset2":I
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    const/4 v4, 0x1

    shl-int v2, v4, v2

    .line 906
    .local v2, "bucketSize":I
    add-int v5, v3, v2

    .local v5, "end":I
    :goto_0
    if-ge v3, v5, :cond_3

    .line 907
    add-int/lit8 v6, v3, 0x3

    aget v6, v1, v6

    if-nez v6, :cond_2

    .line 909
    return v3

    .line 906
    :cond_2
    add-int/lit8 v3, v3, 0x4

    goto :goto_0

    .line 914
    .end local v5    # "end":I
    :cond_3
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 915
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    add-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 925
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shl-int/lit8 v5, v5, 0x3

    .line 926
    .restart local v5    # "end":I
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-lt v6, v5, :cond_5

    .line 927
    iget-boolean v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_failOnDoS:Z

    if-eqz v6, :cond_4

    .line 928
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_reportTooManyCollisions()V

    .line 932
    :cond_4
    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    .line 934
    :cond_5
    return v0
.end method

.method private _findSecondary(II)Ljava/lang/String;
    .locals 8
    .param p1, "origOffset"    # I
    .param p2, "q1"    # I

    .line 621
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v1, v1, 0x2

    shr-int v1, p1, v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 622
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 623
    .local v1, "hashArea":[I
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    const/4 v3, 0x1

    shl-int v2, v3, v2

    .line 624
    .local v2, "bucketSize":I
    add-int v4, v0, v2

    .local v4, "end":I
    :goto_0
    const/4 v5, 0x0

    if-ge v0, v4, :cond_2

    .line 625
    add-int/lit8 v6, v0, 0x3

    aget v6, v1, v6

    .line 626
    .local v6, "len":I
    aget v7, v1, v0

    if-ne p2, v7, :cond_0

    if-ne v3, v6, :cond_0

    .line 627
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v0, 0x2

    aget-object v3, v3, v5

    return-object v3

    .line 629
    :cond_0
    if-nez v6, :cond_1

    .line 630
    return-object v5

    .line 624
    .end local v6    # "len":I
    :cond_1
    add-int/lit8 v0, v0, 0x4

    goto :goto_0

    .line 636
    .end local v4    # "end":I
    :cond_2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v0

    :goto_1
    iget v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-ge v0, v4, :cond_4

    .line 637
    aget v4, v1, v0

    if-ne p2, v4, :cond_3

    add-int/lit8 v4, v0, 0x3

    aget v4, v1, v4

    if-ne v3, v4, :cond_3

    .line 638
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v0, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 636
    :cond_3
    add-int/lit8 v0, v0, 0x4

    goto :goto_1

    .line 641
    :cond_4
    return-object v5
.end method

.method private _findSecondary(III)Ljava/lang/String;
    .locals 8
    .param p1, "origOffset"    # I
    .param p2, "q1"    # I
    .param p3, "q2"    # I

    .line 646
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    const/4 v2, 0x2

    add-int/2addr v1, v2

    shr-int v1, p1, v1

    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v1, v3

    add-int/2addr v0, v1

    .line 647
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 649
    .local v1, "hashArea":[I
    const/4 v3, 0x1

    iget v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v3, v4

    .line 650
    .local v3, "bucketSize":I
    add-int v4, v0, v3

    .local v4, "end":I
    :goto_0
    const/4 v5, 0x0

    if-ge v0, v4, :cond_2

    .line 651
    add-int/lit8 v6, v0, 0x3

    aget v6, v1, v6

    .line 652
    .local v6, "len":I
    aget v7, v1, v0

    if-ne p2, v7, :cond_0

    add-int/lit8 v7, v0, 0x1

    aget v7, v1, v7

    if-ne p3, v7, :cond_0

    if-ne v2, v6, :cond_0

    .line 653
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v0, 0x2

    aget-object v2, v2, v5

    return-object v2

    .line 655
    :cond_0
    if-nez v6, :cond_1

    .line 656
    return-object v5

    .line 650
    .end local v6    # "len":I
    :cond_1
    add-int/lit8 v0, v0, 0x4

    goto :goto_0

    .line 659
    .end local v4    # "end":I
    :cond_2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v0

    :goto_1
    iget v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-ge v0, v4, :cond_4

    .line 660
    aget v4, v1, v0

    if-ne p2, v4, :cond_3

    add-int/lit8 v4, v0, 0x1

    aget v4, v1, v4

    if-ne p3, v4, :cond_3

    add-int/lit8 v4, v0, 0x3

    aget v4, v1, v4

    if-ne v2, v4, :cond_3

    .line 661
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v0, 0x2

    aget-object v2, v2, v4

    return-object v2

    .line 659
    :cond_3
    add-int/lit8 v0, v0, 0x4

    goto :goto_1

    .line 664
    :cond_4
    return-object v5
.end method

.method private _findSecondary(IIII)Ljava/lang/String;
    .locals 8
    .param p1, "origOffset"    # I
    .param p2, "q1"    # I
    .param p3, "q2"    # I
    .param p4, "q3"    # I

    .line 669
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v1, v1, 0x2

    shr-int v1, p1, v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 670
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 672
    .local v1, "hashArea":[I
    const/4 v2, 0x1

    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v2, v3

    .line 673
    .local v2, "bucketSize":I
    add-int v3, v0, v2

    .local v3, "end":I
    :goto_0
    const/4 v4, 0x0

    const/4 v5, 0x3

    if-ge v0, v3, :cond_2

    .line 674
    add-int/lit8 v6, v0, 0x3

    aget v6, v1, v6

    .line 675
    .local v6, "len":I
    aget v7, v1, v0

    if-ne p2, v7, :cond_0

    add-int/lit8 v7, v0, 0x1

    aget v7, v1, v7

    if-ne p3, v7, :cond_0

    add-int/lit8 v7, v0, 0x2

    aget v7, v1, v7

    if-ne p4, v7, :cond_0

    if-ne v5, v6, :cond_0

    .line 676
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v0, 0x2

    aget-object v4, v4, v5

    return-object v4

    .line 678
    :cond_0
    if-nez v6, :cond_1

    .line 679
    return-object v4

    .line 673
    .end local v6    # "len":I
    :cond_1
    add-int/lit8 v0, v0, 0x4

    goto :goto_0

    .line 682
    .end local v3    # "end":I
    :cond_2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v0

    :goto_1
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-ge v0, v3, :cond_4

    .line 683
    aget v3, v1, v0

    if-ne p2, v3, :cond_3

    add-int/lit8 v3, v0, 0x1

    aget v3, v1, v3

    if-ne p3, v3, :cond_3

    add-int/lit8 v3, v0, 0x2

    aget v3, v1, v3

    if-ne p4, v3, :cond_3

    add-int/lit8 v3, v0, 0x3

    aget v3, v1, v3

    if-ne v5, v3, :cond_3

    .line 685
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v0, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 682
    :cond_3
    add-int/lit8 v0, v0, 0x4

    goto :goto_1

    .line 688
    :cond_4
    return-object v4
.end method

.method private _findSecondary(II[II)Ljava/lang/String;
    .locals 7
    .param p1, "origOffset"    # I
    .param p2, "hash"    # I
    .param p3, "q"    # [I
    .param p4, "qlen"    # I

    .line 693
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v1, v1, 0x2

    shr-int v1, p1, v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 694
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 696
    .local v1, "hashArea":[I
    const/4 v2, 0x1

    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v2, v3

    .line 697
    .local v2, "bucketSize":I
    add-int v3, v0, v2

    .local v3, "end":I
    :goto_0
    const/4 v4, 0x0

    if-ge v0, v3, :cond_2

    .line 698
    add-int/lit8 v5, v0, 0x3

    aget v5, v1, v5

    .line 699
    .local v5, "len":I
    aget v6, v1, v0

    if-ne p2, v6, :cond_0

    if-ne p4, v5, :cond_0

    .line 700
    add-int/lit8 v6, v0, 0x1

    aget v6, v1, v6

    invoke-direct {p0, p3, p4, v6}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName([III)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 701
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v0, 0x2

    aget-object v4, v4, v6

    return-object v4

    .line 704
    :cond_0
    if-nez v5, :cond_1

    .line 705
    return-object v4

    .line 697
    .end local v5    # "len":I
    :cond_1
    add-int/lit8 v0, v0, 0x4

    goto :goto_0

    .line 708
    .end local v3    # "end":I
    :cond_2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v0

    :goto_1
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-ge v0, v3, :cond_4

    .line 709
    aget v3, v1, v0

    if-ne p2, v3, :cond_3

    add-int/lit8 v3, v0, 0x3

    aget v3, v1, v3

    if-ne p4, v3, :cond_3

    .line 710
    add-int/lit8 v3, v0, 0x1

    aget v3, v1, v3

    invoke-direct {p0, p3, p4, v3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName([III)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 711
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v0, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 708
    :cond_3
    add-int/lit8 v0, v0, 0x4

    goto :goto_1

    .line 715
    :cond_4
    return-object v4
.end method

.method private final _spilloverStart()I
    .locals 2

    .line 1172
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    .line 1173
    .local v0, "offset":I
    shl-int/lit8 v1, v0, 0x3

    sub-int/2addr v1, v0

    return v1
.end method

.method private _verifyLongName([III)Z
    .locals 5
    .param p1, "q"    # [I
    .param p2, "qlen"    # I
    .param p3, "spillOffset"    # I

    .line 720
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 722
    .local v0, "hashArea":[I
    const/4 v1, 0x0

    .line 724
    .local v1, "ix":I
    const/4 v2, 0x0

    packed-switch p2, :pswitch_data_0

    .line 726
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName2([III)Z

    move-result v2

    return v2

    .line 728
    :pswitch_0
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ix":I
    .local v3, "ix":I
    aget v1, p1, v1

    add-int/lit8 v4, p3, 0x1

    .end local p3    # "spillOffset":I
    .local v4, "spillOffset":I
    aget p3, v0, p3

    if-eq v1, p3, :cond_0

    return v2

    :cond_0
    move v1, v3

    move p3, v4

    .line 730
    .end local v3    # "ix":I
    .end local v4    # "spillOffset":I
    .restart local v1    # "ix":I
    .restart local p3    # "spillOffset":I
    :pswitch_1
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ix":I
    .restart local v3    # "ix":I
    aget v1, p1, v1

    add-int/lit8 v4, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v4    # "spillOffset":I
    aget p3, v0, p3

    if-eq v1, p3, :cond_1

    return v2

    :cond_1
    move v1, v3

    move p3, v4

    .line 732
    .end local v3    # "ix":I
    .end local v4    # "spillOffset":I
    .restart local v1    # "ix":I
    .restart local p3    # "spillOffset":I
    :pswitch_2
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ix":I
    .restart local v3    # "ix":I
    aget v1, p1, v1

    add-int/lit8 v4, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v4    # "spillOffset":I
    aget p3, v0, p3

    if-eq v1, p3, :cond_2

    return v2

    :cond_2
    move v1, v3

    move p3, v4

    .line 734
    .end local v3    # "ix":I
    .end local v4    # "spillOffset":I
    .restart local v1    # "ix":I
    .restart local p3    # "spillOffset":I
    :pswitch_3
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ix":I
    .restart local v3    # "ix":I
    aget v1, p1, v1

    add-int/lit8 v4, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v4    # "spillOffset":I
    aget p3, v0, p3

    if-eq v1, p3, :cond_3

    return v2

    :cond_3
    move v1, v3

    move p3, v4

    .line 736
    .end local v3    # "ix":I
    .end local v4    # "spillOffset":I
    .restart local v1    # "ix":I
    .restart local p3    # "spillOffset":I
    :pswitch_4
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ix":I
    .restart local v3    # "ix":I
    aget v1, p1, v1

    add-int/lit8 v4, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v4    # "spillOffset":I
    aget p3, v0, p3

    if-eq v1, p3, :cond_4

    return v2

    .line 737
    :cond_4
    add-int/lit8 p3, v3, 0x1

    .end local v3    # "ix":I
    .local p3, "ix":I
    aget v1, p1, v3

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "spillOffset":I
    .local v3, "spillOffset":I
    aget v4, v0, v4

    if-eq v1, v4, :cond_5

    return v2

    .line 738
    :cond_5
    add-int/lit8 v1, p3, 0x1

    .end local p3    # "ix":I
    .restart local v1    # "ix":I
    aget p3, p1, p3

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "spillOffset":I
    .restart local v4    # "spillOffset":I
    aget v3, v0, v3

    if-eq p3, v3, :cond_6

    return v2

    .line 739
    :cond_6
    add-int/lit8 p3, v1, 0x1

    .end local v1    # "ix":I
    .restart local p3    # "ix":I
    aget v1, p1, v1

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "spillOffset":I
    .restart local v3    # "spillOffset":I
    aget v4, v0, v4

    if-eq v1, v4, :cond_7

    return v2

    .line 741
    :cond_7
    const/4 v1, 0x1

    return v1

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private _verifyLongName2([III)Z
    .locals 4
    .param p1, "q"    # [I
    .param p2, "qlen"    # I
    .param p3, "spillOffset"    # I

    .line 746
    const/4 v0, 0x0

    .line 748
    .local v0, "ix":I
    :goto_0
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "ix":I
    .local v1, "ix":I
    aget v0, p1, v0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v3, p3, 0x1

    .end local p3    # "spillOffset":I
    .local v3, "spillOffset":I
    aget p3, v2, p3

    if-eq v0, p3, :cond_0

    .line 749
    const/4 p3, 0x0

    return p3

    .line 751
    :cond_0
    if-lt v1, p2, :cond_1

    .line 752
    const/4 p3, 0x1

    return p3

    .line 751
    :cond_1
    move v0, v1

    move p3, v3

    goto :goto_0
.end method

.method private _verifyNeedForRehash()V
    .locals 9

    .line 860
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    const/4 v2, 0x1

    shr-int/2addr v1, v2

    if-le v0, v1, :cond_1

    .line 861
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v1

    sub-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x2

    .line 862
    .local v0, "spillCount":I
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/2addr v1, v2

    shr-int/lit8 v1, v1, 0x7

    if-gt v0, v1, :cond_0

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    int-to-double v3, v1

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    int-to-double v5, v1

    const-wide v7, 0x3fe999999999999aL    # 0.8

    mul-double/2addr v5, v7

    cmpl-double v1, v3, v5

    if-lez v1, :cond_1

    .line 864
    :cond_0
    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    .line 867
    .end local v0    # "spillCount":I
    :cond_1
    return-void
.end method

.method private _verifySharing()V
    .locals 2

    .line 871
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    if-eqz v0, :cond_0

    .line 872
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 873
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    .line 874
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    .line 877
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 879
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    if-eqz v0, :cond_1

    .line 880
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->rehash()V

    .line 882
    :cond_1
    return-void
.end method

.method static synthetic access$000(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)I
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 17
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    return v0
.end method

.method static synthetic access$100(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)I
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 17
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    return v0
.end method

.method static synthetic access$200(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)I
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 17
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    return v0
.end method

.method static synthetic access$300(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)[I
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 17
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    return-object v0
.end method

.method static synthetic access$400(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 17
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)I
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 17
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    return v0
.end method

.method static synthetic access$600(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)I
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 17
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    return v0
.end method

.method public static createRoot()Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .locals 5

    .line 287
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 289
    .local v0, "now":J
    long-to-int v2, v0

    const/16 v3, 0x20

    ushr-long v3, v0, v3

    long-to-int v3, v3

    add-int/2addr v2, v3

    or-int/lit8 v2, v2, 0x1

    .line 290
    .local v2, "seed":I
    invoke-static {v2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->createRoot(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    move-result-object v3

    return-object v3
.end method

.method protected static createRoot(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .locals 3
    .param p0, "seed"    # I

    .line 296
    new-instance v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    const/16 v1, 0x40

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, p0, v2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;-><init>(IZIZ)V

    return-object v0
.end method

.method private mergeChild(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;)V
    .locals 3
    .param p1, "childState"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    .line 330
    iget v0, p1, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->count:I

    .line 331
    .local v0, "childCount":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    .line 335
    .local v1, "currState":Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;
    iget v2, v1, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->count:I

    if-ne v0, v2, :cond_0

    .line 336
    return-void

    .line 343
    :cond_0
    const/16 v2, 0x1770

    if-le v0, v2, :cond_1

    .line 345
    const/16 v2, 0x40

    invoke-static {v2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->createInitial(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    move-result-object p1

    .line 347
    :cond_1
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2, v1, p1}, Landroidx/camera/view/PreviewView$1$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 348
    return-void
.end method

.method private nukeSymbols(Z)V
    .locals 2
    .param p1, "fill"    # Z

    .line 1149
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 1151
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v1

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 1153
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shl-int/lit8 v1, v1, 0x3

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    .line 1154
    if-eqz p1, :cond_0

    .line 1155
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    invoke-static {v1, v0}, Ljava/util/Arrays;->fill([II)V

    .line 1156
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1158
    :cond_0
    return-void
.end method

.method private rehash()V
    .locals 17

    .line 1064
    move-object/from16 v0, p0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    .line 1066
    iput-boolean v1, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    .line 1070
    iget-object v2, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 1071
    .local v2, "oldHashArea":[I
    iget-object v3, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    .line 1072
    .local v3, "oldNames":[Ljava/lang/String;
    iget v4, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    .line 1073
    .local v4, "oldSize":I
    iget v5, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 1074
    .local v5, "oldCount":I
    add-int v6, v4, v4

    .line 1075
    .local v6, "newSize":I
    iget v7, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 1080
    .local v7, "oldEnd":I
    const/high16 v8, 0x10000

    const/4 v9, 0x1

    if-le v6, v8, :cond_0

    .line 1081
    invoke-direct {v0, v9}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->nukeSymbols(Z)V

    .line 1082
    return-void

    .line 1085
    :cond_0
    array-length v8, v2

    shl-int/lit8 v10, v4, 0x3

    add-int/2addr v8, v10

    new-array v8, v8, [I

    iput-object v8, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 1086
    iput v6, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    .line 1087
    shl-int/lit8 v8, v6, 0x2

    iput v8, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    .line 1088
    iget v8, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    iget v10, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/2addr v10, v9

    add-int/2addr v8, v10

    iput v8, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    .line 1089
    invoke-static {v6}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcTertiaryShift(I)I

    move-result v8

    iput v8, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    .line 1092
    array-length v8, v3

    shl-int/2addr v8, v9

    new-array v8, v8, [Ljava/lang/String;

    iput-object v8, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    .line 1093
    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->nukeSymbols(Z)V

    .line 1100
    const/4 v8, 0x0

    .line 1101
    .local v8, "copyCount":I
    const/16 v10, 0x10

    new-array v10, v10, [I

    .line 1102
    .local v10, "q":[I
    const/4 v11, 0x0

    .local v11, "offset":I
    move v12, v7

    .local v12, "end":I
    :goto_0
    if-ge v11, v12, :cond_3

    .line 1103
    add-int/lit8 v13, v11, 0x3

    aget v13, v2, v13

    .line 1104
    .local v13, "len":I
    if-nez v13, :cond_1

    .line 1105
    goto :goto_2

    .line 1107
    :cond_1
    add-int/lit8 v8, v8, 0x1

    .line 1108
    shr-int/lit8 v14, v11, 0x2

    aget-object v14, v3, v14

    .line 1109
    .local v14, "name":Ljava/lang/String;
    const/4 v15, 0x2

    packed-switch v13, :pswitch_data_0

    .line 1126
    array-length v15, v10

    if-le v13, v15, :cond_2

    .line 1127
    new-array v10, v13, [I

    goto :goto_1

    .line 1120
    :pswitch_0
    aget v16, v2, v11

    aput v16, v10, v1

    .line 1121
    add-int/lit8 v16, v11, 0x1

    aget v16, v2, v16

    aput v16, v10, v9

    .line 1122
    add-int/lit8 v16, v11, 0x2

    aget v16, v2, v16

    aput v16, v10, v15

    .line 1123
    const/4 v15, 0x3

    invoke-virtual {v0, v14, v10, v15}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    .line 1124
    goto :goto_2

    .line 1115
    :pswitch_1
    aget v16, v2, v11

    aput v16, v10, v1

    .line 1116
    add-int/lit8 v16, v11, 0x1

    aget v16, v2, v16

    aput v16, v10, v9

    .line 1117
    invoke-virtual {v0, v14, v10, v15}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    .line 1118
    goto :goto_2

    .line 1111
    :pswitch_2
    aget v15, v2, v11

    aput v15, v10, v1

    .line 1112
    invoke-virtual {v0, v14, v10, v9}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    .line 1113
    goto :goto_2

    .line 1130
    :cond_2
    :goto_1
    add-int/lit8 v15, v11, 0x1

    aget v15, v2, v15

    .line 1131
    .local v15, "qoff":I
    invoke-static {v2, v15, v10, v1, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1132
    invoke-virtual {v0, v14, v10, v13}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    .line 1102
    .end local v13    # "len":I
    .end local v14    # "name":Ljava/lang/String;
    .end local v15    # "qoff":I
    :goto_2
    add-int/lit8 v11, v11, 0x4

    goto :goto_0

    .line 1139
    .end local v11    # "offset":I
    .end local v12    # "end":I
    :cond_3
    if-ne v8, v5, :cond_4

    .line 1142
    return-void

    .line 1140
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed rehash(): old count="

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ", copyCount="

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected _reportTooManyCollisions()V
    .locals 3

    .line 1179
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    const/16 v1, 0x400

    if-gt v0, v1, :cond_0

    .line 1180
    return-void

    .line 1182
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Spill-over slots in symbol table with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " entries, hash area of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " slots is now full (all "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shr-int/lit8 v2, v2, 0x3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " slots -- suspect a DoS attack based on hash collisions."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " You can disable the check via `JsonFactory.Feature.FAIL_ON_SYMBOL_HASH_OVERFLOW`"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addName(Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "q1"    # I

    .line 762
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifySharing()V

    .line 763
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    if-eqz v0, :cond_0

    .line 764
    sget-object v0, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 766
    :cond_0
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v0

    .line 767
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aput p2, v1, v0

    .line 768
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, v0, 0x3

    const/4 v3, 0x1

    aput v3, v1, v2

    .line 769
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v2, v0, 0x2

    aput-object p1, v1, v2

    .line 770
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/2addr v1, v3

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 771
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 772
    return-object p1
.end method

.method public addName(Ljava/lang/String;II)Ljava/lang/String;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "q1"    # I
    .param p3, "q2"    # I

    .line 776
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifySharing()V

    .line 777
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    if-eqz v0, :cond_0

    .line 778
    sget-object v0, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 780
    :cond_0
    if-nez p3, :cond_1

    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(I)I

    move-result v0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(II)I

    move-result v0

    .line 781
    .local v0, "hash":I
    :goto_0
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v1

    .line 782
    .local v1, "offset":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aput p2, v2, v1

    .line 783
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v3, v1, 0x1

    aput p3, v2, v3

    .line 784
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v3, v1, 0x3

    const/4 v4, 0x2

    aput v4, v2, v3

    .line 785
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v3, v1, 0x2

    aput-object p1, v2, v3

    .line 786
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 787
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 788
    return-object p1
.end method

.method public addName(Ljava/lang/String;III)Ljava/lang/String;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "q1"    # I
    .param p3, "q2"    # I
    .param p4, "q3"    # I

    .line 792
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifySharing()V

    .line 793
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    if-eqz v0, :cond_0

    .line 794
    sget-object v0, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 796
    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(III)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v0

    .line 797
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aput p2, v1, v0

    .line 798
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, v0, 0x1

    aput p3, v1, v2

    .line 799
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, v0, 0x2

    aput p4, v1, v2

    .line 800
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, v0, 0x3

    const/4 v3, 0x3

    aput v3, v1, v2

    .line 801
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v2, v0, 0x2

    aput-object p1, v1, v2

    .line 802
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 803
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 804
    return-object p1
.end method

.method public addName(Ljava/lang/String;[II)Ljava/lang/String;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "q"    # [I
    .param p3, "qlen"    # I

    .line 809
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifySharing()V

    .line 810
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    if-eqz v0, :cond_0

    .line 811
    sget-object v0, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 815
    :cond_0
    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch p3, :pswitch_data_0

    .line 841
    .local v3, "offset":I
    invoke-virtual {p0, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash([II)I

    move-result v0

    .line 842
    .local v0, "hash":I
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v3

    .line 844
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aput v0, v1, v3

    .line 845
    invoke-direct {p0, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_appendLongName([II)I

    move-result v1

    .line 846
    .local v1, "longStart":I
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v5, v3, 0x1

    aput v1, v4, v5

    .line 847
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v5, v3, 0x3

    aput p3, v4, v5

    goto :goto_0

    .line 833
    .end local v0    # "hash":I
    .end local v1    # "longStart":I
    :pswitch_0
    aget v4, p2, v1

    aget v5, p2, v2

    aget v6, p2, v0

    invoke-virtual {p0, v4, v5, v6}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(III)I

    move-result v4

    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v3

    .line 834
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v1, p2, v1

    aput v1, v4, v3

    .line 835
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v3, 0x1

    aget v5, p2, v2

    aput v5, v1, v4

    .line 836
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v3, 0x2

    aget v0, p2, v0

    aput v0, v1, v4

    .line 837
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v1, v3, 0x3

    const/4 v4, 0x3

    aput v4, v0, v1

    .line 839
    goto :goto_0

    .line 825
    :pswitch_1
    aget v4, p2, v1

    aget v5, p2, v2

    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(II)I

    move-result v4

    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v3

    .line 826
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v1, p2, v1

    aput v1, v4, v3

    .line 827
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v3, 0x1

    aget v5, p2, v2

    aput v5, v1, v4

    .line 828
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v3, 0x3

    aput v0, v1, v4

    .line 830
    goto :goto_0

    .line 818
    .end local v3    # "offset":I
    :pswitch_2
    aget v0, p2, v1

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v3

    .line 819
    .restart local v3    # "offset":I
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v1, p2, v1

    aput v1, v0, v3

    .line 820
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v1, v3, 0x3

    aput v2, v0, v1

    .line 822
    nop

    .line 850
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v1, v3, 0x2

    aput-object p1, v0, v1

    .line 853
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 854
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 855
    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bucketCount()I
    .locals 1

    .line 368
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    return v0
.end method

.method public calcHash(I)I
    .locals 2
    .param p1, "q1"    # I

    .line 978
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    xor-int/2addr v0, p1

    .line 984
    .local v0, "hash":I
    ushr-int/lit8 v1, v0, 0x10

    add-int/2addr v0, v1

    .line 985
    shl-int/lit8 v1, v0, 0x3

    xor-int/2addr v0, v1

    .line 986
    ushr-int/lit8 v1, v0, 0xc

    add-int/2addr v0, v1

    .line 987
    return v0
.end method

.method public calcHash(II)I
    .locals 2
    .param p1, "q1"    # I
    .param p2, "q2"    # I

    .line 994
    move v0, p1

    .line 996
    .local v0, "hash":I
    ushr-int/lit8 v1, v0, 0xf

    add-int/2addr v0, v1

    .line 997
    ushr-int/lit8 v1, v0, 0x9

    xor-int/2addr v0, v1

    .line 998
    mul-int/lit8 v1, p2, 0x21

    add-int/2addr v0, v1

    .line 999
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    xor-int/2addr v0, v1

    .line 1000
    ushr-int/lit8 v1, v0, 0x10

    add-int/2addr v0, v1

    .line 1001
    ushr-int/lit8 v1, v0, 0x4

    xor-int/2addr v0, v1

    .line 1002
    shl-int/lit8 v1, v0, 0x3

    add-int/2addr v0, v1

    .line 1004
    return v0
.end method

.method public calcHash(III)I
    .locals 2
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I

    .line 1009
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    xor-int/2addr v0, p1

    .line 1010
    .local v0, "hash":I
    ushr-int/lit8 v1, v0, 0x9

    add-int/2addr v0, v1

    .line 1011
    mul-int/lit8 v0, v0, 0x1f

    .line 1012
    add-int/2addr v0, p2

    .line 1013
    mul-int/lit8 v0, v0, 0x21

    .line 1014
    ushr-int/lit8 v1, v0, 0xf

    add-int/2addr v0, v1

    .line 1015
    xor-int/2addr v0, p3

    .line 1017
    ushr-int/lit8 v1, v0, 0x4

    add-int/2addr v0, v1

    .line 1019
    ushr-int/lit8 v1, v0, 0xf

    add-int/2addr v0, v1

    .line 1020
    shl-int/lit8 v1, v0, 0x9

    xor-int/2addr v0, v1

    .line 1022
    return v0
.end method

.method public calcHash([II)I
    .locals 4
    .param p1, "q"    # [I
    .param p2, "qlen"    # I

    .line 1027
    const/4 v0, 0x4

    if-lt p2, v0, :cond_1

    .line 1035
    const/4 v0, 0x0

    aget v0, p1, v0

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    xor-int/2addr v0, v1

    .line 1036
    .local v0, "hash":I
    ushr-int/lit8 v1, v0, 0x9

    add-int/2addr v0, v1

    .line 1037
    const/4 v1, 0x1

    aget v1, p1, v1

    add-int/2addr v0, v1

    .line 1038
    ushr-int/lit8 v1, v0, 0xf

    add-int/2addr v0, v1

    .line 1039
    mul-int/lit8 v0, v0, 0x21

    .line 1040
    const/4 v1, 0x2

    aget v1, p1, v1

    xor-int/2addr v0, v1

    .line 1041
    ushr-int/lit8 v1, v0, 0x4

    add-int/2addr v0, v1

    .line 1043
    const/4 v1, 0x3

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_0

    .line 1044
    aget v2, p1, v1

    .line 1045
    .local v2, "next":I
    shr-int/lit8 v3, v2, 0x15

    xor-int/2addr v2, v3

    .line 1046
    add-int/2addr v0, v2

    .line 1043
    .end local v2    # "next":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1048
    .end local v1    # "i":I
    :cond_0
    const v1, 0x1003f

    mul-int/2addr v0, v1

    .line 1051
    ushr-int/lit8 v1, v0, 0x13

    add-int/2addr v0, v1

    .line 1052
    shl-int/lit8 v1, v0, 0x5

    xor-int/2addr v0, v1

    .line 1053
    return v0

    .line 1028
    .end local v0    # "hash":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public findName(I)Ljava/lang/String;
    .locals 7
    .param p1, "q1"    # I

    .line 465
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v0

    .line 467
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 469
    .local v1, "hashArea":[I
    add-int/lit8 v2, v0, 0x3

    aget v2, v1, v2

    .line 471
    .local v2, "len":I
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, v4, :cond_0

    .line 472
    aget v5, v1, v0

    if-ne v5, p1, :cond_1

    .line 473
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v0, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 475
    :cond_0
    if-nez v2, :cond_1

    .line 476
    return-object v3

    .line 479
    :cond_1
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v6, v0, 0x3

    shl-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    .line 481
    .local v5, "offset2":I
    add-int/lit8 v6, v5, 0x3

    aget v2, v1, v6

    .line 483
    if-ne v2, v4, :cond_2

    .line 484
    aget v3, v1, v5

    if-ne v3, p1, :cond_3

    .line 485
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v5, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 487
    :cond_2
    if-nez v2, :cond_3

    .line 488
    return-object v3

    .line 492
    :cond_3
    invoke-direct {p0, v0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findSecondary(II)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public findName(II)Ljava/lang/String;
    .locals 7
    .param p1, "q1"    # I
    .param p2, "q2"    # I

    .line 497
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(II)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v0

    .line 499
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 501
    .local v1, "hashArea":[I
    add-int/lit8 v2, v0, 0x3

    aget v2, v1, v2

    .line 503
    .local v2, "len":I
    const/4 v3, 0x0

    const/4 v4, 0x2

    if-ne v2, v4, :cond_0

    .line 504
    aget v5, v1, v0

    if-ne p1, v5, :cond_1

    add-int/lit8 v5, v0, 0x1

    aget v5, v1, v5

    if-ne p2, v5, :cond_1

    .line 505
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v0, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 507
    :cond_0
    if-nez v2, :cond_1

    .line 508
    return-object v3

    .line 511
    :cond_1
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v6, v0, 0x3

    shl-int/2addr v6, v4

    add-int/2addr v5, v6

    .line 513
    .local v5, "offset2":I
    add-int/lit8 v6, v5, 0x3

    aget v2, v1, v6

    .line 515
    if-ne v2, v4, :cond_2

    .line 516
    aget v3, v1, v5

    if-ne p1, v3, :cond_3

    add-int/lit8 v3, v5, 0x1

    aget v3, v1, v3

    if-ne p2, v3, :cond_3

    .line 517
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v5, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 519
    :cond_2
    if-nez v2, :cond_3

    .line 520
    return-object v3

    .line 522
    :cond_3
    invoke-direct {p0, v0, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findSecondary(III)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public findName(III)Ljava/lang/String;
    .locals 7
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I

    .line 527
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(III)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v0

    .line 528
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 529
    .local v1, "hashArea":[I
    add-int/lit8 v2, v0, 0x3

    aget v2, v1, v2

    .line 531
    .local v2, "len":I
    const/4 v3, 0x0

    const/4 v4, 0x3

    if-ne v2, v4, :cond_0

    .line 532
    aget v5, v1, v0

    if-ne p1, v5, :cond_1

    add-int/lit8 v5, v0, 0x1

    aget v5, v1, v5

    if-ne v5, p2, :cond_1

    add-int/lit8 v5, v0, 0x2

    aget v5, v1, v5

    if-ne v5, p3, :cond_1

    .line 533
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v0, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 535
    :cond_0
    if-nez v2, :cond_1

    .line 536
    return-object v3

    .line 539
    :cond_1
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v6, v0, 0x3

    shl-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    .line 541
    .local v5, "offset2":I
    add-int/lit8 v6, v5, 0x3

    aget v2, v1, v6

    .line 543
    if-ne v2, v4, :cond_2

    .line 544
    aget v3, v1, v5

    if-ne p1, v3, :cond_3

    add-int/lit8 v3, v5, 0x1

    aget v3, v1, v3

    if-ne v3, p2, :cond_3

    add-int/lit8 v3, v5, 0x2

    aget v3, v1, v3

    if-ne v3, p3, :cond_3

    .line 545
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v5, 0x2

    aget-object v3, v3, v4

    return-object v3

    .line 547
    :cond_2
    if-nez v2, :cond_3

    .line 548
    return-object v3

    .line 550
    :cond_3
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findSecondary(IIII)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public findName([II)Ljava/lang/String;
    .locals 8
    .param p1, "q"    # [I
    .param p2, "qlen"    # I

    .line 559
    const/4 v0, 0x4

    const/4 v1, 0x2

    if-ge p2, v0, :cond_0

    .line 560
    const/4 v0, 0x0

    const/4 v2, 0x1

    packed-switch p2, :pswitch_data_0

    .line 568
    const-string v0, ""

    return-object v0

    .line 562
    :pswitch_0
    aget v0, p1, v0

    aget v2, p1, v2

    aget v1, p1, v1

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(III)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 564
    :pswitch_1
    aget v0, p1, v0

    aget v1, p1, v2

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 566
    :pswitch_2
    aget v0, p1, v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 571
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash([II)I

    move-result v0

    .line 572
    .local v0, "hash":I
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v2

    .line 574
    .local v2, "offset":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 576
    .local v3, "hashArea":[I
    add-int/lit8 v4, v2, 0x3

    aget v4, v3, v4

    .line 578
    .local v4, "len":I
    aget v5, v3, v2

    if-ne v0, v5, :cond_1

    if-ne v4, p2, :cond_1

    .line 580
    add-int/lit8 v5, v2, 0x1

    aget v5, v3, v5

    invoke-direct {p0, p1, p2, v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName([III)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 581
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v2, 0x2

    aget-object v1, v1, v5

    return-object v1

    .line 584
    :cond_1
    if-nez v4, :cond_2

    .line 585
    const/4 v1, 0x0

    return-object v1

    .line 588
    :cond_2
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v6, v2, 0x3

    shl-int/lit8 v1, v6, 0x2

    add-int/2addr v5, v1

    .line 590
    .local v5, "offset2":I
    add-int/lit8 v1, v5, 0x3

    aget v1, v3, v1

    .line 591
    .local v1, "len2":I
    aget v6, v3, v5

    if-ne v0, v6, :cond_3

    if-ne v1, p2, :cond_3

    .line 592
    add-int/lit8 v6, v5, 0x1

    aget v6, v3, v6

    invoke-direct {p0, p1, p2, v6}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName([III)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 593
    iget-object v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v7, v5, 0x2

    aget-object v6, v6, v7

    return-object v6

    .line 596
    :cond_3
    invoke-direct {p0, v2, v0, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findSecondary(II[II)Ljava/lang/String;

    move-result-object v6

    return-object v6

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public hashSeed()I
    .locals 1

    .line 377
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    return v0
.end method

.method public makeChild(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .locals 6
    .param p1, "flags"    # I

    .line 304
    new-instance v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->INTERN_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonFactory$Feature;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->enabledIn(I)Z

    move-result v2

    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->FAIL_ON_SYMBOL_HASH_OVERFLOW:Lcom/fasterxml/jackson/core/JsonFactory$Feature;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->enabledIn(I)Z

    move-result v4

    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;-><init>(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;ZIZLcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;)V

    return-object v0
.end method

.method public maybeDirty()Z
    .locals 1

    .line 375
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public primaryCount()I
    .locals 4

    .line 386
    const/4 v0, 0x0

    .line 387
    .local v0, "count":I
    const/4 v1, 0x3

    .local v1, "offset":I
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    .local v2, "end":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 388
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v3, v3, v1

    if-eqz v3, :cond_0

    .line 389
    add-int/lit8 v0, v0, 0x1

    .line 387
    :cond_0
    add-int/lit8 v1, v1, 0x4

    goto :goto_0

    .line 392
    .end local v1    # "offset":I
    .end local v2    # "end":I
    :cond_1
    return v0
.end method

.method public release()V
    .locals 2

    .line 320
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->maybeDirty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 321
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    new-instance v1, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    invoke-direct {v1, p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;-><init>(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)V

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->mergeChild(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;)V

    .line 324
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    .line 326
    :cond_0
    return-void
.end method

.method public secondaryCount()I
    .locals 4

    .line 400
    const/4 v0, 0x0

    .line 401
    .local v0, "count":I
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    add-int/lit8 v1, v1, 0x3

    .line 402
    .local v1, "offset":I
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    .local v2, "end":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 403
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v3, v3, v1

    if-eqz v3, :cond_0

    .line 404
    add-int/lit8 v0, v0, 0x1

    .line 402
    :cond_0
    add-int/lit8 v1, v1, 0x4

    goto :goto_0

    .line 407
    .end local v2    # "end":I
    :cond_1
    return v0
.end method

.method public size()I
    .locals 1

    .line 358
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    iget v0, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->count:I

    return v0

    .line 362
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    return v0
.end method

.method public spilloverCount()I
    .locals 2

    .line 431
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v1

    sub-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public tertiaryCount()I
    .locals 4

    .line 415
    const/4 v0, 0x0

    .line 416
    .local v0, "count":I
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    add-int/lit8 v1, v1, 0x3

    .line 417
    .local v1, "offset":I
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    add-int/2addr v2, v1

    .local v2, "end":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 418
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v3, v3, v1

    if-eqz v3, :cond_0

    .line 419
    add-int/lit8 v0, v0, 0x1

    .line 417
    :cond_0
    add-int/lit8 v1, v1, 0x4

    goto :goto_0

    .line 422
    .end local v2    # "end":I
    :cond_1
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 17

    .line 447
    move-object/from16 v0, p0

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->primaryCount()I

    move-result v1

    .line 448
    .local v1, "pri":I
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->secondaryCount()I

    move-result v2

    .line 449
    .local v2, "sec":I
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->tertiaryCount()I

    move-result v3

    .line 450
    .local v3, "tert":I
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->spilloverCount()I

    move-result v4

    .line 451
    .local v4, "spill":I
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->totalCount()I

    move-result v5

    .line 452
    .local v5, "total":I
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    iget v7, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget v8, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    add-int v13, v1, v2

    add-int/2addr v13, v3

    add-int/2addr v13, v4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v15, 0x9

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v6, v15, v16

    const/4 v6, 0x1

    aput-object v7, v15, v6

    const/4 v6, 0x2

    aput-object v8, v15, v6

    const/4 v6, 0x3

    aput-object v9, v15, v6

    const/4 v6, 0x4

    aput-object v10, v15, v6

    const/4 v6, 0x5

    aput-object v11, v15, v6

    const/4 v6, 0x6

    aput-object v12, v15, v6

    const/4 v6, 0x7

    aput-object v13, v15, v6

    const/16 v6, 0x8

    aput-object v14, v15, v6

    const-string v6, "[%s: size=%d, hashSize=%d, %d/%d/%d/%d pri/sec/ter/spill (=%s), total:%d]"

    invoke-static {v6, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public totalCount()I
    .locals 4

    .line 436
    const/4 v0, 0x0

    .line 437
    .local v0, "count":I
    const/4 v1, 0x3

    .local v1, "offset":I
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shl-int/lit8 v2, v2, 0x3

    .local v2, "end":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 438
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v3, v3, v1

    if-eqz v3, :cond_0

    .line 439
    add-int/lit8 v0, v0, 0x1

    .line 437
    :cond_0
    add-int/lit8 v1, v1, 0x4

    goto :goto_0

    .line 442
    .end local v1    # "offset":I
    .end local v2    # "end":I
    :cond_1
    return v0
.end method
