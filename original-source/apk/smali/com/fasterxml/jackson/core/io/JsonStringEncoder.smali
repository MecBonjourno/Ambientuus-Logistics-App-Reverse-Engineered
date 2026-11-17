.class public final Lcom/fasterxml/jackson/core/io/JsonStringEncoder;
.super Ljava/lang/Object;
.source "JsonStringEncoder.java"


# static fields
.field private static final HB:[B

.field private static final HC:[C

.field private static final SURR1_FIRST:I = 0xd800

.field private static final SURR1_LAST:I = 0xdbff

.field private static final SURR2_FIRST:I = 0xdc00

.field private static final SURR2_LAST:I = 0xdfff


# instance fields
.field protected _bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

.field protected final _qbuf:[C

.field protected _text:Lcom/fasterxml/jackson/core/util/TextBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexChars()[C

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HC:[C

    .line 22
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexBytes()[B

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HB:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x6

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    .line 58
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    const/4 v1, 0x0

    const/16 v2, 0x5c

    aput-char v2, v0, v1

    .line 59
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    const/4 v1, 0x2

    const/16 v2, 0x30

    aput-char v2, v0, v1

    .line 60
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    const/4 v1, 0x3

    aput-char v2, v0, v1

    .line 61
    return-void
.end method

.method private _appendByte(IILcom/fasterxml/jackson/core/util/ByteArrayBuilder;I)I
    .locals 3
    .param p1, "ch"    # I
    .param p2, "esc"    # I
    .param p3, "bb"    # Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    .param p4, "ptr"    # I

    .line 387
    invoke-virtual {p3, p4}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->setCurrentSegmentLength(I)V

    .line 388
    const/16 v0, 0x5c

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 389
    if-gez p2, :cond_1

    .line 390
    const/16 v0, 0x75

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 391
    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    .line 392
    shr-int/lit8 v0, p1, 0x8

    .line 393
    .local v0, "hi":I
    sget-object v1, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HB:[B

    shr-int/lit8 v2, v0, 0x4

    aget-byte v1, v1, v2

    invoke-virtual {p3, v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 394
    sget-object v1, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HB:[B

    and-int/lit8 v2, v0, 0xf

    aget-byte v1, v1, v2

    invoke-virtual {p3, v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 395
    and-int/lit16 p1, p1, 0xff

    .line 396
    .end local v0    # "hi":I
    goto :goto_0

    .line 397
    :cond_0
    const/16 v0, 0x30

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 398
    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 400
    :goto_0
    sget-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HB:[B

    shr-int/lit8 v1, p1, 0x4

    aget-byte v0, v0, v1

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 401
    sget-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HB:[B

    and-int/lit8 v1, p1, 0xf

    aget-byte v0, v0, v1

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    goto :goto_1

    .line 403
    :cond_1
    int-to-byte v0, p2

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 405
    :goto_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->getCurrentSegmentLength()I

    move-result v0

    return v0
.end method

.method private _appendNamed(I[C)I
    .locals 2
    .param p1, "esc"    # I
    .param p2, "qbuf"    # [C

    .line 381
    const/4 v0, 0x1

    int-to-char v1, p1

    aput-char v1, p2, v0

    .line 382
    const/4 v0, 0x2

    return v0
.end method

.method private _appendNumeric(I[C)I
    .locals 2
    .param p1, "value"    # I
    .param p2, "qbuf"    # [C

    .line 373
    const/4 v0, 0x1

    const/16 v1, 0x75

    aput-char v1, p2, v0

    .line 375
    sget-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HC:[C

    shr-int/lit8 v1, p1, 0x4

    aget-char v0, v0, v1

    const/4 v1, 0x4

    aput-char v0, p2, v1

    .line 376
    sget-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HC:[C

    and-int/lit8 v1, p1, 0xf

    aget-char v0, v0, v1

    const/4 v1, 0x5

    aput-char v0, p2, v1

    .line 377
    const/4 v0, 0x6

    return v0
.end method

.method private static _convert(II)I
    .locals 3
    .param p0, "p1"    # I
    .param p1, "p2"    # I

    .line 410
    const v0, 0xdc00

    if-lt p1, v0, :cond_0

    const v1, 0xdfff

    if-gt p1, v1, :cond_0

    .line 413
    const v1, 0xd800

    sub-int v1, p0, v1

    shl-int/lit8 v1, v1, 0xa

    const/high16 v2, 0x10000

    add-int/2addr v1, v2

    sub-int v0, p1, v0

    add-int/2addr v1, v0

    return v1

    .line 411
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Broken surrogate pair: first char 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", second 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; illegal combination"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static _illegal(I)V
    .locals 2
    .param p0, "c"    # I

    .line 417
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogateDesc(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 71
    invoke-static {}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->getJsonStringEncoder()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public encodeAsUTF8(Ljava/lang/String;)[B
    .locals 9
    .param p1, "text"    # Ljava/lang/String;

    .line 282
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 283
    .local v0, "byteBuilder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    if-nez v0, :cond_0

    .line 285
    new-instance v1, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    move-object v0, v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 287
    :cond_0
    const/4 v1, 0x0

    .line 288
    .local v1, "inputPtr":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 289
    .local v2, "inputEnd":I
    const/4 v3, 0x0

    .line 290
    .local v3, "outputPtr":I
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->resetAndGetFirstSegment()[B

    move-result-object v4

    .line 291
    .local v4, "outputBuffer":[B
    array-length v5, v4

    .line 294
    .local v5, "outputEnd":I
    :goto_0
    if-ge v1, v2, :cond_f

    .line 295
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "inputPtr":I
    .local v6, "inputPtr":I
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 298
    .local v1, "c":I
    :goto_1
    const/16 v7, 0x7f

    if-gt v1, v7, :cond_3

    .line 299
    if-lt v3, v5, :cond_1

    .line 300
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 301
    array-length v5, v4

    .line 302
    const/4 v3, 0x0

    .line 304
    :cond_1
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outputPtr":I
    .local v7, "outputPtr":I
    int-to-byte v8, v1

    aput-byte v8, v4, v3

    .line 305
    if-lt v6, v2, :cond_2

    .line 306
    move v1, v6

    move v3, v7

    goto/16 :goto_4

    .line 308
    :cond_2
    add-int/lit8 v3, v6, 0x1

    .end local v6    # "inputPtr":I
    .local v3, "inputPtr":I
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    move v6, v3

    move v3, v7

    goto :goto_1

    .line 312
    .end local v7    # "outputPtr":I
    .local v3, "outputPtr":I
    .restart local v6    # "inputPtr":I
    :cond_3
    if-lt v3, v5, :cond_4

    .line 313
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 314
    array-length v5, v4

    .line 315
    const/4 v3, 0x0

    .line 317
    :cond_4
    const/16 v7, 0x800

    if-ge v1, v7, :cond_5

    .line 318
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outputPtr":I
    .restart local v7    # "outputPtr":I
    shr-int/lit8 v8, v1, 0x6

    or-int/lit16 v8, v8, 0xc0

    int-to-byte v8, v8

    aput-byte v8, v4, v3

    move v3, v1

    move v1, v6

    goto/16 :goto_3

    .line 321
    .end local v7    # "outputPtr":I
    .restart local v3    # "outputPtr":I
    :cond_5
    const v7, 0xd800

    if-lt v1, v7, :cond_c

    const v7, 0xdfff

    if-le v1, v7, :cond_6

    goto :goto_2

    .line 330
    :cond_6
    const v7, 0xdbff

    if-le v1, v7, :cond_7

    .line 331
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 334
    :cond_7
    if-lt v6, v2, :cond_8

    .line 335
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 337
    :cond_8
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "inputPtr":I
    .local v7, "inputPtr":I
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v1, v6}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_convert(II)I

    move-result v1

    .line 338
    const v6, 0x10ffff

    if-le v1, v6, :cond_9

    .line 339
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 341
    :cond_9
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "outputPtr":I
    .local v6, "outputPtr":I
    shr-int/lit8 v8, v1, 0x12

    or-int/lit16 v8, v8, 0xf0

    int-to-byte v8, v8

    aput-byte v8, v4, v3

    .line 342
    if-lt v6, v5, :cond_a

    .line 343
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 344
    array-length v5, v4

    .line 345
    const/4 v6, 0x0

    .line 347
    :cond_a
    add-int/lit8 v3, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v3    # "outputPtr":I
    shr-int/lit8 v8, v1, 0xc

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v4, v6

    .line 348
    if-lt v3, v5, :cond_b

    .line 349
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 350
    array-length v5, v4

    .line 351
    const/4 v3, 0x0

    .line 353
    :cond_b
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v8, v1, 0x6

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v4, v3

    move v3, v1

    move v1, v7

    move v7, v6

    goto :goto_3

    .line 322
    .end local v7    # "inputPtr":I
    .restart local v3    # "outputPtr":I
    .local v6, "inputPtr":I
    :cond_c
    :goto_2
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outputPtr":I
    .local v7, "outputPtr":I
    shr-int/lit8 v8, v1, 0xc

    or-int/lit16 v8, v8, 0xe0

    int-to-byte v8, v8

    aput-byte v8, v4, v3

    .line 323
    if-lt v7, v5, :cond_d

    .line 324
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 325
    array-length v5, v4

    .line 326
    const/4 v7, 0x0

    .line 328
    :cond_d
    add-int/lit8 v3, v7, 0x1

    .end local v7    # "outputPtr":I
    .restart local v3    # "outputPtr":I
    shr-int/lit8 v8, v1, 0x6

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v4, v7

    move v7, v3

    move v3, v1

    move v1, v6

    .line 356
    .end local v6    # "inputPtr":I
    .local v1, "inputPtr":I
    .local v3, "c":I
    .restart local v7    # "outputPtr":I
    :goto_3
    if-lt v7, v5, :cond_e

    .line 357
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 358
    array-length v5, v4

    .line 359
    const/4 v7, 0x0

    .line 361
    :cond_e
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "outputPtr":I
    .local v6, "outputPtr":I
    and-int/lit8 v8, v3, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v4, v7

    .line 362
    .end local v3    # "c":I
    move v3, v6

    goto/16 :goto_0

    .line 363
    .end local v6    # "outputPtr":I
    .local v3, "outputPtr":I
    :cond_f
    :goto_4
    iget-object v6, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    invoke-virtual {v6, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->completeAndCoalesce(I)[B

    move-result-object v6

    return-object v6
.end method

.method public quoteAsString(Ljava/lang/CharSequence;Ljava/lang/StringBuilder;)V
    .locals 9
    .param p1, "input"    # Ljava/lang/CharSequence;
    .param p2, "output"    # Ljava/lang/StringBuilder;

    .line 149
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->get7BitOutputEscapes()[I

    move-result-object v0

    .line 150
    .local v0, "escCodes":[I
    array-length v1, v0

    .line 151
    .local v1, "escCodeCount":I
    const/4 v2, 0x0

    .line 152
    .local v2, "inPtr":I
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    .line 155
    .local v3, "inputLen":I
    :goto_0
    if-ge v2, v3, :cond_3

    .line 158
    :goto_1
    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 159
    .local v4, "c":C
    if-ge v4, v1, :cond_1

    aget v5, v0, v4

    if-eqz v5, :cond_1

    .line 160
    nop

    .line 168
    .end local v4    # "c":C
    add-int/lit8 v4, v2, 0x1

    .end local v2    # "inPtr":I
    .local v4, "inPtr":I
    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 169
    .local v2, "d":C
    aget v5, v0, v2

    .line 170
    .local v5, "escCode":I
    iget-object v6, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    if-gez v5, :cond_0

    invoke-direct {p0, v2, v6}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_appendNumeric(I[C)I

    move-result v6

    goto :goto_2

    :cond_0
    invoke-direct {p0, v5, v6}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_appendNamed(I[C)I

    move-result v6

    .line 174
    .local v6, "length":I
    :goto_2
    iget-object v7, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    const/4 v8, 0x0

    invoke-virtual {p2, v7, v8, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 175
    .end local v2    # "d":C
    .end local v5    # "escCode":I
    .end local v6    # "length":I
    move v2, v4

    goto :goto_0

    .line 162
    .local v2, "inPtr":I
    .local v4, "c":C
    :cond_1
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 163
    add-int/lit8 v2, v2, 0x1

    if-lt v2, v3, :cond_2

    .line 164
    goto :goto_3

    .line 166
    .end local v4    # "c":C
    :cond_2
    goto :goto_1

    .line 176
    :cond_3
    :goto_3
    return-void
.end method

.method public quoteAsString(Ljava/lang/String;)[C
    .locals 14
    .param p1, "input"    # Ljava/lang/String;

    .line 86
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_text:Lcom/fasterxml/jackson/core/util/TextBuffer;

    .line 87
    .local v0, "textBuffer":Lcom/fasterxml/jackson/core/util/TextBuffer;
    if-nez v0, :cond_0

    .line 89
    new-instance v1, Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    move-object v0, v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_text:Lcom/fasterxml/jackson/core/util/TextBuffer;

    .line 91
    :cond_0
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 92
    .local v1, "outputBuffer":[C
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->get7BitOutputEscapes()[I

    move-result-object v2

    .line 93
    .local v2, "escCodes":[I
    array-length v3, v2

    .line 94
    .local v3, "escCodeCount":I
    const/4 v4, 0x0

    .line 95
    .local v4, "inPtr":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 96
    .local v5, "inputLen":I
    const/4 v6, 0x0

    .line 99
    .local v6, "outPtr":I
    :goto_0
    if-ge v4, v5, :cond_7

    .line 102
    :goto_1
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 103
    .local v7, "c":C
    if-ge v7, v3, :cond_4

    aget v8, v2, v7

    if-eqz v8, :cond_4

    .line 104
    nop

    .line 116
    .end local v7    # "c":C
    add-int/lit8 v7, v4, 0x1

    .end local v4    # "inPtr":I
    .local v7, "inPtr":I
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 117
    .local v4, "d":C
    aget v8, v2, v4

    .line 118
    .local v8, "escCode":I
    iget-object v9, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    if-gez v8, :cond_1

    invoke-direct {p0, v4, v9}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_appendNumeric(I[C)I

    move-result v9

    goto :goto_2

    :cond_1
    invoke-direct {p0, v8, v9}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_appendNamed(I[C)I

    move-result v9

    .line 122
    .local v9, "length":I
    :goto_2
    add-int v10, v6, v9

    array-length v11, v1

    const/4 v12, 0x0

    if-le v10, v11, :cond_3

    .line 123
    array-length v10, v1

    sub-int/2addr v10, v6

    .line 124
    .local v10, "first":I
    if-lez v10, :cond_2

    .line 125
    iget-object v11, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    invoke-static {v11, v12, v1, v6, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    :cond_2
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v1

    .line 128
    sub-int v11, v9, v10

    .line 129
    .local v11, "second":I
    iget-object v13, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    invoke-static {v13, v10, v1, v12, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    nop

    .line 131
    .end local v6    # "outPtr":I
    .end local v10    # "first":I
    .local v11, "outPtr":I
    move v6, v11

    goto :goto_3

    .line 132
    .end local v11    # "outPtr":I
    .restart local v6    # "outPtr":I
    :cond_3
    iget-object v10, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    invoke-static {v10, v12, v1, v6, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 133
    add-int/2addr v6, v9

    .line 135
    .end local v4    # "d":C
    .end local v8    # "escCode":I
    .end local v9    # "length":I
    :goto_3
    move v4, v7

    goto :goto_0

    .line 106
    .local v4, "inPtr":I
    .local v7, "c":C
    :cond_4
    array-length v8, v1

    if-lt v6, v8, :cond_5

    .line 107
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v1

    .line 108
    const/4 v6, 0x0

    .line 110
    :cond_5
    add-int/lit8 v8, v6, 0x1

    .end local v6    # "outPtr":I
    .local v8, "outPtr":I
    aput-char v7, v1, v6

    .line 111
    add-int/lit8 v4, v4, 0x1

    if-lt v4, v5, :cond_6

    .line 112
    move v6, v8

    goto :goto_4

    .line 114
    .end local v7    # "c":C
    :cond_6
    move v6, v8

    goto :goto_1

    .line 136
    .end local v8    # "outPtr":I
    .restart local v6    # "outPtr":I
    :cond_7
    :goto_4
    invoke-virtual {v0, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 137
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsArray()[C

    move-result-object v7

    return-object v7
.end method

.method public quoteAsUTF8(Ljava/lang/String;)[B
    .locals 9
    .param p1, "text"    # Ljava/lang/String;

    .line 185
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 186
    .local v0, "bb":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    if-nez v0, :cond_0

    .line 188
    new-instance v1, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    move-object v0, v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 190
    :cond_0
    const/4 v1, 0x0

    .line 191
    .local v1, "inputPtr":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 192
    .local v2, "inputEnd":I
    const/4 v3, 0x0

    .line 193
    .local v3, "outputPtr":I
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->resetAndGetFirstSegment()[B

    move-result-object v4

    .line 196
    .local v4, "outputBuffer":[B
    :goto_0
    if-ge v1, v2, :cond_11

    .line 197
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->get7BitOutputEscapes()[I

    move-result-object v5

    .line 201
    .local v5, "escCodes":[I
    :goto_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 202
    .local v6, "ch":I
    const/16 v7, 0x7f

    if-gt v6, v7, :cond_4

    aget v8, v5, v6

    if-eqz v8, :cond_1

    .line 203
    goto :goto_2

    .line 205
    :cond_1
    array-length v7, v4

    if-lt v3, v7, :cond_2

    .line 206
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 207
    const/4 v3, 0x0

    .line 209
    :cond_2
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outputPtr":I
    .local v7, "outputPtr":I
    int-to-byte v8, v6

    aput-byte v8, v4, v3

    .line 210
    add-int/lit8 v1, v1, 0x1

    if-lt v1, v2, :cond_3

    .line 211
    move v3, v7

    goto/16 :goto_5

    .line 213
    .end local v6    # "ch":I
    :cond_3
    move v3, v7

    goto :goto_1

    .line 214
    .end local v7    # "outputPtr":I
    .restart local v3    # "outputPtr":I
    :cond_4
    :goto_2
    array-length v6, v4

    if-lt v3, v6, :cond_5

    .line 215
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 216
    const/4 v3, 0x0

    .line 219
    :cond_5
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "inputPtr":I
    .local v6, "inputPtr":I
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 220
    .local v1, "ch":I
    if-gt v1, v7, :cond_6

    .line 221
    aget v7, v5, v1

    .line 223
    .local v7, "escape":I
    invoke-direct {p0, v1, v7, v0, v3}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_appendByte(IILcom/fasterxml/jackson/core/util/ByteArrayBuilder;I)I

    move-result v3

    .line 224
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->getCurrentSegment()[B

    move-result-object v4

    .line 225
    move v1, v6

    goto :goto_0

    .line 227
    .end local v7    # "escape":I
    :cond_6
    const/16 v7, 0x7ff

    if-gt v1, v7, :cond_7

    .line 228
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outputPtr":I
    .local v7, "outputPtr":I
    shr-int/lit8 v8, v1, 0x6

    or-int/lit16 v8, v8, 0xc0

    int-to-byte v8, v8

    aput-byte v8, v4, v3

    .line 229
    and-int/lit8 v3, v1, 0x3f

    or-int/lit16 v1, v3, 0x80

    move v3, v1

    move v1, v6

    goto/16 :goto_4

    .line 232
    .end local v7    # "outputPtr":I
    .restart local v3    # "outputPtr":I
    :cond_7
    const v7, 0xd800

    if-lt v1, v7, :cond_e

    const v7, 0xdfff

    if-le v1, v7, :cond_8

    goto :goto_3

    .line 241
    :cond_8
    const v7, 0xdbff

    if-le v1, v7, :cond_9

    .line 242
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 245
    :cond_9
    if-lt v6, v2, :cond_a

    .line 246
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 248
    :cond_a
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "inputPtr":I
    .local v7, "inputPtr":I
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v1, v6}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_convert(II)I

    move-result v1

    .line 249
    const v6, 0x10ffff

    if-le v1, v6, :cond_b

    .line 250
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 252
    :cond_b
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "outputPtr":I
    .local v6, "outputPtr":I
    shr-int/lit8 v8, v1, 0x12

    or-int/lit16 v8, v8, 0xf0

    int-to-byte v8, v8

    aput-byte v8, v4, v3

    .line 253
    array-length v3, v4

    if-lt v6, v3, :cond_c

    .line 254
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 255
    const/4 v6, 0x0

    .line 257
    :cond_c
    add-int/lit8 v3, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v3    # "outputPtr":I
    shr-int/lit8 v8, v1, 0xc

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v4, v6

    .line 258
    array-length v6, v4

    if-lt v3, v6, :cond_d

    .line 259
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 260
    const/4 v3, 0x0

    .line 262
    :cond_d
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v8, v1, 0x6

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v4, v3

    .line 263
    and-int/lit8 v3, v1, 0x3f

    or-int/lit16 v1, v3, 0x80

    move v3, v1

    move v1, v7

    move v7, v6

    goto :goto_4

    .line 233
    .end local v7    # "inputPtr":I
    .restart local v3    # "outputPtr":I
    .local v6, "inputPtr":I
    :cond_e
    :goto_3
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outputPtr":I
    .local v7, "outputPtr":I
    shr-int/lit8 v8, v1, 0xc

    or-int/lit16 v8, v8, 0xe0

    int-to-byte v8, v8

    aput-byte v8, v4, v3

    .line 234
    array-length v3, v4

    if-lt v7, v3, :cond_f

    .line 235
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 236
    const/4 v7, 0x0

    .line 238
    :cond_f
    add-int/lit8 v3, v7, 0x1

    .end local v7    # "outputPtr":I
    .restart local v3    # "outputPtr":I
    shr-int/lit8 v8, v1, 0x6

    and-int/lit8 v8, v8, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v4, v7

    .line 239
    and-int/lit8 v7, v1, 0x3f

    or-int/lit16 v1, v7, 0x80

    move v7, v3

    move v3, v1

    move v1, v6

    .line 266
    .end local v6    # "inputPtr":I
    .local v1, "inputPtr":I
    .local v3, "ch":I
    .restart local v7    # "outputPtr":I
    :goto_4
    array-length v6, v4

    if-lt v7, v6, :cond_10

    .line 267
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    move-result-object v4

    .line 268
    const/4 v7, 0x0

    .line 270
    :cond_10
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "outputPtr":I
    .local v6, "outputPtr":I
    int-to-byte v8, v3

    aput-byte v8, v4, v7

    .line 271
    .end local v3    # "ch":I
    .end local v5    # "escCodes":[I
    move v3, v6

    goto/16 :goto_0

    .line 272
    .end local v6    # "outputPtr":I
    .local v3, "outputPtr":I
    :cond_11
    :goto_5
    iget-object v5, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    invoke-virtual {v5, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->completeAndCoalesce(I)[B

    move-result-object v5

    return-object v5
.end method
